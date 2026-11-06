Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990142;
	b=ga9t5Dr5dgiPnkFf6M3e/HutSt99S8MKgSVZ3yf3Bqirz96pkeFBKY8vSGwGajW+8OfD
	 h8L08JX5hSKBddPNxN0U/jTc3v+wQkDwS3kBCi6anAKAm2JXxOu/65qsEpc3Hrs7N+QiC
	 9Y59QCJk8BAkptPKVyAHp0BHdQT9RN+J8uAuuRahKKhnq6DsmSu2WxL/nak1ujESxiUH+
	 AJDoYkhk4bhi/hdGbhsKGKwH6G8GzIobFwYvVY6SNocqtVmpYux/0PqiIwGt2PHL/2OmU
	 /blWtAJ600MT7ONb5OWzzqEaF7xICV5GMBrHEfkCndRNw9SuRgAkfGLtLEF08ZEyefg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990142;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=;
	b=RpKmpT1NQseZGeoMD+Phpy3YMdoA7Z0gT4JJ1Q9DdkGhJsw8tl1AHzJu8P+ivj2CidMW
	 sHLL1OFkxF9GEzFetPV8iKcL4BScWY3REWaQvGdQ7bZDq+4R5B0lRDhYRmVL7dgHCMtZi
	 Xs0yhRjYn/Q58VcztKtpjAEBsYyXYplJrt9CJUhj5HKi9a7NQ0fU48PSOPYIq272E1fE7
	 Ap7/e10JLoP5JEKhj9kVMAO4Tm5zUpvUbq3iyogGntCk2qLeEcnOVNHAu4YuFRAzWKC31
	 eBVWwoixRg4ukLPQaZvqIPLMEm+Q82RpUUH72NhO0niMpZcwl4L+tGAbVieN8l57bzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8K5NNlF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cqR151tJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52E7606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A52E7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8K5NNlF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cqR151tJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6HsxZ51511449
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 18:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=; b=P8K5NNlFrrqItXqT
	n2b3FmqBmj6ylC9Gr3Gt8NTQwaMlnX7fCC8bp8Sj1yOXonXgIE2PF5WlAVOv7HmW
	IWG+C6zqEbbpHE7BjV39imBno+jh0rixVHexhC14kUiB689iu0y34vNW1rVWjCkA
	UNsrHgBbRmgu+ocu+pnBymNw5w5+vBFbiR1ofhh18TNlu4rxRLJE/e8t+FBBtoMR
	itEx4AAupsvsEfART7q93Bkaz8Cl6P/AsVtFgiqtsYGoNMt/dO9J9PTn3rm0U1pd
	TjzZXvgOBsCzneB0bYvRci4+84zcfSd8gjJbW3Qa5imgOegHSihi2QV5wefEbeVm
	Bt1eyA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9v6gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:35:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1640444eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793990140; x=1794594940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=;
        b=cqR151tJGCnB+2aarRrhi04f6XLjWTGFoe7ACkN0c5v3BIE0zJpLLSHgfqnnen0pbp
         2s9fglZx0l7Z/csYEZpIZICvM0EuGF1GNZoSBO7+7N6b4CD85ybjxP54ogRu39mMQ7Z9
         tWwJRrWTQLTsyfIz+ej+oLaXYdI/HG61RpAsVVh+s34wq6L7Cr5uCCJ5TbceXJnzXvfc
         +nZNwaQiOCxMzWPw6Y03pqNka8mkxRcVouLr5yv0b5pbJ54Ics+XcIS/Nb+PiJ8DNjdb
         M5l62/N5PxcQt3KrvXB6bTf54DgoXfP0Bzjj4J9cieRiaPBEzcVl3bYbQk6v7XYnfE7D
         b/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990140; x=1794594940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=;
        b=r4+QVFAXU/fzmXuMp4GjY1fUpcpElIgEiofdatuOlzzHA3gQry9cGOO6gKxYvVp7iI
         rUd65qaoFz7jCXwBTQFTcztz8WTEGYTtyzuIHCLv96m/bLilKNavA0ODRJPez2TmcxxE
         sACjY0sApWwjl+QHwa4bj3raOHGgbwYGcbqm8GdONm0sNm9vJBK6Wd4AyBjjqmWI2way
         QWKROpxQlF9SNdPfGl39v5SKX5+QILYr4w8ZDevTJ1k/HnUIhhNSa6tf+kJw0+7hbzH3
         JseB0gmIIaEX+HMi56m0O50GwUyVU2AFpBFi3BVNBpl1tZ/52oWCocU1F3BVtFLw7Zaq
         SrXA==
