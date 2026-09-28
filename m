Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64594E06EC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616975; cv=none; b=h5YTqRsZEBds3OiV0WuIp9rJpchbIJvMrOr6kIOlpcGocZmhNjXV8zlbriz8vAUbwu8NHC4i6QQdXEL3dFieZ8QmE+GGPB5YrntXAjTwQVBdz8szD2xMiBiJZUFzYXNsp0xzerGlKYjRI/Ew9GWueDIatkk166PYRJAmkNe1qRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616975; c=relaxed/simple;
	bh=s/e3C2E4hbyc0ykPo5HdLj5+cIwgyR+fTxbfY+dVN5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZqIZoX6dA3yI10pYofNf9swfNS0jg9IHkfm65RnZjlTEdMI3e7/0KKimyO87sFkhmKBPD/zkWgx7SeHk4LmpihxIajxMta2pIyFk7MHnDqpXMLpp4LqqqFszEJTKrZ6dp7ICH+aNJgt4+QMLnXnTFTOQXyaagJROKLKNnbEkBXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkluvFWE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HG9LoB3u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkluvFWE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HG9LoB3u"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEeAQn1244057
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e56VPJhEQaKHBMKiPEnAJg4gXthfCHuP42m5w3NSG2w=; b=KkluvFWEIPBESG76
	Kv7EZDrPtNnfcZwI615XAbkDiRVLfNsM6lFP2XbC77hU7sltW7cHE1EST7qwbemk
	jGVqheA08gsR6JHOnzag1TF/aCYgnXedohqAxpln5vfB0L1aIwme+hag1wwfzr1Z
	QVz5nBlxVfYCGjEoajtHfLwkoR6NXuTgt617EtBoJ/9y/O8x6b+MakqcNsDk68Vn
	JlkGIFPUI6v15X9Wpi6OknTxDbmqbUIn3UIw8+Z7tLT72pE5KXubvnnfRUsbqoyq
	koGY9zjT0dQFnIzl+e6E/Dncbwd2I+0aH5Wx6gMWmp4Vg3PrqOZsAp4uykX8SAw9
	h7GQDQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav4bsb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:36:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so31641505ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790616972; x=1791221772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e56VPJhEQaKHBMKiPEnAJg4gXthfCHuP42m5w3NSG2w=;
        b=HG9LoB3u3rzsj44iCSDC2g72d01nt2MQkST4Uo0SW+1IsAZiyWkbkWZ1X5VTH/TWEB
         eOtsCRHFw/AIFHqPLSUVCEa2phtyaSj6jHYFGFmeaU/acurV3l+rgD7mwD/+REL/qYPp
         xaKQv5ebrRVLuv7mKDOjK89YcUMIM4XsZd+q/ePuCnYCn/WffQjMq+j692tHAE4beCv9
         HuCSSqvOp5l2S83lFb4RGXj0zUNnHYVlOKlsrxSl+WQFbqY93Yu/r86dP7QGa0QWek3+
         rp7g05+fF4bG8y7ygyd2mwzXcjPqwGTv4dwUhsIQs5mie46nUN05GfCobN6QQxDuPJ7s
         eVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790616972; x=1791221772;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e56VPJhEQaKHBMKiPEnAJg4gXthfCHuP42m5w3NSG2w=;
        b=V6CKMirbbdkJ2YP8ca+8oo2ehwvgd6k+76c/yuELSUuJTtoPLNi+1FOms3t2r4BIC7
         Vk9gFDzCnex8VZVfxFVgh7mIbNZm1ntMcz64idhUfhG+qQ778eAoAXFGrO4PqpPN2n80
         bGNjFyi/VHgXxt76oHSVWakpjHZ6pCjDZWII3ip+1nxcO5M9gO/gjO9kskrP/MvGebZB
         o9hPjrtK7hPl5unIs6BxWCywxekd0ESN6BpwN+d29HtChYNslkeA0k79ZDqYK8klcyQ9
         gvhrWtnfrh9Zi5ImiqOAuHwhBFlUw8M/o3bdZEceQ8Oe4/pnYwc0131TSAeUw90w87ds
         9M8A==
X-Forwarded-Encrypted: i=1; AKwUvByA02pOHTrO81fMU5ZIC2IQwfxSwOK2DesuMBHYbky3+Au9C7Sx1dX22+wA+/KNN+Eix6s+j/Zx0sH/e3g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKr4LBA2167vUbjTi12J0fNf6TOhl5gJP06Ifc07DMGwszZbgnB
	g8PoHW6Mm4uKGO1boCKulSs+YGv2MxIg1S26sYT/tkP5ytPEgD4Bdn3Fp4GPPLu5FRgeeLyhSzs
	en//jb3VHAiC+v+skSva8/CmwTlpj8iMVJngrLUfDLg4v6i6PCF0SO/+eC9Cn7IX1cxc=
