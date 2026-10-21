Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792569788;
	b=TiOEz3R/ZruGjOum+YFP4ZI2ahntn4Ir2mOmLxDdN7QUFB25RKZpzCqAo+mwColBIMLO
	 KB2Va6N2Gf+t7/a1Eagfjel0/6pavYdXejxgHpst5nlb/+okzBvS8PnWuMrESYa7AZhpG
	 FHQx3PCIzc/x1YCR9ygMyVoLl07IudFE+LdDDD1yhAh7vhY2YQAI4UsoK9VgcLhXqeCAJ
	 XceKIYU5JwlPvBBcYt0GC0/sadsx2xM1NqybPkZsEaR7gGDRyVkWT69Ti+O+MyPcb0sr6
	 yCfNaLFNFsmhm3zjaPM1pFQwXplyFWS0B4cV9jQ7rb+mhY5TxgNdkj/ik1bWmeSenHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ej31f8Bh0GlgZxOrxR/CUnpvXclq/RwzuQxNVYI/rTk=;
	b=mP/7VlSTpIqj4FjXJyEfsLLVQr+tJgviNt17QcJJK9dXV8kZDuXBIdoRHZfTd751ttrW
	 kP9yA07K9dVNsVOG4vQxpP3szt7991O4GEYpfaNSj3nRz78B6PPrjlkYuiovjWFbiZhJy
	 KLHfS+7vm4GU6aI2pW+UbstB+lcRMijTiTVnXnKPx2Pk7pveoBpobSEPDbBSp/ODFdD4G
	 Sjven5kSw0ZEd3tBLluCHdPo+PiNprYa1GFvsTCbDC57bu8F+RuhT69kbCkHHMxbDlzLz
	 el5G9WcIp1oCUu764SgROjrkdarO16gClEI2Una56uxI778mj8iWU032NcKhDvKXruw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g3Cd+Fyn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1B8606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE1B8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g3Cd+Fyn
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c45551fa84eso49976066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792569786; cv=none;
        d=google.com; s=arc-20260327;
        b=GW7mOCWTh82fmvv2ko0xzCgoiJ1dfSphyTFXUzisHR2ZQvz/ntcXkya+zss2LRaTGX
         FztTCy4Mbc5cAqmLdXrILyNS6kr5XprhYK9HGH2fSKZ8QjhlO+V/Z7e7zt1pLoSkKi+1
         e4e4EamcS7x1DFQ+AoqtfwuyxN6OcnwlqFqgXgvb6cZzm4UFw+znRxESgpTkU7NnwJrx
         H5gDv5Iyt5twZETaXOPeX0fQAo6QlzSjEgvM33Oh8uzyP3FnbMo4hWt1Y6tlrNtvCmT9
         9gF4UDHosjf72kXRDNeaTB1RXrK3Z0YpTO7WD4YJetVDkWst03jLiS73i9Z4/Fwhm9eM
         5d5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ej31f8Bh0GlgZxOrxR/CUnpvXclq/RwzuQxNVYI/rTk=;
        fh=qwDns8xxlF95KbMEpiCKUcCUS6ouB23gsgPCeUJn3Mk=;
        b=FFkJNq9oWU9twM+Zh/f1a/VVci36mEL/hpauxvvyKWOADi28OeTnZUoxmpt2OoEvrl
         A7ulFjU7ngekVxH7WP9DLZKD1ptgvne+/ULZp7SGzfb+0iSOkzqQcYZUDjuMeMJulRvw
         OeyM/CeZ1fmY29ofQeUNm5O91vBKQoz7/fhoKnJN8ZYzfTXz0zovNSgBexKGJTKDanF3
         YxtCyyA2+JpxrNghd+E+UaymSvzi078ChGeZ79MHjRKj5ekHNo/g7Dwr9+Ze3M8aU7k9
         7mbe49t0lT6DJMbllA/59h6RTILsskZhnSvGwntKYVym6CNEU0UM8qifZklESXxp8QR/
         qmlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792569786; x=1793174586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ej31f8Bh0GlgZxOrxR/CUnpvXclq/RwzuQxNVYI/rTk=;
        b=g3Cd+FynkjVeyyUXzJLNcAv+eWioETg5se1yMO06rcTkAfrTeW3uMCwTxhp4L71vks
         2fGjQFulLIQyYUC1USdVwgm+aUBSF3EyO6nAdRZ9e/ZZMCjHpuux9JdbvWdsJcRye08Q
         tvD6EDZE0Z8NSWkGsYF99+VT6s18mBAQFsbXdB81eKTjwQXmEdam7c1NpiUds9qVX/V+
         k6/fpi8UquptukobWIjCFeHUClcloAcGUY/k9yRT1rBbTgDgjWVtAODD0fR3UxUr1nXM
         1hxDg7mbZp/V2Ocg1VA7A+AH49WYmDcxTKh6/DKw8we+NlparSmzs2YXhgcjs8FempQt
         R1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569786; x=1793174586;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ej31f8Bh0GlgZxOrxR/CUnpvXclq/RwzuQxNVYI/rTk=;
        b=1n4lL1BY4KtwnjDFG8Xw8XDxQfX9vWl7tIo68CfhMdhuRa9FAnBEhNMa7yxMXEs6b6
         3IL1p8ccGVHVQxqeeAz/35lOapalpGrrMXWO4EqgdDO7f0EwpzlBGWRlK/tpG627Vls9
         tcWgvLsanUr5Z9t55Md+OB0UVGKr/fqoVmfi/ovlDBHkWrbyFa4MzC4bmE97QzMsG8/A
         x/boOLyQ5nSKX3vrDMbgkRO5D/WJMqrGl2bW4LyZhQggn44kMWrAVPWdHaidVQIfchbN
         /jUw3ar8jlkoYvrgcmKdwIQut4FS09QhMHonC9H+Uvt5uRmNRVLsvnf7Y2GyZJnUFY2w
         bCLw==
