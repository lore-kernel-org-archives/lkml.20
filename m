Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794606573;
	b=gS3WzFjXkr0NNXfE5hbCqDQut0VLKyEfXwPi0lsDGSYXWYPWzMYp6iWs1Y2BOsQbGzx4
	 lVe3SGwDmrO1srRKlztSZ9PVCFRji+icy4GD5L8Ia7QRMv5m82Em1+VhZUa5pFh4i4jRZ
	 Zh6HagZe8t85sz3UGLPo2TL2Q51utc1+ZX6eyI8tRY89IpmhAdwVhVzciiCyIvpwj9Uzv
	 hfGSyVBb47ePbBgX7s85R5NsUPEffijbRC1mkb/Whdvd5QeJu4xLVGVYrO/8FOjzkCD1D
	 oYo6hjx/ZRB4B/liF7HK7TbTkp1j0MabpB8F/f5DVkHFtpw06uMBGfoTUXN/DU0VHAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3L5/R0TNdPI9wKc9dod6srzOhs1ZLS+127xQ0nrb1+8=;
	b=t2VPsY+Tv4nE39IqckIbecV1WTSYkTxkjcoprAUZk2eR/m3gBQeS+Y3+bnvPc/9A28uC
	 J6r5vTgK1kJKMti5PwKvwVuFrdqoE449tp8XRoCx/MylCIltOlugsETqPnwFwV5Rii9HO
	 gO4jSQ5lsF3CXrMZHjIv5iz9VCje13ThdprO+E7aT3eI4yHgWSvpPlR7ne0WJmZRUq9ah
	 XleC/X7G6Es4i2JbATnL/Gju511qrOzl+j6z1N1DPlHsRFrL/rU3Idy+oUhCXzrNxPc0J
	 B5yYAo0l9J6XtHQ87324Cx9S7CQ2EtdcXdxBkSmLUHq9+tcY8LXfpgEwJKTqf7VpbQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=QF5Crfkl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170A0606A898
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 170A0606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=QF5Crfkl
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6767d92cde6so1626987d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794606572; cv=none;
        d=google.com; s=arc-20260327;
        b=nGWg6SZWh5iQue1qMGH5KxiFlfIP43iyo9yL1Q1euJISjl/+jJelTEIXxKMarozvsb
         DdFNA/1+3VabK1YeOsSMaCLWJD4taZTqS+Cvi5IBWnzd+iW2Wq6A/8PXxQigegTjbXRE
         KiTGs7CXO9bvmY1+if4wpjUkJVCduHwOhXJ8xu6sJdkdX4uxQq29QP/+PrxyK69M82YU
         TK+bIaTZKxRYMKCnBYlxEKxmxj6y5Ra9WCBOoaW8mNEPBdmnuMnwOoyBb89Hwyz4V3/y
         G7w50jZGHOy7T+qkjeCOgNRwjzhcGPjTyBAQ8dbAiG+m//TfpeZ6NQy7ABsNothSq5Bl
         KF/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3L5/R0TNdPI9wKc9dod6srzOhs1ZLS+127xQ0nrb1+8=;
        fh=9N9dGPfO/WHNuVYZ1+4dBsEqXKAUGhpT6O1gp/fOZHw=;
        b=cTZLydVtJQ1G/Lj2dGp8YmlV4dxvRrucarR1PenZ+FlLS+ERdDJVV/jT6OyTJlIicX
         Oy+wdiL020eImV/MEJV9aKwgBZREizsdLcsckz8FpaOoauOt75zqdCBJeskv/Wr97xm9
         87/9ZFY02PCdE+YQAKaL2iIF1DoBxKjGoXET8sI1aKLb+c/rEs9GVb81oWq7TIVdleox
         sJS8kkD9YWtpaLt/HNIig2m8Rii/6CmZaD7opegMLWDtij83tRBXK/isT7che0QmVike
         sf5u/ztmn9c8PwCdCI8+qX8FuQl24NP+SYe30P6WfMhYxWifnrN+1ss3Vec8PlNcfTgP
         kKcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794606572; x=1795211372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3L5/R0TNdPI9wKc9dod6srzOhs1ZLS+127xQ0nrb1+8=;
        b=QF5CrfklGfcB6TuS6O8V3Pk6+/AI+tTWM9b+EdIQ9fmlZbPGfEQ+MTTFYjwB2MDRCg
         AaMete78OnDmHgdkVg4vm7XCx+JoK9SvIyHtWWxKv0CCXflZ+DnWy3SNj99KotihUKKt
         KQz/CEs0QbqutrQxpGy+jH/DbEFqDPes1dRP923SdVEPyFX8l0DnJ2D5M2heVtm/3AVs
         Qi/D7mqB8IxvrRLqZAHDB77VkAwfoc69LIMNxhDlFfuEdfLYZ8Ez+Nwky1fmVI4JeL8S
         8U7Q3/yzdHBZt35IKlZOgaXtWC+4JiHB0cELyxEdzLr4Fk/0MuRYjdfvWcO07QNKuAbv
         qkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606572; x=1795211372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3L5/R0TNdPI9wKc9dod6srzOhs1ZLS+127xQ0nrb1+8=;
        b=EPJfqPznN65Me+frUQJttFD85a+pRI4viGgoz9hMy2NOT3Y4SrxeyitP83xOg1G6vS
         /idYj3w84v6z1rv/wgZ9PYzOIgK/9A5YcSq/ObCdG56IJC6Muw3z3HKH6bCuhpFTfVg6
         w70iNu2mbFRIVp3o6JT9pVnz8XhsLMbyqQYBjduZtr/hBHQTDikfaxcMHOmxIzqefiBO
         yVTXwqjFnWYkF2pI+ZcvAcQ3B8OiZT4Uadh+hyrAR9EicFcgDJMt+IqFOQZxVTD88uHO
         EhW+wsqJcU4XWw3ajbOPwzlO3BAyZ7V9o47H90+Zmw73uXB/fDH8dFhDhZD5FCQ2EKIw
         ABKw==
