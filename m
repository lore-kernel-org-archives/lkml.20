Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90051559C92
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880372; cv=none; b=U1A2kqydSYwki/wD+SQD8l3OhGkKZMG72tevPJ2FpmsiCb57HbhwO66jtccLnw+7fUFsfNpUCFd4+vx6prQsIUaQr/LO0DtaiwG9khtmOP3RX4UbJonv41t6UAyebHLoYSUjUDgIFGafdn6l5gIIN2E/etcIMSyWZaeLFNykrqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880372; c=relaxed/simple;
	bh=Doj+ZCEyQBnoNJxOjsX1VqYVjYJ/WamXYne20s6EuPw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S6A8GQaEDto/0Q2GD8sqDv9v/F6DU/wPHOpHJVP/0brc49QDcECm88EMU82yQLCxk9wQhW3rs9moUrDDSDeHHSy0hC6SGKjqtg6AxU7IzpoPhOpzKapAeHRZsO16aaQvBzs4f1yQqenE2UNZndIyFjy3rzYRcTJeieXCSHbuROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbI2GhOV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbI2GhOV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso51614575e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788880366; x=1789485166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XTgfNw2BEojIwEu1GKTPFuPQGMGtUKwmZuzA7RAeACQ=;
        b=mbI2GhOVU5hVYrA6X7OisrHVk6+nFnwrTJ1tYU9BCoo9hbtVC8TiYKvCFhDfDzaHBb
         HWbrCinpMmsyqOj1KCHqMrfGEi5L+0tDp61aoFPoacUTDoyqGyN/EQjHep2H2P5xVCPV
         rCNqZKQoQpgbCFtPIdqrH2W/2MHOUQVX4/ktVv4JYZoT7l8azXpaFuKO5F0vublJr+Rz
         YMl2/Us/mJuAk+Ojt7oWuIAWki0pAz8ua4FuKh9DTt27KiId8ewA8iYFBAmU6RDVYXZs
         F4HfUk76HgQLbQ/NYTns8c32ujbtd1ZwDLJU+CiKqy2yJWHC3xmrXUSLSxjPNu1S2TZA
         VeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880366; x=1789485166;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTgfNw2BEojIwEu1GKTPFuPQGMGtUKwmZuzA7RAeACQ=;
        b=rfaYzywCSl48RrbVuINXlPZb6YVFUM6Ttwc0Hy6Sfow9+EwOc+bGNosQywv+Fg1AZz
         pfPEu1pEv4BttpV4xwC8upN1bOIJj25klImySB3an2sxnI28FXwELJo6T+uWviCiXMF/
         j2cpnc+MIXLhmclf8CdFIkVDL5NgWTrTcGE1nppyInORi4FI+ZDIqJwjeK4NPNwrwx5R
         ASR9x6GMKmRazPzKeu8iX89eK1+O10iFNi4G3eitYBYMQ4inFFNJ8fGEke0nDZTJqOq+
         9vV6T0rBknvPdxAsDh4gdKelPFtqe+dyccCljtpJWksft03qN4GfbZib80EBBLm2+Pfn
         TUpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2KPbaCS/451O/zNyb9VjEgEAmiBvIa7Wfifu+/o8yDARQYxVyHcJUgopws08vGtZcOrlv+3XnhNLJjyc=@vger.kernel.org
X-Gm-Message-State: AFuF++kD313bh/Dh13h2Ntfe1lQ8TrlNI62QMKOcIFV0lFp2mXHBzHhD
	8bhrk6RrtqTBJuwCw81yx6GoCcBbDRtXJWG4CZDwcuqEhGwpeAVxB4Vf
X-Gm-Gg: AYBFou114lxgTWKPz1LnVcNOwgxzCdDU9+nAA9qY+P6lvYW4ZSUzV/oL3ns9dfZ2YME
	9kG6o4LxlTSOarta7KHICLZ7TKt3FWz3iPPECZDzV2eqzn9KB9VY9uubu/GVSoliP0w171wv8Gw
	swjOSpbh9CHkNTYeLqKOSl6WHLr80KQ2xTfN9PANffrYLaSFfal4lQldu8/F3j6ecHYnySOc9gf
	E4YTRg+Yf3Iv4GHtNPIjhYEhxVm/GaMEqy6CSDNlF4l7poxFSWnMA6vtZTO+Q0AW0pwzhOPLztQ
	5yqvFhOPxqvOqv0Vq4/khOeiBQiw9Fc6mI8YtS/+KlNPPn6y/yo1+KZKSB9HNb9rGedeb1r2DmQ
	ZzpEtPqwIUDNgn203BFKXdSc8APkC66vu5SIDwjex0mXhFJNXbjpAh4jS6cW9+nj/gmWCLgH2os
	Gw142VZkWAEk4zP4EE531EqWRLO16NLrd/SgFNkvqDo3a6TB/5hVnbHKDDVUTclFEamNIcvmHTA
	W7Rghki+5dr5RRWF2Lvfet+z3UtD3iK0se04EaOYvHmKXyV0UDj8xe2tuAoAbW4jmqev5DzefKE
	0PJw0fTfnqRIqD+DK4ZQnGcpjEySblJT2kZEDVWP++pshNham5GHaQ3VDEDyLXJbZeR2pN0+jGn
	9pmZFFC5FUag1Wwb0zpIoLAiH4jW2r6DHonOlSZJ0C52/DsBrVXJfJUJF22o0a43LXWZ9XWc=
X-Received: by 2002:a05:600c:4e94:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49cf81e368emr508972015e9.6.1788880365425;
        Tue, 08 Sep 2026 08:12:45 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6024a8sm507187685e9.6.2026.09.08.08.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:12:45 -0700 (PDT)
Date: Tue, 8 Sep 2026 17:12:42 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Kim Seer Paller
 <kimseer.paller@analog.com>, Marilene Andrade Garcia
 <marilene.agarcia@gmail.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] iio: adc: max14001: add missing MODULE_DEVICE_TABLE
 macro
Message-ID: <20260908171242.00007f88@gmail.com>
In-Reply-To: <aqAlAJEJPrglb2E_@ashevche-desk.local>
References: <20260908114047.1360-1-joshua.crofts1@gmail.com>
	<CAHp75Vd-LTwJU-SvVug3MNPzFYsOQFc7qQ5AiMDjHOx8XNkHow@mail.gmail.com>
	<20260908150311.00000da6@gmail.com>
	<aqAlAJEJPrglb2E_@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Sep 2026 18:08:48 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, Sep 08, 2026 at 03:03:11PM +0200, Joshua Crofts wrote:
> > On Tue, 8 Sep 2026 15:41:23 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote: =20
> > > On Tue, Sep 8, 2026 at 2:41=E2=80=AFPM Joshua Crofts <joshua.crofts1@=
gmail.com> wrote: =20
> > > >
> > > > The MAX14001 has an SPI ID table, but is missing a MODULE_DEVICE_TA=
BLE()
> > > > macro.   =20
> > >=20
> > > Is this a problem? =20
> >=20
> > For systems using devicetree, no. For legacy systems using spi_board_in=
fo and
> > this stuff, yes.
> >=20
> > If you're referring to the mark for stable then I'm fine with removing =
it. =20
>=20
> No, I'm trying to (implicitly) tell you that the commit message misses
> the answer to "why?".
>=20

Oh right... Will update in v2.

--=20
Kind regards,
Joshua Crofts