X-Forwarded-Encrypted: i=1; AKwUvBy3jq6pHAgTSmTbBS34RSzUq0uNJuUY3EaMb4UFmbN0LFTIlqagR2JBI0GbBfdFa5ToH4nLoBvGS8g6OS8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFhaK8WC/dEQmgzKcALspd2FVuRWr/cWxtQhmdvyt02OicLQqF
	eiCj6y1cPcZ8cMcNso2wvt5hneGiIESRYPGOPU/jEJynpcDVRBaj6cBJqVM+o090Q0//LlKPRuI
	wMzzpfs1JRGxj5vc559yV5g300A8PQUc=
X-Gm-Gg: AYBFou1ihpX54ETnJC7SeG8VrAgr9PUAYYKOFbkJlomYcHtJoSZC7ZYnhhNe5hMe51l
	NnySCWnQAkEEm0O8pOC59PVpPb68JHQE2LsEcAwDf1NtCengGCiHI9srQwo5PAgaXTm5qYeRdtG
	HD0xrmxJxiOvxAfBQTE0Z8AfuDhObgazKwtrqK7IoMbM7EOvUZRW/2pmO9hrgcNJt5ONEyBuTHs
	ZiT6mPNlrIoH7SrYMBhD0REvYwv4vDJU9ADnBeiD2hZBtKS+XylyT3v+dMKKzCFW70EcBav4y38
	N64mTdpUAFYbPHtPTHNo+8DExDse0eK4z+KVNntvfqPDBSju2g9hS773OzWbpOuA3Z8FmTc+2yV
	TUrKRtSbOqSwugX/DN4tOKBiSw1Z+Uhn0+5QT+ke1n6NCvS6n2LC4kXzOimpjHNdh1gio
X-Received: by 2002:a17:907:2dab:b0:c31:8441:35ff with SMTP id
 a640c23a62f3a-c467977fc1amr128101666b.48.1792569785669; Wed, 21 Oct 2026
 01:03:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261007174203.37071-1-bestswngs@gmail.com> <DMA2R8KIUPO2.SR26IDI6VG35@gmail.com>
In-Reply-To: <DMA2R8KIUPO2.SR26IDI6VG35@gmail.com>
From: Weiming Shi <bestswngs@gmail.com>
Date: Wed, 21 Oct 2026 16:02:27 +0800
X-Gm-Features: AclHuK-B2UJm3TNMWcVkqmeDjUYIvMQv03wgwI23bq25rlqm3v0pnRffiE9A14E
Message-ID: <CANgPUi3Ow2Y_W_-v93yOz2TF-Qa=omZf_VuwbMuv=itc1tUYhA@mail.gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: Validate stack arg reads against caller state
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Xiang Mei <xmei5@asu.edu>, 
	co+eada64ce90ecebce@bugs.sh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexei Starovoitov <alexei.starovoitov@gmail.com> =E4=BA=8E2026=E5=B9=B410=
=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 08:03=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Oct 07, 2026 at 10:42 AM Weiming Shi <bestswngs@gmail.com> wrote:
> > then read a slot that the caller never allocated or initialized. Async
> > callback verification also starts at curframe zero, so subtracting one
> > to find a caller can underflow the frame array.
>
> Sync callbacks are broken too and this patch doesn't help:
>   *(u64 *)(r11 - 8) =3D r6;
>   r1 =3D 1;
>   r2 =3D cb ll;
>   ...
>   call bpf_loop;
> where cb() has 6 args in BTF and does r1 =3D *(u64 *)(r11 + 8).
> The slot is written, so check_outgoing_stack_args() called from
> push_callback_call() passes. push_stack() copies stack_arg_regs[]
> of the caller and the load in cb() gets the state of r6.
> set_loop_callback_state() marks R3-R5 as not init, but stack args
> stay readable.
> At run-time bpf_loop(), when not inlined, calls cb(i, ctx, 0, 0, 0).
> x86 JIT reads arg6 from r9 and arg7 from the stack frame of bpf_loop().
> The verifier thinks it's a map value, but it's garbage.
>
> No helper or kfunc passes more than 5 args to a callback.
> Reject callbacks with bpf_in_stack_arg_cnt() in push_callback_call().
>
> > +     if (!vstate->curframe) {
> > +             verbose(env, "invalid read from stack arg off %d without =
caller\n", off);
> > +             return -EACCES;
> > +     }
> > +
>
> Only async callback can get here with curframe =3D=3D 0.
> With the above it's rejected earlier. Drop this check.
>
> Add sync and async callback tests to patch 2.
>
> Also mention in the log that
> commit 4286f5deee14 ("bpf: Validate outgoing stack args when btf_prepare_=
func_args fails")
> closed this hole for the first call only.
>
> pw-bot: cr

Thanks for your review.  v2 sent.
