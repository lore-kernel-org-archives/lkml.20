Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0514E36C1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606404; cv=none; b=C2eDRnsOfiAg9peBL767LCP3t4hX+9E8yGBclZCY+/Q7T0y/R/cONS3HC6Bh7A83tcg3TznWHg0Gh4dFZfGljKS8RYoiOdpyXMPXgyp4c7zaFLHP+/RDFn1Dqi6FZAXW5WXdAIuvIhyUBHCq0qIfbEjdIFKIpTb6lcxVpL1hj+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606404; c=relaxed/simple;
	bh=NhHWvvnPrKHqhuhNVk7ZQTsH1c0AommYN33kTZIBFec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sa9bO7G8/pVhmtRPu73XSbq01+DgKQPRNFJFwJTN2NGJMPt9SjqjLioylsZIA6OHD7Jy6won0v25odxYtFFmfBujmcEaQAE/nmE80rV0lFs4uvUho7cr0PDLumZNmu4KSX6ywOzJFGRH3Fm7zWZDueU69oMjdgibbqbkNQJGWX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQh2DnuU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d17EIRds; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQh2DnuU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d17EIRds"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBA8bu481586
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x8hihcxDh4v
	dXDXwpEyXNTTs8PuHmt2UDYR1utBPvS8=; b=DQh2DnuUabqm9/ORt7u8x6SNgJO
	S0gCMFqIFtppT9jcPG2Q6KRvgguxsg1JozzSSBSYi8titOZc7N9/gGHm9wQ3mLTJ
	hxxHYX6s9abAAp6b2yAx5XO2t7NvToQBApOkiqfPF7TRHts6Dr068OABC5A7fXdy
	4Rq22H/pscgK1b/9Jg+ccqKL7NJbKEBAprYPCbT3jFs4Y9uJfT2TKVjG+dr1Rf1U
	7L/CEsC94Liym0yKEG1ZbW28nJTLwJVKNxPEivUuPlZVLUDVNhxK94isvVcJbEro
	vzzM0sTIiJVQpHWx97vcuYjJBWN2MgcW54sAiuvW2EEoKviePxi24HmVJqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt11vrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:39:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5332e744789so42479431cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606391; x=1791211191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x8hihcxDh4vdXDXwpEyXNTTs8PuHmt2UDYR1utBPvS8=;
        b=d17EIRdsSpERXym739KirKg7WP/Qc66zcpTfd4hnRL11Ywkf3rf7K5ScFC13B7YFOt
         wBsXvXOQcgZssdGRtYd1uHNuHbPxtoSUYWi5kQBoUb8e2UlBpuvhvxpZFcKAH2rohF1k
         OZADuZxQCuFNKq0wteDxtcXuLAwOWj1V+RhholxuSemJ3ZR/2KWcQ3UrKwqJBhOIglPx
         ql+NSL2gO5KGyB0m1avNdAobP5ixnJRNEGMiSE7jjJ1byX7cZe4Tb9QUSig5M/yr+sxG
         TzDKjbLM4Wy0Rk7C42YBF/GBbQHAG/bD3+jB2kcmiS4iDdsOe08a+QoF+BWRUyuRUc9c
         pjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606391; x=1791211191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x8hihcxDh4vdXDXwpEyXNTTs8PuHmt2UDYR1utBPvS8=;
        b=O+6YUjBf4RGzDgn3JP5KzjCG5Nuvh5Z+02fjwpesRmh0k8tPd74f1NXB8Pbo0AltFb
         ZNmPufqG/tPCANHhRJbGA4TEctfLcHh55SM3mxilyt3ncQqRARpp9EM3l7R/VU+K0Mqx
         Fqk5VXvxXfmBGLJNGGPtJX5FREPlPGjj2NzZAgKi4AaupX9wd9RDmoEyBvlD7a+L2zyU
         ujLmStC+EH9uBzcT3xoquxy9oWuEyP9S0rAyk/Bb+rso1SXRE+hKOyjPGkk1xrDHsJIO
         8hF4ff1mXEoN8hl+7gZwK+3sbQdmXyCMYFlwcrXACXYs7vKNh8nGG2Raw0VjLnl0vRlN
         9arg==
X-Forwarded-Encrypted: i=1; AKwUvBzAkBxGMEpqsLZrDoP2i941LzGR70bkXdFQAtaS87vuKkH4cJ+Glw1ocyPtdxvREbew1e/2nDbAT4tJRBU=@vger.kernel.org
X-Gm-Message-State: AFuF++n/kg7bREP3ivwp0HdfQhOqMMLCG8ujCVTbIzlu2IATHi4QMKJb
	PR+jmFQlVrVmWATGN5gWsrH+xpNgTkpMirM9yD6OCynfRUUdOh3OkJhWYap+KQMwN6dndDvhgtv
	0UMvjSNkWRyGWxzI5sgZLGVIknGJYyoy2qvAjDdbYLiwBQLe6ouQ5t9j1S+bdRcXyd+D/zPmFLV
	c=
