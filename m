Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793730862;
	b=v18aMCvm7YcBqmawtLhAKDgu4Yxz9wjNZgKXSLd6PI8LsX7N/W71ndUX8fDjZKwyJOKP
	 JqnF2qhIRj/6WnZjJuzKfFxzXoYLBgpN2AJEVQWU5JhrxAmfSETAqFZE7rtM/fO8sVlcJ
	 dl5sh4992nNd6TymYUrVS0Xf/QPU7CyFWhGWANbGupJhAzC/iEwHdcc132QXVUS/cmTxo
	 12cUg/b7OJ6zSsfWk2OJWYREu1EZbKOddcNFC/O8KNYXnARZji64q0XEOiqs+TN6KDTrf
	 brosUJU7w+X6Rb0FknvvGuQvWXQzrrvEhNs8okevxSZ+UwM5o4uv8+L/WXA+xp6kdpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/GFDLlgK5HAoW68o12U8J+27i2IlZDakQ4ajhKBmDhE=;
	b=A7pqJoIsUaD5rBYEfwvRSnUo2vvgwDNaWzbkLt27Qq6sCLMW77JA4qWnKjw9nx47UJQx
	 9yvUgiRPBmWZyLIfaQZHbpq0GhYCyjL237MNX+c9cK8Dqc+SBJJmOgHvYEKJqXAsdOlWP
	 7JTJ2BRH6kkwRyHww7u20ZG0n3yykxkG0IcNavGGUyuIGMnBnJOt8JDwFo0zSy3pI0AEr
	 4Khnmx6WcRa/GYNw4RcBmzt9tb3rhMXghQg5W1Q6Hn7HAgiISDcW2sf/E8453kA5nfAz0
	 w42q05AYB4kYjiHyhgLQ7mliLhjRkzh8ii+dFuDFEldwOdkmcC+D2zUn/VpKPa8mYwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WzHT2IwS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIq6Vzoc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AD1606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21AD1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WzHT2IwS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIq6Vzoc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPTdb3161487
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 18:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GFDLlgK5HAoW68o12U8J+27i2IlZDakQ4ajhKBmDhE=; b=WzHT2IwSgehWqDBq
	Vhz4Z5HT67p975+82qgbF5lx8OMrgUUckAAC48pzuFP6cikOxUP75dOGOMhUXWAc
	IU/ReqlodDXuPIJ42m9zDtRAVrx+4AuqiCjtVGd3mk6/lw/omR8BDRc10f+bvBhU
	A0DO++soEbUHhFft2IJVQQgudalGQJ1FE1goSxAryWq+gnrqcZoobipGe0sE/l/8
	0lOaiCimWHv3jjS/lGi86j+ih2wWBzA4EfHnNZpe5+oDdbwF3KvvE+n65bfDclnC
	8OMZxKtfbNAuXV0ERkHs6IzEASzbdZ1yKPwxy2n/lpQr38PhZYjSTrSPPgzcYrP9
	WH1cTA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bh8rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:34:19 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67bec5d62ebso117609d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:34:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793730859; cv=none;
        d=google.com; s=arc-20260327;
        b=eyhbsV/eOJpKhvqXkqpxhoWac03W1c+K+hPnziGX95TVEw7sdUToIpQyiE/SUKz4IM
         jRqZMMSETxp8tvvv4pdMGBzegplhK/N+pb9OHZuNvmvXEYqjofRuIvNW4QiwULfnM9MN
         iKkN5QznyNuyv7lDiqDHKIL3THkNs1cLNGuRqoDDs3+uHbH3VeENGos7QAOhRTRjeP0s
         BdsEtLzPONeHIECLGj6YCSak7gjO8yoPe4EN30maBTHKT5T2dyi1z9nid/hd+f62Viz8
         lN5VGAMMRiyTPi9llD3wE9XOCBKoo0qqn3tqAfz0YxmggqGSC95J1IgVidmpUG/xpps7
         lY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/GFDLlgK5HAoW68o12U8J+27i2IlZDakQ4ajhKBmDhE=;
        fh=hjMfK+jEFa8vOle+LzVBrV9O5Ny6a0s3P5KXozC8ePY=;
        b=KqP9Wdw/Tmc63pCKuhArH8LNF5O+Cvd4f7pU+AAdZj9IDeqUHja/LWB7lwR261tZ5x
         718Cx2nlJaAy7kzP+g0Zfh/+xf9uJya/WqGnRu4xHJhmtJHydWhW1zQnv7A/qYOBZl0w
         qfTJz+6E81eKp5kzTpQwhThoOOL7btoaD67EgjO7NdNSyzkMrrp8GqQOAwfXxWTAxg+H
         H/HUox1pMMeXx/y8ma3yL/LDw2DocP7Xyy9J57H5GYCZpY61dMCMRxrvKdfzqUWCcqMq
         DkFpScyPbctB00iN5HRiKkurHfSWtlxEAJqRTJQ50LFWesql18/e/tct4epj1YEBauBI
         CBow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793730859; x=1794335659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/GFDLlgK5HAoW68o12U8J+27i2IlZDakQ4ajhKBmDhE=;
        b=AIq6VzocRIxKkk8ARUG7ZEUZqJyqhN8weKZpJhFifmBVUeXFdJ7PeA9cLZXPYH1tCU
         IRZ+skH5IsPMTiZWKgrWy1CNUUW/JObaCHwoHRnNBPasCaDj9lqyxbHoASmyfKdZBYRQ
         7FTxGEJ+Y9Wc5HRoodX1y3PB8A/QxrKdOznZpljaeeGZznSTKZaoExQuRafmjIG0oPq6
         w+398qVZig3+502yLaeCfQAoTh5HgvLejYpCLSFiZJ48EuFOS8geB/xxuKBi9otakpDE
         l/draJ3sLU19EEQdJAD91Vzkf05eWbtlq0ysGXaVf4Hc469x+Iz7zeNF3RpflPg636DA
         0KpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730859; x=1794335659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GFDLlgK5HAoW68o12U8J+27i2IlZDakQ4ajhKBmDhE=;
        b=CNEKcdR0KkscaWsNoF79FYroZlam/F8CGMBL5//hpGAHTEoHiwj4YbHz3lRKIzogq/
         rqWhoVglZT8l7NmuIp1bh0o9RhwHvPBG8ptQplt5Si4NwT986uOYVcIRwLZdKxyoKubU
         bOZVOsgnbTYN+H8/Fcaw0l80r+ZVFU9jw1hsZv4o9Txoe0yEq6bWUqCDG9flVC1Jn7Id
         b5tJCOuO9ZV1gzW0c6/XL3/HB3H5U90lHw1XNwz6cvQgL7KsOJr+Nl1c2sb4pOUlvhlp
         eryB0r/va7lOIobo3oQKQxDKMahuJmYJoyahZEuh3LmC2MZNzTKy7vVYH6nl6jNZayjF
         R0/A==
