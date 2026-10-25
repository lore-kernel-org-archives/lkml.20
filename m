Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792943268;
	b=5V8yCvo7cJf3VTccjjOiCaSWoEeoB1yBHYJ8gdTBy+/hQAcMcSrDlPZ3SmnceOAkGpL/
	 4TDOOWPCJ62Uq0NhHt9Cuss3yTQ5qAGp8mD9lxMxsfzkSPBUdP89JR+sYi8wYoQd9Ihei
	 PkwjF+oxEjo/PcJ2WlzNq0Bz3DEHEeChYbKqCXxlmY144C8/HgBb1lKck2TtVWVH790P+
	 rWIxfOAKwM6CJAuLcaZpcVUJoSiTtBmGpddmq4egvg6O4VXRn3QJCkkvm04PPuqzSJ7lm
	 EWidpuSvQ+GhzPE8MFqf1o6nEJEwI4vw/5VuUzLCAoN0ep2OvqdaHM5azgXvDpbpHqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792943268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zwdYhrgTBkN/NLFVZoVld7wV6jKtYbxDqrCph2g3kLk=;
	b=ri8eAul12m9VyO06bh/Rcy0+HE1eyl9VE9QA4Vq9J4yweMX6zZZOpFBRqT8560FQjh+U
	 mQjhZ/ko3NTqk0IFvAchajgi0Z08sNVkPZd0sJM8aZDzSF+z6hLn9UecyNJTFI52AMykI
	 0QDjmH+6CIZ3ZpPWlNXe83Zx+oyV1e/iesEMrw5JUz1R4jCOVEFJ3ac4Hhd+ON0odu61E
	 ms0TNi9YuvPMa47ix9JYVGwkMUjralk64+jtF3dld9C6xZvSjOuq/XgsgMRiM23oPLxH5
	 z0GadsLZEaQyTHvNTpp8SLLh6fUqe0opZtge6sa3Q8VRPoIh+oaSkt1hAhmO3wAYHFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pUbFg6pC;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A16606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A16606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pUbFg6pC
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so7106755e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792943266; x=1793548066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwdYhrgTBkN/NLFVZoVld7wV6jKtYbxDqrCph2g3kLk=;
        b=pUbFg6pCeaGLafevfQtN6qmdyX9arxUMhbN7MrMT+KmOUc0yqNaZaZqrTvdbhxltW1
         YiIWCnqICn/yESHm+yxv6zRXYRRJ4ZJ55Hl17ROCI4sGpbCvcUG8KkM/53j8EIQiNy34
         iekkYyULvPJDYy7oX7w88rqciU8vhqkEZksTHuRUM1G2s4PNFjBKC3fN0qJ2e71eUWB8
         MFzR9wDubGV6WMtFFmSTCw8PnUnrDrath782dSwDI97f6cSFXRCXmvG2rAZMf80UpcZQ
         J+gEUQRgK68tJh6y/Is3DJBb7UK3e46KIhBqLj9ftdFQI+J/UqDVhpRIpiPcmzNLzEpP
         F58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792943266; x=1793548066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwdYhrgTBkN/NLFVZoVld7wV6jKtYbxDqrCph2g3kLk=;
        b=D2P0NVIBlQksGSecq1e8pQmocGwHOVt/IPfx7DUXdVD7UWxfy6eruwUwNrTaKSVIaJ
         ylTYcnJa3oMucGspwajTlwfoUtj0eUqM8QXYqP2lmuGkeR1SUmRMzStIB1zITOWkKWmB
         T8Kk9GQL0Zvsp+ICuUpZ+7Yu3sLe1swdJ+7AwsnlTXxoDh2tF55H28GCklWcmPbvnioE
         4QUxQE0PqLXw41n+cL4NStLs5bJ98QmS6l0Hi9zIGPUA2eJuWFJxTa4LQiCb5wzZzoZF
         DjtsWdMfAEeLi+K5/vxT/nGZiOtH9CpBz0XuA92KURl8CO9o+Ym6aQllQzG4JTYd1zTH
         jEiQ==
X-Forwarded-Encrypted: i=1; AKwUvByu6FZhxkGlqKEB2ennbqASG/JF4osEdgyaAOSVoGkH0e0aG8AtuCZGLnYcFqgcaXyAoHVBMdk0XN6ete4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKi5x1glt3jUnyZoHXkVnCjeRTJfwQdL4DJmMZlFU9PYvNH2scI
	ytWmEUk4jCQxBALsZDCjqLS0UvJQgOr4NQuoyh474nRFGD7jOuTvBYkX
