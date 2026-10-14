Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7478C361651
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791955995; cv=none; b=REZsViwLVAngtXhtfHI5eHNFp0wYkoI2V0R0gxDSyG8mTvejoW4Q8nLGRuLO7ZVKm2BvRlrql2DjBRefg8jcj2uXADs4TTCgYD0gq8CKmoZrdEe86dhWTOaKJ4g0QizNOXT/9ZZ+lAtBArpQw1KjzHp3WWQOQ7YtJbuwgMne1C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791955995; c=relaxed/simple;
	bh=2v0xBdDVEMgqqZNKCUABWNq+F+2xWOLM0pRhTtctq1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUpt7UQB/TGlXcL/BK6n5wt8Rlogec6j89NbILbRf2XvzTcbCgKBTSEQ4xHlRsLzyJWuc5zeRJjzNn0BE+kuoztcsq8dP91HPfwryhWgRg47J0yMY7H0IoAx4gU7ksPaQQyDXwHp9/Osfg9WW8Xujplo5uh8TOPlcDiIlqHqUnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fqTvsewP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LEN+Zh8N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fqTvsewP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LEN+Zh8N"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DMVDWt3104067
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NwYCzFamUz6JWqnCtRiF1HGf20u7HKf9g47iiBgNPPc=; b=fqTvsewPyKUL9RNx
	sXl65tB155PmCVjk+dg9zD1nKu8rocpANJYQZHV3/I+R/+vJBc/u0wsjT68w0+Ck
	eSiaOWPPKoFuarTM7gIk9VDv8JwSwhKaETF1Mdd96QEVNGVv0ZU1zntZpWfhlbM8
	vb+LWRBSBWWBJ0cR7hqYEfL2sd8bjZtWvkzVZ7HAgYp0YP1QetXfpTSdomLyEg65
	LQObG9ZHef6uznNVO8kDavxD6K8OLnZQWQ2FZhCTmszKtUjFQAU7ogHai2bWjVOr
	OLxKEeTdgmAVRuBh/vqs0a3H0YxheXgHO6YjQY2wUoJa7PbJB/L+uUhivS1sSgYt
	NmFNBA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9wgt19fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:33:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso3704492a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791955992; x=1792560792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NwYCzFamUz6JWqnCtRiF1HGf20u7HKf9g47iiBgNPPc=;
        b=LEN+Zh8Nbc8/02Aa4LPuRxl3H693SFzST5pkGWEYnqXjZhh2/sLXfuW271vwUeCEq5
         gfbUYj/aEUmprmM1SXAsKK5QDpNsLh+xdsNtN9vbBYn/+uVAFkeii14UcrK/kFiJ2H9L
         c1zT10buPGBf8LAAMw4CqYcwgpzY4b4yrHvzyHgv4XjRZ8Wikl/XE/xFijbq2/arL/31
         xe4CFWSVnp9RUKLebo4kkXENUsAB8uRmUatLTOSahtOBiiCIZOCUQcfHjTDmDoI5Q9eU
         dx4VRPyhWoSvBJ9l3WMU5ysSulIqZU6SCeS5H6iNSjlqLg2R7HCw9B0RrqLqBrkUuYDV
         k8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791955992; x=1792560792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NwYCzFamUz6JWqnCtRiF1HGf20u7HKf9g47iiBgNPPc=;
        b=Mzqa4FGXQwEuh0ro5ERV9zGWGbyK04v12hngNy5x9ZIJCjvTEaMUvv1QR3055dkh4o
         6yHk58RwDB+/9SDztoon19Ww6QE2UexBKfVF1hVn7FbdQEFeKA8L1luL2LrbAhv1kONt
         B6NxpL01G1+CSjHXpwGwEPPJoiyWkQ7SycV7Q0wDdJJCsPuqL3aAhkpjr57vAdqfzyKH
         eCtMuFQUv6RCb6Neqa0w1xpz4GHbv/6rmd7h2KAUDBshdhQR5Wt5y08p4pqNPEpbQ2Nt
         vRVE4X3F4WA6LiakWlHNftFe78qn94F0b5wPV7VOtSo4QGftlYjaHy835Jewc+EiKxHF
         x1lg==
