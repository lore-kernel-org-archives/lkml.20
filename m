Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFE4175A88
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349473; cv=none; b=lCY+HmBcd2o8ipEngKPfSXyE/J9RkjEfEqafCcZmT8+HlB2x3HFUHP3Rg2xunTnUK4TS952T/V7NwEaim3aOy0dqwGXh3XYjcO5722CxCIFCKIk+5PFbRt7r9k/mhmaWCfiAoe8SSoPUHWNg25+TMK0raBQtg1ZZzXyIzwPPNzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349473; c=relaxed/simple;
	bh=0+RElOVHA6/v9QdaGHpeSa5xXMjPBpsgLeJoEqQJ2v0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRVaYTLwrIy+eLWNKIK6eKmVcofSsRQWAZ5PKHOQNmR3xfQ44mbgJQAFJN2CHe+OoY6LWlspKoahFPVhL/cc4A9h44uf7l6Zawdsd9E4VzhXCauhRe35m87svBhta1PIPShcJtqD6ZMTrK5N0Tdr8ENWIZra1mPQ3BdULT7QlF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+H5VGGL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4F1q2dr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+H5VGGL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4F1q2dr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBLcuH900226
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6+ZCox6I6Xy
	vCSNnN9WRqr7BjiGU1q6t4GbQWDFuB/8=; b=B+H5VGGLe+ueTu/jsPyM2c7vPxQ
	9CEGbjpLevonCkfYu1jXP8atyL0NfsSliGZpuwdM41akpDy+LYuJf1xflxTsdzMo
	gz1ixDlMiISeeXYA79Nsv7gcKiNC0yZSnUH4uidCfgxiYvPdJEULt23ekOwLglFv
	MSkMmJ/+Nw75s+JS13BYEplEp9Cq5ZC3J2NQM/XY9djuY2bHRSR1wV9QTIrFt57V
	Z9HHd4lNcJtc9YJSxzSFjxZIpXBV5HhU4xKRSpIora0gZzPWlPMPYew3GH07JL7v
	4K/BXH4cpALd6kmOK43l6hEQGn5pqw5lNBpYspV7g1k4VIpSywB3Lmps5DQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr100rn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7a8a773db4eso236307137.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349451; x=1790954251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6+ZCox6I6XyvCSNnN9WRqr7BjiGU1q6t4GbQWDFuB/8=;
        b=f4F1q2drZhFEvCoDdUWqE3qvE5W6s0uo8dBOtVtB4FT/7s3ocG9z5L1/naFB8Qy3Rx
         jWq14bH231B97jC0XPEwqmWWWa/mBhEyhVsYxVxEQx0o2M2D7r4i1RYsZQV9MZVT2xgH
         zQJLKiS0xJTle2Me8xZ5YaRsNA8nJhtBzjFHwMWg38VSZle+EkOPYAepEgA/8x+Rc4x8
         DCdEKmslYw9xSv/9VC8hUCn83PiEFtHa7CAzpfwwbAgBLlE02m3ZP6rA2tT8VMEDYuKZ
         /cMsui/DHm7Pq6VSRnA4Uqhd39bVxJDRe6wlngYcmNoFUOG0Y5IInFy6Gpw7cWZH2dvq
         LLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349451; x=1790954251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6+ZCox6I6XyvCSNnN9WRqr7BjiGU1q6t4GbQWDFuB/8=;
        b=EZNwTdqSWMjRBWosarpnWYtC8hpe1cCN0fKAW2hWY1eCHX24qbjn1FzqvJZuf0/7uH
         Icf6w89ub04q4S+Xby/hL/HCBN8os1wrc/Zc+X53lyfyjUnfSVADS4lDNa0HWGtFCeiw
         rtKHmYrafupQG72vtjK2Rqbg7Tox035TsKIIY9Ok1CkqAvNGTxL6PAi+hzeycHHMQCJW
         iarlxV2O3f2ectBZ1TnmR/OKdx2EY/CwUgkRV+6vSaumDQvHUzrXXRX9Q/K1m9Ml8eqj
         PSWs+eeeZuz0QV7SfqGjlf7+Fd3gzwNVGLlFTdLAxVT4PO5ES/65CWtJMXNjV1qlLG8B
         ivtA==
