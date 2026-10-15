Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4DE3672AF
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028173; cv=none; b=Ei3PESeBNdIZqxMjNecP3OQdt2PWodLX1kPuo4inDXisPypPtvJB4CG8ess+/4VTKxgPge//pHrzhm2ubpGFp5JhZPR6FzMXXG1cKca0vAvgkbfeGy+Tp0zj6/zIeTgSTlpS6zozaTSfrTvWNKkehoHb+GJXeW5H5wLZG1zwXKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028173; c=relaxed/simple;
	bh=DAdtTEUZtFUeBHnOkeUrYySm2NLUFnvIrS8WFRdGNlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IMECdqRcveaCvgsB59VYvQMmcpYlJZ2TjYBZiAspAiyKjVprwL5Qt6hARPMNmsyg/56pyTulLH4PJPrMLBUfjIe2uxU1k2JsI/WGGCFX7em+sv3CI+c7FPggB5XH94YXuI3lD8dA2HTDmIeSunVd93+6OP1y9nNktQ+kq6uePDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=h0Iwg14o; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=W8mJABjP; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="h0Iwg14o";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="W8mJABjP"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F0XkcV3424781
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=GJ5b
	+6wmoMaOFvcGByrVJwisKvHFAIIDntUfxnLnHrQ=; b=h0Iwg14o22dTHiALns22
	OWskSrREK/4zqKzJ+WuLdj0PAGkE0KjIgxNGltiEwZKU9cS7XaZKH//HxesSiJuf
	qvbSCxLqW4a/jkv1sTX+nu7LkYHYODsr2q67smlkwJMR2x8i9mkelyKd5FWZb6+3
	D8WQMe/v6G6bzkENJPUG10WXx8ckq2xTmXYiEx+zTwdGDcih7cd2/H9iMgeFz85h
	lbuW6wOS8HdUN+xCK7p2FgdxvLXMrunBcA79pXBMTXuDP7z67vUtaEI+IcL32OMY
	aezPW07p7IOzx8csjEMX8QZnsEKXifxSnS4kbqaDP8ywQsejnkGXE/0x/YWcUa5v
	Eg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hah0esmp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:36:10 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5358515b4easo88197111cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792028170; x=1792632970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJ5b+6wmoMaOFvcGByrVJwisKvHFAIIDntUfxnLnHrQ=;
        b=W8mJABjPQCFN1TE5EhpgZXN/8EuA6YSRdLO5NSoRd5sPX6qPHoyJ4dcBffAYLMzYMK
         zuEJkPlmIKsfGZE3yFnK6hjfzZSYAIcErydi0AbsQNKJo1YFQ1IYZEsTD1FkTrfBxINh
         zP7UxPUEDKABBDREkzQKwT7Zi6ewt5a2EXgctqx5Jpm4eWM4j1fouzqFVfe/bpK26S1u
         xOfxcVNJxNK3ckMuxb8EfAVFUhAPUzVwWaollAv1w8w3R45kCtbkuREkcBaZIE/09pag
         O0qhVOZ7+2XF7LeQfgPjNkbxwE4M+uM4vbLPzvdNEjlZPgwAN1qF+rDBhQ6mVAzQQ3Rv
         bYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028170; x=1792632970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJ5b+6wmoMaOFvcGByrVJwisKvHFAIIDntUfxnLnHrQ=;
        b=pJRzG4I3xwhTrnjzd3mP68ZY+IawA0zv9Ro4yxX25iqzNyAQumfH7HS/v/Lcat5+5e
         83ml2KCV3KT6anYUbQIxKtd2pO4Uzy1CrdlaYZRQjz5G0C+BRMqEr2nrdkgXKfFQNwgi
         Ho1haJau6/8Rid14Lgtc2CguqhHHxfIhUIprdHKQSMvDRAupKSnRX+BSZ8MP8YYlp1Mr
         +/R2Wx91vmFA7k4ED2uO6PCCpp/IJF2BINlLiTr1d1Xy6zH7xL2Xg+R3FUkBAbxt2W7R
         +y7aWUeecPXcKQfDQK7uCWzZqi6PGlxiZ81x+HkmPlfVQtsXpuytVvGpSNNMiYMciyJe
         5wdQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/C9kJAe27JAAo8uB/B47WEQ2lyFgsIg28Tz16LlcOwIXHHs/AHfkS1Bpk+KKwdmEwhwUj4mgmTl+3+4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUCBICA0ou5vc2GNdeatrGv61IxcxNCvRfg63cq3l0YC8LZhFw
	7A4xfw2oeoPXIKmWPrVJHsTX4rRQJvYwyQjyr/iHngFQmzfEe1lfroGNFqQADPJgzrVp47e2CyX
	HNKLuwEYLv2e01mnF3pWN9OxwakqRXQgSOmvOy68ZseBNI3556qE8/URSscQXig==
