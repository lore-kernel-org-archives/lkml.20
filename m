Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582507;
	b=WI9uoB+Ir4/lExpj8QTn5UA/fHwmm/zGMLOwmhlv1xVRnGGI0s0yu26yne6GaqOfdu5d
	 iwisVFgE0EmJeA1cy1gV5E6k/C+etZYmC8olP2fhy1tyk6tNpow2YO6bBNAshiwXaUArE
	 IVWxNAetPKUik2+nBtvZzVZ0dm8eq+9ibxypoer1tH9+boDrE6ocbcNtd+5w+i2ziOy7g
	 PVkgL6K9Kmfdi1KFU1/HnpTekIeET/OEMPnaA6UrdbBpiWDQvHhX1FaMhbW/4ZJOp6wbl
	 ERx9hAFRM0Ka1wv5xemVtyq1eGl/OztIebIYUTAhPdA+jhqNs988i4nv0xFgRxDrfrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=tMS5aLY2Z+3tQAqLP7LykAdZ8VYJEKXYYcPg6ZE9ZvU=;
	b=rTxNX5AIMS47ivy4H6EPWYm/P8DtzUMg3djl0QhCV8sLPK7DkI++xDA1bKm4qyr79ko2
	 HVpqdTcsH5KQq4YJLBeV55F2jlMJuVQDi6UM0p0wCZUhtdHpViFeY4hzFc5AyIYdmRtpq
	 GG7BmERujk5Bd52bfHSCqrKcACU6BDaVSrfpEYOgWz5FE5MRUXtt97aaZbNWY0wagtVqp
	 oA8wqJGEsogGqafuoT61IxZxu8NVHxpqjQMGpmhcLGqcl4gg8tOHOm532GuXjK9hHWiGY
	 xpxM7tg2Gwz7Zxwc6BAFL6Akdj23ElT0tNnFdLufBxG/YcDIhl3QreS1BgUSE1OD/gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=m3kxISsQ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9561606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9561606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=m3kxISsQ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a208d93758so16968245e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794582505; x=1795187305; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMS5aLY2Z+3tQAqLP7LykAdZ8VYJEKXYYcPg6ZE9ZvU=;
        b=m3kxISsQgQk96b8Cz6OeQDvoEHKPE7mus3brdtZxd2FfvsZ8AUonE62hzidPdqQVAh
         MPrvpWxX63j1HY98GEiH4I9kD3qIKX/ZdaNtzU5ZFPJBmb3Ij66D71M+2KsaGZ8qdJds
         x6zj3Y59/+/frZF6+Mt9sgxOT05M6Ruysfpect75nqZGko92KCsJso8/WkSZF0x1rnLp
         QPmmzqTjyHnuJWyj/xxG54UCbJFIXqMIZ4+hOmtIGcfT8TNHgUayEiUaGSw0woiy5QIi
         JJzTKaOep1NqDJwb2dOFLZEyAjgiXwHAzvUsvPMSI35CO93Rk68g5gLQHt7xD3U4CfVl
         j0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582505; x=1795187305;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tMS5aLY2Z+3tQAqLP7LykAdZ8VYJEKXYYcPg6ZE9ZvU=;
        b=Aw44AaVxgZpeHHPFaZHQnMchnBZpvnmuAtf8UlzMcoYmMHyBtBi4iNI+Tfbz3bA6qs
         mzqNik34QBDalJ9nGxg5xhy6eekT7wbbjwCVRI/Ltv+BVWx8Xxpbz+IJzbcfcchyGkBu
         7iassSl9auGbfRB7bwLfCCvT0ev0lHrtJVmuy/sy4HJmYkc3fOjDXm/EvEGZ0Jod9Tzi
         GJP1Mzk7nqUttCVwg3kT0B1EL+K/9PZpffErchHMot6DR9v0Hn0dSgomv4yshWtumcxW
         a96pHXyp2kHvOh2y5SHcKMyIlwKzCuJCk6sjAwQYiA5A9pSREsLoMAK95zzbCFGjRRHk
         nNPw==
