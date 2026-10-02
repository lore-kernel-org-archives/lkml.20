Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A51B34AB1D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957786; cv=none; b=uPAjsBl6Iq1gRt1n3KkFodw8P6zZrnKR4FcyGn9gitL1VXMRcu/+TnYNWQY1Aq6sfHEht0kL8bk+fBStZZ2QvVIm74P+1XdGNjmNLQD5wxD1gu6bvgtm8P9V3NV0exnYBMzUfh6vAgMdeuZPpohXRC6xSHvk40nxN8UEUXB1va8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957786; c=relaxed/simple;
	bh=Y5z2ZkKNa1JTIh+UaRL48Fr5ntoG3e759I4wtxLOKVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UP3eGdQy+iAkCTr488Yt7i+77JjvZbUEeb+RXI+kluzyBgBJs0q8SVavbM4/9dd/nscPEYiXL2HCpx2wich/GQEMtSGdRIuBr+mVOrIW7Lz4icpefR+i3Fc/gb7UOkrM96QOpQ3QxXcj2Nrks3ZHQDoWMtCcN+2ZzLWOOoIjDfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbAscd4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IexrvYzJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbAscd4M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IexrvYzJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGk9h2280109
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 16:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JrpZAzOHGpAVYNYwEJvYiv0byu7iGUXkj5JdchsAbYU=; b=XbAscd4MiYbZCvv7
	4gL/ASiAfUD9gUS74XPJOKuIm3ILwO8GGJJ4PvlI9gasjJcT18EjZ7mXIyCa/XLx
	5Z6CNa+s8QhrWIpSCWH6QKbpFhrOfwTRBbrinuhM3Z4a5UZ4iIqdoUaJIavSCXbl
	WpaSUBAqwiL4y75FBJWK2ew969GnCEsTk//r3QZPcUI3ggh57KP/z/jDcP8kkL/y
	d7tfenA8oZnSkOzx6lyOzotPJN5voPvg6tyYkg3b9YH0dlBI9k1/ieFfpf4Yd36l
	OWDECSMYw/n8/fma6pYgJKzy7MqspFDVwG020R1yl9ZQYOsNEWg/RTzm2elPgmY7
	eiHAVQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2aj019yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:16:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a470ead068so49612a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790957783; x=1791562583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JrpZAzOHGpAVYNYwEJvYiv0byu7iGUXkj5JdchsAbYU=;
        b=IexrvYzJ2Sf9mZkZcELyRKMKjadX+axkORNfA/+Ah/r/m+FGlMxKPMMditTUWw+5N/
         6ZvOMvm3tV4nVJetCanKf8SXwGSMJtOf3RhwsQvnxChuTI2rTFG2Iw0ET5kKpsTPjpkq
         u/v8WKOLmRkO4E8pHs70idNtWdVQlrZV8kBwQ1f8RruOu0uJssJOHcYFBEKtS8v3+jvS
         K/wdRyeeO1xjoDtvUnfmDyt+PUNNQTygBVOUTAKjvbnOctzNUMWtkEJYPna5vONYq+da
         /8IZmTqV/iNuMuxsqB9SHd5S4tmtB0Ln9rHoVn0lUGbfE+HWKFujmD42qRJgl24O8zFU
         ra7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957783; x=1791562583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JrpZAzOHGpAVYNYwEJvYiv0byu7iGUXkj5JdchsAbYU=;
        b=SkJnbJJjsunsKLvbgPJYwpg1CwWUY4Yj16/6KMONQt/wpMqXGpfTy1EYmJu1OTOFpv
         Zymn86bo7DIAr9LIPZuwc7EZs/3mZz9/4k0H44l2q0AXFTYWM7wuOLLErMvg5V/Kfsl1
         7L45pSW9Vqai/NNqt19tKA9IvMxEAXOHshsxSDNcezhQ7SlxXXQ+UwbnXcL5Mg4LitCJ
         0daoZfDoAk+BqqCH9raFgsD6XJE9Xa5sMXTqopnA0EIorR9vSmbae4Cc5UmypKe1fvYe
         xaeerAZNm1LTHwMKXGywNpRDL5TbOuPuZm+6rVPJkmVb6fVFktg52ZUcl2C09xY92UXz
         terg==
X-Gm-Message-State: AFq9FYLMkZ8auA/w1EC8+El920Y1gNtfs/W/mGCpUh2Llan3dQ0SP16H
	7Zfy33bvpU0uo5CbNqXjGH0FXk4+q2+XBM/b/jpb8uGd9H9s4ZX1FPIvAiQZnUIwpOw4LAkOOUb
	0QG2WZLW5gCYIH8Vl4b9FfBalO1F///c9THpUdJKKzxrc61e0aCE6MoZMj7ZFbzYgiLE=
