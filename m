Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793137578;
	b=f8qU4eZ2KO26Bfn77DByCtzGz4ZRHyeYuLc/HPwzrtsv58giueVERGB4LkQeA663mbjQ
	 6GJG5642XpE9q/+OKbJfRQttTlWB+cExiWyEfMJTAIuj9lz9O5cz7ZpyT5rWlhycV6QKW
	 QcpajX8+v4YEYOAuE8xV5ogxMh0fSnBEN25CpURBDn02bVCT/SdRf2Fk5VhBxTQyvY0Dx
	 P3P4FroLzz/GZKz0ztIt1TrtClcSFrIteUYiQUyaUf5cb877afEi39Cv3+0xr8YckdOZd
	 Tjggn5/jkVRJDGQi8krPvXaKrNTYyfNBaQ4edHptAdkaxyHeVjjvnM2S7tZwUk178qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793137578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
	b=atAei6KiaQOpZbNX9LiEU53QETddYAOLl1XW9ppR6JUReAJnQNzNhh6aaUBFc+6vdAzs
	 Su8rgbAKNEQ+xLXPCvFdHEjEr+QEnfvqBoyXFqMOM++rnFn4mgbT+0LppBks239Un7x3B
	 EBd723nPwgxzc9xTUNHU5rvRGwBHGN4340Gryo9MRfUDVsb96dth9wx5MASSs+Hpmhqeo
	 NuuCIS3I5nI38omdNeaqlkeXY/GXSMNYlvp5BJHE1ZxZmI3Tmx7g8AlH5eVAz9tZpUJZo
	 MoqINBTiYILXXlD/ByaFVrmiCyiDUzEUiTm1wc+8+VBjEgSTXlCP3YS7W4GYLni1HUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wbne8OHp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6AC606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA6AC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wbne8OHp
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso628326a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793137571; cv=none;
        d=google.com; s=arc-20260327;
        b=feKz0MTXSYtTzcUSZ6MQwiNUb5fvXf5Jsvir5W5TWHlBME5noDJWJni9+eliHKgt7B
         av7Zm6bYlbfzXyhusVCjveeF1+zMrt4vp1sRg7GRLJ9AUayTSnEZx45CPjvg1BF7TNSk
         n4gnUl7uG9HsxyJBgTvJR8NzeUPUQggzCQruxBHjD/byAvsWdo95xH/ij6lG4+QHYyKd
         eZh+GDUDPhWHVm5EYawz4DxhZmBlDFdHcYdr0tjzVyBPcs38DBE1cxC0asJZlC/Cg5pI
         XgcgsEr0XQURgu7dnSjh4PpIeB89KLc1siOcx6ASzIOrR+eOGXeRQGdF6x/j/JDyiJdi
         8dqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
        fh=YjQXy+ioJ/t+6aRW76FLCzxwpKzMKDRafKAZUeoG7Hs=;
        b=etMVLMQ5ZYhQzxfKRR1sNu+NMQhIKaprZnvpbnxVWy/jFUivklyRJZNrJITPda0yqs
         rXO+ZAIz8hmtxcxt5OFVrHTw9C6RQ8rLnvO4ku5wTrA0ajAyKLTC8cwUJmYtvTYYPEhJ
         kICioPBzqmBonf8olECz6iZVfKXqfJK0J5kRUPg64qr3k06iAvaWieeFw7gYU8uSxbiZ
         ZzochDfZDUv4HuRinUVC6UXJP9g1iHko7aNiTiBXC3Gx47mZljvyP80J7wMpcAEO3FRx
         0ZAKLFD5ZJMKmNi1QKhAYljcuvm7AHvcWqkENWKLTWfV6j2+eRJnqqGN+RhmQuo2qONA
         WNlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793137571; x=1793742371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
        b=Wbne8OHp5wFBPP5dxuR8+Kp5ZHrm8v80mBFme9V3XRymOzyPXT+ANjuS8mZtAutbOt
         ODy1sui91Ycwohd+oEsUjL53uPSBpLjWgEgWbT0Ma2aK7Hvfe3g01z4xkvRH6s2A/fGZ
         +Zbv9XzVpEdyJwXjAhRmHLJ3XY730+XSfkzgh8qi4omMFnsRCwCi2Puq9v4j/9LjCquY
         7A7TovQ1C2rR2zd4geupuZI+05Cnugg1XhJ4MHSma5JAUcS+LWaaA2qCMueEuNn/BKvO
         xSW9c+bot29ZINzBkQ0CD12vMG5F6NsY2dux4jMT3EVU1twWW7mORuqkOTF0o5JB3euK
         EGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793137571; x=1793742371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
        b=A7BmPIvW6UajVUQsBOPwgJz9FSr3cHYAnq9wmW36M36I3OEItIWVnhhDHElxwPBWjM
         o3Q8SLKO+HXTuhdWFtvtd72KQQ/QSyMdC3MTuNImsB5wCWZ6k8xmF45Y4mxwlAv5Yj7b
         tIco3wPE6h4hTUBplMEdOkKASky0OD0ixz9qZuRJQb/E8pJoqJLZiN+wJ40DkiVa8pUl
         t3/AB0Tb+iH8+y3QsNJXzirSDla0UfBfxtrXtkTZT/rHP+ynsOJWeFL0Wg28x+VEpiJr
         YP8LljSkRVJhAXc4AXfXbFd8YYDe1mOX115ULyvTKviTN4PHSfgc8D12T5kHaaIzGSva
         yiAA==