X-Forwarded-Encrypted: i=1; AKwUvBwMH2JYgKQzypZwY4ffC1x7uEoO2x8fKprdkLfnqu+RRLUWVVyyrs/5J+61ZQiqfCwyNPuYMgfQggBSpGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLI/32FN2DOH/vn9FW57H3h/QhFZpOlOWCoiRa1vMDVuLbD4iQ
	5bJkAFi3MYcgtBPIGD17/6dEhuyn3jEIkpCNRY1vFEjBY/aUt36RQQapan3sUBbyJCGBsIttfh+
	gEcjOPIS7oMGjnF9x6rSQy6Ca6iLOjaGyBaVkkL2P2YgtaMGSvA03vAjnhG9kaiIdz2c=
X-Gm-Gg: AYBFou1GGwRQKMj8EsfqV40JJ4wrrNTjm3uGJSFHTBBsw86HX7pXsP3SSkUOXN6QVtb
	nPOdo/domJ1mNHqfvDsMHBmsXNTibNmHPmvj3IufLccG8WZPXChpaVqxCSYb7V9Vt6otkBja6dx
	dxUwA9V5CX6jJXhEJ6YP8lUh1Kxla2WPXlomcGUKL7Kp0aLr9fcmHTxfPS8AK6Wu1ayexiTl1wK
	TzMz6GhlVhAs/+GZYRbNoBkv1FO6YSy2eyNss/0YBtO3V7yFW+K/spX8rc8wm0CIk+G26YguRCz
	nbyx5SZa6XYdsNyjHz3nuOfSJ9Im4jQv902KxRopTcAvOlqo7NMZXzUHXt4C3Fjfj6tUXSsyzFT
	O8z8ENs27L7s4Xp61V7P55/X7wD+F
X-Received: by 2002:a17:90b:35c2:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3ac7c52fe5amr69190a91.50.1791955992219;
        Tue, 13 Oct 2026 22:33:12 -0700 (PDT)
X-Received: by 2002:a17:90b:35c2:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3ac7c52fe5amr69168a91.50.1791955991609;
        Tue, 13 Oct 2026 22:33:11 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6019ca59sm2972612a91.9.2026.10.13.22.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 22:33:11 -0700 (PDT)
Message-ID: <293dc185-5714-4a12-a0ab-a767e81a88a2@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 11:03:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misc: fastrpc: Fix double free and races in
 fastrpc_req_mmap() error path
To: Yao Yiqi <yaoyiqi3@huawei.com>, Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260930071340.2969948-1-yaoyiqi3@huawei.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260930071340.2969948-1-yaoyiqi3@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyMSBTYWx0ZWRfX9t2zZdJeitTT
 7UW4qcyox2cS6cXUgtzMtLwpasrKqpcmA8qzx4/6G0efsACW3g0/GutuEbaNWQklKC1WRZ6lDMQ
 xwtdfZD52X8fgHFJp4HiG/8zQ3CC1iisk/vAXaV7TWGGgwiwDxHIM968sMl38AgMXbyJroKd8G2
 YWMXde1s0kUXbPg8PH63jNlsxIEjICYrO/FtqbB9LlI8Xa7w4ADgTPNFMLy/ra1bQzyc+bCgInW
 zvHUB3voJTIWalfz23vIGWJn2ZJEOWdeyII9+MO1xQpzEjOqXx5hQ8PlL00Abp/jPObVoFOHsxj
 jt88fnvDSUf/G1E/Fp+ULD7pLYRhWLO5w91IHzg1yD4j8RdLY911rdtd76CxEWY9+rogh5cb6B/
 Kvyy8rWWD/4+3ShC8Y7anXbMWo1yjqprjxCD+lJRooGMp7I7tTZVBwWfuSp21MOQsJotr8NrGly
 zyL0xiAzEpkPGXCjrrg==
