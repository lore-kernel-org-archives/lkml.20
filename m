Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEA65372EC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924334; cv=none; b=PQ5NJMerqDpZ+A0iixDGX4DNFpIiO8u/WHqZ1X9X9q4RrzTsnoNTyxnIKHJi77SZKcb4qNIHiHSAjiqdu7lN2iINDYg6cY420CPKPvriMENAEiAcVKB1LCYeMMMqde08122hPP71ODxkKPwMIUlfvfQPRbOYBDWDGoNJ7Sho/M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924334; c=relaxed/simple;
	bh=+1K4HSp6pmkiyvbf8tMwek+cg4bb7uAnoYbeytWGhB8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UuSMgymGNgvXO5MTm5pc+r1vcVedxWTZFBzBzg3Kyp2njhA6aAtbamvljzcKx0dyFV13nqi4P/8Y5TCp8gHlWxNCMzz7oZBo+xsEJN2ZFiMDwoAr8txNYQQvUMWYF8t94xd480nXeR1sm3A83MgqonWDG/DuaeWVbpjRu5uej5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Uj1GCdnG; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Uj1GCdnG"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2226781a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924331; x=1792529131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkGR/Azw8eHXBpqAVq4rJc9RgjV7wncIp3Qnhd9zmto=;
        b=kjbI4x6J2bVOJnoFYA+fXt7fwofw0/k9XaVYgcc2XVMuO0O9a1B9kP/q3lAlEpz5aD
         SdVJNya3wQbRDqQZeJUXAODPRIhQ82hwFti8GNDSxtE7XzIzCvn5+qkQOVJkzY2VjppF
         ZTTXSwJlF0pv46TgA/j7gMBoSXvAcj21FAeKzThbNcGt9T6MYXWV0nvXTPM7mSXaqok7
         qMLrK36lGsKImgSlAjNPY/zNZZT00YqtvwL7EMCAljxhdnTarHE1dTUwfu2Ghm2v6wJJ
         +S0alyWq3oK/0GJjMAsrGqWbEDDnOyogs0YXkJo+u5eT3NJANQRJTN1sb7p3qzaydixb
         QKDA==
X-Forwarded-Encrypted: i=1; AKwUvBxF2I8VgDt8Mc5fmS+Y4LGDXPCzUGYlyVob1ghZKGGT3KgmvLD7GjFMVf1S1r1hX+dbdz12X3Ol48QZivY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIT441wTh0L9YmzYnaMT2GyA/I7VEmdW+wMXg0e8KD9dVztfiYS
	PYdh2IiHeo1Z3XzpuQ4YNUBeLFj8MHJEzgnGmYjxr9O1zR3nu/+wRSEJCo4iGDZ8UawoCVpRawQ
	BfAOJ6qP+KcawSbsWIieY1xOQshudajX2uquH3xgNyP8f9sSfVpGSuWSw4bQ4D4y5VIVWBRL1w4
	JFZ/AG2JhnCYjU5BygGX106ypykK9qRi0xjJJXhiV1zixCMdFcbO0RKWChH9C2HPK2oiE0I7ntR
	VU55bW2Cd6WvfzV47h2n8hE
X-Gm-Gg: AYBFou3Qd9mjaI2YlvPbawOmWLiZg6sajWCI/pQbZANE9uuU8OGPD5eDaAYin8+Frag
	12qmMo59LsdU8iX4w5c0moeSI8GkYnfobPfshsa1pSYpy/6mCckkPRUUcbcb5yBviLDCTzkagvb
	fUJzSRzTmKYW2fvnfKcfBySkOfMYnDwnwObBSYZBo5y/LDzowG5RDVTa3/geVs1r+ObMydZaK7G
	9NSnlkzmYJkBoA1wz4p/DKpo3mCB4TizDMfxDPtK4WDQRoA3eQUbr5pZTQw6JUXwuluYIWVMcR2
	FvnYhhSNXdpR4NgKVfa9XIgOAdE1/JmRY48Rkjuz5PzuM//sG5RMdI/QW1/kxdwoov05xodLmpW
	RE4faSJUQuZSEoBQpQ0Ou1dXiW7Lc8ldDmvQcjGAqdPCiC7J6jBB+5MOMyEmVHO2n66PTMLoAOk
	xsAinJN0xDWHVl1su5TyMwNbSM9IS4MAtFpczYdiFvHD0=
