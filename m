Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D6233F368
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266429; cv=none; b=YEEKY8gGqlMDE3uVov+CMrgEYNuBH7WOyKQt8a13uKwtPhrPpxcjGtoQVwQ3tb2tCaslXuSZELayr1g3MnNnXR0SKfEBO5N2QOUsTMn3TCUwb0gbTtQ0AMg2Nva8Hjag1h9ZaGPFTzG+nvyDjnfT1PaEFP48ufUsE/OgXMuNa3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266429; c=relaxed/simple;
	bh=WjhQexwMEg+3mWM/K5rNCf/MvbYFnfRqHXlB7BsO/Cc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=JznnrY1CDNXMQsXkQ2iRFjkeMI4uYRkL0tq/7dmj4Qk9xjsgYTVNNR7xiMytBtX2nCB8bLwaBNfs5mk2A4PfTQVB+fZQ7ewXsjSiIGIFmOJ+XTFw2tXnjm3GbaPaRFixOYsjV7oVxzvXffZU4FbKWkS9FCTQss9qneHeIk7gYZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ljr1iVhU; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ljr1iVhU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5255A1A18F8;
	Tue,  1 Sep 2026 12:40:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22A856053C;
	Tue,  1 Sep 2026 12:40:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BEF011C7928F;
	Tue,  1 Sep 2026 14:40:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788266418; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5TzaynEPVpDXi7H5If5KN/sMF3w90yEcwD8RfC/Cc4k=;
	b=ljr1iVhUs0RMbe+vwBlAK7NV0vyhd3sbOOfVJMdmjzT/WHileKXYteRjZN8LHaU3uBJWAe
	SAmmgamPXvClqFlWxnKFvu5iTeQ0DPb74IN5UZNMh/LobROad5CQRvE0U8r1SfFdE0+JCr
	vmVDs+kamyF8ZaQ4wuIKmZo9A+NCkXLX98YLRamHchDzgiB+p/jpgB/kiskE2MlNfgynp1
	pj1qkWkYh04CcFRYVQHRelLLGmJZKQSBByXj5AQBoP26cXCd1OzO6RmIijyN9jVGHH9h2/
	v3yubndpnuZ0h8zf+qMN3WCOZPav1cNTqrZN6wJmHxz8S3tZmbTJ691FFZMNoA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 14:40:10 +0200
Message-Id: <DL3ZJBN3TALE.XBW7KL51XGBO@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 04/11] drm/panel: merge the drm_kms_helper module into
 the drm module
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Linus Walleij" <linusw@kernel.org>, "Inki Dae"
 <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>,
 "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <DKR7VTBLRBQW.2LLJMDO74KXNO@bootlin.com>
 <20260824-cuddly-aardwark-of-reward-0d93d4@houat>
 <DKX8KDDOTPM7.3OS616IO3E4UA@bootlin.com> <apBGjqt9GI5egQW6@houat>
In-Reply-To: <apBGjqt9GI5egQW6@houat>
X-Last-TLS-Session-Version: TLSv1.3

Hi Maxime,

On Thu Aug 27, 2026 at 4:17 PM CEST, Maxime Ripard wrote:
> On Mon, Aug 24, 2026 at 04:16:02PM +0200, Luca Ceresoli wrote:
>> Hi Maxime,
>>
>> On Mon Aug 24, 2026 at 9:48 AM CEST, Maxime Ripard wrote:
>> > On Mon, Aug 17, 2026 at 02:27:58PM +0200, Luca Ceresoli wrote:
>> >> On Mon Aug 17, 2026 at 10:31 AM CEST, Maxime Ripard wrote:
>> >> > On Fri, Aug 14, 2026 at 04:05:52PM +0200, Luca Ceresoli wrote:
>> >> >> Work is in progress to make every drm_panel automatically create a
>> >> >> panel_bridge [0][1].
>> >> >>
>> >> >> This requires the panel code to call the drm_panel_bridge APIs. Ho=
wever
>> >> >> this would create a circular dependency loop on modular builds:
>> >> >>
>> >> >> __devm_drm_panel_alloc() [drm]
>> >> >>    -> drm_panel_bridge_add() [drm_kms_helper]
>> >> >>       -> drm_bridge.c APIs [drm]
>> >> >>
>> >> >> Moving just the panel_brige.o file from [drm_kms_helper] to [drm] =
does not
>> >> >> work because the panel bridge code uses the drm_atomic_helper and
>> >> >> drm_probe_helper which add further dependencies on symbols in the
>> >> >> [drm_kms_helper] module.
>> >> >>
>> >> >> So take a simple approach, and move the entire drm_kms_helper into=
 the
