Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793639335;
	b=WSU1kq1LeIOV2HBao1BXnopAKbz8eNuuX3vX5QIGnc/o8QIFnbiSox4BdxnxEO84wq/g
	 wU12REqhouQ38yskaAQh1T7/9XprqVPyLZYAmXjXpF4f754SXHsVMJLxeOQtFApPUWRM+
	 3Yh1RcsdKYw1XMQW9TxFTVIFNtsK1Qsb+s5YdJ/l+Z7sgheOq13n9oxJBbFC9KqJ89NF+
	 HJkxpK+3QD5iWQTZ7Hi0gMAUN2lXxj76qEwn9JfOLnJgvTar6ienCP/SihrJ1JOsVWeAL
	 oNyMKx86CY1b42xl6u6ansXjNKIp+XwvDZTxpN6STk3JaD7MpRr4n2rfF3VNL65Lxkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/1UJk3JqS6fkuKulKu6p5GDaSUTIs4Dz/wlVuj6OVzE=;
	b=1ahSrZpx6eHsHrctwTLl8Dqny23O/AA1KYgZw8B4UpCyxXBfPEusPr7q2ZjNG9fxBgob
	 1q/EwiuN360ztZ5PSUwtyPSjgln0u5frvSsv0LZUhtSuMsEVdpJqOC8iPf+c1Ofm6mQ3v
	 8QGOgqhwueTK7eDFEOdKTOGc+EkIiQmJ1vJofkssUCS9Y2TH/Lx9+nxBKUi5YBdMMOxu9
	 u2K0ARQ2M6ZnmijjiIZ3h5lnnwsGA3YyrLULEFWwkXKA4TmDbXsOsY1hCB0LprVhJevnR
	 yYfPRq5pNOtgMOxO/VlcxJcEZincAjsnqb4XIXKh9499kQdleaziZ4ODpO+ykmMXKSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hGVc4i1n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D62606A905
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64D62606A905
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hGVc4i1n
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ea94541adbso14198005ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:08:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793639335; cv=none;
        d=google.com; s=arc-20260327;
        b=jVWhajQOdTePgr5FxmCRm2S7MyCIp0i99Q/fPoYPmdBJb1UtwePk2uWPYGAH579aZH
         8zY15/MMq0dZ//HUKk8J+o9CpJza1wkKVgpzC6qbqpnNKcKj/9ncI4ar5embcUCdMoSt
         aKrorZ5iVLhNIeMrLTRqmEU8auwh5zsaJWeJB8MQjR2i6d5N706RWy+fW2+nBIL3SE5W
         WzHi+MBtcgBSIz035D9nORb+BfriIE2T9eIdFxt7tAqqlDGXPrmcgxzyihmYp/cvUkQa
         HQVVRx0/NIrI0zhCHgjEf6ZKg8un435KPNPCY6ExO8hJ+BHoTK9VZkiIP/e+TAGQX6hc
         um9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/1UJk3JqS6fkuKulKu6p5GDaSUTIs4Dz/wlVuj6OVzE=;
        fh=uw+6YBFdxYWp72ll7ZhuhnCc/bo5mlm7YW1RuH9VO6Q=;
        b=UywPkr+Ks85xR6XUvXqL31feGkJmbPQRdDlTnPt9vQGqcRwbT2y8b6/tVxm0j117/f
         DaTxv0NsSRQPc+s3Z46tLTPe6JiUPjBtwQ5eQBzpzo0P9qDNXgTazuzcuJjs3ZmBCxSv
         2exl0lON9RFplrO/Qx1J49juV2vOLWkXN3WbO03ii39r8pUnASeGX3sc/c5PjHhrrjOq
         9BhJ2h5EseEN4ulNu4kRukkcqJFDXmZBJJDiEs/MV4QSax5JFU8vofx2jtW9y7AOGXRA
         UcWuTWjkJbp7KGi/ndWPaxcMMNnQJayWeCi0cB1myLnlEvQG6Md7hn67lZ9boYxuFwYg
         YMiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639335; x=1794244135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/1UJk3JqS6fkuKulKu6p5GDaSUTIs4Dz/wlVuj6OVzE=;
        b=hGVc4i1nYaxm1gfBXeJ66oqkUTa6c1I7R//DTGNajQkO0MaElfQEX7QRiiqa1tH+31
         CgdKGNnDcrP4yOuyleEZ+kQxZv52auG98wlhKgZzYXP5dZF+IXgaGwShp6Dlz+5y2vRE
         d+TX/hsM6OK/xetAR7X3g5gwwsFcV+xKiTISfdprwPQaEY0LPzK53svc12N5KrMDTTvB
         7uk5FjhD9kBD/tAuBl6b3b6LlqEZ6FCDCKb23zKAwmYPXZgGBOlu/CJ91QsvUsn0P99n
         0bLNcc9xq0kSTC1/04fN75B0RjNStCxJnedSF9G4Ejl7WMBnPHGW52OmQO9u7F0jB+vl
         VJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639335; x=1794244135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1UJk3JqS6fkuKulKu6p5GDaSUTIs4Dz/wlVuj6OVzE=;
        b=eZ5hFyERacuKVx1/b5yLw/uvo1uS2MR43uExVbK/6Lk88wWAzicjBUXA+ik2hP0YGC
         bDY1Q7SSJD4/zxH1l819XXdl1V3zayzAnlgQKI+rBDAJbbAJ4YYClcqz3eIzKN7Q47UC
         mux5IHbnfKiGH8HHNDVC7f9V0dbf+xIav3O8GA4a/0dizQ1PxgrcssxVDrD2UMMwE3Be
         aABJjX4jl/UlG31SkvBNtQVvqaUxD0gP2rMB3OJm0iSdCay/+HTIrECZH4cXgc2dXjn/
         uqhtGHahU2+GUk2GOG4BpHUY1l5SytAUWzvDOMKmECJY2BwRfchsnmXfByA1QQ5KgCP/
         ZPFw==
