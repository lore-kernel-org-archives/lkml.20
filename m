Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602209;
	b=hgpAUQYznKb0LvGd53RvJ3xHiev5HO+QzQ0SZGhy339rAqTLPUCl9fS4waHsWlHkVEUq
	 zXVJ8G5JgBAVYkb6blzrnKdVRMassZ4ZLK8GQX44EEqWg3ixcdrIVaXjvxphJmf26YyPM
	 ANuX2+8KLlV75TtRl56ftyuTpOXdWtEfpv0tP1RlP/VzrFtX/IF3ohPPyYali07ZBf3NQ
	 LCSGwZbmxf8iigi2JcLB70zscRKUOOPfj7LRdX3gRJtBdOJyM1padGPc+KB45CrSx3Vd1
	 siskq3lHTrINViaki4LfVvgiDYf/LG8D2f/AQSFhrkHclLsxP2PFbuubIAkWIS7P4Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1y8NVjB34PyHWKL2vr54yws1Tup4C1XdntOkDoibOvc=;
	b=DU0mYNp/3iE4nvnkgzTKncUFsRYMjO1A9V9oN/gKD2i+MatOrpMp86wzcuaad8E3DN5M
	 bd4FRDjJsneMBDQ6sYEL2NPQk8WIYoy1LJ1pWHOIT1XBDWDxG+EQCanfeKKaNeZJTSto2
	 AysOO7WloRznb2hInveVbHPZ9tFTZ6+JJUVeMHwHqcCeOy+3oC+fRw04osAq1c10NzRFN
	 s3JKGkNjiIdph0uADx45ANTDTBFyDyvnl3TnAh66yQUJid3zJscIMT7+hMBDSCVPtiVYI
	 +qaPMF9v/bYJIqC+76jCe3Gi0Lr0ZF9pt+Q1dEtuAc974cYawqV4yJqclxwpVqmEGEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IS7YJq7a;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80F0606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B80F0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IS7YJq7a
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b7a488a0a4so1968617a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794602207; x=1795207007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1y8NVjB34PyHWKL2vr54yws1Tup4C1XdntOkDoibOvc=;
        b=IS7YJq7a4iBtGdKJN4xwUmtpG5AV3XcQbinTVTGHPX9cqnnQEbkcC36NMQa1V6q8S4
         PhD9IcmC78b+p1V9KBrtmtjgDofAom8B5sfj6ntxu9xZXt6MSCBbP+Ij5Q6VxAI7FnI8
         ScjpvPYC2fT89Oe8kKttkMAUNSUPD4LW8uXmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602207; x=1795207007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1y8NVjB34PyHWKL2vr54yws1Tup4C1XdntOkDoibOvc=;
        b=gHdjbooEKAXE4IsMTlIbC1tCV24tEKt7i8mDsMWgAUdGW7u5JIwj2jt9cMRYRXLmZv
         6XSVJEJzupouMHNDhAKUxHqF58pvMFyKw62CUyi+diNxaQbbSWs9RnUpMRd696M/2si8
         jJM6srWWe8F0wNOQlb5Xzj5qleRFWxtn9L4qODUm207ONRbHek06lJvhK6QM3EQM7hrJ
         hFNHpITabwJmLuC29WmZGHnfTOIK41TOKHyJD+qlucmiwfiup+JNok2dRksosPhV43YE
         NBGYS9FQe8jKOja6uEgrI5OUwjxpxRyQD2AbD0dh+DaAfVSaBgStEPNArrlzXD4Jx86M
         IMLQ==
X-Forwarded-Encrypted: i=1; AL+hErFEFJosSneKlFS9uryeAeVE7Q1S+M1EuRCXoLgjGVo/NSPO5yek9aggwl91gKA/I55n3CQvcaUuN3oIzYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z88S4iA/ONpQwrAw20yOOzSWsyD3J00/aMjkTBX+6DTVe8Y/AkI
	drnD1bEy+7kWeWDxDmLzirMFWVKrnDPadsusCW1+e4sRLQxW3A/z81vW2tYWxEPrcW2QDittRuE
	3vEaconBb
