Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794393173;
	b=r41P7t6+IEOiiit76TluQd37v0UjCFNTHxEWWJfFQMzTfIF2wSq7jJ59MWdaebd8UC3X
	 D4ynAkab46iPaQkkHNyql+MoLLB5HinudiM0WlRqsrybl48e11GRxkdzkQKtBwebvjAIV
	 f+osWZTCyUuY136WmEDzYxXaRZjfR7ry2uoFvw0AlMgyzSQuId3XyxdceBVtTuxncu8kw
	 VUcSuQ0UK/1oQmJIYk+AfYpfhFRGeYJ/70QhithwOL+bZ5pGuvS8FTCrfwdEgC/dEQ1XG
	 TtsSQKIDOkjZTTPyt4qCzy4GQT3Af+Y+4XSPaKXWwPOETEZnHwki7zffB7bDoGJe//w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=02bBnMozli8MiWSGFFGAt1jIgOdeJZMOgr35PuI0WZ8=;
	b=ou+8H5B14PNEpOmCWEmn7MaK6stVovXuKnYJcVUhh2eujxdlu8uM7Dm7F/Rn5BX0LhZ1
	 WUnlZYwVvU0lGslpaFNeeF1C/GHTmTxCp6FRy2w6vvdbBTtZJ/zmJOYa9o8ZQnoKLXHwg
	 pa1gNs0Zj9y05mOZB/HMCmXFZ/Kwk6Ar0MY8hBLmv9x8ULB2tieATvdFnWmHLGedaJ0lq
	 FprfiPJlbYn6EOVzNiSKjegH9uj+X3r4axENRHh6qAdrdUS7w7UM9EdZRBoU+4WkeJgFQ
	 oaCRSCKvKhOlicfSFHCeDUJtqojt1EDqFqFdnFNWg2SZlVb8OZJVFL+iuR/hQmyBHXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOKn4s7s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B36C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B36C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOKn4s7s
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67be1e468a8so2284809d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:32:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794393171; cv=none;
        d=google.com; s=arc-20260327;
        b=lNRYGYnUGxhQ81ohKb7P52t/r+bqkppbA74XR6pwJwtvKbd1Dy5Lhu/GJuwV1HtP99
         hpik2NJQmdFE98iWhJI1E1I5gtGB7rLlgitxeLnLJaEwU6c6+Uy4YMnp1fWaSUv1cgLp
         gHA0ilAM9Ua2hfaF5FxoO/IoLkKt9TMbGHNhLLtHHc8FHLM7tl0MmljlstimbDvod4x4
         tS6O62QkaKBXen3OEpCwXorCCiDemUxWw0FNmeHF1VREgmWxMOYnzbpY67q0dSXCmZkI
         jNzNT/ehbxKYHKvYrmj4qeHD8SgS751iMb9isl4a37pjiONOwd2LT95epMds7DSOalAq
         +EvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=02bBnMozli8MiWSGFFGAt1jIgOdeJZMOgr35PuI0WZ8=;
        fh=BCnFdooZ4+BUALiH4JumF9ApMg++z81epOJlKDqVFP4=;
        b=d5xuHup9qtTxfMUi95yR+V7KN6IQ6/mbt7a17VMGxopLEjVlstxlOAh1tAWqGthcXB
         tws2tBiANIAKd5m227G+laf0H/odzZuATdNWAv7zSmjyRmfgmSN8EtPrT9BxPLmE8ozo
         +A6Y0dD+AnRpL7HGLDoLS4CGTFz2/gJZOExh7DhnR78CAzupizQTCJrT4q34wRdcrKte
         TbbvUGN7apmePPF1a6PieRetiXoWHqaSElYEGYg0UYQlJ9bunqk0FQu38oasorTzhU/k
         GM1z+1axXyCMnVXAKF9tXx6Y4k7X+4g9XJtjTsdbg3+KchxWLGm963scZ5xQC7UxiV3n
         mf4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794393171; x=1794997971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=02bBnMozli8MiWSGFFGAt1jIgOdeJZMOgr35PuI0WZ8=;
        b=kOKn4s7st+0UrDWuAYbFD3mtTNdrCVTRR8+85TqjA8fiP4ltJ7AHQigaHvo8xxhwUO
         nPYpl1wTPtgTKILmEFdpmVyEesy2bAQR2kiEXQNhEGX4UVwhDpNkzPYFQckb74omhcA2
         X1XNPUzOXuNY9DIuoBxr2mK3379AeWdWkrB3rwjJai5L+BTR7bNMMmYKJlgyXL50pOVg
         VcbHXMrQrXuiMTtSQdaQiy3Y8VYMfDvwYKyN8CfyttDu0YIPbAoTE5Ly/q+8vZc3chU6
         pSmsg6om2foGmEAapoyuEf0j8YZfLsxS8KjemDsyhn9rM/BkHNG0PQ5l3ogKQFE8TdNt
         9KMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393171; x=1794997971;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02bBnMozli8MiWSGFFGAt1jIgOdeJZMOgr35PuI0WZ8=;
        b=HHMTPAZLUVBSGGuCeRZp/kM1eztsb/OLzzTfsxkPxhYz3F1gLeTc7nx8P1Eww1sE+w
         lJHgbjve1aqKQrgF3fYV5hqa4XUmxw+68NMz1IK3/ZqB5MmvKjd42N3cklS+3Ih8vem1
         foELc/34Xf3COMnqPMUnR3HwhcFvh0djm49I2MFVEhS2op+DWUM8y9Sr79pa86TsGkHB
         8VzYXukCU7EiSEMGtBhbalATTu/Rx0KOn+YZTNj7rzFWN2a6clPFpltDLLJd1FA9xtKe
         Jv+95hDM5oewmj1TsCgcotlCt/3VCvQhehMIJL9Oc7W6LpCzRs+dCH2ja1G/2ckbspio
         EVUA==
