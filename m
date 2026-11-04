Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793754316;
	b=Af3QHKSdubGgGW8YupirNAIYQc3IxsDdIjHSzfRJGi+TDZgCRwuG2Vw8ITXf8ZIIif+1
	 JoPFy5MvX7QS+6qPSpH+gNAAykhqLYKPqWOAcU07GKJOXka6ut37ioRe7Jpi8Ubqzvaxs
	 7x8r8zH/iiO0A58fKr8lfTjtU85XS/XVtx5oP6XuAwcu3FB0RUHT6va20RbxZpJXkkmpJ
	 HLK/lmLVy1MLHImEDbm8WcyI1jYL/p2r+geazCIT4Gn6IJn6St7ufHR82dDI3R7z480XR
	 jsC05179YAX0Z+AFbtGm2Nc6lJ2T4cHjkfaC8xJsyU2+7Qs5P9z4FGJOtgc4dYVa3Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
	b=y1+kwHp6TQqRKTKJo64SMh7+T2tNem0itAmHq6Hd8i67W1GKsFEGVZnZTFcmFH+2+kmr
	 S6n/SO4rfA7QUKn6S8SSdLD+5W+z6uacYCpA8P/71wWAIBpM+PRyUfRCtI+fQxW1qiTzO
	 fUfSim33zdgiDlFZOo+2rYRtNFsZtI5BN2Z6bO9VbCl57CSo81XLLDIz4QpD37kBdfNm4
	 wwtMPvkJg2hEtMUD9k5bsT2+wUrGr91yVJpEGIfnNNF4kJJSsrQci2gHtiqciiWXgrs6w
	 oKl8lSiA7qIAbXsOfSLuUsdk/SNDexU5WwHEzdWwMXYHLkQidHqsyZ6J89Ur+L/AJTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="NmCY6l/h";
	arc=fail smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FCC606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13FCC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NmCY6l/h
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4ceaee6770so26203766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:05:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793754314; cv=none;
        d=google.com; s=arc-20260327;
        b=R1JpW6lsQ7q152EBWIdwZDOgBJHCDpjQAiQkJL7sNa+v+0oBl8NhAHiZLpeoHAQeUs
         oIQKQgd+mR3MdWjg8Bh2486XdTZ8lZT0w3/C1e8p8TUZ0IZ8jX/t7vUrEuX/P4MdrUwG
         L8deqIUiYjDXFOXwu/Mlvhi8lzSKJA1vu47Kk/jIyyDX5SHfxq3sBKCIbrQg5PL4NPAC
         sYIE624j1mmZFxQzobWoncWDJ1ZjXFQm/2kfbKVBqc3JwzhcsrECph691hLIXJxwl4Y1
         QJMVVbNWAiSRDGuJ2O5gvAKY643QQFxVsc2+VTBJPCCaeEZ+y59UwN0LbfyQbCoXxzhR
         6xGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
        fh=pd5vy5y94+2BcRAtQdgKfOYqIr3OF0VgfcuIsZ4Crlo=;
        b=Xmp6VRMH5hJQRC387dBOW4K5PbWC2eajPr91pm2TSpwrjRJZ3gjT0/Xn55UZlZ+7ya
         qoZmHlWyLBV7Uy8P3aUyIuxQEONWrbxYRan9CkO0DRse/o65DdQ9JYbajLZwyZIGnpJX
         mDmqETcr1bOCG2/FJABUiHLCQPyfICwdm9OCvFI/2yjBDRXF51edGxWHOaGDdqC2N6nJ
         8atqSdPfKyJp3U2MvpvHR+WSB/tdROcYJQHBu/hnWGEEvaaC97+kn9Kcb1ZBEjntgBju
         z5O4Q5wP7kak1wc9sdndj/JAAOkodcDG1/071NHJIrnhkRm47kF8q1pHFVjrPUxnZk0Q
         9LoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793754314; x=1794359114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
        b=NmCY6l/hddhLIayqwx0pWhDlzky4zOFriG2Pdv4bVgKzrRIN/6DXrKq8SeIFpFSDzG
         OSms2h9cDJSkVBH5/IkifIVYnfvh+hsyQJtRrGsZdUmtb2ziewUHbbsX1RP1CEZB5HxX
         iy51pExN69DyKyexFvTHkYAxYP21gKZD8XowMLSFZiekG7RpaJCHxS4fldPWq/wG8Dtt
         kOM/cipylAMQawMEXaxMxu4+TRBFfLAxSQw9WjmITlds8lBIpEAlzKgdz84Ey9gExnv5
         /B1iiJxBuoY8in0DZjwRakIl1gpv9h2omGVHDsDWWmXteA1WCj/AkvnaACWyEIR7eDwF
         HTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754314; x=1794359114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
        b=AyYWLLRUFxIl2+dhUKpB9+5Ba+O/FQDsn1pMlxCD1a6xzKnBMbeCMMwSRkka1ZHbEX
         8oM+ehUuNyNg9vFisnK+aNdqz3e9ECmhD7bdaDRP3VdoEteQ5PYBV9cCQASanFmODQvm
         NyGdo1bL4A/L7l//u1JdpR/tNF6uOnbOwSIVarJoNcNqJ+CKOvz1+StJoJIfxyyY66dh
         ZBAuldok2Dq+OxDCzOnh0CG4a7gCDZn6c+kIDHfgCQgqv1MXp8S1Dn/c2l+ujXpt0yjw
         UbS5KfJ++/47Q521HJmdpMFdsVeRHYf2i+zfK/ErsTU9WOmJ3BQQLHvXdGJJEC052AsK
         jc5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwbsxa71XULETMk2zJWnffYlvdRkphC4Z4IbuQxj9pled74AfWp9ekNo4FcSnASCTae6qaF/IGalPFnwlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VeXT2gBCfWm6LVzTx3SrU8r0nwKFbIS3XGu93TI/C9v7P8Pa4
	7Zud53yaYGaRLRxSTCp6B3h0rS/rufrNpnLmJ/dUhXvRA8WExzJpJahG8jzptYWm40CZXf/YhOQ
	Gz89eWKbqoQr1xmAc18n2tC8Qol144b0RhN/Dp4BW
