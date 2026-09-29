Received: from mail-dy2-f24.google.com (mail-dy2-f24.google.com [74.125.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7893395AC5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666457; cv=pass; b=aL3hhRPryHbJlGoXnmg2V+RYkZT1kYEdGJC3vFJU/zV+8wUZiA4GTgDp9dFS8JgAEYZeAOMcOjiT3RUiSwg65assI0eAySinEK1PzzfiqA/mfI6gAevVyyvSX0Ogc/A50IR8s7kEFY/kG/uf3tSmp1FwRqp38Ws4gTtxZHCj7Qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666457; c=relaxed/simple;
	bh=YIXPo5sDK++zye92vFkYMf2iMd3cbyUKcPD+7Xot4vM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIHHGlowjFXDn0CxEd+E/eweUmO6CAUezxQoaPnaiDB7EDIzwmyPS3N6R3wLF7g0Pst7X+sgLKePS/KhdDSaj2BGq0I7vNXYuXySB4plfNTMSm8mFytVkceMvpuh7RD4S38Z68uE9N3Y0NUiRjgyvm4En3fFDxofnJpc7JSLBcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnMpJkLu; arc=pass smtp.client-ip=74.125.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnMpJkLu"
Received: by mail-dy2-f24.google.com with SMTP id 5a478bee46e88-342d0acb224so21362eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790666455; cv=none;
        d=google.com; s=arc-20260327;
        b=YLdqDXUpj3lYslkZ64WuGE5RsTztnQuqpupTsXNAxyr97MAyixDLHPw3J07gKvoRe8
         YWoPudUTh5yXc+7wtJG3Bs3uTGgnCAw/Xfc3FX/kwZW3SYrxMOZg4xIbLRoG0dsNw2nu
         RAnEdshU8dacxq4gK8QRC74a95jYc1kgbSK64B5KWrMGOR6UE1FlTj6XxMq/bXwcZ7DM
         wICb84ew5zNq2mOb8AQxwSVALXyOdly/2/zTG/mmkS/yV5YglQKwVXzH1d/EsOkU/S3Q
         YSaONQFqnFYIKRazKe2AaWETwLDgLa7sq3TEcqZjkxhUSJ4kHwb9k6MZRx9gyEW+Zfsh
         mc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WPlHzJtptV1uSpJGdy+PWfBS1MZ9EUMKQ00b3icFMx0=;
        fh=1y6KqF7SUFunzNjXl2zX4wFTry4WT/27foxURNXjM0I=;
        b=LQ6KVvuZhdyXrBtiq/CIFmmvBGgTSge91t9RWmsen962KEnD79dCh5+jxtLxVa665y
         +sMfMawsv3JAN5B8NQC3+dn0VtWCXizBALmMLVfDKGfI+7xXpSym+Ny4pq1lpWIiHw+S
         VzGVSWZ58+JRXsxD8A1hdLI0uPznQKHn8vJq2LYoHIqbDRvBmhjBJAejlTSMTOog/ZrF
         PuKptAQh0lE+RXoCKY2VtMKp++KDdwZCl1mkMI7IvTcFToIHoW9IZc5Nd+tAgiV4dl2W
         0Cf8d/Wtb9SHZROoeC4RiEChyvt+SvRgHHyoVKkWhH48tfKzQPJbtUifQ20rKDLRM7IQ
         CKNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666455; x=1791271255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WPlHzJtptV1uSpJGdy+PWfBS1MZ9EUMKQ00b3icFMx0=;
        b=CnMpJkLuHECctDlzwn+gkVy9ULXjVGUUKFkQpft1GrIL+o82Wrqum3Ns04vMlWg83c
         j3FoExoS0As0NJjk48o+3a6JT2iScZk0wIjZHCgzwFZy2u474+bZmzTPuaIs5KmNBJsU
         h/qLe+HIA8LASAGJMQWsMJXw2rLZd3bT0G8Fs+n2j8m2iDtm0C8aZXIF58/moriEug5z
         S0G7ZbbBAL9M2nFuQe4IBx/4kR71yQNwsSOxRIe235gVbF2WHfIRYKdh2o2YZGdvt9pI
         DKG2S0iTqHUjnucXgl2nFLg/K5fHqK1ylsqiqbjSFBJBpsVRoCRNphu67FjJn3kWytvO
         jDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666455; x=1791271255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPlHzJtptV1uSpJGdy+PWfBS1MZ9EUMKQ00b3icFMx0=;
        b=yWpjV+XE35352UZVK5r3TKHptcc896lqwHZ9g7NtKaeu1wgF+90ffFRA4RZPY5HzWd
         K7FCjXEg+zWmVtCx2xJkZd//baBpq41MuHEFyLRn2mefMLcAg9HUAxCeMt7bMXDhhiT4
         mgRiUzM4D2RibQqu6AMypJVIJAxqACFNqb++KWerARzVsuwcYbupyaxOSEfYVRHrCsup
         yuK65rCg2aprYpIY/9WWeaMPeiyu9GfYg5q9Oa2ei3bgt/AvsQgZYP2kYNxP9Wa8lgKj
         YRyoWyXtEYUQJbQjMgg5u/+8juABynmMN30W0/NHfJ9zBBIYXD8icHAMyBqNBgMdNffH
         zplg==
X-Forwarded-Encrypted: i=1; AKwUvBwEelBOlGRp3QFixNIU0NRXzVmJlyddaLnh+GjhDgyXdCj4hcMcJAfW9AyP1y98eVM+7d0DbjgcrZXtSOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcxsCWbSLywW0wVekCOv85oa2z8PKe0lhp5sTwSOITf5T75JvJ
	iGyVPRUIkIuHs/TXcncD5Ix2dODNKsqYOs04R6hpevl9QccGoRK1767tkuSJw0WNxG3q+unGcAW
	3nuwnd5Lk8XE3NVw0B1xO4kVCO5atYoQ=
X-Gm-Gg: AYBFou1FtMCp4dHtbpKkIGvYnj+WB5SoVK/YzUrJVoWe+AQSoBfokCheA+K45KoUn0y
	b9lLwN18voTY9sm3PY343Rfk2m0ppiQm8ebr0zm1bTTjn4DghR228qCMApfiGrdlyHBQnbe9ZfD
	FPzidfDXLQYsbJ5/Rhqeuvo46+TVPF3BSABbv8bpoBaW+QTg5CSXn3cGgGNib+OJioZBQpI5Hum
	eVwPyM1YVMHfezQ9JSmbRFe6mWQmKn3GkgvKlPCr/umqN5rUuPt96odl8seMSHVhXmANXEyYjZc
	FIvo8fbbju3ssr7GpBfEAwCxAo8rWl0edXwwAP3pTlD6eLd2YAL+OBwJvlVgpUa/UJX1t/FwhWZ
	wwHqxDvPCC6LvaYf3nDUIk8nkMLJkJLlcrRIveCSIMEfGC+1RUS9nEUCmarZr6Re0Obbdnv3THq
	sHD3RhMauiXDfB7j6kWKlBViVLC25v6ZCx3gjrp8B3mKlnrt4gIbo=
X-Received: by 2002:a05:7300:ff44:b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34b101fd0d0mr2826129eec.1.1790666454575; Tue, 29 Sep 2026
 00:20:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928183925.1315274-1-chenhan0017.work@gmail.com>
In-Reply-To: <20260928183925.1315274-1-chenhan0017.work@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 09:20:40 +0200
X-Gm-Features: AclHuK-wUp_w85qzn7Pr0GSkGHptuldoh-dgMIHDSULZGx7jOmU4Ks9a3o77QsI
Message-ID: <CANiq72=q0U1skGfrYWZQiHr9JmipZ+rpoUJ=-wH1kHW4H0E36w@mail.gmail.com>
Subject: Re: [PATCH] rust: time: make Delta division and remainder fail consistently
To: chenhan <chenhan0017.work@gmail.com>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 8:39=E2=80=AFPM chenhan <chenhan0017.work@gmail.com=
> wrote:
>
> Tested on x86-64 and ARMv7 QEMU with CONFIG_SAMPLE_RUST_REPRO=3Dy: zero
> divisors and i64::MIN / -1 panic for both APIs, while 10 / 3 returns 3
> and 10 % 3 returns 1 on both architectures.

This does not add much information, since we don't have the reproducer
here, i.e. what is `CONFIG_SAMPLE_RUST_REPRO`? I would instead explain
what the reproducer is, if it is important to do so.

> Fixes: 4521438fb076 ("rust: time: Implement basic arithmetic operations f=
or Delta")

This points to something that could be backported, so if it is a fix,
then we probably want:

Cc: stable@vger.kernel.org

However, this changes behavior -- did you check all callers etc.?

> Signed-off-by: chenhan <chenhan0017.work@gmail.com>

The kernel requires a "known identity", is "chenhan" one?

  https://docs.kernel.org/process/submitting-patches.html#sign-your-work-th=
e-developer-s-certificate-of-origin

> +        // SAFETY: `divisor` is non-zero, and both operands are passed b=
y value.

What "both operands are passed by value" is trying to say? i.e. what
precondition are you trying to satisfy?

> +        // SAFETY: `rem` points to a local variable and `divisor` is non=
-zero.
> +        unsafe { bindings::div_s64_rem(dividend, divisor, &mut rem) };

What happens in the `min / -1` case?

> +/// Panics if `rhs` is zero, or if the quotient overflows, i.e. if `self=
` is
> +/// `Delta::from_nanos(i64::MIN)` and `rhs` is `Delta::from_nanos(-1)`. =
Both
> +/// cases panic on 32-bit as well as on 64-bit; see `div_s64_or_panic()`=
.

I think the last sentence is not needed, i.e. if nothing is said, then
it should be understood apply to all cases. Perhaps we could keep the
reference to the function, if it were public, with an intra-doc link,
but it isn't, so I don't think we need it either.

> +    /// platforms, `div_s64_rem()`, takes an `s32` divisor. The dividend=
 (`self`)

Perhaps `i32` with an intra-doc link instead?

> +    /// is a full `i64` on every architecture, so the width restriction =
applies

Please add intra-doc links where they work, e.g. [`i64`]

Thanks for the patch and welcome!

Cheers,
Miguel
