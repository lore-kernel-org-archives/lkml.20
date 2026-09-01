Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC7947D47C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259822; cv=none; b=btLG23h4oCDYIC+/Fo5cSknhxv0a4powXcp0JYR0OYLhNASUoPfnbQvsGrTLdYvLdxgOmxyFEDfdMJvFAGEPjGxa5CLe9YhXe633IcMt3V8dETnaHCo98OhHPCiIawBFkyUP5tiyEoJolDQzGeD/yOQXVj4ISvEVSaEyXpF1axU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259822; c=relaxed/simple;
	bh=c/3LzFOXnOp4uaMM07Dh0Np9ElxE0mAnasoTJXwGAd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1yNaYD2syOuHW3stLh4nZt+ZdwMqPTWCnSMtvE/wHRtzPr54/lJrJYu/dL1mI0rxVrIi1jvgD8S9nUnYkLsobxkcIVFwJGyQL4023bBMHdpiB3zpds0cpmpq8DyZ1T+Xnlc1fja+5B5lWXuBBxBYtwHDLvz34TKdviGeAVMiBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzuP6YxJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DlMxcLxP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzuP6YxJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DlMxcLxP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJUgp1641773
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 10:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c/3LzFOXnOp4uaMM07Dh0Np9ElxE0mAnasoTJXwGAd8=; b=NzuP6YxJu9HCQXoE
	wCUBCXCQtR0RWVjIYR1In0MR2weC0zUZHs1l1O3JdvPiKuOPLQDCid/G9bmYrltb
	F5YRE0BoCceJ5rIcS8NHIbEk/zxtUWpsxd5d436gSKLCVTuv7pzCIX6Oijn7pM0k
	WciQW0CAjTDCflUEGWFl+nECwyYd6OdC0ZuM3xLRcuhgKgxyG0TSzyAOPAJcRnOx
	mRPxoBN1+t167BsloMlQ9qAAFo0Kbryqe2ftOEhlwBA392S9RKgqvBwWAz7XjOuy
	Mo4b84PErRs6PGkcmS5T4pgb6tChqUOp7GG5PT+HQVHTjtudtLs8Y4C4/bZ5doT1
	HEM7JQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8t6t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:50:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so2124024a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788259820; x=1788864620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/3LzFOXnOp4uaMM07Dh0Np9ElxE0mAnasoTJXwGAd8=;
        b=DlMxcLxP+GpvOCSpqhFNzqMA+kTR4i7qRM1IPKWiGNfjab5af1SWKaBvLhbNTPgFmh
         To8KfgLrNIrHmrNCXptn918pzCDf64fedmL89AeS/durebHJZ4W2gtV+ECPq4ZxPr71F
         CNgO+JUZmVCjd5Vz0+tge2gjaqRa/FK8honVAHl/zRjpVZtl49jrKfTY3XYqGqemMdiQ
         gojXTmKK6iYNzlmRkSycraZzPdXo2PtvdMjvaoNdYNenma5bXBTOLc6cSnChCMtWIt6m
         YzLx9dGZ5zlkwoXBJhGRpdbWNtMoWLlvd/2xapMJjBbBMdfhEL+wQeKiiUAKR/A4OQTI
         pxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788259820; x=1788864620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/3LzFOXnOp4uaMM07Dh0Np9ElxE0mAnasoTJXwGAd8=;
        b=Yo5+yxxnm64IFHuGZG7mfOvkFY2yCoBHghjz2VUb1ToiM0gArxAOLdqae2rkN8t5Vs
         UD0xlt0Y4KMcr5sr58xvOfXmnPuF4gjNX1rsdMJ6vjQcgsm1k4wBtRcSfhO67tGX+46x
         FDN+90b+Vx5BEy6hTIy0kLI4iSlIXz9zEsQXHBZXjFIVi8ktQElEc2QU8PlLpigRrYbA
         X3jDESLxOOXo0L8Yupwuo1LKKICP3T9Trw+psJZx6nnUlgngGX3OCj+SfZ6eib6u6/nF
         73+iBSsn3SuitKBvfp989y9wdm2ti4xcKfUqID+A/kuNG6trdzwOWtFadwGxBUBOq9VB
         Dtrg==
