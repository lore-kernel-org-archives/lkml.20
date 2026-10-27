Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118176;
	b=cscG3Xv4CmlUf4HnoxzjGMUWLLzbWmJ3i9I4v4AP9FGRt77sVoYzn4cbKgzHSAd2e0r+
	 lOJinsxfFwKw+9Sl/3/mTi1ElmiyfIqKi3ZPmN/JvaTP6MOEsejQ41hu5pb2s4rCZ8ZoB
	 nztIt95QT4Tk/N0vy6mRe619LB00yu38KO3dp8r4LlBTZk1HdQ1+UHL70OmjdsumLeM/7
	 YuXTGVz1IwWpKVtlfjjC352lWMXaaqmjdZQq4naQrSWyd2TxcIaOT8MgDdbBjFOiJOmkL
	 LBdLcvonuT03uEKYCZxGknsNJRVqBtcE94EmFhl5baxaEvRFEYoS70z5nzfFayp3P6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=j54dq75J+7uAbhmduFvYuY44W6HJdtNi7cBNY+H2V68=;
	b=UoNAWk3ApThnzQNA04pVX/lMRllpxwl0bCkCQH5GDZUeazGAFCY10QAVd10xE+qXf/ZO
	 DICdaP9suvOeZFQBYCXIZZVyCzEb/klDPvHbvT5y01gYuoYRYdg74cla24ienFkEWcT/7
	 bBd/wmjZEhU+lTkehnfzICtfKdOkEIYFqj9Z6FrdRBxjCBmwK5oqCa4Qv658KPsIqXctl
	 SgMS4ySib93h97ArsHwgIf5iuIlsc5yPpA7WgL67BysSU3ocgfbrDRc0Zsft1FS3b1PHx
	 z7a7ODPlTQsPWN5iXwZci1fyaxqL8a7MeGwHvpyo3g9G123yIrizqbes429rqqCAPNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dgV9nJRE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6911860A262C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6911860A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dgV9nJRE
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ab43af5e97so140997b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118175; cv=none;
        d=google.com; s=arc-20260327;
        b=fdUpiur8t5ucRJzmo6vbFGRW3w9sSU68+6GpRqLzw1HbLKDP0dpKVjqtB/fCReiT3l
         wQrRGaqG/XlbqtMKBhFnupe2b9WFF2LJHn8YDHvfn5WmzI0K5jRRAG6Pd0fPbpQa090D
         zzFkvaR1i2at5P/Iun7gCk9Kc+PYLkTjF/rQUAmG4U20dZxabkTwDE4eVR7Wb6l/YwFf
         H5MkVtRfLnhhPkjIT2v6PsKM2XcsiJwqI7GbiYup1SqOEWW2ua/KdkNTZ258GucyaPfV
         uwxqKVnBKrrRaGkD8BJRqu0yvXKUTQ56Y2yPndueIh+5wpT6pOaldZBzotaPqSmpKT6J
         1oDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j54dq75J+7uAbhmduFvYuY44W6HJdtNi7cBNY+H2V68=;
        fh=xkEszM8pZ9feTU5F2tX1DCM0fe0PlssmGLzgiAZXvTI=;
        b=l4eJiYtiNb3XMHRVpePg8ONTGhEtSo/ZSM34iNbzss1ph0XX1EUGeMJZLdpG/bYTJy
         7mD9uAh+fjRas07cTgWNZEFuM8EBzXiMk0smEmkyCu4Q/utr3u3pUZ/490jG9YrRmGy9
         SGppXo3V7UrrWPQrqzGTJ7WvOtulvnIdrO8mz7EBYhzUbUEi/U69ziOs6ReP0K38VNbe
         TIWLWSui1reOoTpQPAKOd8ZVC+U6Uq+CBfIRPmv9emEeRzUWYO/VAb7akA+wRCI23dt8
         VS4lxHi57pilAexIf0QDajHH7Pa1/5+F+80nBGYrM2eRgC4d1j+Ik1iJ+h0Lzsur9LmC
         Bjiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118175; x=1793722975; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j54dq75J+7uAbhmduFvYuY44W6HJdtNi7cBNY+H2V68=;
        b=dgV9nJREEGJRJ9QmZnqkErrAe+48xCQlxpl768uv/UFrYOpJ5vGmw1FdZrXRTu2cXN
         xdxn9LTkyvYmnAfpAeId+I87c6foglCe0e7IOk+MUjOI0KWkQ5+6WvOzSkNuiegFa62z
         PgVusNWxO5SqIq2OHRAWlFvaZ4SD4HksuK8nvqBBVkZdxU4f+5hyNawB365EHUmD50SX
         xd1fP9w+WSJT26mMvdN+TZLDrWisKuL/C2T22PkvAWscLcIZmOC/mHidXEnM+pQa+f8E
         GwVzeEnIaj18wcAo07Wb3PNMFzzLUXjv3OQJVqky8xgIUWOBLVSB7oHfumhlX4TLFuuv
         +9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118175; x=1793722975;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j54dq75J+7uAbhmduFvYuY44W6HJdtNi7cBNY+H2V68=;
        b=1SfsuF2RV6ZdIh6yyGJDnQl+KKQIvcbjeVInMlXgYmGDPhjS5Ue3wLXJbHM3arenmM
         kzJtiGPOakq2LauzHHloHMpqUm5fhlaH0DYuaheYK9eKdLOIDdc8ZTTsG2/aWMdSBR/H
         i0N8mBB5wUFOiM7U/RHEW6qwKBclTTs2YYdPCeZXA97sctbumspIF3fSDgGn6GY6mb4x
         hZu/4krceyH1U3as5T2/Zytd76nHlpBF6qFPM4xutsik7XRLz+o72FHCYWlxLpYxduxm
         APlhQy6UvRIstGp+UNjkGuNO3J59u4kM6I2aRJMXO8U3YL/2szB9QdxXI1HghUsrZOGi
         zc4A==
