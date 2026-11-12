Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794524445;
	b=SYQCnQEts3kWyxXQ9H7gxWckA3xRT53O73jL1V3AgKwg6RP9J8XThjt1paAbW2Qii7zi
	 8b+G4KI4VxKwEa+H3h+bOaL/hfj8tjJKuGWFv9TqldiGjEXSPIs0S2Y16QHJ8thIaKC+s
	 PBCVjIrlHGFU9ceTzt4Gmnj49IzhS9DzKrccGXN//NKq4oeu57MnYfNPmOQ3NmqEmF6xr
	 hSC/0b5SJbCxSvKSvcTlSxe/IvbFe8IMmJ9A6DbgP4JApZ89td+txpS5Y1ScOvPPq4gGJ
	 zJlZfQwCZQCVQQgSr6NCaXN94hgS5WYanMA42w481BikUYohux0uXJ5jA8t1K2778gA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zJauvZE1zf4JwsOOkP65TpK/2FnkZR8UcBkJu4VCs5g=;
	b=OM9egKKwpReqD9KL5b4voagbHiEL/KWVmAU+xG9feuAa7hh+nJmFEvrmUXpbWFdxSvpM
	 Frn/kHLy9ser+IVAojjTYnweEm5JEvXat+jr5kgikdDNO1jTja4+UCdL5RqyR/zXnYtf+
	 eLz/iqanXCVhlsmvW4e5JKx0Ybfn275J637aTdLC2CynPASdljQyB0GsFopYHbtWMXj2w
	 q1Dt4IoN0XAZANcW4/i0buamWNYdcO0X2by9H9+7TZPbNcUELWihcSOr9kEx6SL44USYM
	 9EEQTRq8mcJKEtTqwpN65PiEAigiTSgiOEfj3CTE3SPOPe5TSPFujD/7N6ShxT/ng7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjDNXoB6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6F6606A889
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E6F6606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjDNXoB6
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4919a880834so139108f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:00:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524443; cv=none;
        d=google.com; s=arc-20260327;
        b=Xsn8QZm9DvAxMAYQxImNlNc5GnoFFK3pcF4d+qQ7rwxEyD1bcuuAlHr9pRbQxcM6vQ
         Py8hGRIGKECwCdbIxp1zQt0LPxfskFffCdLh/yPzoBtw0WWZ3y6kjOu4/z4IMB9SQsbd
         lRSBXR95SZAR0VjTFSZsjZpRqkDtXoQeS+meL4a6SVz+gVw5YVbuiDOFypRCVOpy0afq
         AsfB+cU+GowYFquGvhOlExszTS2pzhayAzlMd9027+MBO5a50N1nSungxog+0l4WWpct
         zdiGq3dB9XxiR+cCa0FSX7JNTBrPAURjR9csrQac/Qa8p64c31wYM/oYaFxYusjTJQ0l
         fhVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zJauvZE1zf4JwsOOkP65TpK/2FnkZR8UcBkJu4VCs5g=;
        fh=x53d0YxQwlwFVx6zdahjO2913YQ5ypQppWQIQnr74rU=;
        b=k1A64NUfR/UiiEIegwMsR9EVXUFcwScNI3vG7culcdJVc4/pxGIVka44+VaSyjVYph
         oXzgQhtLUN99s9Me/rnZFUjmq4gczcvY4Td4RP6b74gbxkOi9mrb7c4UzIg26ja1ZvpE
         E6GcdAy8QZRLpJ2bVuJj6QA36HiJ1y99qoaDtBUToXeNynad3rZBaqBQbdDcwGlFP00u
         n3Kp68vwWtqvfGRrPUho1282Yj5LV/GZbHCv/x/72QafzQhHLWXHf/UIQSx44T63Gkyz
         GTzHmcQ4hwax9lFJXIbiPz49vaT2c6f3qyMoGOfoLFgPuD3f82nctsv0/uS0hXWlpJor
         mPwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794524443; x=1795129243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zJauvZE1zf4JwsOOkP65TpK/2FnkZR8UcBkJu4VCs5g=;
        b=sjDNXoB6zcBiHEPu0PrEs2iYorJls7T5etmbz/NfEcTCj55pFun2I3zOD+NvijjUFq
         D8yiW6Uiq2zT4drRfzL9g5WwSV4ljjPc29uE6wvdNUnHImRqP16nNPnTPWyBCkQzNLHV
         q5PDapA0AchXZA16ia4F+ggMZ2/zrtRRYTKgp9xjWIRjxGMGoi7faYMHEmlYnUi3aIXa
         9VxSOqG1BBDzjKyfVJz5o0RTpyFmjH2JMc1a+HIKFSXSXOvPNDQlDazqg0WXpcHJBQhO
         lhWT9ZptbmEspFpTbPm/7iixxbpoXNroTtUoAf3riQTFMIPr1RwbRNSRLOrkDGXrAmiT
         onpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524443; x=1795129243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zJauvZE1zf4JwsOOkP65TpK/2FnkZR8UcBkJu4VCs5g=;
        b=YHFizETqEg4Kqw08H3bsXrIE6eiLNFoqfk/ypuCXTN3RTfBGfUVUMRNyoy2Kt/nbom
         DzVnSqo92U1WG2KJDoB/Z++mBoS8SYdakK6e8xIOww/wM4vRELZJ7XYE9dlMLWvXOejz
         mTNxyfo6L/M/UQCn9DiLMkDTqLmBK9QfxKfonGup/rXCrXPBcs+FnFvhhN4DdoDwRpwW
         JyeFn89AW+eK3o+wGL8uKZG1xnoO8MFc7fFr3vuwtkWSs4vlyGikBfCaY1j8Y3pGQXNP
         YLaKS6QHEYlAlO0koxmR/uoTq3eZZIXzfIfh4fxc+7pMGUXThmSRXsZ1sQF2kBdsvyHJ
         GtdQ==
