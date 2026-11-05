Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.152.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793913099;
	b=yrk914blBk7dY/WNtr5s5LblDrv+G9zQI5yik4zFUNIXossQI4aIqLgB/M5ZsT2MckXZ
	 nupVBeLiFIvG+Rfxnyq2TA/mpSabmJyD6I6nH0mupefS9/m17WkLGSduBwm8jAGU0J0dU
	 9csnpfmHZuGxR4mkkFifR7xd2kx4ebuVX0BgJg2QZIEXlvwq2sms6fXCX9WVQYug8p/6f
	 /BBWfpPLxdXn0k3RJBngxyuBJ33xt4cb55iU3UFGL4yVIDp7NVxVJxX0JPjEDMsNCB4hu
	 C7/Ezzq0WnzPNLPbrI/ifJsOB0Bp3+hoVf6I7+mhk1Ig6EqgaieIkyfz13rt2O3PHtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913099;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ww/Ky12z8kY0m7ktU2CqeMinUpnlKKPyaD44um6v3bw=;
	b=hgTTtGcND5NyrOuvrCQWgBTMZfe+ikE3g5VSVwxap8dm/mEeSIyB65KTl+UBIP9eKjwc
	 tb86E3U/jlfiwUX7F1RJNx6fMiHXSjUTpiyxviBKCnIDWa1G3TFYQRLwUsamEHQi2RE2Z
	 PEeteNKqTvinqsgUt/k3eqwwovAm9aTEvj0XTV8REdN/GrA91u9KtTGTDEl5eoX+0jrqZ
	 R8rtSfQFBS8Y9lvDVoYJN3/6HaoNL5pb79I2xReoj8V6fsxnK7pIp8wEUw2Q9Pk4YVpZX
	 I0K4/b8Rb0Dm6SGpZKFBGB7X0gXUw6pvuY0lmkO5zoQLchrti98hShfK+XxrwjGUeMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crowdstrike.com;
	spf=pass smtp.mailfrom=crowdstrike.com;
	dkim=pass header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=wmuSZD6G;
	dkim=pass header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=google header.b="Hcmb/f/k";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.152.16