X-Forwarded-Encrypted: i=1; AL+hErGrJv1UTPYV74TN1BRYnxqkPJuXMCyF1w3ClQs54zkgD08O1MGuDv8NO+TU/5DyXDuG3VAD0+wa+xo+wXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zjL47PaEMwsmjUZBAQrb5jipLB0nAZpO0SWypEjGz/Ce/sxxg
	J4ECuCZShdUj6EdVl/hKYdw3YbLpuOEqlT6/L4UxEBGqUAepIyeSqh1Vuwz1siVLJHc=
X-Gm-Gg: AYBFou1MbzbfrByACRaGt5Fwn91Hm+0dr3w3Xmxi35LCo8kCoRP/J3emcbGIK985WIR
	9k1yhggqvLu1HXamUaTQOU6simr6/udl8i2d48fUMMdOlKC3klqzKo3EMNqp5hzim/WAaAh0KsN
	CdhRjq7FF9hPVGyoQUeTF/j+NSb3Xmvn/49MgEJnMS+Do7nf1xL0Kbu/EnueuCOkmy89OMPXutI
	0u6S6wG78JWUiCE+GpL43GcAZqomD+iJMLfacuNlk5jKo+nrH9rpyyDFFjU5o/k+ngov/mYlEAS
	7prCjsH2m6ABZn6kEnH+BWkdNiXXdpSxVyhssczxp1SnqynRERRYy2w6QwVkw5bNlyKkL6ueUjP
	nxDk/BzRiuNXdf1aJE8RLVywub8TXRXkTp+Nm3gzlfu5SQz2I8ucmqB4kzzO4DMUXSEeKtDPMRT
	TfPev/klnFS7ec67ThOiTTtWpPZ2QMJ3M0G4qw6YxHTMibECTNLIjYL4164AbXK8j2NyWN0Dm07
	z3INIkkJEBBo7iW4HtSVaW4t2By86tE9K98a0gmwsbuKLwq3bMWdDfccgx5Gjc2jkK6jhl9pBaS
	yUPlCTQ/5i7AHhGOMbnFptwWRTlJzLEoHUeh80kehM+mciFM
X-Received: by 2002:a05:600c:e558:10b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4bb55a96404mr41192715e9.23.1794582505212;
        Fri, 13 Nov 2026 07:08:25 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5d2872edsm20860945e9.12.2026.11.13.07.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:08:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Christian Hewitt
 <christianshewitt@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Valerio
 Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v2] ASoC: meson: aiu-fifo: prevent sleeping when
 spinlock is held
In-Reply-To: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
References: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
Date: Fri, 13 Nov 2026 16:08:23 +0100
Message-ID: <1j33t422hk.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On ven. 13 nov. 2026 at 14:56, Valerio Setti <vsetti@baylibre.com> wrote:

