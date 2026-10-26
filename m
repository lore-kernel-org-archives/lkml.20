Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006897;
	b=5NYC0e7qRfPGmaKK7Bw/O0SXVQYJrOcnKtyhs3ztpIL81WunANn1eSgU7XwL1FHlIttN
	 ktt4/xNfpvBo2TzpSgEVY+vGdRWGOdIyXo4fomAcW1Ie6e8GIwi6MsYDKD9P2x0vjMUHv
	 8CzHMmXpTYZXGjoNXrBppESgo2vX4mDNyrZx56BrX/1VWRlS9d1bDzaNo+48qFgOLbtRP
	 FHVtBctg4eSQF8qh+/0kA+/yn1p6CLUxxkIyxUv/dsCg8aDoxgDxLRvedqeKcY9dvllAi
	 M4FlK32Hl26qPi53t1p2+eeUzxSe8+AbRhCUHKto40QHO+++JazPvpgJs/Hf0COMV8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006897;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rilc6HUjydimDhHnBpKE0cl6+BsSplovl/iWC5aCtQE=;
	b=PlPfk9tu5FHOpyQO+ZN24L/Lgy803+C0bK9FuM0fLcb79SK/3JWLnPs1/NASom/KOvXQ
	 T1Kq38LodYa/OzlAGtH43fSYzemx9jovRfbLPEcr/7i+nz71/AEFQdLgFi6NWpjz43v7Z
	 lsW82hGbK+bcoawqxL0Cy/XjODahPyEnDSrMf8iPmDm95RTKEzSxv/cjYZjVxWJA5ito8
	 QiTruvJk49qVr7cCsnKPfMy5BESjBSsu4kX0NMaTE+vRoo2xRHgYWiycDhPvOyGRKIXfI
	 vx0skK4H7HFEUT8Me++PDYK1CWohztoDGdVHwujAZNT7bx/+Y4oX24PrRZv+yX7PzaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hbsUGgGA;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7249606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7249606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hbsUGgGA
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso749281a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006896; x=1793611696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rilc6HUjydimDhHnBpKE0cl6+BsSplovl/iWC5aCtQE=;
        b=fyinfQHu44zfOL4Iom0shWt9aEzJJuk9quZZBFu+y40HqramM0qtGU6OuxnO07N0zH
         HTf7xcTLatdhkMr9fltb43wAqpVCrKgXIx56gYjQWlfRoXarA2o46xBMiX+J/94fa8Fy
         zED8ZUz5QJDw1DiMo+iRChcXLsWWoAzgFdS2k351deuQ3xcVFqCUuHQjRM20rblRoR8R
         TP03nTupROpCEvwR958chyhB3ElY4VHa0if7uDx8FS2AlUddQPMAVrmSxpBHy4fmyVSA
         xscuNyKxwOT9ln+uket3TP4AxvadUjMJ7QZ+TPNVs/FXe9KUgwlMgzvS9krEa21RzosG
         ZmVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBJhr4xbc93cwyuO2yqjLlfZDXXuKUInCVAJCl1EVITyho//tHNmEQgqp2o/fobHXL65FatbCi7tnw9TE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3cOlTwYN8RqV8SRWvOeCTo7HxY5UR30ug2Ulv1aE7QVG7Cmhm
	tffsGM+twLb+dcWvn7vMgVcbjE5YqHcb+dA0JJFag849PJFvesYoEA/jCvFyyP+gmbGaZ/UkNiZ
	G0NbcaTXWq5TtfUmvz7rKIaebU9A237t5nTzM0pV3h9SAnU1+xFn3E4G35s+evrbonoGkbyP5Qc
	lpNh3Rg+r46S//f7Pm+K/cA9FyESOUDNIMjIpKIcm3JghEw7igXJMmuYKSOIqLQPn1H9z7SbQs4
	Tj3JXR5G7xXv8k9Xg==
X-Gm-Gg: AYBFou2dus+1j+DQIWAQSjkrrRL/y2FEiNr7tyKHSMB0ayp9RE7tjqnooQ8o0bJhtQt
	iTqRvwv4A8pomOB2fLUkw2b0FbGlbXeKiUztIFWCRuJpegmbLvb6YpcSduH2012d8SBuFPAuimM
	TM0XfS9qM9pJ7bczoYpdKWgddaAshHwwSILzirjVRbFvzEk1yZcH4YX46p4RqVZ1E3KmCkxEbT6
	35gTDTXrwiK+3kYpn+PyPr2V/LNBGSPhw4gn/DOfaTs1kXzchvLg/1TDFI49HsQYmcWY/zTDj1n
	b76RnVsJ9VKvdLucu14CiRJPiT2WpEn/p7lC1N6NI43TFcuDz9zRjYh1XfPiTQTyeclE9E346Jn
	mMa6zb9TqrNxdJCk8uVcrKjt6Xaz6jcqVLJRbrkoym+7LDJXGFMjHlrKg3ILHKpQXTCfiYw+zu5
	51zH5NfW7le1U7TvFROjA76+7oYIbYga6FMg==