X-Gm-Gg: AYBFou3QFt01URIadMNwAnEG526nMO7DPm6B71dA/skp0wAarKN8mHBLQhMdVOvUKhV
	sKasYDHTbsOCqvdASRQKo04YNuqzKfHkgYQQMmnOe+W/e6+EhRRbNFzNgaV2uXLuYL76iJL3RDD
	9UNrU+El7V7DT9ufYTHxbQNkcIaWGSBSPOZDBS0Epx+Mmk7ftWx8Ng77oJOG5pI8VR0YpS3s4Q7
	9L3ceBRhKCe6L82mPYT5BdlBjOehaqovcRu2h7yKiMbFckdKAR/zV75cWb3tViAdFLIMQNOhzED
	lkvq1JO8MLMG0tGvauRi5LbRD9wkjC2jcN+hERFVaikgfyrLH9/ua4Gz3AGZIjnwCdMCYG6O/nc
	tYBoM1COEIy9GZDUkytkHnriRcN08eWqZbdf5PIkbTKuUa12pT535SzCOrxjMW2Ve1JB4Wj+t6/
	DKdENx2iXNjjRhMj21Ekc6TqIBQaNd01ZrFUHrFcZlyAOba/Dfr++E0ABdnX/e7uM59E7VRrp63
	JLwT+aPEeXiXdiUQldK6RwOgHxChGskfIy93Fo1KIzcyFuoUvUW/D7Ok01h+d/zIMaIU2VwsVLt
	Tm+K9aRFZO7v1USEwCZ4Ot/CHlWb3mWD0fm9JoSUtMlfFobMWAXSphtYnCWUmLiVLHHW
X-Received: by 2002:aa7:c9ca:0:b0:6b5:911a:f4be with SMTP id 4fb4d7f45d1cf-6b7c0bbe4e3mr2395578a12.13.1794602206963;
        Fri, 13 Nov 2026 12:36:46 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23d6ffbsm1377132a12.21.2026.11.13.12.36.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:36:44 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso19335575e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:36:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHNHmwoo6KTxufLPoEi34o6YPNntAJFFnbJbRefSKplEe3+YdA0ijc06mv/4ytTVn62fzJlaWjpdzdqYKI=@vger.kernel.org
X-Received: by 2002:a05:600d:82c6:b0:4a7:9006:b176 with SMTP id
 5b1f17b1804b1-4bb55c5f5f5mr89863295e9.7.1794602202883; Fri, 13 Nov 2026
 12:36:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113171540.446-1-_@tawheed.cc>
In-Reply-To: <20261113171540.446-1-_@tawheed.cc>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Nov 2026 12:36:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UXEDzjuBF8QK0MccAkCB35MUXEoAhzCFgViUr2xtpOMw@mail.gmail.com>
X-Gm-Features: AclHuK9vk6BRndli2ewuhNI9ERAXzJsRsPjpVZzz0vGOWMoLJS_4XyO0TtIZQ8Q
Message-ID: <CAD=FV=UXEDzjuBF8QK0MccAkCB35MUXEoAhzCFgViUr2xtpOMw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: Add LGD LP129WT112684 panel
To: Tawheed Makhdoomi <_@tawheed.cc>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 13, 2026 at 9:16=E2=80=AFAM Tawheed Makhdoomi <_@tawheed.cc> wr=
ote:
>
> Add the LG Display LP129WT112684 12.9" 2880x1920 eDP panel used in the
> Microsoft Surface Pro X (SQ1). Without this entry the panel is driven
> with the conservative fallback timings and probe hits the "Unknown
> panel" WARN.
>
> I don't have a datasheet for this panel, so the timings are a guess
> based on similar panels: delay_200_500_e200_d200 is what the other LGD
> 12.9" panel in the table (0x06b2, LP129WT232166) and most other LGD
> entries use. With this entry the panel is detected and the display comes
> up on every one of the 38 boots logged so far on my Surface Pro X (SQ1).
>
> EDID, read from /sys/class/drm/card1-eDP-1/edid:
>
> 00 ff ff ff ff ff ff 00 30 e4 55 05 a0 28 09 00
> 00 1c 01 04 a5 1b 12 78 03 ee 95 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 de 8a 40 78 b0 80 37 70 30 20
> 55 04 12 b7 10 00 00 19 00 00 00 fd 00 1e 3c 00
> 00 24 04 0a 48 14 14 14 14 00 00 00 00 fe 00 4c
> 47 44 5f 44 56 31 2e 30 5f 0a 20 20 00 00 00 fe
> 00 4c 50 31 32 39 57 54 31 31 32 36 38 34 00 41
>
>   Manufacturer: LGD
>   Model: 0x0555
>   Made in: 2018
>   Alphanumeric data strings: 'LGD_DV1.0_', 'LP129WT112684'
>   DTD 1: 2880x1920 60.000 Hz 3:2 (274 mm x 183 mm), pixel clock 355.50 MH=
z
>
> Signed-off-by: Tawheed Makhdoomi <_@tawheed.cc>
> ---
> Changes in v2:
> - Include the EDID in the commit message.
> - Say explicitly that the timings are a guess (no datasheet) and how
>   they were picked, as Doug asked.
> - v1: https://lore.kernel.org/r/20261112154444.417-1-_@tawheed.cc
>
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add LGD LP129WT112684 panel
      commit: fc72cd52fb284f3707fa36a68ea5a22543a51d71
