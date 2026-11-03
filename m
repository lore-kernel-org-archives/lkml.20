Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699863;
	b=HJyX4LqAgx2I47Ie3/Z+dnIxswNW+fvM+Kr4oYIzUZ8ihUmTLHxpbDMS59OVuBsgAE3o
	 dMD4XdxA2I/UGaL+PEjexsqjLVNmxQdJzsor9fFUtBXMKpVrCuvoBajiQUtq8cRwlfTbp
	 s4v1H8QckLfQgog31f+WbIRZwtNGeH2qgkOba0EWqySucmTty0ilXqJ5hwsmI33T9l0eh
	 c25/Da4X10zcT+tPnofTUTbbDPXhfRt0WIug+t67ZCUMcPZ3ULiHsSETmznlR0zJ6Jggr
	 O1obOM/Jn2PDxqQp87Gb3WNfA0C/ISNoice1PCrMUC16s/1Aq40yXpXjYBIRQCKXNeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vykUFpmUN94FUZNYd6DC6+nPEP/pk2/rhE9WhU1TWoU=;
	b=11A/ABJaw8kapUNdCSflFCQ0xdo7skW6hLEiNx51C8k9yIwfkdaP3Lz7wWC0wojNL6Zs
	 B6eaT3uZM5FIDi2qUQfcBCEu4x762swS/QwM6USkb3FxyV/VQ93z67VzlBfgCxAXFIz2t
	 XhWJvMdjVvJYBBBSCKDwE3DLIBLzt8nX8OkYysOTPhrk22jpzHAveFlfMCv2SJPmbo8Lu
	 kT0uwucSytKZLUUzghRqZrOmhvYoiEqtGUIL4DvMZ9q3GhnZ5Cy5AgK86OWJHDHXet+wf
	 LmM2wkLjMYG4WBj8Jf2SWhbS2+H4z2znFEA2dL5iDDvWR6JkvsPYBxs0hlN65LXF3Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C88IFEOp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AVjm2FOJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C057D606C53A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C057D606C53A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C88IFEOp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AVjm2FOJ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38Q7RF2106878
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vykUFpmUN94FUZNYd6DC6+nP
	EP/pk2/rhE9WhU1TWoU=; b=C88IFEOp4a+5FrSX4DOuIqAicz7UrZV+Mj9I9oyZ
	UWq7pYdYLu4khws/bokefYL9kiV9OUXO887kdlrQigsSFY05V8xaB70Txzrl88pr
	JJ1888e7oxFrADiI5joiW3xNwY1wPHKVhvjExyXANzLy1bPm+TCW1PiCbVZShhoU
	bLsEWzc33E86E1+1w7ELnE19+O7l1kgZvMSS1mSOIa4Exl7H4wQlSPB41H+uqe51
	xKrWCwWH9IxEJCp04r6dA3MKHz/yYx2PooQmyVTWlS3hDnH7rZ5mjjvwmFlbSrBh
	tEagi5xCVvdHhCAVU9GYcqIvVHeuTTp8sEsfpzrVEdHp4w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m99new-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:57:41 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ead43326a7so569847e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699861; x=1794304661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vykUFpmUN94FUZNYd6DC6+nPEP/pk2/rhE9WhU1TWoU=;
        b=AVjm2FOJzrzT993kKQgKUKv18l3TtuLkxzhAPNnFUi1Y4STZMeCvHhjJua2y7CbtGE
         2nsU1S35yoKBSBTyrExgLDIE7+xrZfs+jr4/WHzAVdxpt11aTwngzSthfJDKvcJ1TKbd
         kVw/61AkgF41BMAvgllDgDxdIaa2bkYctbd1Q11PEamW0+WHpQ9Ha5uc0GUp3jt8pqaM
         O6aTRnr2qbwa6WZFYb/ZdcrzjH70vBbwVjuKkluJTOG99yHGNYuw57z5iIeHRTM2GlNg
         R32schtf7ZRBxPQH9QtNmwdh5u1/zhEZHOXGEh2MRtPUN+s3cX2Kfx9kqHOVuUy/61h5
         JvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699861; x=1794304661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vykUFpmUN94FUZNYd6DC6+nPEP/pk2/rhE9WhU1TWoU=;
        b=hbcRiMcmmcmmgtJKcRLHkLWlMCmNxE65kEqV/EU2sH4jJantQPxYjiTMJ1kfvmI4Lj
         en4kLrwiA9ybm9QUmn+hFLENwLMcxp3pDGo0HyGW6r5oTzHwz06iy0y5r01NT2Ina2qs
         mZaZuZv72ZMom5lNi/iGp/cwqDF4WJ24lwAhvLpx8AH4TYLi7UOu6C7YnImYRZBlLqtA
         OfSMgrmdOvsnpja8fOZQz3STeiuE9CJLVxL9xsw2+TXWODxCOxHZPWsW6CGAmesq3Ipq
         EhvNSnlyGDxx8eT6RrF9lzJyXY0XiWUd2wuoiU/DZ2MmK36plsV9glMMGelRXKJrcNTj
         W8oA==
