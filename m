Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CFB3603D8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095656; cv=pass; b=DZ4EcBs3SZS30zAJssFAyYE8yYHAxnX+9CWdzM1GBRGEtE/oeq+K3zlHY9lf82dArXFCSFYNcvluOUG/KjaURcGHaa3FkRFyF5CQ0jByqg2rPWypy601DFtuBPLim1kcmOhLlWGYuyzzHJNsJ0KicYdfIAy9obCxgGZv81JmqvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095656; c=relaxed/simple;
	bh=Y2IK0OrtSi3t5BcBj1ZtQzAjH+x9+HSC57KKssAwDLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7bOziQpu+8kKXOwmNOndnpr9tnbuoSdXjsc6+zEZSYUgT39A9Rg4oS/YGt1dN35QOC4odjdguq26pB1oWIg2apiaUUZE09UXv2Oee8J0Q0de70ApmiGcciQWdE797npQskuHPflhxW+/9vCKeq1x9DOXAufKi331ivsg2Vv2zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1JX9/Kh; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1JX9/Kh"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-853c07a76adso466651b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789095654; cv=none;
        d=google.com; s=arc-20260327;
        b=pGmgwCtvsssQLxQAqTIrXpTHLgZNGT+98Bl7XcK76v5CVo2v+ekk31tlGAeBaUmE9q
         Y/3EzxeQfeDYd7nLVI7Liq4FHiQ/apeAtQ1fhUNDl85KFkWb6sRF71JIg9feS2m9OOnt
         CiOLaBeCbtYkZAPr4sVCGpb5BTdPBnHfHbIoja2t5n8yDDwGOGi7rtv2JicjRzQymjj9
         Ln0/IUE5APtvp4hDS1/hVRQVaeYUvailOOsNjr/d6vzyc4R/jmMrQLXvBbogaOStJ9Ur
         VBjwQo8TphYYGdvY1VqG3EiLGTix5GgxfRsy6fF+1hhXRFPospbbp2DAMffMcyWb5Nwa
         jHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GgvtkYeJ7+6IrGYwWBRX0B9aKmCQvEgKBdWATeTAwDs=;
        fh=HI83YmH+kR7WJKTrSTNiDFIc8DOoRCAoWyxoMuXcQ/s=;
        b=D5iFOEmyKv0JkcfP1W4XYpqQQOl8ifmQFtCr/B0XmapHe+74EWtb1m5HLVcI2DM9ub
         5hNUw8RXe4T5EaShbuS7vdEGYoQWEe9CqdHsGTS9/wrhc4AN/CvijtE73Zux+ZDWg+uV
         c60G+6Me1aSWdMwm0o3VRmb4n2x+H2Y1+Mm5xv2HL9xaaHVpvel0l2XUv/sa4G6Bz/ij
         QB/vX4vEAg4Bw68wUlu9EGOSxdySPO7TPapJUHTeFlJrcbXWqo8fQQw+m/esRzyYaAdE
         3MS4GkWRup2vOHIFC5aBK+BLuZXjDmfCpC2Tux8oAuiezIzEHs1hjbc81pIWBsNYHNah
         Gnyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789095654; x=1789700454; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgvtkYeJ7+6IrGYwWBRX0B9aKmCQvEgKBdWATeTAwDs=;
        b=E1JX9/KhE7A844Z2hPbzyQgfFOsw7m0hUvXmn6H4DJLeW9mw49E+B1rJx34F0dGB6o
         So4IHX+VMrCuvS6dnaez8PNdyvxVhM85MqiLc8odRBZicL7klrz9Reunrq35WSpx/NNR
         f1aZxYYw0wSUnL6EilMjGxa9Qigw4BtGqbhN+jM//HiEXed4Mm0q8kqUzaG3GzR5Zt+9
         YVRKoeJp/LZB6/dmjEZ7acDtaklg1YckCmSHjPySUOO90cIUyuRC3WB0X3iXoZ3KuR5c
         HoL6bb5TlfMOUUOG0sW6r32MAJ0OLNzyE6+JDBvnzYj/NulnYw56aytuai0MBDm2fttc
         M41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789095654; x=1789700454;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GgvtkYeJ7+6IrGYwWBRX0B9aKmCQvEgKBdWATeTAwDs=;
        b=Qp954PRDXhQMiC2/licS1fKKYNyEZeFDiZcfS8kTiQi6acrN7XPwCvsBrIcF7BOa2R
         fmVvUd/nZBiWXKLHSD+JeMn/e2u/WJrME6ua8K7E7E1De7vrccUta+V/c6Z9D0aA80YG
         zfYq66salCBggQjik9laSGXvz02HYdcvsaMtko8YPV1QBRX218RSies1PvQSh9wHIdAu
         3RZp6TSiiG4DsLHDevE19I8hpUecJEC15Sowe+h0Lux/ursmWLycz8NK7Fk4g5orurBa
         CWgHWnXr8fumizPoJ9ml0bk9wOb0slJie8wFhsTdYAdaWtIIc46etjk7KM8OB+9kTBqB
         Nkug==
