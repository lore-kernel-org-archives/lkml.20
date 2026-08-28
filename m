Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02C13D9DCD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787953081; cv=none; b=uliW8VPjm03t2Z242HOyEYVRQrU33y9CRInP32Ix0jHwKDkdi9uEbhgHT7MSYWxg6KhjY8gw9E3JY+S9h8JyNoYDwmGDvBxr6Fpt6YCfyKLouR9g6k+K9ndBJO29vZXeAkxMtkepAZCzl23m3Ka1MckSAabyxRtIzmUl4Kkk39E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787953081; c=relaxed/simple;
	bh=6k3p0ySqBDsyF/vFgmLfucoHCiVzOtKxA6qYkh5DRN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGz8Fc2j4jJQ1LU0xncxvmE045MzLAizE8cYH7TyN89Ri0XmWsWyAhz7EzgR6Ug7awgWBL71z5Ypcry+792Zv3shuzBiHVvbEPkZp+zzqlShft10gcYZEek4PqIlOtzQw3ObOKWNURFRLawUVTza4R+Jt9H0jLejvoJKU39TQ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b3OlHNtQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NEt44Klp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3OlHNtQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NEt44Klp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SKZj2u4122162
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6yZymeJtaZo5lERvmK0bkufR21pmFncW0lW87uQacK4=; b=b3OlHNtQDLxxWgkH
	vZlP6F9g/Yib2f3oKfIWTJex3sp5cnOeiBe7vG0+Bu8171znXyzSz5UFagBcefBQ
	dRZqPCUqNuU34WjVHP3QSHZFBg4xlw4545qoRVdPcp77Yx6M3r7b/dlcXbMorA5W
	753v2QuVEkgCr7ApykfewqtkSWPIlHW5zZpsbx/Y+6ZhwGujgxLqhpI62yBFkmr9
	thDvRPf7M1K3zdAPrx4R5DHTN6lcWU4XwWf9gFqR+3xly7RAgiumMRmWPuxxz6Nd
	GiKbl4ferOpecVHGyogmADW/BVzwbCQbSL5SqAZqgc2DR2/hWZaiC5pDL+u+yAnr
	Gi8oYA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbhgq8599-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:37:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso2474484a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787953078; x=1788557878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6yZymeJtaZo5lERvmK0bkufR21pmFncW0lW87uQacK4=;
        b=NEt44KlpXlwDgNnmUE3bsh71d84a8h8mLRU9KPcrJM9RWwkPiaH7dd2+qL5GauQ/x8
         6HSyC5z0LR2lNHMJCdw5JVgOJ+Rb7ezTK2nyab+xQEYPvNYUtIc7qIDqVYf/0vdQ6/+q
         1ZRI8QPRdRkNGD/DTSU4Z55y+rG7IbYONuPYRh2IqEt81738btN+gUDpwIpAxNzeUoSe
         jYD3WcNBT6ADHZumFGvTmrav2IEv5az8wrEjr0YvFvxZHB0gMpa0RzBs23G7xIvQmfJD
         eU3heMXBukUDxrbm7423bPbtJnvnvoD/t6u7cgNbjtecVIxfAEhVUbTwdKFusGcIYW/Y
         LMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787953078; x=1788557878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6yZymeJtaZo5lERvmK0bkufR21pmFncW0lW87uQacK4=;
        b=E2NRtuD0QCjAKeuy40wx3q1D1lhuFbQ6AMdCVwvII8UN3SEvQ0B3LH5reT1Y+VFsGe
         TFx+iZdhO1sfUNYIA9YLocmNYCgVzEbHiKt2xcs3nMK8YXEjtoJUQLbJm1yce2sD1lLA
         lFLI+LZ8Iq+FGh/US4W8eJ7fjEXz8DklguE/G3xRXuHnkx8KKg1N+VWuroyiz1Lc8Or3
         aj/iz0aI/g7IEwky7M0/ZgSmaOnwKXFq9qB3mJScB1UxxAsBMguvGFzWkpo/WFcbxOMH
         ymsutPLOI6jcg4nitdBz6mIYmm2W/jrKmYRAxCyPK0pZlfuHY9BfPmYzhC7UdtmeFBr9
         ZXGw==
X-Forwarded-Encrypted: i=1; AKwUvBy0eBDxku+R85QKOJofZAAKnrbrf/STFbN61kO6b/N67wXECVhdAZbFG4Iv5HL4gVTzjIKyy/pyhx0JQxU=@vger.kernel.org
X-Gm-Message-State: AFuF++lby3oDiIWIXmYiGkE7FJqoeXU0lDrUZK8OM1MSEztwXVFq8Vm8
	Mr49zaBh8KrGmcLzpE2eyFMLGdwZDN/iUQjZssNs0A762Uq9E5a1zhWPuLT7zgflY2/PLtgFVfL
	FVX56zpl0LAieQllWebm4DBHh0Pjgen1w/mxAVQCMYa4+K0rkm6AIC4qNPYh6fXam+LQ=
