Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622191;
	b=sYFkfFVNLzy/Rjkmtcu4HhkTnzsiyqUbvbWzlb3ZegVUno1Z0GciyYFx1uwfhXGyiQee
	 X+D3UIcrcqORazWzXxsx1r8leVZZR3JDuEFfeSN0ffGLLnk5DBOeqWiNQ1GQP91b+4R2h
	 o/im7iL//MvlmY9ADOvWwhOEMO9RuLfWPfxt9MQHxZO9LEei+nGhdXkVjTmEfk3GqQxQ1
	 WIqIz8qp7I7RSprYBAOeipe4k/TDGFKAiJ26VUUgIp2xgYUT0nm6WLPQaa2DxvB7lHhJn
	 Msw6it9+0hoTrgnp06cdN52JwqPe9MqMIfFB5Sw84zUIMLxTf74nKtCRJfyMsh55QoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622191;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=j2k4EY7CzrQe8VqtZh4wozqB+rnHD1MuFCzty7X6m4E=;
	b=2Bj2XwJpn56JTeerNofbN6kkjlOo5NiOnSvHlfpTDszBaRPLJuc+uoiXNCjvLxUEJO2d
	 zs/EsNu0AKHEbsIL7f9RLzz6lM5/s+KIMtnt1yObclFISg40SHQPzNz1IvW7OrF/Gm69G
	 yaKB1SHwNy/NptpTdpVlFIz9TklJk3iymlUzXFjJe0NryKbGUl/Uz2Ig+y7gy4ym2Agso
	 APWxR9TUdIB3qBml9bZWWU56+pQY90CIY65TOIC01X2L3lJNtGvNWsBOJQ+SAPfatj+gz
	 L0BElvUVbTIgk0N/pCFVf+FAKdAO4QfvpazZIwL6zONXruycSPQlFth0aj+BbqSvGwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LHfYuE8H;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134C9606A336;
	Mon,  2 Nov 2026 12:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 134C9606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LHfYuE8H
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 20DB94E41369;
	Mon,  2 Nov 2026 12:23:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CDF3460750;
	Mon,  2 Nov 2026 12:23:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97E78103290E8;
	Mon,  2 Nov 2026 13:23:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793622185; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j2k4EY7CzrQe8VqtZh4wozqB+rnHD1MuFCzty7X6m4E=;
	b=LHfYuE8HbbrXvuZ5q9yu/kw0mnMAWEFBeM9ADvx+2kmiJr8ZM/xCWfIlC4gwXmvOxILXCH
	COTKltH/ZklQv11fu0Ps2lKSX0YJcFzabRI8gWPC1Nja7M4bjXJWjcxGMkTFYOtjF8RF43
	OFychb4L2uirVGsUG5z8ub5aXByuLUPRl5j9hcxN7nKHnVgWew6+3x45aHK1KtdvnS+Plu
	dL9LzWfMgbM47cfpV5GuQpR29bDDyhVh9ea4d4T3fms3ExqJGys+gz/sBTtH1AzLU6B5JL
	RVisOtxf/CwVxMx1X3nHB98h3RJFmb2BXqLckidxG8rqtLqaXjB5zbSCM6o0oA==
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
Date: Mon, 02 Nov 2026 13:23:02 +0100
Message-Id: <DMKPZZNSDY1O.3DILD6GVHK3RO@bootlin.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 3/3] regulator: Add TI LM51772 support
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Mark Brown" <broonie@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261030-paul-lm51772-v3-0-0de62c22f342@bootlin.com>
 <20261030-paul-lm51772-v3-3-0de62c22f342@bootlin.com>
 <179337726255.87968.9906404525377602371.b4-review@b4>
In-Reply-To: <179337726255.87968.9906404525377602371.b4-review@b4>
X-Last-TLS-Session-Version: TLSv1.3

Hi Mark,

On Fri Oct 30, 2026 at 5:21 PM CET, Mark Brown wrote:
>> Add driver for the TI LM51772 buck-boost voltage regulator.
>
>> @@ -0,0 +1,903 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * TI LM51772 I2C regulator driver
>> + *
>> + * Datasheet: SNVSC22D (September 2025)
>> + *
>> + * Copyright (c) 2026 Bootlin
>> + */
>
> Please make the entire comment block a C++ one so things look more
> intentional.
>
>> +static int lm51772_irq_map_event(int irq, struct regulator_irq_data *ri=
d, unsigned long *dev_mask)
>> +{
>
>> +	ret =3D regmap_read(regmap, LM51772_REG_CLEAR_FAULTS, &reg);
>> +	if (ret)
>> +		return REGULATOR_FAILED_RETRY;
>
> This register appears to be clear on read so it should be marked as
> precious, otherwise debugfs will eat notifications.
>
>> +/*
>> + * For < 24V, voltages are set in 10mV monotonous steps.
>> + * For >=3D 24V, voltages are set in 20mV monotonous steps.
>> + */
>> +static const struct linear_range lm51772_voltage_ranges[] =3D {
>> +	REGULATOR_LINEAR_RANGE(LM51772_DIV10_MIN_UV, 0, 99, 0),
>> +	REGULATOR_LINEAR_RANGE(LM51772_DIV10_MIN_UV, 100, 2399, LM51772_DIV10_=
STEP_UV),
>
> Looks like this ought to cover 2400 too since there's overlap between
> the two ranges?  If we don't have it then the driver will get upset if
> it finds the hardware with that configuration when it starts.
>
>> +	  .active_discharge_mask =3D LM51772_FORCE_DISCH,
>> +	  .active_discharge_on =3D FIELD_PREP_CONST(LM51772_FORCE_DISCH, 1),
>> +	  .active_discharge_off =3D FIELD_PREP_CONST(LM51772_FORCE_DISCH, 0),
>
> It looks like this is an always on load on the output rather than
> something only enabled when the regulator has been disabled so we'll end
> up with an extra power drain for no reason.  Possibly we should have
> core support for hardware that needs such manual management, though the
> datasheet suggests DICHARG_CONFIG0/1 might be more appropriate for what
> the API is looking for here?

Yes indeed. I see no reason for the DISCHARGE_CONFIG0/1 to be disabled. At
first, I thought that the FORCE_DISH was necessary to get the discharge on =
DVS
ramp down.

By manual management, do you mean selecting between those three configurati=
on
(force discharge, discharge only when disabled, disacharge only when disabl=
ed
and until a certain threshold) ?

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

