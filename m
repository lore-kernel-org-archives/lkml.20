Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D15C3CB91C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 22:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788733816; cv=none; b=Nxm4Su7CzBr8Pw74gD8HrVTxTcAYjRI2PmJq5F5hUl/Jad2ngS91LstL9z0k48OmihWBn/DrYM7qxQNnVaAfghShajDQDai8UqNqEnQqvMOL5cDqALBHapRpVlmpFupGEk8xJFq/4VfXmmy3M+XG3MUuJ+eqq1juaZFbeHyfOZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788733816; c=relaxed/simple;
	bh=9HbGVBX5TrUvmHuy2p6Fy4BIU2dMPYb8NT1I6QaaWgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SPRSAzhhrlZ6daKMgbReAyIge4jmQoSRZh/4yMjW89UAR/u+vraJ0dGB405pZt6S9oOk0vLEIsSjvzEZ7nLzRJuOykUj3a2hXeWiXSIw5YmhS4sZLrm7ye8sbhEUmTJKDI5SO8q2KnLZrWuEw9ZWMYQRhnFRkU+bLMdLHRHogX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=O8JDc0Bv; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=TLSQ7Wrw; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="O8JDc0Bv";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="TLSQ7Wrw"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686K0lEa4165882
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 18:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=xck2
	l++QwEZd4WONax1e8sjGplgHuiAYa/+vfb+E6TU=; b=O8JDc0BvfzTwN6A71kvc
	78sjNRJxVpN/LtRo4j/7YhBigUx8UJsv2dCE7CVn1vHEcyBkhZHVAinddv+0Hy8w
	UXgT8SnKhvVR42Ct5faorkOesM159X0DUh47k5bwnc58lBh3MNllVI+n/bchXm07
	teAc7dyjVtheki+hkVZ8I5x53fFO266nb9vvdPxtoE2mBnqSM5HDjZcFnInEDiLJ
	7jFcRmFMCu0XPELpt90OcNX0Ob0NaUIS87LkDB/sXJYrXI5VVFe+ZXg7Mg6SpcNQ
	Au3VMRtm9Smjc6fEVfjLYghEaKycf5TlNXBaKzlKD4l+j/0IsGr7Tu2Zjud89Ric
	qw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gheub0gct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:30:00 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53088a3939aso2385451cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788733799; x=1789338599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xck2l++QwEZd4WONax1e8sjGplgHuiAYa/+vfb+E6TU=;
        b=TLSQ7WrwLeBrpHwVBbVM59ei17LsWIio9X4VZIVeahnkQQeR0W8A5hZnZA6RsnT+LE
         lY+VKmk9f1cxS+2dnqHzbBv9kNamMId4ghvEYgDuZr7zvxj8UyBeB8MX7sB0u5O1EO8P
         LCqQxJeWJN08kntOlRA1SlLnX3GtIuaCeJkq6PuHI8xFOI/0bXHIqIk+A8SzBB2uKF94
         z2Uip46j/LTvf5eVGlgle1X89ZBiSe27CfNzI4yGajpAYHCMLxiIL4gvrR0/wZRALG+H
         mqD1XFIdpZ4JVnnBaoTyNDPzwc8EgtoUdiyvecrSO2JRBCSOYGgxqRj1CeW9Yk9fgwsc
         Rqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788733799; x=1789338599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xck2l++QwEZd4WONax1e8sjGplgHuiAYa/+vfb+E6TU=;
        b=E3RA5Bd7NyQXwIR5Ld1cw6KtUJsUxraqxQrvU6+9XzbKHiHjyOd1S4zG0KQcTQPio1
         4m7QYGq2mbI3sb8+b8Lj9mhOHgDeaFmcB+4bnA/1R/e9uKUegCLq+7XxXlhFjPpaPNA4
         W8pvWkHjR0fAFD8wZDKUB1D1CtpRbHBt0SnmW/pzGvgk46rDK/DjhbQIHMcm884OrOd6
         Rrw3bo0saUerY9UKaFuzuihmA2A5nzFFCjqMn6wSqDrKzlwmhiPd7bhT2+CHm0n3srHZ
         1QPCrEjCKnskbstQPP6qEnqU9/6IKYejAyHnpZ9/5UQAEc0c3XbNz4noX2SGGMAfThHP
         QkwA==
X-Forwarded-Encrypted: i=1; AKwUvBwqeB/9II9RV5IXlPX77jz0YkjdrJiBIWDn4bUFe2hTXlaYoWkBAuQ1Ai1pkrZC2zcT42hdNH4XrJ/ez1U=@vger.kernel.org
X-Gm-Message-State: AFuF++k0ByZt5g43OknnW8xVIuxGe6RkZQ5oVerFKiqiEZEZ3R6C7tI9
	m1LUWNTKVF1TUPp9iZbCZeRlgXHgTqpiXHbTomdYYX9jj7BTBR+XF7WT3rG2JBVrFasvj7KCQLJ
	C7XG0RedIn5cC9aSkITj0fFpCV5GvAZeiHPFK8wGNuXwHTEnjaT7g4Ywe2YsexQ==
