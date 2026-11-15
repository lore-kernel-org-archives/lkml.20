Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782052;
	b=l+lFHDP06EaX2crs7cjchAWf+/IZhX9Mc0MGT8WhwaeeqP6qAMU02QiRHafs2tYvbvtR
	 bQqJ5usfm3fVfPYaqNF7//WbKLntQ/UdLbyEtUhEMd5IWHeH5cPVjEHKfLgCZF2yW7LwI
	 sfscIPanxZz4xCxyWenFg32c3hfngsoL8H1kol8DXk2C3UdtXdlrRpdMi7aQdc1knN3PT
	 +XRn/iGatkDyTZ0z+rw0JPG+5IJI5tUpwxk7GOxKURxyZqATUmgX9pmOKOiaudww+HyA/
	 ymsTwSpIdZhVNCPAzUIOQkJnADIOp8W4Iicn+EckMpzILdAU8SNeXOQV6FJX6ZKjYYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hLJ6bSKi+ZgPvgTZTEL6AiSyPJLqudm0XPJJoELWh0Q=;
	b=Cm9NMGsZbdYcJ9DUoreICB/SBvKXdoAMrOeJk2xEzTvmfe9lfLhqZmQ6nX4002VG+NO7
	 SnvWuvM2SLYEWRzZo6xHfNbeyJERGo++kUr9wD70fb7qYinSKEqFWIN7sPUbkOfpdsRWy
	 XRAA3DOpmSfvgBsxSv9ZWnKime2JziO46UUZ+IKkyRlagVigHsZV/Fy/6FtKlrtAvpHjk
	 JgEZeI7k6zWuXnY+7EPPL1XNZ35I0KF1eo9EI49BD0akLmNTUMQPErOik2KAwEFoMWOVv
	 936PAzXYtphctef7OHizcBNH6PzMgCAk39bLz7WBKLDrd9izSKWP0N8wqoEB6UqBrOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CJd3QEEj;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34607606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34607606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CJd3QEEj
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso6838565e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794782049; x=1795386849; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hLJ6bSKi+ZgPvgTZTEL6AiSyPJLqudm0XPJJoELWh0Q=;
        b=CJd3QEEj8pQwODGjB/Hvsm1Kz8XiytWNDpUjUiysP8iwPosQ6yW3gdLOLRH20X4Owa
         0JtLC5im59ZkIs5S3uiF2dyb1/b0W6sEAIXxh3hqmTeNyMKe7nwPlu17c/gf4iAu6cBU
         4y0sp2DgHz6LvxI92R/65FyuHGltuJnCbV89+YgAYch/er4OOAO4xTog7mzZDiYoN7/w
         sRBEaSqnhB/VU7CFPMMVnakJq0S5UBmp9QqWpa4hHjWni9z2K4sonGaN/XYvwXyXKbqW
         15MumIhxvuJhPEyRyEbNm3tCt2dmSbs/6BsQifBNlgTCuSlf+tnV/IyEeqPPeVV8jLc3
         /sOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794782049; x=1795386849;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLJ6bSKi+ZgPvgTZTEL6AiSyPJLqudm0XPJJoELWh0Q=;
        b=KA38RSFvsG7cLAs/RSMQtD405PF4S/5pJPk1n4xn3ga9RX+rak/MJLRgF9DMKlzq9N
         T6tJCKBrYc1ZVrPxUOFMnfdZ2Rdb6jjEQnzPUg1cLxp3IQn9iS4omFBiE7JZBly0dpvI
         g20w+lSXXq2q1nu8r9+VV+DB0QtRiLMWjQZ1EQEmDhnAEqyv94Y/s1tHZMhGxaKYKKL1
         5cdAlWSU5lziBQleW1vEUvyuAZUgjDbM1negqVdXGZCzHdDJRhFHW3KFZ4mG45SWRkcN
         SMec5NmUW6so7HHwrcfIiB2p+H53IdRaXJ6b3S8N7PTyucKhKdFFXEU7R+FuXX9aOyFm
         HDTw==
X-Forwarded-Encrypted: i=1; AL+hErE6XWZKnpL+OMQUR+0p3MUZ3haMTOlp1zvAeoUqzSSgoTR1jbwwmAjkP4fxgApFInqoT2pI1Lp/tm1mVso=@vger.kernel.org
X-Gm-Message-State: APuU4Z910deNMBaTv4Ca8lBHpD3cCazlkQGdjf+M/4/XSWR9eFO2mvA3
	Zfg/VWkDsfassG0lesUpQiJSQJU3eQqST+b3O+/i6kfzLOWGo6hNEobGFKcTMRb69n+iIp/VAeL
	/Xh82
