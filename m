Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793754880;
	b=QheOORk9UJX2k6AwKkvmGaLcKUJnJ5Mpv1U6HDwdg51U2WDrOD9jpvEkag6Hkg+ahwHr
	 QfPE49j1BJNeVklPB7H0NyNKMPupKmXZiL7F5Ytr7Bj8dzUxg2p1Ik/OP6wc5xChkHP2U
	 arZxhpfZLizSBYBtDsJSf3tnGMkuDcI/KD30JxLjLAlhMFbUImuTqELGrb5W9F45/Y/3A
	 NgXnaNcqXHbZU243uQDMbcW19RVsAOB/naV49vPIGz5rt/xCA294kGJUjfgZQJBT2WpSS
	 jb+5KQVMiJeow/9QorAngYIbnN5mmNyNgSkzc65yJ62lRaa82KBZqzE/ku9TzW2RpSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
	b=rW37Xt//W79h96/J5gwNxg/YYSdeRGJYQzfZTqt67fx5t3hxfVnZSkTeQ9tglIdxWyr0
	 tH3i8xwL+szmFnSOkqWZHwImSf+6bSoipKxcu+1lvYI1iKb89QJUcr5YclgnfmUl++ScM
	 3TyPB7UWonOnk2aThg+KS/dbLmbcUYO91i4Z4PacHKFfbNk2D7r/esZ49kgmJ1B1i3JXI
	 bsgW5t0S5fTl2TtTtBJr8zt8pO1qHFBxPn6UB4oi4OMAfk5oGJ3uoXRyG9cihzc+OFDyI
	 TACZerHsAj5KpindogDrkJnLj8c9Km/BzLe/Z0F6k1JAczdfsII20ZDvoeSS7NzzZcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IR9x7CF7;
	arc=fail smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576E9606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 576E9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IR9x7CF7
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso2008151a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793754879; cv=none;
        d=google.com; s=arc-20260327;
        b=n/zuCnB/uyHsk1A9isP0h9+7E/uaSCUp7KN9/3ggAAft7tQbgoX+VHNnz0/Wfj0yvD
         RDAkkFn+By743NT98tHkhz+EhTVfUuk5h0XL7aeCRBixqw5d1wGlHacXmWnhkqCV/Hrc
         yTTC9agJH4tzq5Exc4FugcavU+QCvZJGyQt0o8yoN20s+4t+5WXkZ/iwZk4ZqTzi8bp1
         ahU4v8o3XVOyUwVCPxYQtvf2v+gK+BDf/JVQrfE9qjPkKbi31QkHwlMqXGyF+xKGzgeE
         n8rwLluS5AhDlKLjirk2SL5nUzH8QU9K4Ld+vPCykt+jj8CteHAwlY7raUebtcawoGDE
         RwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
        fh=tJ6htk5c33RigPbI9vpJVBGucyOOYEuE1cq+yJUI8Vc=;
        b=Iu/MOriZkY4wdWJGUmsaOra5pwgXuRwb/K9mZD74PrImSoUg86QZzC3P4sUWaGtHia
         U+Qm4sAeHanQi6wjkvzUi7peFVE2GoCP531Blicuv5ro8ZngVtcrfb4JShtlZo0Kdlxx
         MI3TpA24IUbmY8S0thvgZcrgFzHeF//3XJsZJmO7fUaxlzjOJ8oT4kdH00l0vHHW+Axf
         rkjxHW7Kfu9oMGmbIllnQLY2P1kHebPHWQlzHc4HOz+raTj7H82H9h7eKqmpiPI/bJbg
         1OKlZRZA4DU3Q3wgWclOucRgBfYzzxF+LoSpv74GW2zN8uaXCTA2s+/oGh6JrcDOjxZK
         SV8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793754879; x=1794359679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
        b=IR9x7CF7c4Mx0rniIXPJTap8Sl2/dr9gnbELz6lBJ5PjaAf02D1YAm2LSs37v81qCo
         DJ71amOTkdnMI00EPyhPmP/6O+dR1fHBGhBB8N08HS6IJb3bavA83yLJPIT5q1bmVYfO
         U9I8Mv1AhAISD9gQHYCQU9CqQs9uRSuFf/GBXxNes4jOmAx8FJ1/EC6+PRLfHwtyJlGh
         4bs/oRUDp3W+5e0rZ33XgLzI9zfcEnyXv3UPZwfkyHp9gepUycTy312afEDxLJBu+uDY
         JrNO004oX9+ApUMczZEAcZ/liFPBCKXYAxWJ3CGOVdhpd9Rcsvf05tTRbO/lhbaNTijb
         aS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754879; x=1794359679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
        b=R7vxZGj4b+04kcuwXbLy2u/SeHntLJ3JakAalioh+UJRBlUHh33UP7DbrsIdjQ25DA
         OW1bA0KibCA2O2nFewbVXOpjeqASHroLFKy68YVwX1wyOCkdw6l+qo0VkfoAdcL/4l4w
         sqxkYeCK6hOxE/mnDdKR+V4YAUtzs1hZhc9OtKt1HzItU4UCxfGvMUIT/wXbZ0dwiYzc
         oBA2a80UgotJNUKgctOgbSYLOcBK5AI1jPLmPL77Ua2FpiQMQlm2VVHH3D/dLTNXhmr6
         EpKLv6RtZHznZc/30Ac69odVS26TniNc6bJhexRdJ/iOw3UwB0zACb4eTIVZvP8yHu6i
         1S7A==
