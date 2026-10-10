Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785DA253B42
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596370; cv=pass; b=jhzWHiOpOOtPf87G689iL+njThtd0MYUsAbucP5ncpCpDvEZhi5CIOAsABAujF+djj07XNBJe/YMN/+Y2xTz41U3bNeEYSs4qm0j9lSUWbRGvwVzFKmYCHFAUdI3Awa/998A0ibVKubl4PYgVvMXJADUrkjw0ASc6/ug1X2SRRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596370; c=relaxed/simple;
	bh=Py0m1Cmsix5Ovia8S5x9H7+61c70VbqzFd88urpR4SM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fuqp65lPjMtOLTCld5fk9t3YVdnAknpCS4pKpz8g6aO+if1Kw21alFaPQiMFb/bUhXeHlfDZVJ0McGQqdBvgYIecOQfxM6eNC2vnMo1t/XiSZh0a5XpdnCOj44kdb9mw+6NLvyrMOBynvO04SCRVSJABYnUs/QWGoCSPHrVwTOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9bxpvuH; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9bxpvuH"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a9c92ae2baso3030681fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596367; cv=none;
        d=google.com; s=arc-20260327;
        b=aadAkj4tvd/7dzN/U8LoEeJEttLKROShZ9mA+gnUYQCiHBAnYKahDPyg8uBmc46Qi5
         q55U8dnhpmduqpqLs8+kiIla//ICoR9a8/KQZoiQNsNXluQ7o7wzdEPy0bGcu76+fcWv
         txbqraiWpkobNCcmnEtfzyGQn2L7vMTcF05sO6VZ6tLVBKamGWkxGpetayMVFdKVL3Wy
         COeUCNw7MsXmKGfLFX8aFT1S1oDgsHmhzqXcLee30kj8B++okEi9m2j+gKiLn9cJlooQ
         NZjJLp8IKBQ6whP3AfVlJa+ujMxCtTN7szSST8GIicIJyS1Ik0Y9j0U7mSp+mKeYCw8l
         lvuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=faBeTeOeJiD3ztqB5joeMU/OkwY1xLFt2Vxq00Acafc=;
        fh=lJbajVuW4zgDsRrtz8T9Zh/kBwgHGrO4ZKlP0Wi6v6Q=;
        b=ePOCINEv8NE8w+xKF4hKup/SPJqtrKh4lN7WU80xOjy1EYh3FWMdMi+Alr8+sF2r72
         AGiuJbG21t6oQr9WtpCcLNfjcGUIVCesrYAZyw9udARJoNq26AKVV/DUMBCpcP2ud79z
         Y72XTwdFtjkt+6EHLNjs/AgpJrqcbCtqRkyT2M0xCzWDgjtHc+lKnLYmUsgEjS4gmCA1
         RUqJxUNlp808jd71blFQG+d3KnMGqGQorYeWcLuEvJEezXZkEesDsksnHQRX5Z8Fqx0q
         ZERYWtA02sUTyW/FBnSFjkBHIn8ptNhadasNHzIiScDiDv3oMRkCSp5V2yfVCNKLiEk3
         9T6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596367; x=1792201167; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faBeTeOeJiD3ztqB5joeMU/OkwY1xLFt2Vxq00Acafc=;
        b=K9bxpvuH2ekAzM25HmGprS3ZFX8epkF6l8ToKW2eBqe3gFuX/98ZA4iiFOWnvae5IE
         aeJflEWuJg7MMlgWzXvuMlkjBe0mE2o4l2sxDKhroPJ/AHc4Qj8fz4jWO/y7cX4ADJuK
         c5MFTD17vDaZ9CNVO4kJxv6dfQ6Fdjy5Kvcv72sSkuxKw3JAKoWbO4RFH45I1jegpMba
         9rZ+nxCDJlRPR2+8LDCEnqkVQmapcIcUQuiCYUwNuWeiLKQCljlBjNhz8bXDH/LpxZ1F
         nf1Lq1bWjeb3ZZGuUV+XRAE9JtyoSeFfzc+eHR83rdYrMqO7WBmtu5j8kMZ7LCKGIRiW
         3aJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596367; x=1792201167;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=faBeTeOeJiD3ztqB5joeMU/OkwY1xLFt2Vxq00Acafc=;
        b=w5YDShxLgiEOWyi2HDyXnsjpn4j9ZUGX3jtwFEUtnFTZO4uV7JnmSb0dda6rAH2re5
         2U7Rf3tQZ/PlR2ptp/mwBOx22/ET+NXKlVswrSwSVXnP9qB+ElCAnU+8SXKDyGtayiqt
         //ETvj6f204iGQU9RhfimszH6lWtqLaGFp6pQB5YKfoDRBZBzs6kJaHy983hzPzKnomN
         3hPGZAcBQoz/ZaWEpriHZhnF55qCZTt72M3Dw3aeLT/fS+Y4+pZdToEbaBjPzI3N7zYR
         hlqWlSkEsPdM4sYIApoCttCGRr1zPPlUNoMtvvgTzC6o+bhfhvhEnke2xpU1kGynmTJo
         uFTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwZnrJlYaV+RGaKBqp6O/5sNfNrSmuMBXzpzkuKHcFawcnJIxNqlde2ICtf6YSYaEyIZy9nTd5v5uX07U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZYbkiR1Z/OwMtV0m0kgV1zjlwwChmIj3bOpS2Ft1vw5UbRBfN
	N30RtJAtifMauPAlO3ArU7RiMVgK6mR/KJrCeKxM1h0XQtYSNaOpYgFDY/w16sd4If9NUlhaK5M
	kHHF1IlPsKBvZZ6qchXihcnY3gWypk5AJ/Y3h
