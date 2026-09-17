Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6BE4BA1FA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642213; cv=pass; b=JLEU9u5xRJWz3PrmrnMVP9WI3fGyiSmkjW3XPO/4D2OD8eLJGmFr1hqPPU6abu6yqYj7fw4S8uuf603oxvjf1TAvRRR2lX2rQEcdRCPYIxA+LVAz7A16KUYwK7gy/JxGWm4pMpnbAG/Pg3i5wqY6DqaCK6EZN0ruEZA0X2ZrKOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642213; c=relaxed/simple;
	bh=lSkvGaijP0/9iVUmeNOEu48KokHNhG2VqwkL4j70uUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PS0Lww5QzmAqynZOSojNbVu94u3wAJji0z2uvLBpMUsy472mBC2MHP4cmh2uQLNGexnbjZDiYf/njn4BTcQzT7vhqSPjiIA18BE5ciLPwinx6ketAHJw+U98UwEXZpv0a1z2fT8XgVokL1GlXy7DE3tyPQzq54vXXkw/mAU0OoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cnVWuFar; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=E9/TnkuM; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cnVWuFar";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="E9/TnkuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789642207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u6ihbO4Iqd9EoQ+wSGF6cP/+ZqsoR5JgyUGsjJYPabY=;
	b=cnVWuFarWugzlHumUJ5HJfYhDUYhhzYAijMN9doVb2whYkxntCNPswokNufR/9Jv1tZeml
	M6NiP7TVDshHFtoiKyUaMkeBwoMkfwM1iJjicgds+R0IltXENZ83b9sTjP5IPNkvCQPCuH
	XRuXVpZqfKi8TfZXEhASCEyjNo5CvJA=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-zSRiMjADNdqPPicvmUD-AA-1; Thu, 17 Sep 2026 06:50:03 -0400
X-MC-Unique: zSRiMjADNdqPPicvmUD-AA-1
X-Mimecast-MFC-AGG-ID: zSRiMjADNdqPPicvmUD-AA_1789642203
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b8088203so693430a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789642203; cv=none;
        d=google.com; s=arc-20260327;
        b=ZnyG6ZgAWAJi9SA7ASrun7kJ8N9Hm2jxo0pEyRZBckE/MTMB7K71vj9h0GH2OhZdTw
         RBdzF0yuFbKCdku9MQe2FGPM9RWP2c9LaI4PhFahNv92xxGepKuvwXvnmRYjM0X32AJh
         rRyKQbdVYEm6x5Jc87jAQT74/3+D5vf8xW/ncgH8B4GNujJavqagJ+qgNqA+nJ7MIRTK
         /t3ch2v3EBscfCJEev8mcsVlvtqRhXEgV+HLA7fFW5PdLisNQL5BYoJyOV6gRCLCDFHN
         EXbTGE2KrxpJ0kXAN0GHn0C1cYk3irXnLZHrC5alwVgOCfp/xXQFGSXgQWRL2M7eb43c
         Y2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u6ihbO4Iqd9EoQ+wSGF6cP/+ZqsoR5JgyUGsjJYPabY=;
        fh=EuNwpZZwIjfx7/3uHr+EPSJNZ8VSQigJqFcpabf2a7g=;
        b=aDUjx3S29j5DMeHnh+Gnrafe4StMir84250A6C45CFvOC460ewOFDUzcRzQmWvzMG0
         vcPjiZRDXMo44Y2A0tiuz+TRB1SijlougRSO2Efmv2uuT44slbVBcbPlNDWTO3jmjZiQ
         xhwfL/h0CQg4ug1NvswfNy/5XI0QNdWPmTNyZ6L8YxeZxgkRe1pUJ1lMUnTc416GmSJV
         xztP+wZd3rUVIj2ZucA5ffIKWvLNf0S2jCNCHKVK2OYUr8a7reRUoqpEtd4wdjgD5TV1
         SLC2bL57oNrzAtPeVwYEMLkbRSaRw3vVctMqAYJEpPUJve37it7WYj6CahfH0dfLAPsU
         l7HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789642203; x=1790247003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6ihbO4Iqd9EoQ+wSGF6cP/+ZqsoR5JgyUGsjJYPabY=;
        b=E9/TnkuMXlBPwUMw61Or8JTE3omfkCGb8FcyMuee/VSm+4jl0y0gjlkgmhfL+FkcFh
         wA218V9QZrz8B+ga3OAduarWV0z1lJldrPdiuT11tOoOUiTYaYXQrTyAsG0y89ZYK9H3
         CqswxAGhrOnPm2uaK2neWEZV+juSYuQLnxhNe5bhhPWwzZ/wNz4lnM4yAheHEmpNwAVy
         6Fi1I4wVJf1QmoJdeeYllRq8vMUPxMzBE7ACAa6k9sx3RmAtc7SScdIZhMOigKDLWy6P
         Q+ffFH3CeRrqCQlGoCqe4Nj+S34zTFI8dsKnsTj+94+bXKcBvkWA0pjUvNBEzRAYdRSg
         sBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642203; x=1790247003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6ihbO4Iqd9EoQ+wSGF6cP/+ZqsoR5JgyUGsjJYPabY=;
        b=wo2wJHt30YmlR7nSfIjPRv4QFZnDsAQBVJe0rSe4s3chhcJaPwn7Imvu7U+PW8Qq9h
         7TFdmgaASib5IDZBC8TEICN0MSN6ALnRd3FHfh1kLUE8DUXr3mF1yU7l/55SpZprVq3K
         Gxpip9uAYaERDdKDWFMu/ME82WA1lv3oSciXnh7NRhFLQIEZyv4lihr0gjbX6DgFuNIf
         nANBATMa1gXZMeashWMeHB4U3QaP+8YaY9k0dgiV2FS4rA5vP+pomCf0TaTzYLdIevKo
         0F4mYcExY9iGVKvm+ddPjBze55XZIPDORKmfdbGkUR7waXlSg2l1+4Slf79itWb40UqJ
         U9xg==
