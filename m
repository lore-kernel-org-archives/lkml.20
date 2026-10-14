Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A0551DE03
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984083; cv=none; b=Vgr9SebRDXsiDPMjQ8QmF56Sj3SET170DJ1feajbuLbcP+zJpxEPUzgaQutcLlpZPFHqBzEnA8GKyqTQvuioCjjEPJG1hI6e+h4wBe9ahDUItPwhuK+3AJZ6ZoOcav5LSAFzYDS7Sv54AdbBBs5Jniruy4mqEITQo3UW9GIK1RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984083; c=relaxed/simple;
	bh=+2DksuN0PXimCBlfhp3flMUyobqYYJ1LAz/bP03IRBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZcKYQnHhU4IncLMW6JIOuwIVVQAswvNxRujkMf/cKIxBtuGJePRkV4ZJHIFoNf/dRoQv/HFLbuPd5jF+/3sui/vU7uu9ikscAak2r+iXMsLUKDshQHZjlx6cxLfyXvATLUbQY27f616sB79Dz4pn9nxG9HT+wsX3jfgkr03g/hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmAnp/a5; arc=none smtp.client-ip=74.125.225.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmAnp/a5"
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-48df0245ce6so78572f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791984080; x=1792588880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mH8cYaV01On54VD3MX65wnE47n38Aav2xpeeuVOOg0E=;
        b=OmAnp/a5nchU9X8AGD7+9AAixdrpKHiXM+OI6wmg1gzkdeRfGrbozSYH3qbSbT+UeO
         1FWQ0HHX4QOjOQJw9R30lf+wVA/1k/fAuEWMw2vJGX3QW2AQ4MLHkMNZpKS5dHScSfZ8
         8Vg9baZfIrwODThd0P/sUhUI/pxV34Ym0qNTZjTiiIGk6UTvgmg54eIEbg/aLW3q+JnU
         l9/cKRn487hD+0yafcBCl7tnVqnLQcfwJq/2fhcYwCgvofTw8vNlvVoE4nbfZgv+MHW/
         TT88EQXkF3zWxZkjoT0Xy9aOS4VMn1X9Vw8Hr8sJwpX7tIA3yQJM7ty1aOMoTxKfcwFR
         gNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984080; x=1792588880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mH8cYaV01On54VD3MX65wnE47n38Aav2xpeeuVOOg0E=;
        b=aQbzWTqCgwzYfP5zL1Cfm4njLkbr1oQSAPhd/7tEVmXMNjO4sRV8NdGA9axPQZyRjL
         md743Bqc63vIbs3VT6yL7ILe5wUTPYjNtdmKCiMwg6BsWwgtF5ttegUngFpjd/q8QiTc
         FvJNVaCN0XpZuQn/eby1Yt1DLB7Y6iz7UAcQDPZrSVcVyKtBJO69UJT02d4QmRUfjLKZ
         Jr97BJh+ZZTXucImanrLi6TJnAPiB+sgQ7HbYJpWI06EHE3JFsm6TssgPrnqBj0s1qmC
         Tr3hKRBCftzYUK5cfiK3zpYEBdHDmHj9mfjxIlAsre3YFSMWaK/ujPvNj1Uil70IUA57
         2JGQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0TyIp4or8hZBEx9h1Dytdad77uA7G1ZEJYIA/mTsCDmRcZLLK+OG7LLcdWkycnUoGVwqtuqBT86kEY3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDV5pzZUMIw2qbEeymqAgaZhVPI0iNAR5g1/0m5TocOd27BiSB
	BxdphRRId3RBphZIBBHcBhxdHX4DGmmg8gAtb8K8apPPwUVs+sk3OfSF