X-Forwarded-Encrypted: i=1; AKwUvBwvW9UJxRu2dv5C5jwdA1AZWsUEDqnRmizgvortZMbtTzcuFbi6T0iRwJ/B4dLndzLnUmkT4UpIclLg+II=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T1JMz14t4afg2YWMVQxhH2Ugu5AUc3qA/0ekeZNbgV3G1Qxm5
	Yawwj3F+mKISSnnx8Sj1UGkrNkAt6FC+dDi3MKlIhwsR9YMqZtEoPRdXK5HmxgrfB4xFTfN5qqo
	7SEbT8D9jNMYEKENhqXS5MVlv+plvhKY=
X-Gm-Gg: AYBFou2FVCgI/hmmtk2/XZEuhD0TS12eY/9PDhJdeLWcA7tDvBeAZo7GPeGk/H5TKPP
	GDYTh3FXUIZftudmLW44kkd+I/FMVb0ViBusIZk8cVput/H2zSXGz4t/cbP/SXw+xkdzD+eA126
	34VCG8vLxShBicYSFYy4Xu4aAL2fQOumDpGltaigqIJeIaWEj6tPa2TeRn5IR4l3jKSTYXo4Ubn
	To9oJ+/PUlJzDXzrq1l71vHbGPMIYug7WMBbZ+f5C1g1vmPxTLCd0dvkp86jR2DoNt76Ff2UL/C
	PQiRVpFu29Ki/fBSe3+eCErSQYldeQrK1zBnGMmLP8/7ryq8YFgCLHwcZEj6qtTMZeryJkWLnK4
	KKGXjzPJU28BSgz1VLyoLuHrZUxJl6KL2GsgFMk0DBlglHi3LSnqV
X-Received: by 2002:a17:903:46cc:b0:2e9:734c:5027 with SMTP id
 d9443c01a7336-2eb36489d07mr99830495ad.15.1793639334641; Mon, 02 Nov 2026
 09:08:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101223125.302001-1-pmazzini@gmail.com> <20261101223125.302001-4-pmazzini@gmail.com>
 <179362625591.1990291.13023153378073511078.b4-review@b4>
In-Reply-To: <179362625591.1990291.13023153378073511078.b4-review@b4>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 2 Nov 2026 17:08:40 +0000
X-Gm-Features: AclHuK-tV5P0vtvU8i6099NIe_EY2lAYdBuaIqo2hWi_-svodzPnZSAOrz52vq8
Message-ID: <CAAxh=jsmE=vzn_6e9JiVbFcjsH7+-0kf8x=4J7Krufzb5E=9HA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] regulator: sy7636a: wait for power good on enable
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Alistair Francis <alistair@alistair23.me>, 
	Andreas Kemnade <andreas@kemnade.info>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right, I will skip the wait when power good is already high.

On Mon, Nov 2, 2026 at 1:30=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> > Wait for power good on enable, as the TPS65185 and FP9931 drivers do,
> > so that consumers can use the rails once the enable returns.
>
> > +static int sy7636a_enable(struct regulator_dev *rdev)
> > +{
> > +     struct sy7636a_data *data =3D dev_get_drvdata(rdev->dev.parent);
> > +     int ret;
> > +
> > +     reinit_completion(&data->pgood_completion);
> > +     ret =3D regulator_enable_regmap(rdev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     wait_for_completion_timeout(&data->pgood_completion,
> > +                                 msecs_to_jiffies(PGOOD_TIMEOUT_MSECS)=
);
> > +     ret =3D gpiod_get_value_cansleep(data->pgood_gpio);
> > +     if (ret <=3D 0) {
> > +             regulator_disable_regmap(rdev);
> > +             return ret ? ret : -ETIMEDOUT;
> > +     }
> > +
> > +     return 0;
> > +}
>
> One thing here is that if the regulator was already enabled on power up
> we'll get the full delay during startup if the regulator was configured
> as boot on but already enabled.
>
> --
> Mark Brown <broonie@kernel.org>
