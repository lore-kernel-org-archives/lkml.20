Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16DF4C9DF1
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357326; cv=none; b=U4Ez8Fwocf1p9498Aolqh2KlETxRw4RBoF/x+Pkg5WCjZgMpeh1dQfAH3rCgpxe7UQY5rq7eD6wBRoEmceBH2PvfCwAw/qeIujb9JQIZhVCrOgHirWdZDDSL6ZPHhcDFcFR1UVxPq/Q4daxX/K6wrv23mkMsr0R68ufwE2Lnw8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357326; c=relaxed/simple;
	bh=6R9vF35/R9eECsbDvlUePkmHE6rzhr5u4rMbPcIUnFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lr9lZ8jQzqxDWcYJ1BoLRLTHFl9CTuw36jUbB8iSzK3W0/daPH+RsMpeIDi9mVriJw2xoE7948bqGgLdm5ip4WvGf6QljUkD3o9NY8BkuXi/+ImQRDbj7GOAtBMD+5lkNu0oTKrpZGGZ+ETiLL83dHcCzzIjJt+d54UXoc9ebT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=0BSfFglh; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="0BSfFglh"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c40e30c26a4so334569966b.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792357323; x=1792962123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aj8L+YVgxbyCy/bomk7t39g1PV2NuQ1DlfD7Gi2csFY=;
        b=0BSfFglhBz4jxj6oaf5YpLumlnlv3NnZuKsJ6C9Tred52tLHP9aMc8oGxo0pTDA8UG
         M6QoAAQUbt55lTHtsw6rq0K0CZKL63dANgcw1yD8F/xqpDYyGwROKIWoWU6vQ9NJw2iy
         s96PWChW4stucuj9KMW8lvBKnEhxsdarGrSXIDANr08TBD2nbmav8ogCxVxRSG4mmWdx
         RIhXwu5Swp3TS1t1QFuC8xJWx9he3CjjioaA8urx90TtS4WM5rtHFlWhALfuDS1C7yZI
         f+1qnm+k2v3oEeV7cM7P5yJU9+hspN8FA1tKQSIfkcyTErRJu/CYPY+xVanDfSZW0Bj3
         8hQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357323; x=1792962123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aj8L+YVgxbyCy/bomk7t39g1PV2NuQ1DlfD7Gi2csFY=;
        b=dRb9mpEM8oqLJUmEzMHCLIBKwR3ZOnz5hYg8Tm09el0YB5n0nfzPm1WcphPttLPHbB
         6KZTatXFXAl+e2WFE/Nykb0f6hrJYdxu98RG7Dle8d+1iA7GGVSiRshhk8Tl55KOEv8/
         2oBeyhbYVj0PjgePa7+wrG0LGyY+ntwcYLeHUjfDo0m4WwfguEha9QVFUDJxB2LiosEI
         IUOnfIRRYI58YlouIvL9o5GrMXkd5iNNAlYONRNGbE5z8vnKsbIz141osteZq3zlVjnM
         2wI+WiFd4H4WOlcJweBuLlxJj3o5jNpiNNNHodkSeIpjn8oPTKblwYJYRZNuxgMjI0J5
         5dUw==
X-Forwarded-Encrypted: i=1; AKwUvBxRLDsnlBKYsUeydf+6psrjzXc6HA68klWca899ckF/p3nr/Lh5ffzl6QQJeiEfWxYhRhRG6l2apYRpFU4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqD7x5Jb7r9jKCcJ7QW73ATIecs8chDgm9OLymAkEy9qKldjWU
	GqOmh/M6E/BNfq8mh8qmmyrIKJdQjpDBbBhF++ylMQKeZ5KvQ/3SCGxRJ5lkE8HD1w==