X-Gm-Gg: AYBFou2I5BHP1WY4f1y6hRAjXWml7/7Uro56HwE8JwOBufJEDyqGh8BCMUaiTGvuynW
	eSdKQGnqvpEPur8wAT6+2GQcMePD0PFBgBdgGit/0EMY32F3LjFZojWrEB57ShA3z/1j9u6JqCD
	H7Rm9ihJ+8gl4zXH1/TeeGbb/YBTpssTkW3/it6IEG9cIG9VfISVfpG1LPiEDyIgPwHXFYt0OkP
	OMw11KFsYBEmYoATzSIs00D7P/iTJQeHqc0VyfxaucGunymHx2dqr6nA+ZqyEFYnTOZODnI/vx6
	y+HPXRphH9Ns0y79kDOQFhszTKOs2hqfvFkSRecFnppz16pj06bRoxmg5vM92ROiaig2moQdvNK
	NLjhFjGYkSZ1wKrkot6YxBgo58r/MNgGfj+LNa+4goKk0
X-Received: by 2002:a05:622a:4089:b0:535:19e2:6b79 with SMTP id d75a77b69052e-5359fde869fmr262889941cf.54.1792028170013;
        Wed, 14 Oct 2026 18:36:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4089:b0:535:19e2:6b79 with SMTP id d75a77b69052e-5359fde869fmr262889781cf.54.1792028169566;
        Wed, 14 Oct 2026 18:36:09 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5361279a933sm12657661cf.6.2026.10.14.18.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:36:09 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 21:35:47 -0400
Subject: [PATCH 3/7] ecryptfs: use kzalloc() for the header buffer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-ecryptfs-folio-v1-3-f4412187b1d3@columbia.edu>
References: <20261014-ecryptfs-folio-v1-0-f4412187b1d3@columbia.edu>
In-Reply-To: <20261014-ecryptfs-folio-v1-0-f4412187b1d3@columbia.edu>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792028164; l=2395;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=DAdtTEUZtFUeBHnOkeUrYySm2NLUFnvIrS8WFRdGNlU=;
 b=abLBYK8OIX2D+DYNB28lIQh0Kdjc09GXY4s0dDAN0C7JSo4qZhSjOXnybv1cYIHw1fT/ZYyU8
 DSbxMSwCEQgAzcq8EAv8Gd3LhBZ6Ls/5aWFRiQE3s3A36Omtxg3RDAx
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: 57PIL7Y1b4NS5zChiF5j32naF1AtSrzo
X-Proofpoint-ORIG-GUID: 57PIL7Y1b4NS5zChiF5j32naF1AtSrzo
X-Authority-Analysis: v=2.4 cv=e82T2qp/ c=1 sm=1 tr=0 ts=6ad02e0a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=JWifYr5Owm72-P8M7WcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAwNiBTYWx0ZWRfX62zAxA/xAAiZ
 SiIPUwuoL9hMAeC/xBsHKMgRBPc0XbrgDM0AF5jZyUXF8OEp7tXXBfR/FYhxwZRXOWKNCzPDyVq
 z03YoJSnEsLvkQXZ88vjRm3LbZDTXddDxuQxiGugCARfc2V23tuE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAwNiBTYWx0ZWRfXwYFugYButB0t
 5HiN67bb/JwJbM4jsQrMjOft1v8t8yA753WUD0LlofJuJXw7xrPisy/L8Ohb9zQiKG8RR5vzF/O
 VbBu5RtNKxM7wZaIOqqvWbFVCLYsplHCyybvoniIiRAvsFwdALyiEnLAtRiS5JcGHaGAVT90Swr
 Usop4t5g+ddGZ87vmbPmUGT/6VZSGB6h32BucJl1y0hktBkeiP5PzN2C5f84S4ey2QFTTdqUspu
 +mZsb6c4I4A9eLecGaCKcbpMKHwUXTOevBUqG7opmG6gZD3a8HQRAcxwFhtiM5iqpEGLSAg2wse
 fP0My+vtVcf7WtTS0ijSx3Xgro2eGJRVYN9IONt9Dv7Rwz6dpe7w4Er/n1rUui+xlzjid0aTP5S
 eXVVmIOUXZcY79sbUYrSHFOZrfyWe8badAyrPcroPHTP5hTIDybm27xOVijJVwndhzxgq/agr7F
 /LKl5jCODq0Tv6WvggQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=10 priorityscore=1501 bulkscore=10 impostorscore=10
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150006

