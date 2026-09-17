Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6761FECCD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647346; cv=pass; b=NYSdxzICOlFQx7Rg9P1aZucXzmTklcptcGqxUHbS+4WOoLFNQmdVtj/HLZ5LlhU8YSiWjSl76zCpwSZaV1sXNLCl547tyZ1Eg1TD24h54ffrVaTulpwriRvGJDr/JQBD4MMUHGVyK6sG9lntolNgrERE1yOA1iAR5PEGGCYeqVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647346; c=relaxed/simple;
	bh=LZFYhEhHWIHNXKUGiHbv+ydyuO6lOjysOTH2X16TZjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYC9Il3fgOlDVb3r5VOKUjJ0U+ORaaTP6a7FrJOf3AUrHYJ9pVmRbDEupt3echlCvm8xC64wvPREJz3rj1Y0bvo2P8VeeCMyRLjHBFtPyjp5HciVLcqCrInIN4bPXV8h4S7f+5SMWtVRizDJUgkQowpZrsYCwnubhXQylIavUCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VpXOrcp9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Egr6ewo2; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VpXOrcp9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Egr6ewo2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789647331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZFYhEhHWIHNXKUGiHbv+ydyuO6lOjysOTH2X16TZjw=;
	b=VpXOrcp9SbJnle0PB+7ggCErSJXVC9d9MGkyjWHxtBkzviFC1GLA9FBIu8lZGVsYGRRFWX
	J1JsuM0YiacjVQYzjCmN7KNAqwB16BRg3dO36+VxP6KyKJ1KpxETw4etQRin1QDVP33Tu2
	nJ6KepJyehTzGaVGPBMm3piw1L0+Dmk=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-7jZXEr0qOCKGv81vFhSGSQ-1; Thu, 17 Sep 2026 08:15:28 -0400
X-MC-Unique: 7jZXEr0qOCKGv81vFhSGSQ-1
X-Mimecast-MFC-AGG-ID: 7jZXEr0qOCKGv81vFhSGSQ_1789647327
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so567279a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789647327; cv=none;
        d=google.com; s=arc-20260327;
        b=NzTDaWFowgtio7VpIOzkNSUQeiRk1S7JQ4IbXfaI2Srhe/Vlg/L6tkrU93JvkglD8U
         86nXA7JJZ72WvlHQL7kCpZ4W//PgqLPRv9bVRv+Um2g5gacGRQDt/aa/ChgcGw4WCnxh
         2HT5HVeW4MagGJRHKRyt51kPD7j9IPXWPZMuoJb0MjVMbI3yOBmm/iwHqIvHaWCYQMZU
         35HzCfhUDkE2yGapi/JZYUPfgOy48GGCBEH5b92RlxxQxoG/YmcSZqDYN6NoalNI5AoM
         88pZWJ9sVYhc1/AFRo5OenpRYYwpHvGumLr064mENet+SxLSS54CYiDeyuSESqxZ3PW7
         /nYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZFYhEhHWIHNXKUGiHbv+ydyuO6lOjysOTH2X16TZjw=;
        fh=uA2LakbAxrufQTXyYbNMuf2CqiVHQClD7QnYBgoKNQQ=;
        b=e2Zxo1CPHDRvhpPx5dBXefi0FoM6DTsDlp2kTJRj8cpLAnchqtI57tgL6QCc93wjAf
         mn3FosB+QAeO3FOfJufeXbYAVuRwdKs4wGRuv9X17LQaH+unilSpn5r62ysxY5Yrz8LN
         nERgAXvx1SUJivlfvtuYodBULY+fVqn2Jm/TKy5ZS9rIl94yUy/0XvCYELbvxQUXIATX
         BvxGTY6E6zCyMg9brJvKUbEyxsGsqKLdKI0vw9WthAdNaazoyIQS4PKjURqA9CpAIjOa
         0B6M/HEkD0Mc6Wyh3gLiz1JG1/aN2Zzd7o9H6kjsDuPYuRrNGIi+fp9EDQSpSuzfuo7g
         cIvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789647327; x=1790252127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZFYhEhHWIHNXKUGiHbv+ydyuO6lOjysOTH2X16TZjw=;
        b=Egr6ewo2RvzGR9gRf4KogPWedBgMxAJvmGvToLCzD6Zvwj6yjnr+wgVMrv+zI0pRyd
         s5bNzEv6rb9GtRN8VoFri/bLYD2rjniWIVpvVi35Wr0nu+MtpiD13CAXbu8WThGPXQIZ
         7VMkJ/LmeBA+681jP7yw/DpuqKoC1riqRF/oARzdo9P7X3sonAHoJz9TSItiSX73SJcB
         8ZPF5xhlEdzhwPZXvyDthLdOiO7m0+LQ+S59TIbMawbF9JhBXLUuGZHdbyuVa72/zPC8
         V3IqHgGSepgs0mJW301rN+gTyWtqIv3+nYn8Rh/Eofmyh+X7w8UTRRzW92v7Ila/O0Fi
         Tjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647327; x=1790252127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZFYhEhHWIHNXKUGiHbv+ydyuO6lOjysOTH2X16TZjw=;
        b=P3S6XySjAwNHmwNqspYDjEgVcrOCg0M8NJpnR4FH93eHHPHwow6HZ3vFSWMPOZ4bw0
         Wm+7TZhw6uXg3bJl7qrJDHozb+Cnh0a21Tddvfvn9C8kxIHDy5/ymUm8ZSns0Vap+9ZB
         l3l0ftBKUuIhXyFnNLwJ78B1wwMHuMvcG7NbLQ526oZToAWMBNB3dVy1CMpDpZl9zbz/
         MOesuTGifMkQVaRSC/kTS/akYIZKvwSEnfIOgMdX+jBzIfrf4b6Za081QJb5DxpSm2wA
         za6zjAbykeZtR/53hnjyNr2Qk1LUNs2VvKImZ5QdBWoMezRB28tUiZK+JoQQtmykq8AO
         S61g==
