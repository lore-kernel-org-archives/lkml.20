Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402186;
	b=bObVnlAbeowfloFYtgFLSiwKNBC4LHVSq7nWTZNdjDGJsUv0JUbb916nFf0EKiMTXyT1
	 tZt5+Cvd0KnSv+GWN3h5uhRmtshnBcKf/EaTDbvFgmcgu+SwoIgu2evtKb9QBFSv6Lpax
	 ormIKhcDzTdwO+UYZso9Ib8I/cU7t5HlL4ShMohjfObfutYfZ/z0Lbi+bZyqw8tDpSxEe
	 0+klYlbTx6uig9BGQWI+HlD6LywM9SeRGlJnE02ZFjNjBSaoegYNsxHfDewX/UlZaq4xD
	 c6QVS5/jBSkiDgH8j2zjm7UMTutEkvt/Q5VB3fx8RbIClQ7CLISeDGgecIjKtJdoxnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L8WR9+GG2EfUF3UrFaA4c5ksUoCcRyLK8GiwEhxkvFI=;
	b=MiByacc+lhitSrTT27qErO6bj8DALCqNFuhIp1jrz6YjSwv2g1kuB7YR00YyRn7sB2g3
	 BeJDivXMC7SpM5dMXD6zv2QDt7DsnhN0gJ6tdX2+dSQ/91cvYUOJzgFgW4R4HtGNArM9p
	 mq7p4DcwKcyNwP0+YHQvoYdSXDzTmBeiyAf05UulDuMODci8BgIrMzq0knRYM8q1pY0+c
	 2kMoK8yW9NEM3A1oMQb3bZ/yE0IQlFlMRK9cNwuSoxOUZyrtk4Zvzyn0+flVkSUBZOaId
	 P1bQfYHN2Ktt4mqf+zHJukzd01G3erQQYedIz5Y9N3rK5NqrkJUP6QsXzhlT3JP4zOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PH9mWwXg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjzR67P8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C839D606A338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C839D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PH9mWwXg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjzR67P8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYvv83291897
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L8WR9+GG2EfUF3UrFaA4c5ks
	UoCcRyLK8GiwEhxkvFI=; b=PH9mWwXgQ5gEnifkFQhZ3anQH+M6DXWxjaYRNBm4
	8z/pNaY5400bAsBEpQNm+vBW+Q+jfqxxN8HzrTI5OzBHGZzkIlvScO/QKa7SGl2a
	PcypMhUu/gBKUX5uX9oh04q9yOC77RcAXm6BOFLzWoUXUVzVzcsM5EsBVKTYRsaf
	ij+ZkoP+ccbshZD5IvbBTtE8sEoCZpbwWmu4e2y+FeoOw8o2qNPB3O+GvjrxE3+p
	AL5/WPO/FeuqH2XP24+LiL3cpFAdsvCWMFBzD9x9fNyI2UQVztZgs07w1ZKgjDrL
	0O5WFB1GTvFsJB+TEYBpy6tRV1lwTog6SnR/2XN3l1argg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2k3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:03:04 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eac74b0596so2648673e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402184; x=1795006984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L8WR9+GG2EfUF3UrFaA4c5ksUoCcRyLK8GiwEhxkvFI=;
        b=ZjzR67P8wqGqtdDTOZihJridX5Q+5MAT9lUERZhujk3OFRjnm/V3mV6hyZLHbMF+FB
         +byN0EVBtuZuuy7pVYmilcT+CwaRmYKUJUn1DS22CGwS191pyWZ2YqgC0M32PjG0nK7r
         fdUJ0Z32Nk3ThjHjex4z18y95JXPOjKkHBew2NeXNP42a6nE9fwxzlMoOUFCPeMLElUM
         u44kv3rU/ciITpwAdoXoXmblb0bND3+tK1Q4gU+gaSRSlNag+u0LRXnKMR+hpPZQyPwk
         wTgsrQqOEWHdoXmaZhouO421u7IYZzMWsXy53ZGchDt7r/u5x/cejS8bsSnALtMQugnt
         0rMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402184; x=1795006984;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8WR9+GG2EfUF3UrFaA4c5ksUoCcRyLK8GiwEhxkvFI=;
        b=ctqfHtaUfnD16NRVhIJmNEows8an7qdzstK9/jgDOMPcZFExH8unH/0hRebFkQ3Zs3
         6olwkJjV6+7gH4KHaA7DToeQYX2KA5wlC3opI0W94j1OgXbqMKvamCOQhW8L3WS+FSh8
         pNgcplb1ZB2SP8P4fcwr3FZLcQdo3B4ftbKo7oEFm7aI6RIaWxV0maHo8TRrnNLYPC1/
         77MtTmeY5idgq67YHu1hIbFf+pt3I1q0U8Zl0yOW7BPx+edWilbwRQ0CEf8Nr1Q+p32f
         sduwdkAqqWIwFcMotThXTUgBBxCsV9kDCZl+yRNH98E/fbOvmms2RSVwXvxTBW3EyTwm
         GcBQ==
X-Forwarded-Encrypted: i=1; AL+hErEwstPRBqS2SKRjLL5ZJGfRiHhXgwLgP3dyVNKFZA9gWKqCUV/z1BEV/sN5Eg1OVsBxKAmbsRJnmC3o9Qo=@vger.kernel.org
X-Gm-Message-State: APuU4Z85sfWIRQZngodZbk+9Ptf3msvQheVlrVCbTnSeZt2JeQdS3cdg
	i8/J8QdsIYellcfkMPNjRfA1Gp4G9eaC5wMj+MyPGkX57bTCNREdfXhQXoXXe79idgoob1vaYDM
	530ectTeX/vnLyJBj2dIOflI39vdlBL5Zla0XIPOcNjrl9VU7uZnuf6EBWi1r4Phx7gA=
