Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794298048;
	b=2MqPj0MdfOF4aAPdV//oRNuiZyrkBMt6Z24smVldwDE9pzCkCuWSncKyz5g3IC7RQUBu
	 N4dBA0vKYrkkGYFM/wjbv/rSnlze0K+dOV8cQ5LZzVdKdwKI61J7thKWJiTumyCiXqbhE
	 StZf2y0iJG2tvpx8owZ5EK3EVdP4Wy2adQg80AvCDjosYUbG3xLJFfx1rSdtFxt+iwRjL
	 W7SGg3/pQhJsdGlwmVkVVMqjyhNIJRz6fFprZZsC0uH8M6rR/NYHf/qSGSQ2NR+dFJFTl
	 25wJp3TNSPC64JtfmpJsiLiHvK9MMLoou/6BcAcyvKn4BUD1uqk8jNBYwOOg3xlundw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zKy/gJ2Q4OqB/ldZ+D1suUF3Ao+MCf7ZUxfe/sFiu9Y=;
	b=DY4beTbnxPSI0da7hK8qMn8Ma2kFJexPiouu4wt+ZVu40/vusNy/NKLqUKjUPOpodHaa
	 etIScAr8Lcm3DwxYe/B1dtovfifj2JwWhUspKWKzPykBKYr67LQHWYAKfGYsfFGl2YF4R
	 +mbURaTQ7BYyq3yEkIiqn0HxlfJ9lFby6/IRmAsiTC0RD4bT7MXKyYvDuJzbrASJGhyeb
	 END+qRbsvyfCKiiqzWPaj+htH/At9vj8yYGnqWbr8gobFvKiQ8XLb8N01WDfJ2D75lKJy
	 yTG5zeVk99F3jlrXYe1R/JWhjGLY+i5114mLuh6D0P8PHnR6HQZNAqZ88TSEUlvC2gA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=ldIt744b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F743606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F743606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=ldIt744b
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso1060498f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:07:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794298046; cv=none;
        d=google.com; s=arc-20260327;
        b=YnEQf33DJValbmkG9bExw+57xjjaGZe41DY80yVnJLo2l5mZ15FflHEGvK095q0oiB
         7NZpjs0GO/pWT2MsnK2YHJcK7+QoxvkQJ/CQHrsb/NNEtSv/ZqqT2rhcB7zLiQMVRfWF
         hu965Q3N7y03EqgPUB/sgTfQIRaYzqBq6GEtDLX86LmFF+ua98FeetMiIIYw+rtODq2y
         l7L99Cf17EybRmBuSobp5VN56w5hCtCTx0wg7RZTMMbMGcyRLGPvwywmayDOI2HeHKGL
         ae2zRCdxyU80gTN/UySWHPMosH9jo2mlgK4/YQrQEkraOJqmiXGlHcyqza4KEvqztoaL
         M3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zKy/gJ2Q4OqB/ldZ+D1suUF3Ao+MCf7ZUxfe/sFiu9Y=;
        fh=jmG/RwONNHhB0k0dqeEgu/JiVedgEt7uxO8yl9Ec2Ac=;
        b=aX3v08+rJOcTdKhNzGiA5qBw36LzLsKxUbt0m7sE4Nr/kO2n/4PHBpEnmRvy9qQWYP
         Bv0TyIMBNRXoMWiltrcxaUEGQaMtfvmipomJdxmudDA95mg+WnLRQo7P9Iu+evusk/og
         YUvU3GwzdutAfLD8qu38VPpOpxQcMnvSI1uZLpnbuwhpyLYY256qfomaKVJkMn0FIBJE
         KiBL7ut6fDHPN/8FWX6c83rnws2HseMAED6eNC2Mvq9QT3JMBzqgepBdr5asn+9qfmoz
         pE0IJtZW87CBG9zTdm94otvV72d+kI1BWXKYzpvZqOMkS+ktIshYM1NKG39g6L2tncBh
         zkOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794298046; x=1794902846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zKy/gJ2Q4OqB/ldZ+D1suUF3Ao+MCf7ZUxfe/sFiu9Y=;
        b=ldIt744b2q9C3eeVP3Drha6doGI79Wk++SnJpzVFF22iHxqGEAkQlCvlKJXlE+qk8j
         q6bPN0YnJ7UpGIONyAoXCkz8DLJ7Jh/mOLTxIgPpnCoDAqDyp0FHTyDVhUWwKohvHPBx
         eR+yXIKFtQ5Kc+QRDWs1dNy392HNk701o0bIgFK/1lSCfshMTablKRW2Urdr9PB+mDkI
         MsrIUi30tqMDByznCmvzOhwS5KErQAhLEnl+4Ay0mMsLLto4PszdfXpuLgVhaih0v9y6
         XFYwwrVW+CcrCQhDlB8wbKR75WEdNdqMJWT9sbYE7nhsMe7/X+M3NzoDQc9E4OK2grsL
         gbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298046; x=1794902846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKy/gJ2Q4OqB/ldZ+D1suUF3Ao+MCf7ZUxfe/sFiu9Y=;
        b=IRLO/l+y23S+p54tRjF9orkf7j91G2AnQWrF7MHzOOESW//yzV/eQXwT6+j5uGplV9
         09GbrBl3zJ2Rekzy34xaxmUc2gHKuXvyka/KyVHDNY9UsAc1q0DpFsihllK9CEEKz8Tq
         jfgHhm8CDJcQZxu98+3eDi3g+csyd2Hc31W7T0wkv520hpKHaMANkEYBt/l5K/Hq7Qpo
         R5nan8TXYRABtv7BO95TBoTR/r5CZm4jHFI/ILZBS+elSMc7EjW25vd95jG4eHhHTX8s
         iW0xHhWW82F3uexinGNywI71RFWhfD3hJlJSGG2XFgSlcNRx3I5/3zDS0YFu/oMp0gG8
         HMqQ==
