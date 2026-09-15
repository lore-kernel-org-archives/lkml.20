Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6194C3B442B;
	Tue, 15 Sep 2026 11:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472748; cv=none; b=PXMwZ7DXMw97zSTsVDrVFxm6Fsfhp2QCXHCQT4qMaFowt4VaRuZxTUO7AkIiVfyoxXsbGOePQ3it0d8U50zNYIjJic7bAQMMuCU5uAAbLsXZCv+gnOye244MVxoTaN45ZnL+QIMo5GehZBUJ7d3ZS/D/dfWE5xreKE9A5z14m+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472748; c=relaxed/simple;
	bh=+qmX0bjLY0LxWkr3bE+yz4SmAagzIHduRi9A05kr0Zk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P8r5kk1re6ecHx8XKCCfQKbSxLXgyA13IWl2dLUCGJl9LJFMsqwgZ3JbZRZUVSt/1sIrirUXyVKPd36RuPw0IyDIiKGN72rNNbwtYk6XyghtXXI3swvlvA6Wds11FeQ0ypaw/R3lZ7FxBOs6Cm3Pz5bujO7g+CUgpK+OcSUZsgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 8C33DC3E4DEA;
	Tue, 15 Sep 2026 13:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 8C33DC3E4DEA
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>,  linux-media@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ar0521: remove duplicate media entity cleanup
In-Reply-To: <20260915075520.2122757-1-lgs201920130244@gmail.com> (Guangshuo
	Li's message of "Tue, 15 Sep 2026 15:55:20 +0800")
References: <20260915075520.2122757-1-lgs201920130244@gmail.com>
Sender: khalasa@piap.pl
Date: Tue, 15 Sep 2026 13:36:09 +0200
Message-ID: <m3v786agra.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Guangshuo,

Guangshuo Li <lgs201920130244@gmail.com> writes:

> There is no need to clean up the media entity twice.

Definitely.
Thanks for fixing this.

Acked-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

> Fixes: 852b50aeed15 ("media: On Semi AR0521 sensor driver")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -1142,7 +1142,6 @@ static int ar0521_probe(struct i2c_client *client)
>
>  disable:
>         v4l2_async_unregister_subdev(&sensor->sd);
> -       media_entity_cleanup(&sensor->sd.entity);
>  free_ctrls:
>         v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>  entity_cleanup:

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