X-Forwarded-Encrypted: i=1; AL+hErFdQxRweXiekXXtp1xIw8cEtcKwfHEmowj/rJcbu+JwvFIY5QDL9asrocs6oJntLujnvD49PZYLoFyka3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ui9oNfl+KSNqTnbPjdxDWPSBABDCd5pgJ13jcclNBhBJ34aTW
	Y5RfVAOzdEiwSY1PclSL1VrKnqfIDMkn2mhviMJtruny4dG9uLF/EZQ4VNkV3Ukxfn1xPbjCgRn
	DD9abeiNXf021VlOwLQvAFj+YVo4ep6EZR91VaSwQPZJWYR+58+vBNPVo6PrfwOjyi0k=
X-Gm-Gg: AYBFou1P05GTZpZg1mGLhM3X0ZPPBuYCvhvJPni0bJSLSBXLY86a0LnZheEf0/kV0wr
	+c02TbUbXkbjRsxk+ERh6535F+SVeZYOrGgLdQXt037D9x55RwSIRkgjsXGln4hMQJg45Kc146Z
	vabEQs/5zgzm4hEDgnmIF8WcEs7e4emudNuHOzjqs3S/8w9nsFphba+XUZ2Qj0My4RvlNlXucgR
	JIzimBaqTwvj/bkAjdk9jlUnZRokF99LJfav04UmGw3WjpyfpsJ3Yo+Guen614LFiJXAUYLjySU
	iLN+SRsXfy50452uFqeuqHCXUSXDq46zZ9Kx0CmavI3g3SsYRae7/ntPm8nyYSddbcLfLs9KTL2
	9EhNh15UbIopB/x2kJpBwDrosR9oJQjsenn6YEzLK01weeT9BsE4KVhQDTwnXRFBr1+2jTZfBkl
	DEsIgj4ThEurPJRB0=
X-Received: by 2002:a05:7301:fd0a:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36f774f5c3fmr4397676eec.38.1793990139035;
        Fri, 06 Nov 2026 10:35:39 -0800 (PST)
X-Received: by 2002:a05:7301:fd0a:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36f774f5c3fmr4397636eec.38.1793990138362;
        Fri, 06 Nov 2026 10:35:38 -0800 (PST)
