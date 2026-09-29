Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1384DD3A5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672222; cv=pass; b=Oc3dH289LmX2iF63oxqQIw83KxhsAc5kVVuppeLHQkgvEvWl7L3BmyWSzr9/uoDy4ktiQhTvVdXPvsEZbSm0QPdAts4SBC4NRdBpmpVEX/nlQFLL00wmZnG7xiaABqoneQIryYnYB3J+CSP1iyyLKg4gklAyH7Q+5jdUWEL6oUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672222; c=relaxed/simple;
	bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvuvKeIDl/8miTKaIeByorjJ/7UmEX3U7nIGmN/hev4yC4Pc0yX0VOxwffizXj6a51z7qG6tL0Th1dI7EZrJ+jd2c8AP8t8/mF0tf+xrVmPgFhh1dYOT7w2WIDPjktuzpuT1NBRmWYebyKkaJUJEqnYosPeUtoX1+NgcgB9GIqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=egkX0bpL; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="egkX0bpL"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so6174650a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790672218; cv=none;
        d=google.com; s=arc-20260327;
        b=P/O1KHPEu/R8mkJ8LKXbHBS6bl9uKBPlDIqXZ5T0I4agxkeItR/HS+tglcZsJPvqwE
         JUP83ti0hrxLHQiPykfzM2UHXfBikDTLK5jfV9IkJ8JS1BhQAlUypK6Oh2cOxvmCWKH6
         HPPU0L49wJGlVy7itoh37NvUKwm5Mng6/pa90Zc73U6A+EF2n2E5Ab7uqVpHxPZX//gQ
         +QLKm2UXwhMf+tO15jgZbbhKRbMdoPBxdOL+M47RsinDrdzHWcxm35jtM5m+13aoA6Jy
         0Forss4fbR+7lHCGipidZMfEydHFQNELxtOjOGS2As2PZVUDvhmF1u18MIXW/MCclaRa
         33kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
        fh=3klVngcJSBymzcmc8K2DfoUuPFyivY24R5N/AyFEYiI=;
        b=fLX3NkONND034qGnlxWAG0vy9vzrMFPLcMhZHrLcGVknsb66BLltYFKzHRqMJNEJ40
         Ch00m02dsiKd86Zb7eKzDYqFQ5FhRs9+EBrfY2UgQDDga7eVAFIv6MOjDPGJOK447puo
         nRWr6vmWfSglDndEAcfRXdbVj8DsfCYQhY6fUO/Mz9S//ceA3wtalsuUmqmXgD+GFGEa
         x18NXTkCsjvcaUuvldavg/mH6ettP+AGjtdCXepM3AjeeBNgsFSaYFW6eU8gI89vd8hr
         t+rcEQsGWYyTEIvZ8mw+lrW+//gZndQc7mhqFBUu2+0rRRL27hFJuzrp+Dsb1x3vmbe+
         dMDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790672218; x=1791277018; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
        b=egkX0bpL6rutl34raL6Zr2+yA6+NRhsfdwGss+M1PG3PmWtN5xcj7wyQzmXZM8tOpE
         k3YPGc4I0soEljUWJp/bjCcfLCFwHPHk2tDNe8OI+B6RiY+zCl+94iHDaEtdMq7pOjq1
         FA8AWwOZmBiEGsGzDNSpdggISx9rHbM1/OUdkm2fbzMb6hy4baA0vcmxCboLJrha9BhX
         tbHLJ+AHEr+mPjt3RVqTWMxSKWJoYlz6SpnhUn34zJZFb/XjNTtVk5KfA7ky8NSrWWFx
         rEbcckJMr7quxmO1VpZon0Lx2Q4p8mq2yGPe/E0pVtpsHe7VgUrQsSjXous/G+/5V2b7
         f3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672218; x=1791277018;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
        b=t6uNRSTp1eqVvJPpPOLZISh0xlMJ01ggHnuYogCZdPC09oats/xN/9KGaKnYdKUl9M
         Czgj/yX/BzIt2586z3qYFTn9dHipf4YwBOX4b9hrjW+wYTh//+Aoy2MRvDc8/NXl+Q/b
         7iH03ki2D4194YCbKgBzabXQD7gmXks8KbiTqrkutEJMOR8mw09yeVwynnObUIhRWzmK
         8g6+tqcrfQo9ABOIC/UnJwGL0MTLVsQXxSoG6X7nobtOrOVYeyglPV/4DYUhNdplexsg
         iZFDgDHP1TIxdM8dShmA/mfviVg2+ddTpgBnP3hrU7mgHpcly5KqS2rnM54V4wSaUTw0
         prFA==
