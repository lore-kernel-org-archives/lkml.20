Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D68A38655B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266905; cv=none; b=YQcdiLeKE9fbrD7sDr5z4EmxF0ijPTXuAOtGKIL2122NuXYsbxxMoFgpUajAlHni6+G3g16F8+Tt/RSNahpe9s953WNddFZnZv7ZH6r/ZKpRc03+7cZdhlKfIpXb2j4dYfk7CkUScnPYY4dgsQnQlN1NZ4Al+DAAN0lwCl7Hikg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266905; c=relaxed/simple;
	bh=p7iI6+ahDmJNXHlVZ7n9Xa2A1C0IeZDRf6seGdB8lN8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q+jIO/EsYCVZG1ZHyfctUwbicgfwhA/iEOqN8OAS73rAcRWMFSTzual0sLQzurhWjVwDSjyJoj+F33Fcq4Km+W+Kut8wT0uHkK3VwxvNUgK28XHX254hTmsc4Fgj0T3faebMoZUNgeiBgAu7ykb3CpkEY4m0NiVaoGzd6xj+UXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8S1OoJL; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8S1OoJL"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a668ce86abso664814a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788266902; x=1788871702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p7iI6+ahDmJNXHlVZ7n9Xa2A1C0IeZDRf6seGdB8lN8=;
        b=Q8S1OoJLdHtfErnj9ZXcO348qThTsG4fM1lJjwfr0jgjrlIE6iih9n7bWfotHqIcl+
         MS5qnFAjfm97TyaETMCWrGrH+KL7cT4/qi+R/kLHsnTtHUdNWYFNGR7FiYURj73CTmYG
         awl6agIZrpW/Pe+2EIhHdFddkcf31mxUNCWTHXTLtfa1Gxe4HgpwbFLo4Ueh6NiHiUwD
         TKWssTPwUXKOqMfsPat7FqBjZv8NOnzRz9zHv/KaCtEQV780MqrasjGfXj4aT2a98WpC
         LKl6SdEHb4+QHJ1iMFY2D97JFz4bfXyBZzQKdPeOmd1i+jZ/NSUmlKigyZJb/x6UZQAw
         MXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266902; x=1788871702;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7iI6+ahDmJNXHlVZ7n9Xa2A1C0IeZDRf6seGdB8lN8=;
        b=PKdJ8zK/8+LH94IXAL/Ji1UVCUObIpyuARrn1dp/Ba+dVZYI+bTWPfHbBbcPanQMxb
         AC3wXad2CFMjLcC0MkfeglvqIRgEcsfyL9X/6Ku+QSHnV1dYPFWEJlIdewxtCScU1jT2
         UOoePHUtxLsuLfoMbcIfohay58RpBx7Dl2ZfMRhXpB+1Gt7IXBm7BdCA1G9PuK1F+6Ld
         YWvcNLFxFbIcm9yisceph0cZJ+HNiw+MXoNgfnZUP+OxtH+pImRI4SaPqsrkEfFr2M3Q
         DfZLNln/GC2rHOKCHhhBkzO9z2upQzJp+oPPVox//RzTIrz1cNEzCiiFpXj2x/d4g4B6
         F1ZA==
X-Forwarded-Encrypted: i=1; AKwUvByeqveSYNqmBggExB1giAXjA0yY+ilmcyj2Omi2sbn8G2ByqA7gRRGKlsAfqKQEcKJZDNiIhrJZS+kUUQM=@vger.kernel.org
X-Gm-Message-State: AFuF++m5fL9jAhFplaHwepCBLvxmgHamu5qLE+Y8AGj6Jd4B79ucx7gx
	KUtLw0AvmxMJNZ8A82XdanPlRC84JYbRBlzoqiIQJyjrp/IKZPHbvVxwo2MXOaXI