X-Gm-Gg: AYBFou2cMtjV2nNt8smQCsdGlNse3JV7tpxmpIBZ6zEI1mEKn825+2NGRVvuYf8q5eT
	2HTFp0GS/hiK2kQy0nnbguYpkYXVtS1JGhkj0WYm/I+UCG+0flQa4G3nOdxYysZYpyLgFK9ahST
	VC0Wjr6gwY3hRxIP+O0/Ne/a268IdYrnQfewkJqzu1t8+s9d5hQYDR9UsvXhBgSbgWgAsq+25pm
	0gFjgLoToa4j2D4kK/I6n/OI0FBAzUvvjhFX7ijMCCaGxgu7XSWDFfsjOaAqXkZYIgmhhNhpluV
	xE4f4sMmjtEdAaLv2/c0zEouFjLIn+Zk1FhW2BgxM760OYt6bqgJMQCjSfrIhn2XB3VgclSU/P9
	VnW4Rz/3k88ckhaW0bKd8qiN33uSDtTzqCDOF5d51WMWH7V7eY84oPsG0Q6UHkYzelIOWqZ/Lhy
	O5q2Hx2c2oZkYe8vjr1ZLJny+VX9VKSIlt7og7wdu/zKoCN60YBfXtO74k8hhq0f4a0ICR/1Ezg
	rYe3K5THEdaGaDT7ECZIiNelBfKrS1+xr76MH6Qej/kiloli2wH9A4V1DINatkxhqoedHd6MyIy
	okbtpXSH/raY9w==
X-Received: by 2002:a05:600c:8183:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4a35ac99b77mr69181225e9.9.1792943265629;
        Sun, 25 Oct 2026 08:47:45 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a0e2sm161730455e9.13.2026.10.25.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:47:45 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	George Neacsu <geocausa@gmail.com>,
	"D. Manresa" <dmanresa@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: ipu-bridge: Add the Surface Pro 11 infrared illuminator
Date: Sun, 25 Oct 2026 15:47:41 +0000
Message-ID: <20261025154743.39801-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019162722.25587-5-lsa.uz@pm.me>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-5-lsa.uz@pm.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On Mon, Oct 19, 2026 at 04:28:11PM +0000, Sergey Lebedev wrote:
> +/* The infrared illuminator, strobed by the VD55G0's GPIO 1 */
> +static const u32 surface_pro_11_ir_gpios[] = { 1 };
> +
> +static const struct ipu_sensor_leds surface_pro_11_ir_leds = {
> +	.hid = "SMO55F0",
> +	.property = "st,leds",

[...]

> +	leds = ipu_bridge_get_leds(cfg);
> +	if (leds)
> +		sensor->dev_properties[d++] =
> +			PROPERTY_ENTRY_U32_ARRAY_LEN(leds->property, leds->gpios,
> +						     leds->nr_gpios);

The property entry keeps pointers to both its name and its values, and
here both point into the module image: the "st,leds" literal and the
static const surface_pro_11_ir_gpios[]. The bridge never unregisters its
software nodes, on purpose, so that a rebind can reuse them. After rmmod
ipu-bridge both pointers dangle, and a sensor driver probing again reads
freed memory for the property's name and value.

It is the same thing that a20c843c9bc4 ("media: ipu-bridge: Keep the
clock-noncontinuous property name out of rodata") fixed for
clock-noncontinuous, and that D. Manresa's v4 fixes for the
link-frequencies values and the lens-focus name:

https://lore.kernel.org/linux-media/20261010155626.2766298-1-dmanresa@gmail.com/

Following his v4, the name would go in struct ipu_property_names and the
GPIO numbers would be copied into struct ipu_sensor, so that nothing the
node points at lives in the module.

On the same hunk:

>  		sensor->vcm_ref[0] =
>  			SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
> -		sensor->dev_properties[3] =
> +		sensor->dev_properties[d++] =
>  			PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);

Manresa's v4 1/2 changes this same line to use names->lens_focus, so
whichever of the two lands second will need a rebase.

The Surface Pro 9 needs an entry too. Its VD55G0 drives the illuminator
from GPIO 1, as on your machine. Its DMI strings are:

  sys_vendor    "Microsoft Corporation"
  product_name  "Surface Pro 9"

I tested it with your driver by having it fall back to GPIO 1 when no
st,leds was found. In a dim room, 640x480 Y8 at exposure 600 and
analogue gain 8, the frame mean goes from 22.0 with led_mode off to 64.7
with it set to flash. There is more on how the series runs on the
Surface Pro 9 in my reply to the cover letter.

Fernando
