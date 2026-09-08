Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B9F50EBF6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872601; cv=none; b=AwSwG+r1iMO4D92U72XrHzhDwreFFwEItCxSuKb0LT5kIajX/VUZK1J6IlFcfzpZ8sM/Hx5lHZc17CpOuwcCvujVcD43Wa79CkOdjoL/SEhusvfOEAzlruj4xhAXaO3DiCrJGVrcnygBgRu2xiJMeZyJJsIb0We/LOeJhsQYO3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872601; c=relaxed/simple;
	bh=/litBUCmykqlKIXM9mqB+Ix6fkKAHYidvnz5JeC4/bk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kFSEgBeg/TeniSxTe5kC1WP5853P8vgE+nwtnzpaxXo0SnmKtVZ0PamOm/Y+Kgr1b5doQQxDhQ6W6e7WpoJk702EL1UnsPI9eaStVlVoirKJYo2SQJO27MPHA2IhQ90dKnVzg8X1Iwnt9hMCzrFBRlFeRpU57+m9nJmdDlfN6Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqvrTgpA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqvrTgpA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b9320423cso52197885e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788872595; x=1789477395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/litBUCmykqlKIXM9mqB+Ix6fkKAHYidvnz5JeC4/bk=;
        b=aqvrTgpAcqZ0INMXVDRhgGYj+qryYPu19QHumQ7VoA/AnJJCIkux8bo5WzOgY9enYg
         savjeiDfENMq9D3z903FnLln7adYaM04WUK3ecbYK7ewTpH9EKmgtSUW2MiHXRCtWUMN
         MWfjqy7tp59ENjsGAWWuNAQDO6/E7IFCaK4WcQeXic9cGHLqMGUsfe2pIcEx7cY6Uq7N
         /w8SiR9nDAR0cTDIiaY//+GHenOnT31lFwXunNoc1OstiqYgJGKJzf+Ku7pJrhkuTp/j
         CzC2xobdBWOPpfiBQv+kyNnos53AtmO0Iex7NRFRm0tl0VLGdG4m0o2SGcjAMgMBv4ve
         cihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872595; x=1789477395;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/litBUCmykqlKIXM9mqB+Ix6fkKAHYidvnz5JeC4/bk=;
        b=FV0RYxQFGd1I/CTsAlN6PKWQ1RdqIA8wlEhGSD2X/haVf7J+VGRXhLBCEDGp5DzQHx
         JrCt/nEWRQ6Uhpv3o8Zaccrwy5aOMKmyUnV5JDb/eqTAVqZkZICRJwYZw0XFBhvr5dXs
         IOR2ggZc4KRroDw1L4KkoV9tIn1jK6cXdz9nIpayDJbJIlYtIr2iG4DGendL6MTRZLu6
         gnOC4VTemgTzVXX857gp5+jJmWSrzmkAehI18IyKJ41QXfrwH8KFJ8TbmE7VImR1PWvo
         XIE3Upze9s/bjG8CaqMnTWN3F8cOQazYfZqAkT4biuhWK/nmojkxqtUnqDoTDB5V4Z4G
         L2zw==
X-Forwarded-Encrypted: i=1; AKwUvBzNUNJattDBM67SWFQRm97Y0FHFWBWppozvBk/LMc9jJqTN1k4gkqMLiJ9nGiBMw3gFm3YSjEonusLDjPI=@vger.kernel.org
X-Gm-Message-State: AFuF++nvIMf9mUcmvWf46KCnC+o4oeoAJrQKE8BNmJIqYnioouWQaXE8
	hGhxek3lpdzjPJIZCz97P2aGGMKBFr7t4RW8WSw3Su0/NmKkEFrAwJ70
X-Gm-Gg: AYBFou0cNuvVDo5A5FsU//LktMxU03l1801F3XACwxoEnfPgpUxpEaZmdtksIUwlP6c
	fE/kts20eFXKeXR7VwL7o/0/pUV1xZc5PrBGNoZ9bhd+E6GVonsYVpBM0BXLz5ZPZevAn2MLtaB
	g/oDOyAEy2jmrDd62ZXuBshv59HLSqD/NMGDvP+V5/nJAnYK0jrNnhUD1HF3KmpnNnEUn6fIyVA
	T1YQgthVbSsk/ibASwig6Bm8vZme3bTRK+qbTkDdeAjNUmZjrLJdip+Udqx3bF+92qKvOcDt86d
	9ssaV7haFHvsIlSGL0Tbr9TS+r7AZXUYSHdJ04Zsj7+d0wtEipHznpgwKILflLUxvNRk6Lqx8EO
	rqNXGylRF+fCHAZFmUZ0zBVzqQC7zAtVQrCuJXLC3PW9sVB2k/YLWH0huu4NSpPExC6HI76WwiR
	rM8jX6i3c4nPiHa3cyzeMMS4E9QfZ9QVu91eqL68FY7LJtry66jO1QqPOrM+Q4jhy+rzS6Yy/CT
	sUPr/9w1TpDx4Q0n+UIcR0ijOmbyAg5S1A2fjlhVuZZe/vPFrEBxRUFmOaFH+5qHzwHcFyxBmNW
	1BSitBwn4v6oLhZ/LrEoK2Yx85196ppCKsy6c2dqJIGZ5ItJM/Si5bf+LmKyBXFZdt181/pBUWX
	TY7M6ixyn3D5uahor2XQgEFZwWmoiaO3hPMfPjq/KYiaPYYcJZX3yZN+WEtB4DgAEI1Av4g==
X-Received: by 2002:a05:600c:6087:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49cf81e3454mr614754605e9.4.1788872594406;
        Tue, 08 Sep 2026 06:03:14 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d0af538d0sm255179095e9.8.2026.09.08.06.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:03:14 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:03:11 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kim Seer Paller <kimseer.paller@analog.com>, Marilene Andrade Garcia
 <marilene.agarcia@gmail.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] iio: adc: max14001: add missing MODULE_DEVICE_TABLE
 macro
Message-ID: <20260908150311.00000da6@gmail.com>
In-Reply-To: <CAHp75Vd-LTwJU-SvVug3MNPzFYsOQFc7qQ5AiMDjHOx8XNkHow@mail.gmail.com>
References: <20260908114047.1360-1-joshua.crofts1@gmail.com>
	<CAHp75Vd-LTwJU-SvVug3MNPzFYsOQFc7qQ5AiMDjHOx8XNkHow@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Sep 2026 15:41:23 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Tue, Sep 8, 2026 at 2:41=E2=80=AFPM Joshua Crofts <joshua.crofts1@gmai=
l.com> wrote:
> >
> > The MAX14001 has an SPI ID table, but is missing a MODULE_DEVICE_TABLE()
> > macro. =20
>=20
> Is this a problem?
>=20

For systems using devicetree, no. For legacy systems using spi_board_info a=
nd
this stuff, yes.

If you're referring to the mark for stable then I'm fine with removing it.

--=20
Kind regards,
Joshua Crofts
