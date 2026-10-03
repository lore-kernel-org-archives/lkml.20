Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A949384224
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 01:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790991261; cv=none; b=YEmC59ASA8ZuIo/6zfQtrm7L0fBWr4gtrXvl8EDENl/InfKuckqrb3/JVjAxFH1zm5EiRiFScoqyap0FEcX5ScW5vlka47dIgWVbhjSWwnWQ26r3u2JBZptgKhksFOuRzh2bexG5s6JIF7JNTBth0UqBicqJL5Kj7S5feBQTVhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790991261; c=relaxed/simple;
	bh=dcN4JKaX3uG/6QlpJtazZDraUxMMRgZ4+sja8nBc76w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=liC167OTsHIljnqwjKXAUKddT+mAqSzdWi9QWPcOWeXrpdnXUrwYX1tnf+r9tT/1aTirT9fHSyJz6vlJ4OmHMJD4iIiRx5/4Prinh/t3l4YaQ56/w4XGpv+65A2jG7WGdQEYGXJAa3BQcIBIg88eEK4jxos/b/ANPnjVyQlSzHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBCeeAxM; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBCeeAxM"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a7906f463dso61474a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 18:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790991259; x=1791596059; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcN4JKaX3uG/6QlpJtazZDraUxMMRgZ4+sja8nBc76w=;
        b=rBCeeAxMVC5Sef65H9vBQgzgLJ5Iuz5i+u9KP9ZbsgkVaF9IVCmziTpiZO/K7/kw8B
         ffZspoG0G6QjEvUiqLsLAJnKas3xCiyfcS4QAA71Oy18uQMPt90KFNAQ8/umj/+0Qf8o
         8HyRhH+TRthDfw0dnR2tJUzymmnT7Mnn8I3qABpkvuRbS80y8j5hDEOsplYfClY1lgfJ
         KAiCmCxNnYa/UZjLposP5NPjFzjCIqzK1PiGauuxavqhiDK0hVySvtzt/vQoI9TYTINh
         nHaqu+iIJG5nlbXV2v4GRVvNcVubHzSZHt2ZcnwJnZPYYrhenlLhohil3wjArpXuzwK8
         j8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790991259; x=1791596059;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcN4JKaX3uG/6QlpJtazZDraUxMMRgZ4+sja8nBc76w=;
        b=LxmTosH5kjjnlM+bk3k9OcY7pcq4uuBOTCAzDdVOO5dqDXkvIFyZyLhzEYh09eWavj
         vVywJuVoEfJWm22wJQvXo4TMm0zEQwcl1vWNxRFZJa+I8mOEOiuWYcTCa39ZNYD1vdcm
         v5ij3l4pcbVQYj9Y/wc/4Kf3lyEIG4djQV0PYE64U6gpQJeXy7rngK5Nh3ELW/t2Lc2a
         hLXiMmgyk4Ah8rs/V6QBHvtG7pEPbGlm+sYDMANdJSR/PEuV8QPHRnekfu6LZwWoknMp
         MuSgQESMSyGC2ALS+x7vzSiBSpgSA/Mt6SsGCIp44MAX3mQ9dxKnRqym3fLy9Mmp/O3V
         JUsA==
X-Forwarded-Encrypted: i=1; AKwUvBzUM/DIUYCebVCpN+edjLJ0sKJsWi49CnWK/Ra6nRgGyUyv5Anj35dOUquVeUF5mXyLkwwr1sAigzmwyyo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/JxARG5ycUjmYJ904Zm5h8R3CU3QKzmUbDkjdbe5OEoUcQxdj
	7NKLnE7dQbWY1tig8CAUZVlHVJR4la3y27JZ/9jmoIQWge2ZMQQQKUwW
X-Gm-Gg: AYBFou0qyCSPCxrAO1o3xrRyS7RAVAk+1gVrybQRtZEqts6wgJCYh2JQiOm/Wq4ihbK
	/zrqJR7KJUTV/YF5LCSmQUmCcr6xmCTicBS4H7j9GZJ4q+M452+46WA/3QpWwiK2ppd0+/XizzS
	NW9LsG4WlRBFh48TreXykga0gkYUkd/1csA+fOLJF6WZ/9gNl3D1A6fOraAllFmjtFekkk0+8uV
	udOkoR95TKiQM0vPhxdiJT+4D6hCmrD03TdABrhoRMUK1ag5qMnAf3acAGmP5rPUUBPMDEV+Yt5
	5QU0CdsaimTRiRUASivZTt8qn0CONqB3qlzYNt7ypu6+NTajwiftNZ0zUYAMI8TW/pP6AglNz14
	0+7R2ajH/294tp0w+PE9QImggIcN3BGr7ai3cxr6aR6JLXR/OGaltGysnuxYWnrz7vxM3KVGc4K
	EUiRyE0Nxk1BmCYFU7LuReolK5vQdlrk0/XCsQ5Ard+9N9bzl56/PSyHxv/sdL0z4JkKwDs+19R
	vumX875ECNABcxAhJ3DyTqdJbWRHTQvOQ9Von0hUpcKJO7IAVhWD1vddFG49kEiBmmobfGfizSm
	WsUIb660maxJndtyyFy6eQhWf40IyfNIz0p+HYrwakT8YNTL+yE=
X-Received: by 2002:a17:90b:3c44:b0:39e:6c6a:6577 with SMTP id 98e67ed59e1d1-3a6ced75f41mr3500888a91.58.1790991258652;
        Fri, 02 Oct 2026 18:34:18 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm861575a91.7.2026.10.02.18.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:34:17 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>
Subject:
 Re: [PATCH 08/28] ALSA: control: Add kcontrol callbacks for lock/unlock
Date: Sat, 03 Oct 2026 11:34:07 +1000
Message-ID: <u9VW29vaRPGENsSTq9RHUg@gmail.com>
In-Reply-To: <878q4k2xl0.wl-tiwai@suse.de>
References:
 <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-8-741cc20a74e5@gmail.com> <878q4k2xl0.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, 29 September 2026 7:52:59=E2=80=AFpm Australian Eastern Standar=
d Time=20
Takashi Iwai wrote:
> On Sun, 20 Sep 2026 06:53:47 +0200,
>=20
> James Calligeros wrote:
> > From: Hector Martin <marcan@marcan.st>
> >=20
> > This allows drivers to implement policy around locking/unlocking
> > controls, such as enforcing that a group of controls may only be locked
> > by the same process/file, and taking actions when the controls
> > lock/unlock (such as granting special access on lock and resetting
> > values on unlock).
> >=20
> > This is, in particular, useful to implement volume safety controls, such
> > that only a particular process (that locks controls and completes a
> > handshake) may increase volumes above a given safe limit. It also allows
> > the volume to be automatically lowered if that process dies (which will
> > trigger an implicit unlock).
> >=20
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
>=20
> This doesn't sound like a good approach to me, and this looks rather
> irrelevant with the purpose of the series.

I'm not sure what you mean by it being irrelevant. A significant portion
of the machine driver is dedicated to implementing safety interlocks based
on the functionality added via this patch. It would be impossible to prevent
badly-behaving users{,pace} from defeating the safety guarantees made by
speakersafetyd (and thus permanently damaging the machine) without giving
speakersafetd exclusive ownership over the safety interlock kcontrol.

Is there something specific about this approach that you do not like?

>=20
> thanks,
>=20
> Takashi

James