X-Gm-Gg: AYBFou0Qfl4amcwXPOMAKImGNmLqXC/zLeAtZngusWycfKg84y2Dj2c+VVayCVYEN0m
	adHhXsXKERAD4E7Zff8LBs8I4++ApUADJxyDBvC/x4xg0obuyiEM3JNoFRhIc9QTn8S4XWGkamk
	4B469gn2BAlXiwkjE6jGg+iK/n+nVp2grvIgPO7laQ7H1MXeVcpM+NNUUodGDYgcIiFTidPfJnn
	phJX8jkQTwcyEf0X0r3vhi8TiWbm/tW2OI906WEalZeBsxHPNM94kt5ExlnbRWzDJS6ceffuteP
	MaKpgJIxYMHoMoEOGK0zNHwv8gN1Vp6yDtaL/teb+15vQIx34dE5h9K9ivrUIIWaYu5dSami9Zr
	J78gzloiWnap9uRE36Y6TfVUnRNjkSql1UhUs2t09+AmMcL+MRMJQSKwehvDkEdS/BVeaSIjTVJ
	uGmuVV75AQRQ/PVnet+hX2VUib3cagXJZnWHKuaStrr7WPJRwQ5kqnvf7slxXE5/H6m6Od2N7fs
	hkk3cUlQWU8jGMhyxa3mcmuGX7JaulJjCqm0rnYf9a9xBvZzbm+QxURSTVbq2/rundF+dYrCFeQ
	t1bZ38HJ1dxAKbLSbSKab6ySdN1GFDnmc50cbB1dpMlfrUNT
X-Received: by 2002:a05:600c:3e0d:b0:4bb:6f41:39be with SMTP id 5b1f17b1804b1-4bb6f413bfbmr46240405e9.15.1794782049461;
        Sun, 15 Nov 2026 14:34:09 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55acdfebsm222898225e9.7.2026.11.15.14.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:34:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 0/3] clk: Restore the clocks of a provider after a
 hibernation
From: Jerome Brunet <jbrunet@baylibre.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
References: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 23:33:56 +0100
Message-Id: <179478203647.13037.1560944178171749849.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3673; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Ig1JMbXRCmJfdJcT1sGueTmWJmoPRP4AdJybNvm12MY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm/jCPjSy54XHH/JcHw7lbPogWvLvcvvvPHcV4z5/k4g
 23ccZ+mdpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAiOxIY/keyTtq72s/setcz
 ngy5rDnH4sWbDvWxb7S9uny2/2GP1Q2MDE/Lj7BLzb3MN1Oyfb9IzkeXggVrTYRME/cLcl+U+V/
 GzAIA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> When a hibernation image is restored, the clock hardware has been through
> a power cycle and a boot kernel, while the clock framework in the image
> still holds the rates, parents and enable state the consumers asked for
> before the image was created. The consumers ask for the same rates again
> when they resume, the framework sees no change, and the clocks the boot
> kernel did not touch keep whatever the boot firmware left in them.
> 
> Whether the kernel that loads the image probed a given controller at
> all depends on whether its driver is built in or available from the
> initramfs. On the Qualcomm Glymur CRD, the display clock controller
> driver is a module that it does not probe, so after the restore the DPU
> runs at the 333MHz the firmware configured the PLL for instead of the
> 717MHz the framework believes it runs at, underflows, and the panel
> shows a solid blue screen.
> 
> The first patch adds clk_restore_context_dev(), which re-applies the
> cached state of the clocks registered by a provider device, parents
> first, as an alternative to the global clk_restore_context() that
> depends on every clock implementing the restore_context operation. The
> second one adds a hibernation restore callback to the Qualcomm clock
> controller common code, which redoes the probe time configuration and
> restores the clocks, and the third one uses it for the Glymur display
> clock controller.
> 
> Sent as RFC, as the same applies to every clock controller and I would
> like to know whether this is the right level to handle it at before
> wiring up the rest. In particular:
> 
> - Instead of programming the cached state into the hardware, the
>   framework could read the parents and rates back from the hardware
>   after the restore, so that the consumers asking for the same rates
>   again go through the normal clk_set_rate() path. Would that be
>   preferred?

I would much prefer this approach. IMO, we should not try to restore
the cached values. There is no way to be sure we would get it right:
the HW may require a specific sequence to reach the final state,
intermediate values, timings, who knows what else! I'd rather not go
down that path.

Consumers know (or should know) what they need, so they should release
their clocks when suspending and request what they need again when
resuming.

On the provider side, it should just resync with the HW from its
.restore callback: re-read the parents and rates, a bit like
CLK_GET_RATE_NOCACHE does, as well as the accuracy, phase and duty
cycle, and re-enable the CLK_IS_CRITICAL clocks.

CCF should provide a helper for this. It is likely going to redo a fair
share of what __clk_core_init() does. The prototype could be fairly
simple, something like clk_resume_hw_sync(struct device *dev), to
resync the clocks registered by that device.

> 
> - Programming the cached rate of a clock that is not enabled may not
>   work on every clock type, for example on an RCG whose source is off.

What I'm suggesting should not have such problem I think

> 
> - The Qualcomm callback finds its state through devres, which only
>   covers drivers that call qcom_cc_really_probe() once per device.
> 
> Clocks left enabled by the firmware but not by the framework stay
> enabled, and the phase and duty cycle are not restored.

CCF has no sync_state support (yet!), so the unused clocks of providers
built as modules are never disabled, even on a normal boot. You would
not be creating a new problem here.

Anything cached needs to be resynced though, including the phase and
duty cycle, everything else.

-- 
Jerome