> dai_links in the gx-card are atomic which means that the DAI trigger
> callback is called with the spinlock held. This means that usage of
> potentially sleeping functions (e.g. mutexes) is not allowed here.
>
> 'snd_soc_component_write'/'snd_soc_component_read' take the component's
> io_mutex on entry.
>
> Replace usage of these functions in:
> - 'aiu_fifo_i2s_trigger'
> - 'fifo_spdif_trigger'
> - 'aiu_fifo_pointer'
>
> This is meant to resolve the following runtime bug found while starting I2S
> playback on an OdroidC2 device where the kernel was built enabling
> CONFIG_DEBUG_ATOMIC_SLEEP and CONFIG_PROVE_LOCKING:
>
>   Playback device is hw:0,0
>   Stream parameters are 44100Hz, S16_LE, 2 channels
>   Sine wave rate is 1000.0000Hz
>   Rate set to 44100Hz (requested 44100Hz)
>   Buffer size range from 128 to 262144
>   Period size range from 64 [   21.012074] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:623
>   [   21.018009] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 267, name: speaker-test
>   [   21.026184] preempt_count: 1, expected: 0
>   [   21.030151] RCU nest depth: 0, expected: 0
>   [   21.034205] locks held by speaker-test/267: 1, last CPU#3:
>   [   21.039638]  #0: ffff000003dbd910 (&group->lock#2){....}-{3:3}, at: snd_pcm_stream_lock_irq+0x40/0x60
>   [   21.048782] irq event stamp: 5274
>   [   21.052059] hardirqs last  enabled at (5273): [<ffff800081494240>] _raw_spin_unlock_irq+0x38/0x80
>   [   21.060856] hardirqs last disabled at (5274): [<ffff8000814935c8>] _raw_spin_lock_irq+0x80/0x90
>   [   21.069481] softirqs last  enabled at (5238): [<ffff8000800f9aec>] handle_softirqs+0x584/0x5e0
>   [   21.078020] softirqs last disabled at (5231): [<ffff800080010324>] __do_softirq+0x1c/0x28
>   [   21.086133] CPU: 3 UID: 0 PID: 267 Comm: speaker-test Not tainted 7.3.0 #2 PREEMPT
>   [   21.086141] Hardware name: Hardkernel ODROID-C2 (DT)
>   [   21.086145] Call trace:
>   [   21.086149]  show_stack+0x20/0x40 (C)
>   [   21.086160]  dump_stack_lvl+0x6c/0x98
>   [   21.086171]  dump_stack+0x18/0x24
>   [   21.086179]  __might_resched+0x160/0x230
>   [   21.086189]  __might_sleep+0x50/0x90
>   [   21.086197]  __mutex_lock+0x64/0x8a0
>   [   21.086206]  mutex_lock_nested+0x2c/0x40
>   [   21.086215]  snd_soc_component_write+0x38/0x80
>   [   21.086227]  aiu_fifo_i2s_trigger+0x74/0x90
>   [   21.086237]  soc_dai_trigger.part.0+0x44/0x90
>   [   21.086246]  snd_soc_pcm_dai_trigger+0x174/0x280
>   [   21.086255]  soc_pcm_trigger+0xe4/0x1f0
>   [   21.086265]  dpcm_dai_trigger_fe_be+0x30/0xb0
>   [   21.086276]  dpcm_fe_dai_do_trigger+0x11c/0x1a0
>   [   21.086287]  dpcm_fe_dai_trigger+0x40/0x60
>   [   21.086296]  snd_pcm_do_start+0x4c/0x80
>   [   21.086307]  snd_pcm_action_single+0x50/0xc0
>   [   21.086316]  snd_pcm_action+0x88/0xb0
>   [   21.086325]  snd_pcm_start+0x2c/0x40
>   [   21.086335]  __snd_pcm_lib_xfer+0x660/0x810
>   [   21.086345]  snd_pcm_common_ioctl+0xa20/0x17e0
>   [   21.086356]  snd_pcm_ioctl+0x3c/0x60
>   [   21.086366]  __arm64_sys_ioctl+0xac/0x110
>   [   21.086376]  invoke_syscall+0x5c/0x120
>   [   21.086386]  el0_svc_common.constprop.0+0x48/0xf0
>   [   21.086395]  do_el0_svc+0x24/0x40
>   [   21.086404]  el0_svc+0x54/0x3b0
>   [   21.086414]  el0t_64_sync_handler+0xa0/0xf0
>   [   21.086424]  el0t_64_sync+0x198/0x1a0
>
> Note: the return value of 'regmap_read' in 'aiu_fifo_pointer' is
> intentionally ignored. Regmap is MMIO here and read failures shouldn't
> happen. Also 'axg-fifo.c' is doing the same in its 'axg_fifo_pcm_pointer'.
>
> Fixes: e8712315c44d ("ASoC: soc-component: use io_mutex correctly")
> Fixes: 6b59c53c8adc ("ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop")
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