X-Forwarded-Encrypted: i=1; AKwUvBxvrpZ2Sa+D0seEMxWciAOhw1TmUve6b3W7e8MgubnMrQybuJ/RiLxAEz+i0DSIxMhN3QoX/Bmwz0f4F+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4c4Oj+PMcLrj8+wEIZVdutOFBTm2fuCimXAE+Ad4RXp/AkIQz
	Gc1HMJq6JJhM1Gwn0ULfZt5XSfbmst/SDNJGlqofQA6E3qH8PJX7Oj572JF5Vp/H3bhA55uSfBD
	tJvpL9H3aI36XjUPedS+jItZFpSIDsOiKI46xokZGAb6n04bM1I+C24lkx3RP/HW2eyc8pQwCfv
	B6w52Uv4YK5nTq/t4PLVchTRWtTqj0wpnEJmXZa9tjTA==
X-Gm-Gg: AYBFou2hyXSB4kBUiDWAqEyID98IfvnQsTbXbCfYStmIRxEn571PiE8iBUCtp6UhRqO
	k8q8uAUCAn3q5f+RxbouK+9/GEAk/kMsMy3VJYgUPeBoftgEArKP5foBbYdemTpYbCpK9I+jG07
	T3ReHK8MT9F4cNxvrnarOIJWI0O0PqPda3QMdbbFCrbxE/E1m38s8ZJZlv5S7kvqTjDx9VWv5v7
	zftDCVwmQgvfWhNfMRCGRgL/LrOCDEbr2VNHOSP
X-Received: by 2002:a05:690e:4088:b0:67b:bb72:dd09 with SMTP id 956f58d0204a3-67bbb72e7a7mr7242606d50.44.1793730859327;
        Tue, 03 Nov 2026 10:34:19 -0800 (PST)