X-Received: by 2002:a17:90b:2692:b0:3ad:43c1:7d41 with SMTP id 98e67ed59e1d1-3adeae76feamr4475732a91.33.1793006895876;
        Mon, 26 Oct 2026 02:28:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adebae5655sm2705361a91.2.2026.10.26.02.28.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:28:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36637676140so4876248eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793006894; x=1793611694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rilc6HUjydimDhHnBpKE0cl6+BsSplovl/iWC5aCtQE=;
        b=hbsUGgGA3ZljkDwooOxvXgOVp6GeHcrACI+SQPsYJsCMaTi/cBXxQD7RLrkk3UgwNu
         ItNev6DVi9HFxsKamxXXMgCBpq6KNyahnGwnp2EmxxcZUUxPJ6bnOg3tJ9pxzbBiBRGw
         dhc37QDpKl7iYVQEVQcNtidcDMSYz4OFRy3cY=
X-Forwarded-Encrypted: i=1; AKwUvBwdbz26L0GnBjUvfukwX2sG++PPhWPhrFBSKgXPqdtJQ2/BQ3aIEFwxq5218l0zQuvliEDdaAdZvq6ucAs=@vger.kernel.org
X-Received: by 2002:a05:693c:41d7:10b0:36a:433:9ef0 with SMTP id 5a478bee46e88-36a04339f31mr1944768eec.14.1793006894014;
        Mon, 26 Oct 2026 02:28:14 -0700 (PDT)
X-Received: by 2002:a05:693c:41d7:10b0:36a:433:9ef0 with SMTP id 5a478bee46e88-36a04339f31mr1944734eec.14.1793006893249;
        Mon, 26 Oct 2026 02:28:13 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f4164886sm16711294eec.7.2026.10.26.02.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:28:12 -0700 (PDT)
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
Subject: [PATCH net v3 1/2] bnge: cap RSS contexts and RX rings to the RSS table size
Date: Mon, 26 Oct 2026 14:57:56 +0530
Message-ID: <20261026092757.9168-2-vikas.gupta@broadcom.com>
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

The hardware supports at most BNGE_RSS_TABLE_MAX_TBL (8) RSS contexts.
They are stored in vnic->fw_rss_cos_lb_ctx[8] and back a 512-entry
(BNGE_MAX_RSS_TABLE_ENTRIES) indirection table and DMA buffer, so at
most 512 RX rings can be served by RSS.

bnge_cal_nr_rss_ctxs() has no upper bound, so with more RX rings it
returns more than 8 contexts: bnge_setup_vnic() writes past
fw_rss_cos_lb_ctx[], bnge_set_dflt_rss_indir_tbl() and
bnge_fill_hw_rss_tbl() write past the indirection table and its DMA
buffer, and the pad computation in bnge_set_dflt_rss_indir_tbl()
underflows into a huge memset().

Cap the number of contexts at BNGE_RSS_TABLE_MAX_TBL and the number
of RX rings at BNGE_MAX_RSS_TABLE_ENTRIES, so the sizes derived from
the ring count always fit the arrays.

Fixes: 627c67f038d2 ("bng_en: Add resource management support")
Signed-off-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge_resc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
index 4711dd4945ff..b540eed12fc6 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
@@ -182,8 +182,9 @@ int bnge_cal_nr_rss_ctxs(u16 rx_rings)
 	if (!rx_rings)
 		return 0;
 
-	return bnge_adjust_pow_two(rx_rings - 1,
-				   BNGE_RSS_TABLE_ENTRIES);
+	return min_t(int, bnge_adjust_pow_two(rx_rings - 1,
+					      BNGE_RSS_TABLE_ENTRIES),
+		     BNGE_RSS_TABLE_MAX_TBL);
 }
 
 static u16 bnge_rss_ctxs_in_use(struct bnge_dev *bd,
@@ -459,6 +460,7 @@ static void _bnge_get_max_rings(struct bnge_dev *bd, u16 *max_rx,
 	}
 
 	*max_rx = min_t(int, *max_rx, max_ring_grps);
+	*max_rx = min_t(int, *max_rx, BNGE_MAX_RSS_TABLE_ENTRIES);
 }
 
 static int bnge_get_max_rings(struct bnge_dev *bd, u16 *max_rx,
-- 
2.52.0

