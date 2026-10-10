Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0941E36605E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791607268; cv=none; b=r8XJDsRPCMbNVLkkQ+4txLQSjqkECdlSVTF9sc9D3GMbac15aeb7D8+9k+uLsGv2D9vnlUiS/lFQhX0giOxaW9plFAv1IKj1UMH1XpRVHwsNyUty6RszyHjQ7v9ZZayseQZpWvfwJKeUAZrw5M7csPfxdeQt5gznAZlor+dPbXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791607268; c=relaxed/simple;
	bh=fN6Fd6o/zCGIvEnXn+MFZXCFpeQhWnuklflkSkR1o9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lApMZp2PIOs8Zzg5hHtl+2EDW5Scb3SOGdw3I9Mcy70aluzTvXFXCs+cpOdHX+H8Agky7+115YhOrhFq4Ebe0rVwPaPnwMqQZNOUP6LcpBgEK8feNzKON4EQArjpWKCgBOfcvCiX+no01NVfc25QqFw4to3Tng1aF85bQQtzltQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgXpbpsI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgXpbpsI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dd76b1361dso1848805ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 21:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791607266; x=1792212066; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sNrVsnb4FmKFTXfrSdVYo8TWlLsGj3AF2yF7SV7KZcs=;
        b=cgXpbpsIUhdnGLr0Xnr2XbrKl3aZBSQOy+cfu4YeYjSd2m/EGp9Z8DXn7615hhnE5o
         8nM6db8fYoqCFKwrR67Yc77ymryNZrK/6hWWzYDQOmYHHqKDWhP3JoAJzIcfPeBsEChQ
         z8ZxadZXhoQHEm4N/tFnvuFh1c/q4sGVB7CapuQ/ZJK2LZie3AmC9j41fD5TaNoVkXCC
         xrAMiTAGRKJsMQwmj3rwfHYf29Mmjfvw/WP/6PHdpz363gnlBTQe8rn9UTbHtbz6+LM9
         naCv2PKfaRM9XksGwpydYkOi0VJTbmXdew3ZL0iNlcrKj71xb4qIxCgoUar1UqBooume
         urdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791607266; x=1792212066;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNrVsnb4FmKFTXfrSdVYo8TWlLsGj3AF2yF7SV7KZcs=;
        b=LmpH+3AT30Jg+EJfFj/KTYG76MCEyUWvu9ZQurVmbR+UQ0lRNv9UiGRK7J4Snvmr5U
         MuRLK09dhM9qo/IhsL4FdID3knvZq6rLbEfHUOg0AYbsyO0jV6+oI+rkL5UP2lYYMZ83
         W9tQPO3t3vMfWIKxo9qiidDHoG5K9vrGI82Brw/mjsg4BPdl9Z3XuP949mdMNvuP014p
         1O7yCL7TLSmwzcNOaI90bJE75wCxlvUOwW1oN6g23cwgScjWcfeClE82tI0iMTrsw4+6
         Bqm24a/rg+mbt9YcjXYIqtMYbyLRzT/U4oRsvQj+VA+LXWbTRzJqoSucuDwhSHnSU7Pe
         HiRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzG4C9G+w2hCkBUfujMVm/Kepz/nra1JRmq+HQ9cBNOAxa/e7HMYl52rg1C1rKV2zC6PJCCiFEwDgtTru0=@vger.kernel.org
X-Gm-Message-State: AFq9FYINa1kAD/yD6fKjqmnCUDvd9BiJSptFX/vSki7kLmEphd+yq+Gl
	PQUOmDUCRRCpG8HNM/oQIUTzzXB5sY47EsxZzdEQeW77qJkYD0b14+LNHjTh4fcU
X-Gm-Gg: AYBFou3jqIk7a7kX/sHJMSrRDWJcyEdYZRmeUEQVb0E4vRecI2s0tmZpjFeScYO25L6
	d3UPyvy9mexHlLRo4o6vi0rYP8zhdxDyJeiJ4aRMjbBa62NzOk40HxTCjHWS0HkHxPs5COlcSfA
	/aTjR1EAefPTBt34pLM92iQx3hK0lYPbTVRsxzU2Ld6uCTUIv8RQhkhJUY8hJkYQcrC7eG6Yuwd
	QP5NlWDZgj7htFuzCM02vqZAxgS/67QSCCuQswEdzgwpqqOah23wf5MgimEAIrmHxTA18vYY9jp
	Y1syx5Bm4XKTtjHmOjp3Iw4xGdU5cOgYa/1ZQ2i6FwIo53eG6m1l56r7zpF6RGDLmDAc0AmFs71
	OmpmACJl8RHqH5rJm2aGkbQQbt24GGlkmFKF/klLcfu7QeIGDsPz2Lcu8OnBi+1jKNk1i23T3md
	0K2edptSIzqSygmMoHcmnhYdYcPuUnIp7ozcq5qvfAebsIWC3m4aJkOoJMnyr6FoeTeitOIzhMQ
	W9dXxkfkO/17mgAc1N6nrQYe1rIKjG/9+I9QMsLe/mg/7/z+LW+sqMwlfKz6HFvbybl98sUGkoU
	yPABJk/saDTlQqfoauNm9Ek8aLPBM5KFxeNR/Pt54MikthSt1Nk=
X-Received: by 2002:a17:903:1a0e:b0:2dd:8639:9931 with SMTP id d9443c01a7336-2e842ab8200mr30793065ad.19.1791607266248;
        Fri, 09 Oct 2026 21:41:06 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e171bsm19910975ad.73.2026.10.09.21.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 21:41:05 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>,
 Sasha Finkelstein <k@chaosmail.tech>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v2 09/21] ASoC: apple: Add macaudio machine driver
Date: Sat, 10 Oct 2026 14:40:54 +1000
Message-ID: <l_pd6lBHQaWNYoohhfxhFw@gmail.com>
In-Reply-To: <3698d260-13c5-4050-8f03-61f7b7185514@intel.com>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com>
 <3698d260-13c5-4050-8f03-61f7b7185514@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

On Friday, 9 October 2026 9:52:09=E2=80=AFpm Australian Eastern Standard Ti=
me Cezary=20
Rojewski wrote:
> macaudio_dpcm_hw_params()
> macaudio_be_hw_free()
> 	both can access the card from the substream/dai without
> 	relying on the ma-context
>=20
> macaudio_parse_of()
> macaudio_parse_of_be_dai_link()
> 	called in context which creates the very card

I have fixed all of these by copying what rockchip/rockchip_max98090.c
does to initialise the card, however

> macaudio_vlimit_enable_timeout()
> macaudio_vlimit_disable_timeout()
> macaudio_vlimit_update()
> 	called in context of delayed part of the trigger() callback.
> 	I'd need more information on the trigger() implementation of
> 	yours to present a solution. See the comments below.

are slightly more difficult to deal with. These are called from workqueues
which only have reference to the driver data struct. Other than keeping a
pointer to the card around, I'm not sure how else to deal with this other
than keeping a pointer to card around in the driver data struct.

> Please correct me if I'm wrong but it seems the scheduled work does
> speaker-volume operations only. Moreover, it seems that
> ->lock_update_work may schedule a follow up work in form of
> ->lock_timeout_work. Are you sure trigger() is the right place to do
> volume-control in delayed manner?

The intention here is to activate the timeout when the stream starts
so that if speakersafetyd dies at any point during playback, the speaker
volume(s) are limited to prevent damage. We only want this running when
speaker playback starts and we need to disable it when that playback stops,
so trigger() seems like the natural place for this.

James



