Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307654FC8FF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188417; cv=none; b=oedVvI15kZlpUAtRrMxnYscxa4Y2GCQ9uFB/86bA5Q1mzI1Mgg5thPpO9s4D0h/lgzZMPZSuX2Qtt96yEQg5HFJ9VT1zFqBrejdWs87z1OQ0fechxrq7EsHYOuj36Rs85B1XhZeXnAEonKp9MY8ryeLpWrlLrX/8VdaAIIhpU7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188417; c=relaxed/simple;
	bh=oTI9lnA5nbjrxciBQ498nnak3FdH2n0sumiIJz66Poo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eT8Dy//hZxL1UEA2EPx0L+0ilhFVoQFAyirWbXASQ3SPrhvHathYcZg3ROuk54hQ6IhH7s51jBBJiuEPPOV7EQnMRfNCI3hPnaA0n8Qst/DoB88eTKnW9UHNklUg0G8l/9UhjF+oaYOlSFwX9IJkU6gnJeD4NLEWBsy8wshVohM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgdBwRPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITI6ymnR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgdBwRPK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITI6ymnR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETQ2w3296600
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sXxW/4DEUBO
	CwZCmYrY7nB3sSKdx+Hk1vdDeS7TRF7I=; b=XgdBwRPKuAeWSavL6oW2JczLZjG
	eruDKqXwZhkDW9VXSRqb7p93b8wMZmjMP2uWRLyyZp0d6Hi4f2lhZjpbhuRCgHyS
	wqYOxXVcdczKG6KsxWZqXHXT3bVm8wQ5f4ODYRGjv86K/rsKEBEdwMG6p/CcISGU
	rjgC70ovoDBe8V6y9X4wLg1y+/vj8GrHIRdsXrkHbL21Hm9xLJCKc57jN9+GYVPx
	JsHMgoQDJLRefNAjblb4tTe5qq4F1I3ePdl4d23XQsn69weEJmfOUVF95m9JUNc5
	Xhv4niPvSAnyS6eft7ByFTt6d3hjg+YWAXZXXiA3cpuzSVTKSrLyfOJUXiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6ayhj1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939062ecda9so432260285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188413; x=1788793213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXxW/4DEUBOCwZCmYrY7nB3sSKdx+Hk1vdDeS7TRF7I=;
        b=ITI6ymnRbE1DW8D9REcRWcj0RdjddHHlQMc1q3mHGUqOkA0sKEIYgbcZjJAz0WR892
         qS85gDJ1ZD+XxF5aamAI0ZNYdjsPNTzkBt8H7FTtOyxqBoIEVKSNSWfscDC7zd0vugjy
         tFBOKEmNv2xKUa5tHloGFJTLDTfyarIAjhYwwkYmzBYx38ndiMdApavBiyz+Qem1IpJU
         PcrPbBRAqyycpt141rZR7oXYAmBMMJo1HdN0fie6OaNHnmAE+fvi9evNjGa12nQxzYd9
         thzx1KTFCFk8S7VnwQ85VDv87qqJkj/3eNao5W/z5k3GYqBWd7ab3Uq6N/SpLv22Ykqz
         rGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188413; x=1788793213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sXxW/4DEUBOCwZCmYrY7nB3sSKdx+Hk1vdDeS7TRF7I=;
        b=XL+F4q7AVSUUO3FDEYQntUboRFKq0In6RtLx2vh1GlmDq7R0CTD7VcWg48EY0lD0iZ
         f42/lVGkh+FJbUll2ZLoFpkKFcfSYtqgXP+a2p9iM2KrU+WZTR5jfmZ1TnFUjqoJDSI8
         n4IB2zV5zcOjzvyFbVL+7lt6iZwhVPb6vJw73HXt93m7u+8GQqqsLZ2At44uXYeXGHRk
         3oObewEVWAGHNA3gsoyRUDNcfbBq3pK7FGRuxO0OcQfYKqaGlmtnZ2biGm+QwutQFX1u
         iJ2MbPn1fSsee8w+xgQnQ3hvRfnoNCwv+Mjq+sG/W31RykuI2Whq8XMUNtF/BHYJjiPc
         Svcg==
