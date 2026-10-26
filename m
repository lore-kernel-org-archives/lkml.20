Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006903;
	b=MoNg69TTHTwfRc1zQ1CgV6cubMiWZaG/jZEpy+f/HFl9SduSp7sEAicOs2e/kUfQC8wz
	 L1RLfu8N8IwSamqt2mMZNSMWzptUvTW8EpUCchP/SfdVaJxQFBDHmROYzMVZWUCZNgvMc
	 D5DZco7Nr93tMVLEvY3koEiPZeQkZqVrO+W+4Fh+IXUY5rpI7TX1diFnCDW0fCX47wzdT
	 gTPKVmQrJiqgPokK1Bey5Ym8bPfmNCXQO7k1lmLOJ0C+gduULWW4JAM+j79b8hghHi5Zy
	 UotA0VrDDgf2vedrbSVgIeyqmF02zom84x2CQqoLmGNOIiNUEAjUUGOEP3tHfZ5o7+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006903;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=1E2k1lqYpcgLA/U9AfcKbavuiY4YjaqtzjrZYfyvQVw=;
	b=SM0cNRxoE3w/F2Wep2ohdSptHrvN4u6HsuO4g9IYoBlI0MT6PdCI0SEn2h61TZij7S5g
	 CI550joHG4ieGIhrob1aHXrzP7mFGKvjMJDQJtsnRdncvPTym6ieeqHua9AsspK5v82oM
	 W3xFJ4upDayFHairuGmXUtUMZ6Py1nzYiOqoJur1CaFdHdBV+wxuJmBb96lJ0f8EYQs6E
	 5HBqa4DBhBJERWvyPTVZpwLs1mGiZcohLkFa9lb3W3G6xEe2+JK07O8SB0BgrzsgruE7p
	 rb2VPSjSBK/f+w5L38p5cEbXPbYqPpTIFbXizqPlN71FkLChDZkMVa2vqvX7DEKf4Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Oltz6a57;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DE0606A328
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7DE0606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Oltz6a57
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1485858a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006902; x=1793611702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1E2k1lqYpcgLA/U9AfcKbavuiY4YjaqtzjrZYfyvQVw=;
        b=zjm7X+RARltLRqioisIXspOqIvLQYhCIMHRW4+u0YQXYE9r/ZrrkDoRwU7eOaEDcSl
         OZaUHUjMate0PGj8QGCI9+4F6DKDQRgumb1sHYqp7lDxO3EG968UvZJs9ZuLsiRcvYKO
         CXM13D82+IQBgmPfP2aXGQFH4hvLS3vq+I1hDc4b+2ysZBoeYeTgOUJVtfv0MlXVwGoC
         ZhzOtjovN0v6Je5chzq2Th8qt/m/vQxz/Fl34k5ARCu42kZBQErFxwdC6SpVF+rxVON9
         66/oglddxPvVQg9ebGR0joLM0crBYlcQBIgmVGuDSCZgVRVvTQOKvhE4AKorAiJIS5Yh
         HQpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9OCYMV0jhQvybaMIdfDjw9SVkLFAIyc+gc+oLAI50Lh2wh4Tu++QqBjn7FeBApNPOqNXWJ7gMrD3GuhI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEKIsxHktu/3gbBvHwtdJab4KV/xksY+VdKqnw/Rd1vuo+/BaS
	cBKnDA/ScMBrJxTDQDN3KrcGxKVLAZcvmz8x+WgXkuDOYAtY9jPoOdQ/Kg9kdoo+hj1JL5vmjlR
	H/Knvgfz/ev30VMEF0kl4G3Fm+qSCHjuqYB2UULmUfXT5R4FVb1y58p+R51tgKLREg+RAg+C1mf
	PBKEFIJWQUVCbWVG74dU1r2vnIN/SWfDfaLuC4AHWU0xg25nQr5lznIP0/6+2NlCqTas8hWJIDv
	fPTuV+8ivI6nejSnw==