X-Forwarded-Encrypted: i=1; AL+hErEpFwYNVeo2vBNLYPmphSMp8nYtwFC2l7FLIx9fze3hjGOIVIW9EXLzN18A47pQXkmehdLW3X5lJh9l1tg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QZTF8EJIbc/tW6DzoWzVe1dJRrslv/gNVQlBGZCKLFLfeS/8L
	yql5zP12ykXwQQNIWqIUbm8e/lidbdRIS24tlVnEdrMbevaj7UfB9e15GdznQebx+/dpUC/ebRM
	o9XIWgz8ZGJ/i4+7UrbTG46aUf7rb0fQ=
X-Gm-Gg: AYBFou0vciuKfDlF8BT55yt8/TYcZDnUlCBA4tk1fs2B8bgbDOaZpVZ5wR5Etn2mVuQ
	KuB33lq6qd6Z8Hgj8tfv5Crc/Y+rfrMyBWG8g0jLtPN/DdU59hJUQscjUbFioXNyKlx8mPX9DHX
	1jD12SeQ0BzcpYzcXR06iS1tsCx4YjskqKeSVVQGvK0sewqJkO6NRB/EhYQtIUKMst2T3qs/Q/R
	q+wYC/vDToFtisqgbdOUZm50R8URfYO4nFPwN8NZAE/617Q82gmRuoFQM6ty8lwBe88CSSwdWzv
	HuoPT+RDea6nVJ/JyVIZgU2VPFRnLsI+Eb6kdLjdEuRhLrFPlgAw2lsGi4HWmX9kcr7AGTEWSAU
	N2RlyUrOOZcEO+C1XvCDy6bNXDLKScwaC5F2e8spWv6GM6OSZfoSdwSnsqfA=
X-Received: by 2002:a05:690e:d4b:b0:67c:1c64:45e9 with SMTP id
 956f58d0204a3-67c680625cdmr1508099d50.101.1794393171367; Wed, 11 Nov 2026
 02:32:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110164046.454431-2-a.s.protopopov@gmail.com> <08e4851ff6c0fec6c90ae269b9edafedafdc5ed0462802fe1c1dae6aef465696@mail.kernel.org>
