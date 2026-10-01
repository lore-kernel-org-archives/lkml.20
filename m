Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA973488763
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838656; cv=none; b=pWc7efXRya64lYeqOQTcz3QBqbNJKAH1Zmw2LFOeblT1RvSE0+DubIC7lTy5wkr9msP2Au9paJj84wQ7NXJtQLP1AGSqkrx/7coewZKz1fJ5LYiutNnSFAgzE3YNOZX2Z3NeCjIoa8nxYI0XegbYb44aSPJ85iiRpEXDqdZkYBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838656; c=relaxed/simple;
	bh=Iv4M5crlHvDjmW2HZr0hScIJlR7oG5vccxpwEJd6NaI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DGocmzrQVCwh2mLo5sV7om4Q+cZq07Ui8FrggRQHCA4b8IacRc74I7rfCDT5Jt+1c3nlvHNeTBab087eWd/AwQ7+9Rqh/wvHXIpOdYOdhAt19LUfdYsiaHiH7JDxxByFub9W108XOhNP1O71a+Cu80mbibEv/NDdROmCIEg0j1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4BYTRtG; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4BYTRtG"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so4410332f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790838642; x=1791443442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fR2joc6EXlPj2tJlUEfZeXdkIMyGc6pqdS8NyNfp3tE=;
        b=h4BYTRtGghkuAo+HBw9s783xPfe4EHSip4IL3Mlj/q5kSgpAlx3/sYtlT+IEizILkY
         XLVFLPOgrFxMGraD8mZ1f+el0O+Lz1Xy2FtFHOcyrCaOqldaGTOmCtGltMCTIZvlypd4
         gQ5J0xk68OtbdFVvReF6ni2lSb53kHYthmXiL3JlZt8Gzl7twfdDxX7tizJvhftC41T2
         VFe6ZEdB9XN0tNPhybxkCXpmLbY28T6t8sItAeZEFsJK+2IH6SIwwf1JX2LalG5nZLul
         OI9l/ZObqhsHfyx5oPCLIea5LzErs5B/nZwoL+QJrTaXrJQnP8aLbPVLGd8MErc0VBx8
         9XPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790838642; x=1791443442;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fR2joc6EXlPj2tJlUEfZeXdkIMyGc6pqdS8NyNfp3tE=;
        b=GLlA2E0r4BJV8UzFlkJ3tpcRBpxPYZBT+vzp/9XjkVxv3x6ez4acf4upyDNko9QjJA
         YgYa+cz3jbZMfNQui7ozKhuIA8w5We+yoStmkucDyNCI6SNmqKf3RN9BoAl5jaJJgrH9
         P1zTU7onxSJc38s7buy6cs1w466U33m9S6pTxLamPDZzmuGK3VerkYi9Fzk5cdS1V2FG
         OwBxDLOX5Tc+rSHSmzCUuic5J88ISdJcmXdICBTKvxEJFdzizUsR1UMvunrBgep8HRxv
         wY+Oum/cZf/tOTe/VAfFuYXFQhy6M5A3IhJMQRi8eSWumygInLF0pCxwaMmOAzDkajxS
         15hQ==
X-Forwarded-Encrypted: i=1; AKwUvByO66HNnlB7lLW591iz/folDTSuNabaPPobHHoDGuvGUBnIiJV/XHa9+2o95zQr/dqj7l3as+Xo08iCLgY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrIXMpXwKYtr2miRCpe3TveH2o0o4wJy7UEJwH2VNkQttseoXY
	GNRUez2Qg6mOGZf0V+OYQCSLBpsYXk/IOdDZ1qAvQUyfSF/D/+CP7jdW
X-Gm-Gg: AYBFou1fhBZv4i8jzUy23wEGMbgTLA1X1Gq40waEm+u0utLEXn6nq0E1qFwVVXJXs94
	oVCDkRBj5nv63yx8V3Fr+veegX79iDyz4oMZBhlHsrJicAC7tC6x/p7Bf48ClieOJaGuh2XG3Zk
	02ko+vgXOYQINnLsev0XAm4Cq2oZqb4/ojohhtUaW/gMwxcEx+a6dBbQHm4GRzVINCSeUfPkTPa
	Yj3pCKAlU9Sxva25K4j9oqrJJht2Zx0K2yWIVQlMlkWbTTxAsBJfFV1y6ShqpCO89tRTCWnLfuW
	Uu221Yg1rdnOqzdMTApjfI0bgH2doSbgX1CoIqt3RCwZSPqTfKGjFnpxAtiLMpJSEHJmkH87CyZ
	MGmecRmmTs90bYR+hnXqyxxOikR5YAb+tzfGYHshMMdTinWNt/yMPSRZ/i3dvlB88dAmYsc1E8p
	yyVhW2E4zmpj8DcoQUB3PfW6hqPjdwTse7siQRlBubEoCHI7Vqc8jhl1Kc/FGIMG+PxtyCvnmHU
	Bh6nWmlOxwwDLqla9GqNdRtEcw9X+f+3BhoAB2erWGoUz4ZEDELMirP9HwpR1RlbXuaTs2IizsB
	54N1wfdReqaHLtLVy2YD34wwvkOIOv70V0QomWd/3ifBDl8fApKT5awoBKOGjIOhdFtxRDJ3idU
	6oGxNVSoN2o4v3f8KLmCTiQAz1QwtAOgwkISw5EPsOaZnN6EjNYLekjei7PkE4GsRT/dZ+gcgti
	KCJamCrc/b4fa2HAY=
X-Received: by 2002:a05:6000:2890:b0:487:27f6:a4df with SMTP id ffacd0b85a97d-48b02538519mr6466998f8f.47.1790838642433;
        Thu, 01 Oct 2026 00:10:42 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6f9sm4954333f8f.7.2026.10.01.00.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:10:42 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:10:41 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Archit Anant <architanant5@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, andy@kernel.org,
 nuno.sa@analog.com, u.kleine-koenig@baylibre.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 05/10] iio: adc: ti-ads1015: use dev_err_probe() for
 error handling
Message-ID: <20261001091041.00006430@gmail.com>
In-Reply-To: <20260930171204.12863-6-architanant5@gmail.com>
References: <20260930171204.12863-1-architanant5@gmail.com>
	<20260930171204.12863-6-architanant5@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Sep 2026 22:41:59 +0530
Archit Anant <architanant5@gmail.com> wrote:

> Simplify the error handling paths in ads1015_probe() and
> ads1015_client_get_channels_config() by converting dev_err()
> calls that are immediately followed by a return statement
> over to the modern dev_err_probe() helper.
> 
> Note: This patch takes advantage of the previously introduced
> local 'dev' pointer when converting the legacy
> dev_err(&client->dev, ...) calls, avoiding unnecessary
> code churn.

This paragraph should be removed, no need to mention this.

-- 
Kind regards,
Joshua Crofts
