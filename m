Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A4D328B56
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789650094; cv=pass; b=IfZZu+l6r+YZ8k/gymCNAdo6Zr9WzXqYdID5/Znx0pqpsG+FrgzZ+sm7HZ6X5SnY61JBZbuNlAaGth008vXEnv6F9Y1wudoZ5joSUyoPUyINMoqEMcZqfiApzjgKkopwU+HI1S27xaz2pgaWrZ/Xx91q6ViwPv97Eqpj+p9astc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789650094; c=relaxed/simple;
	bh=wQxCBms3pcNhq8PFevzkdzGL1xHyqZnGZoCKwTP8k5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JP2v6x6Dr2Ndg+YjNoWr1HV5P4p/Bzcn8aY9uhdF0gajijQ7RKniUWqu8C4nbNKTmu6LdZL9lqe4RjOWQAT3p5bTBuhRuoUqL6cNQFggvikz9dg8N8riVfg+mHFaPoPTeovqlTG2zFD2eg3kiHkOGrHxyYBp43NdnnEXX9lARxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dfFYNjjV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bhTDyofX; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dfFYNjjV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bhTDyofX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789650067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kVKdgmi+8pcFasq/0rsQQ87M1qfknQkQcXTRjGslQCE=;
	b=dfFYNjjVX/LBiegpLu2EtL177DpFzS1f7QgSqpYhwd78h/9fuXUAd52TsFen0p7P5eywdC
	7U2msVDH6yIf7409cN7Dqp1NuB5dzMF1CjU3QIM36v2XKBXhuBvo+q5HNNKto+v0mQazKi
	eL/AMtK6biSp9MrcT6/5kjdfxK90ijA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-o0kIsQ8NPg2YyRQa6pCbow-1; Thu, 17 Sep 2026 09:01:06 -0400
X-MC-Unique: o0kIsQ8NPg2YyRQa6pCbow-1
X-Mimecast-MFC-AGG-ID: o0kIsQ8NPg2YyRQa6pCbow_1789650065
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e7631c43aso10193875e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789650065; cv=none;
        d=google.com; s=arc-20260327;
        b=djJElVK1lhc4SNGEQxqVc/edbkHtnJwFHIMBXXCmx16MElSwWmQaRYUyUEOdF0NK0q
         GJ9bfYoI5tW3K2HK8DEBB6tqo8wL1IU7NDR20Kzs+dJ3JXIURep6QM3SzV6YqZtYx4nJ
         o5ZQy4cI3O9qsvCJgNhv2z0orcGya70dndV/B6sx0xeVvoZplDBM97Ar74AmFjuTa70j
         Uki6tb07BgRP0rA5JjKIIg8AgAADt6j+MBNZQUX7+VpVVS8K5lDkuhxXH6RALotvHSWS
         R1p7MnuTGBg+VtpodudcxesVywPkzIqOZ4gPklvymAYm2SOHoKtrdcJ4tEF5/RGEiz8q
         adxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kVKdgmi+8pcFasq/0rsQQ87M1qfknQkQcXTRjGslQCE=;
        fh=c6FxKs7zj8zn+0Nr054bFKDJgi59GHF27tJ+aTAzjww=;
        b=OcG8pmehLxLzkZh1vXliiJBTJDs8Ma6p7nDaPtAcxv7dTuefXM432VFbyHioq6CFrx
         idOYP7AAxsuATGc4JpWpW+c2R/TOkeUqc2pBKTQkRVloI6pVy+JXVAVJLO9QCRwDBqTa
         DYiz5/l2x6OjrnagQF8A0Nl5FtjQwb5uRF69PUgWx5L6BmHCjc3Z9tjFY5esZuVBddh8
         qYZjwMd/KBatcDCCrVl4Qrl6kpfMdhJXovmaUe0lYfYP9RnkG1OQX4kIb/0mkliC33We
         L5KAhjpLutFh9pyY4yuMwhV8XxlFaNLRvjuu9UGodNqqy9U4VBBm8K6rn9EyHmoSVzdR
         hDTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789650065; x=1790254865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kVKdgmi+8pcFasq/0rsQQ87M1qfknQkQcXTRjGslQCE=;
        b=bhTDyofX7TeGMZeXSgIiiyNcdeENnIfg0Z9PAelbHz466Pfy6t7+c+K2vNOncCYUQG
         9wNihAv+5KJyypJdcms6FUDZSPh0mGm13E3WSK5Zh1tXZAuJNP2bPsnlMYwmgO7hkRBY
         bdCJoJtrBRtDLuzoE7jwEE9c1yFXorKiTrI26R5A5/lIIhOx0NGPQrrRsyShvFDJ05rV
         YbYzKHXGichlf5IvrwL6iHMiqKJMDbsF6ct4YvUZBGBflz+65Juz2/GcOV5QpoqwcsMC
         eXpzpiG3X2/naHAjrWKwHGZIsgQoxYXG59wemEDxjD3CrXrGl9zFdTUxzB135u5OfwYG
         IaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789650065; x=1790254865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVKdgmi+8pcFasq/0rsQQ87M1qfknQkQcXTRjGslQCE=;
        b=LfzwOjTpZOygotrbzkxKYz6Gmmjli9kYqd2UgPxdpa5N/D7HqjACa3/+dWBaRXbAUK
         Pl4JudWxXAa6zW5NUEH26NBpSJAviTHK43Br1KrUMFA5uHZ5tt98Feo5gsRr5ICAASQi
         uN/cjxwhpnc0bcMEeDsdXAp9iShlVPERD67LlFDdf51dsFXuFgPiLAknNWXzH2Qg6NZc
         6GapJ1b2A6jr8iymQ64U3NijnxCAjJnIQrZEL0ArtdycfRKr6XPSYX8tEHUI1vXF7EnW
         b4ZmDN+Uv6pJNaZ61YNw2W+my0x+0bgULlD0pNaF/iM43/kruzYv2NY4oU3mO6osff8y
         wdzg==