X-Gm-Gg: AYBFou1zBtFs4sWbDB2bj9ghHVXIWbdaUrzkGWbIqBIv8X55qAbNdGlIi/t4MX/no79
	ecQonJ+jrYzoeuCDqokIDZZN02ZofTQH3oFYP53kPmc5d8kGNsoVUr97RYtaGr7i8tM92yqZec6
	mraXSwY/egHVI6wXzYyH3oNk+OLfN1LxCAfOoSvgmsbbMjD6J59LQ2wsVRNg2sduWnfBHsmG1gI
	yZj+elRSu0Nn4gZMc+glsluMl7l5O8Y152jDvm1vlXuz2BgrnMK304uerABfz/q3q3gELZXO9HX
	n70QFJCKnvBvu9olE4xHo11YsKKdmO0hPkoRc5TU1SuunnPiV31pmmol2ojl79YYof5pSOGAeOm
	wA3QA9GfGLwOjjKoEp+Acxwid5kKsp++OPDDI38CfsYki5RhhdA==
X-Received: by 2002:a17:90b:584e:b0:39e:6c69:7777 with SMTP id 98e67ed59e1d1-3a6cec2c08emr1780034a91.32.1790957783114;
        Fri, 02 Oct 2026 09:16:23 -0700 (PDT)
X-Received: by 2002:a17:90b:584e:b0:39e:6c69:7777 with SMTP id 98e67ed59e1d1-3a6cec2c08emr1780016a91.32.1790957782566;
        Fri, 02 Oct 2026 09:16:22 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6e7776003sm1535408a91.0.2026.10.02.09.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 09:16:22 -0700 (PDT)
Message-ID: <ad9beb13-92d3-4131-86a2-e7684fc1647c@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 10:16:21 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/rocket: Fix use-after-free in
 rocket_ioctl_create_bo()
To: Wentao Liang <vulab@iscas.ac.cn>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, ogabbay@kernel.org, tomeu@tomeuvizoso.net,
        stable@vger.kernel.org
References: <20260917180013.2166025-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260917180013.2166025-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2NCBTYWx0ZWRfXyj6hi6j9KkeG
 n3LmHIWgFZVEfjif5tTYwTlNIGLhPx+XQIvhdvTN8LmqqqHeIwb1BYDX5cpVprFni1ggfO2OrV/
 nSrwlEqaU1pldeFfkg/1no/nMbj/Wwo=
X-Proofpoint-GUID: _1oH2Aqh4CDf5ZpqjsjY_ZooQhwIKbaA
X-Authority-Analysis: v=2.4 cv=UJZIjyfy c=1 sm=1 tr=0 ts=6abfd8d8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MWBjQOLh__yZfO8ecwsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2NCBTYWx0ZWRfXwFvA+dAp3/MY
 t35fcrQ+QZalL5ykA++pnEZVzI2YoVIMDQULr8rA84ItliwU1F4DiP8vGcNbppR/RqkbQV5MA+z
 n8YgjhQXQbhlaP38dTTAwSlbFKDEKMSf6nI0k4YVWfSXy+dw+60l27JNC7LRlzxFaIA4AyqkHNC
 Bjhoyb0kAiMppZR4PIaA+60hEig5fB0g/n+0tnE1GlKWAJufjy4TM7LiwAKllwLIrjz3CFhfmTe
 zcRmu6hxICXC9W8OFwxjSGK9Y6DM4hVlACgRD3Y2JgUz6Ezw7FgEtF4CGP16yKbpvoaO2yRH0oe
 eQORqxHbk2lQwnQH0txfXmLWdJRwkkDfaSMRkTHUKoAxpj7JG78WW1t7Ikbjgc8QlkgWvDyO9En
 ZZqfP1ZAsTbcJad6fzbmXBJBG9BLOFfL0iJOturxd7JhQA9VSurxklHPfjVopdpnsgSPZOIVywk
 SFoS4VVtc/OUKwnqL2A==
X-Proofpoint-ORIG-GUID: _1oH2Aqh4CDf5ZpqjsjY_ZooQhwIKbaA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020064

On 9/17/2026 12:00 PM, Wentao Liang wrote:
> If drm_gem_handle_create() fails, it takes and then releases its handle
> reference internally, leaving the creator's reference as the only one
> held.  The drm_gem_object_put() then drops that last reference, freeing
> the object via rocket_gem_bo_free(), and the subsequent goto err makes
> drm_gem_shmem_object_free() run on the already freed object.
> 
> Return directly on the error instead: the put has already released
> everything the function acquired at this point, so there is nothing
> left to clean up on the err path.
> 
> Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>   drivers/accel/rocket/rocket_gem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
> index 91095d1b3066..521819041475 100644
> --- a/drivers/accel/rocket/rocket_gem.c
> +++ b/drivers/accel/rocket/rocket_gem.c
> @@ -82,7 +82,7 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
>   	ret = drm_gem_handle_create(file, gem_obj, &args->handle);
>   	drm_gem_object_put(gem_obj);
>   	if (ret)
> -		goto err;
> +		return ret;
>   
>   	sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
>   	if (IS_ERR(sgt)) {


Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
