Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793914614;
	b=GHT0CxDFHZE7ANRhfWsfO2MHWPile5nmLCx5C6JBHKbF3SWCR8/VogMPTbyHCFOU2y+c
	 mWuaPJt2imxy1jErdm055mnUXpp8IwTMFuu/GsG9Dna4fvlAKsoLbsJgeTYqRMtF8tDDp
	 C1mbUdVfy/gi3YAgMhenz74KzB9+vD1TsEVrVd3+CX4Y+5Fh7yjlu7HNvVjxW7pqyGdk8
	 dutpkeHzoSAdmm0HMfR5OwueigTG3iy3ncZUtHrS7xpO1HCuWXuZHyQwKU5XKg9ABLFR/
	 +sacyHKpGmw+NzyI+t0CF6rSjO1VNMzZX6c6j/Zce5iuwEOTvMPawtQ30sU+xYdhtOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
	b=qmp7GbI5lhCBz53BNziOSokQR3Pr6afF/1R4cyD+Odo7SzKvXHeo3lZd8yqRcD1694Mf
	 u71o1ztbxH2GipIQPB3rDat+0UHUuEsOTDa9BI/2AIFl0hp3lfBz5pEskxUeREgu5J3FT
	 4iHi1p+AHeLXoAED8cunpjmOsW5fbkhZqWvOg86XpHYHpRqyq2pnClhAz5m5qENsaC+es
	 0RbxQ89YxyDiiFwfefKc7v6rvLxu4l54AS5QSy7gml8Nvgybmss3MWu2by+A6J5YGzbHL
	 UmWqzl3XrVKq9G8PFf8qttphU6vxsSDVugWUeHpbboTNSihwjfde2YhfrZOTb5yHrVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qNV3YK2A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6174606A33F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6174606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qNV3YK2A
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c45551fa84eso388535266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:36:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793914612; cv=none;
        d=google.com; s=arc-20260327;
        b=HT/hlc1YYRltu7tIEt9G7iavwkq2DJIJERvLMKm1erJ27qVrgMIOmz8DBVY5ImzWxX
         +xrTth0vFeXtrRNrKX7Ht3aPne2mAT0VGiG0wadNqqJAzomKBJImzWvZBLvbfPRjItVh
         CbXDmcYUN9O/ZBhNXNNIciNTJKZJhzG3Ji+ZxXudXTHfV1BN5N5ge+tEZIyvUwXTRJYC
         i8bXFy84QcoiLAF/vJdfFwPW/7DOOW13DT/hQUnvrOgpOhMoGilWNliDR4n/tCXupkPH
         vhW/V8r+LICVuu5umfKTnYLMmrLmq/pUwzFX8SXSS+lkG7g9RGPE25AjpjX+sDlqJxvp
         lcgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
        fh=e5Ftv/GfdU7V4Mo8C9UoFI46jSqL7dFhE9MH4S949s0=;
        b=gStxi8raNCaNigxgg0GZ8thpyuLkQfwHLwiyTncGnNj0Nxxwx6T5WiR5CdhbARcYm5
         1jZceM4d1uo4TBRDfMlnUzyNwXNYDWSxCvnZTTRHS6u/TEXOqoFLkfhDhIHYhiOhmYM5
         UFVFmd3uou03nc2iePn7YgvVvWrrlR9o0tCF6/6dXpt80zhn4DzK0nBMbHeJc6FJR+ck
         ALo/Vu8+D4Y60v60eZKunf0D0DaAoU+g3yplRcmGo7P+7aB9ECyZHLQSvmeRhYIHwnR8
         9yHwadNzNSRX/oINnN1rtfhFU4f36cvvq9E2l5ZCaKv1E7kFeglLG3FDN6/CferqNnQ7
         5uGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793914612; x=1794519412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
        b=qNV3YK2AvifU1tOsCQ8wk4axq2Bpnp9T4w05lcq35MoN1lflDph5Y1IYtTpLN9oiu1
         oljv6zhoDl0Vdx6KwOE+YZ2XrvF12KIBahqeuzL0AI1Ihf1xglBIFGRlNFmbLRw1BvGj
         cHOsnpHe5ExcVUNebf5XytYqgD/im+o9YfI2/bO5gRjiKXBfTL4w9S2eMuvmZ4trc6CA
         kCNJxMHTFWh4eiUO3KMPLUXRVAjTsqzWtt3brnLtM+MWPucllL2IlplxbMf3C29B/5Fm
         Zq9m93kWEpns5SBYbYB5Q3+CTVkb/fUXg2wz7C4TsaW16nXsgwuTB3NnvQNvu0l335c9
         ZYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914612; x=1794519412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
        b=CI+FmGAUDCzzSGbzELUdJivBTjiQSet8ZYGliF6Gh2wt69YInDQS/Zc+hHAE4z6csk
         MR56JPJpF8JEe/GcmcdtD0OuscWKTh0vU2ImZ/nUGr8wbDuJxGfQJG1Wq4ohZaZJs5jf
         dIoD4EA97vDT8VGNByn23DwGuj7QK1UNllKM/R4NHWeGboep8U0gp+VUxYmDxk3oHFfD
         9gk2TtBAvelF90/fsT9vEQLLMFyguBS3LW6dqvTUn9SiqDHMdC/dzGfvVO4vCql4q9EW
         nPBQQ8zPcn6Y32ghT20+avMT3MybWeU/7eMe3qSlNNm6WYw5SpDh+y8qEB72j6MTkBz2
         5HUQ==
