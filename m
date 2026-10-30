Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793319844;
	b=TmH0iBpowwAef7OyXtduqYMW2yTLsMo3U1TLUju92QqP9Sq4j86qhA45Dlh5b/DRhNZA
	 ZWAlncALHgEVT886zrTXNvV4/UtMqO1PzeKSXeyc0XEy9V7ZP3TIRzBJaV7VXwpx8CPtI
	 DScMEpY1mQLRjbPspxY6APqFf5K8zABoS+p+gksfTuJTBWumVhvT2E8CalyujzPVfrCn8
	 DSTB+uJmzgG9N+jIpOcD17REd9ZP+N8hrrmVnqL2AKbrKBXj+Y/ytnnNiINWNp3Cq6rB2
	 sL2qwsUTvykFOWkVGdRtvryXVbzhtT4Yz+4m/BMAVhCXSWeGUVebBN6Uw1zJZYhjeaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793319844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
	b=3yxoRneVZdTHovPwXVmuT1avzYI38WnnaFkAy7OUeMZ3OO11NuN5xZd/29BaiW9BoQAn
	 GybyZF1hOC4mpncFGKK1skTj93zXmiU5sVAYyuN4XNzoBLNuodNynLaYWKDWy1H05OSK3
	 NT/s8zrAXKEx2I0heXJwdIZ+VcPm1ORCQGK1Z8eP6SYxY/ZLi7MWZlfmX5UbD+7mRCg2+
	 K/BgHIgnHFt8noij04oOFM5ehSelK/7/ezNdTBTuLeHbLYReCBG4mtPkoWkgg9dFt73Eh
	 R4dq4KCukAcvVChYiKqswPKUh6xJmlZDRjYnrpHBFN78PofgmroR972p1NI55HiY1Ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LpGlNmog;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56244606A326
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56244606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LpGlNmog
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c40f29667e6so15190466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793319843; cv=none;
        d=google.com; s=arc-20260327;
        b=SH/vNpjp3wYiW3t78TlD+msirtuHxNgCq/WlR14ZmrmlbXuIaCyXTvgU+c9RlgWQuV
         j+jcJQ7q1cMhbtAhWh4wkWeckK2nY99Xb8sPKPvGffXPrE1dI6ATEmLz9N+zKFqT4tup
         W3fvyo/nMcsycTWZhe+4yM9iVcCNpSeiZTb89JKRSQtqI+jasNg580qUT2sdOgMtTWSi
         H5Ss0HWUamn/z7nDdzz40x6JYlGNCW/0ohhArPfYXMH44T8r1auj73XEo/UV+ejt2IGM
         gH1x+AxYkj5HlNfbxaQ69suvHqvt/wvHf9v7Q6KAH2JRVern/CCsST8Hq+scynY646aJ
         yoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
        fh=lQ6BOEgtFSe5IuP3BBKTfxqGBVUNudQfsjjH96K4w6c=;
        b=hwCjZEf/1yVQdvxKgDtrb16Msxulv7sYijRJOwLIHf76QCJavGzv4ShBZDQG2enluA
         vJbjS7SC3yGQDGYPxD+XP6X3De3LSzpHDgjw7L+KaL9Sptok6ZfeZvx5Sl8n9jQa3k+R
         hP4kSHPT3vzoInaRudqnS77r9O2pN5eDiKLlP6rBwRuB8bHBDNHVhwTRHUK7p3G6zLRe
         +lrR8aYEBF5swHiruHqb0P9ugdfkrh7OhLLxG0ksNVRe9dLaOrC+4uCNzIwRbDioMX5F
         M2vFSGoOl74yu6UonF6LzMnciGO76YAY4RvMFtg/4EnNTt48eeAqma+0D6ZfV0CMN9IH
         hiLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793319843; x=1793924643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
        b=LpGlNmogTRImOIcoGkVK6kX1FwvGGuvBqIqbOQmm5KJ3xSt2iFKkzmTKCxMImHdVaB
         aDfTjwZqyoMW2Iv2ufgeHFBdYwUo31Cysp7oHlTZ5mddkgutsSip90Yu0xuL4dwsjPlG
         H2d2o1NYWkpAmpZotlXfjCTbgYadKtl2mltD866hVzSHDvqBS7/xSgXNB9gCvo5NaMp6
         UR5LppzANcnsvAThS9ZzZ+t3lqd2cQjUINGMXJlzmHMLf95KKq7TGISjrOlO8RGNlmd6
         PEsSvEAPMgc2Des3Z6s7C7VBy/qcyKQWcN9VLLn5h9MLqOJtFhjlOBczCmc7Ss729Ap1
         cjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793319843; x=1793924643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
        b=0TtAHGUd1crZGpfpfpSh8VFSExHFHo/UBMZNanrG+bmyXQBi77LxlLd5V6npAbVvvf
         BcOp4yFf4bq1NQFIf+Qb8IBdFgXpgWjoCerJbuIc3kmqrGKuXyzow/Ro0loPFcImnkxM
         Uikm2iZp1gJDYC1YLnwREgimODk6uAPU0Y06R2bHN/DjQFcd/d/TCuqmtCnazuKEbBTN
         Re865Q25J+ycWG+AHXdVwMzcnLa8RH9EUbDNRsQJQXnY24Q34kvaLWgoctgc5EOw2wE9
         hL3tmD2PmOClBQ4b8VsOWFwURlLtTFq58g9XOScE4GUsAN5ex2OlRaDZ6Glv1+KPV2kq
         9vRw==
