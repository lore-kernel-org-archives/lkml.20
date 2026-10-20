Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519642;
	b=hM6PobuuEadOmXvW8yuO4I9lie6Hv85LhYXVF0PNxJLA0vyrw2+GGumZQATkA7uThqNX
	 xyOK7Vj3hnaqL6OCRMH9+TU0LZg9yJ7FrhAWe34gBySU7mxX//khEPAdeHVos8pV/cfbz
	 zMUGTCps1uaaxiRmoLI7IBX+JuwUyy/QOsAJvrpfI/zwy43WKIvVrsEl6iImB/AiiS/wx
	 LJc0qECJTeQEMCam5vuIb4nEONiBA4+CygigkzBFT2twvXwWbrF7u4bpLsIDdxXh5zSmD
	 M1Y5UZnpP+8FLwGW5m/qS0a0TZgGaFwK7xODCOVDgBD7/WkpKTPJz0qsGHHUsxRljNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1E52rRBP8u+ncjbCqUT3nrle7T+KhDadf0RCfpo4JKc=;
	b=vY6yvqMcq7lhpSg8mU1TwcxE7xbIDiQ/iRZYsQE7jon9S0JVCYcDdVpZSfcWIqb3m/UY
	 Bv+NjM8PQPnnDhPWktMKLKxDc0XzAsbZ9r9tjUvxOEu5GRxovu9ay+vKG/XO4y7XL/A90
	 bHKb2bOxwIjaHAISG53/sZem3H69etdo5PQHE7WbqoWvdWFKFNNJFxolxiPDhbsvDEpBV
	 cTWgJprLImJ5efuEsw86uTwAXbOk1dxAAxZs1vgA2TixTKWwQmPhkthNDT4L+N3aHWRDX
	 TB8HRiSf+xTqrS3OKr3HL15TTFllAki2z2TMPHnEoF+IrsorQh+l6J7Nd37MFw5hQyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HTk2vBAR;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA88606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DA88606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HTk2vBAR
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e20edd106so776649f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519641; x=1793124441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1E52rRBP8u+ncjbCqUT3nrle7T+KhDadf0RCfpo4JKc=;
        b=HTk2vBARdmUyxqB4W/v95PNQGXqVlbOV87oU4nwBN2ydlE3ynmSvbdjTv2Aq0e0hL7
         RKfj6Uq8WPH7iIBYSyrEtN1WiOUzNw87heMp3YaWmzeWkwWHSyisHBisJsgAkOMfn4xm
         W0+xxx8JVjtalQZLEvu7Ta/xZTouACr2mqiwMhB+lHxG7+X8MOEmOe7T7Zgs4rkrxIe6
         D20KGgCovdwto310fVan8KmYBLbLRfYqCgDQwSFXYpq+K3qH6l3ocfDNDuiZDYJVRkPm
         gpA6oJsjNHuxSAuxZVS7wjvfc0B3vGvNo8NCnwXSV5nclAF5fhZjZKrzYviklwR/4vF/
         WkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519641; x=1793124441;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1E52rRBP8u+ncjbCqUT3nrle7T+KhDadf0RCfpo4JKc=;
        b=jUA1pmkz61Fs1dGf5VKBx+pd8rQkByZcbaWjzC6iQBor1s5temCWDpp0HV1P1yvoly
         Dzwm4FCweU7yuJtOqttJ4bic6uZX9x8ZyV7mcDeqYXBAc/V1xUSAEBXUMIO32XVahH3L
         OXfYiBDEFO32/JCv+9Cjrf1Q4TmQguCR7KZuNxINctRp1igdISfsTrF/19z1sWfDr0TH
         EzHNt1YvRBzM8ZaDpwPx/nh7u7aa7sR1Bo4BwbEu/T05LZdm6hH4AiHO1fS1B84Sm43M
         g9kIBC0KR2DW72BvCAmT1zrMu3EVUsrviKrJS1jB1KhGxiTYezHcZgparxWr1vAHyMiU
         4Fng==
X-Forwarded-Encrypted: i=1; AKwUvBxCPWGjwPQ2Nb+qoKFJyq4HsmoxT80iYAE4EaUKRUvaKIcM0mm9dfNkGIlNzEaPd9RaOBwCATx90HN4V5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZDZOchV+1qsox8gwmHEmWwClNzrPp1/6mmErfw5u8fhyvnh4Y
	YqX6sas9uzGb+g1oQkjh+4joCoapNylRSdbrCOQ/MmsLSCxeqrz8mRkR
X-Gm-Gg: AYBFou2dApAwsVNZ8AkZuk/AJ2vUxcLzQ3LL+mMTuID1pH9QiIPuuizKhCxr71QIIhg
	jAPDv3kcaFx9iXc+fsDN0kd39CebV2fL2NmMx3UjGTe6vkAQ0wpzvhI9Zz1emyPTCA4BbDiZmYQ
	81zwflil2CqWoaJKzGbbZRFH++NSdsuKiCv5mgS5IeHjnGCNY6steUIUHEwAiiMN62I+CVBOAV1
	iyPzLSunaSQW/oRiSUwc8XfD4X7efkk9FZ2JOy7a1440+DsMZVNvl012sR/vuYTHyRdsjEaQI2M
	TlI4aJ4qWm04qFtxgJgtXvZ9pjipH9SDIxf0aedtj7Gysqzf1AQmsKG+1PD6+w6N18/x1it/vwY
	fcXh/zePc8wgk7Npl+6H20AetWtT2x0Ye4Ik/hWUAedAICGIVpdXqUCDu0OrNDmDJq1oUPJzfAI
	na5x8UVa1Lla49gANLd4gfuhjSxV/84j5xpU8vtV2u+yybvUkRZurDLgJ4vHIehPm8PpXDpBmhm
	tm+jDW98ptBbDV99U5dyOfBxF+Bm6wx6kxs7h+TqDM1/xuqrbqlyOQ+yKjfCHy7Q2kqUOjFdGBe
	rUTFpoOPSYG1AvtH