X-Forwarded-Encrypted: i=1; AKwUvBxBXjrcTkw6USF4yJMHIqWVR+uxBInsl9Jmi2OX0BND/7hbnDNy+TrukOEfR+iKuF9Y1IegeVAZeDl/btE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKExPeB3sPNdJpSh862nPEQ8VB/bGDiPmLjER/TKKuKOnWxYHsz
	nMlse/IJvzzs90RGrnqYSpAH/dHVHJiOuDfp6k7k/I/ywXJk0JUPtsOZhgj02wg4OFbgXxnNlgI
	lCB8gfXghQzsLo5QL27yieUjTZCn8oVRzsRp6RWXf
X-Gm-Gg: AYBFou3i87qX6TbzJfJA/UUeAVK908n92/pd3sny+gYKoNra/b4bWxrKvZWvgko6Pjm
	AxzwfUQhSGUPcEJdskPFrC3CiXQotTvfyaZhvb4vUiNQCrZxZb81sQWhmcdyBd5zGCAOr4Ns5yk
	vo6+kQ/bN4ELJsnDC9yZNV+A/4sWAdFqTNWDmf8JM6O/JaWvdq7o6RVT8JaAK7+0Tgwa49Jtw2U
	yUQ/cKF6QEZjvg37ScqNYpjV4Ly2CErx/KMKwgCENFmTcj2Z+T4nGB9DaBmtZvQzL723AoiXRGN
	EvrsU3nIORc/s23xeISZjVMUeVe5XEm50SowYMLX6k6cQFpX52BZA7GvG2XOH6mMRjJheVMds3r
	rdNBN0nUC0Z9QGy/R2LLGk1YdXIIWWLXeV7XQPFxzrE0z8Q+oFx2Qdb5/aIMXmPy8N3s=
X-Received: by 2002:a17:906:794a:b0:c36:7579:fe6d with SMTP id
 a640c23a62f3a-c49bdf3769bmr41163366b.11.1793137570881; Tue, 27 Oct 2026
 14:46:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-12-wusamuel@google.com> <90371d2279a5eb08966a82325922e1f15eb93560d4019f5c9020956cadb4120a@mail.kernel.org>
In-Reply-To: <90371d2279a5eb08966a82325922e1f15eb93560d4019f5c9020956cadb4120a@mail.kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 14:45:59 -0700
X-Gm-Features: AclHuK8QaCDsAbnjPaGufNN4kMFz5cqAaOc_WFmJQjgBqVdaEIaSp_a56eCEZoc
Message-ID: <CAG2KctpuWLxdxB+LzrBO8eGsL2E0m_DphcG4cauB0cHuEDEoRw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
To: bot+bpf-ci@kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, andrii@kernel.org, 
	eddyz87@gmail.com, ihor.solodrai@linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, martin.lau@kernel.org, 
	mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:51=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:

[...]

> Would it work to fall back to libbpf_kallsyms_parse() for typeless extern=
s
> that are still unresolved after the ioctl pass?  That only costs extra ti=
me
> when a symbol is actually missing.  Alternatively, the kernel query could
> match the .llvm. suffix for data symbols.  I did not find a fix for this =
in
> the rest of the series.

Yes, for strong externs. In v3, if a strong extern returns -ENOENT,
I'll fallback to /proc/kallsyms to scanning .llvm.<hash> suffix,
keeping the same semantics as before.

Weak misses must default to zero without falling back to a scan.
Otherwise, all objects marked __weak would pay the full /proc/kallsyms
scanning cost. This is a slight semantic change, as a weak symbol with
a ThinLTO-renamed static now resolves to zero. However, this is the
behavior of the light skeleton (gen_loader.c), so perhaps it's
acceptable. I'll note this in the v3 commit message.

[...]

> Should the fallback cover any error other than -EADDRNOTAVAIL (and other
> real lookup errors), or at least -EACCES as well, with a pr_warn() for th=
e
> errors that are not handled?

I'll update v3 to log pr_warn() and return on open() failure or lookup
errors. And then I think I should reset partial state and fall back to
/proc/kallsyms on ENOTTY, EPERM, EACCES, and EOPNOTSUPP.