X-Forwarded-Encrypted: i=1; AKwUvBwoQWF1bidLja4ZKWwVooNsGvT/DS64Jnjns/eIoxoq4WlckuN9moB8mCx321/4XsIQt2HBZC+aNITQEP4=@vger.kernel.org
X-Gm-Message-State: AFuF++kMLHeSg1VE20oySH2t2vMjr4m4K5Z+fPcf2CIRmdtjWxdE6Gsn
	0VdP++V3StUGFlcC7HvZCSH2XCanRSKP6tHFYT5Y1w3pU6ElHR2qErz87umsArLUXJBj8QriHij
	bKAvu/3gghWfrtmJpPgUOpdLGOx5qWnz7R8O1sHW/oHXa8XXtGIs2ftFwRhlq0kOWgtNLA9OSqG
	iN7VVcO7QDFH4TbL9FtQLYN+MjQU53jQycZbZHP+gt
X-Gm-Gg: AYBFou2LVCfvfT68MTMfcwEUFrXL5ukvyauY3w2E8wELXgZBtNBpuf6H8Oep1/oeHE4
	vQ5LPeQBGJTYp7s6AKTOo64Q6PxL3pvpbWcVbLqja1Stap0EaGHOg95zd4Y+IhzqpsBIKvEynMc
	AP6EkJQgF9R1hf4Sy6axx64hdcJu98VL8tZ+sVnyUFCHu+dt+u5XzoGpFjOhOdWiGMdae4/ggY3
	MTNLA4FOuSKLlcxow==
X-Received: by 2002:a05:600c:674a:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-49fbd3cbce8mr39240505e9.22.1789650064673;
        Thu, 17 Sep 2026 06:01:04 -0700 (PDT)
X-Received: by 2002:a05:600c:674a:b0:49f:bd3c:bc1b with SMTP id
 5b1f17b1804b1-49fbd3cbce8mr39239915e9.22.1789650064232; Thu, 17 Sep 2026
 06:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917062306.46978-1-min_halo@163.com>
In-Reply-To: <20260917062306.46978-1-min_halo@163.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Thu, 17 Sep 2026 09:00:52 -0400
X-Gm-Features: AcwNN1X7pTf9zf7-_RrERJT_XeD7bvpIhJKNMsqd-FNmPRKmwewQD6boNViraSM
Message-ID: <CADRr4beOuFxa4A+CCLC8MFAALKBUptLaVANvDb6ZS42m_UMrbQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: hwprobe: use _BITULL() rather than BIT() in MIPS
 vendor uapi header
To: Zongmin Zhou <min_halo@163.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 3:54=E2=80=AFAM Zongmin Zhou <min_halo@163.com> wro=
te:
>
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>
> BIT() is a kernel-internal macro that is not available to userspace, but
> the MIPS vendor extension uapi header uses it without defining or
> including it. Any userspace program that includes this header and uses
> RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL fails to build.

Maybe CC stable?

>
> Use _BITULL(0) from linux/const.h instead, which keeps the value at 1,
> so there is no ABI change.
>
> Fixes: bb4b0f8a1bcb ("riscv: hwprobe: Add MIPS vendor extension probing")
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>

Reviewed-by: Jesse Taube <jtaubepe@redhat.com>

> ---
>  arch/riscv/include/uapi/asm/vendor/mips.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/uapi/asm/vendor/mips.h b/arch/riscv/inclu=
de/uapi/asm/vendor/mips.h
> index e65ab268b265..a31c23afe74f 100644
> --- a/arch/riscv/include/uapi/asm/vendor/mips.h
> +++ b/arch/riscv/include/uapi/asm/vendor/mips.h
> @@ -1,3 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>
> -#define RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL   BIT(0)
> +#include <linux/const.h>
> +
> +#define RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL   _BITULL(0)

This changes the type from `unsigned long` to `unsigned long long`, though =
the
type when passed to `hwprobe` is `unsigned long long` so it doesn't
break anything.

Thanks,
Jesse Taube

> --
> 2.34.1
>
>
> No virus found
>                 Checked by Hillstone Network AntiVirus
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>

