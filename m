Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475293;
	b=HW0zoaHx6zEg4Xxx+TM5W4+JaVtubgH76oys11/KD29z1LfK4fSab96jNc2uvxYjdvEs
	 MpcZ34WMmdhpkTI3yuH7fSIFgb2yrTpzSQbynsa+qSHbKn5EP/vL9PdKKLF2goDprHu15
	 q3yE4NM0yVzjgc/xFtSZGR8u4MpuWbZuw1hSrV4VY4iZLjJehaHD0PcxbPk6O8R7AyIDx
	 j607oP5J2Btutqed1IjCbGhV5xFOnQfBxZyf5KDLWa3G929O0vuzdGWhEA0m6fCzWwm/R
	 Rv9hVbMRmZ3oCO5EV6ZxbwogKYTb+9QHGauiLeKYuRGZ5ej5BMRT0oNyTDwE7Hwhtpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WWgmljf7p+9w5O022U38G+2AIVWKoqElpuvWzSOA914=;
	b=iJWsnikMrNi0IvwdzrlJHCmj1lOvNgl3gJ9z6EgdvTCdW5SsL8xCnnFP16PR1WNc7kQy
	 3MMcPx3jHCa4KfD7aWIw/DF/4WhTxl/3LUn9zRicm0iXEV8M6bYwr0bYQ/99v+z0ed6hx
	 WXpmsGnVh1zGey8cuegY9gx0EWJ9y89ftuvq1eaqkyGxl8yETtbPfyDhs+DVYSGJBON5P
	 JWuw48Fcpt9TSMuL3QkbvDrTnH8Kw3ab9Sbfl13ZJFLRVcsVdMcMJlmk7pNhj+ij0QB/K
	 Knk3pELnHv7Wlg0LeeynY0etO0nwBF4TX0iuT3qOm6jqr5r7ADdZqT6YkFGDDREir+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uCLbTb0r;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91633606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91633606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uCLbTb0r
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b904d10882so1818829b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794475292; x=1795080092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WWgmljf7p+9w5O022U38G+2AIVWKoqElpuvWzSOA914=;
        b=uCLbTb0rB83bwv9iDuS+LxIdVmXsAEqbZalNHgCMW9hYO09rz9Bd82xt1MY/+a7ipU
         Ph9/ItVXahyPYEPiUhLnothPXdEa3DmzRP468PqaETZ+1nIdHeTcguQ2DV3yakaUitrk
         LE4J2DXpB2C7uS2qBfUbJ9jkB6F6yLgZ9yUDoEJUbxLAtWq+qMiO+fP/uFoSyvICafIC
         SeSkbuIYpxPANwSS985Jer97vYYJx7f/nUg9POhhaQkH6xN1IKcAsxhMfXY9hxrgAm4n
         2ZmYffJHUWXBKOMCdMj3IukJ5K+cv7J3fRxSgpukR9zmN09xhtXGSqjPjZlRocobEjgE
         HspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475292; x=1795080092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWgmljf7p+9w5O022U38G+2AIVWKoqElpuvWzSOA914=;
        b=NBQ3f3Bqa80ZExkQEx1/V8qMnyQCDqiXbUGrj2FBiejFK0lKTow7ik1dcvwCBZLLNH
         QUurdcxjYioMI7mjatuanCl0e1Jbb0rUExaw9pq4QaE+rYa2fP01qayE7QXjblMK66k8
         21UN4Cj6zAr82PRNyfKuj/M3yL1jzcS1/ZyDOfFccsuTeUXeqLdus139WpOQ2rP6I9dE
         yCyZn0k14o0Q3ju1R/mid7FipVPiWK2mKFKbmBm75ljMbgNVsFsFq8NwT40egedKmFOJ
         C20ug3cYwgCP0aP6WfOqfkhlg87E/uVDmh9wZR+/88+ORJjQpUK0asAeZBHBYLyjdxIO
         OYmA==
X-Forwarded-Encrypted: i=1; AL+hErFL6K8P500TqsaG+mJTOBivskVa4K+gcT2dzAmCIG3BJ9nXnYMViw3oI0lt5/Y9ejvi+y2dNJiHUYY/dZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c7W83PALYmXf54G1P198ADaGFJFVRTF2cgQaPniuGnPXY7alh
	lMPHz+/tOMU7BxkiwOBAxcFUCdEe9ewmyyrs9vTYxukP+x56MU3Hdve0