X-Forwarded-Encrypted: i=1; AKwUvBx43iBjn18a7bYCq+5bSnslfXW5lQDXEoVCk+LtICH+dlEAwuczoff6YRzYuuBZoealv6np1zg+DJlj9X0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Nt5NNf401sgFmXhBlkojCUZl2aJ7VC9njH0X4cGhtprSw3Zj0
	h8dZlP5J8lEldxVkmcU5IvQirambYUx4Ol7rbssFeHYecnKhczXKwXnnFTcjoFFhLX4aoNqXI2W
	oejqzGkuAVpH3ff+XQ3JNwJkNRTostl4xzjJ4aY9L
X-Gm-Gg: AYBFou1T+rMvR+ql6koqlAh1BXlc/dTOyLq02h58TN5VAxu9NgFkhzNgmXVOwtWnTFH
	VEJKXF/VUsef9o5E/XQl7oywUjmyr468K+lSheNIHzxB6z+B/FvcOkTJUkcYeGi7S2MpPE48cu7
	3adQQwNmAkfx/mOKQ+rlmMxOXkdfkCrcI/zC48OmT3F8bA34+vV91PlLOZImAI23RDMYqh4u8OP
	M81CUVR5pnI5db/MHdQFTpQLhhTs3Bgx3DtzvG84YQCU6eQkba7TU/e0+EHKXkrpVbcHzJ5CVcI
	A8z6ANmq1rnlg+0cgdpVK58juSsHUgwXSZO11YjS8yahTSlr3B+xhlEy8KYUglFK0W8hRWALeaD
	xFK47/UNlr2XnQfAWaiFRBEXYb46CAifXFeOA4bMZ/TFdg6XDQ8QNXYGOhpyBahuPtGg9CIM=
X-Received: by 2002:a17:906:9f89:b0:c46:645f:cedf with SMTP id
 a640c23a62f3a-c4d3546bf6emr55329366b.15.1793914611758; Thu, 05 Nov 2026
 13:36:51 -0800 (PST)
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
 <20261028134012.01d52e94@pumpkin> <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
 <20261030100215.6f8e0d4f@pumpkin> <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
 <20261104142307.431fc12f@pumpkin> <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
 <20261105083712.14847dcf@pumpkin>
In-Reply-To: <20261105083712.14847dcf@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 5 Nov 2026 13:36:40 -0800
X-Gm-Features: AclHuK-4-3cdEVpuwe7ZR8h4IzWEsLs5z4V7r2FIsMuL4z-PpEQaIZ0fXLkqICE
Message-ID: <CAG2KctocE=kj2CO29D0tVmrBeWmCDYA6FhpHr-7ZbD63GM1CsQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: David Laight <david.laight.linux@gmail.com>
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

On Thu, Nov 5, 2026 at 12:37=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 4 Nov 2026 16:05:52 -0800
> Samuel Wu <wusamuel@google.com> wrote:
>
> > > I think it might be more sensible (less pitfalls later on) to return
> > > the symbol number - not that of the next one.
> >
> > What pitfalls were you anticipating? If the current symbol's position
> > is returned, userspace needs another ioctl() call and an -ENOENT
> > check, to learn that there are no more matches. Alternatively,
> > returning the next position means every call pays for a look-ahead,
> > which for an unfiltered query walks the module symbols even when
> > userspace only wants the first match.
>
> I was thinking more of the kernel api.

Ahh ok, makes more sense now. I misunderstood your previous reply to
be about the ioctl(), not the internal kernel functions.

> The 'position' is just an array index.
> So a 'read by symbol name' would return the array index of that symbol.
> A 'read by symbol name index' would return the name (uncompressed) and
> do the lookup (binary search and linear scan) to find the value.
>
> I've used a bit in the 'sorted by name array' to indicate that the
> symbol is a duplicate of the previous one.
> So checking an 'exact match' for being a duplicate is cheap.
> But for a partial match you start needing the name buffer to be in-out
> on the read-by position request.
> So you start needing 'read by position' and 'read by position with
> name compare'.
> It is likely that the caller will need to validate the name anyway.

Got it, thanks for clarifying! That works with QUERY_BY_NAME in v3:
- In the UAPI, the input query string
(kallsyms_query_by_name.sym_name) and the output matched name
(kallsyms_query_by_name ->kallsyms_sym.sym_name) are separate buffers,
so the name buffer is not in-out.
- In kernel/kallsyms.c, the vmlinux lookup only needs the two helpers
you described:
1. lookup by name/prefix -> index
2. index -> uncompressed name + address

> An 'interesting' idea would be an ioctl that returned the value of
> the nth symbol along with the name of the n+1th.
> That might get confusing though.

Agreed, it's simpler to have the ioctl() return a single symbol.
