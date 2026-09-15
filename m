Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90232F8E98
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447554; cv=pass; b=f3JX/zqEMwSCGKBBygi+kKsYU1S8DeMgBN0XmMsZur9hdEDCzXl7FjE/vayU5YlnFjGUUSqb/PLSueJClAS6yBrXydWC8DLbG1Dm6b4w9eP79ZCYeoDiRU9Cwf2q++N4zuFHrqhyUX6T1u6BnYv9EU2unDPjjL0h4v1kvifdh8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447554; c=relaxed/simple;
	bh=i8lUUtdcjqnzF0iI1zLV7fE+XgW1j6mCz00AP5bqSqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QmUgt53m1K0FkQ6I2ndn1h948/h1OW/UJvfyo9RwpAJA/U852JE05H7z09C+rlzNR4v8jNNtmzE9C22E3HD99AS62WeYorhlRP9ymqOCs8VLBSdUsOZRnh8o50g6TJUHYecQLEgIGJ3u2lb7z8cjrRGzuH4ZuToO6CcD82LQzyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbttgRWh; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbttgRWh"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c299de66a99so301729566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789447544; cv=none;
        d=google.com; s=arc-20260327;
        b=RFIyf3oUsNA1w0QSROhCfxOY/fhKavnO1h9sKAj4DgJxJGNn9mdNEdKKyyXFx1/lj1
         Q+seST+60rL3jMB/EjDWMALCuNJul2Kc0rZmRWefJ8Mo+ITL+S2OfYzkTBB5l/BDotX5
         oOKHhHC8buIXjgcrSoaY7O1C2J/dv2j+D7Cyjuia6vXxTGli9W11V/RREeyfvE7J4V1d
         KzHFkaEcsBCmO4LALNF6CPYAKsONzaL1ABF81E4ai3eWcREACbp0//ohw2qgCB2wfoi6
         /+4ohzoy648yoehVzOmDjMXE+y7JcxhzF/wmL+2JvQxPxsWFWEtCF+eaMy+zviKkT5t5
         IQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AVj6OOuw8+ZpNkuoXFcXlRxfZ6JLOmksHtPRzEkYO3Y=;
        fh=U8HiD6yQdu6/clf4AdPe7kmM1W8VIlIiAfAvebXE8Lw=;
        b=Rzyfwk9vbDNendNoZptIMNkjfeDlcKUe34sNyfZ6+CtBvic4LLLLj1qrcD2qviNtge
         xeEkPGI8HjP7gK9fmFOgAOJ5nTU2t5e5LSUtIvGQz7D/S7/6Cdvbzsb4vNFXsWdGCOSC
         NztWK0CCFlD1HBjcjb171A8RUNdaR3Su5ZPDP+S+fO+jcRMyHlu259Ft2LHOXaC4PE0s
         9/g943B9Lo2IECUcrxldSlirXr9XUnX+dQwsd5mX5hemkPWQ3oXqSg0pc7gXO8tztWNR
         nSqckNT6tQnOfI+0sSxsbqPTYRnYHp1zB16+6tVmYuFMDXN7RFnGYAA6FILZE6sgzxJm
         R2Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789447544; x=1790052344; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVj6OOuw8+ZpNkuoXFcXlRxfZ6JLOmksHtPRzEkYO3Y=;
        b=CbttgRWhtvI0N9xtlUCmv54XHEUwLxuuRs2Gniep6j59kPcZbgPj71uyWJBSwDoS0D
         Gy6CsWaqN17iZjEA4ohTnNdpeBkpOe0jpOFgyWCsaOEpxL2prsMtygtFAzp2I6j2NYrj
         aImaRZeUykYMYUvTODe4Ae/lqRZPcixLB+7HtDuxY+dOmg7VH1WBbOD8Wd5IPcqOnJq7
         aoBvKyX9F9M8F87sn1Zu5F++ssDnk6+J5M59ojf3/w1BhCZmp4nuaYbzD33yZE4JnJ6Q
         fIo9IOtuS7V4Q5e7NW9kJJvtaQBIbD+3G3/bNU9X6zA4+kAVLQ8eS9OmcTUDPU0UJOUG
         cpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447544; x=1790052344;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AVj6OOuw8+ZpNkuoXFcXlRxfZ6JLOmksHtPRzEkYO3Y=;
        b=xcHPEsqN4TExuq+fFH+CFX5o/Fm0gzOq5UQ11nD05BunXBN9ess/49sTUDizX+Gtmb
         DhsBT2gvIuDj9B82lQedUCJIdsIFzlXzMBY7+PnmsDxmG2EEtHXiD7M4AtqVehWQC9WN
         wIrEBhMSJueBs9eZjIhmCBMRV4PyWYx6GK3LidFhTtw6KAERaB30CmRh7/9DY19BWA/S
         ZWrUOHETLVQfqaTfG6BD2MS7kpSVMIQq7ENVG2zRZnm9c97lAPU5mQbjALjfSQVYFtAy
         h/NJ4sx32Yg5y2UMrNYiu55GH1LOJGTW5bkinWoLIWEREL3oEaNCcPVFMthlC/SkWv2D
         hxuw==