>> >> >> [drm] module.
>> >> >>
>> >> >> Link: https://lore.kernel.org/all/emuj2innmp6zmzd7pyakqzjqpdzhly6q=
fhakya3ydwmd63pl26@5jwxaidpikjw/ [0]
>> >> >> Link: https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-=
8-9d6f2c9c3058@bootlin.com/ [1]
>> >> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> >> >
>> >> > So, that's not an option. However, why do we need drm_panel_bridge_=
add()
>> >> > after this work is done? If we want to create a bridge for every pa=
nel,
>> >> > then the bridge implementation can live in drm_panel.c, which is pa=
rt of
>> >> > the drm module.
>> >> >
>> >> > And we'd essentially move drm_panel_bridge into drm_panel.c, and ma=
ke it
>> >> > private.
>> >>
>> >> Yes in theory, but the panel_bridge code uses other parts of the
>> >> drm_kms_helper module: drm_atomic_helper and drm_probe_helper, maybe =
more,
>> >> so we'd have to move them into the drm module too.
>> >
>> > Ah, right. What would happen if we were doing it the other way around
>> > then? Move drm_panel out of the main drm module?
>>
>> Into the drm_kms_helper module?
>>
>> I had a look and did some experiments and I found at least one user in t=
he drm
>> module calling a drm_panel API, and guess who:
>>
>>  drm_of_find_panel_or_bridge() (in drm_of.c, drm module)
>>     -> calls of_drm_find_panel (in drm_panel.c, drm_kms_helper module)
>>
>> Based on our discussion after patch 3, I'm not sure
>> drm_of_find_panel_or_bridge() will disappear soon. If it doesn't, I gues=
s
>> we can try to move drm_of_find_panel_or_bridge() into bridge/panel.c whi=
ch
>> is in the drm_kms_helper module (and from drm_of.h info
>> drm_bridge.h?). That however might trigger build failures for drivers wh=
ich
>> currently don't select DRM_KMS_HELPER and which would have to select it.
>>
>> I'll give it a try, and if I see major drawbacks I will get back to movi=
ng
>> all the drm_kms_helper code into the main drm module.
>
> No, I meant into its own module.

Looks like a good idea indeed, making the design more modular and
dependencies cleaner.

> Do we have any dependency from the main
> drm module into drm_panel?

As far as I can see there is only the one mentioned above:

  drm_of_find_panel_or_bridge() (in drm_of.c, drm module)
     -> calls of_drm_find_panel (in drm_panel.c, would-be the new drm_panel=
 module)

And while drm_of_find_panel_or_bridge() is possibly going to disappear at
the end of my series, moving drm_panel.c to its own module would make the
series non-build-bisectable, which would be very annoying.

However there seem to be no calls from the drm module to
drm_of_find_panel_or_bridge(), so we could move it out as well. What about
a series doing, in this order:

 - move drm_of_find_panel_or_bridge() from the drm module to the
   drm_kms_helper module
 - move drm_panel.c to a new drm_panel module
 - Main change: embed a drm_bridge into every panel
 - convert drivers to stop using the panel_bridge, hopefully removing all
   calls to drm_of_find_panel_or_bridge()
 - remove drm_of_find_panel_or_bridge()

Looks good?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