X-Forwarded-Encrypted: i=1; AKwUvBzflAbkNUU7AWsbscaJtl1bQqb0KLvyFV8Hwq9mLb4YCkE/RU1W70is5T3aAmp7MEbed0NI1DY8tc3wvbE=@vger.kernel.org
X-Gm-Message-State: AFuF++lpTDQHTHsIJtWBp/b1co+9lFWbQFPqrzMeqXzTtwgZgf9VKVwX
	j+uqUAkDoEX5JTE2xjIQ6GVzQPR57hTI6PsDipGRdEqIFOA8wOt67E81E15osWwTEBNFZJxSfxL
	aYNaMihd/PvweTi83EAzUX05cUNeNUQ0ZVJW6E1Yibt0oM4fbJs0uyLJ9aEYwe/YogAQrPrUHYr
	Gey+N2mZsTWL5uew27f0JpqQeh7HutkU70Q1qbLSLz
X-Gm-Gg: AYBFou2np31BagsHio4DTrIiX7dEewFh1BKaivXlRNjBuRWxFSk/JbIX9Wi+Cosq8gA
	QBpLHXjU19j7duCmv9CvRu8nGJRH8AOsy3VPzf3g9oERd/dfOVjNT+RX9CLS+o1qjJkSlxWfBTy
	1bfGMm2SAzML3WJdD8udaCc2uIQmpyP2PTekHtzqCq2+IX0Iy6xBYlNsPQ
X-Received: by 2002:a05:6a20:7faa:b0:3da:7140:da35 with SMTP id adf61e73a8af0-3dd5f5b29c1mr15338796637.15.1789647326742;
        Thu, 17 Sep 2026 05:15:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:7faa:b0:3da:7140:da35 with SMTP id
 adf61e73a8af0-3dd5f5b29c1mr15338675637.15.1789647325964; Thu, 17 Sep 2026
 05:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-bar-v3-0-5c2ac1c751ee@gmail.com> <20260529-bar-v3-2-5c2ac1c751ee@gmail.com>
 <2bfb73e6-dca3-4d93-af04-3c644929dd19@ti.com> <20260616083921.4066690-1-zaq14760@gmail.com>
 <423c3dca-9589-488d-8462-c3d51f05ee4a@ti.com> <20260617020926.114947-1-zaq14760@gmail.com>
 <8fcfab0f-6b98-478b-be4a-c5b810fb3524@ti.com> <20260731035705.3198816-1-zaq14760@gmail.com>
 <20260916082924.956116-1-zaq14760@gmail.com> <0a13ccb8-8817-4223-a4a2-0de594ac8c71@suse.de>
 <20260916094453.1062125-1-zaq14760@gmail.com> <f4c6feab-b1ec-48df-81a5-888444b243a3@suse.de>
 <20260917025644.1262504-1-zaq14760@gmail.com> <CAFOAJEfnDrGTg40h=R0mfZasroPkrSsmbVmmMA91O9uOzu_gYQ@mail.gmail.com>
 <0259fb51-acb8-4b07-a6d5-2fe25fb0de9c@suse.de>
In-Reply-To: <0259fb51-acb8-4b07-a6d5-2fe25fb0de9c@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Thu, 17 Sep 2026 14:15:14 +0200
X-Gm-Features: AcwNN1UH5rUGs68RRraAabQu2d2krHmsXTgl_y76k48XKzO4lUNKUp0VaqGzlHk
Message-ID: <CAFOAJEe_7Cqo_=NWPGyYBTu3mD3CjPMC92ZZR6qHPjAhQws7pw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome
 e-ink panel
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: LiangCheng Wang <zaq14760@gmail.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Wig Cheng <onlywig@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

On Thu, Sep 17, 2026 at 1:34=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 17.09.26 um 12:49 schrieb Javier Martinez Canillas:

[...]

> > There are a few bits that I think are similar though and could be
> > reused, for example the pixpaper_spi_write() helper logic is basically
> > the same than ssd130x_spi_write() AFAICT.
> >
> > Same for pixpaper_send_cmd() and pixpaper_send_data(), I believe that
> > is the same logic that we now have in ssd130x_write_cmds(). Specially
> > after the recent commit 3e391b0b516b ("drm/ssd130x: Add SSD135X_FAMILY
> > and SSD1351 support") that introduced a cmd_params_are_data flag that
> > allows to send the operation as command and the parameters as data.
> >
> > So the MCU interface seems to be the same, in particular for the
> > 4-wire SPI interface which AFAIU is what this new SSD1677 driver
> > supports.
>
> I cannot advice anything here, but at least I'd like to get ssd16xx out
> of tiny/. It would be great to have it all under solomon/. It looks like
> sitronix/ does a similar thing.
>

Yes, I agree. Especially since there is even some (albeit small) code
that could be reused.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