Received: from mx0b-00206402.pphosted.com (mx0b-00206402.pphosted.com [148.163.152.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33206606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33206606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=wmuSZD6G;
	dkim=pass (2048-bit key, unprotected) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=google header.b=Hcmb/f/k
Received: from pps.filterd (m0354655.ppops.net [127.0.0.1])
	by mx0b-00206402.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5KLFlY2433735
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 21:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crowdstrike.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	default; bh=ww/Ky12z8kY0m7ktU2CqeMinUpnlKKPyaD44um6v3bw=; b=wmuS
	ZD6GJgOLyd9o3FxMzCIWfh/isB98pMHOKECgcbilgrNptojIzJa88Fntl8SAKgBy
	7H79EMg9VJaA8qHLYrLktT7RCTByV8pDfGTKiub9g+96E+cR3LhnVWwWtaMOXVZ6
	7UgFDRhReTbkLqFj/8XW8fxIRABa+UaMuGN56w1C79bYx5kFgRGh+nYFWQVp2FgH
	ygNNq46gKOBD/j551zQah9c0c9TS1dd15Azgo0wkSkZWhldBzpZqjoYy5A/F+aq8
	J0b5ydWnNlsXQ162gJ4TqSbwkjsDEX/rLVq3bXP8972y1Fud0LiG+WqWAa0W8QiH
	yGFX5zUlNeJVcqIotQ==
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	by mx0b-00206402.pphosted.com (PPS) with ESMTPS id 4hrm99b1ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:11:32 +0000 (GMT)
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c4d34d6082fso26958966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:11:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793913091; cv=none;
        d=google.com; s=arc-20260327;
        b=LaB02rZXdB2NHrUDzwAIf2j+/Qsa27TI0/B6Fad2w38YxQS7Z0d2f+owtv6YkoX9R5
         +JnEsRlfBApk9Q4VufLjYpHostMI4GJlqpmg1oaaZoZB5RzMvcxmV/ifECJlq1Qeo76+
         NUziq1M44XQaHui7P3L7VtkXoUAiWmsZjy5N9NOmsrSZHKLx07aBpIdnBU0Gdhf7h/cS
         oX/fd28+s41GHsqEAswCxZKXwpqVik3dkOMIKgVhebLs7EJJxWIad5/1f1HCfkDl7Nmm
         StBl9TMOUOACnPx5k8xhTUx1EWP9l58zJqzLqrzUEmEE1yWwJi9unGoZXdMQy1tApxgN
         cruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ww/Ky12z8kY0m7ktU2CqeMinUpnlKKPyaD44um6v3bw=;
        fh=Mf8l2ZacSw2SeMlBhdjuq2NlURFpwLwwQODJnAkrKI0=;
        b=AtVBiW3vPCGjDayu7PgSH48iqc1tCmwlIUDJ0E73rFB6BztQanaOYQM4XhWFY4luxT
         OLjhsfFCF0ISBVoQNG8bx3PTGYs4qLDYo4IF9N8XxxIQunr1/o1KHhGjqRO15wFxDCDt
         V0UsSv72PoXQLeTYx7wvQJWAJZuyhdb6HMiWOQU3VpXWoD/U8YSyMF77ErVYIYiJ8vYS
         RDl0DoyCsPqS9MvU55q0e11GMrkJJMuEPbw2i8T4yTKO7ZcwnUQAmWubgTWG4+d9P/Sx
         vV/ixG2tV3pJmK39Kx7LMPA2QIPWOQ/uqzNWvWzM9uitZ8zlN/iXqSSKasK9OqjNzlOP
         Bb2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crowdstrike.com; s=google; t=1793913091; x=1794517891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ww/Ky12z8kY0m7ktU2CqeMinUpnlKKPyaD44um6v3bw=;
        b=Hcmb/f/kif60JRaO89pC7K6vrAeZqaS9XXmio+c77pBbfy/RTNPa01K8I0mh8oPYI0
         L9c5Gp6aWYIZ7YA75PPrMLB0CGqMgUb2rSEjOM/Xu9NG1/ToVA4LISRUWLQ8siwn8Ow4
         Rn9wzEG3cHERVPD4VdaurcO2x0DptX7aUq7uvZ6pv6UyV4j943KXnMdtlnqOhn1329hg
         7f39RpyZT2LBhhmb6IcA+zfyvmhHwJPTgJF88sEWMja93e+mi8hvMk9EZVtTU5qB3QN4
         Ck59u+gSJ1BzJpjB66yshJe7g8WVh9U6X0daHf/Mmx2fXqS+0CjIhtVH9m30P8mPMIn7
         Rmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913091; x=1794517891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ww/Ky12z8kY0m7ktU2CqeMinUpnlKKPyaD44um6v3bw=;
        b=zzdSgqHmcBXNMzTm6wuNxAFUKdnOLkahd562TORwW4mJuaqV5V8e3znD5aDsAU14QA
         2kx6v0qZGCBGrcUrtvO44NHrWTqUPuCHCONRWVoFkFzW/HfNPlxNNA/4XJ84mVtGux42
         HJi+Lvk56wadorm59x96ElJEKHbZedfSwQBfX0mzaFRXXVPXB536iO/VadjhIdyKl6gq
         57+B/UotdYGoky8AomrjfnWi1M3vO2u0shxQCtoWi7eTdpMnzELCwgj++1J0vu3yhlDk
         EYIoG27XvCROEx+35nWQMJUXzSObPTaR2YDw+qlZu0fArRgW5dT5NILIRuV3FcDjtLch
         nyFw==
X-Forwarded-Encrypted: i=1; AKwUvBw/fBWS/X1KmovsnpnLiQh+rDmViweImnzJvBKIR6+x2QT2eV3kfbZZAiAz/paHXwD0t3VI8MGbrZJV/nI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zv83aiRdlHMMlrAQPIOZkRlkurj34v7ro9y6icfj+LVh0Gia4
	HlU05W6OmBmI2NI/t4HwpUcl56BF5MjCAGDSuIyyKAwY7YVvthwWiN2Ine7R+uITf5RaoYLSuNd
	wUw3XPqN+Pv4MpszoVgSdEd88fQMVoH0CN9oXAO5UUgpYuD3xJ88TaANF8s0L7Dn8lKsUFlKSQE
	4KesAtkB36vP22okdm5qgFwomKD/l9vhws7LFwHcnQ
X-Gm-Gg: AYBFou3mnN9u44F+nSRpnfnj4qmJk6iPGod4uXJiO1R46lKXFytId8dfQgwEw7+24bM
	F9qdZGtjJNgNprCjulSLKZ8biF7bd1N6/ghWj8W0b4zhBgJrXEwM4rf+JMH2FMCY6rkmicUZ58A
	hvFNohXrzsSSvMDTTyTR4yr4guI4tLtSmWFE5GCHWpRT29g7ttKK5EhajX919KXDxh6bBSPRfow
	M+IOSXJBEiZxGKq+T9zubgj6wmJK26/fSyOVQy5BF/ce2O+0WMqeXpUM8kg0kd/lPU4Q8LQwmTs
	3g==
X-Received: by 2002:a17:907:d22:b0:c29:659e:2fd2 with SMTP id a640c23a62f3a-c4d35519e9fmr51349566b.27.1793913090837;
        Thu, 05 Nov 2026 13:11:30 -0800 (PST)
X-Received: by 2002:a17:907:d22:b0:c29:659e:2fd2 with SMTP id
 a640c23a62f3a-c4d35519e9fmr51345666b.27.1793913090205; Thu, 05 Nov 2026
 13:11:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev>
 <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com> <CAPnbwjpQBR-KHwOMG2bo1uhdp22ZW_O5sUj3=vjazVu=Rdnb7A@mail.gmail.com>
 <DMN0RC27TJRM.3KUSPS9QTBV4G@gmail.com>
In-Reply-To: <DMN0RC27TJRM.3KUSPS9QTBV4G@gmail.com>
From: Martin Kelly <martin.kelly@crowdstrike.com>
Date: Thu, 5 Nov 2026 13:10:53 -0800
X-Gm-Features: AclHuK80YOzI2BQNU2ehKijMeyWHkLC1DDyHgXW5LfR8ObnEvZ5A2mjJk9W6SIw
Message-ID: <CAH=2mMD-N+JXZR3eeXf3cOf4snnjkAHjRditS1o1Fb_oxNQEdg@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Mike Bazov <mikeba@sentinelone.com>, JP Kobryn <jp.kobryn@linux.dev>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Eduard Zingerman <eddyz87@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NCBTYWx0ZWRfX1zjdVT8R2vOM
 pqKjnZeg5Se/K4u7yzThef2Di8A70lsqDlyAyuba8TX4painV9pSSuq/0FAAFU9rNZcAZYcblm0
 tJ9EoWZTsE+MPBwe95kP+IO9PU/Pvd+xJQcSqv/ap9UYo3Md0HmjOLrJKV5PJ19zNQ180mtzgXd
 SKoM5+zDmwc0D3oxJy5uM9JLrEXNod8zCfKUx4F9INYOThz3eBY5xWTpkaBNT1EHgWz1bM2rpdx
 KOvgFHIP+kFgkl0do/U61mBAos8mUxD9rJDbxzBJjBxjbcuDrnqXSX4yxNWB+M0KpfUelqg2vUR
 kKg0GWocOBNv9MtYmcVmpu+80VidWy3YHmCE5j7O/eHjdU4ag7lTLGLsR9+cazeALxz+/M1Qun9
 fC8+pSFXwBart5DlvVqlpqcKQHyzLFtayhYtxqNEG2MhNpySoi9JL+tP3HxgYGubwr3nF02yIO7
 WuAzNgo6ocge3s/q1CA==
X-Proofpoint-GUID: NxsmiGEE8HzLPI8pfJhTi4ddWhok_mJ6
X-Proofpoint-ORIG-GUID: NxsmiGEE8HzLPI8pfJhTi4ddWhok_mJ6
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6aecf104 cx=c_pps
 a=D+UBI74RbQA8i2EYnbuvxw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=KZhmPCYDdY0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=T2KQ53IYiC3MXPrxx8bB:22
 a=vDKVRhTs-M86Ea50iKLw:22 a=pGLkceISAAAA:8 a=FZbjhw69-ufqTzFgkyEA:9
 a=QEXdDO2ut3YA:10 a=PsfoTyiJ_72bb7xyA04f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NCBTYWx0ZWRfX8j6gQt9GLyu3
 +ydmPvJKTvoJqHnW9tLLgjBKe5JTLntWeun+xTq4nEgQgffxN8A64OfFz3Yu+Vnn+onZCxXPTWp
 ieCOuO1Sv7pK0ZjGeJyqbxaHsJUgUyrHf/AKn4TTKVNl8Rj0dZ1/
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050084

On Wed, Nov 4, 2026 at 9:21=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> >      run_cnt 38040015, recursion_misses 4063
>
> hmm. you really cannot tolerate that small drop? it's tracing at the end.

We realize tracing programs don't have a full guarantee, but prior to
7.0 and HRTICK, they were still reliable in many practical cases. It's
less about the absolute rate and more that the same workload had a
~35-300x increased drop rate (depending on hook) in one release, and
that behavior is now the default. Since the long-term direction of the
kernel is for more preemption, the recursion_misses issue looks like it
will keep getting worse until we can move away from per-CPU BPF
recursion counters.

> Also it needs to be per-task + per-prog. How will it look like?

We're going to look into options for per-task + per-prog tracking and
let you know how it goes.

Thanks,
Martin