X-Gm-Gg: AYBFou1FYJV82kbRdnZDNnn9yV+7HHC1rbbmQM5upwrEaSwU0h2+uZjNN6JjpoLi39t
	+yOFz6jhNKI5Q9VcA3/NELrZY91C6Se+ZKuK3p1wuEuAYDUEvx3csh/g5oqq5SFB8nU0dIGE08W
	tdISKHKEMbaYddj4hWSvCaA0jh61CVGfg/UaANj4U7hGxjAiVcSbeYQOFQ6mwFkkvePTSr0Hpw4
	4tJ1w5mku6FsdkgnW7zUnTtn3BE8YF38yLAwGoI3ieprExgmsLrhhWlx/G1kaHULBP+VnGJXAtn
	FZxWwNkR/CB/FUWWXZOpbUrENgnohcXIErhJ88adHF7jk8LbHVgQi6No2dGVsypSktW021UNP8J
	HcDE4PGO+eMjUE8DdD7mx//6pk9YRniK+Jm59jqWGldjuQYSnYSWiSH6hA5E0B/K1AaX0AfYpL8
	oD50jh+D463rb8xyq2UVckQ9N4MMFLbZWO0hf8B18MWLCg2RmprC3ZNDf0O6djn2566gkXemVyN
	kjq1YQZpv3klS4B37Z6D0clAT2UC/OrVVL7w1R1MWadx1M5ZbJZ/0l13CDoLnkGdj2u6WRQrx/Y
	Es8jakiGXOsNSFC/Pz3b6ja4NcJ/wRNhwPqzmRl7tGkdQ2avQqwOem3eV0QTIE1aZ9Dosn+i0UQ
	cSrF09TJbiR6UYVrYflFRYLTEY2B7waaZMqU9ntoB7uj1h9h3qDnvcceQgY8Ac3FfGqaPpxIAZp
	sIo/Xb3lvS
X-Received: by 2002:a17:907:c510:b0:c2d:cdc6:8271 with SMTP id a640c23a62f3a-c4020cf900amr786044966b.13.1792357322673;
        Sun, 18 Oct 2026 14:02:02 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefd4sm291618666b.35.2026.10.18.14.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:02:01 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>
Subject: [PATCH ath-next v2 3/5] wifi: ath11k: keep the srng allocations when a firmware recovery fails
Date: Sun, 18 Oct 2026 23:01:51 +0200
Message-ID: <20261018210153.1925962-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018210153.1925962-1-julius@bairaktaris.de>
References: <20261018210153.1925962-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 32be3ca4cf78 ("wifi: ath11k: HAL SRNG: don't deinitialize
and re-initialize again") recovery zeroes the hal state instead of
freeing and reallocating it, but a failed recovery still calls
ath11k_hal_srng_deinit(). This frees the ring pointer buffers and the
ring configuration, which only probe allocates, while the rings still
point into them. Driver removal then walks the copy engine rings through
the freed buffers:

  ath11k c000000.wifi: failed to reconfigure driver on crash recovery
  ...
  Unable to handle kernel paging request at virtual address
  ffffffc080ee5090
  pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
  Call trace:
   ath11k_hal_srng_access_begin+0xc/0x60 [ath11k] (P)
   ath11k_ce_cleanup_pipes+0x16c/0x4cc [ath11k]
   ath11k_ahb_stop+0x2c/0x3c [ath11k_ahb]
   ath11k_core_deinit+0xec/0x168 [ath11k]
   ath11k_ahb_remove+0x30/0x90 [ath11k_ahb]

Return the error and keep the allocations for ath11k_ahb_remove() and
ath11k_pci_remove() to free.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: 32be3ca4cf78 ("wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index dd256853bab57..daa3751d75233 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2352,15 +2352,11 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 
 	ret = ath11k_core_qmi_firmware_ready(ab);
 	if (ret)
-		goto err_hal_srng_deinit;
+		return ret;
 
 	clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 
 	return 0;
-
-err_hal_srng_deinit:
-	ath11k_hal_srng_deinit(ab);
-	return ret;
 }
 
 void ath11k_core_halt(struct ath11k *ar)
-- 
2.53.0

