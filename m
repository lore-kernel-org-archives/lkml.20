Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705296;
	b=Fi7vIEgEc2yn36SYFjdufM/u4Whjw4j2OQ6PNPeTyIQwORZWnElDdtBCt8UrjRGBQZij
	 u/IXXfMXcmev4l7Tedr9tZwue+9qUCAYqbK3EHLKI8jlOE9EkBcnr9ezfInSAvRuiZEOK
	 nM7idH9I4PK9bj1FXJ78evl3npuriADFhDE05vvWRH94hBwU6wN5VXvJGQaJ82EbB+D4F
	 USbv2SBR14egJz8kXia/34cJmmQ2p+Q9aKJdJPQHG9H8EqM9VEjWXxs9kqQ+w4YEh53dL
	 ZeJd0ZOlgNbKSgzWTqqzJ2x5qmGtGNGM+dNJpvX32AKNTDPfrvCxGCw46eTGGZSvUdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wCHWzHMBYLC5oIHSiuIaJzKU448vWHYxkzVR50GakCk=;
	b=MUhmoXXte57DCoo4WqjqRZbQUKKmGPq+uzJfZUr9fmPXB20wuqqoaVxvTEKfKKQ1ymst
	 gPHOqF9xUDFdbse9+rfPGCGusbXefcykcukVaotxWAH+FjpthA5EtPpanDp184zqPq34Q
	 erh+HBt3DY3+HjOCCMEYtrjF80ZTcdsyl4W1SQikACOIB+WwzSHx4cGtE2J4N+4LmJIBF
	 nkCT5eFiTQlaxr8aC8N+ZCvAkXokV6QZGoyjKFud1kFZ9CPgHux4fB0rEjBjLqa3eFzXP
	 terxt7MCKrzZ27bU+zDqK80Sgj0lYYfQiLblCkxLHVfHwSJGed+xv6lCTz0Ct25z1Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lhXnytXD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J5zRIq7q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C6D606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C6D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lhXnytXD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J5zRIq7q
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AACBR3161604
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wCHWzHMBYLC5oIHSiuIaJzKU448vWHYxkzVR50GakCk=; b=lhXnytXDBomRVi5N
	B8uWtpFK3OLxc/i6rmBSnSEhijKn8z03PoY5wyF0BKReeyYxvEGxkeuONZuZ42Gp
	PmBu1FFrjCy0QDLW689g4c2roJJEmzSHU91xlXLMGDqSoUJjDszqtgbvaKk3qKyo
	JiNCFZR1Y3chQSTfN/T9+R701QiXxDfdrI/nK9q9wNFxvJ/RHb8BAGpov507Wacu
	nuY5oQSCdYeH7tmn5dd9LPLtizfwMW+FkkKl899Fm9y+OGMAhJBeOpT9v1xilf1K
	qEBrkzeBlguuznoYDWm5adKMYacQz4TQ+yXlV3Va+/y9susfj0pjKpk+3KBnkX4Z
	yRRhNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9a06u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:28:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so76570485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705294; x=1794310094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wCHWzHMBYLC5oIHSiuIaJzKU448vWHYxkzVR50GakCk=;
        b=J5zRIq7qlO0fCPiM5iyykB4m7liB46k+5ssjGbFOU28maHIKksoe3XgRovIyYhbVYS
         LfSb2qOlaqPHTQ2tREBOM3g3mMnnqNK6Ta1PzuouAVja0DkR2Hp3naXEwYGju6M4VmXW
         nM5OHaNl5vG+S6l++6+qjlaKDt/R8JUCbNjDeRzSHxnIz/CLkcttqlQYNIjf0Ukrk200
         jpGel6kqGGjxzNBuEs0PBWvHLe+G+QGePohs8xel7t8Ml6aCmrNQpcbFV5al1FVU5TVc
         P+XZRyf7oAGj/Imgufleka2c0cWhL1dSpcwPp3hLR1VNIJCV8oVtJKRSCX33uIMVqasF
         fQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705294; x=1794310094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCHWzHMBYLC5oIHSiuIaJzKU448vWHYxkzVR50GakCk=;
        b=sLOOmmuF1/XExyBUCb0zRebwLUqZzPvoYfGsSSBSIt5Uq8KhugxwDe7ZOrkJwI7jjL
         uBQJlI6kjT2UyFdcuQGJjpGV7vuvgx7WE9xbOQiY04u0MtkM04Xh7DM/w3RrjuJNiO0U
         Z27aBv2meRWlYoUVS34h1N11zETodpeV8YEK0h9hE2DZo3FmyG0PuP51ITKYUdehvupM
         WgcvcmzLSMuP+7JnmC/Fg1I+SslElyxq+G5w8VsHtl+Fh0rGHPtBmyT5tfiTQbXAFyUB
         VX875jhh0PilF+qwoSisttZoTKH37MA4M5oVeqsicyUtf84Xgwonfczd0wBRwR1ojnFb
         pLiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUtk97A3uvBq+NUQYNBf+5E9RLQBESLuh+o7DuAg0IsRQ/micmglowy/HrOgdD2EwHA8t9cE4hFYIYBx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z81re/zwWjI63E1tTe2re1q3alJCLgXkxoy3FLAW6ep78B+eZyS
	JOEOQkZEIFklaQDGnYsyirHB0TbiXHW840oqSt2zbWuJh+lIKyFhmF7+ZHT3M8NxqPNsn59gEul
	OBLwKV/g3z5ls0lOUZvNsPcUXyR4VHqYLxBwvEQvYoLjFT5sC5IvKjjlWjlXSHcj+gC0gFSBe2z
	0=