X-Forwarded-Encrypted: i=1; AKwUvBwZk77II8Rp6RcBnFpGm/c/H+wHYw82yiFQYHaiFYp9+MCR1ZQhus7w8ZE9+Mo4I0jTsa3SHytFsjZVlzw=@vger.kernel.org
X-Gm-Message-State: AFuF++myG+/NwY6ii+CLb/f5YW9Oe4hGmr+14ipC/CHW00sZzy9ZwLgx
	sw+0QkcF6HYwW8JVYqVR5iivLbOylw3xE9kbFVxW4OjuWh79Ql3wmbSU35I1dwmtU1JEBdJfzbr
	P7EU9DVdqoPGZgqxg2Uattjs8azTIVVGTB6pZBUyPiIQ9Lyf6Kn7TXp2zSxHAhjKffiNf63KX33
	aj9GvHFF0llw/Yz4ahb1vrWQOEElTS6QV0FO2/uDCy
X-Gm-Gg: AYBFou28NXveLjvXnwD381bvVo4w4Ro+6Ed1A4ZZlSIt7oxalVThfgoRDnQPUBRTuLb
	q/ARrrKUtyFxubmqIUyVmnHoYcLtaa07PG+rThMw2xNZiuZwlVPjUWH04dTcqT24MBbapdcARSv
	60J8okRc/SIbElyn7kw6Lu6vmVPXk5hj6uHhjVGrtDJcRVTjLPyXhSEvhY
X-Received: by 2002:a05:6a20:d70f:b0:3db:2c66:6638 with SMTP id adf61e73a8af0-3dd5f471e3emr17197364637.10.1789642202647;
        Thu, 17 Sep 2026 03:50:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:d70f:b0:3db:2c66:6638 with SMTP id
 adf61e73a8af0-3dd5f471e3emr17197287637.10.1789642202196; Thu, 17 Sep 2026
 03:50:02 -0700 (PDT)
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
 <20260917025644.1262504-1-zaq14760@gmail.com>
In-Reply-To: <20260917025644.1262504-1-zaq14760@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Thu, 17 Sep 2026 12:49:50 +0200
X-Gm-Features: AcwNN1UM1luWQq9ihk-KOU9oijNFKfCQk8IyuxX6LfLxCouMc1ifgDhN-sy05j4
Message-ID: <CAFOAJEfnDrGTg40h=R0mfZasroPkrSsmbVmmMA91O9uOzu_gYQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome
 e-ink panel
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Devarsh Thakkar <devarsht@ti.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Wig Cheng <onlywig@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello LiangCheng,

Thanks Thomas for CC'ing me since I missed this patch series.

On Thu, Sep 17, 2026 at 4:57=E2=80=AFAM LiangCheng Wang <zaq14760@gmail.com=
> wrote:
>
> Hi Thomas,
>
> > There's also the ssd130x driver under solomon/ how does it related to
> > the ssd16xx? Is that similar as well?
>
> They share the vendor, but not much else as far as I can tell - Javier
> will know ssd130x far better than I do.
>
> It is an OLED driver over regmap, while ssd16xx is e-paper over raw SPI
> with a BUSY handshake, RAM address windows and waveform LUTs.  The
> register maps do not overlap, so I doubt there is much the two could
> share.
>

Correct, I don't think there is much overlap between the ssd13xx and
ssd16xx families.

There are a few bits that I think are similar though and could be
reused, for example the pixpaper_spi_write() helper logic is basically
the same than ssd130x_spi_write() AFAICT.

Same for pixpaper_send_cmd() and pixpaper_send_data(), I believe that
is the same logic that we now have in ssd130x_write_cmds(). Specially
after the recent commit 3e391b0b516b ("drm/ssd130x: Add SSD135X_FAMILY
and SSD1351 support") that introduced a cmd_params_are_data flag that
allows to send the operation as command and the parameters as data.

So the MCU interface seems to be the same, in particular for the
4-wire SPI interface which AFAIU is what this new SSD1677 driver
supports.

> Its shape does look like a good model though - one driver covering three
> sub-families through a variant table.  And if you would prefer ssd16xx to
> sit in drivers/gpu/drm/solomon/ next to it, that is fine by me.
>

I think that's a good idea, as I mentioned above some of the helpers
used by ssd130x could be factored out in a solomon-common.{h,c} or
something and be shared by both driver ssd130x and ssd16xx drivers (in
insight I should had called ssd13xx to the driver since now it
supports SSD130X, SSD132X, SSD133X and SSD135X families...).

> > If the ssd16xx does not make progress, we could also try to merge your
> > code as ssd16xx and Devarsh would then add support for additional ICs o=
n
> > top.
>
> Thank you - I would be glad to help that way if it comes to it.
>

Agreed. The ssd16xx driver could do the same than ssd130x and support
both SSD1677 and SSD1683. They seem to be quite similar by looking at
the datasheets publicly available.

> Devarsh, it is your series though, so please say if you would rather carr=
y
> it yourself; I would only pick it up with your agreement.
>
> I should also be honest about what I could offer: only what the SSD1677
> and the PIXPAPER 4.26m need, arranged so that further controllers can be
> added on top.  This panel is the only SSD16xx hardware I have, so I could
> not implement or test the others.  If that is too small a starting point,
> I quite understand.
>

That's OK. When I introduced the ssd130x driver, it only supported the
SSD1306 controller and over time we added suppport for more ICs and
13xx families.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

