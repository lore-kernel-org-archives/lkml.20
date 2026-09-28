Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E284848BB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586433; cv=pass; b=JwcqfFzWpkg+MCDUujJai7pyfQ8/+3dapiKuIGNctSqsxbKLv9W1F1PXTMGHiYvJPCs+QFYk4XQN1r7Vj0rnoL4P+RMN5Wq28sV9mZg56yfxLqzr5mVyDNQ+zsPS78AIdsfpH3/FHASAnFnXV2H2hWV1qS9c+NR0Ek+5b+6+Nz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586433; c=relaxed/simple;
	bh=s2Enupyeibtnt7iImD86TsDrfkpy6GFHBVU2jucmNWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYQv5ceV3wFqMfWcmd6NLeoS5WqCWAIe38jULFU26+nMzLasEojbAMN+jp1W9A5d7TBpy3LdsadCvU/b3a+rVLtkhlVHZTrW7omNcM6kquxKGbiji+lnDxacvuUmq+MfSSnvDDS3VYnGKd/Pp28FNGQtCs0141rgmO5yb7vuhys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IROmiQzM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRgV31EC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IROmiQzM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRgV31EC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xNUO1982085
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n19NZ2DZer6lB8ryYO/o4o4W
	WUSxviNywHDQ+d++mko=; b=IROmiQzMOCN35QWrXMKhPyYSyMmuA6jkxAyjmPhC
	0UETZgfIDwCqiu4QPlZUilAG1nVma42171hArilj2c7EALEaPO5jZc65CbeUadU9
	V9Q31Ks1rNu0G+K8HpRwd+cR1xTDB3VwgE+k2ieRVXXmzwWn2X7MITPKN74sC5sw
	ZQxAQ4aDFePZX4BB7nMOYUJiAdd8f/I6EJ2HsZdZadi7hSE35qV9t1cEIKDCSeml
	eK7v6lV8WzUmVpJyx+z9bOf9YA6EXyBYTqwGRw3U9/tadcoaOYG29myWOTpoMNd6
	kBGF8GMBR0iUv68rTTsWx+vGkZmb0ZzCxIOdPfLng6zgYg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj6t0s12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:07:10 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-88322409239so39007967b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790586430; cv=none;
        d=google.com; s=arc-20260327;
        b=PHubdCyz22E2Kxd9vo5CRLTSQFIJNEWWoY/uYSfucHJFw7IV2CND4L3kbgUs/ex02V
         r5TFlZxXsRQPA8w0nFI74oviWC1+d+7ta8CcOsme0dir/w20/yc+leOrWBnw7x+gZiTd
         fcAnr+4Yd81MkZeD7evpEo85LeoS8fvi3B5g28GvrTDhL6xZgQvYAv4Sj1iEwmOuZmIa
         BsXkVFUmSCHVPimI/7i5QqDNabMl3YwpbOrAa6MrblSts1toXBHt3aImKjMCIISUASq3
         lBhsaGLu75KxZj3KDuXv/zXs1y+gSvPNWnKdWAdi+XzpD4Do3zkpHAPfQQyN3phL5VDI
         fxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n19NZ2DZer6lB8ryYO/o4o4WWUSxviNywHDQ+d++mko=;
        fh=y8peunqpXM1roRlGQj4r2l2ZWOmnaHLoEkrez/j24z8=;
        b=JSdezI2WYYaV3p7T17O9ycIBmO3hV8j09lF+VPUVectlE+nkJUD1xoG2ey6zPayBU5
         CFvotyXtuezw5JcoCTagsHcgurpeWXPPOwp6d1LcEuAiDsJT4T3kEPFSQ/u+yfyiStKD
         BO+n67OdfiyVJJaf6VYXpSLkRWBb+EyGjFHDfoijeiH/WPnTNttS8LD3L50yAMoKnu/X
         IAtpWO9lhEBuyFyISAXnvK3IfJvOQ1w/zCOdGg7WucdtFOZnrr+twZYQ208rN1xAXC0J
         wqtAZVzuYSTN5Ckim6a5JPq0+72Rt9uMSW4YQVC0l9s5pEOpb7QKiUFeltSskdc/vH8X
         QHLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790586430; x=1791191230; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n19NZ2DZer6lB8ryYO/o4o4WWUSxviNywHDQ+d++mko=;
        b=BRgV31EC1wVDSY3eTEaG2gDR2V2Ay7vsWbRTpcni1sjY2fL9fzScoaX7ysyKzql+xS
         ypST2GZCO8b3W1RhJg1xkUx1Vx2cUsYyuqv+8g+vTQ033yLG1POBVWMtXWDn+6pEbVPR
         Y7lYUhKFVIVBZtlg/EoDnXedpATqN4A2qShCxKOB53bRzkwLseG6TBWGt8EM5Sn6Y7Ot
         QIlBhukufru7wyEb9g0RFQ7tgu4VvaNWfUbolBBdZEon0MhdjopYcWY49YPPjyYsVL2w
         +9TVS6oXT1/5e1SajbZQ3uS1eiNkD7aAIzOZ0NWUOgQVbjVcSNhl1WQCx3z6vPjRf9oB
         eNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586430; x=1791191230;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n19NZ2DZer6lB8ryYO/o4o4WWUSxviNywHDQ+d++mko=;
        b=zfwwC06RY/wDjqrAgnziRGk2+0L+XZmW96jJMs+fiF9JGOmL7zVPwKOFZIoL6ci2Rt
         905s0pW6OxATtDFFrqKmNha+Gk+SdikW09aqDvyYijAjrovL7dzSLei93d5HwTth83Rk
         mCooDhlgiHGNWQ7xCZMqnuQhT+Hnieqe2vi8tSzzH1sIhTcAFpyXov3aPKwijsXUVhUN
         FuXrKxQhvEjuOlc5TbbE9x6GI/7BjDMEbjs7r2wmGRPOVt1XDSLsezXxSd7rzVXFT46s
         7LJMNphstLCnTuwubnPIh5/+puSfk9h6wsB70teDGroq60kc0ZQn/K4OL+CzSUTHfttD
         BNLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaguAUqAv1RvZSmGfZmg9412LkyC1+Pz9H+Ow9uSqxSYrGmaH7BsfEOi/bLCj2A8C6Zbcn+pDl+xCBPao=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrqXpNi/jSAvHtO1mjlPLPq7ey4MzimBhJ1JO2eX43S2uA8c0+
	BWxkBD14gzZf5Xq5NdUF8+bFptXfS3hptFS5GXbwOvvf50u8JletyQHz2VIok8JoOJI3f1p1HYn
	NEzycGWQx7PqRR2hwgvEF+Gd8rXntSDGZEMR0xpQhE2z0J5tZNYdkKaU99jqGiG6DDm9jbnl5P8
	eMJgN9gqyYiRIKdmD/4Q6fdK4S5nvPtNQIP2JhPlMuTQ==