X-Gm-Gg: AYBFou3mfUUY0xjgx/t9+vIyT2nhEE7ChPD/FQMkdC/oHBRTZdM0clkysLH0IUQCiPj
	31QhYoL8qSAViUBFFhGmm7NfPDMhASxDFFye4incXk6VJg9X+FSD2UUj99HD0MiYbZx56RIoz+0
	EjaCXn+PkQiWSxfHN3TFocjkbTkYFBRYH/yN1Oo/33fIubwi36DhJHSjb1nNW0dCWamXP2oQUoR
	IGjT5WRi2US0eGqVfbJxzYBQULH9XVZmIcWWatpUZyK0QS6C/bKfh+Khp5UBptvFqykhPzSlUCm
	Nl/9+WDVQH8LmLp5qfSCBSxxWNEgBQonce8GpsKB12qUkrT19dISR/SnkIFpu+kO5vRzxX/v81T
	op7NEch92IP+nRJ+gRyW2ykOWZgc5UzrlZ1yMXB877NEr4zxz
X-Received: by 2002:a05:622a:4cc5:b0:52f:b6a8:9e56 with SMTP id d75a77b69052e-53054853b18mr211370801cf.19.1788733799454;
        Sun, 06 Sep 2026 15:29:59 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc5:b0:52f:b6a8:9e56 with SMTP id d75a77b69052e-53054853b18mr211370411cf.19.1788733799021;
        Sun, 06 Sep 2026 15:29:59 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-104.net.columbia.edu. [128.59.176.104])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a7b7sm73048541cf.3.2026.09.06.15.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:29:58 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 06 Sep 2026 18:29:35 -0400
Subject: [PATCH 08/10] btrfs: keep the free space cache inode mapping at
 order 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-btrfs-folio-conversions-v1-8-834b9d7b06f5@columbia.edu>
References: <20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu>
In-Reply-To: <20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788733791; l=1277;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=9HbGVBX5TrUvmHuy2p6Fy4BIU2dMPYb8NT1I6QaaWgo=;
 b=Of/A+lVYam6wN5OKQ+C7xZ6FkPUqmt9A/7NEW9RznOiCgNOVH1zKFmYmibvLBYCpSsm/08TJn
 uFA1jQtT3sPAi2a2MJxHQLmaV43zZCufcZWTFu2cKM4wCG7E66jEVjX
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: ZUGLKO5UblZcSwW3ojGhKjtNIkRdwUpF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfX7a6SpEfq/tub
 iy7eKSYBG2ggxDw/2vDwd3bBOOUWghJWcAZg3zhvWGd2lxEfBuhJetR+A5EW0DNHTlUYPtl1k+F
 btsbgGN6vmhUs5hi8nryWJQ050ynHh6TXuSGy7QbhuxxlUzF5Uku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfX1warIOIhJDFL
 4tXvmLaX8gzr1uTEVw5rYwzc3Ezk41nm4IHrOCye1uKorFZJG1ohLQWcZway4vFHGu4gIPrjT8J
 qMiw5rslA8b7y7LJtRvfhKHUfT2jbs43a4mkAhAYGcrFBHqPs0svbonBUvFJSJq8AQOfEDuRzQJ
 qY1yZys3XiSNE1epjdlPfq0BmnFzsLXYP1AZGC9lcW8U5nLHy4CI7I7tWvigy+4T6LLjwMu05I5
 uYBwG7qekK7dQNduf1ARuFZvXnMToimUuy3CGj22Cy6qHBLftdJv9nNjy9N+LTauKfbqeGlkbzR
 LDXk8eH18cniod+DtcBF2MSr1kwUVCpfrvmCnKt2PJmwXK8N6zo5otwtFXrBoXpCyeSn6bAXl2W
 yMc/aK9w7xFBO3f1oGvFq81lF80Rsr48r70PgNC+Na8XUtoRCNZIJSjTeN+Vda7uH1C0QqEu/wB
 Ph0GnIWgokhU9eOaiNw==
X-Authority-Analysis: v=2.4 cv=HrJG3UTS c=1 sm=1 tr=0 ts=6a9de968 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=aNLBvxxoObQFLnBXsbaGlA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=CzLnJ1dVjGlFsHvV59sA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ZUGLKO5UblZcSwW3ojGhKjtNIkRdwUpF
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11898
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 phishscore=0 lowpriorityscore=10 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=10 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060252

The free space cache inode is a data inode, so the read path enables
large folios on its mapping. The v1 cache code assumes one page per
folio. With a large folio, consecutive __filemap_get_folio() calls in
io_ctl_prepare_pages() would return the same folio and deadlock on the
second FGP_LOCK.

The v1 on-disk format is PAGE_SIZE granular, so keep the mapping at
order 0 rather than teaching the io_ctl code about large folios.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/btrfs_inode.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/btrfs/btrfs_inode.h b/fs/btrfs/btrfs_inode.h
index 89e5e9c0c904..5d85aa69db13 100644
--- a/fs/btrfs/btrfs_inode.h
+++ b/fs/btrfs/btrfs_inode.h
@@ -502,6 +502,13 @@ static inline void btrfs_set_inode_mapping_order(struct btrfs_inode *inode)
 	/* Metadata inode should not reach here. */
 	ASSERT(is_data_inode(inode));
 
+	/*
+	 * The v1 free space cache operates on PAGE_SIZE chunks and assumes
+	 * one page per folio. Leave it at order 0.
+	 */
+	if (btrfs_is_free_space_inode(inode))
+		return;
+
 	mapping_set_folio_order_range(inode->vfs_inode.i_mapping,
 				      inode->root->fs_info->block_min_order,
 				      inode->root->fs_info->block_max_order);

-- 
2.39.5

