Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E5451CF77
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064480; cv=none; b=PBXLjx8nF3wNDxxfiZxVzVFXVoDoEBtenvQwUQQWOyTaxxhx3kh61mEy1+f3y1MlOziY80i86KsnTnFBeByxM2fENuOObl84Ouhxndkc2FUe1Q3qkz+NyBqMWOr/rQoEpjKuEPbv8lyTOykF92nnfMyJKUciEUhPA8s3gybTDL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064480; c=relaxed/simple;
	bh=5bQW3udzyVwKMKAjijUp7Ri2MPTSNPKRZoWjBmYOBjI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=dv/soUEfs/TXNzDgo7AxQazerpomkrQj5unVN/n57cIShV+FeoSu728zJ7nqmbrVn23/Kqzn6Q8uKmeM1/Cj52nbRNpU0VPg+Bnpezy7un05Ke2wA/QmTSnLsOJqb3sQCx4MS4pX9MQISyybeWannSdPvRAYmapVd23yA47G9rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2K17D360; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2K17D360"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EED494E4124D;
	Thu, 15 Oct 2026 11:41:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B149660360;
	Thu, 15 Oct 2026 11:41:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDDC810328B20;
	Thu, 15 Oct 2026 13:40:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792064464; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2CwmQ38XBCXNxkYV8PsEb5OrSl1y/IZojDr7oXcVPP4=;
	b=2K17D360fRTzckjSdYiEX7unfIIKcGugNpe3tQ/utyUPrsi28ZEdyCk1xUWn3VZsPxT1M0
	l7qnjqlTFIgPlvGtCr++eUpOfLgGICViGjKerFzhCBbvp6tN/V+y0z0Dluw3zX1uyCKgkS
	vwWxmTVKg17VnlaHaFM5E8o9hoao/aGd+RIbKKwcDcyLbI3l9lsrc4lfb39eVqaj7SQEIE
	FGf/d0v46xRSIMMpD6N7ZJxvTh8hebJWC5z/h7XQ6Mu2QcXyN3LnNpmEOv1xuB0TcyScvV
	kcsafHNEVVK5zFMmhTic1BLjDf80EGujhR8abDbN8F9+kYbprcCFLDZlNOttGw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 13:40:51 +0200
Message-Id: <DM5DTVXB3ONJ.1HC2E6FMC5TX5@bootlin.com>
Cc: "Paul Cercueil" <paul.cercueil@bootlin.com>, "Nishanth Menon"
 <nm@ti.com>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Javier Martinez Canillas" <javierm@redhat.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Phong LE" <ple@baylibre.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Julien
 Chauveau" <chauveau.julien@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 1/3] drm/bridge: ite-it66121: improve reading IDs and
 log on errors
X-Mailer: aerc 0.22.0
References: <20261015-drm-ite-it66121-log-probe-errors-v1-0-7fd6994e0be0@bootlin.com> <20261015-drm-ite-it66121-log-probe-errors-v1-1-7fd6994e0be0@bootlin.com> <xlv1y0bzfdf3.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
In-Reply-To: <xlv1y0bzfdf3.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Last-TLS-Session-Version: TLSv1.3

Hello Javier,