X-Gm-Gg: AYBFou3xao91wh3oHPWQ+s9entioI9Kp37PA5XP6T5eCz3E9LMJrSQ4yTQg8pGQF6X7
	4vkrv/C/7vZlDXr+zqnO94bCClYQpR8zDhQqM9lGXnI1Vs1h9bfZf3UUbXZ+aAItYOi77QM1Ju1
	pKAOyDId23b+INZ1KS8FSLa5mPuMQ1hpoocRnnIK3FqTq/WniXKbejbffxgbXjF8n/NSYMR/cJr
	tZhZSgbISySfVJF2feMQjzSaiIhUKJtAQCfA54o4CZRpGc3IK0zAyK5R+gTMBz1UkdK4s1GQbAr
	x8EJC0moco9UN5GsngWOjQcwJOh/I10bqzaFddb2KzM6Zi4lparN6ZxRz90yup6k8mTVjtzOSh6
	tSvJBnKgyzU0ihTdELbtEZ3n5OpxmxO+gFQYG8w==
X-Received: by 2002:a05:622a:4c8c:b0:532:969f:a6ab with SMTP id d75a77b69052e-5330b6d1528mr238462711cf.51.1790606390510;
        Mon, 28 Sep 2026 07:39:50 -0700 (PDT)
X-Received: by 2002:a05:6102:36d4:b0:7b1:6028:5475 with SMTP id ada2fe7eead31-7b1602862b3mr1832613137.12.1790605901953;
        Mon, 28 Sep 2026 07:31:41 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae6069145sm488812866b.0.2026.09.28.07.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:41 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 05/14] iommu/riscv: Derive the IOMMU from the device in IODIR updates
Date: Mon, 28 Sep 2026 16:31:04 +0200
Message-ID: <20260928143113.49838-6-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfXyNU5nL9ORA7H
 OvPm4dZTo8DIHyHbrVeLQk/fvKYcjlfUcgcUwBXcMTmSrunV9y7rUqmUqePqGe0tbvYj8Vnjhcf
 JDHOp2kvcD12fgDyI/wTPokdoPEqh7AHHiyHdCBiwm7TOvnx4bjjaTaF8gMWDZI+v6fwCTDJAKj
 G3IBBvg7BIFevZGRPK43XGFKGNwXwfdydawSI7xIjkR4LnxZug2AklyLgz5q61DvWyi0r4bG2/7
 ZdQcBHk7ojSq+RlIgKq+voCF35udpazQNVQn3TPV0hzpguxMjmpAr4ByjS5mr0qrOYg6oucNu9Y
 kOrFM2Q+kcsmsPFdEOIEVdQI7WY960gMRbtas8imvPLAtom0var9Jg3/uyusS87hO5Tnr0AXkc6
 xr76ymr1cfTbq9k/qxjUrze1UkuEyzcFQEdUWvdSBm5G8u5nrZ3uCoKbUf+GMW0X4oCdthbOWzn
 10DhG9a3fRyhJogNcXQ==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba7c37 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5LAesA1oWso2HGznwIcA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: cPWnWfn3WEeevLMFjSbpUksKIAIvqq87
X-Proofpoint-GUID: cPWnWfn3WEeevLMFjSbpUksKIAIvqq87
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX9yc9STP657a6
 RFTasWcjQ6U0eEsG94u9tKytqS6aeH/byya4KUBB9xpV30+LDqsULKcql8KVYH6+0DjmH2H0Sjm
 pAIXq34PaOZSZRYY/bv4vxA+UBQTQL4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280058

All callers of riscv_iommu_iodir_update() already pass the managed
device. Derive the IOMMU instance from that device instead of requiring
callers to pass both objects.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index d48667112cd9..2cee87ffc122 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1265,10 +1265,10 @@ static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
  * device is not quiesced might be disruptive, potentially causing
  * interim translation faults.
  */
-static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
-				     struct device *dev, struct riscv_iommu_dc *new_dc)
+static void riscv_iommu_iodir_update(struct device *dev, struct riscv_iommu_dc *new_dc)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_dc *dc;
 	struct riscv_iommu_command cmd;
 	bool sync_required = false;
@@ -1514,7 +1514,7 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 		return -EBUSY;
 	}
 	riscv_iommu_bond_link(domain, bond);
-	riscv_iommu_iodir_update(iommu, dev, &dc);
+	riscv_iommu_iodir_update(dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
 	riscv_iommu_msi_tables_unlock(old, iommu_domain, flags);
@@ -1660,7 +1660,6 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 					      struct device *dev,
 					      struct iommu_domain *old)
 {
-	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct riscv_iommu_dc dc = {0};
 	unsigned long flags;
@@ -1669,7 +1668,7 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 
 	/* Make device context invalid, translation requests will fault w/ #258 */
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
-	riscv_iommu_iodir_update(iommu, dev, &dc);
+	riscv_iommu_iodir_update(dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
@@ -1688,7 +1687,6 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 					      struct device *dev,
 					      struct iommu_domain *old)
 {
-	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct riscv_iommu_dc dc = {0};
 	unsigned long flags;
@@ -1697,7 +1695,7 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	dc.ta = RISCV_IOMMU_PC_TA_V;
 
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
-	riscv_iommu_iodir_update(iommu, dev, &dc);
+	riscv_iommu_iodir_update(dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
-- 
2.43.0

