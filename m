Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569921DEFE8
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295768; cv=none; b=Wi8CJF4YDXB9XohpTP0+Si/mciGlEHxV5k603/Uw4JU2xW5+fMxuIamSDA+avSCk5y4s93elmu67JI+Y1gtF56C/wXXTDdgX1RYHr1g+60DeQ5Y23O2F/SAxDys0VdEqYs56vElO3q8+DnUoj4qiCSWpmT3sTTBOvjFAmNwAa+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295768; c=relaxed/simple;
	bh=N9QDoNjH7SQ2a6fTr+DM4BznMS1QQy9nCHm80PlOj4I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RRMJaz6ajWJhamIrgtH8/a7+muUP+PIF4fYxUc47NixFcCqjtIgZDRIPT3d7hNBt+oOu40BL7mixsRe4IYIo9TbRp/N44XgOimNcLnbGGxInoipdCaG541XTWA/rTvD5GqQlCX3EXO+EhqoLJGfdY58El26AzKSyF4bhKp83mm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Gvqx9CO+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Gvqx9CO+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BF1321A114B;
	Tue,  6 Oct 2026 14:09:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A28F60553;
	Tue,  6 Oct 2026 14:09:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DFF2103301DD;
	Tue,  6 Oct 2026 16:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791295762; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AKYKWw8yRJADG0ZqwchQesW4ZpXy14oTpfFHmw5LWn4=;
	b=Gvqx9CO+1+VFhqm01m02bA9548v4KuqFOF3tJJ54NZwwEr/6q3ScK+1XOgB8HvoCviBuSv
	a1uOVMYROLD7kIVea6qxR9DGbvYTzLhpMHHOx+hIQXYMRoTRoKmINnfD9UGEUPuNEGt6KW
	s1oL1NbT99UwaNiHE24lC1omvKuXF+TTrBBZa5r7Vna0gXUWVJzh0jo7m+4SOp6dszM9Li
	J2GAoXxYmnFhdcqNTDMlqru1H6vWeGGYgLsGCBrqPxI9ByJQ2dXEayStbbbnFHCoCZR3ki
	HtiKOP7ocdaMTd3bGR7XcAU6ZYa0ZoykBY4ys7AD4VnU7f7GZDcHQJB7RCfvfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Puranjay Mohan <puranjay@kernel.org>,  Jonathan Cameron
 <jic23@kernel.org>,  David Lechner <dlechner@baylibre.com>,  Nuno
 =?utf-8?Q?S=C3=A1?=
 <nuno.sa@analog.com>,  Andy Shevchenko <andy@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-iio@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: temperature: tmp117: add support for HIGH and
 LOW alerts
In-Reply-To: <20261005-add-tmp117-notif-v1-2-c6cef6fad64c@bootlin.com> (Thomas
	Bonnefille's message of "Mon, 05 Oct 2026 16:44:20 +0200")
References: <20261005-add-tmp117-notif-v1-0-c6cef6fad64c@bootlin.com>
	<20261005-add-tmp117-notif-v1-2-c6cef6fad64c@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 06 Oct 2026 16:09:16 +0200
Message-ID: <87se2ihqer.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Thomas,

The code overall looks fine but I have a couple of style improvement
proposals.

> +
> +	/*
> +	 * The threshold is passed in millidegrees Celsius as
> +	 * value =3D val + val2 / 1000000 (val2 holds the fractional part, with
> +	 * the sign taken from val). Convert it back with the same LSB ratio:
> +	 * raw =3D value / (TMP117_LIMIT_LSB_NUM / TMP117_LIMIT_LSB_DEN).
> +	 */
> +	tmp =3D (val < 0) ? (s64)val * 1000000 - val2
> +			: (s64)val * 1000000 + val2;

                        ^
Usually operators stay at the end of the previous line

> +	tmp =3D DIV_ROUND_CLOSEST(tmp * TMP117_LIMIT_LSB_DEN,
> +				(s64)TMP117_LIMIT_LSB_NUM * 1000000);
> +	tmp =3D clamp_t(s64, tmp, S16_MIN, S16_MAX);
> +
> +	return i2c_smbus_write_word_swapped(data->client,
> +					    reg, tmp);

Overall the wrapping looks too aggressive in several places

> +}

...

>  static int tmp117_probe(struct i2c_client *client)
> @@ -208,6 +343,16 @@ static int tmp117_probe(struct i2c_client *client)
>  	indio_dev->num_channels =3D match_data->num_channels;
>  	indio_dev->name =3D match_data->name;
>=20=20
> +	if (client->irq) {

Since you're adding the binding for it, I'm surprised the irq already
exists?

> +		ret =3D devm_request_threaded_irq(&client->dev, client->irq,
> +						NULL, tmp117_interrupt_handler,
> +						IRQF_ONESHOT, match_data->name,
> +						indio_dev);
> +		if (ret) {
> +			dev_err_probe(&client->dev, ret, "irq request error\n");
> +			return ret;

Isn't dev_err_probe() return ret already? so return `dev_err_probe()`?

> +		}
> +	}
>=20=20
>  	return devm_iio_device_register(&client->dev, indio_dev);
>  }

Thanks,
Miqu=C3=A8l
