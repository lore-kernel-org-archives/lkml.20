Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794202894;
	b=yKnAzQCtZ1sYK+lMzm85EnuPwrPO52LfJP/MtQevVXcS6iNaRlhLrrzW6u4bYo+OlMHY
	 7Bye4+qwDs/4Hru0Wv3WV1Z0A3v/n0JyvKywUYx/q+5Lc0YdRTBQDngTwjm0P7snxmpXx
	 kXGOaxCP9J+zUl4nDSam0rT04XT2JbAuWAiN0WrR2X1FZC7sRxZSta49mhqhtfhavCl2h
	 eMdZTTdm0KMyf/YXrxp6urGrnwrt3Cr5ChiyJVLLL55RVvA5SgDkjMi7dzIew6fvu431d
	 ca2L2Eige1h+E7kvWJJv5TnIki7Ia0h9pMychDPPc0YAFJlWqf3Art8Ud7v2j7Q2nWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
	b=dnX+DMsfcaJSXIpU+OZNysd0Pc14SetUfWGASmUaUwqgS9zbzp8bl7BrIxIIZF6IruZN
	 zbuu7kDo3Gfr9CndZioc4SsjvF4IJIBp2wEAJf/SPZQcnWgQjDUXRXACNASUL9Y15oMS9
	 E3LgKt54Hfd62bYiXZ5ut9j/piK9QwsXOVOz01cv6TYzZoR6r1aPHnmfNR6HhFha5Iozx
	 eDG1AC+C2ZhDWYbzDmQ9BwpM3JqagHpdnnepZwJoAHmwHruqWs1rZ+iik5wCHiA5a2vy0
	 VujlMphOLmEcWW1ZHfBI7CNRvJXvJYAACIXoZjorh9roMlbj4SMW4lwirHQqWP009kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ixTT0Vsl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8A1606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA8A1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ixTT0Vsl
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-677bc4704cbso474595d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:41:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794202893; cv=none;
        d=google.com; s=arc-20260327;
        b=H/d54U3K0PYPFjzIHbDoJM8nDoQucF5elb91Cxc1wlrMvZNGro3nAHAq4iN3Gl0T0X
         xzzAa/x+D4hosNbfaTdmZcbzozVn4TXTmsc2ejuIrsXi5lBvNPqDNmhQlwxNgszZtxGZ
         GYsYIpI0fmQLHSNhNtQxZgMH8lttnApZI4IhuWADGI8xJYUfu627fozydFujAEvSMqj8
         J6leBpQWsURHAQDB+3hQ/LKOcVtB70WiAF5mGMN77X5ZpXKir4tRvtlWqyRX8wHf8oS3
         fgzMzGy6Mlz5m5euh9rPvGElDSSl1qJPkAVr6ncEF9ZfrXNgy/C8NqBEONsH9jMKMPNr
         Of/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
        fh=w7t4UuFx8ZpyuzzvYhslpMlJobCqWDV1fvLXu7y+v6k=;
        b=GJeYEjBuUadtcb0aJGdzgJvp1VwksCJfI/OQqBPCMCzC1LCbjUG5rGBMVSnSkw6v2b
         f/kVVDVuEgnRGJ9LrodUUFD6PnJaj6v/iw76jShzPUMrdpXkf71zK1OqKYUIn/GAbzeb
         M8xzyVt8KVirb371JT5BqIKl2JvDB9VaW3zcXhzpkxeHFfSEl360txhtRk56kWXYSou8
         3GBkbbgU4JjfnvtsLHZbp4hrn2EX/gN7C6B8mkEcsSU2+es0Ye88NULJjpNGxs//CwHL
         Bszn3/Cb/2fYE+qUrm7fvF7CMXHAENNNTrEFXv3pds3YM14m+XXOIIUTc2UWLy6k4l/d
         OJnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794202893; x=1794807693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
        b=ixTT0VslnQORGwqIpda8mBfOWdfApgIl4gRZI/m8GqCr9k4vgh64erx6ypah6o0/ei
         FQqLI8k1GNwoShoSH0KBqfUziMxq4Ouh2W2Y5bKDiFEJ2gweCdL/io5mWG/OmENupnE4
         dgOx6HmnuVCdpk4b220rL/apfUh5F5gOC4pc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202893; x=1794807693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
        b=zR5Q/8d2ps3kHyEtTGhzJSpD1EY4pTH0ZFyqaNx6KOqNmfcWY2hH1x37v/w1YWLyXv
         GLTyzeGW//Fd87PnN+sX/SQqDipFByk/u2Df8laYmGm0WZa/eA5rt9gkTJHwVtIaAwl8
         7OMDp18/R9+uCrrsb5UGN2Ym3MihElcGHo9dcvu1TVKbT4EBcLtv553Kw7HRXBXjhyMl
         /kBsFLUeJPtTodBlgpqxFYxkQ2Hb3WB0PGnptk4nP1Qghx+hXTbNathBtRuGj21sAkpz
         8MMZwe3ylAyhjIuR+EPIdn2HcXhowB8Mk/bSaU5VCpKCLUgjz9g9UocwYTMWUnmJ/qkt
         ypQQ==