X-Forwarded-Encrypted: i=1; AKwUvBwYfD8AatjDQoXqMSuPpw92dMyYsFusPX/zuULNJ1+HMn9rZDcx2toxQp8XUZleADtYkwvjbrWY6YH7qaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBZ3ondBiPkg3+3ZYJ5kdRsCBlpovDPRFfH6VKBdfXEjIWJT5f
	SjUoVaU/K6Au/o6W/lTkXD3B13xTXoumObFP0GhLwUS1SJ1fFn3+/YKleuOq9GzT+ZsMhg4MX5V
	LWrt0Ed0nbm9ag3UqO/GPDbRph1W7MQOvoW1YXjz4
X-Gm-Gg: AYBFou20YMBdklvkt8hmkXNnwCgc9sAbe1nFyWtPnwNDKSHh8Zf23Z9OvUaZRD0EQ/L
	eL2a4Xyf4rS3a5tnMKHSN0vJMQTIyhqmJ6Yulnbrh8pdLLvRNobJ3ytEjP1Mag6HHRoodTsg874
	mOkAmEV18roFdqJIzFSq9Ei6FxQGEl6WCnthcUpMQrz+VLGFfdFalk8uKT99/QCyl81Yp26Hb8o
	kUH0OwH0d+TizLOTINoEcygfGhkTBkZDzw2pgFNenkHhxNwpNgd6wqpb2fsvsvIcpOw7AxVjbeT
	gdpD5xVjTIRtVqdV8mtq/bK69JJDeVgE4vVEdgvIOAJ3hfUGWn3FPjQThm5SQvO0sYEssmUVWtH
	4eXYGNUbbOssLH8F+ZDn3mTuyBFvKRWxvGgzeMTiwSSaEM9T52I2tCBUbweKt2p3H0ef64F0I/Z
	ti4yY+9gStRfDCNQ3J
X-Received: by 2002:a17:907:6d20:b0:c46:7643:ae91 with SMTP id
 a640c23a62f3a-c4ca7a08673mr59997166b.8.1793319842360; Thu, 29 Oct 2026
 17:24:02 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <CAEf4Bzb--Jzz696u057G9_CgQN7zf6ksvoL80KJacKO2CorsnQ@mail.gmail.com>
 <CAG2Kctojb7xiOqTmwWqoAKFaNUECjOzXVc_t6KbG13Pqm2dbng@mail.gmail.com>
 <CAEf4Bzbs8F1DPBz=WXVTExrrNjzvaFsi4L+HEj+zbUTpPSTX5g@mail.gmail.com>
 <CAG2KctpSTCyWQHgJ8GyFEhHPdFawUa6zy0g7rkfCcujJRN6f6w@mail.gmail.com> <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
In-Reply-To: <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Oct 2026 17:23:50 -0700
X-Gm-Features: AclHuK_8kDb2R9N0iMUoVO0Y5pzDVtS-1XOT4NszWcH8axoYKkVXrpd6hnWmpKQ
Message-ID: <CAG2KctrkKOTdsjWVRBEHuH45-9xpYsxDTk8PpZ4Gu6Ygq1Azew@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:54=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Oct 29, 2026 at 3:36=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:

[...]

> > I envision ALL_MATCHES to do some form of lower_bound() +
> > upper_bound() on vmlinux since it's sorted, and then linear scan of
> > all modules. Of course, just one of the two or both aforementioned
> > things depending on the module filter (any, vmlinux, module).
>
> no point in upper_bound() if it's sorted, you just start at
> lower_bound and go linearly from there. I don't think it's realistic
> to assume large number of duplicates, so I wouldn't optize for that,
> one log(N) lower bound + linear scan will be faster in most cases,
> probably

Ack, lower_bound() + linear almost certainly will be faster in practice.

[...]

> > My understanding is that the size is encoded in the ioctl command
> > itself: _IOWR() puts sizeof(struct) into the command number when
> > userspace is compiled, so _IOC_SIZE(cmd) is the struct size of the
> > header the caller was built against.
> >
>
> oh, interesting, I didn't realize we embed struct size into ioctl cmd
> and match it exactly. I see that pm_scan_arg has the same __u64 size
> in the struct approach, I'd stick to that, and when we extend any of
> them we'd need to make sure to either ignore or hard-code the size
> part, hm..

Ack, will include the size in the struct for v3.

[...]