X-Forwarded-Encrypted: i=1; AKwUvBwhUMrUnk4mQ8HzsmvZYzkYwTma0BfykrNrMu7brHrcM4Opfsok0QM4XSeNjXJbsJuZuXKY2BiSVTsI4C4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqBL0uyaJ9aiS13A2PDl8QmBjez7WmOj4F6j2UWJD5Ft6vS3Vp
	lFmIUtjhS4EPIzr6nSzaxCmLuP7+Uwln85tExrGxr0iUHnlyw8B9Jwsg4J6x37p8i12b9tGPbDI
	a3I2CYicCd4n8+9PZztLzIpgMlBDkIqhp/AN0IDrEIQ==
X-Gm-Gg: AYBFou11W9AUwFRqKXTpv3QlO+fi7CoUH1MjGVe1l826eD4pXk4+Cv483Jmu2QrsZD9
	rWnyqXOOx41IRluiO62uXMC1f8SQUrmzZMzzqENsdUYtIaya3BbqdoN/dle48E9hXEa540ogbIU
	6mpcr6yM+ATxCO9RvuW7Dp8t7UFf6weNb5J5EbOtX4y765bupF9XqaLtecrGGTxWJ+19YZnfvMe
	p55x4pklOMtjMsSQCRj4mlZBGzWhembaSXn1i8BYNb+C7ZZ/1LKNbch4X0PlzLTokWH9wQS6fQn
	39BAdhzr1koRoo9GlYK2FRDlmlEfBNxL+V+fCvi0SqN2r6q1fFSk3QJkpqqmtiHxhHlNAROCFoJ
	KqgYgXyqVwKdO
X-Received: by 2002:a05:6402:1951:b0:6aa:f14f:556f with SMTP id
 4fb4d7f45d1cf-6aaf14f5874mr8695635a12.43.1790672217943; Tue, 29 Sep 2026
 01:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <20260918-contrib-pg-pixel10-initial-dts-v4-3-745eaca28b1a@linaro.org> <7553dff6-004a-46a7-88c2-728651366113@kernel.org>
In-Reply-To: <7553dff6-004a-46a7-88c2-728651366113@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 09:56:46 +0100
X-Gm-Features: AclHuK-S5lTQAo2phJ3ee1A6qOipGEmCVgzdBHBpPtrnraavkUJzNtrZ-i9YXbY
Message-ID: <CADrjBPrUr4+oa2jFJw8PkFbO__Ov91Do7A-h8xp3zdePGQcMKg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
	RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-serial@vger.kernel.org, Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzystof,

On Sun, 20 Sept 2026 at 16:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 18/09/2026 21:05, Peter Griffin wrote:
> > From: Douglas Anderson <dianders@chromium.org>
> >
> > Add initial device trees for frankel (Pixel 10), blazer (Pixel 10
> > Pro) and mustang (Pixel 10 Pro XL). These device trees are enough to
> > boot to a serial prompt using an initramfs.
> >
> > Currently only Laguna B0 silicon found in mass production phones is
> > officially supported. Further revisions such as A0 silicon and EVT
> > devices maybe added in the future if they are useful. As of today,
> > these device trees boot fine on EVT devices with A0 silicon.
> >
> > A few things can be noted about these device trees:
>
>
> I actually forgot if you intend me to pick it up. I assume it's not for
> me to pick up, but nevertheless let me know if something is needed from me.

Thanks Krzysztof. If you could take this via your tree for this cycle
that would be much appreciated. I will then look to set up my own SoC
tree moving forward.

Thanks,

Peter