X-Forwarded-Encrypted: i=1; AL+hErGrqVMZ1JIuM+Z7jJry7oVhssAIqgqo8AbhR8m2YrUIl62vUtgL7Eve48SB/7oEFIW66P6TuhSLYqT90Rs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NrRzpATBXIGWNSSp6MH40l5em7ILbWS6sERhqRXKYH1GLah85
	uGtniDl2rtsXUeEuCJrQD5WpYIhOJDsGcY8Mjse2XviDePggrAOZKByg9VdsujZloR40gXQ/yDp
	+UgKjkGasCQDMXTl+38H3fRH/7Qmixdo=
X-Gm-Gg: AYBFou0U8U5YdokzSgQgeO/KnoFRfpXEEPSSui79/jii8PTboUzTyMhDISJzVOu6oaw
	MV+h9bQL3tkD1NjNspQY6lQq2oPg2ifQpLRScSzn1nO7RrtVhK1XjaTZgmnPNFQ4eaIJw4rkvdU
	ykYeP0iZpxM4n/0TBFig5UGvvpQ6UjadKlOZ9QHsOA7LIgXgZnvbQ46G5h91qHcPvbQM8WrjiEi
	jlmE5UaXMvsUEk9TdlQsQ+MkZ6ZJBJqCpX+xV6fufVLdLyKpZGmPWeBMrUe3E20TT8FREtbVt38
	xoojYZyIobvRmo783BigBRTGmBUslBzfmr5OvQ4iOiIdxZ/k59sCuSOH/lS4HUYtJgALojhkCY2
	kqWqtEj/ydw1MHhSfF0asXecAK4uGGrqeAOaBlznSyYzt66DfANe9uKW6+IRfAzSA26Rf92wCrB
	d8IaKi1vw/L+ZAfFth6N8dGG8YvkscA6jkgMyLxfACBUtKRbAQ7db3yyun
X-Received: by 2002:a05:6000:4916:b0:48e:4300:c6d8 with SMTP id
 ffacd0b85a97d-49c723fc072mr1488764f8f.35.1794524443278; Thu, 12 Nov 2026
 15:00:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <d85ece6e-27f9-4d9f-83af-4101bc76fef6@app.fastmail.com>
 <356db94e-f5d6-4fb2-839a-b97aef72256b@app.fastmail.com> <CAHC9VhR9sjunJRnM9gy-BkBZkapQTrr8a8FtmaK7JkAmUqTrLA@mail.gmail.com>
 <CAEf4BzZKmn6g0SK8OddjKFj_vAmZFvpZv32Hs_S+GHgT7VNfrg@mail.gmail.com> <9d6bdc31-e57c-4187-be78-29d82471f710@app.fastmail.com>