X-Forwarded-Encrypted: i=1; AL+hErGrfi2FSUiFQrU2vJCLfEaPTqPih/7FH8mNj3mYBRDz2Yv77BSnhlhDxbTUq2FT6yNkdze5xsqFpgJn7JI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8olVISUSOqnIUgIwOnqzt0JpMUuM7MY2AEU8LwgCNugXeyRTm2
	hCrOdKR3nQ3upqEv24Tii1llvE5kcBr4zYp2N6cH7VKST8G5fPt9EyuSUcNIfRUsVibSUvEj0CR
	QVNEzmd9U7PO8yQGz58LP9yMvf2cN/XBG9HMP1vIJ+g==
X-Gm-Gg: AYBFou1gnGfHFrxJDIN9qFSo10h6S9bdSWn+2RGjhgCCRMDFZd1ni4nzIX2kkWNO1ai
	K4g4Pvs3QOULoLto48iBvTQtlb9iAbvk8FyJml/KHsVhPN40O8jDFFugHw1HQCzsnUabpSZVyC/
	JSFDUfPP5V9h7Lq544+9zBDd/gAm4k6ws2KK45BnLrgjJyXsTTlfNd0G3BIViezU/lk8IfU0/ca
	8uzWyZIIn5PE9CSyBJvm3i187zRPJzlHwwug4YiBwgO2dftnLkOIsbCTvCXag/rC+FRRF3oe1L3
	Oxa+/z2ZHgHZt4dBxMleXvRT6XjPAMjjnSxE9w2r4UspfBJojs3Mrng3AM9tLGjhqec30WSLWL5
	xMa8ZLg8wxKOjuQPI5CPFaffUpWsZG05/pdays+ei84kgvCQMfmj7QXNwOKWNjINRZ/92xwccGh
	fbXTRSgiRrWrEQpB81tnhDQGfyuBvrGXOB9V2unVgFDA3EsjQrnXtQL9Y=