X-Gm-Gg: AYBFou2xIvZ9KfUcbeAOi+Zh6BiMkEJ/T8oCOQRiOsXbEWIxlBPQZ3s2Uzby1CDdQzc
	wFSL8Z627XQgFg42XyQQ5Tjb6nCjbYf9MkR2n6FhKzG3OlpER1NszMPuMJYUr5bFqxM1sY5MuyH
	YwvmNfN5UDElQ5ZYc3tORYB3rd3mdFD+/m4dACMfjoYvv2oVoUEQy/aN6gHDKHbOPklKdbx/Mh3
	MVlrVfNuDDFU5r5lqwNKyH7CMehFZbNTCTah4iDVkihmkH2m81auBFxyoBHB+IlTkaNI2UFNkcI
	VQegrMeqXKzY+/8pLDMRmmanh4w6llYBtLyIDfTWXxqbzRuVaQ7OWCCaF2UhxS9xdYfskIn7uY4
	RgVgDCbWIrFMHplt8J+wE5n2ZbmMPrKd5GNMuNd5Ru7cfn4MDd5Fl6Nmm64mmS4EWXRWxHcxkZh
	AFuypwf+F7UT31SOtTis3i6CUGdgp7qwttZveT
X-Received: by 2002:a17:90b:2789:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3adea9d6f7dmr4690148a91.20.1793006901750;
        Mon, 26 Oct 2026 02:28:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adebd531f0sm6328167a91.4.2026.10.26.02.28.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:28:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3580c07911eso9280300eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793006900; x=1793611700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1E2k1lqYpcgLA/U9AfcKbavuiY4YjaqtzjrZYfyvQVw=;
        b=Oltz6a57dm7Kxb/KgU07Wa+mM1qJ1PfTE8cvY9N/IHMfRVn5TLWaIGXuNnhdUPwu2Y
         YLvDKo68fkwR+tJ9WbLMqFjlHipCpxv0gmlJQiunu7DLBLBApFG7as7jf82Pxau6X0QQ
         09cDqV2ANy20UdKveCxJOk7d/XsGHynVPRgxA=
X-Forwarded-Encrypted: i=1; AKwUvByvDC62VonXnzmsLB6AB/YZti6IxFXLbUj4HigFFROkCNOUCMIBNPaqss8lWHK7DFwrpDc5mTifNQ7rorg=@vger.kernel.org
X-Received: by 2002:a05:693c:400c:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-369e850d1e3mr9667053eec.32.1793006899690;
        Mon, 26 Oct 2026 02:28:19 -0700 (PDT)
X-Received: by 2002:a05:693c:400c:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-369e850d1e3mr9667003eec.32.1793006898747;
        Mon, 26 Oct 2026 02:28:18 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f4164886sm16711294eec.7.2026.10.26.02.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:28:18 -0700 (PDT)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net v3 2/2] bnge: fix RSS table sizing for large RX ring counts
Date: Mon, 26 Oct 2026 14:57:57 +0530
Message-ID: <20261026092757.9168-3-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261026092757.9168-1-vikas.gupta@broadcom.com>
References: <20261026092757.9168-1-vikas.gupta@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Dharmender Garg <dharmender.garg@broadcom.com>

bnge_adjust_pow_two() adds one block before rounding up to a power of
two only when the quotient is 0 or 1. A larger quotient that is
already a power of two is returned unchanged, so 129-192 RX rings
get a 128-entry RSS indirection table and 257-320 rings a 256-entry
one. The rings above the table size never receive default RSS traffic.
bnxt_calc_nr_ring_pages() always adds one, which is correct.

Make bnge_adjust_pow_two() always add one block before rounding up.

bnge_adjust_pow_two() also sizes the RX, RX aggregation, TX and
completion ring pages. For the default 511-entry rings their page
counts do not change. The completion ring is sized from more than
the default depth, so its page count changes where the old code
dropped a partial page. With 8K ring pages, TPA off and the default
rings, its budget is 1533 entries and the page count goes from 2 to 4.
With 4K ring pages and TPA on, when the firmware reports a
max_aggs_supported of 260 to 387, it goes from 16 to 32.
In these cases the old completion ring held fewer entries than
its budget.

Fixes: 627c67f038d2 ("bng_en: Add resource management support")
Signed-off-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge_resc.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
index b62a634669f6..c0b6992d7f82 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
@@ -81,13 +81,10 @@ bnge_adjust_pow_two(u32 total_ent, u16 ent_per_blk)
 {
 	u32 blks = total_ent / ent_per_blk;
 
-	if (blks == 0 || blks == 1)
-		return ++blks;
+	if (!blks)
+		return 1;
 
-	if (!is_power_of_2(blks))
-		blks = roundup_pow_of_two(blks);
-
-	return blks;
+	return roundup_pow_of_two(blks + 1);
 }
 
 #define BNGE_MAX_ROCE_MSIX		64
-- 
2.52.0