X-Gm-Gg: AYBFou3tEGbo9kJCMCwb1wyEzLowIDlcmOP/EbSRmka4wUE8kI8cDe5rkPYFDjdUdbg
	0iyCGS0saAUXfxjgAsmCIuMgfmoqylJmYYBg/hQ9N7zp0aCcz4L9T5Ld9oz6TlUPD9HOOzN2GIy
	zkWHmlAHT0XaEb7KszbPC501aBHXNxvWKRr1pEYlsI9SbeWLbpLk/aDeSUOAvvu8o1QvamVDv+n
	U8sKaqICSfcePahWL9As+3LXqqKZjgSoUP9jfDmUA6P6jSWMDcsMIa5o+MOO4j1e1qQUyN1M2RA
	/rylk6niox/q2Rh6tfX4e+/ZmLOkZwRyT4Gzy80pqBNAcRy5S9RicKDbahI9mOMDS6/6Vix1FoN
	keTto0VdvbdM04E5b4CESY9iU18AxYM3Lh3HKvgtOVkbW+9RFhTarxdGikUVDKvW6jQcaoA==
X-Received: by 2002:a05:620a:6f96:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94421878c51mr1995201285a.5.1793705294001;
        Tue, 03 Nov 2026 03:28:14 -0800 (PST)
X-Received: by 2002:a05:620a:6f96:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94421878c51mr1995198185a.5.1793705293550;
        Tue, 03 Nov 2026 03:28:13 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf49d25sm76802366b.62.2026.11.03.03.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:28:12 -0800 (PST)
Message-ID: <a4151c32-bac2-40ec-86f3-59d4dbfaae62@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:28:10 +0100
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
Subject: Re: [PATCH v2 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-4-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102190010.720443-4-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MKEp-TxWNQqygsk80cI04Edq0Mi6Viep
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfXxdfHZ+OFsSlq
 Khx1mrJWr3yDvkSN1zyFBZcdeoQMG6X0DoCjA7MZMWKled9+Uu1hd1+upwcmZDQV0uDymZfsC0z
 zE1C1D9VZrBeCWu0BTYYke79qjvJAMw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX4y7e/A2bbhI2
 SeaAAocX//FDbOQ+9ahRPlUgYYqMmUbdD9YmCuslFCtBhzQCla+WDrLcXVADLliinVJDq7zunD1
 A8Bvk7VYXJST9/O6osrUIi1OOY/azEq5aY3Fs+WJE2AWvtOs0ShDTrS/RfjJLygDLskH9+tUdju
 iu/+F8R/HC5Y/2FME3ZOeJ9rie5PYKEm5WxVjXZSXiI6quvdYNAbFh6k5gATjqg3Y9WN7XtiXvW
 e4wX2QzopmkU7p3mHyeYfdylzqTMZWdbTwRbXXkkq0mMKWNxZIxw3fbMa3xDfRG7OT/nfRQ+ryF
 6IKxlh6iAE2LOKwm7tLLvfuQ1XAy/KTelBlif99njw8A6DamKCS2Bfkk2YfpYnGg+6TheBR0+Jn
 Mdr+dpuyHYppsZteMozntBhjbFj2vB1dbJi4OqyQfpDvBRkBgb93WZUtNun/hWX1oTq95bOQ2Pl
 l9hyL4ZhT9QtA0oeEFw==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9c54e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7AxDZKSYRuUxSVEY4VYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: MKEp-TxWNQqygsk80cI04Edq0Mi6Viep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045

On 11/2/26 8:00 PM, Rob Clark wrote:
> We need to move the gpu lock around a bit for the next patch.  Use
> scoped_guard/etc so we don't have to make the error path handling more
> complicated.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
>  1 file changed, 12 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index f12701e286ec..aa59b28a3392 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -70,43 +70,36 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
>  	struct drm_device *dev = inode->i_private;
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct msm_gpu *gpu = priv->gpu;
> -	struct msm_gpu_show_priv *show_priv;
>  	int ret;
>  
>  	if (!gpu || !gpu->funcs->gpu_state_get)
>  		return -ENODEV;
>  
> -	show_priv = kmalloc_obj(*show_priv);
> +	struct msm_gpu_show_priv *show_priv __free(kfree)
> +		= kmalloc_obj(*show_priv);
>  	if (!show_priv)
>  		return -ENOMEM;
>  
> -	ret = mutex_lock_interruptible(&gpu->lock);
> -	if (ret)
> -		goto free_priv;
> -
> -	pm_runtime_get_sync(&gpu->pdev->dev);
> -	msm_gpu_hw_init(gpu);
> -	show_priv->state = gpu->funcs->gpu_state_get(gpu);
> -	pm_runtime_put_sync(&gpu->pdev->dev);
> -
> -	mutex_unlock(&gpu->lock);
> +	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
> +		scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
> +			msm_gpu_hw_init(gpu);
> +			show_priv->state = gpu->funcs->gpu_state_get(gpu);
> +		}

My clanker tells me we can't grab the PM reference before a mutex,
as the recovery mechanism depends on the rpm count being appropriate
to let it drop it (and kill gx this way)

Konrad
