Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918994477E5
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755989; cv=none; b=DAAmBwZHtDXTOH2o+Oel1iSdiZiJRowoZeHyJd9IwMFKVUFrofMBYw4xdg08L/fAvClQ1WDeK2XUIJo1UfLm+zOzIJEoJGS+5Onl42B/aGkNbwpCUs/3pUUgK4T1SJ/Gmh35XogE0AG4vodd26rgHUbx0jOo/nZS6sGJxTANrhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755989; c=relaxed/simple;
	bh=Sy5ZgzY6FQLduAzzhYOlwnqsjFfd4YIfVoRZ0ilt7a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=czQUIkjQR3/HwjbpGjltiq0Kx63SEdqZAMRAKHzAaiuccH/XUut3lZRr51mxH1HdAq2SinNKRuhgMaTWMAvta8h8/ZoYfom3kDphmb0VBa9/SzcV2ITskwVXpM1JhZDITt4q5zqf5BvYoKdMvV6v1PAAgkPAYjALY999WwLKpso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+1Je+5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fs0HZ6+6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+1Je+5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fs0HZ6+6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDuYCW2148528
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=z7ZnCSa7tAwp+cP9IUoZgfr7dJPO9GpoqgH
	Fzr9DhUM=; b=F+1Je+5Qhf6sjrW2LGpDMBvkz9kiYwfC7ljZJoFtG19RotT1L4s
	hgROZxtikMbIthb4ZB6JDC3my8cvdaUtsTNI9KE+tf1nNUf3pPCIKQ7Zx1R/v20v
	4/VChZmw20DTSN93XOEvXmh3BBV0nEz527K/1khdLDH8by7frWgGY9RjdA5SguuU
	Jsw79gEzkBN6k/XaE4Vqxbvs9hmnxHF9LhiBm5IjmErYL3j/LbsVD+eaYpUcLDyz
	6hx7ptLKoQU59oYBEYWkkDns4ddTST6m3M8cyMljYTcl5wdcjHkZfdeM8mLb8KQ2
	VfR7jxL5lnMpDbOFp77RfhfCveih86k3e1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1ssqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso15218201cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787755985; x=1788360785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z7ZnCSa7tAwp+cP9IUoZgfr7dJPO9GpoqgHFzr9DhUM=;
        b=fs0HZ6+6BawQrMmW/qV6ooXwjMpHOWIAeIojpPHmiTXRMIUnmOh+/cGMVzzptTut9I
         XmC/JlUFoG9EbVepSOaxFqHUIFZU/l21LZtsna+TNotJtMljPhLcJsupQ3QAHQbcCVRh
         bi1Uh2JeBxoap+A/GqItO0VZYqidjmFO5zRt9SPbtvu48W98TWZLDZo+6SrNOFsKCQlS
         eFa7EjfJsKSXQuNsWdIz4ec25kjEnc9uQnpd5z2oD93+Cx1LB9sQN1VHSrex0V7ozUBy
         4/9XI6JhoGVA2a+VuVoTVi1KLhhWX+PklR59afgRW40pnhOSy5qBc1w7TlLg9K0nmeLy
         8VGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787755985; x=1788360785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7ZnCSa7tAwp+cP9IUoZgfr7dJPO9GpoqgHFzr9DhUM=;
        b=rDnYA7F6cFGQEcclNF62JnV4dt0XvpjWfP/Le5RVRPlmk2mWzekJBLJu2lMh9hGPoY
         Cj4BnEE/hVRazaNDojKQo2Qbe5TM+Ect+7M3s4JSCmfgR74wmtgwyWCVAf7EZaNcjKCD
         5nPbDCSanKQFDx9eH7memsx8ecxxET1jivg4ZGFwCJyG/SMwobOfcYT0QRYz1KmO5l8j
         dDyD1oWmn40DiVA13gK/vbWCLFUSOQf96rzhMbJS3izRSwZCIkjcnkKq7HnrHL8JqxOM
         RPYydqNhawNK54R0uFNMCGjYt2ReQki/5vfL+kTUWpR/lCVXtggYHJXkYuwI+9Dbn9SS
         kM9A==
X-Forwarded-Encrypted: i=1; AHgh+RruS5711yhAuIsWMlB2MkgXZnszS2zbgZQIX71a0FAz3PnB58e+GSWl0MKSVstTkL+lm65hXZJWnPDZOJU=@vger.kernel.org
X-Gm-Message-State: AFuF++mmdS6f4pqedVLsyrRYwaTeQQUdnpd8J9rKAQkH0QFA42XVXiGn
	5k091Q1w4lKybiwCWgwRQY5aVcCa9w2+8wIPXt8JNCubWyczq7CrhVE6gt3pUufKQQSK1DyS6CR
	+2MEkjroFryyqmGMvZH047HuOW4BLmwaktCHxRbFL8d+H8/5AvLXrmKxabWMURCpSsEk=
X-Gm-Gg: AR+sD13DJsBQcHMrKxQx+jvbkPp/2LuzpAVMxBuigUUJvaC2DRLy3oc+kPTrgR6HgFx
	pGciUq/JcKRuSyOnWrVMGB6kOkQ87wPpQKISaCeWJzGi87OS3TZap/TUDlKhQHrs7tAeHu47ATO
	RT22LnXEkibNCzVm98cS2zkfKNZSHXTvaymIIaIe3MJxrkOb1C/pzPV3jW0FlOGz6b1kAgOc461
	rRwS5J7GkvUoQe3N+77/DNmUkvGq2vbWpKg2bcqSiy8A0Zr81PNx92pqXo+h9sAYNQHUVi1OVwI
	rkh3TjjjJ9f9NmagU30rPzBRCk8MCfUg+cnuiCAttZmG6sOUpol04IYJRVm+ZwxNOFUmaBi9Sdv
	sptNKGMLZ