In-Reply-To: <08e4851ff6c0fec6c90ae269b9edafedafdc5ed0462802fe1c1dae6aef465696@mail.kernel.org>
From: Anton Protopopov <a.s.protopopov@gmail.com>
Date: Wed, 11 Nov 2026 11:32:40 +0100
X-Gm-Features: AclHuK_GbxvTdlzc2_hr4epNElrWdws4BUJQsklCjuLESJeU9114xBRiJsDQXd4
Message-ID: <CAGn_ityGqppNp6AeCH8m38o7k0=+syWpoMQb3s3iQBi+cL0wxg@mail.gmail.com>
Subject: Re: [PATCH v3 bpf-next 01/18] bpf: Add BTF ID sets for fmod_ret targets
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, almagui@kernel.org, john.fastabend@gmail.com, 
	qmo@kernel.org, brauner@kernel.org, kpsingh@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, sashal@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 9:01=E2=80=AFAM <bot+bpf-ci@kernel.org> wrote:
>
> > bpf: Add BTF ID sets for fmod_ret targets
>
> TL;DR: Comment nit only: the BTF_SET8_FMODRET comment (also in tools/incl=
ude)
> says the set governs fentry/fexit attachment, but non-sleepable fentry/fe=
xit
> never consult it. It could mislead readers.
>
> > diff --git a/include/linux/btf_ids.h b/include/linux/btf_ids.h
> > --- a/include/linux/btf_ids.h
> > +++ b/include/linux/btf_ids.h
>
> [ ... ]
>
> > @@ -13,6 +13,12 @@ struct btf_id_set {
> >  /* This flag implies BTF_SET8 holds kfunc(s) */
> >  #define BTF_SET8_KFUNCS              (1 << 0)
> >
> > +/*
> > + * This flag implies BTF_SET8 holds functions which BPF fmod_ret, fent=
ry and
> > + * fexit programs may attach to. Per-function flags: KF_SLEEPABLE only=
.
> > + */
> > +#define BTF_SET8_FMODRET     (1 << 1)
> > +
>
> This isn't a bug, but does this comment describe the set accurately?  It
> says the set holds functions that fmod_ret, fentry and fexit programs may
> attach to, which reads as if the set controls fentry/fexit attachment.
>
> The set is only read through btf_kfunc_is_modify_return(), which has two
> callers.  bpf_check_attach_target() uses it for non-sleepable
> BPF_MODIFY_RETURN only:
>
>     } else if (prog->expected_attach_type =3D=3D BPF_MODIFY_RETURN) {
>         ...
>         if (btf_kfunc_is_modify_return(btf, btf_id, prog) ||
>             !check_attach_modify_return(addr, tname))
>             ret =3D 0;
>
> and btf_id_allow_sleepable() uses it for sleepable programs only, and
> requires KF_SLEEPABLE:
>
>     u32 *flags =3D btf_kfunc_is_modify_return(btf, btf_id, prog);
>     if (flags && (*flags & KF_SLEEPABLE))
>         return 0;
>
> Non-sleepable fentry and fexit programs never look at the set.  This
> remains true through the end of the series (6dc8474f6891 has the same two
> callers).
>
> The commit message ("the functions BPF fmod_ret programs may attach to ..=
.
> KF_SLEEPABLE marks targets sleepable programs may attach to") and the
> resolve_btfids header comment ("the targets of BPF fmod_ret programs")
> describe it differently.  Someone could read this comment and add a
> function to a BTF_FMODRET set to make fentry/fexit attach work, which wou=
ld
> also allow fmod_ret programs to override its return value.
>
> Could the wording be along the lines of "the set holds fmod_ret targets,
> and KF_SLEEPABLE additionally lets sleepable fentry, fexit and fmod_ret
> programs attach"?  The identical comment in tools/include/linux/btf_ids.h
> has the same problem.

Yes, I will fix it, and send on the next occasion.

>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/429818=
85558