Received: from [192.168.0.3] ([49.205.82.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm10347444eec.10.2026.11.06.10.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:35:37 -0800 (PST)
Message-ID: <1ad8a442-278b-4db3-97c7-82e0a77b201b@oss.qualcomm.com>
Date: Sat, 7 Nov 2026 00:05:31 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 00/17] wifi: ath12k: Add support for QCN6432
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3NCBTYWx0ZWRfXwnaJYOui2L4f
 clOB+6wLBYoMJOYQ19rZIeQZwt4BD0ZKf8zIiOF/rKjGpSXXx8yqp+5vBAQuXOqy/pE+Y+209G8
 NfjEXFnokCwaB0jS+Lq8GqU99Uu+Mkc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3NCBTYWx0ZWRfX24HZ8Bb+8Vtn
 9ggSFkFb/wauVF8anRUJhFOjzERgZxqLkWcNw/Pof2uuplpbWPz87tR5xXXU/c2EmMSsihdqSBW
 u3xnp9evy1TtmDxnpPK2CKT9LYvGEDUJc74Mtpl6LIhj8NYCRvgMdgaq/4do2ykY1dOqCFB3+1W
 xaxWbrWJHN4Wy2ArYGxEweUwGGmvR8BkvLdtxQzINpGSso+S9a8sKVypD7xrj8t3o6dD0d/NSVB
 Qm6NJzTfyElZMdginWWYXSKJ7RIrQ4JP1mlPFTaOS/bTfsUCntYFSMZihwlpp0dh6vP5p/mp4eE
 Jzb7A2bYwPNzIu2bHUpEFR7wLaA6rWGskq1lkcbixYvfxtCyfL3TmFc/fTY5z0byNssDbzcIx38
 cstKbroNOEVvQ/h4FydNOcbtX3scfuV24X3PfCJWMmIscaq4nNntwUNbqa3MbOpo/BbVgEaz61G
 b3EbG6IbaXlb80sgljQ==
X-Proofpoint-ORIG-GUID: nsPmC_3sNWmcOapTcxj97Od9-63QHymH
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aee1dfc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Yi4Dc0+RdECwe4ym5Eh06w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Jrv9ZmiOdEm1SHuq7XcA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: nsPmC_3sNWmcOapTcxj97Od9-63QHymH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060074



On 23-10-2026 12:31, Aaradhana Sahu wrote:
> QCN6432 is a PCIe-based device attached to the WCSS Q6 processor. It is
> registered as a platform device (AHB), and remoteproc APIs are used to
> boot and shut down the device, similar to other AHB-based devices such
> as IPQ5332.
> 
> However, PCI APIs are used for device setup and register access. Since
> QCN6432 requires both AHB and PCI APIs for its operation, a hybrid
> AHB/PCI approach is implemented.
> 
> Overview:
>    - Patch [1/17] adds DT binding documentation for QCN6432.
>    - Patch [2/17] refactors PCI operations and MSI config structure to
>      support different MSI configurations.
>    - Patches [3,4,5/17] add hardware parameters, ring mask, and registers
>      for QCN6432.
>    - Patch [6/17] moves multi MSI vector flag to ath12k_dev_flags.
>    - Patches [7,8/17] add hybrid_bus_type and HIF operations support for
>      QCN6432.
>    - Patch [9/17] adds support for unified data-region memory allocation.
>    - Patch [10/17] moves MSI config to pcic for better abstraction.
>    - Patches [11,12/17] enable MSI interrupt support for CE and DP rings
>      specific to QCN6432.
>    - Patch [13/17] uses CMEM write for PPT on hybrid bus devices.
>    - Patch [14/17] stores and uses per CE DP MSI data for QCN6432.
>    - Patch [15/17] derives QMI service instance ID per protection domain.
>    - Patch [16/17] add userpd ID mapping per device.
>    - Patch [17/17] adds support for QCN6432 in the driver.
> 
> Changes in v3:
> - patch 1/17: Update the commit subject and change the file name.
> - patch 3/17: Initialize qmi_max_chunk_size for QCN6432.
> - Link to v2: https://patch.msgid.link/20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com
> 
> Changes in v2:
> - patch 1/17: Update the compatible string from qcom,qcn6432-wifi to qcom,qcn6432 and remove the | character.
> - patch 11/17 and patch 12/17: Fix resource leaks on probe error paths.
> - patch 16/17: Move the NULL check before the loop.
> - Link to v1: https://lore.kernel.org/linux-wireless/20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com/
> 
> ---
> Aaradhana Sahu (10):
>        dt-bindings: net: wireless: Add QCN6432
>        wifi: ath12k: Refactor PCI operations and MSI config structure
>        wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
>        wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
>        wifi: ath12k: add support for unified data-region memory allocation
>        wifi: ath12k: move MSI config to pci.c
>        wifi: ath12k: Add platform MSI support for CE
>        wifi: ath12k: use CMEM write for PPT on hybrid bus devices
>        wifi: ath12k: Resolve userPD ID per device
>        wifi: ath12k: Add QCN6432 AHB support
> 
> Sowmiya Sree Elavalagan (7):
>        wifi: ath12k: Add hardware parameter for QCN6432
>        wifi: ath12k: Add hardware ring mask for QCN6432
>        wifi: ath12k: add hardware registers for QCN6432
>        wifi: ath12k: Add hif operation support for QCN6432
>        wifi: ath12k: Enable MSI interrupt support for DP interrupt
>        wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
>        wifi: ath12k: Derive QMI service instance ID per protection domain
>   
>   .../bindings/net/wireless/qcom,qcn6432.yaml        | 149 +++++++
>   drivers/net/wireless/ath/ath12k/Makefile           |   2 +-
>   drivers/net/wireless/ath/ath12k/ahb.c              |  54 ++-
>   drivers/net/wireless/ath/ath12k/ahb.h              |  10 +-
>   drivers/net/wireless/ath/ath12k/ce.c               |   7 +-
>   drivers/net/wireless/ath/ath12k/ce.h               |   6 +
>   drivers/net/wireless/ath/ath12k/core.c             |  10 +-
>   drivers/net/wireless/ath/ath12k/core.h             |  24 ++
>   drivers/net/wireless/ath/ath12k/dp.c               |  39 +-
>   drivers/net/wireless/ath/ath12k/dp.h               |   2 +-
>   drivers/net/wireless/ath/ath12k/hif.h              |  30 ++
>   drivers/net/wireless/ath/ath12k/hw.h               |   8 +-
>   drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
>   drivers/net/wireless/ath/ath12k/pci.c              | 111 +++---
>   drivers/net/wireless/ath/ath12k/pci.h              |  21 +-
>   drivers/net/wireless/ath/ath12k/pcic.c             | 435 +++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/pcic.h             |  24 ++
>   drivers/net/wireless/ath/ath12k/qmi.c              |  83 +++-
>   drivers/net/wireless/ath/ath12k/qmi.h              |   1 +
>   drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  45 ++-
>   drivers/net/wireless/ath/ath12k/wifi7/hal.c        |   7 +
>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  85 ++++
>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 +
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 143 +++++++
>   drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  22 +-
>   25 files changed, 1214 insertions(+), 109 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
