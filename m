Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785253;
	b=akWTvVAaNxM+wlmEZXuz04JI7wAfOv63UtViC8r8oaPRz/dWfVqH3GsBQvAjZbkTHgqE
	 7xLJnxOqb2/wlbEjgusfqKgQ12hpkLS48pXNZUSMHSnwFch0xo5eElX+41fHrSg+orw+x
	 010FNTq7hbcFIsfFbCAO4CADQ3SQPC/RnySP8ZvFOQpnoHgM6IMtd8RxlQozucscZmVDD
	 Ah+KrmAe96bemyajGkha2mbFn2i49CbcijDp1t3M7EilkeLOXeBGzWzZu/ap1e8LraHhR
	 xzT3f1iWmMASTb883d393UMKbS17DoheUhhkr/UJfhRtcgdAMMPBcX+cbCJNONk1E+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OXHww7JRwC5sR22/HTGUO5MsP2p4PTlezupZRsfe/2E=;
	b=S3hyMgm1fc+Muutw2YMJQFLDscFmLHTOsZ5/AFfAzfdR7hUUnIIMCowzXgil4wv3G9AS
	 nu9AtrWHMyvGvbKOmC6muZ+bG1K6r2sVj/DMLa3oBZCCYV/ngO9HjVssAXtOjiq1RdyWy
	 WNKdvk0PjTejqxYc3PKAX8n9ZQ2q6j2Ft7i9VdQrSdh4UrQCTX95BbEOfG+hfi/S7bJDR
	 coo7Nsq61dJb4f2j37uwMKCEpk6aycW9kOUl4VinYIydMwL272vMMZpfy1KcjN6PWHUet
	 USYy+onXvRyYNLh5jXFz+SdrgzmEMjid6Tzc3ZCpnHSXulXRg6j9yIJRMSeBjXraBVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kI+bwye9;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F27606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F27606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kI+bwye9
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso13359855e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792785251; x=1793390051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OXHww7JRwC5sR22/HTGUO5MsP2p4PTlezupZRsfe/2E=;
        b=kI+bwye9oXV5c/UPK9Si+6GyiMnjIXPLtvfyZzQpz+Q939kTlUyL6rL86QL5pmt6oi
         g9m+6TZJjPi2qYdf7LSBRW6UXARhfL2QavUv6VLzn9wHYYxiqBwY8gIaHkYQLfoETy4r
         oQFCFX5kOWGs69DQCo5P71VZ0rYS+Z4ZjPjvSpI/+DYMYfpCVfFUjJNkyB0EvZqRU2m9
         m6twM5210z5v4HpDvUk+gsgw/Y42Rs0lGzjcuMxzNniIkVQVZ+pkQLEEiRXMoaKiDBkl
         yiTYjOO69N+Z209H4JgtxK8W8Cz8M4Vqk+hyhjo3SoQ0dmSiD+XuIkjROsQuhQuPmK7X
         P55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785251; x=1793390051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXHww7JRwC5sR22/HTGUO5MsP2p4PTlezupZRsfe/2E=;
        b=jdrJbXtiI4UQM5nnXtQY5Gsr0QcohSGwWSshW899blzl/IeIQ6+Ay/+DJo/dyfLmPx
         1t0D6y6bLmLp7gJmay4w05jwqrcRO7xES6uMc3drhtAiOwL3g4iuBaQH9GAVJ4rswFoV
         HvvXDHXycPIS0WMWOKlBBAmMzX/7+Y5KPPnEoan2NGsJxB45PKz2KfR0feCWBWlSre31
         1N9qKlVndyCTwAzY1n++L4Q/K9iog+KAsdURAbtPHphXWll1VrhiLRgqbUNyFgk5pjNs
         ah9pPldsdfpcikJKKrt+mp3LqnZTiKJkgYsBKyvFY3c6ML1g21YtAYbyN53dJt2etfYK
         wp0g==