X-Received: by 2002:a05:690e:4088:b0:67b:bb72:dd09 with SMTP id
 956f58d0204a3-67bbb72e7a7mr7242592d50.44.1793730858912; Tue, 03 Nov 2026
 10:34:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023210238.551855-1-g.osokin@auroraos.dev>
In-Reply-To: <20261023210238.551855-1-g.osokin@auroraos.dev>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 19:34:08 +0100
X-Gm-Features: AclHuK_m9Jis2nJnxj8Yo9gCVbFV_e32G26TRERoPo0wBnnCXCaoIJVZvpoofSI
Message-ID: <CAGgiveXkWxrdeRYCxBC9X0eQSUAAxF5N+ioe3iM6GZ=pSqHHeg@mail.gmail.com>
Subject: Re: [PATCH] tee: shm: don't warn on an oversized page array in register_shm_helper()
To: Georgiy Osokin <g.osokin@auroraos.dev>, Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jenswi@kernel.org>, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3MyBTYWx0ZWRfXzeabx860OVYd
 97nEcWPFGQCmOkJR6P5d4ga2LXJItgFml5O0BXoigXcdtD91oM35PN7fxaGL9ZjY5w/L7uEd+MX
 HQsxIOmYwoB0MryPROlPURvdd9qcFqE=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6aea292b cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=HH5vDtPzAAAA:8
 a=c0YJ09nfCN-JFu4Q_T8A:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-ORIG-GUID: xzx7DF0R9DKbtoUhTTzASscZeIwbMiXq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3MyBTYWx0ZWRfX/faZnz70B893
 LD1kNICgpOSorR8+OBELEJSX+2VcrRMCCzqiUjdUUPTJQKF/z0sbfquDr0+SJeYixxJZLeca8RB
 0puoEK2hbh2SmRePpSULnwLZMysFvm23xYh1GGhCo4LreMccoHnCzb4yIDmKCPQyJiGXl+fSvXR
 j5Sz36KVhItYbcqjq8v71ZkZ4378zM8X02Oh5DI+dKwgphJn17CiLNrlXBfzN6duToTrajYB5Wy
 j1lPJUyX6HOkw1DaAQMB/SDRpZp3YAW0KKOrwr7yETKmFQc3vvbL8RHJaiTK94dsn9+6u2CCfQN
 UZhh+uj8sox0EiKOwKI27ZS2F6+InSIef5bEOLpbqK8hg/a0tVUuG98VpGNmV5Ore8L6I1BPFIj
 Z7yhPdOND4fTu6DxHjV0dOK3aTs4s9fIzhh+Kgq34pf5ZvJZ1mMYh6+nVDGFwcYePEwqTdjkB/y
 RLm7A/28iI+dLg58paw==
X-Proofpoint-GUID: xzx7DF0R9DKbtoUhTTzASscZeIwbMiXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030073

Hi,

On Fri, Oct 23, 2026 at 11:03=E2=80=AFPM Georgiy Osokin <g.osokin@auroraos.=
dev> wrote:
>
> register_shm_helper() sizes shm->pages from the length passed to
> TEE_IOC_SHM_REGISTER and allocates it with kzalloc_objs(). A length above
> 2 GiB makes the array larger than the page allocator can serve in one
> block (MAX_PAGE_ORDER), so it trips its order warning; on a panic_on_warn
> kernel that is a panic.
>
> The size comes from userspace and the request fails with -ENOMEM anyway,
> so pass __GFP_NOWARN. kvzalloc_objs() would not help since kvmalloc
> warns above INT_MAX as well.
>
> Fixes: 033ddf12bcf5 ("tee: add register user memory")
> Cc: stable@vger.kernel.org
> Cc: lvc-project@linuxtesting.org
> Signed-off-by: Georgiy Osokin <g.osokin@auroraos.dev>
> ---
>  drivers/tee/tee_shm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 6742b35..d539988 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -438,7 +438,8 @@ register_shm_helper(struct tee_context *ctx, struct i=
ov_iter *iter, u32 flags,
>                 goto err_free_shm;
>         }
>
> -       shm->pages =3D kzalloc_objs(*shm->pages, num_pages);
> +       shm->pages =3D kzalloc_objs(*shm->pages, num_pages,
> +                                 GFP_KERNEL | __GFP_NOWARN);
>         if (!shm->pages) {
>                 ret =3D ERR_PTR(-ENOMEM);
>                 goto err_free_shm;
>
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> --
> 2.54.0
>

Looks good. Sumit, do you agree?

Cheers,
Jens