X-Received: by 2002:a17:90b:2f8e:b0:3ac:450b:164c with SMTP id 98e67ed59e1d1-3ac450b7797mr3051435a91.47.1791924330870;
        Tue, 13 Oct 2026 13:45:30 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac67a627d8sm40629a91.4.2026.10.13.13.45.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:45:30 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533928ef33aso46128481cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791924329; x=1792529129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kkGR/Azw8eHXBpqAVq4rJc9RgjV7wncIp3Qnhd9zmto=;
        b=Uj1GCdnGqu73PgZ3u/rY1h3lxAETBtxYTZa5giSnyIKcfcQ9NffYoudLiiTckzNgko
         3VCn8e3/iJBu/B6VIT7QfbQpv5PXHmoUngrcoOeTBDagOMZU7lH8Xbs3YVx32AtCxW2A
         q2OKzgWw8j11P0tpV10BVzKBKztaGXQrW0GnI=
X-Forwarded-Encrypted: i=1; AKwUvBxYvBKUHj7IhSnX5pxXNGvDGngex7TayASF2H4YE3JbsxN1CYPGyTjzgi6ogMVDAtJeD5X9xeHI2vjA7YY=@vger.kernel.org
X-Received: by 2002:a05:622a:1c15:b0:535:d7e:dc4 with SMTP id d75a77b69052e-5359fa908d7mr215397691cf.19.1791924329085;
        Tue, 13 Oct 2026 13:45:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1c15:b0:535:d7e:dc4 with SMTP id d75a77b69052e-5359fa908d7mr215397281cf.19.1791924328474;
        Tue, 13 Oct 2026 13:45:28 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535f4eee7bcsm15879231cf.30.2026.10.13.13.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:45:27 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Justin Chen <justin.chen@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Zak Kemble <zakkemble@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 RESEND 1/6] net: bcmasp: fix mib counters struct alignment with ethtool stats
Date: Tue, 13 Oct 2026 13:44:34 -0700
Message-Id: <20261013204439.3494046-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013204439.3494046-1-florian.fainelli@broadcom.com>
References: <20261013204439.3494046-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

When EDPKT stats were removed in commit e9f31435ee7d ("net: bcmasp: Add
support for asp-v3.0"), the corresponding entries were removed from
bcmasp_gstrings_stats in bcmasp_ethtool.c, but the edpkt_* fields were
left at the beginning of struct bcmasp_mib_counters in bcmasp.h.

Because bcmasp_update_mib_counters() and bcmasp_get_ethtool_stats() index
into struct bcmasp_mib_counters sequentially based on the order of
bcmasp_gstrings_stats, this 16-byte offset caused ethtool to read from
shifted offsets: the first four software counters read unused fields and
reported 0, the next four software counters reported the values of
alloc_rx_skb_failed, tx_dma_failed, mc_filters_full_cnt, and
uc_filters_full_cnt, while filters_combine_cnt, promisc_filters_cnt,
tx_realloc_offload_failed, and tx_timeout_cnt were never reported.

Remove the obsolete edpkt_* fields from struct bcmasp_mib_counters so
that it aligns with bcmasp_gstrings_stats.

Fixes: e9f31435ee7d ("net: bcmasp: Add support for asp-v3.0")
Assisted-by: LLM
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Reviewed-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/broadcom/asp2/bcmasp.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.h b/drivers/net/ethernet/broadcom/asp2/bcmasp.h
index 8c8ffaeadc79..9c9721da1662 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.h
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.h
@@ -250,10 +250,6 @@ struct bcmasp_intf_stats64 {
 };
 
 struct bcmasp_mib_counters {
-	u32	edpkt_ts;
-	u32	edpkt_rx_pkt_cnt;
-	u32	edpkt_hdr_ext_cnt;
-	u32	edpkt_hdr_out_cnt;
 	u32	umac_frm_cnt;
 	u32	fb_frm_cnt;
 	u32	fb_rx_fifo_depth;
-- 
2.34.1