X-Gm-Gg: AYBFou14eEyZUNjh+z8qjtlHZAGVKxdOg0bBT0ZHD7CH9UPULqLglFTzT+2MrBl90Om
	SyZWX+BGs1J27PRrbmv/fRWAHOyJU3AJdwLx24eGVRp97Gfy4kFHEeRGHmSVPCgct9DmO0SgfoI
	zL+kA78Q4NH8koQupvvIPkbQqTTci1fdfqX5oktECqIw13flINN/PSExGnIvE=
X-Received: by 2002:a05:690c:281:b0:8a8:8f62:e92 with SMTP id 00721157ae682-8a88f6217a1mr34619207b3.55.1790586430083;
        Mon, 28 Sep 2026 02:07:10 -0700 (PDT)
X-Received: by 2002:a05:690c:281:b0:8a8:8f62:e92 with SMTP id
 00721157ae682-8a88f6217a1mr34618987b3.55.1790586429555; Mon, 28 Sep 2026
 02:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-7-d5b6f056568e@oss.qualcomm.com> <arOfufqav6zRT_Rd@sirena.co.uk>
In-Reply-To: <arOfufqav6zRT_Rd@sirena.co.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:36:56 +0530
X-Gm-Features: AclHuK-5ndE__5TsHzpVHEV0m6dGW20Hk6VWjJY3Bt2Guaa4yktx6YOghplq7oM
Message-ID: <CAC-tS8BscYoSU41qHTC9_8Ajq-MuyfOHWzt4p6v6NN8HzsRVaQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] ASoC: qcom: Add QAIF PCM operations
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfXwcipDoY9grq5
 uu5En/Phr/ODSAvjTbvUl2yDJI+om1TRF+l6O4kFqzMyht84c1usQ43D+QVcCWz5fzhnXgIfwxA
 bRIWZcQ/2bgvhOqMJBd9El1g+Uz1/XUK9EcZRY3GXtlNxYsEY3Yjb8JuLpR1DoeM3apqFySLG2y
 6lHanBq9sXhOTWnQly5OPmyd6fKQXjNeIfNB0ODLDiUKXdWpM0AXm41IOL3MFTrZ+2hb4PuN+AH
 B/VS2kmhWrSqn/v9Q8REaMbHP1QCW8fu7CBDOvU1K9xGjzd7x/SI+UcYEWpw2PaUfRn/ZuT7UIU
 2mAphC9hYVHAls47O42XNWL1KY8eGXQ+AzDsup14upp0Mr2/mgK5KFrqkSg1QaNTkfbtcOAoJbi
 jcJR3F8pvqN+QW4Akd5Rs6/9TZ491khQNCw70giNlDkDI0HakhZ+tQ42+Xi1c+4kBtUN5jaIIOg
 e1asR7mQsHdjoICCWuw==
