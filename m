Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9299E3A5433
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789613824; cv=none; b=QG4JHrZ7WD9zRLCGQc+XLcGvSxdIObMYn3bb0w1Hw/1mEZoV69tFYgEfszPOa31VMUedhro/eaMuJ3N7hc5oZoflF022BDa7Eq86k4YkfMeXh4iqLMSwnKxtANsIcyAdRvIPhfKSmlkPasXSLYzF4/MKKDH4k2+jPYQigkBz+xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789613824; c=relaxed/simple;
	bh=ipH7T5MTqFtkZS/40qQXwjPLC4KsojmU6Yc3EzVQjrA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dn56AGAmp+Gbuxe67q/VnC7jK36HutLSwynoWsYYCJ/6Tnzvo1rFrC3YyghqBHleOPoP3dTCKHMBhRa1c5XzpxxQq5Y+Lt5XJp+OQ91wSbvMbTbANrrB2y/TCl8YBix6hjdrD2CwRS//NGU589wpfOgKKN0EMXFUaLzmUHAndvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vx6YRo0N; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vx6YRo0N"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db18fe433fso2972045ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789613812; x=1790218612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mep4zkN4WAtJ2xw4HnArFK/4M5cNXhyijbcrj72ZXVk=;
        b=Vx6YRo0NVFTbkltby5aoFreY4gpycuEsVa1h1JaGg7ldBKcLKUIuzpBThkJBCnGL2T
         /nVqrDXgv9czQ+CorIyt6sfZBA+q7csmQc6TX7E330kBH1g/3/9r82siK9yJG2kVkY1S
         1FSmzbrikmEKz1W7yyH0g2UCTUe8m3UQRoU2ZBFxtMTaWVRr7R+yXPDc3DrlIMARBRSm
         8KhF1J2Ta0wlbKCLu5e1T5lCyYk/00iMDT+66aDTi+YXVtJwbsNfqX5iIOcPvj+VR3WJ
         QXzYDbM5w0p5+ZpmhajA22LTkO99c8D11P8hvKXsfTeEAyJ69qn4U25UYxwQ4xJyP6EZ
         07+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789613812; x=1790218612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mep4zkN4WAtJ2xw4HnArFK/4M5cNXhyijbcrj72ZXVk=;
        b=gF5oLuAYH1qBStAg4M3vIfX7l/lqSIZriBvjGpJ0l5Egt5YzqOGNCr/JUnWcuWUAjr
         8LseB/RslvkcSk3doC/uHJC0IRTTjwuMAqY8MZLv9PLzQmhNiH+BEe6i3vgnHue21zwb
         6ZF6xsM69T5PaPNC+pfrPRTA0ssSJ9nTkUvYO9dONDlXrWa0YnGfF+/xleA4NwyR1nJz
         dQ6DiYJprrex+hzbGso0fPIND30kr6vFZ5T+d+1giWGWSErjL5dtCz7zhL/WE/sDLrpb
         eCy12GzFnmSDX9jZL/c4KZiwsFB+RXMQW9+Nk+ELez8JH+GcRxvNCXbH9lBgsytg3mlq
         LAig==
X-Forwarded-Encrypted: i=1; AKwUvBwh7SMC8KQA+gBDgBgXT71+B/fxnaMFqoXfKmdawCRBdFWBGvjcOvGu8Z/3SjeAaPiek5nGbwAAS/c7A8A=@vger.kernel.org
X-Gm-Message-State: AFuF++mPAbii80oY9GqDv9aoy8wRM/GZ2CtxkA+IVIqZTvszp33WsnWm
	bzNbyX3SaZkP1EOK+i9hsRCJKQ+ErYzTD2+7/7eizTlffQOl9w75XA52