X-Gm-Gg: AYBFou3dvjMS7q3ZnZZH0Co2ZC5W3NCibE3ySpQ6zb+WBuelEUpv7dSrEOKFFLy90+F
	2JMCoXV4iEbiOd4hqKsF3eQ45bEfD/oxDb4uiOqkHxHRBNeWCTgYyWD9yvVHnpKvJFGJvfpmvNu
	JeIGRiSipGb5Dc/G1ShjqCEvdWqXJY5X7Ric+oKKz2rBHUyjbQ3D52j2cswTz34HAx3nRXsFB9f
	I1m1wQs2f/Ntt1yDMyBU+vtDMtmvNkvfp3rVbH/rMikTeTC3QTUuJLGGuUh1FoujGIkQH2c8eu/
	E5m5cUbfviqeCO6+dpwYGD5pSe7wd2fdDYGH22U2eREwK94xwnjNDbIfjXFnYlzl/NtCNhtOJf3
	llUSTd3DdTlvOeAs2tkLyeauF286IMOlxpCsQArKK4x4=
X-Received: by 2002:a17:902:d2c6:b0:2df:aa4f:5b33 with SMTP id d9443c01a7336-2dfaa4f702fmr55501885ad.1.1790616972069;
        Mon, 28 Sep 2026 10:36:12 -0700 (PDT)
X-Received: by 2002:a17:902:d2c6:b0:2df:aa4f:5b33 with SMTP id d9443c01a7336-2dfaa4f702fmr55501765ad.1.1790616971544;
        Mon, 28 Sep 2026 10:36:11 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df914024c4sm44944475ad.31.2026.09.28.10.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:36:11 -0700 (PDT)
Message-ID: <aed5fccf-5a6f-471f-8987-01069d892731@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:06:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath12k: Reserve space for a string terminator
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Dan Carpenter <error27@gmail.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260926121250.3258285-1-yaojiale02@163.com>
 <20260926121250.3258285-3-yaojiale02@163.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260926121250.3258285-3-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Mmy3w-VfFrplZ0FJ0HkW_apApf27UlNd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MCBTYWx0ZWRfX13sOqN4HwGxQ
 KEexIc+BQt2eSkECboAOQFbsnJgVgjyzcN++zGU+2DU2dgR5JnpPJYLV00i/qtd5f4X6iSaEYFP
 +4pHt+Szw7Z+TSTMAmAD14wACh6QOqAOE/l3KK6SGhGfSV4EX1bKgrzIs99LYJAO1gcJHWvPUC0
 0YY3BQYjvGMQBjOAyCWzxoCAlA7N775XF73MIGrjBfJMnqcU0FRuWXIfArzwurCIfOl54ZdpJm0
 QGIUzgKq1wP7p2Eyfko3yaiK5DBz1skHQI6t14FgMJA7C4wq9HrHx6bTnCDeXNVVI8XXEMV2UWz
 k74fmhYwLP50T6tuwBhTWIxALdU+VSC983kTud8ony0ulkWXvRCGpsHJz4EqVGhfcKDs/+DzHQJ
 XE64Br0CpK+LyyYXOLckNkKy6gBmMwffWYW5Btb9rk/yp6V9119GC2X8/u+PwSUzvNbrYXP2QlB
 afeF6Z9XdC3/vkf0wkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MCBTYWx0ZWRfX5/6CEOIPwr5i
 p+NDm0tvHUTenQZLigqcgJ66G7AERpWQMFjntdsc7xMtkbCyWCH6uMQ+/xffYWmwQJgvLAVijvj
 mcJ2ZPZXo7Qjl1sLB/hXLWWAmhxogJY=
X-Proofpoint-ORIG-GUID: Mmy3w-VfFrplZ0FJ0HkW_apApf27UlNd
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6abaa58c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=yjgl9zxMNnK14O82FrIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280070

On 9/26/2026 5:42 PM, Jiale Yao wrote:
> ath12k_write_htt_stats_type() accepts count == size, which fills the
> zero-initialized buffer without a terminating NUL. sscanf() then reads
> beyond the buffer.
> 
> Reject input that leaves no room for the trailing NUL.
> 
> Fixes: 8c7a5031a6b0 ("wifi: ath12k: Fix buffer overflow in debugfs")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index b772181a496e..f84f1828275a 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -6190,7 +6190,7 @@ static ssize_t ath12k_write_htt_stats_type(struct file *file,
>   	const int size = 32;
>   	int num_args;
>   
> -	if (count > size)
> +	if (count >= size)
>   		return -EINVAL;
>   
>   	char *buf __free(kfree) = kzalloc(size, GFP_KERNEL);


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
