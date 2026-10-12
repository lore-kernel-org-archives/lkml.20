Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E824533F59C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791783829; cv=none; b=W9pTDo4bBD2unpQSFJmozLEsj81XiuTl1Z0pLq+CbLG6Gor/ajVTCtLcWRkp8LhQgJAdtc7DLR1Z2TvG1Peux12bd7rK+oHqgQ7GrShGR0IyPcFldTuklF+9xeO8gtzP8STuol+bNp+UMjIgYyo3O2XnhvWLLBYgjs4LuuYo0r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791783829; c=relaxed/simple;
	bh=mLCMVbIggOYh5eoX77hLmcDhSE2spEx3Zw3hG8Tvkoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jWRrRRJUp08bVh2Puq2mRsn2q/PtRYY1KGKVVb/00+aQeJ//1A3oqAscKuUboWE6gKTJkqptdiv6I9IEf///5CzVU7vstiWxQOUun5Nl3586gz4q2oT/v1irSxuPpN5s1/4aKi482SpomgRbxDtnvls1mCfoS6E7RsU6IDVRmfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GqGp4ZM8; arc=none smtp.client-ip=209.85.219.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GqGp4ZM8"
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-9144e8021d3so23934576d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791783827; x=1792388627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9teWJDYdRdzoEnukU/RejkAIu0GQPduV0KwkxT/T+Zg=;
        b=tSksjGPfH9Tp9PeLdFg2xFAwIt1GeYSCXnAywL9LQuV1I/n1WZGxXjQnw9BtisQhmS
         XbMAcmnu/tfi84fNH4ekiqcZ90cI24Mcj67511t/XOwAD8ixYD9fbrVqBPMMDikUaWOB
         SzC3V+08InMiUEFx6bAAZ2/GX1jZrcmd7H8SE+NjJzsqPE4e69b6KoIx6oYfB0h8cuJP
         EEAeL/qWCUGy1s/EODyxrI4lbqzCyBnVxJdiPEVX0nr/u8LN8rFpiJ1fzxYFEy4Eq4jP
         /PsWr0HnQupjLNFlw3UUTT1QGpKIJVMrLFnjPPACzsT6zqdueMljU9oRBEUbnIKd2ICh
         pLuw==
X-Forwarded-Encrypted: i=1; AKwUvBzyodQksWUX20TfG9/roMQiP9xGL0/sseIvmYQUvCWyj4U+j90pytJGtU6MxQTWTJeMCbQ0+K6s45NgPpw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2brVZhtvTyvbh6glDKItdShXOM9NCW8EBR7RFfO7XPRgJKg6q
	WPEL1s3bWFRq7r/rLw+QiGhOdD4lEBxwQSeKtXhdW4blhBuwpkPJzHKZT8hRHztwDnRMQm0XwBq
	lNyQDWTksFQXan+gNlNI6n6e2Wr2xkOCbnxEETZMWawY+7mbcNcyNSihSfWNE2jB7VTwN5qnMsk
	TpcNQ4UIV0L3ohTZMR0yIGYWG1MZxBKjrhY/dI0rHktp+bil2daNytxAVbQ7RKjLibrw836O15Y
	G10mthJnOTH2SpS9Q==
X-Gm-Gg: AYBFou19nv3UttMXy/LlaauF4qpApmDUWYII7qQP2arzdHnJBTVatjtwQGww451x5C2
	P5nha++WhuLz0TJ/aL6ZpAZ8A0OoQYpgKoyTKBKK6XfEJFLQu8XRCF173hn80Rjo2r3GShTeIuc
	3emLA2HLrHOP6VGTwkl5e1XyOw+52R2SdeHZD0WqLL2iJvhNTT3zxnqnXhJLkQVhEnfzQhkxU8l
	NZoBnrf9yvkYmq6UWugcubBLXO2/PEiwDonQfuaih15txoDKpnyzX5qcrq5k0gNmt1UGikVAHIG
	XU6fcYDcgVATC2gq1QsNsuxxc1gx+mmbuDMUGAlvTKP06UKb8rsKnqv9zh7ZQQyZwmwMQq6UuIt
	4XhLXf7MSKkoPZWwyd9EgjmGffW2PcPXgqYIRwC+wSe6Yo+pjo2DP/V6deckTFmL1uYEuA4KXV5
	rstkHQ7h1//TosOiPaReWMXIDN/imn/K9IQ3y4
X-Received: by 2002:a05:620a:1793:b0:93e:c12c:9b68 with SMTP id af79cd13be357-93ec12c9efbmr1387887585a.67.1791783826733;
        Sun, 11 Oct 2026 22:43:46 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93eb95d6b38sm188604985a.0.2026.10.11.22.43.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:43:46 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd3e7a65fa8so800854a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791783825; x=1792388625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9teWJDYdRdzoEnukU/RejkAIu0GQPduV0KwkxT/T+Zg=;
        b=GqGp4ZM8IxeWfrecpKH/xehIjfMr+oLKwbzKK9xUsZ5LP2pITWc7TgJHNlv6nqdHln
         prf8FSJA8ARfFl9m5sdVunDb0Mb6fjWs9vRn4kLDLp8xbsE6vsSO8jJhgMwpTdE3d51d
         1gM88qj9qayKSUGs2nkXBNRmM5QUx4fFENzu8=
X-Forwarded-Encrypted: i=1; AKwUvBy3ZdII4wx3GFP+I/B6c4O5Sqzh6NyqWmUnHOq66ey3oa/BgOwwVu8m33pAfcen08LhGpGaWbdfYYeDSE8=@vger.kernel.org
X-Received: by 2002:a17:90a:109:b0:3a8:2046:7e5f with SMTP id 98e67ed59e1d1-3ab3a747e69mr5117669a91.12.1791783825475;
        Sun, 11 Oct 2026 22:43:45 -0700 (PDT)
X-Received: by 2002:a17:90a:109:b0:3a8:2046:7e5f with SMTP id 98e67ed59e1d1-3ab3a747e69mr5117666a91.12.1791783825005;
        Sun, 11 Oct 2026 22:43:45 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f8277bsm14615587a91.11.2026.10.11.22.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:43:44 -0700 (PDT)
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
Subject: [PATCH net 2/2] bnge: cap RSS contexts and RX rings to the RSS table size
Date: Mon, 12 Oct 2026 11:13:25 +0530
Message-ID: <20261012054325.1782819-3-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261012054325.1782819-1-vikas.gupta@broadcom.com>
References: <20261012054325.1782819-1-vikas.gupta@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Dharmender Garg <dharmender.garg@broadcom.com>

bnge_cal_nr_rss_ctxs() has no upper bound. The VNIC holds at most
BNGE_RSS_TABLE_MAX_TBL (8) RSS contexts, in fw_rss_cos_lb_ctx[] and in
a 512-entry indirection table and DMA buffer. With 577 or more RX rings
the function returns more than 8, so bnge_setup_vnic() writes past
vnic->fw_rss_cos_lb_ctx[], bnge_set_dflt_rss_indir_tbl() and
bnge_fill_hw_rss_tbl() write past the indirection table and its DMA
buffer, and the pad computation in bnge_set_dflt_rss_indir_tbl() and
bnge_modify_rss() underflows into a huge memset().

Cap the number of contexts at BNGE_RSS_TABLE_MAX_TBL and the number of
RX rings at BNGE_MAX_RSS_TABLE_ENTRIES, so the sizes derived from the
ring count always fit the arrays.

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