X-Gm-Gg: AYBFou0vHyLFYwcqSXl+MZfLZdQHO+EvmIpjms5DriTEFhtu/AhbYRRbkyghXZj+OUW
	puBYVyHNPDzZ1cJdTGM+Lsd/c8apdw17o1eViiHQ3osfRKg8uxtwSPZIdK7E1YwOo49biQfSsP0
	TugHpLA/FGEmw2BbAanJ84jz7HTu01f8QCJ5Ltlc0pekqQ5ZvqeuQYGWrFPeUGLjj8QFg7DtkyC
	FOjgXDOung6ydJIpJAHe7W6HepmpmqxMsRR/kpRNnL4n2jRUr9IltYtd7kDOzaybtqjmO2IMdHI
	0J44cIt2QdBHyF84mfJ0lUxRkYXUgRKfjDGH9SFXMbMc7o+DWIEABEmGouaSAJflj9BB54UDkyt
	D5XJUCTpacVsQDRDJFBjawvn7sRPKa2GKPD4jBezAtN3NGVfeMLYCxPsKKlvPPXvwXdT+kXQ=
X-Received: by 2002:a17:906:c145:b0:c46:7ec3:fdfd with SMTP id
 a640c23a62f3a-c4ca7a1c3ccmr1392142066b.14.1793754313888; Tue, 03 Nov 2026
 17:05:13 -0800 (PST)
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
 <CAG2KctpSTCyWQHgJ8GyFEhHPdFawUa6zy0g7rkfCcujJRN6f6w@mail.gmail.com>
 <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
 <20261030153528.0d5113e7@pumpkin> <CAEf4Bzbw6hZ3T6uO-ah7c0+K9_kc+k32hV88YFP=qPnHos+-AQ@mail.gmail.com>