On Thu Oct 15, 2026 at 12:47 PM CEST, Javier Martinez Canillas wrote:
> Luca Ceresoli <luca.ceresoli@bootlin.com> writes:
>
> Hello Luca,
>
>> it66121_probe() calls regmap_read() four times to read the vendor and
>> device ID registers, without error checking. This leads to silently
>> continuing using invalid ID values when any of the reads fail (which has
>> happened and is being fixed [0]).
>>
>> Adding error checking on all 4 regmap_read()s would be annoying, so swit=
ch
>> to regmap_bulk_read().
>>
>> In turn a bulk read requires a differen data structure, so take that as =
an
>> opportunity to make the vendor/device ID computation more explicit.
>>
>> [0] https://lore.kernel.org/r/20261015-drm-ite-it66121-fix-reset-v1-1-47=
3038e06abc@bootlin.com
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  drivers/gpu/drm/bridge/ite-it66121.c | 30 +++++++++++++++++++++--------=
-
>>  1 file changed, 21 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/brid=
ge/ite-it66121.c
>> index 692a85e1e2e8..9b43456c67a1 100644
>> --- a/drivers/gpu/drm/bridge/ite-it66121.c
>> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
>> @@ -1580,7 +1580,16 @@ static const struct it66121_chip_info it66xx_chip=
_info[] =3D {
>>
>>  static int it66121_probe(struct i2c_client *client)
>>  {
>> -	u32 revision_id, vendor_ids[2] =3D { 0 }, device_ids[2] =3D { 0 };
>> +	union {
>> +		__u8 byte[4];
>> +		struct {
>> +			__u16 vendor;
>> +			__u16 device;
>> +		};
>> +	} chip_id_regs;
>> +	BUILD_BUG_ON(sizeof(chip_id_regs) !=3D 4);
>
> I think that would be simpler and easier to read if you just use a
> u8 chip_id_regs[4] variable, instead of the union.

OK, will do, together with the change to get_unaligned_le16() suggested
below.

>> +	u16 vendor_id, device_id;
>> +	u32 revision_id;
>>  	struct device_node *ep;
>>  	int ret, i;
>>  	struct it66121_ctx *ctx;
>> @@ -1644,19 +1653,22 @@ static int it66121_probe(struct i2c_client *clie=
nt)
>>  	if (IS_ERR(ctx->regmap))
>>  		return PTR_ERR(ctx->regmap);
>>
>> -	regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
>> -	regmap_read(ctx->regmap, IT66121_VENDOR_ID1_REG, &vendor_ids[1]);
>> -	regmap_read(ctx->regmap, IT66121_DEVICE_ID0_REG, &device_ids[0]);
>> -	regmap_read(ctx->regmap, IT66121_DEVICE_ID1_REG, &device_ids[1]);
>
> You should probably drop these defines if will no longer be used. Instead=
,
> maybe you could define a IT66121_CHIP_ID_REGS_START or something like tha=
t?
>
> Although maybe is good to keep them as documentation? Not sure about this=
.

I'd rather keep them for documentation if you don't mind.

>> +	ret =3D regmap_bulk_read(ctx->regmap, IT66121_VENDOR_ID0_REG,
>> +			       &chip_id_regs, sizeof(chip_id_regs));
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Error reading device IDs\n");
>>
>>  	/* Revision is shared with DEVICE_ID1 */
>> -	revision_id =3D FIELD_GET(IT66121_REVISION_MASK, device_ids[1]);
>> -	device_ids[1] &=3D IT66121_DEVICE_ID1_MASK;
>> +	revision_id =3D FIELD_GET(IT66121_REVISION_MASK, chip_id_regs.byte[3])=
;
>> +	chip_id_regs.byte[3] &=3D IT66121_DEVICE_ID1_MASK;
>> +
>> +	vendor_id =3D le16_to_cpu(chip_id_regs.vendor);
>> +	device_id =3D le16_to_cpu(chip_id_regs.device);
>>
>
> And here you could use get_unaligned_le16() instead, to not have to cast
> when using just a u8 array.
>
>>  	for (i =3D 0; i < ARRAY_SIZE(it66xx_chip_info); i++) {
>>  		chip_info =3D &it66xx_chip_info[i];
>> -		if ((vendor_ids[1] << 8 | vendor_ids[0]) =3D=3D chip_info->vid &&
>> -		    (device_ids[1] << 8 | device_ids[0]) =3D=3D chip_info->pid) {
>> +		if (vendor_id =3D=3D chip_info->vid &&
>> +		    device_id =3D=3D chip_info->pid) {
>
> I wonder if this could be done in a separate patch.
>
> That is, keep the << 8 | for this patch and just do the regmap_read() to
> regmap_bulk_read() conversion. Then as a separate patch you could replace
> it by converting with le16_to_cpu() or get_unaligned_le16().

Sure, will do. I felt like this patch shoudl probably have been split, but
was unsure how.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