X-Received: by 2002:a05:622a:598d:b0:52d:ce1e:cd47 with SMTP id d75a77b69052e-52e42234b46mr81547241cf.9.1787755984922;
        Wed, 26 Aug 2026 07:53:04 -0700 (PDT)
X-Received: by 2002:a05:622a:598d:b0:52d:ce1e:cd47 with SMTP id d75a77b69052e-52e42234b46mr81546391cf.9.1787755984400;
        Wed, 26 Aug 2026 07:53:04 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm3089351f8f.8.2026.08.26.07.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 07:53:03 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: jgg@ziepe.ca, kevin.tian@intel.com, robin.murphy@arm.com, joro@8bytes.org,
        will@kernel.org
Subject: [RFC PATCH v1 0/8] iommu: Add contiguous MSI mapping support
Date: Wed, 26 Aug 2026 16:52:54 +0200
Message-ID: <20260826145302.449904-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: --kiIICv8dXT3gWz3RtPl0hOJeHWEq7n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyNCBTYWx0ZWRfX9Iza8P5WP21U
 FWQngtW+W0zK0A4+Uk7eOOmWGqcJ3bfL/WpaWtDMPpeNRdG2PVoBD4Gc0sMsKwWRvJyPaiHStiL
 rF/vlSuZzzjx7SeuT/LCX/Ice+yOHA03gEh8Wz+cQ5z4ewyQ3Ls/L3dlpSF7CyUx52UUrJcwe4x
 mo3YgzkphgIe7lMINKH4h+q6nNwv7iWS6/OlmpSGS44rLLzNPixzveqJ96kbRg3KOTkR4Kh63G7
 n25JWYmzB3uR4vhqpPW62CqI0BGeBqQi84WlQ9q8nr3qFYg0iwKwUZIrUdclF1f4TzKqdAduSgr
 ZiIvWuW9xdkDkLFQjZld8F++/4CIPP1BVJIYRayCpMOyAroeWFZYC/iSX1ErO70iAjMGVoclOuJ
 gXE+YLw2TQ8gFCZfT3rMuG9mz/+XddT3qLG61Ln8bYI1jf4pCERF8HnSFaxSN5jYDzBqtp9WXhS
 ZE2bXp8/2nWoKaN0ojg==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8efdd2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qVCPVaEg2bWtLysX0cMA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: --kiIICv8dXT3gWz3RtPl0hOJeHWEq7n
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyNCBTYWx0ZWRfX25qiVLsUSjqx
 Uno3c3aRjgNNKtYaHIkD55AA/+JNFQzVLA0Fv8pW+QnF5BzDajIl4WBIzNkx+hvKkm26lNOUGHI
 zTqJJAE9AxqQV0pMtgahr8AUstZzf5Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260124

The RISC-V IOMMU MSI remapping series [1] needs to prepare mappings for
every possible IMSIC target before MSI composition may occur in atomic
context. The previous approach mapped each physical address separately
and kept a driver-owned PA-to-IOVA lookup table.

Jason Gunthorpe suggested passing the complete list of physical
addresses through the existing MSI preparation flow. This series
implements that idea as iommu_dma_prepare_msi_list(), which maps the
ordered list into one contiguous IOVA range and records its base and
granule shift in the MSI descriptor. The interrupt-remapping driver can
then derive the IOVA for each list entry without maintaining a separate
IOVA array.

Both DMA-IOMMU and iommufd backends are extended to support these list
mappings. The existing per-page mapping objects are retained, while
the first object identifies the complete range so identical lists can
reuse an existing mapping. iommufd allocates and installs a complete
range atomically and grows its software-MSI bitmaps beyond their
previous 64-entry limit.

This is being posted separately from the RISC-V MSI remapping work for
early RFC review of the common DMA-IOMMU and iommufd interfaces. The
RISC-V adaptation to iommu_dma_prepare_msi_list() is still in progress
and will be posted later.

LLM-based coding assistants were used during development for code
exploration, patch review, test execution, and drafting and editing
commit messages and this cover letter. I reviewed and finalized all
resulting code and text. Per-patch Assisted-by tags are omitted in
light of the ongoing discussion about simplifying coding-assistant
attribution[2].

Thanks,
drew

[1] https://lore.kernel.org/all/20260820214150.545737-1-andrew.jones@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org/

Andrew Jones (8):
  iommu/dma: Prepare MSI physical address lists
  iommufd: Convert struct iommufd_sw_msi_maps to a growable bitmap
  iommufd: Split software MSI map lookup and allocation
  iommufd: Bound software MSI mappings to the reserved range
  iommufd: Prepare software MSI maps for address lists
  iommufd: Install software MSI map ranges atomically
  iommufd: Prepare software MSI installation for address lists
  iommu/dma: Introduce iommu_dma_prepare_msi_list()

 drivers/iommu/dma-iommu.c               | 116 ++++++---
 drivers/iommu/dma-iommu.h               |  13 +-
 drivers/iommu/iommu-priv.h              |   7 +-
 drivers/iommu/iommu.c                   | 109 ++++++--
 drivers/iommu/iommufd/device.c          |  20 +-
 drivers/iommu/iommufd/driver.c          | 315 ++++++++++++++++++++----
 drivers/iommu/iommufd/hw_pagetable.c    |   1 +
 drivers/iommu/iommufd/io_pagetable.c    |   9 +-
 drivers/iommu/iommufd/iommufd_private.h |  51 +++-
 include/linux/iommu.h                   |   8 +
 10 files changed, 528 insertions(+), 121 deletions(-)

-- 
2.43.0