X-Forwarded-Encrypted: i=1; AKwUvByqBu2m5gfwdVl/JdVw6qwPK6fzm1+HWaPuTYR4lIQ5SCENhDg8HxeHvjboAZ2cRCA411Pz7wWF33ZQEQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIa+MYoxuib43IHQhklEIFrpVuht6CgYk1G745Gvd6Z6iM//Kh+
	Fm6ERWZ4mB/V5pKX4Wq+g9H6pr145wkpThHuI68hKr96ufUwPJEEXJ2r9dRMiolPFh2prWdVUDE
	p8gW4M4B/aWahGvzfACsGsZuEh5KHptE=
X-Gm-Gg: AYBFou3c45cseIl7BMkUXzZGCDooHdy0O3DFpMFKzXUMPtZYOrzRmXJ/SWf2WBBarXy
	Wk4G9HUDHeIf3YaC9obhJi4yV1tKk+TCWqtOyk/GapLsGb99vtwfsqUytVqOL+2ubeqVSpgSjFL
	MbhzGZcXH9Ce/IjLyF1pMBT4pflCTSUjswafB0HhbG6jYesEyU77nc99rdlpLk3jgHNfW0Pvt1u
	lfAyjo42VOZTsf6BbHXm+C2FCYdMe27wJ0RAuUSF+kV8wn0qwjfeG441/6TqnvpKMN0plyR3Kyr
	az6ayfwmgd5/wZmzDV0LZDVqjNpaeTCVjrlfMuGiTDN8ErHp8OTSR8VVu3D6TuUN3sGCL9uMsal
	CHWYKBPHpQ6WvNtQZTG/NBZhNpzW/l7+tSEwDyg==
X-Received: by 2002:a05:690c:fcc:b0:8a8:316e:5973 with SMTP id
 00721157ae682-8b19c9f0c84mr27894277b3.14.1793118175296; Tue, 27 Oct 2026
 09:22:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027032609.119226-1-lgs201920130244@gmail.com> <f342a5e4-82b3-4044-85a3-10cad08595e4@kernel.org>
In-Reply-To: <f342a5e4-82b3-4044-85a3-10cad08595e4@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:22:44 +0800
X-Gm-Features: AclHuK_rUH-wQYjXcUxpNAITglYIi677x8p05GEnBtjGRev3n8Z0DOrQJ-qbQ2Q
Message-ID: <CANUHTR-SJTiQvo__wbqosSQV958fkHGY33YTRFor2=EwDTdXPg@mail.gmail.com>
Subject: Re: [PATCH] mfd: twl6040: fix IRQ action memory leaks during teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@opensource.wolfsonmicro.com>, Samuel Ortiz <sameo@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-omap@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 27 Oct 2026 at 23:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/10/2026 04:26, Guangshuo Li wrote:
> > twl6040_remove() currently removes the regmap IRQ chip before
> > removing the MFD child devices. This destroys the IRQ mappings
> > before the child drivers can release their interrupt handlers.
> >
> > The parent driver also registers READY and thermal interrupt
> > handlers using devm_request_threaded_irq(). These handlers are
> > normally released by device-managed cleanup after remove returns,
> > when the corresponding IRQ descriptors have already been removed.
> >
> > Consequently, free_irq() cannot find the IRQ descriptors and the
> > allocated struct irqaction objects are not freed. The associated
> > IRQ threads also cannot be stopped through the normal cleanup path.
> >
> > The probe error paths have a similar issue, as they destroy the IRQ
> > chip before the device-managed IRQ handlers are released.
> >
> > Remove the MFD child devices first, then explicitly free the
> > parent's READY and thermal IRQ handlers using devm_free_irq()
> > before removing the regmap IRQ chip.
> >
> > Also update the probe error paths to release successfully requested
> > IRQs before destroying their mappings.
> >
>
> More of postings by bot ignoring any feedback.
>
> Best regards,
> Krzysztof

Thank you for your feedback, and I apologize if our recent submissions
gave the impression that we were ignoring your previous comments.

We did take your earlier suggestions into account and subsequently
submitted a patch series accordingly.

For the more recent patches, however, since they address issues in
different drivers, we thought it would be more appropriate to submit
them separately rather than group them into a single series.

We certainly did not intend to disregard your feedback. We appreciate
your time and guidance, and we will be more careful with our future
submissions.

Thank you for your understanding.

Best regards,
Guangshuo Li