X-Received: by 2002:adf:e18e:0:b0:48c:7387:6b88 with SMTP id ffacd0b85a97d-48e07fa0252mr25623423f8f.37.1792519640748;
        Tue, 20 Oct 2026 11:07:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828e72sm25163f8f.26.2026.10.20.11.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:07:20 -0700 (PDT)
Date: Tue, 20 Oct 2026 19:07:18 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo
 <acme@redhat.com>, Stefan Kerkmann <s.kerkmann@pengutronix.de>, Marc
 Kleine-Budde <mkl@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Christophe Leroy <chleroy@kernel.org>, Helge Deller <deller@gmx.de>, "James
 E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, "Jason A .
 Donenfeld" <Jason@zx2c4.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option
Message-ID: <20261020190718.6cba898b@pumpkin>
In-Reply-To: <20261020163210.742728-1-irogers@google.com>
References: <20261020163210.742728-1-irogers@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 09:32:09 -0700
Ian Rogers <irogers@google.com> wrote:

> Commit a339671db64b ("vdso: Switch get/put_unaligned() from packed struct
> to memcpy()") switched __get_unaligned_t() and __put_unaligned_t() from
> using a __packed struct to __builtin_memcpy() to avoid strict aliasing
> undefined behavior.
> 
> On targets without efficient unaligned memory accesses (such as ARMv5),
> GCC may not inline __builtin_memcpy() into byte shifts and instead emit
> stack spills or much slower out-of-line memcpy() calls. Add
> CONFIG_VDSO_UNALIGNED_PACKED, defaulting to
> !HAVE_EFFICIENT_UNALIGNED_ACCESS, to use the __packed struct
> implementation on strict-alignment targets while keeping
> __builtin_memcpy() elsewhere and in tools/.
> 
> Fixes: a339671db64b ("vdso: Switch get/put_unaligned() from packed struct to memcpy()")
> Reported-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
> Closes: https://lore.kernel.org/lkml/47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de/
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
> v2: Default VDSO_UNALIGNED_PACKED to !HAVE_EFFICIENT_UNALIGNED_ACCESS
>     instead of CPU_32v5 to cover all strict-alignment targets (Sashiko,
>     Arnd Bergmann).
> 
>  include/vdso/unaligned.h | 16 ++++++++++++++++
>  lib/vdso/Kconfig         | 10 ++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/include/vdso/unaligned.h b/include/vdso/unaligned.h
> index 9076483c9fbb..726fd15efc82 100644
> --- a/include/vdso/unaligned.h
> +++ b/include/vdso/unaligned.h
> @@ -4,6 +4,20 @@
>  
>  #include <linux/compiler_types.h>
>  
> +#ifdef CONFIG_VDSO_UNALIGNED_PACKED
> +
> +#define __get_unaligned_t(type, ptr) ({							\
> +	const struct { type x; } __packed * __get_pptr = (typeof(__get_pptr))(ptr);	\
> +	__get_pptr->x;									\
> +})
> +
> +#define __put_unaligned_t(type, val, ptr) do {						\
> +	struct { type x; } __packed * __put_pptr = (typeof(__put_pptr))(ptr);		\
> +	__put_pptr->x = (val);								\
> +} while (0)

I'm confused (easily done).
That code relies on strict alignment being disabled regardless of whether
misaligned accesses fault or not.

So it is either always valid or always wrong.

Additionally I think the compiler can sometimes track the alignment through
casts (although it didn't for a quick check I did earlier).

Since having misaligned non-packed structures really doesn't work, the only
places these functions should be used is on u8[] buffers.
Pointers into those can (probably) be cast to packed structure types
without causing issues if strict aliasing is enabled.

If you write the value as u64 then read as u32 I think they could cross
even though the buffer is u8[].
That might mean you need a barrier() before the read in get() and before
and after the write in put().
(Partial barriers may work - dunno.)

David


> +
> +#else /* !CONFIG_VDSO_UNALIGNED_PACKED */
> +
>  /**
>   * __get_unaligned_t - read an unaligned value from memory.
>   * @type:	the type to load from the pointer.
> @@ -41,4 +55,6 @@
>  			 sizeof(__put_unaligned_val));			\
>  } while (0)
>  
> +#endif /* CONFIG_VDSO_UNALIGNED_PACKED */
> +
>  #endif /* __VDSO_UNALIGNED_H */
> diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
> index 597f5f0f9681..2436c20ee0ef 100644
> --- a/lib/vdso/Kconfig
> +++ b/lib/vdso/Kconfig
> @@ -23,3 +23,13 @@ config VDSO_GETRANDOM
>  	select VDSO_DATASTORE
>  	help
>  	  Selected by architectures that support vDSO getrandom().
> +
> +config VDSO_UNALIGNED_PACKED
> +	bool
> +	default !HAVE_EFFICIENT_UNALIGNED_ACCESS
> +	help
> +	  Use packed structs rather than memcpy() in include/vdso/unaligned.h
> +	  for unaligned memory accesses. Enabled by default when the
> +	  architecture does not have efficient unaligned accesses, as GCC may
> +	  emit stack spills or out-of-line memcpy() calls instead of inlining
> +	  byte shifts.

