Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740268;
	b=NUewl+MvmDtso4PXVZwkUpyIat6ES9z+3MyfWncsUdIP0uxgVkQ1duNC59RGLC+J47EO
	 TSUk5635PEG0rc1szbDyDnvoTTj/pDnSziwjnOsAHPgq0KTRmXMznQ4qAdUQsYV0E4bnx
	 N6yUow1oVK4J6CU02DfOaMbAnjD0smK3QwDAw6RxIjbPnS/HFsf53ChPrpBfLM1HECvMn
	 /ALV5LDqFY/Ud/R00CnOlrpvbeFj4imbcWPewzoxHa8MeeaMJGzB6RfiD0IuwqKDWZ8+1
	 jjczd96VeoxHDdfq/R7Gg5DTlTHB0hDPdFGaLPx43SwIIMU/PW7GheIKAkd3UNNu4yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740268;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Content-Type:
	 Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 Content-Transfer-Encoding:X-Mailer:References:In-Reply-To:
	 X-Last-TLS-Session-Version;
	bh=AigCNMwxBJZuWvXglsaLwBUjZkmiCAeb490K3Kjidoc=;
	b=TKQdAjdoijFWosUiTdCk1DryyYVrC1GHiph6M9GrU87yfjMG1Hvgbb0D/EthskE5BD0c
	 WEOYb1HbGvk3iXLSJMq2Mot+et/74cmZL0gXyzYJxqWqpQFqx1vEc63IY+31W9BEqwT/1
	 gFfd6X5SaqomSK1fJH9FhQ+3OG84QU/cutAuial/B7P6zKdXb4hJI7R9yLjql6AwT528H
	 lKmkCf/3em8zbvvWiYoqdVT3KrM6Kb0llJ0GtyC3/ZhME7Jynn+g/Dk6+i7TJkk5/B70+
	 NZT8Q6dVqFR6a7LuXfyEeFbenJFeHucgW8Mvx+3312gkYqX5rc0BTLwMoeK+E9NgY7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hstKxnHJ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8C0606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA8C0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hstKxnHJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2C48F1A12EC
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:24:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED04260398;
	Fri, 23 Oct 2026 07:24:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A25F710328EBA;
	Fri, 23 Oct 2026 09:24:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792740258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AigCNMwxBJZuWvXglsaLwBUjZkmiCAeb490K3Kjidoc=;
	b=hstKxnHJfU+yB1qlSwWtc8iJkFJc1gclOJhQ6YgKSwGdrFpxR36ZSzouF0DrW9ETDSuv9R
	SY5gnhS6niaUfwWG29jVin6UCc3oQmWxgsDZ3buofay5/ZsRTaUIMAQOd7DXm+FTgieU4S
	cOit56+rTh9my65f2a+vHKxRPPdgntmWaO3IFlUsJ9SYU5iRTeTfFV/mS3TRMfCOx1C03M
	yDTLXKh+Y06/gbDKyiao09IMx8v11ZTwdzexNojA3x2JnFyMUHVmKIcsZy3PDSWC4Yp1m4
	9zAYwEHUNecZT9mj9xpVr+aYb3jRDVVpuvijlXqnYdAB/8LVZ8OVODZii+FHPw==
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 09:24:13 +0200
Message-Id: <DMC1DQX9EJ3P.4VWHJ27R9JLG@bootlin.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 5/5] regulator: Add TI LM51772 support
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Mark Brown" <broonie@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
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
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-5-25f0ffbffa8d@bootlin.com>
 <atpJCnOMOlLSNvqL@sirena.org.uk>
In-Reply-To: <atpJCnOMOlLSNvqL@sirena.org.uk>
X-Last-TLS-Session-Version: TLSv1.3

Hi Mark,