X-Forwarded-Encrypted: i=1; AKwUvBzZyN1sBKokR9w/V3hXQArTclkt65suAn+pHJV68ct12xTppKyddA6r2gctE7r3J5HMZ1hgnJuT+YShDJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DyQxJVAkhObNo+OqEOgH399epmioo5aJQBUe9FiCXc0FmHSDW
	pWho04MPR4UbrRWHGPaKz2+0YaHjsjl1K/4i6HZPjZB/Cg5q7Fnh7jpXnCG0ykG2vkxALAFGhwB
	B4ND1LB3nvovfw4wyzBDpymDrqblp1CH6b5pXXhLPfJ/wcYeexD4dbSYEtzwU9QNdvIM=
X-Gm-Gg: AYBFou2+3vEu2wSvL1gidD/eb58IcPFKv8Eix+WppVgBbO6T+nLkJ9clw7JEY6d6Ygb
	LLHFTVadFpYLiq9FmdUxm9DoPid4x8+fiFrvE0kT3TNi6ZaMZjBrinuJFm9rHSdIbQRhI3Gv/bX
	U1cGHo9FpUxhvU6olERfBoyASjatFZjXn3Sgkqs+PI9xCswwnUcJr1fsY2/8yvkissYGKlyHLPE
	JNDY5CLs9eX/RD3hYaeanspf1UQlaQDaMCwlgthjcAWgDO5mOZBUTVeqovjNssCd1nAV+5FtxeO
	PdguJ8S1ep0b6l9FCWWVIaoEdiiHibBN3I6Fy/Ss9lamSVEESgwl2rbD0k4WIu3HH0ebDv1MaSU
	VcBLj6Rnh7M1xLKcogZmrDB4zyumiApgZMC5Yzc1bjOYqCS0upLKm3pUTI7H/ZcQ=
X-Received: by 2002:a05:6102:809e:b0:7cc:2152:4f95 with SMTP id ada2fe7eead31-7d0727b11f1mr4320219137.3.1793699860687;
        Tue, 03 Nov 2026 01:57:40 -0800 (PST)
X-Received: by 2002:a05:6102:809e:b0:7cc:2152:4f95 with SMTP id ada2fe7eead31-7d0727b11f1mr4320205137.3.1793699860044;
        Tue, 03 Nov 2026 01:57:40 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm25721554f8f.26.2026.11.03.01.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:57:39 -0800 (PST)
Date: Tue, 3 Nov 2026 11:57:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] phy: qcom: qmp-combo: Use V6 offsets for PCS-AON
 clamps
Message-ID: <3a2mxqg7u2cf2d7yqrnd6n2pkloqbmrz5h2i27haplnhb2m7j6@lulsw7nw3ojf>
References: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
 <20261102-topic-qmp_aon_clamp-v1-3-141c2cb6cdf6@oss.qualcomm.com>
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
In-Reply-To: <20261102-topic-qmp_aon_clamp-v1-3-141c2cb6cdf6@oss.qualcomm.com>
X-Proofpoint-GUID: pBpFwBR3vbkoFPtIVwl5IYwVN3oVTz75
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX+GJkwrqFSBC9
 wCfGw60uO5uN8RAgIARBI/fWF3yivOEm7Z1D8tb+N5OxFoui1kOyZx+0QH/HOk4P0yUbWJXPBiC
 v/huJp8bD1p2gp9HlY+hi6aB16zc+hw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXy99fdx7izf1G
 8Qy07QEySOSiZcrscAFeqBNJj70wpQkuGWEFTlqr7P4pRBmU0aD2u7Ab8Z1UOj/XIFby9fZeRHN
 dsz90Bo/ruyfC4Mnn4vq60Z8w7p/zmlzbGb4rDIQTWxJ/QngHsrsTXrsJUNrR51HpF583Qp2f5A
 P/Ixkz4cttJbKMI/QHF9uY6M0k4CswVW8+kfeKPbr/1oFE/HMlX4iDKbuL89HNH3do6o8BbOSP2
 HnocbIDqlswq7MzDZuVPIrY+NzGZZhfPaDiSHiP+xreOWetXvQGRe9mT6D1zuf7HZ93xc4g0qO7
 EIklFgoswcx2gzBWdSEPS5q+UPioPOiLyual0f6F6KdDTabzDBngD1PmqiL3hR+Z7EpMgIPZGNR
 f8kfi433zA8JwHdRW+k/escM0ZNBU9rnrbc3XSNXHIeLIpdttMzqRdpgTM9OWNDO9+y3jiSKQ15
 jDNfiy7vfyc3L3YQz6Q==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9b015 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SJ-188YyucC4oMBaDWIA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: pBpFwBR3vbkoFPtIVwl5IYwVN3oVTz75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-11-02 14:59:34, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> These V6 combo PHYs were configured with the V3 resource-offset table,
> which omits their PCS-AON window. Autonomous-mode suspend therefore
> cannot reach the HPG-required clamp register.
> 
> Select the existing V6 offsets for SAR2130P, SM8475, SM8550, and
> SM8650.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