X-Gm-Message-State: AFuF++kzDmvE0pjEVVzxfs2gNBsKhC54P1xVmIrHV8LGG3iFyps4Qs5A
	Boi1E+CRW1D35mEqT8/4jaVh6CrUZ6sY+/6ByBDyYAarENKK0HBmdq3mhhbTA7bd4lAT7yKeYRE
	SAyhbkKNTAz/P3ofXPLQriUPHEHzi9KKXd8dSmiV7g2uVxIjpvQSnwy5NzCvYo6w0hpM=
X-Gm-Gg: AR+sD11PzW1EYaHK68kDIhoVBHmJVGU0ZysuZGKLmaJln1lCrLKAXOrCKiB+cUeVpcJ
	vK/ff0ejANjXi/1d9tWtw0Rb9FpFxOKhtdnNILL9j1rioPQXJ5TXeoq1CRPrxOMFrjkBuPMYN5O
	Z/r6PK0VQ/rO5RoOSUhCEUYbzfVVMZXd3DSbxjkrHCB8szm2sWBiU9wLsR39bV9qgRaZUg361Om
	29D57GEZiXuW1Lp9QBQF8EcQRTOafP4iqjB2eGH6PKi4r7Aa24qoKuDlM/zmP59gZrp3+yf6zXN
	rUx9NNFXu8++vJ3+7+hvBOXIwPJecHfsR7fiBZzHDgHvRKbVU/UJyM2sr4XtO/ufVDIDpe4UtqT
	6Ze0fgTGkd+DD4Oe2IRrGyR6NE80Ptyx3dM8=
X-Received: by 2002:a05:620a:f05:b0:937:5ab5:53f7 with SMTP id af79cd13be357-939481bb845mr213388885a.43.1788188413212;
        Mon, 31 Aug 2026 08:00:13 -0700 (PDT)
X-Received: by 2002:a05:620a:f05:b0:937:5ab5:53f7 with SMTP id af79cd13be357-939481bb845mr213370085a.43.1788188412396;
        Mon, 31 Aug 2026 08:00:12 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc61cfsm414356655e9.6.2026.08.31.08.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:11 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 16/17] riscv: defconfig: Enable IOMMUFD and VFIO
Date: Mon, 31 Aug 2026 16:59:42 +0200
Message-ID: <20260831145943.313726-17-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX86X8IT7XXKts
 A+uBuO8ppSgEvBYgcFrr0Ochz4ZQc+9CFei8BtuLH3crhaZd08qBchrauGN9nzthNT0DgMyWTah
 wLEgJMREiEWLUfgWbpYEAnKnpr+xUac=
X-Proofpoint-GUID: uJghS1YdpLRIvh5ZD3G5tnqgdEiiB9X3
X-Authority-Analysis: v=2.4 cv=CYE4Irrl c=1 sm=1 tr=0 ts=6a9596fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=B9Crq1QHcyRNgBBHHYMA:9 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: uJghS1YdpLRIvh5ZD3G5tnqgdEiiB9X3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX60av8CbrGfB7
 ZK8GO5EKULCU1AOxTN0ZV75mckebe3Ma3vjORLMLw3X3mcuxDI84RRTZO1iXhYPdUIbnLSy0vdN
 D9fUkhiMY5WbWIm8tIJzol+2qXZDtbYhojEpkYaFEeOlEfS9br8xKb26hnrBVZDSd15Mbjr9kt3
 53e7A41IaIG9WhnU3y/OE5k9eV011o0lVAv+WWp6rM8jysfiHsDAkA/YDI+JqY8XsLoHv0AAKB1
 ivLONFM+0VUL7L1oO08gzeyu4JFooHXfYQKWJITBK6ehDNkOCHtiun3vMQ+Sw+TkUvFTh2Sjy+G
 rDiK/ITzTuoy7jxkxVuEtbXSAXufaPycjVWJoafrOMnQrI9b81Y0/N2gN2RscBllhcotHtWxmMH
 lg4i1Gpnwx4H1wP/hsPlRk5qEsSydA+JBfp6nSRBqAH2A1hI+4hTXQx3CYtOQGx0XqWAe88s7Fe
 c1hMFWKEFpVRi0FyDGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

Enable iommufd and VFIO in the default configuration now that the
RISC-V IOMMU provides the DMA and MSI remapping needed for userspace
device access, including assignment to virtual machines.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ed605b5e3162..bae9a0f32f89 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -249,6 +249,10 @@ CONFIG_DMADEVICES=y
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