X-Gm-Message-State: AFuF++mq/GofAtKGF+fUUupnIH2bFcZZa8+aF5OG+Lgk9w+4rzE4KL6e
	NxCAeIAYZIuhU1raEv3rLg63lDb6cXAUtA20J13BpMiJ8a80zQS2Wf1vS9c4bFg11cbnmo563sg
	9sTse+AtAIOukt0/xhfal1ZgnviRBCzPaK16j9ENJvCKZuWc0WXVZ6cZRcxLajDohD+k=
X-Gm-Gg: AYBFou07zgtm5Vs71tgORNpDu0n90VXD7S39GqGYFCNRCiC5RI/o9DcgvhvP13nX/+0
	hjrCHyt/CZikHQnQtSdGTp7QB1lREcX03tIeA466Lv/sUHTGtbhL8jZpo2PLUYibk8HVKIpI3cx
	A1Tr/2MRj4EhdhFKfcngMq7tqzozqAOxk+2sz6CONX/4mbjZg+BGdwZN53W0GUN5+vizSFMFiZh
	HDufdccWeM72pGCzHcFqxkNYIJ9b2+JDpArxToIEqTLKQEsdKnn9rMK+dn6V3OUsUWH8dREuzrB
	SJomyKldnCOdtbqYaK2wKgW7B7vT2Kea87WVJclMCXNWDmgVTqUMYroAchTkReI3pN1uMiV2pYj
	BNNittF6vAj85ghSiuw2F2clKHUGmnDN0eiiFBQ==
X-Received: by 2002:a05:6102:4497:b0:7af:4a46:4c12 with SMTP id ada2fe7eead31-7b1c4a2ca24mr880487137.2.1790349450930;
        Fri, 25 Sep 2026 08:17:30 -0700 (PDT)
X-Received: by 2002:a05:6102:4497:b0:7af:4a46:4c12 with SMTP id ada2fe7eead31-7b1c4a2ca24mr880459137.2.1790349450416;
        Fri, 25 Sep 2026 08:17:30 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm8224246f8f.4.2026.09.25.08.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:29 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 15/16] riscv: defconfig: Enable IOMMUFD and VFIO
Date: Fri, 25 Sep 2026 17:16:58 +0200
Message-ID: <20260925151659.419512-16-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX95bynD0AsYIM
 CIGRLBuSVpRIB9i6T2VQxTs0mkiQzh2n+FDfdc5VVeeTQAhd5Fxpqo/O9aZAxjj8m28leefPgat
 3NbyIXsyE0qejHHNHBSdrmbJfk1simlpXZygc9lzsYa2Wztymc7IMSWhVB1AghvANb6pn15iWv/
 31FOWCkv0VEPGZph/hh6Ad5ZxKMHLm+r6+zW4KI0UI0Cpms27wAUrUUk5lb1PqXIRhUMMg1WB7Y
 QNOpR1s9/1dF8qQR0n4Y1HeNBFakUxR05G5aJUqHyY951aPUk/5np+1eY1HbbJua9rkLvNACjMw
 qhSEpfC9F0vyRRbCYnrRLB8rG7WIkU+kzpATlqUdFCXB/zIGZuFHIYs54lQOFreCz7ZR8ItFKwN
 BSMgUwMTIf/X1Vg8F4uEBLgTRdrkIeainrwpwOfLBij4g/D5zt81Q+Mk9+QY5xMaE/5bEsLINju
 FBghWTwPB4gi9a4c/BQ==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab6908b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=B9Crq1QHcyRNgBBHHYMA:9 a=zZCYzV9kfG8A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: -gwL3y5rtvm7Fn0pV3-0vJuHPfbwSHAO
X-Proofpoint-GUID: -gwL3y5rtvm7Fn0pV3-0vJuHPfbwSHAO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX+K8aOLAEh/M5
 t56ommBOyLDJAQXZng3Ot+yPB34doqXqdFREAHR6ue6mC9zPAsDnde5ZQ6/S7W1F1hAS0lWTeiJ
 KPKe6qjCr0FyWxkqkfcu6qkHXK5dPSQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060

Enable iommufd and VFIO in the default configuration now that the
RISC-V IOMMU provides the DMA and MSI remapping needed for userspace
device access, including assignment to virtual machines.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..daf382c05441 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -251,6 +251,10 @@ CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
 CONFIG_MMP_PDMA=m
+CONFIG_IOMMUFD=m
+CONFIG_VFIO_DEVICE_CDEV=y
+CONFIG_VFIO=m
+CONFIG_VFIO_PCI=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
-- 
2.43.0

