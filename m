Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985324;
	b=Uj2Ju25dOQiHIexQQueS0L3bqhoGzdxH1OiNzVBX+uG9KX15oDGBsWdpC6UCtg9QH2MB
	 BlPY77wR+z3hd3FBt4TMxp8fyIGGqW321KX8EKtm5J86dvg5u/xgv3MQAiPPitefqbmC5
	 bLzBofYcrldZmBmJrL9RgYvRmogZGPkwjG1GivcQ4+xd6QsAAsbu3zeMXYMghVtFxBKyt
	 9ikiwToGAunepf/8iNwHsF5y6SHMfYxkmEGzKQ4nPb6jb22wHdblnt2W9lSHzW/rHkd2k
	 EkfCoZNNECfHJ4efOHVCYGTtVHlPdTKNK2+A6XJFu+gbnW13FPi4Og1ot8TMTB9dtxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985324;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QIXG4hC3yAJsmesG5E8c3J8k1seOlbSXEBkKniP6NFk=;
	b=0lWno2Qp9fwq6dAK+kFRVryKoNY+YAlsww39E08U6QM8wPohCmy01Uh+MVnjUHTwELwo
	 y9uXN7r9btVfrHFXQJKZAt2HMQ8V4Ma6HniYn27W/SHqZSsPYXbGqWmyDTBeAK6vXuoE8
	 Au2nEJHGbmzY+S28YxnqGDL4mObE8SlsPu1o5qVxHchrbjozo6HtlGaZVL5J4YH7pJB1p
	 vUz6tT3V2Db4E3Ka2VR8jF3517omX8jKBqJ6pX+PlnS0lRYWjkvnkv4X9pZHAiCtXoqvj
	 DXacmBaTJd8mles64Sk3aEHha0vurnYxvAj359i3Hx346dyYGVYoxwOncP7x4NaoKgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CWp3lA3Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IqSWzs6l;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB23606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBB23606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CWp3lA3Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IqSWzs6l
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Exw1o2670638
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 17:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIXG4hC3yAJsmesG5E8c3J8k1seOlbSXEBkKniP6NFk=; b=CWp3lA3ZBUkp7Fol
	KBi1z85YbvC4Ff4EFM48+Xn7Eqdk9aEcyUzQ406xTDaux23vDyYkIz9jEPk0lJ5P
	rPBzMh/seGrgl5g/hIvVahi1yVqaEtvgeKZtxoIufjZahTCVsoxYE6C/Jqk3kf6s
	hwq7mJmRGNkliz3jREdoBRzAzZB62Gqr8L0ZKybwMSVYk7rYMUQdjBR856l3/qVK
	m1EgHrXjSJc5RNx4Basgl7U/GdAgv8OOnHUpjq2/ZxZh/h5wxKWcAHbn3HuIymHi
	1EdQ/D5TOfahmjntC+L1j+Csi+VS0Njjsbn/jbZozEPqs87nw0hibGDoMvLR2sA0
	NzLASw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcbubr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:15:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1524224eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793985322; x=1794590122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QIXG4hC3yAJsmesG5E8c3J8k1seOlbSXEBkKniP6NFk=;
        b=IqSWzs6lN6+es0MAhSDRjkDDhmaQugEBpYAW2CKBEzue5cxQ5QVZ4NCYlyhFauaVSB
         6CdwYLXDqB8f6S1cu6fwmzwI2a9bbJHCnn/S094+Pyk21TfJSjfMulYCXcBZmTjL9q9d
         GM+vFVUEznChvzWfwH5Kp9osjv7JVUTMEz7QigZF6nljSk7+olKehMDccTb6rzVpFiGx
         gwmIGaX0myqEdsycnVJoliSmsh5hjgLwWVXX3a1tIl6Tke4nncG29Plh3LQ85xBwhxg8
         7afXVEGYlhoeYeYiIHW42kszaMvslVd8di9ht8gLnokccba//bsqDU6wYQUBZ6gtQMTQ
         BsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985322; x=1794590122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIXG4hC3yAJsmesG5E8c3J8k1seOlbSXEBkKniP6NFk=;
        b=CgnVRICOG6m+xtPs8qe2FMlIi20Mk+qbPmBDggbenPMHYGY6TGGtMeUj1mvoM0oE9M
         Cjy/USVDLy01NcN13PcrgvrNTcFeYZiTbVG1BDYPPD1MYZgKfzYFyPbCabjSc05+EZ4u
         9G/WEY68RVKvbk5GBfK5t17eLZV0Nkr31edydUGczbstr0IMpSAZ+UiKGOP6VDHJZVHk
         242ilHbf0vL119ccctxfkRyjrH11EC/dHb640kgyOplM9DhExVvYH60ad4aW8IJErC3W
         Ysz2sLjp6LUWq7liwU8cYNi+JS05ulvOWOpJFDXp16v2LQ+MwULPspIAsxf8No6QzMax
         /nRw==