X-Authority-Analysis: v=2.4 cv=Jp1kP84C c=1 sm=1 tr=0 ts=6acf1419 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=lqT82U607IzybvAi_igA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 6beFUobwjRZsS9qnXthA29antfJH0KnI
X-Proofpoint-ORIG-GUID: 6beFUobwjRZsS9qnXthA29antfJH0KnI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyMSBTYWx0ZWRfXwh26AyUM1GuM
 bPe9W4aGg7EggqjH1pfVbyKiTCopJhigOytZy5u2E0Cr+51W4jcb3tGscYNhwNVYfSw8x4+9a8z
 K65JbwsJtm2Gy/rQ6QCNYQ9aVVB2blc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140021

On 30-09-2026 12:43, Yao Yiqi wrote:
> fastrpc_req_mmap() links the newly allocated buffer into fl->mmaps before
> copying the response back to userspace. If copy_to_user() fails, the
> err_assign path calls fastrpc_req_munmap_impl() to unmap the buffer from
> the DSP and, on success, to free it.
> 
> Since commit 6102ceb4eab8 ("misc: fastrpc: Remove buffer from list prior
> to unmap operation"), fastrpc_req_munmap_impl() no longer removes the
> buffer from fl->mmaps, as that is now the responsibility of the caller.
> fastrpc_req_mmap() was not updated accordingly, so the buffer is freed
> while still linked in the list. The fl->mmaps cleanup in
> fastrpc_user_free() then calls list_del() and fastrpc_buf_free() on the
> already freed buffer, resulting in a use-after-free and a double free.
> 
> Publishing the buffer before copy_to_user() returns is also racy:
> another thread of the same process can read the DSP address from the
> partially written user buffer (or via userfaultfd) and issue
> FASTRPC_IOCTL_MUNMAP, which unlinks and frees the buffer while
> fastrpc_req_mmap() is still using it.
> 
> Fix this by adding the buffer to fl->mmaps only after copy_to_user() has
> succeeded, so the buffer is not visible to a concurrent unmap while the
> response is still being copied. If unmapping the buffer fails on the
> error path, fastrpc_buf_free() is not called, so re-add the buffer to
> fl->mmaps to keep it tracked and let fastrpc_user_free() reclaim it on
> release instead of leaking the DMA allocation.
> 
> Fixes: 6102ceb4eab8 ("misc: fastrpc: Remove buffer from list prior to unmap operation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yao Yiqi <yaoyiqi3@huawei.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

> ---
> Changes in v3:
>  - Re-add the buffer to fl->mmaps if unmapping it on the error path
>    fails, since fastrpc_buf_free() is not called in that case and the
>    DMA allocation would otherwise be leaked.
> 
> Changes in v2:
>  - Link the buffer into fl->mmaps only after copy_to_user() succeeds.
>    Besides fixing the double free, this also closes the concurrent
>    FASTRPC_IOCTL_MUNMAP race, where a partially written user buffer let
>    another thread unmap and free the buffer while fastrpc_req_mmap() was
>    still using it.
> 
>  drivers/misc/fastrpc.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d4fac2caca86..917a5dfe3774 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2153,22 +2153,26 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  		}
>  	}
>  
> -	spin_lock(&fl->lock);
> -	list_add_tail(&buf->node, &fl->mmaps);
> -	spin_unlock(&fl->lock);
> -
>  	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>  		err = -EFAULT;
>  		goto err_assign;
>  	}
>  
> +	spin_lock(&fl->lock);
> +	list_add_tail(&buf->node, &fl->mmaps);
> +	spin_unlock(&fl->lock);
> +
>  	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>  		buf->raddr, buf->size);
>  
>  	return 0;
>  
>  err_assign:
> -	fastrpc_req_munmap_impl(fl, buf);
> +	if (fastrpc_req_munmap_impl(fl, buf)) {
> +		spin_lock(&fl->lock);
> +		list_add_tail(&buf->node, &fl->mmaps);
> +		spin_unlock(&fl->lock);
> +	}
>  
>  	return err;
>  }

