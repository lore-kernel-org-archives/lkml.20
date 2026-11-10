Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794346072;
	b=nBcNS0u7LIl7otrN8VLlKb6uk9ye8qV9WPM1rv2+iWSxjR8i8/MEWPLP0qnzwRTjdbyz
	 QjgsD/UnlBh3lpwNcL0xJqz4dTBSgucrFCo+bmKwtUwaldJD6p3SShJSQGd2/m85WP6PQ
	 O/89lNNolL+Vpx0elzVcSEVBX3HdXr+FU41xRX4TsqsiJC96H+9/HROZ2XeUHn2M9CVJm
	 r7iZRZ3JNP6X/F+oJh75vZLAdfUckTfv4V7z5xhPtykeEw63qKBlk+ehbueFgAH1nGW0v
	 S9ef0jiDj2zf1ToU/ha5ZpBsU1wS9Fa9E4ElqjKZO9jl7mWjzIxI0qEV1sIrNy+9YoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LJYWTqt4MlGVhbCBzEZislQob+FWC2LtGnGQgjX3QTs=;
	b=3+5XTwsVslEKM9B5AjaE+1wKzR0VjdMkfscfnODsDtX6JH+S7RClc3eYenzXxYPpdMN9
	 j40VdlKa7PhXjKWffiuoN36CxHY912L2DcJBwfBbFvM1g0YGL5bnxVSFGr4xZ1cZUAqOh
	 dZqjMrZkPeXL1qUGNOji4Af3myDvQteMfT/bjzDxlvflPNNFXgwFrxvS7fN6Jt22/t17Q
	 FXiMFU5FsvLHwupTc9MFCh/RVftXyT/Qi/hcxAeb315pkei3IvJFDues8I1SY6Khtb/Ll
	 dtFO8OUE6fpsDRDNol3+aZTCDZ5UWmyhaOf8iwqrZYuocaHyXrOd1V+030UjDyORJdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=njZRWC3M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE76606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EE76606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=njZRWC3M
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3adef977ad9so18885041fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:27:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794346071; cv=none;
        d=google.com; s=arc-20260327;
        b=ZjXfNQg8p6SVunzONn0GwuWnx2FDu0U2dYNFX70Dn/pmMNKsCgljLpiMCXDh/SdrLE
         LRoG210gFD5N7JkeqjkZnAE/3k8aKYe/vD9fY9RCWI8GBYH6+taecn/GdPXXHD0+FyhE
         jytuey3j9kEk3+75JEHJ1QtynfrZn23XXsFRDf8PEKK3A9K0dOts86tAJfhepy4rKNZV
         azYP4bmJiFXlyFwXN9XyACUIp2rN4zJx6SYmY68dBwZD0sAni2OS031S85TzrTUojbXI
         clDkduL5TTl298xlf4VC4t7xliK7dUIZa7Xgzxc4AeJDRRA/he/+qa3vP8+W2pQPTcTu
         5qmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LJYWTqt4MlGVhbCBzEZislQob+FWC2LtGnGQgjX3QTs=;
        fh=RRiQV8pB/XsFxYC2NhmxB2eXeFX2imtqQssPUPejYWc=;
        b=j3gDc3qLCsSY2C3UUXHHWeVp9t6RsAmHjU6LaOsiUUsXOdAWSPBUc9kKOEGoQadweL
         lFEYJt/gywd3hSB7ShW8kkU11d9mOZjfEYx6BZqIH5un+JBCEDJIaEYABUVGXQQy65+n
         mP51qg9v8cxpKb4I7SraMNkJUNlDXkvPVb0lKc+bR6D6kPciE4yuejuHtsO8HECWEtFm
         iYM+Pn8BdvFoLsT9Aqe6DVK8/UaSKiw9AJxAK0pFL2uSz63ZxvsOgmRLDhU88hdJTOog
         nE0yC6ki4pPaQ0W28TeK49FFbK6jalHM2mnj58KFFrphDbDCNQf4EoFg36x2cfthsL2i
         fExA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794346071; x=1794950871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LJYWTqt4MlGVhbCBzEZislQob+FWC2LtGnGQgjX3QTs=;
        b=njZRWC3Mnr/LepxZRqp5QrOLDAtEW5XnfFDEhpEnHalQVLjSVvDmxLWv7Tc9MHNrDP
         lB5NEivjGrbuIRRFvuyOYrFEhvUJNmjfNyYXwHQ5VfYITNryvv6k7TH1Xm7qNkKUlAEx
         kfCN6Y1u1RO1eAHeCJudb2DZ1g6oJxS/ju6smcNQfXze5KYxzNZ4VvVXVvb+a5F6uyXw
         Uur1w4+OqTkCJxwkZkIYD96elyD8pv3VnpztAecXIYH0RvjDb/EaIWtuwhf2QrFxaTXp
         xQvavK8p377TSyvddHCzwh6hWljVOjXAubNchoa030tYKhhbqf8HX7ASvty2ANhMI8K6
         dQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346071; x=1794950871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LJYWTqt4MlGVhbCBzEZislQob+FWC2LtGnGQgjX3QTs=;
        b=gnkH/4tQHdHIcNsSeaAgh6hyN/8mOIU2WRye7weBM1WcWeWlFdTjHtljpyZDbyDLJo
         eOVKOQTsbVuRBHETwPfGIy8JjY8vKg1SW8KaVvfy5JqnyA/+U7kEhhws4kg7tP24OUD0
         sDuoDtA9tqZOFpWMh6XhUIRRxSv0qggo0bpdwMEo73vSByt4Ej7Cx1ylly/HHMXAxwQh
         Lnola59yYJ8A0G7aJN9VS14CW40K88f3IHeRsOEaux0RzqmAOgUtBQ5vyJ67RgsZuW5U
         TXDaZ/M6W0+O6h5kkZRVIdMBTdDDaCIK+lTC4se7CFPLRk6ss0tGrZWgpwUXSpfUM9aF
         kk9Q==