X-Forwarded-Encrypted: i=1; AL+hErFrRE4CCnp3ngPwLV6lgS6Jaz5X6xHSzCBuljObp8MFPRsatksAWsOXW5jQmIbLN0uWGeVw24rt64YL5Os=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pQAuYqrDOT5kOCRHNQ3HCrn/L0fdkrqDz52m3XHsAakk8S05C
	cLe+jmHInlb/gLE28QNRNhS3dFrUof6ECZUvVfJZeQWIayNAXLRjy8KdxTt2sE+pPzJt8iZw5tN
	3ZVDOWWsMajuaExKlnBNM5NGPA7GGs5FdD/QIK/G2rDTQ/4bQh/Nz6mykFRNZHTUPjBU=
X-Gm-Gg: AYBFou0xKeRwim6RzUBChmuQUrJV1BN4oRaouGU8ZiOVKNutXzoxpTwzj+6GYFFKTKI
	IEEsOPtlivsjlV+Z3OqkzbO6QjhSamnG3mDEstM+VlePJYO0jb8riIMA+cup7qcdtHHiCrb0iw5
	iY3H+yJE3xJBfmThgcUhBlWkJML9TEnTEz/GaoIQAphBB/tzyPC7Op0FPIYYYXJJMKLYE7EMumK
	/fKqwnT5QB9gHuImmcdmHD3brvk+T9k4O0PtfWn33Z+gN4JoEJkIZLbuqj8zJDyE7Nri2Aj5NMs
	T/m5kXisTMjUw+sANBKSuON5ENXt9U5EhEEWyA4tTZypv40DmhQ6q8XDk6XHl0qqbQDgUORjTEY
	BWMBWrxrQyFuSZuyJgEq4Gg00VQm2N/HRaqm+gFdxqy6wjuVI0QLSgUhlnav9/9EeiTkjx0gZE6
	KHtrWBSSxV
X-Received: by 2002:a05:693c:600a:b0:36a:3186:b712 with SMTP id 5a478bee46e88-36f76023b26mr3971956eec.20.1793985321810;
        Fri, 06 Nov 2026 09:15:21 -0800 (PST)
X-Received: by 2002:a05:693c:600a:b0:36a:3186:b712 with SMTP id 5a478bee46e88-36f76023b26mr3971885eec.20.1793985320950;
        Fri, 06 Nov 2026 09:15:20 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm14693756eec.15.2026.11.06.09.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:15:20 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 22:44:25 +0530
Subject: [PATCH v7 2/5] iommu: Use resource_size_t for reserved region
 length
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-add_iommu_ranges-v7-2-5c0f72083e52@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
In-Reply-To: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793985294; l=7235;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=llMLpfQId9UaG2rP5mXxqKjE8GpDMlcPgKGb0UPmgHI=;
 b=xOQtRH8sZwd0gtSU2fFskz28Dk4hc+HSvL1AZEsMm+mQ6tli2NY766/rhiLsr2TyCT8PTBDrr
 OAMPQHcGFXHDLPeeE1jhZGBbjPHAf+2djrReXZOQxJ/wO2HIwXTG48h
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: 6Ca_vStRytV9PmIhdKY9nZdJRHETRUtd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfXz+P9keXVlFMD
 XTVpfeITbaTU28Lif4l+Vqgcgc5auaqULMIrVYJSOAOkh0BDyKYQy66afiippR5e07NOG10YyLB
 xPET3r6Pu8EFJyUQKY5p9ioskbrJMOaUp3wa8HJX6yPEAHvadwmnGDbfoBjZYb+HOkT65ENnh5J
 jslbURDTp4SlZtKN/kJrc5pXLPcAl0n1zYPx3odWiZ13azPNhGyjRKoP1hiG04a27ZfnUUe5rY4
 oesmfqj1YLRJgIs3f+aUPdetNwfNBl67sPadQ7PtYzViMgmGpz0ShHW7V48SP66as1YyUj1WKpX
 APgUhrlt1ns7xZnXZEA4RYj8XlCAhUVF2yYZk4XaAfjne8ezVCZe5NAu3TAm1zeMl2W7Hnz53XX
 ms2yku9P7d5HyOM4FlmiqjK3g6N6w6HmGImN4RvBRq9NwoYDtbEH6W/mEEtXEdWf1RLJxNbPZyV
 jMtOYjbHFHAhr+Yw43Q==