On Thu Oct 22, 2026 at 7:34 PM CEST, Mark Brown wrote:
> On Wed, Oct 21, 2026 at 12:27:46PM +0200, Paul Louvel wrote:
>
>> +static int lm51772_regulator_set_voltage_sel(struct regulator_dev *rdev=
, unsigned int selector)
>> +{
>> +	const struct lm51772_priv *priv =3D rdev_get_drvdata(rdev);
>> +	int ret;
>
>> +	/*
>> +	 * The LM51772 uses hardcoded OVP thresholds. Update the OVP threshold
>> +	 * to match the new voltage.
>> +	 */
>> +	if (priv->ovp_thres) {
>> +		ret =3D regulator_list_voltage_pickable_linear_range(rdev, selector);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		ret =3D lm51772_set_ov(rdev, ret + priv->ovp_thres);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return regulator_set_voltage_sel_pickable_regmap(rdev, selector);
>
> If the voltage is being lowered this will lower the threashold prior to
> lowering the voltage which could cause the protection to flag.  I guess
> we need to look to see if the voltage is being raised or lowered and do
> the change before or after as appropriate.
>

If new_uV > old_uV, and we set ovp after or before, that doesn't matter, be=
cause
the voltage only ramp up without getting a chance to be > ovp.
If new_uV < old_uV, if we set ovp before, the protection will flag, and if =
we
set ovp after, the protection might still flag because of the slew rate del=
ay
(or put another way, there is no guarantee that the voltage will be low eno=
ugh
so that the ovp don't trip).

My idea is to implement the .set_voltage_time() callback, to inform the cor=
e how
much time it will take for the regulator to reach the new voltage, to that =
we
fsleep() for the correct amount of time [1].
Then, the core could call .set_over_voltage_protection() if the driver enab=
led a
new 'fixed_ovp' flag:

--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4014,6 +4014,16 @@ static int _regulator_do_set_voltage(struct regulato=
r_dev *rdev,
 				     (void *)data);
 	}
=20
+	if (old_uV !=3D best_val) {
+		if (rdev->desc->fixed_ovp && ops->set_over_voltage_protection) {
+			ret =3D handle_notify_limits(
+				rdev, ops->set_over_voltage_protection,
+				&rdev->constraints->over_voltage_limits);
+			if (ret =3D=3D -EOPNOTSUPP)
+				ret =3D 0;
+		}
+	}
+

[1]: https://elixir.bootlin.com/linux/v7.3/source/drivers/regulator/core.c#=
L4005

>> +static int lm51772_regulator_set_current_limit(struct regulator_dev *rd=
ev, int min_uA, int max_uA)
>> +{
>> +	struct lm51772_priv *priv =3D rdev_get_drvdata(rdev);
>> +	u64 voltage_uV =3D ((u64)priv->sense_res_milliohms * max_uA) / 1000;
>
> Does this build on arm32 or similar things that need a libgcc division
> implmentation?  div_u64().
>
>> +	if (status_reg & LM51772_STAT_INPUT)
>> +		errors |=3D REGULATOR_ERROR_UNDER_VOLTAGE;
>
> That sounds like an error with the input so I'm not sure under voltage
> is the right error to report.

Since there is no error for input under voltage, I guess I can use
REGULATOR_ERROR_FAIL then ?

>
>> +static int lm51772_irq_map_event(int irq, struct regulator_irq_data *ri=
d,
>> +			     unsigned long *dev_mask)
>> +{
>> +	struct regmap *regmap =3D rid->data;
>> +	unsigned int reg, errors;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(regmap, LM51772_REG_STATUS_BYTE, &reg);
>> +	if (ret)
>> +		return REGULATOR_FAILED_RETRY;
>> +
>> +	errors =3D lm51772_status2err(reg);
>
> Does this do the right thing if multiple errors are flagged?
>

No.. should iterate with for_each_set_bit() on errors and then do
regulator_err2notif() on each bit.

>> +static int lm51772_irq_renable(struct regulator_irq_data *rid)
>> +{
>> +	struct regmap *regmap =3D rid->data;
>> +	unsigned int reg;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(regmap, LM51772_REG_STATUS_BYTE, &reg);
>> +	if (ret)
>> +		return REGULATOR_FAILED_RETRY;
>> +
>> +	if (rid->opaque && rid->opaque =3D=3D reg) {
>> +		ret =3D regmap_read(regmap, LM51772_REG_CLEAR_FAULTS, &reg);
>> +		if (ret)
>> +			return REGULATOR_FAILED_RETRY;
>
> Shoud _CLEAR_FAULTS be volatile?
>

Yes.

>> +static const struct reg_default lm51772_reg_defaults[] =3D {
>> +	{ LM51772_REG_CLEAR_FAULTS, 0x00 },	{ LM51772_REG_ILIM_THRESHOLD, 0x64=
 },
>> +	{ LM51772_REG_VOUT_TARGET1_LSB, 0x58 }, { LM51772_REG_VOUT_TARGET1_MSB=
, 0x02 },
>> +	{ LM51772_REG_STATUS_BYTE, 0x00 },	{ LM51772_REG_USB_PD_CONTROL_0, 0x0=
1 },
>
> STATUS_BYTE is volatile so a default isn't terribly sensible (but
> harmless).

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