In-Reply-To: <9d6bdc31-e57c-4187-be78-29d82471f710@app.fastmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 12 Nov 2026 15:00:32 -0800
X-Gm-Features: AclHuK-Kr9JdTGalkEgmmfAfdsFcOEOJ-nbAKjHr2jm9SnDPJTrEN9CPnUV0p4o
Message-ID: <CAEf4Bzb+oYDqO20v4YbJ45wdtcGgJT3xVse822P+=oA7fpFAOA@mail.gmail.com>
Subject: Re: [BUG] bpf, lsm: new first argument in 7.4 inode hooks silently
 breaks BPF LSMs
To: roblabla <linux@roblab.la>
Cc: Paul Moore <paul@paul-moore.com>, Daan De Meyer <daan@amutable.com>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul.mabileau@harfanglab.fr, 
	linux-kernel@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 7:08=E2=80=AFAM roblabla <linux@roblab.la> wrote:
>
> Hi,
>
> Thanks for the replies!
>
> > LSMs that need to provide a stable API must provide an abstraction
> > layer between the LSM hook callbacks and their stable API.  The LSM
> > framework is not responsible for the stability of individual LSM APIs.
>
> Understood, that lines up with my expectations. I think the biggest
> thing here would not necessarily be stability guarantees, but rather to
> make sure that the eBPFs fail to load when the compatibility is broken.
> But that's probably a problem for the eBPF side, and not LSM, I assume.
>
> > So, in short, would it be possible to send a follow up to Daan's
> > commit and move `struct mnt_idmap *idmap` to the end of LSM argument
> > list?
>
> If this is possible, that'd be nice so that we avoid this breakage in
> the short term, since the change isn't in a released kernel yet.

can you please send a patch proposing that and we can continue
discussion there? please cc me so I can follow along

>
> > Having said that, there is a way to handle this, although ugly and
> > *everyone* using specific LSMs would need to do this on their own.
> > Instead of using convenience BPF_PROG() macro to define BPF program,
> > you just use raw `u64 ctx[]` access, and then cast ctx[0] to either
> > `struct mnt_idmap *` on new kernel, or `struct dentry *` on old
> > kernel.
>
> So, we already do similar tricks in the software we ship (which uses
> various eBPF program types, not just LSM) to cover kernels 4.11 to 7.3,
> using a mixture of CO-RE tricks similar to what you describe and
> per-kernel builds selected at runtime.
>
> Here's the problem though: We ship to customers, and we don't control
> when they upgrade their kernel relative to our agent. When the kernel
> changes a hook signature, a program built before we could handle that
> new version still loads fine and just reads the wrong arguments, which
> causes some really gnarly bugs that can cause really bad breakage (such
> as accidentally denying events that should have been allowed, often
> resulting in machines left broken).
>
> So what would be really nice is a way to make eBPF code robust against
> kernel changes such that it either works, or fails to load, but doesn't
> do the halfway "loads but silently misbehaves". Here are two ideas that
> have been in the back of my mind that could help solve this issue (though
> I understand that they may be rather large changes, I'm putting them out
> there mostly as a conversation starter):
>
> 1. Could libbpf/the kernel have a mismatch check on hook arguments? I
>    understand that libbpf and the verifier don't know the types a
>    program expects, since BPF_PROG() only casts u64s. But the macro
>    does know the types at compile time. Could it (or an opt-in variant)
>    record the expected prototype in the program's BTF, so that libbpf
>    can compare it against the LSM hook's prototype in vmlinux BTF and
>    refuse to load on a mismatch?
>
> 2. Since kernel BTF has parameter names for the bpf_lsm_* functions,
>    could we maybe have CO-RE-style relocation to resolve "the argument
>    named dentry" to the argument index at load time? This way, adding a
>    new argument could happen anywhere in the argument list without
>    breaking eBPFs, and removing an argument will (correctly) cause our
>    eBPF to stop loading. It does mean the eBPF programs must provide the
>    same argument names, but maybe that's an acceptable tradeoff?
>

All this is not really an LSM-specific problem, it's a more general
tracing problem. And even if we have some custom hacky "solution" for
LSM specifically (but also see my previous replies, it's not something
that's easy to do either in libbpf nor kernel, IMO), the same problem
is still present for tracepoints, among other use cases.

It basically falls on BPF users to keep track of kernel evolution in
terms of attach points they are depending on. Luckily breakage doesn't
happen often and usually can be worked around or be adopted to. And so
far kernel community has been pretty understanding in terms of
evolution of some pre-existing hooks (like scheduler tracepoint I
mentioned before, and hopefully in this case with new argument moved
to the end of argument list).

> Thanks,
> roblabla