In-Reply-To: <CAEf4Bzbw6hZ3T6uO-ah7c0+K9_kc+k32hV88YFP=qPnHos+-AQ@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 3 Nov 2026 17:05:02 -0800
X-Gm-Features: AclHuK9b_Pt7vf67g62PZ8vH_eaq5fO461r38gdQA-3gsipu-4DIyrTVCZocpdU
Message-ID: <CAG2KctrmAVo-jC5zHURvx9-V_Wu4U8PctxEevycV+zq+6GngUA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 11:42=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Fri, Oct 30, 2026 at 8:35=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
[...]
> > Doing a system call for each symbol is probably fine and scales nicely.
>
> Yep, I agree, for BY_NAME case it should be totally adequate. And I
> agree about not needing to do full count, just whether there is more
> is good enough, good suggestion!

Makes sense, thanks both. Nearly all symbol names in /proc/kallsyms
are unique (~99% on my test VM), so I'll have v3 keep the kernel side
simple and let userspace apply its own duplicate policy via one-by-one
pagination: KALLSYMS_QUERY_BY_NAME takes pos (0 to start) and returns
next_pos across all sources (vmlinux, modules, ftrace, BPF JIT, and
kprobes). The kernel peeks ahead one match, so in the common, unique
case a single ioctl() returns the symbol with next_pos =3D=3D 0; when
next_pos !=3D 0, userspace can step through the remaining matches one
ioctl() at a time. libbpf does that and still fails the load if the
matches have different addresses.

Paired with a prefix flag (KALLSYMS_F_PREFIX), the same lower_bound +
pos/next_pos also handles suffixed symbols cleanly since they're
sorted: querying <name>.llvm." (or "<name>." for .constprop, etc.)
lands directly on the contiguous suffix entries in the sorted vmlinux
table and userspace can choose to step through clones via next_pos.

[...]
> > You'll find that _IOC_SIZE() is used in many places.
> > Amongst other things it can select between 64bit and 32bit compat struc=
tures.
>
> I see the trend to stick to fixed sized __u64 and __u32, which allows
> to not worry about compat. I'd go with that (we have used that
> appraoch extensively in BPF syscall and it has never backfired, as far
> as I know)

Ack, I'll update v3 to use __u64 fields throughout. There already is a
precedent for this, and it is simpler to not fill holes that __u32
would leave.

[...]
> I'm intending to fix PROCMPA_QUERY's embedded size (so that to
> user-space it stays the same no matter the evolution of PROCMAP_QUERY
> interface). I really think we should start with embedded size zero
> here and have size embedded in query struct itself. This is another
> thing that we've been doing in bpf() syscall for a really long while,
> and given how dynamic and complex that syscall is, we had a great
> success in building and evolving API in such a way that user-space
> code doesn't have to care all that much about multitude of different
> versions.
>
> I'd really-really want us to not have
> KALLSYMS_QUERY_BY_NAME_{V1,V2,V3}, it's just a pain for user space.
> The evolution logic for versioning is simple: if user space provides
> too large struct, unrecognized (by kernel) fields should be zero. If
> user space provides too short struct (for initial version we can
> enforce minimal supported version from the get go), then we just not
> touch any fields added after that size. That's all there is to it.
> User space, on its part, just provides its knowledge of struct size,
> and then kernel will implicitly assume zeros where appropriate.

Ack. In v3, I'll update KALLSYMS_QUERY_BY_NAME and
KALLSYMS_QUERY_BY_ADDR to be _IOC(..., 0), and so the sizes live in
the structs (size; sym_struct_size for the nested struct
kallsyms_sym). Sorry for the back-and-forth, David. Also, the nested
kallsyms_sym needs its own size anyway, which _IOC_SIZE() cannot
carry. That keeps userspace free of V1...Vn command variants as the
struct grows.