X-Received: by 2002:a05:6000:290d:b0:48c:7386:af18 with SMTP id
 ffacd0b85a97d-4982b28aa0cmr3447294f8f.8.1794298045549; Tue, 10 Nov 2026
 00:07:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-aplic-async-probe-v5-0-c4861c2aafca@mobileye.com> <20261020-aplic-async-probe-v5-2-c4861c2aafca@mobileye.com>
In-Reply-To: <20261020-aplic-async-probe-v5-2-c4861c2aafca@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Nov 2026 13:37:14 +0530
X-Gm-Features: AclHuK-vBDH2XlztsVwt_XXQdD8zuFsijRvxMQGcBNFnVvFsuvB6NPhtCgNa4gw
Message-ID: <CAAhSdy2kxydOk9wPdBtVHCTN2uDrpFbQ0WGUXHz0AUvUWAncpg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] irqchip/riscv-aplic: force synchronous probing
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Jessica Liu <liu.xuemei1@zte.com.cn>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 9:09=E2=80=AFPM Vladimir Kondratiev
<vladimir.kondratiev@mobileye.com> wrote:
>
> The APLIC driver leaves probe_type unset, so it follows
> PROBE_DEFAULT_STRATEGY and is probed asynchronously when the command line
> requests it (driver_async_probe=3D). The probe of an APLIC instance updat=
es
> state shared by all instances without any locking:
>
> - the check-then-set of aplic_syscore_registered; two instances can both
>   observe it as false and both call register_syscore(), inserting the sam=
e
>   list node twice and tripping CHECK_DATA_CORRUPTION ("list_add double
>   add") in __list_add_valid_or_report();
> - the global aplics list, modified by aplic_pm_add()/aplic_pm_remove();
> - aplic_direct_parent_irq, where more than one instance can pass the chec=
k
>   and register its own CPU hotplug state;
>
> Interrupt controllers are required early and have no benefit from
> parallel probing, so rather than adding locks around each of them mark th=
e
> driver PROBE_FORCE_SYNCHRONOUS. Probes then run one after another from
> driver registration, and deferred probe retries are serialized by the
> single deferred probe work item, so the shared state is never accessed
> concurrently. Probing is also blocked across suspend, so it cannot overla=
p
> with the syscore callbacks either.
>
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>  drivers/irqchip/irq-riscv-aplic-main.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq=
-riscv-aplic-main.c
> index 5369078f3d00..3c10dbf3b492 100644
> --- a/drivers/irqchip/irq-riscv-aplic-main.c
> +++ b/drivers/irqchip/irq-riscv-aplic-main.c
> @@ -118,7 +118,8 @@ static struct syscore aplic_syscore =3D {
>
>  /*
>   * Not __ro_after_init: probe can be deferred (e.g. MSI mode waiting for=
 the
> - * IMSIC) and complete after the init memory is made read-only.
> + * IMSIC) and complete after the init memory is made read-only. Probing =
is
> + * synchronous (see aplic_driver), so no further serialization is needed=
.
>   */
>  static bool aplic_syscore_registered;
>
> @@ -413,6 +414,12 @@ static struct platform_driver aplic_driver =3D {
>                 .name           =3D "riscv-aplic",
>                 .of_match_table =3D aplic_match,
>                 .acpi_match_table =3D ACPI_PTR(aplic_acpi_match),
> +               /*
> +                * Probes of multiple APLIC instances share global state =
(the
> +                * syscore registration and the parent interrupt of the
> +                * direct mode) and must not run concurrently.
> +                */
> +               .probe_type     =3D PROBE_FORCE_SYNCHRONOUS,

Making the whole driver synchronously probe is a conservative work-around.

Your original direction was good. How about the following:
1) Convert aplic_syscore_registered as atomic variable
2) Add another atomic variable aplic_direct_parent_irq_count and use
"if (!atomic_inc_return(&aplic_direct_parent_irq_count) && domain) {"
in aplic_direct_setup().

Regards,
Anup