X-Gm-Gg: AYBFou05feWmTZzzXoWAzluisk2RDjV31Cpst7AtcGtRmgMEvmccP/FSXj/oNCMky6r
	THbhfdkNsDDFHLLEiCtd472wM+40nwCAujg4wsYzaTpYjta3YJxaSLo/5cFxsKSRgfZibWgS6Al
	/ZKGJmJU5B/tx6WuQ2kWwbbdJ0NhFlDC6TaesNpqrv07U8gz8q6Bx39uMTeNbPct287b4MmegY+
	i0TbSbIA8cOMgV1T/10nJtXrF0T3Bw675xgYChGRvHGt1Gn8inJ9jheHXJNMid77MJ4f3HNc0MV
	tscEPSdbVu+ng311VQ8WLn4nyxMC+rpnJQIsQd8WhDPJ3XPpD7PeA6UjJniBGyqJxzD2IBNacKC
	wu3jvgI0orjKz3EExuze+ZMBj0npFGWcrAHuMZhDKDl1xD6YwL3OK/+3fPlDD4X0P7bJclcOc2T
	TkjzBdL9IU/Gg9fBP1Keh7ZXzPHD+Zh7PmScbRds2BaJqebEZVUvj85MNfI4YBwpZNP5Sv963kR
	jj/3XaDSv8swUT7QOrgoQTxuA==
X-Received: by 2002:a05:6402:a0cd:b0:6a6:1a05:8b30 with SMTP id 4fb4d7f45d1cf-6a663a3c68emr5913673a12.6.1788266902072;
        Tue, 01 Sep 2026 05:48:22 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a66cf4e343sm783120a12.16.2026.09.01.05.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:48:21 -0700 (PDT)
Date: Tue, 1 Sep 2026 13:48:20 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>
Cc: Zhan Xusheng <zhanxusheng1024@gmail.com>, tglx@kernel.org,
 luto@kernel.org, vincenzo.frascino@arm.com, linux-kernel@vger.kernel.org,
 zhanxusheng@xiaomi.com
Subject: Re: [PATCH v3 1/3] vdso/math64: Add and use __iter_div64_u64_rem()
Message-ID: <20260901134820.0c5b820b@pumpkin>
In-Reply-To: <20260901102036-f5a7282d-4d8f-4f4a-89b3-7a75c83582c0@linutronix.de>
References: <20260901020636.1821993-1-zhanxusheng@xiaomi.com>
	<20260901020636.1821993-2-zhanxusheng@xiaomi.com>
	<20260901102036-f5a7282d-4d8f-4f4a-89b3-7a75c83582c0@linutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Sep 2026 10:35:30 +0200
Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de> wrote:

> Hi Zhan,
>=20
> thanks for the new version. However please slow down a bit with sending n=
ew
> revisions to give people time to respond.
>=20
> On Tue, Sep 01, 2026 at 10:06:34AM +0800, Zhan Xusheng wrote:
> > The vDSO basetimes for CLOCK_MONOTONIC and CLOCK_BOOTTIME are kept in t=
he
> > scaled nanoseconds of tkr_mono, so normalising them means dividing by
> > NSEC_PER_SEC << shift, which does not fit the u32 divisor of
> > __iter_div_u64_rem().
> >=20
> > update_vdso_time_data() therefore open-codes the iterative division twi=
ce.
> > Turning the loops into a plain modulo is not an option either, as the v=
DSO
> > has no 64-bit division helpers on 32-bit. =20
>=20
> This is not vDSO userspace code, but on the kernel side.
> The problem is that divisions are unnecessarily slow.

Until you get to (on x86) zen3 or cannon lake when they drop to ~15 clocks.
(I think someone finally allocated a bit of silicon to integer divide.)

> Also a module alone would not be enough, as we need the division result.

Isn't the divisor constant? (or rather a constant shifted left some).
In that case you can do a 'multiply by reciprocal'.
The simple 'multiply an shift right 32' will give slightly low quotient.
But you need to calculate the remainder - so can fixup the overlarge
remainder it can generate.

Of course, even that is only worthwhile if the quotient is more than
(a guess) 4.

David