X-Forwarded-Encrypted: i=1; AL+hErFMPX38d5dR2S8pNNpzSTTX3Fhb2sO4HnS9HID89PyDSljFWN1s1lKFwucRtyQnG68QZ2l6+YH/Anlcb/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+emQjMPewJ/VVcwoCfg6Le+I+iPrNbbG28rJClTAO6wFRehqsb
	C5tNBHMqhVracPzFS8pZ4GZBk6dwRLszPo74dmMV3CPp/SUFgGby8Gz8TQFiBQgA0V1e6Ubq33F
	BLkJOfG6dp0yDsHtCRxmQqk2oZpiRrQY5Z6NHTIIU
X-Gm-Gg: AYBFou2OgFaA6rFBr/uzNb18FDvVvwZoLlsUTzXLfNQ7UfuUGtAj3ZajtUr5BIzyxQf
	vaD5GDfcdJ7AU55AnZ2Kgc9gG6O+FE1ZYIQNqpk95LwhrwrnzlToezgXwuI7uW9iNcK3hzCoLrk
	0Dls9ad3w9W9uFArP+ptQZkvU7dgAFDlTnUYwuYlGzErUGgq36s+4wnSrxUR1KK1ridwqN9mtlg
	p8tkzVsFBdrS378SEE7OhheWH0NCupqKeSkLHAtCa2pukNiu54NeqH84YM84u63+Rw0coMUObRr
	EgSax1gLHAsR8LlVDpLKRJLNX7BpbZhpZTkI+WBuZbTfjgzvHP67t8pn3DEi+CWtPXvOmyb3ceN
	orq/rKi0I6y6vj4bntOXGTTh5+ww9VkEMJjbvRA==
X-Received: by 2002:a05:690e:4393:b0:67c:10d:e377 with SMTP id
 956f58d0204a3-67c3d97b42cmr874807d50.24.1794202892850; Sun, 08 Nov 2026
 21:41:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103043734.2179858-1-wenst@chromium.org> <179406980914.3424803.6201831446824678583.b4-ty@b4>
In-Reply-To: <179406980914.3424803.6201831446824678583.b4-ty@b4>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Nov 2026 14:41:21 +0900
X-Gm-Features: AclHuK9Uis4PjHZvlrrahSmg0-iKCJazl9kKs9oybOBLW0q8BipFSNFJ0jiQ-bQ
Message-ID: <CAGXv+5G1SozUuj8v64oD07wz6dFbY+bXh-Q3OVvieY7v41ZJ8A@mail.gmail.com>
Subject: Re: (subset) [PATCH v7 0/8] arm64: mediatek: Chromebook trackpad
 supply fixes
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 7:25=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, 03 Nov 2026 12:37:24 +0800, Chen-Yu Tsai wrote:
> > arm64: mediatek: Chromebook trackpad supply fixes
> >
> > Hi everyone,
> >
> > This is v7 of my Chromebook trackpad supply fixes and optimization
> > series.
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git =
for-7.5
>
> Thanks!
>
> [1/8] regulator: core: Add "enable and wait" functions
>       https://git.kernel.org/broonie/regulator/c/9f9bcca6adc3

Thanks! Though I was wondering if we could get an immutable branch
or tag for the commit, as three other patches for separate subsystems
use the new function.


Thanks
ChenYu

> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>