X-Forwarded-Encrypted: i=1; AL+hErHllMsW03aRTgCS7yQOGxOxFEMXDTiJPXP7vAkCVatIrH2y6kfOBxC+30rAr26bP6PzJOygN+/V0VTqNM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OwqF5jhHiHpJlW5RfKOoSUSI6dYV3nJmBc3GkIlyY1Zv1Hkr+
	iyc2USZ34ILJR2QkpXuIspIfoxNsOlt150V4fg56YmevUp7GUj14qShwRAOwDvwmrYHDF4svDqD
	fRWvnGcAdLldAEDy12AdvO10fCFfH5SI=
X-Gm-Gg: AYBFou0vLqcxtASP0H4FuWXG4+IOfvq6xu8xBpjPZrVonYJ38J+XpbysFDG+b+XPjxV
	BGoPxMhyQBiXRfQu70w4100/a/Rj8RC/dfU1Fe7aoFIR6erOUyRDawvstKMM8PYuNtVH0icfRD1
	1f0v09sMuZaSHT6+E6tp3JvssZ4xXQzyV3peLuOouTI9h+sEWEMnum2SVFIBvHLdhRTKrlkJY7+
	7wP1KM2CLU6oGSbzTXa2N7f8CF0PiuBa3wF/WyApfJowJxhBXVOqpldrfA/ktDByKsZN3JZB2DD
	+jolGbuoNFvYEqls7RmTvLDWbgr6m6KED6WTrbjWZ48M+h+90xpIeywkELQ8TT2SW7GNukMOvdG
	sQxmvZLogtuik6BVfJJnj7WNZ3TDuS+IeFrQg/XuL4uaxsesnXUhMVw8oPgrRRMWoKhztuMHAic
	GMiEwjT65USEmCY3AyjWWkFPqod6Zfg3pLZwdB3raBYN91aUO4cxWr
X-Received: by 2002:a05:651c:a345:b0:3a9:79d6:c792 with SMTP id
 38308e7fff4ca-3ae126698e9mr229911fa.5.1794346070392; Tue, 10 Nov 2026
 13:27:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110193134.1151112-1-linmag7@gmail.com> <20261110193134.1151112-2-linmag7@gmail.com>
In-Reply-To: <20261110193134.1151112-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 10 Nov 2026 16:27:37 -0500
X-Gm-Features: AclHuK_ZQSrlW-ipLLlYAsRhNuirxmBHoyF3qeb3-GIgttVflKhFwsA5XrvXqdg
Message-ID: <CAEdQ38GVjPFJAea1oM_SX4hH2ER2zDiyojE6VdXRFFNWkvvwXw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] alpha/perf: Account for time spent handling PMU interrupts
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:31=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> Alpha does not report PMU interrupt duration to perf, preventing its
> adaptive throttling from reducing an excessively costly sampling rate.
> Short sampling periods can leave the machine unresponsive with RCU
> grace-period kthread starvation reports.

[snip]

>  #include <asm/hwrpb.h>
> +#include <asm/timex.h>

<linux/timex.h> is the usual include for get_cycles(), though it makes
no practical difference here.

[snip]

> @@ -862,11 +869,28 @@ static void alpha_perf_event_irq_handler(unsigned l=
ong la_ptr,
>
>
>
> +/* sched_clock() is tick-based on Alpha; measure a short same-CPU interv=
al. */
> +static void alpha_perf_event_irq_handler(unsigned long la_ptr,
> +                                      struct pt_regs *regs)

Since you're touching this spot anyway, you could drop two of the three
blank lines above the new function.

Neither of these needs a respin. If you end up sending a v3 for some
other reason, feel free to fold them in.

The mult/shift version looks good. cycles_t is 32 bits, so the
subtraction is fine across a wrap, and init_hw_perf_events() runs well
after time_init() has settled est_cycle_freq. I built it here with W=3D1
and got no warnings, and the handler has no divide in it.

Thanks!