X-Gm-Gg: AYBFou0H8KYP7eWM26SFKhDtKAtG6XebBVxt84QH/1qT1aJYrRUtELnBM4R2HBLB1pN
	EiapThs22lYoU2QWb/NVOoTYFu30/NkS8uMJxKUi2vFKSksi4AZ4n/OPpohndjxj9Tbvf9NQ3ko
	64HMkii4lFHA+ZOrB1N8vdY39PsuJ5E7hF9VHsEfpxgT+LX25j7bGG51zc7aJGmVNN/KWXmMMkb
	x4I0tt5SP8tmo7rl7dHyEP0ourZ1SuHhqrvH85D02Q29+eINMX78NBQ6IQaC1UH3U5HH++l1Q5J
	bNEZBXzQyEtZgYwGnCrAVs+iZAjBaF37nmeFR06DP0QoyW6b63Tfl02ZM/3TvgeWlWcQlhAU3ZQ
	JQdXy3TNKvTxXU3k2Zv0k34Q2VNGrauyv90kNF8WxsghboT7czswSjOIBe0eAfinWeyttmg2mNl
	N2NHzNS9w0fnfJxkHN8xCxxZ9jRLDIm/1o4fQbLrBYk5cuhbYo/6uAYdbPihOX2TQoY+iF7A==
X-Received: by 2002:a05:600c:524a:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-4a18e4a4f2amr317315465e9.6.1791984079883;
        Wed, 14 Oct 2026 06:21:19 -0700 (PDT)
Received: from fedora41 ([37.168.54.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcf2537fsm1250895e9.8.2026.10.14.06.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:21:19 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	guojy.bj@gmail.com,
	error27@gmail.com,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v6] staging: rtl8723bs: remove unused phy_stat struct and dead prototype
Date: Wed, 14 Oct 2026 15:21:07 +0200
Message-ID: <20261014132107.171964-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d355fbb22519 ("staging: rtl8723bs: rename phy_status_rpt_8192cd_t
to rtl8723bs_phy_status_rpt.") renamed struct phy_status_rpt_8192cd_t
and propagated its type through the call chain.

Remove the remaining unused phy_stat struct in rtl8192c_recv.h along
with the dead function prototype rtl8723b_query_rx_phy_status() in
rtl8723b_recv.h which referenced it.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
Note: While rebasing onto staging-testing as requested in v4, I noticed
that the struct rename and u8 * cast cleanup from v2/v3 were already
applied to staging-testing in commit d355fbb22519 ("staging: rtl8723bs:
rename phy_status_rpt_8192cd_t to rtl8723bs_phy_status_rpt.").
This v6 patch contains only the remaining change from v4/v5: removing
the unused phy_stat struct and dead prototype.

Changes in v6:
- Fixed build failure in v5 caused by leftover rebase conflict markers
  in odm_HWConfig.c.
- Dropped patch 1/2 and the cast cleanup from patch 2/2 as they are
  already in staging-testing.
- Updated subject and commit message to reflect only the remaining
  phy_stat struct and dead prototype removal.

Changes in v5:
- Rebased against the latest staging/staging-testing branch.
- Resolved minor merge conflicts in odm_HWConfig.c.

Changes in v4:
- Split monolithic patch into 2-part series.
- Removed dead struct phy_stat and unused prototype
  rtl8723b_query_rx_phy_status().

Changes in v3:
- Included patch version changelog (missed in v2, sorry).

Changes in v2:
- Propagated the real struct type through
  the call chain to remove u8 * casting.

 .../staging/rtl8723bs/include/rtl8192c_recv.h  | 18 ------------------
 .../staging/rtl8723bs/include/rtl8723b_recv.h  |  1 -
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index b63625ab4e45..072e2b5f6129 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -9,24 +9,6 @@
 
 #define MAX_RECVBUF_SZ (10240)
 
-struct phy_stat {
-	unsigned int phydw0;
-
-	unsigned int phydw1;
-
-	unsigned int phydw2;
-
-	unsigned int phydw3;
-
-	unsigned int phydw4;
-
-	unsigned int phydw5;
-
-	unsigned int phydw6;
-
-	unsigned int phydw7;
-};
-
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
index e9ebecb224a6..2f230e2d27a4 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
@@ -84,7 +84,6 @@ struct rxreport_8723b {
 s32 rtl8723bs_init_recv_priv(struct adapter *padapter);
 void rtl8723bs_free_recv_priv(struct adapter *padapter);
 
-void rtl8723b_query_rx_phy_status(union recv_frame *prframe, struct phy_stat *pphy_stat);
 void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe);
 
 void rtl8723b_read_chip_version(struct adapter *padapter);
-- 
2.56.0