X-Gm-Gg: AYBFou0beX4MPhVl2Y457+rlsVgMi04hR8U9xVx6u8TXJh99uCQbdniQU0IgTCE7U6b
	GypH0l2aPGfOU9AtWwo3VCtJuz4k87fyYuMfnaxWEMysCcu/T/1bnAFaLu16YjuhvVvZ3/B9oYa
	DLNF8rU95J8hm56aYoYouSyXZA8A9T0tW0KKCXmlJzKceR4ox7BNe2BVYLLXEj8l76/xyxjAFfW
	ep3+4EEFiEQ4b0qux2WXwAbk2EQkVFkJyvLBjgSVqgxWUOGpbG+IBmW+aTk1LGfoq1++UnPvjss
	064wTbHpbAI0rEiYkocyaU8fxYKFNp8rAd2ZenkNqY9JNp2MapTODyn6sMRSdmdQd7ObQgz3j8e
	ADiOP+XT7qBrTK2x9633EFiKugHkpqG3fUkOLXmCSb6Nq/I/CPpdP3KKvWOgZVG9YEm8bJk4jer
	m8xhxyEsH7/2Owfhcd95W1ntC3tc4RqwZ68+wXLFial8RoCFjLQ67n+bMIqGUrCjJX4Zoe5cFHD
	E2KGD8hc/f1mmqaZE9g8tdwtfwiDXkF/nBi1C4M4waPsK/DmBJXMFkSoFzmTo7hbKOD2Ixji17d
	IqpG0RanwT+A0UZG9nbDrJ0MS2aYBZlYvI+H1M1zTS3WqczdFRWosT5+lyq6WBlDonwCVhwYhg=
	=
X-Received: by 2002:a05:6a00:b86:b0:89e:c324:958a with SMTP id d2e1a72fcca58-8bc1d148d9emr4997745b3a.34.1794475291667;
        Thu, 12 Nov 2026 01:21:31 -0800 (PST)
Received: from JIAPENGLIN-MC0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa2a6d79sm3214881b3a.10.2026.11.12.01.21.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 01:21:31 -0800 (PST)
From: Lin Jiapeng <ljp1205831794@gmail.com>
To: netdev@vger.kernel.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Vlad Yasevich <vladislav.yasevich@hp.com>,
	linux-sctp@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] sctp: preserve the last transport during INIT error cleanup
Date: Thu, 12 Nov 2026 17:20:58 +0800
Message-ID: <20261112092114.12458-1-ljp1205831794@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Lin Jiapeng <jiapenglin@tencent.com>

On failure, sctp_process_init() removes all non-ACTIVE peer transports.
An existing UNCONFIRMED transport is not promoted to ACTIVE by
sctp_assoc_add_peer(), so cleanup can remove the last transport.

sctp_assoc_rm_peer() assumes another transport remains after removal.
If the list becomes empty, it interprets the list head as a transport
and passes the invalid replacement to sctp_assoc_set_primary() when
removing the primary path, causing a NULL pointer dereference:

	Oops: general protection fault, probably for non-canonical address 0xdffffc0000000045: 0000 [#1] SMP KASAN NOPTI
	KASAN: null-ptr-deref in range [0x0000000000000228-0x000000000000022f]
	RIP: 0010:sctp_ulpevent_notify_peer_addr_change+0x73/0xba0
	Call Trace:
	 <IRQ>
	 sctp_assoc_rm_peer+0x186/0x9b0
	 sctp_process_init+0x1ff4/0x2810
	 sctp_do_sm+0x1c97/0x4560
	 sctp_assoc_bh_rcv+0x30b/0x630
	 sctp_rcv+0xb63/0x1220
	Kernel panic - not syncing: Fatal exception in interrupt

Keep the last transport during cleanup so sctp_assoc_rm_peer() has a
valid replacement. The retained transport is freed when the association
is destroyed.

Fixes: add52379dde2 ("sctp: Fix oops when INIT-ACK indicates that peer doesn't support AUTH")
Cc: stable@vger.kernel.org
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
---
 net/sctp/sm_make_chunk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
index 15c2d87575a8..e4b7dacf174e 100644
--- a/net/sctp/sm_make_chunk.c
+++ b/net/sctp/sm_make_chunk.c
@@ -2528,7 +2528,8 @@ int sctp_process_init(struct sctp_association *asoc, struct sctp_chunk *chunk,
 	/* Release the transport structures. */
 	list_for_each_safe(pos, temp, &asoc->peer.transport_addr_list) {
 		transport = list_entry(pos, struct sctp_transport, transports);
-		if (transport->state != SCTP_ACTIVE)
+		if (transport->state != SCTP_ACTIVE &&
+		    !list_is_singular(&asoc->peer.transport_addr_list))
 			sctp_assoc_rm_peer(asoc, transport);
 	}
 

base-commit: 145480b28ca82e9fae789427cc4569e596515a32
-- 
2.55.0