X-Gm-Gg: AYBFou05cgOokY2paIftgUmV//TRZFTuqWWonbviE8V6P9GPPmivdgoe0CiG9MtztQ1
	A8BCFy9kl9Cx94HknhR7a35aIzo8GjW7f/1Ouh+uzghaXMHxGIrw2mkRuQeDh/wdM8NMdFcqKAB
	xEwGcCuPWcvxuJ466+I1VcItxWtjZ///RgI76mbIE2vHhoHTLIb8YIasICjdTue1fzI5xMJ6CeG
	+px3NRMAjqerYscy+CPIrrCBY+oF9dB0ldgbmR1l11pQa013FZy/76sqviZlebf3klJcXymZb8v
	Br1uOAbMyyxi9IMr1ERghcUqGhILDVRqB+ryvDr/kU0pTYcEf0OXnHfrsaZuF3X9k6OYctOERoE
	DURdTFCu/Re70Fm1VaZf/Zq3K5ewe8E6kkQ23mxwD0t+XOAohIHftYUPgv/anEm9fVkHXpRk=
X-Received: by 2002:a05:651c:a20f:10b0:3a9:8408:8c5f with SMTP id
 38308e7fff4ca-3a9c54b827emr5595251fa.10.1791596367170; Fri, 09 Oct 2026
 18:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-5-linmag7@gmail.com>
In-Reply-To: <20261009115627.969047-5-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:39:14 -0400
X-Gm-Features: AclHuK_6Zvi_sGedYH5sEa7uaFuP23B_qDaBTwk1HdWpW25Qf_sKUEDrxHxpF14
Message-ID: <CAEdQ38Gh_t_XXu0DUGDzS3V6U_HX5R5TGVgYB8640TyiPtk4rA@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] alpha: decode and acknowledge Tsunami system
 machine checks
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> +#define TSUNAMI_PERROR_ERRMASK 0xdffUL

This leaves out bit 9, and errors[] has NULL in that slot, but
core_tsunami.h defines perror_m_rto as 0x200 and has a perror_v_rto
bitfield. Which one is right? If rev 4.0 of the HRM marks the bit
reserved, please fix the header in this series. If it is a real error
bit, it is neither reported nor acknowledged here.

> +static struct el_TSUNAMI_sysdata_mcheck *
> +tsunami_system_frame(struct el_common *header)
> +{
> + if ((header->code != 0x202 && header->code != 0x204) ||
> +    !tsunami_frame_valid(header, sizeof(struct el_TSUNAMI_sysdata_mcheck)))
> + return NULL;

Do we know that DS10, DS20, XP1000 and the others use these two codes?
The vector already says it is a system frame, so I am not sure the code
check buys anything.

When this returns NULL the caller prints "Unrecognized system error"
followed by "Unknown or truncated Tsunami system frame", which is two
lines for one condition and none of the frame. Please dump it raw in
that case, as the EV6 code does for an error it cannot decode. The same
goes for the "layout unknown" environmental message on the non-Clipper
boards.

> + expected = vector != SCB_Q_SYSEVENT && mcheck_expected(smp_processor_id());

Nothing sets mcheck_expected on Tsunami. The only writer is in
core_tsunami.c under NXM_MACHINE_CHECKS_ON_TSUNAMI, which is never
defined. So this is always false, and neither the early return nor the
process_mcheck_info() call at the end can be reached.

I would drop both, along with the changelog paragraph about expected
probes. If you want to keep them for a probe path that might come back,
the changelog should say they are untested.

> + if (vector == SCB_Q_SYSMCHK || vector == SCB_Q_SYSERR) {
> + printk("%sSystem %s error (vector %lx, code %x) on CPU %d:\n",
> +       err_print_prefix, vector == SCB_Q_SYSERR ? "correctable" :
> +       "uncorrectable", vector, header->code, smp_processor_id());

The old handler went through process_mcheck_info(), which printed the PC
and called dik_show_regs(). System errors now get neither. For an NXM the
PC is the first thing I would want to see. Please add
dik_show_regs(get_irq_regs(), NULL) here, as ev6_machine_check() does.

> + if (fatal)
> + panic("Tsunami: uncorrectable ECC or PCI write parity error");

This is new policy. The old handler never panicked, and none of the
other err_*.c handlers do. I can see the case for UECC. I am less sure
about PERR, and fatal is computed from the live PERROR on every vector,
so a correctable CPU error would panic the machine if the bit happened
to be set.

Could the panic go in its own patch, with the reasoning in its
changelog? That would also make it easy to revert if it turns out to be
too eager on some board.

The decode and the write-one-to-clear acknowledgment look good to me.
Writing back what was read is a clear improvement on the old hardcoded
0x040.