X-Forwarded-Encrypted: i=1; AKwUvBy5nmsY4HhrCMvaIr9cQ1eR815lWw0CyqcmUndZ9tjwFP/ShOUOU4N6jeKh2NklJ+Q1UgkES0RRCJcLmC8=@vger.kernel.org
X-Gm-Message-State: AFuF++kiaNwbbyGHy8KzCsAqjaqZXp0ouMO3MUW82GB8FmrKGH9CQYBM
	dQiA7nrfWoxu+cfiLIAR1Z4KES9VOOpNbSXAmAlKivLnp3pG+Iej9J9RC7MRRoODGd8RKVs+RvU
	UqXFuy0vgI+xZHEiZztfXjJ/miymBN1I=
X-Gm-Gg: AYBFou1Foy0EjqXippqonnOVIgJs+C2EFPKfIavtFBo+IUwC5yu5gC0rqtFc+jRTMC4
	PMEkWquE92vPQgtK13sU71xE0ps+S67WXbZOqGQ0U054nBMRshLLw5Sy8r136RhE/FSEjw6ChNz
	W38gluzRLkwEVvzy885KJHDM1wNB9VZ5AIpJ1oGxShpP7Vx0cID7E5KXw+Wh/XVYPA80vl++/La
	mcDqhou3i8XPl0YmcvA5BLg8ME5pQGJqkGEZVdV/0sjP9Ww+lVzauZnswOuOWwxDyQ5pjHsovhw
	L9YVOl1k8yajMIgWszlgDUY1vbSlBsSfrOKGuI9hzPF8okOIHKwhirE=
X-Received: by 2002:a17:907:d8f:b0:c25:c54d:d1a2 with SMTP id
 a640c23a62f3a-c29b864787dmr350678466b.18.1789447543614; Mon, 14 Sep 2026
 21:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913145905.9404-1-linux.amoon@gmail.com> <20260913145905.9404-10-linux.amoon@gmail.com>
 <d4174f6c-2ced-4827-b579-c54b37619023@kernel.org>
In-Reply-To: <d4174f6c-2ced-4827-b579-c54b37619023@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 15 Sep 2026 10:15:26 +0530
X-Gm-Features: AcwNN1XnROT-wl_Pv4SIRl9gq2osyQZq9QJ7pS3eOAiL7xJk3WzBKCm1k8F3Pac
Message-ID: <CANAwSgQ1Uno50rGMW3Mrtrmm_DW22fgOzbLZH7uHu=StQ8_t8g@mail.gmail.com>
Subject: Re: [PATCH v9 9/9] thermal/drivers/exynos: Select thermal emulation support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your review comments.
On Mon, 14 Sept 2026 at 12:30, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/09/2026 16:58, Anand Moon wrote:
> > Select THERMAL_EMULATION when EXYNOS_THERMAL is enabled, as the Exynos
> > TMU driver provides thermal emulation support.
> >
> > This ensures the thermal emulation framework is enabled whenever the
> > Exynos TMU driver is built.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/thermal/samsung/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
> > index e1e8035d24fb..7d5590f78185 100644
> > --- a/drivers/thermal/samsung/Kconfig
> > +++ b/drivers/thermal/samsung/Kconfig
> > @@ -4,6 +4,7 @@ config EXYNOS_THERMAL
> >       depends on THERMAL_OF
> >       depends on HAS_IOMEM
> >       default ARCH_EXYNOS
> > +     select THERMAL_EMULATION
>
> No, drivers should not select user visible symbols and also this has
> absolutely nothing to do with Exynos.
>
> NAK
>
Many distros do not enable it, so I wanted this selected by default.
> Best regards,
> Krzysztof

Thanks
-Anand