X-Forwarded-Encrypted: i=1; AKwUvBzcj6z5aLdrGHSzxZ9BpDmQ4YnyQVXydIZa5l5cQLD5nBoN46heG8NZkWbt4ti4jtj8/rBj2XsNpxhTYqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lr44WhOFNcOaN3jaNqmkGoUT5zJ83E5P21KcmTNqlhHBwHEb8
	tGEJ21zZRxL95/QW2cTObD+XNuS/Ey7mNo2prV3MHQ9tSIgzvhW5Jlv++OF26rR2Y4Fe6zSYzQ1
	yYoNkIXdg9iT09PLi+s8iAW9Gk8r3G9mAutqX5UPDQ+/8NAH06H7q2FgZpyegNw==
X-Gm-Gg: AYBFou0BTFHuyvFaxbypY7/23/LcCAs/lqfICgV+36Cj+FDGqsFwPehS2cZTYzB0EJd
	8Jyk7nHoRkY/OSRBOXLeXdRRcgK0VJHD15uYtqkF2xRgJqsVPxQKxHYwqlwrhMcb+gvqyMqj1S9
	sCBZGMxvksaoG5DYpqZbxw3Ax1xvSu7+DD1bicCL3mVueK4qGc5yR5GBRulQQ8Dvo+Xyrzbl2br
	e0/uZfv2K23UCnVHDbZyKmcfh37KWsKFTEAwMktvePen05vpkTlOStf4xAcyLDIGLISPUWMpiNC
	R7I00/wa4pMQmLQf8FVcV9S7Ma0Tlhxpa/y/6WxIZnJk5UQJL+1c2TEpnn82xL9BJ7jbtDlcmAp
	cjAgnb7SeNYw1AQSeYiCYseBvoJueChkYz/DxUMFWhH3CTq12YEbwYbZrCkSeoHcjEEz/Lew=
X-Received: by 2002:a17:906:9946:b0:c4d:939:526b with SMTP id
 a640c23a62f3a-c4d0939530bmr80653766b.0.1793754878307; Tue, 03 Nov 2026
 17:14:38 -0800 (PST)
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
 <20261030100215.6f8e0d4f@pumpkin>
In-Reply-To: <20261030100215.6f8e0d4f@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 3 Nov 2026 17:14:26 -0800
X-Gm-Features: AclHuK-cSPxC_sFXLW9VVvDKj-9cMyP8tHQ9MAfu7xEMrtFl6vQvJ8w_LlboHFk
Message-ID: <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
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

On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Thu, 29 Oct 2026 15:05:45 -0700
> Samuel Wu <wusamuel@google.com> wrote:
[...]
> > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > would be different symbols at different addresses. Please correct me
> > if I'm missing something here!
>
> Only that the user might really want one of the copies.
> Sometimes there is only the copy.

Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
pagination to cover these. A prefix query for "foo." also finds the
copies when plain foo does not exist (expanded on this in my reply to
Andrii's Oct 30 mail in this thread).

[...]
> > > Have you tried measuring it with my patches that speed up the kernel
> > > 'search by name' code?
> > > That speeds the lookup by a factor of ~18 (testing the code in usersp=
ace).
> >
> > Not yet. Can you point me to the latest version? Happy to try it out.
>
> I've just forwarded you all the patches.
> (They include patches to the tests and scripts/kallsyms)
> I'll copy you (and the other people getting this email) for v3.

Thanks for forwarding the patches! I'll be looking out for your v3. I
tested them across baseline, baseline + my series, and baseline + my
series + your series, using the same two benchmarks and setups as v2
patchseries:

Loading a BPF program with 11 typeless ksyms via libbpf (8-CPU x86-64
Cuttlefish VM, 273k /proc/kallsyms lines; BY_NAME, unfiltered, so each
query also scans ~35.8k module symbols for ambiguity):
- Base: 156.1 ms
- Base + my v3 series: 2.05 ms
- Base + my v3 series + your v2 series: 1.95 ms

Perfetto symbolizer (8-CPU x86-64 VM, 175k /proc/kallsyms lines;
BY_ADDR; init / 50k cached symbolizations):
- Base: 129.1 ms / 28.0 ms
- Base + my v3 series: 0.04 ms / 3.4 ms
- Base + my v3 series + your v2 series: 0.04 ms / 3.1 ms

I'm seeing your series help most when the vmlinux name search
dominates: on the Cuttlefish VM, a vmlinux-filtered BY_NAME call is
5-7x faster (hit: 8.3 us -> 1.7 us, miss: 9.5 us -> 1.4 us).

[...]
> > > > +     __u64 query_flags;      /* in - query mode (enum kallsyms_que=
ry_flags) */
>
> There is no need for a command here - use the ioctl cmd.

Agreed, done in v3