X-Proofpoint-GUID: 6Ca_vStRytV9PmIhdKY9nZdJRHETRUtd
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aee0b2b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ljjM-8V9AhcL1OkpCucA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX7c3HTHb2ENLO
 LnATPUoO/vVu6fJwEij/rkdpWOrtEkRnmNM/mBI2ip5fbGNKfTA2Td+Pl/qpwrMTa0AuEd6vKA4
 0QX1dxMMo3H3EPf2CcQQonEF/8dwLdQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060068

On 32-bit systems with LPAE, physical addresses are 64-bit. A reserved
region can be larger than 4GiB, but its length is stored as size_t,
which is only 32-bit there. The length gets truncated.
Use resource_size_t for the length so it matches the width of
phys_addr_t and holds the full size of the region.

Fixes: 2b20cbba3390 ("iommu: iommu_alloc_resv_region")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/d223ee9f-b262-408a-a201-8b16d310bbe0@oss.qualcomm.com
Cc: stable@vger.kernel.org
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/amd/iommu.c       | 2 +-
 drivers/iommu/intel/iommu.c     | 2 +-
 drivers/iommu/iommu.c           | 2 +-
 drivers/iommu/of_iommu.c        | 4 ++--
 drivers/iommu/virtio-iommu.c    | 2 +-
 drivers/of/address.c            | 2 +-
 drivers/vfio/vfio_iommu_type1.c | 2 +-
 include/linux/iommu.h           | 4 ++--
 include/linux/of_address.h      | 2 +-
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 960e1dc05ec69b346d1af73241dfa51393b0851a..179e6c28afe6f86c233d9d7e64abb0870095e985 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3327,7 +3327,7 @@ static void amd_iommu_get_resv_regions(struct device *dev,
 
 	list_for_each_entry(entry, &pci_seg->unity_map, list) {
 		int type, prot = 0;
-		size_t length;
+		resource_size_t length;
 
 		if (devid < entry->devid_start || devid > entry->devid_end)
 			continue;
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 5a2e705a2f2e025245d4b42c4a9f765c67d708d4..70e210ca085ff52519376358a3e3b7a01619d7a8 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3535,7 +3535,7 @@ static void intel_iommu_get_resv_regions(struct device *device,
 					  i, i_dev) {
 			struct iommu_resv_region *resv;
 			enum iommu_resv_type type;
-			size_t length;
+			resource_size_t length;
 
 			if (i_dev != device &&
 			    !is_downstream_to_pci_bridge(device, i_dev))
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index b486b8bbd1fcdc359d936234bb3f8631306c8786..18f3efb94043ace9f1f4abc7c6ac8974dc25b0c0 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -3010,7 +3010,7 @@ void iommu_put_resv_regions(struct device *dev, struct list_head *list)
 EXPORT_SYMBOL(iommu_put_resv_regions);
 
 struct iommu_resv_region *iommu_alloc_resv_region(phys_addr_t start,
-						  size_t length, int prot,
+						  resource_size_t length, int prot,
 						  enum iommu_resv_type type,
 						  gfp_t gfp)
 {
diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index a18bb60f6f3dfdba853b6e16dd2a8616f6a731c7..5c266511db78910d6fd221af5437cecff4931c22 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -170,7 +170,7 @@ int of_iommu_configure(struct device *dev, struct device_node *master_np,
 static enum iommu_resv_type __maybe_unused
 iommu_resv_region_get_type(struct device *dev,
 			   struct resource *phys,
-			   phys_addr_t start, size_t length)
+			   phys_addr_t start, resource_size_t length)
 {
 	phys_addr_t end = start + length - 1;
 
@@ -246,7 +246,7 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 				struct iommu_resv_region *region;
 				enum iommu_resv_type type;
 				phys_addr_t iova;
-				size_t length;
+				resource_size_t length;
 
 				if (of_dma_is_coherent(dev->of_node))
 					prot |= IOMMU_CACHE;
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 587fc13197f12227e69aedbc721cfd49cebde2ef..a37e713b0678a516a777436d616f0d3df54eae38 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -483,7 +483,7 @@ static int viommu_add_resv_mem(struct viommu_endpoint *vdev,
 			       struct virtio_iommu_probe_resv_mem *mem,
 			       size_t len)
 {
-	size_t size;
+	resource_size_t size;
 	u64 start64, end64;
 	phys_addr_t start, end;
 	struct iommu_resv_region *region = NULL, *next;
diff --git a/drivers/of/address.c b/drivers/of/address.c
index 499d37ceae210ac844eef853aeecbfabaaa5e138..f665432638a6d1cc1ebfc0d2356b813c8c584910 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -655,7 +655,7 @@ EXPORT_SYMBOL(of_translate_dma_address);
  * Returns a pointer to the cell immediately following the translated DMA region.
  */
 const __be32 *of_translate_dma_region(struct device_node *dev, const __be32 *prop,
-				      phys_addr_t *start, size_t *length)
+				      phys_addr_t *start, resource_size_t *length)
 {
 	struct device_node *parent __free(device_node) = __of_get_dma_parent(dev);
 	u64 address, size;
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index f7addfbe1aab4f6fb662b8b2fa66bc02d98b5f03..9f508143505ad9e603af1730e811c30bd5edce16 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -164,7 +164,7 @@ vfio_iommu_find_iommu_group(struct vfio_iommu *iommu,
  */
 
 static struct vfio_dma *vfio_find_dma(struct vfio_iommu *iommu,
-				      dma_addr_t start, size_t size)
+				      dma_addr_t start, resource_size_t size)
 {
 	struct rb_node *node = iommu->dma_list.rb_node;
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ef5043752a3651419679316c5a20cdf049efeaba..1d8f9381a358ec2309503bfe2866f08a1f236b2b 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -306,7 +306,7 @@ enum iommu_resv_type {
 struct iommu_resv_region {
 	struct list_head	list;
 	phys_addr_t		start;
-	size_t			length;
+	resource_size_t		length;
 	int			prot;
 	enum iommu_resv_type	type;
 	void (*free)(struct device *dev, struct iommu_resv_region *region);
@@ -968,7 +968,7 @@ extern void iommu_set_default_passthrough(bool cmd_line);
 extern void iommu_set_default_translated(bool cmd_line);
 extern bool iommu_default_passthrough(void);
 extern struct iommu_resv_region *
-iommu_alloc_resv_region(phys_addr_t start, size_t length, int prot,
+iommu_alloc_resv_region(phys_addr_t start, resource_size_t length, int prot,
 			enum iommu_resv_type type, gfp_t gfp);
 extern int iommu_get_group_resv_regions(struct iommu_group *group,
 					struct list_head *head);
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 0cff9036539168b0cf2826ee34417738a4836ace..ae6d96c8c110adad966f2c1bad2cbefaf55e5c57 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -56,7 +56,7 @@ static inline int of_range_count(const struct of_range_parser *parser)
 extern u64 of_translate_dma_address(struct device_node *dev,
 				    const __be32 *in_addr);
 extern const __be32 *of_translate_dma_region(struct device_node *dev, const __be32 *addr,
-					     phys_addr_t *start, size_t *length);
+					     phys_addr_t *start, resource_size_t *length);
 
 #ifdef CONFIG_OF_ADDRESS
 extern u64 of_translate_address(struct device_node *np, const __be32 *addr);

-- 
2.34.1