X-Gm-Gg: AYBFou1Le/5Wn869a1jwL2tsaFPDeKmQ1TyG+/doLWIiSJNWh4J7sfrbPr02rLh2659
	OSJ/YnKbkweVkO8pmd6E4Hweqpcr6e28jzZtfW8l8w4YtGlELLiTKn5ovC04kG9A45XWggxiPNR
	MncqsRo3FWAZor0o8aDrCu7sBsj+0/I3Ags5szqyrQkTsJ08tGTMes2ITO1PSgBmahKcVgsnO+K
	URxyYbCERSr18hYVbc1sFPVvdX0Lv7WdeDQclXQCVkpoSGsowVAfEkPrrJMvf9xebydWgKmjyCR
	hTxIVfZ5uieNbfCoWUNbQkbdgvOBZ9EgF0vbRweuTna3TaqrxHUbgTQP/EaettF1W1ZkJNTw/TH
	N3tQ+Ze+3iEAOUh5dR2pd+Q1N8hF9ogGxgWIWPaD5OhV8hQ4MIzRmeVHBoBsLv0kH5XQxxQVtZ0
	AZn/9WgB+N9GcowLCL5sFx4T3807izaPLM0J+C6zTLb+PhqWsOyLnh067fQOsnaw==
X-Received: by 2002:a05:6122:1782:b0:5c9:a7af:8178 with SMTP id 71dfb90a1353d-5ee1c2b2435mr795026e0c.2.1794402183567;
        Wed, 11 Nov 2026 05:03:03 -0800 (PST)
X-Received: by 2002:a05:6122:1782:b0:5c9:a7af:8178 with SMTP id 71dfb90a1353d-5ee1c2b2435mr795003e0c.2.1794402183114;
        Wed, 11 Nov 2026 05:03:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bafba6sm959941e87.62.2026.11.11.05.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:03:02 -0800 (PST)
Date: Wed, 11 Nov 2026 15:03:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
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
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/5] iommu/dma: Keep reserved regions below the IOVA
 rbtree anchor
Message-ID: <5pyhbuzlrk2pf3sct7zopoycvgliuvzzmd5qse65p3r63jarvo@g3clac2ao4xq>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-1-5c0f72083e52@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-add_iommu_ranges-v7-1-5c0f72083e52@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX9bWOHnGqN+T/
 aPJcCBjBSyfyGN1LKVMA9c9y9iRsN1Gd+v5mdn+q6pY3F3a1rPRYGKK/W4PpW1bR75YpQQvBp4G
 ztsFkyh/+QO6jKrHKafhy6IA6wDq61BoLOgK4zWEjSh17qoQ7nsgVh5zF9746/8wD3lF+fREJaB
 uugAZimEyUxpiKZCLfjr55s5l+K/h38VLB0yyX8qV/EMgiwm5hykkcZhWidHBc7RNvOa/a0tB1X
 0pHw+YbM+7fmWrcYlv1IyfaM5thGDzVJ/rQxer+QeLfAU72tGRxJQjSb54X3TRBcI2aNHMWY1W1
 7V/BY0MLr3XYmIFfwZB+3IurvvyJQpP4F3o0K9AOoWMmsd2oquhWhZjoVPR/CUfUcxWO6x+CrdA
 JKk6o2hLjiNRd8KYhUUJ3/CYmMuQYBvUIUdYD5HcI9TAF7yrWvwG4Ff2JSf1+rfMEC30j1t2TsN
 WF9Q9/1a6QELFpzRMug==
X-Proofpoint-GUID: ZvA1bHAhXx9ekDImemBBlr0qXLYHssKo
X-Proofpoint-ORIG-GUID: ZvA1bHAhXx9ekDImemBBlr0qXLYHssKo
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af46788 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WA2_6xBGtpbLEjlkeFEA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfXzW+UMKhQwHYW
 4+P5646cBmYS++1HTNslc9f7mvz9H92mOSjS1TPsGViAn77nLyDo6R+rhD+qQcSu8ZYujr+nUXL
 KY93nzDEiithza7gUeYLo4Qdssa1sBo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Fri, Nov 06, 2026 at 10:44:24PM +0530, Vikash Garodia wrote:
> The IOVA allocator tracks address ranges by page frame number (PFN).
> The highest node in its rbtree is a fixed anchor at PFN ~0UL, which is
> embedded in the DMA cookie. dma-iommu converts reserved regions to PFNs
> with iova_pfn(), which returns unsigned long. On x86-32 with PAE,
> addresses are 64-bit but unsigned long is 32-bit, so the upper bits of
> the PFN are lost.
> A reserved region that ends at the top of the address space then gets
> the anchor's PFN. reserve_iova() merges it into the anchor and lowers
> the anchor's pfn_lo. At teardown, free_iova_mem() no longer recognises
> the anchor and frees it to iova_cache, which corrupts the slab. PCI host
> bridge windows above 16TiB and the reservation after the last PCI DMA
> window hit the same problem.
> Compute the PFNs in u64. Skip ranges that start above the PFN space and
> clamp the end one PFN below the anchor. The allocator never hands out
> those IOVAs, so nothing is lost. On 64-bit, PFNs never reach ~0UL, so
> nothing changes there.
> 
> Fixes: fade1ec055dc ("iommu/dma: Avoid PCI host bridge windows")
> Fixes: 7c1b058c8b5a ("iommu/dma: Handle IOMMU API reserved regions")
> Fixes: aadad097cd46 ("iommu/dma: Reserve IOVA for PCIe inaccessible DMA address")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-195658@kernel.org/
> Cc: stable@vger.kernel.org
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/dma-iommu.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