X-Forwarded-Encrypted: i=1; AKwUvByKPIzq+zElxGZNZ6oB3bltKe/457u7cRkbTSYUoCigHKrEieg9vGTJTMBAsgZHP8/RePY7VBiGluvjkX8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLj+qQujhip1yivsBoN1v3RW6nItQxXAih5+UW/dyGoCgqxY2F3
	OT4kwIbFIPK3IxcOGvWtLp2VhV5nA6dHp7Lq/YP+ZWOuRCK74trvuT8=
X-Gm-Gg: AYBFou3fRtbjdqlnUSXKuRGWDlBOnovBGNx6MpBAjWS0AimGIvk/HrpMCec8UO/y30x
	tdaFrAe+b6We3MwgdCHiD1XusDNMte472AVchobZpdAIod9MpXaiaZKAIMa7UkbY8gmR0BN1Muy
	q/mxYxkRFyiv/GtPdLMTYZWdzLH+lFahmRFUpooqvFR3Smy8/+Oeu1U9nk8wsAU2jHNeH2izG2p
	R/hlfQ/gp06pdmlEhJiGja3WXcCpijfmpmpkJiXdr8uqYY9p9yxuyYnVNWKi2IjjOOYlfbcI6Px
	8X1mLWsdhBm8UCQxFoK9DngCJFgMEwjhPvLpMdXmTJn6ntEG6RvhzCdm7XpBtvamysNF8fx4dH1
	zrtR5pk0qkVre6ZLe9iwSlK3PXFnm2BvhmYIRyrBGyCad8C7h9CgPiTcJbBzCWQYVwaP6P955TU
	meqgJ6N/APNVb5cySl5tzNFt7lqhL0b6iOZX/eWObPIFC6ezpj49IR2BA8nXwuTVEe0jNxf9aUf
	Fx2OQxHe9R248GVUpq2ageV
X-Received: by 2002:a05:600c:c170:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4a2190fd130mr29520455e9.35.1792785251101;
        Fri, 23 Oct 2026 12:54:11 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a574088sm3346915e9.9.2026.10.23.12.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:54:09 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	"John W . Linville" <linville@tuxdriver.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH net] nfc: llcp: use timer_shutdown_sync to prevent timer rearm
Date: Fri, 23 Oct 2026 19:54:09 +0000
Message-ID: <20261023195409.3532540-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

local_cleanup() uses timer_delete_sync() on link_timer and
sdreq_timer, followed by cancel_work_sync() on their associated
work items.  However, tx_work unconditionally re-arms link_timer
via mod_timer() when it runs, and sdreq_timeout_work conditionally
re-arms sdreq_timer.  If a work callback executes during
cancel_work_sync and re-arms the timer, the timer fires after
kfree(local), producing a crash via schedule_work on freed memory.

Use timer_shutdown_sync() instead, which prevents subsequent
mod_timer() calls from re-arming the timers.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 net/nfc/llcp_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf817007cf2..a098d72a15ba8 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -173,14 +173,14 @@ static struct nfc_llcp_local *nfc_llcp_local_get(struct nfc_llcp_local *local)
 static void local_cleanup(struct nfc_llcp_local *local)
 {
 	nfc_llcp_socket_release(local, false, ENXIO);
-	timer_delete_sync(&local->link_timer);
+	timer_shutdown_sync(&local->link_timer);
 	skb_queue_purge(&local->tx_queue);
 	cancel_work_sync(&local->tx_work);
 	cancel_work_sync(&local->rx_work);
 	cancel_work_sync(&local->timeout_work);
 	kfree_skb(local->rx_pending);
 	local->rx_pending = NULL;
-	timer_delete_sync(&local->sdreq_timer);
+	timer_shutdown_sync(&local->sdreq_timer);
 	cancel_work_sync(&local->sdreq_timeout_work);
 	nfc_llcp_free_sdp_tlv_list(&local->pending_sdreqs);
 }
-- 
2.47.3

