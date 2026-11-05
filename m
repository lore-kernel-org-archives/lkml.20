Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874513;
	b=k2Y0mQ1tpcrjuvmpJZKKr/R3vZxt4wpWBO/h+4V8ts/I0sbmRHm2KUqP5zqdUgjupKfu
	 o8rHFgSVd/YNzeHgwxUFnxI+7BWK5IZ0m4FtbTBiOKIgcMvBf8h6Vz4jidJCbS3Jt1LBI
	 JYqXQpJqK4lwctY4H2ux8S+d5p2KYjiIzED/wkCj86X/Tw4FnDTpTJq5dl56+L6CX1dWQ
	 7/hwdXE9vCpShfeQ4zVT5ulHK4n+8zYs5U4lTxdPNrbvuKaoFJxcmbbF/eh3FhnoNb9xb
	 Y2f/favVjVP1MT7kkP2g6fP2ni6/Xg2Fa2rDb/u29UJESlIzgEVWBrX0rmopYPwAv8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874513;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=iBXidrA/iwANgc9GxBZD7IWoRVbP9RFkG8DphNs3/R8=;
	b=4g60C81QwtlKyVv79nHJnvWZ/Nt9mz7ztJvCZALwqWwAa3doFQSwp0wl8LjZ8sptmxN2
	 ocMdQW91vU85OXm0LDfKUvZ1x921zrH1hXHXqdgwDwF9SwIEJ2h41oOKz+Gg/3/Mcza+z
	 w1MTir6BZvviBbywUwiUzNIAu5uSqliT3U9tub4MHO36efmt0EgWpNCfPoUWpieS06+5U
	 TNFR3Ck8pqOuXJgik2F8SfO3nWx2svuBr1Cw9bWT1RkO6bY6+arHT3+qV4qiwmwM7y84C
	 zb1XBwx04pVxAUIBxxQ8KMHtIwcM1xWGsmSewSAOmQy8V/TZPXJb1N39HaWNA5T4PUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=saHhjVh3;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8522B606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8522B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=saHhjVh3
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 73726C69156;
	Thu,  5 Nov 2026 10:28:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 461115FF85;
	Thu,  5 Nov 2026 10:28:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB50B10329267;
	Thu,  5 Nov 2026 11:28:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793874503; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iBXidrA/iwANgc9GxBZD7IWoRVbP9RFkG8DphNs3/R8=;
	b=saHhjVh34pVLCuK+4isPs5ULNhBVZ9Yw+GBhtCs1cRWzH3EQmPBD3oXJQRpVGf/gwK8W16
	Rz04AOi5wKf4IoW3zPDuKMrKIP+lIL/4Tsji/U4k3cRwa58wCEFktydicARvJcGxFbr+kP
	/Q/p555FaFrKbDdAbrzt9M1QF9RaDYuGsajFfC8sXWhdrdJ43t9g98zqO6zZFflwr0EZZe
	LEK097ZDuR8aSsFkzpfaCZCItks8cfvsu/R3/eOhTvb+zpqyaYb1uCQwbY02ZoTrrV98w+
	SHIi5LPYK62E1py4LgcSRYHD6r5rpU+Bx0fnlnV8W88unITRNB6Y+0SQOQkqzw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 11:28:16 +0100
Message-Id: <DMN7FQV2OH2W.1363T5O792FIR@bootlin.com>
Subject: Re: [PATCH v3 2/3] drm/vc4: dsi: stop using deprecated
 drmm_of_get_bridge()
Cc: "Paul Cercueil" <paul.cercueil@bootlin.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maxime Ripard" <mripard@kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "Raspberry Pi Kernel
 Maintenance" <kernel-list@raspberrypi.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261013-drm-fix-of_get_bridge-build-regression-v3-0-0b4c0b65be82@bootlin.com> <20261013-drm-fix-of_get_bridge-build-regression-v3-2-0b4c0b65be82@bootlin.com> <e8321403-43dd-4ca2-8b20-117b9c18dcc6@igalia.com>
In-Reply-To: <e8321403-43dd-4ca2-8b20-117b9c18dcc6@igalia.com>
X-Last-TLS-Session-Version: TLSv1.3

On Sat Oct 24, 2026 at 2:56 PM CEST, Ma=C3=ADra Canal wrote:
> Hi Luca,
>
> On 13/10/26 12:23, Luca Ceresoli wrote:
>> drmm_of_get_bridge() is deprecated, switch to
>> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() retu=
rns
>> a refcounted bridge, ensure it is put by using bridge.next_bridge.
>>
>> drm_panel.h becomes unused, drop the include.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

...

>> @@ -1165,7 +1163,7 @@ static int vc4_dsi_bridge_attach(struct drm_bridge=
 *bridge,
>>   	struct vc4_dsi *dsi =3D bridge_to_vc4_dsi(bridge);
>
> I believe you can delete *dsi
>
>>
>>   	/* Attach the panel or bridge to the dsi bridge */
>> -	return drm_bridge_attach(encoder, dsi->out_bridge,
>> +	return drm_bridge_attach(encoder, dsi->bridge.next_bridge,
>
> and use drm_bridge_attach(encoder, bridge->next_bridge, bridge, flags).

Good point. I did this in v4 as a new patch, to keep this one patch
readable.

> Also, I believe the comment is now redundant as panels are just bridges.

Indeed, done.

> Apart from these nits, could you also address Sashiko's feedback?

Sure, fixed in v4.

Thanks for reviewing!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