ecryptfs_write_metadata() is only called when a file is created,
where ecryptfs_set_default_sizes() has set metadata_size to
ECRYPTFS_MINIMUM_HEADER_EXTENT_SIZE (8 KiB), or PAGE_SIZE if that is
larger. That is an acceptable size for kmalloc(), and the buffer is
only written out with kernel_write() or as an xattr, so it doesn't
need to be page-aligned. Allocate it with kzalloc() and remove
ecryptfs_get_zeroed_pages().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ecryptfs/crypto.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 9b8b0c5a81cd..6a014872e919 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -998,17 +998,6 @@ ecryptfs_write_metadata_to_xattr(struct dentry *ecryptfs_dentry,
 	return rc;
 }
 
-static unsigned long ecryptfs_get_zeroed_pages(gfp_t gfp_mask,
-					       unsigned int order)
-{
-	struct page *page;
-
-	page = alloc_pages(gfp_mask | __GFP_ZERO, order);
-	if (page)
-		return (unsigned long) page_address(page);
-	return 0;
-}
-
 /**
  * ecryptfs_write_metadata
  * @ecryptfs_dentry: The eCryptfs dentry, which should be negative
@@ -1027,7 +1016,6 @@ int ecryptfs_write_metadata(struct dentry *ecryptfs_dentry,
 {
 	struct ecryptfs_crypt_stat *crypt_stat =
 		&ecryptfs_inode_to_private(ecryptfs_inode)->crypt_stat;
-	unsigned int order;
 	char *virt;
 	size_t virt_len;
 	size_t size = 0;
@@ -1046,15 +1034,14 @@ int ecryptfs_write_metadata(struct dentry *ecryptfs_dentry,
 		goto out;
 	}
 	virt_len = crypt_stat->metadata_size;
-	order = get_order(virt_len);
 	/* Released in this function */
-	virt = (char *)ecryptfs_get_zeroed_pages(GFP_KERNEL, order);
+	virt = kzalloc(virt_len, GFP_KERNEL);
 	if (!virt) {
 		printk(KERN_ERR "%s: Out of memory\n", __func__);
 		rc = -ENOMEM;
 		goto out;
 	}
-	/* Zeroed page ensures the in-header unencrypted i_size is set to 0 */
+	/* Zeroed buffer ensures the in-header unencrypted i_size is set to 0 */
 	rc = ecryptfs_write_headers_virt(virt, virt_len, &size, crypt_stat,
 					 ecryptfs_dentry);
 	if (unlikely(rc)) {
@@ -1074,7 +1061,7 @@ int ecryptfs_write_metadata(struct dentry *ecryptfs_dentry,
 		goto out_free;
 	}
 out_free:
-	free_pages((unsigned long)virt, order);
+	kfree(virt);
 out:
 	return rc;
 }

-- 
2.39.5