X-Forwarded-Encrypted: i=1; AKwUvBwdBFyemDEGL3TDem8NVBsN9ZMyOXVm7QRFwuhsgM58tugAE/aBxfA9J5gnJELxiv/EPu59cQju7BImoM4=@vger.kernel.org
X-Gm-Message-State: AFuF++nAX5iIegb9/um6EnJX7W7DFlLGtfPsni+y8nIW7c/9CN87NnlB
	U+YMTuJDvcLU333lXKMX6RyU0L00chf4yhXjxLKAsVNwxpycfIN26D8NYT5P2BYO080cjjOBWIQ
	hCikp/ZGH67mjSrRr5ik0LtndGC6lsoQ+vDhgbz+pzAaNdE3B3ExqJ6dqKSS+k5k1MNI=
X-Gm-Gg: AYBFou3hcl/OkKvO3tJy4ERCPEuCTb36YHeEYlkC10g9qZMGUInm22uabfQV6CnmGLp
	YkXIkvF8YU1tiw4Turzlqg/ThT+IzRebcqNQuqON2gQr+ej+TeN7e3xb6/smZ11+3o33JkuUzKm
	A8guD8Z8QwwlEXOj8urZyrk9FJG0jGmnE6rSSYcBFm27Gs/zTvCMpjNgEhdjGNLMaiXj6ShmBX3
	icIUxRgqaxc2Tu6pjpp3rfzcTU2wHDckCGbRvIMun+Xc07e5GKdn25HI4naSmG6QjIalQJ2M4Xg
	SYeSMyisufWFNgoAXb8cQQa22iCv5F8bsr/6BNZCmHxgDr9j8Er9fgHneNP6ebPAXubb7ILya+Q
	X9V8bXS7Jzr9rJur10G9jArYhdUF2dNczmg==
X-Received: by 2002:a17:90a:114f:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-3989be5b50emr23508921a91.25.1788259820085;
        Tue, 01 Sep 2026 03:50:20 -0700 (PDT)
X-Received: by 2002:a17:90a:114f:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-3989be5b50emr23508860a91.25.1788259819580;
        Tue, 01 Sep 2026 03:50:19 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4d92sm32534466c88.13.2026.09.01.03.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 03:50:19 -0700 (PDT)
Message-ID: <36b9f3b5-8c20-48f0-96d0-92cd13761ab4@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:20:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: wcd-mbhc-v2: Fix incorrect properties names and
 typos
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260823-wcd-dt-typo-fix-v1-1-a71b458e0d31@ixit.cz>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260823-wcd-dt-typo-fix-v1-1-a71b458e0d31@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96aded cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JTjWdI1eHk-BqoT7USUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5NSBTYWx0ZWRfXzkQJYJVbb5Ki
 BviVnktwrzl5bdUP+nLoyBEkOmp2gspggm008+RbKwaCzqmK/RUWXUdJXqcugdaDM3exQGetH7o
 /UANKRUxNU8tmJ3Q7c850Wo+Eox++95BaRbZ9gmMdG3pYn1JFVkgW7OkxidEOUPJimQpa6akYJu
 W3X9uIyQaalwkHvkQZFZYnSt3ddq4Z3/3X7OztLDISdbMeZPhxHs8J5E0Hu8Rtu2PjSNh5cA/aU
 wD7mupU9UMkHIM4Fbo1krYZBTpu0y6yxqO+QBVH3xwYmuhPvd9zR2R+WBRYWEwt8EJQJ4wGSxDF
 AzobDw4ePCqfiLjTPb8j3CPv51uNMhveumpxAmFMtliYc8g3YnHqzqJp5QHLAaGoLcOnWRuicaB
 fsPf0Kr9/P8DN51dab2+0m7uwX/JhaFtmFjsNTwyDqFyusKXswymZpfyp/lCz02hufPn0YkkcYC
 ZSpCYb5o4YSS83JNWvg==
X-Proofpoint-ORIG-GUID: BUylWIwcv1v2TFfWY2YRGbUOVLfZw_Uq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5NSBTYWx0ZWRfX/xSV/wtSURfl
 SXMS7JOySGtuMX3fM33fOdHHWop4CYvwbvSbByK8aCKhCcxHl4pA6pQQktDQlq6DbeV4SymZoAi
 Q3bFB7DTjMKmXEojwnmF81TyurlmPrQ=
X-Proofpoint-GUID: BUylWIwcv1v2TFfWY2YRGbUOVLfZw_Uq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010095


On 8/23/2026 2:39 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
>
> Improves debugging experience.
>
> Fixes: 0e5c9e7ff899 ("ASoC: codecs: wcd: add multi button Headset detection support")
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