X-Gm-Gg: AYBFou21RbGlG7uHtJIpfhMKZ4ALLY+UxMn58FKKAL05y0zHYmUhGLNYt24r37U/eTW
	tflEpvdBr1Wlg8y8SsmRDqYBgO4sFZ6s61t+jAgSPkRn/fuvFnKxgQuFXeQ9iNEOEznEdw/DoDs
	iQdqrsMAuOWHfaDAmXYvJGbsQWF1bMCNG8F6XvdkznTKmFXE9eKcE10B/H88B5mYIFJnPfpGxvW
	xWq8UfsYhUZzBEcKvALK6YnD/ab70wzAq9KEOyPKpHRgsYiDp40axY8VzU8QTASPvkQSbXo8ksZ
	69w3sHW6cu5SAf+OovJf4pp/HyNeeC2rm0DSQ3xo4eeHBOVg5pl7GS/4Lxy4LtdPFGpb+fIHcKg
	sv5t69ihmuOCTfaQ7XuexS2x8bbVHvcDB0eJwCREakVJvSH9223F77rzaRqp25Q9DEqaUdbKtiQ
	/AyL+9E2uLdtWSiZa/7vRVFR1/7cebF4vL/d4N9GN0CvWZ4xezi2NHKsmGcvoqEAQ/f1f0TpoAg
	lPQPlD2v/MdI6ck/D5cggG0jFQdlqJUOgj1AOctZYntJEydka2O9JiNF/WFok/06cqM5akNutVl
	74iBsu7zBBg=
X-Received: by 2002:a17:903:3848:b0:2dd:76b1:34f0 with SMTP id d9443c01a7336-2dd8e5244a5mr107821025ad.11.1789613811428;
        Wed, 16 Sep 2026 19:56:51 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89eb896bsm19014945ad.43.2026.09.16.19.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:56:51 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wig Cheng <onlywig@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: LiangCheng Wang <zaq14760@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel
Date: Thu, 17 Sep 2026 10:56:44 +0800
Message-Id: <20260917025644.1262504-1-zaq14760@gmail.com>
In-Reply-To: <f4c6feab-b1ec-48df-81a5-888444b243a3@suse.de>
References: <20260529-bar-v3-0-5c2ac1c751ee@gmail.com> <20260529-bar-v3-2-5c2ac1c751ee@gmail.com> <2bfb73e6-dca3-4d93-af04-3c644929dd19@ti.com> <20260616083921.4066690-1-zaq14760@gmail.com> <423c3dca-9589-488d-8462-c3d51f05ee4a@ti.com> <20260617020926.114947-1-zaq14760@gmail.com> <8fcfab0f-6b98-478b-be4a-c5b810fb3524@ti.com> <20260731035705.3198816-1-zaq14760@gmail.com> <20260916082924.956116-1-zaq14760@gmail.com> <0a13ccb8-8817-4223-a4a2-0de594ac8c71@suse.de> <20260916094453.1062125-1-zaq14760@gmail.com> <f4c6feab-b1ec-48df-81a5-888444b243a3@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Thomas,

> There's also the ssd130x driver under solomon/ how does it related to
> the ssd16xx? Is that similar as well?

They share the vendor, but not much else as far as I can tell - Javier
will know ssd130x far better than I do.

It is an OLED driver over regmap, while ssd16xx is e-paper over raw SPI
with a BUSY handshake, RAM address windows and waveform LUTs.  The
register maps do not overlap, so I doubt there is much the two could
share.

Its shape does look like a good model though - one driver covering three
sub-families through a variant table.  And if you would prefer ssd16xx to
sit in drivers/gpu/drm/solomon/ next to it, that is fine by me.

> If the ssd16xx does not make progress, we could also try to merge your
> code as ssd16xx and Devarsh would then add support for additional ICs on
> top.

Thank you - I would be glad to help that way if it comes to it.

Devarsh, it is your series though, so please say if you would rather carry
it yourself; I would only pick it up with your agreement.

I should also be honest about what I could offer: only what the SSD1677
and the PIXPAPER 4.26m need, arranged so that further controllers can be
added on top.  This panel is the only SSD16xx hardware I have, so I could
not implement or test the others.  If that is too small a starting point,
I quite understand.

Regards,
LiangCheng