X-Forwarded-Encrypted: i=1; AL+hErHObt24HPX932rjwKXC+JaFGJKQEUts7vmTpTgeuIBrgpi0fwd+cvKDYxVtG1GmmuX5hW3/Agbdb6SlSpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UpsU8+ZQvBCDZ0RMxv6F9iLUC1v+mfEbGU1z1BHcLWqlaTMbo
	GDOOPbS0ZBe0RUwqRiPHpeUTw5+Dq1DAMnut0mmjFaE5pBWXvwuobAn408FrwnXdY2GTFIn5c5B
	FGQ/fWFQZwRLddiupSzPfB7d5wxvIjDY=
X-Gm-Gg: AYBFou3DeREseDzXzbyT2RDIL7L3Bv5N/TppF8Vn514IAk1rmqBA7jApsMemAwmcG+F
	7SxwvNSEApNRCjDC9/juJaigsN22jebq+MbJYTexQn1o3lMY9C7dwWYDasrV0uHuHqM+Tsw666u
	HpHTFn98/ealFyGjZwp7coUKSPtu0RcKmytr7QmASi6qZTnZN33VI/dqhKOQazrNus8jGDMagUn
	srIrCR6cC/C3GWYGLpFVwRCi0t0LHMDDwGlkhtv8v+5aFqvR6Q72vNGN9xYn+nnfUCT28CnFHwE
	f8aH1k+p4ySr/o6N931kbVfyZ0SnzgQs0xGbTlMa9uz5wGDs3RubqSkFlqxGK/nF6NKoqkV0MoX
	JPGQN4EQyB+uR/BwbhgkrTeUjkbS/bqkNH+mjQE/Q/lVwKjwlrmsK6oK+ZMd2X41KG2wNcQ==
X-Received: by 2002:a05:690e:4514:20b0:67b:f3f1:1657 with SMTP id
 956f58d0204a3-67d895d1d1emr1805444d50.34.1794606572014; Fri, 13 Nov 2026
 13:49:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
In-Reply-To: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 13 Nov 2026 22:49:21 +0100
X-Gm-Features: AclHuK86y13cJB3U7lK1W7UeMH0dHKC_-NtrK8Vfy5rgx6ydsQHgJZMUNQRuLoU
Message-ID: <CAFBinCCKLhk1RZX725o84kMYTsiVZF8SE3rc52t5NuknwHgMGg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: meson: aiu-fifo: prevent sleeping when spinlock
 is held
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Christian Hewitt <christianshewitt@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:56=E2=80=AFPM Valerio Setti <vsetti@baylibre.com>=
 wrote:
>
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
> This is meant to resolve the following runtime bug found while starting I=
2S
> playback on an OdroidC2 device where the kernel was built enabling
> CONFIG_DEBUG_ATOMIC_SLEEP and CONFIG_PROVE_LOCKING:
>
>   Playback device is hw:0,0
>   Stream parameters are 44100Hz, S16_LE, 2 channels
>   Sine wave rate is 1000.0000Hz
>   Rate set to 44100Hz (requested 44100Hz)
>   Buffer size range from 128 to 262144
>   Period size range from 64 [   21.012074] BUG: sleeping function called =
from invalid context at kernel/locking/mutex.c:623
>   [   21.018009] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 2=
67, name: speaker-test
>   [   21.026184] preempt_count: 1, expected: 0
>   [   21.030151] RCU nest depth: 0, expected: 0
>   [   21.034205] locks held by speaker-test/267: 1, last CPU#3:
>   [   21.039638]  #0: ffff000003dbd910 (&group->lock#2){....}-{3:3}, at: =
snd_pcm_stream_lock_irq+0x40/0x60
>   [   21.048782] irq event stamp: 5274
>   [   21.052059] hardirqs last  enabled at (5273): [<ffff800081494240>] _=
raw_spin_unlock_irq+0x38/0x80
>   [   21.060856] hardirqs last disabled at (5274): [<ffff8000814935c8>] _=
raw_spin_lock_irq+0x80/0x90
>   [   21.069481] softirqs last  enabled at (5238): [<ffff8000800f9aec>] h=
andle_softirqs+0x584/0x5e0
>   [   21.078020] softirqs last disabled at (5231): [<ffff800080010324>] _=
_do_softirq+0x1c/0x28
>   [   21.086133] CPU: 3 UID: 0 PID: 267 Comm: speaker-test Not tainted 7.=
3.0 #2 PREEMPT
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
> happen. Also 'axg-fifo.c' is doing the same in its 'axg_fifo_pcm_pointer'=
.
>
> Fixes: e8712315c44d ("ASoC: soc-component: use io_mutex correctly")
> Fixes: 6b59c53c8adc ("ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF=
 datapath on start/stop")
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
