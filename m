Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973683;
	b=tOzG0MmrbO6gn0VT/rRuIg9Zx4I6KuWuw+39bvSx2Q2SM+5h9P/aOCC6V8aXZ2+9bm6J
	 gIJWLdebfmZjDmWas0XC03f4oBrhL7mRI/NGkukIPKRDIujdglclIsGZiMjIyg6JK/Xma
	 xz+4T1/oPIo0f0ritauA63wcnhwvYk71qyQWsvnb9sySTGz0xAyMqkNA6/xCqPDXQ653w
	 OEgFoinqCLdwRyUsGJZ09Z5zy3DtDh5evbE63D+2hNsrh89wqsHoZureTdzLZRoxCBBIo
	 gbzqg36qYHKqevvUTX17S1VPtm0ikpKtMLPCGR6wMPhpqKdHZhh3BnWe6kPJBsA0TKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973683;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=suJE+Tcegs16WvO37Z4zSvbkj7hLvCgWPRZtk9pW9n4=;
	b=24aHO83IkcP0hwL1nqepMR4a5hAYmspApRhMrF4pTcH4sRj8gYcztGZc/6bWvQM1SgYk
	 H1sIWHvK8FcGRu40iZl1z8adupexCEHnRJKm0f1SdyxNX1lQC53Tp50x22y7pv+XZ0RXZ
	 lonS/an+5UWR6hUfBGf5d1SfUUiP+pLWer2WlBJJx5HR9I9okjdeu5ihfhqprolEAZ7Og
	 fqXSuDteJVSD8A17pp0252+4CRvX/opvCr5r78e5UXBO5CxVwEOVYEOQUhtO41U4ME6EQ
	 l0gCfCVcz6jBnLjjLXZW4M83mhaMrNyd6KBAxla9yGHGohwr0D9Go9GkdHV+6s7IVzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="DVcuoz/a";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF08606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DF08606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DVcuoz/a
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9CECD4E41408;
	Fri,  6 Nov 2026 14:01:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71ABA5FFBC;
	Fri,  6 Nov 2026 14:01:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84CE1103291F5;
	Fri,  6 Nov 2026 15:01:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793973677; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=suJE+Tcegs16WvO37Z4zSvbkj7hLvCgWPRZtk9pW9n4=;
	b=DVcuoz/aFbJWsqWDTiS9dYncD0SwfcuOcjba86PZT14HY6wT496VVu2OhHfsFQJMfuvPyE
	KB/TRvx+LhT5cd403cMnfMtBb5oVr8hPCVV1QKaASnM6YUHiHJYwtp2xg7NPZXcmySQApH
	j/FmD4aoMEX8csVOU1ipMtWimWrKh8iiwZgEA3b9eZolmuu2AVpBziaz3NNcDnrDseI5MS
	3K3UPd1kFuovqqD9WTuLtZU0p7LrRNAz+ur7xYbYqHJDprgTn2l8+CY3Anv/6bRM++vvF0
	prn71cWE93cdG3wyN+0wvAGZ2m55tHe23ZHAyhinlYaaTQVLFsM1ijzfBSgfrg==
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
Date: Fri, 06 Nov 2026 15:01:12 +0100
Message-Id: <DMO6LBTEZZ15.3T8QULAA5SSU@bootlin.com>
Subject: Re: [PATCH v4 3/3] drm/vc4: dsi: remove unnecessary intermediate
 pointer computation
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
References: <20261105-drm-fix-of_get_bridge-build-regression-v4-0-906ca343ac1b@bootlin.com> <20261105-drm-fix-of_get_bridge-build-regression-v4-3-906ca343ac1b@bootlin.com> <05396e07-1c4a-4942-82dd-a0154fd6316d@igalia.com>
In-Reply-To: <05396e07-1c4a-4942-82dd-a0154fd6316d@igalia.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Ma=C3=ADra,

On Fri Nov 6, 2026 at 12:27 AM CET, Ma=C3=ADra Canal wrote:
> Hi Luca,
>
> On 05/11/26 07:32, Luca Ceresoli wrote:
>> This function computes the 'dsi' pointer from the passed 'bridge' pointe=
r,
>> but uses 'dsi' just to obtain the same 'bridge' pointer. Remove the
>> unnecessary pointer dance, just use the passed 'bridge' pointer.
>>
>> Suggested-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>
>> ---
>>
>> New patch in v4
>> ---
>>   drivers/gpu/drm/vc4/vc4_dsi.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi=
.c
>> index 581b54e04ce4..ec008f766dd5 100644
>> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
>> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
>> @@ -1159,10 +1159,7 @@ static int vc4_dsi_bridge_attach(struct drm_bridg=
e *bridge,
>>   				 struct drm_encoder *encoder,
>>   				 enum drm_bridge_attach_flags flags)
>>   {
>> -	struct vc4_dsi *dsi =3D bridge_to_vc4_dsi(bridge);
>> -
>> -	return drm_bridge_attach(encoder, dsi->bridge.next_bridge,
>> -				 &dsi->bridge, flags);
>> +	return drm_bridge_attach(encoder, bridge->next_bridge, bridge, flags);
>
> I wonder if we should turn this into a DRM helper... I noticed that
> other drivers follow this exact same pattern. The following files have
> such pattern: vs_bridge.c, meson_encoder_hdmi.c, rzg2l_mipi_dsi.c, etc.

Good point. I also think this could be factored out to a common
function. However for the time being I haven't done any steps in that
direction because I'm soon going to propose a .get_next_bridge bridge func
in [0], and I suspect that addition could further improve bridge attach
management. So I'm waiting until the get_next_bridge work is settled before
doing further steps.

> Anyway, just a suggestion. I already pushed the series to drm-misc-next.

Thanks!

[0] https://lore.kernel.org/lkml/20261001-drm-bridge-hotplug-v2-17-8e34986d=
cb68@bootlin.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
