Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5746519B3CB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031280; cv=none; b=qsVasS7Uj0QiTDjt98MOhKxZdYmuzd/q4sT0Y2BJ8tkSqxjXlQBiL6f6NKbCl0cJpoJ4gmbATtIV9EIj0GJV4RhdTkrEI2vqTIZLtuB40mfV3L+wjYYNPgPiTCpuaPWt00kQiepGpBeQc095cTQvd2PueS+blSoR2F81jY/QFQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031280; c=relaxed/simple;
	bh=2Ma9GnRZ1pfxKss3kXTKJt7xWTgrbB9CuG2Ct5tdYxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cH5bK41xFV/838qZFQdXz1TVmk3LUOLj5ncoq5znWeI7W2iVIpvWIpSPqFfoQlR9hj8VPPeA9kkHW7u5rwsjYtheFjuhCxyVJBGUgTJLKFXq8PC6kBbvJH0dlUYFxxYzvvtDkYJTDDSuwGIlyU2urS8mjTuBPpli1OMoU8VBtPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=lqotXW+b; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="lqotXW+b"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so699863a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792031279; x=1792636079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vF71tENdAwcc/5EFA5/ur+3tYq0jtuBokrygU53hPlU=;
        b=lqotXW+b8ql0AMAIGsgKIIL3rLJU96oLz43C6snCIhd1Bj6U8lseqBA+yNCw+2Gjk3
         SFSLrWViSGyFk4Jw3AfJSWHZObXsBB2CmqdyCZmkBpm5ssGcyHPYP3RGi7peggR398Yt
         Qgx5We7NuOhe8nFszxxc5Bd0+X3MvPt5xOz0easkfV4ZAQbeBejcuL3Gva4Lt4oZPf0R
         LD0Mvvqie6YwtSf88jW8bdjcNJmm4tZGzifiyuSl1RtCvTL407E5RGBh10EEKT9mmuEs
         Q2H4lyyrAuPKcUl8xlXPjZ+n/2uDVFmbnCu9RVK0FygxriDN8NCaFePD5iGerRFIW9AS
         4sRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031279; x=1792636079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vF71tENdAwcc/5EFA5/ur+3tYq0jtuBokrygU53hPlU=;
        b=eKXmp2YcasO24+EdpMHFXZDcSQaYx7sTk2jBIHjCvdTWnzlmgwkE8LPR/uAICmAh2M
         WRW8mK54dO6aep8qQ/VD4jCxDUYR28EMApu0pQNzzBk4NJvk88bGebR9VwyW8h+nIAWS
         qmVlwjXKq8BC6zLVNHu7hsElucdAyc4v0Fbraxxm7Aj32+ULMBAuKoTW2Eq1DMWgWyIn
         PPheuA2k6lOlzuUowjE7DG97Z+HkFuKd/k1YsrXWpJjoo8hi32jh7bPi3GVJowxb2gP5
         t9tKM5gTVfIBY/Ptsd9O8QprT3d97LcjrmqUK+HIClInKJTO2/O7o456Uc79L+b8InFA
         K0oQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC/kFRvAD7hNt+Y9QS179r4hSyZU/L3xGjObzWFzEZmEhMgCuqnE4LGpirRdWDTDL+d5uZau1I7D+F0EI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyx9I7w8zb7pk5OnHlnApf6SrEonXC0740B3hGHJjglYM7Im4Z
	JjD4n58+l6/qqCHYf39OY48i08CA630UcjCQqS4fqvn6T09fpiesLJ/4xddkMj8Qvps=
X-Gm-Gg: AYBFou0nkmmd8YLCSc4jHrzqDXuTL/JqjtWahjMlRmx4/KT92fDrqvhI8iE4vK8quSv
	xrvBK2cV41xEoTDUpb9EZosXEz6hI//5Ei8FWPxZUXp5RznCUqF2FiXK1zAKXw3RKBYgtCqqiv2
	TdMMW9YpRwubMhSTZwWDOeKTBdnJYqmUpg8AQ691HzAH2xWiQma5NYC1EGxGe67hoV+IVYHQ2sa
	orARGLWL5wpve7wmU6V0ywhQAPvCBpge4c7ov9ALHw4/OuHQEHnCBQd2hLz5AVTSFQNS1EPjlxc
	jbVERTYW/oHuiQsXldlzWePIAH/NAiEMZ83y+Xr7A665hQIZB32R2t+/dTtTtx4Foq6qRnybNP3
	Ph0PuOkgC5ljKperDRWCrSV1UgB9fr+2UlHbWC8UR8x/aWAF7ghd6jq6adZMJL5GRGP3aLlnHEy
	rndbhuQOB8zCG03dMhwANS+dRZFgtwGpdGbmrncbYAAdPtbk6eDVcjWCL/oUTNj+e0/8BHD3tBi
	YSnjg==
X-Received: by 2002:a17:90b:17c2:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3ac5c873a51mr4065265a91.51.1792031278688;
        Wed, 14 Oct 2026 19:27:58 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94375f3fsm1997383a91.4.2026.10.14.19.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:27:58 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v8 7/8] scsi: mvumi: fix the DMA address rebuilt in mvumi_delete_internal_cmd()
Date: Thu, 15 Oct 2026 11:27:27 +0900
Message-ID: <20261015022728.3936714-8-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015022728.3936714-1-yhlee@isslab.korea.ac.kr>
References: <20261015022728.3936714-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvumi_internal_cmd_sgl() splits the address of the internal command's data
buffer across two u32 fields, lower_32_bits() in baseaddr_l and
upper_32_bits() in baseaddr_h.  mvumi_delete_internal_cmd() puts it back
together with

	phy_addr = (dma_addr_t) m_sg->baseaddr_l |
		(dma_addr_t) ((m_sg->baseaddr_h << 16) << 16);

but baseaddr_h is a u32, so both shifts happen in 32-bit arithmetic and the
result is zero.  Every byte of the upper half is dropped, and on a 64-bit
host whose DMA mask let the buffer land above 4G, dma_free_coherent() is
handed an address that is not the one it returned.

Shift in u64 and cast once.  Where dma_addr_t is 32 bits the cast truncates
to what lower_32_bits() stored, and upper_32_bits() stored zero, so the
result is unchanged there.

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 2410d2aa147d9..bd1a8c1d54aeb 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -295,8 +295,8 @@ static void mvumi_delete_internal_cmd(struct mvumi_hba *mhba,
 			m_sg = (struct mvumi_sgl *) &cmd->frame->payload[0];
 			sgd_getsz(mhba, m_sg, size);
 
-			phy_addr = (dma_addr_t) m_sg->baseaddr_l |
-				(dma_addr_t) ((m_sg->baseaddr_h << 16) << 16);
+			phy_addr = (dma_addr_t)(((u64)m_sg->baseaddr_h << 32) |
+						m_sg->baseaddr_l);
 
 			dma_free_coherent(&mhba->pdev->dev, size, cmd->data_buf,
 								phy_addr);
-- 
2.43.0