X-Gm-Gg: AYBFou2qA+q1R8f92jJPgpQ8TzdIFoylVL+vmVR2IGQqH6kaR1rHawPYg3+pHwOcE3c
	Nzdxvcag9vJXaMQ+4y1Yh2iUwFczGIRlNVlBgmG0JCEsMRCG5HLkUxOGk6aIBRWbz32Ba6rCGaD
	EHOzfx7LHa3j/eN3UfyhigUiO/JwGqLn7nuExV5D0KU3/cUSYAyp6gIYQX+zi1Bad9xtjbb83rf
	as6Ayh56noiBREkv/Q4hjXjjHjqcwI87ex06I4t+A/E+A9pXRViME7NGyp30DCGV4fec4hmt5Do
	X4F01tqlZ8PMdtIrjlkYN2rFu//nyqe1DQA2TuQdNoodVnuw7TNNT3ZEwv9CLQ1cM8WmU6QHXwH
	xzqpN0GJ0zQLpOSqubchH4ncf/VsVwnYOGhn7XFs68O3RZhg3OuXc
X-Received: by 2002:a17:90b:3a45:b0:396:5785:843 with SMTP id 98e67ed59e1d1-396d0f09a46mr18686543a91.8.1787953077855;
        Fri, 28 Aug 2026 14:37:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3a45:b0:396:5785:843 with SMTP id 98e67ed59e1d1-396d0f09a46mr18686481a91.8.1787953077320;
        Fri, 28 Aug 2026 14:37:57 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e41837c6sm5892112c88.11.2026.08.28.14.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 14:37:56 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:37:53 -0700
Subject: [PATCH v2 1/4] xhci: sideband: fix ring sg table for sub-page TRB
 segments
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-16k_offload_v1_b4-v2-1-8a46369ebbb6@oss.qualcomm.com>
References: <20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com>
In-Reply-To: <20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: nELAIKCRLALj0c2_fUgmQz7jzSamdYPq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfXylYFL1hWfFg/
 uEcXb4O7mnrplywNpml8KkISNM4cA/STytZqoC/Jz/V8GQdzlN5JfgCv6XbFK0wk8KWy8s1lr4g
 ptrbRXIWM4NuHQZsr/Bm8xfNYJq1utg=
X-Proofpoint-ORIG-GUID: nELAIKCRLALj0c2_fUgmQz7jzSamdYPq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfX4mHwALculn/5
 Gyn7UiZv8vDvl/S8r0gHodsb4miv7Tv+BhT7qB+zjUkB9/Y7KovWKvFx3evJKWXmiTm/WrLDRSW
 6Mw7kGADaJ50TJqq+U9Y83JtcujCMShooBoUJRb7ODlODaJfGFZpojYCDecMnZLDWpN0q1xV5iZ
 i12o0l/vvOcqA0qlKGtyiDopy8iCQlvDA7K5y/NU51fBuhp5kCKklslJOIvp2I6Puutwt64ULYL
 IO4LO1eDEB4J7qDhu45ABmPySrCeo72ug7GAOgnt4fZ0+3ucP8Br+TR8KtjX62xHl3WuHl00c7m
 VoAHRtnfRWV237gm/AdReAUKdU7VzWi5Legmm+WiT/oberdwmlaHDwx9ptbmi4EASZhq5seMkJO
 ZlIUHgSObP5M2jCUTSMeOgwFp+ZvyWxxL5L2yeSltNmYxnI4g0XSOu04KdfK/n8+h9jnEBwfUy6
 wDOdHH8fWKvaLNHLVkQ==
X-Authority-Analysis: v=2.4 cv=CsGPtH4D c=1 sm=1 tr=0 ts=6a91ffb6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=aXGjAn6Wb1zARzc8srgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280188

xhci_ring_to_sgtable() sized its pages[] array from
PAGE_ALIGN(sz) >> PAGE_SHIFT and always passed offset 0 to
sg_alloc_table_from_pages(). Since TRB_SEGMENT_SIZE (4096) can be
smaller than PAGE_SIZE, multiple ring segments can be packed into the
same physical page, and the first segment can start at a nonzero
offset within its page - PAGE_ALIGN(sz) undercounts the number of
distinct pages actually needed in that case, and a hardcoded offset
of 0 silently drops the first segment's true offset.

Take max_t() against ring->num_segs so there's always at least one
pages[] entry per segment, and capture the first segment's page
offset from dma_get_sgtable() to pass to sg_alloc_table_from_pages()
instead of assuming it's zero.

Assisted-by: Claude:claude-sonnet-5Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-sideband.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index a5deeee4d5dc..1585c47720e0 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -24,10 +24,14 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 	struct device *dev;
 	size_t sz;
 	int i;
+	unsigned int first_seg_offset = 0;
 
 	dev = xhci_to_hcd(sb->xhci)->self.sysdev;
 	sz = ring->num_segs * TRB_SEGMENT_SIZE;
 	n_pages = PAGE_ALIGN(sz) >> PAGE_SHIFT;
+
+	/* TRB_SEGMENT_SIZE may be smaller than PAGE_SIZE; need one entry per segment */
+	n_pages = max_t(unsigned int, n_pages, ring->num_segs);
 	pages = kvmalloc_objs(struct page *, n_pages);
 	if (!pages)
 		return NULL;
@@ -51,11 +55,13 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 		dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
 				TRB_SEGMENT_SIZE);
 		pages[i] = sg_page(sgt->sgl);
+		if (i == 0)
+			first_seg_offset = sgt->sgl->offset;
 		sg_free_table(sgt);
 		seg = seg->next;
 	}
 
-	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
+	if (sg_alloc_table_from_pages(sgt, pages, n_pages, first_seg_offset, sz, GFP_KERNEL))
 		goto err;
 
 	kvfree(pages);

-- 
2.34.1