X-Forwarded-Encrypted: i=1; AKwUvBzeDgK9HjPKmNicGoFjI5C8FMmcCxKNS6lr+1bkcdm/3PqvJ3lp9rZydGCb1iX1o8m2ssQF9ZTr44zQQBQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mTTowfXWtyT3hqRvwdAs48wGucA6VZRMbIcutrzAyQwqx9yMR7
	fodl50jAMcUI2dE13bSIqZeRZ6+jlmeWiz3sUS7lGNnDg/ePX1DMpgUZxnH7GIgg3DsPnuqMWyZ
	uzTgeFhSrePMU8V0qdDossU0VN0HVdiY=
X-Gm-Gg: AYBFou0kWGM7xji+PKv7g3PEHp1cgumv0BapSFlEUH2a6STy81VOZKyLI03Q/MFf6zt
	KBFhKlEQo3uFTAzeBvXa7Aeb/N0YcO7R33O7P6a65syO4vS5YmhgiwHVAxxbVuWx88kftHyGzWc
	r7r4bzd9qR1OKhh5XO7jz0dERtvx8cS7PcWOommKm0dLFOo+qBi2O2jibenSAzR3NQCHJwKKFXx
	56EZNFAXopqT3JJXNvu4CEvqnuZnKPUXfssaWBrO1cMWVU1Zimga95HyMdPbbtfFHi9mDwBaYIg
	UhmQe+PMrvE/Ip2m5OkBUBORDGs0vpfqJbZgWd+ciObJXQ9jBbskoJbp8toDEwg7jBWZwcIhZPd
	EU4IYkSLM3DNUHtRjmdtXyEWp40gwmgy0T5Nm6JtRqOxx0TZtJ0YuD8XtlXN1R510Ubk=
X-Received: by 2002:a05:6a00:3cd5:b0:857:72f8:dc99 with SMTP id
 d2e1a72fcca58-86b328e7f63mr3298126b3a.26.1789095651223; Thu, 10 Sep 2026
 20:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910114338.142682-1-phucduc.bui@gmail.com> <2a553332-735e-4372-8d75-2ed7d095bfc0@sirena.org.uk>
In-Reply-To: <2a553332-735e-4372-8d75-2ed7d095bfc0@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 10:00:39 +0700
X-Gm-Features: AcwNN1WPfGjfjTJ3UBeJ1SZL5IZMV3aP3IQW-IHMbnVy8yqXjU0IzHMcAxwIYp0
Message-ID: <CAABR9nGdsKvay_3Cd_Lm0DjU6MiFL0zaC+ftpgQGaX3YtVe+DQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: common: Propagate control and DAPM errors
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Darren Ye <darren.ye@mediatek.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your review.

>
> mt8365-afe-pcm.c has:
>
>     {"HW_GAIN1_IN_CH1", "CONNSYS_I2S_CH1", "Hostless FM DL"},
>
> missing a Switch from the control.  I suspect there's other errors; this
> really needs to be tested before it can be applied.  Given the general
> quality of the driver here and the lack of anything constructive we're
> doing with the errors changes like this have high risk and low reward
> unless we're actually running the code.

I agree that these changes should ideally be tested on real hardware.
Unfortunately, I don't currently have any MTK boards available for
testing.

If these changes cannot be properly tested, I'm also fine with
dropping this patch.

On a related note: do MediaTek or other hardware vendors typically
provide development boards to independent upstream contributors for
testing purposes? It would make it much easier for contributors like
me to properly validate changes like this one.

Best regards,
Phuc