X-Proofpoint-ORIG-GUID: NdjHnXmleZXJdNQCIeaV6f8cx4zEfN6J
X-Authority-Analysis: v=2.4 cv=dZkVTnXe c=1 sm=1 tr=0 ts=6aba2e3e cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=r2ZyNpLy9wB0e1xT6XIA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: NdjHnXmleZXJdNQCIeaV6f8cx4zEfN6J
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfX2wp4tOnq/cT/
 jvDxaufVQ1Qbt5QHTPHywSSCsC4nGToqQsMI3w28ngbWVnKKW3A4JkArG2pihofUfGbiiYEemBZ
 Q5zDgTJsf1HsXLYA5jVszhmt1boEhmo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280036

> > +     dma_mem_info->vaddr = dma_alloc_coherent(component->dev,
> > +                                              dma_mem_info->alloc_size,
> > +                                              &dma_mem_info->dma_addr,
> > +                                              GFP_KERNEL);
>
>
> snd_pcm_set_managed_buffer().
Thanks for the suggestion. Will switch to
snd_pcm_set_fixed_buffer_all() in a .pcm_new callback in the next
version.
>
> > +static int qaif_platform_copy(struct snd_soc_component *component,
> > +                           struct snd_pcm_substream *substream,
> > +                           int channel, unsigned long pos,
> > +                           struct iov_iter *buf, unsigned long bytes)
> > +{
> > +     struct snd_pcm_runtime *rt = substream->runtime;
> > +     size_t buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
> > +     size_t channel_bytes = buffer_bytes / rt->channels;
> > +     unsigned long offset;
> > +     void *dma_buf;
> > +     size_t copied;
>
> If the buffers are already memory mapped why do we need a copy()
> operation?
With snd_pcm_set_fixed_buffer_all() in .pcm_new the buffer will be
coherent and directly mmap-able, making copy() redundant. Will drop it
in the next version.
-Harendra
