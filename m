Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175465;
	b=HWTcU9iWJs/f1kp8dQcARgC5Fnuw/oyLQ/x9z0MOUzDt+9WAWH1DeweeF/BFXfXNtD3/
	 /rjgVKlliCE6i/7YH4s69de/Kx4XHk1EIv71t7mDBV8K6Vh7xub2+NK02oEzoum0RvmmQ
	 R8CJILat3d3NmqMD+4p3V389tE38kAuOUodHvS9hY7AP+07DXOxAUxk7lFxuDaC2e5su3
	 ImgIaOFBo6AqGdQT9HCWEvQ/lW4S3KGomNpaYIa556lpnVrNicizVsXZ569dSbkmE0oF8
	 s71DB6v/RueFd7AViWsKXhjFOUZsCUKIyJofOfxWjVyeLtoDu78MGvG7UtR72MVdgTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RRuxTSHqwbMEC1Vyc99sUTotqRotw0K4rkvyEEzXBAY=;
	b=LSsOT21nZLYOAPzV4cyKaedpi1IrRbYSwXE7g5q5pob8m4SDlhkBkaiE2r7a0wwHMfbJ
	 sfRy4eaqoC8Z1eIlLj7nXf+unbK3Rqp9TKtOTS4ehV/rqHWB+lT+ayQS9wP4PP1KiWtnk
	 P4CAFkFDnxhtYzQg6De+w/Ppyuc+ljofDiHrqm39EVJsaJg5ff0a2/iP7fcUqPH/1ReoG
	 N7KLC7uF60C5qIfw8W0cgyVgBwhk6asINBk0T/hGB7QsNt/ldRcgFGkOBWdgs+VWxoHzd
	 Th/3BQitgghd/RZvz1vxo7cHtgYU/WN7GR96KAati7Q3Dhg/+IU4CuqqXv+g8zmtO5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6e+HXR4;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4B8606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C4B8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6e+HXR4
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so4268975e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793175463; x=1793780263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRuxTSHqwbMEC1Vyc99sUTotqRotw0K4rkvyEEzXBAY=;
        b=w6e+HXR4E1vIVIMChFIyAOb31XxYhOEt3Zrz2IiwM3LhOCQBmnrDukcry722WCgB93
         SSb6PJmaklJ66J7JbsmjxSLeYpqANik9BIVNyINZJvLzWops2H3lR+ICz4pF/BkxwNtJ
         p/8dr98ELXO5kZWfu58phA2aBZWnMe1X/8GoRxqG0KcGFniooOdFW4i3F1KEn8TFIh5i
         9qOTv43hoMT2Z5oPLNqsIWekEi9z5no4kqJ51UgsNM9fIDLkJTwZ3Cj/kgUUxxejapis
         H6nZKdcMhFBN91zskq/ilLB4+p6Q4WIFyKD/8gj8Wz+8cFzC5V1+J8hgYm/mCED8i7HO
         /WNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175463; x=1793780263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRuxTSHqwbMEC1Vyc99sUTotqRotw0K4rkvyEEzXBAY=;
        b=2buCcAqW+ofD1+FPYXgS8i+NabtOw0WRkjolR1YCMcX+8sNEwlCAns3qeo5V8vVcIq
         ekLsRynQHW2jHsMyib2q9lzap2IrWH84ZP68Te2m8jK/tj3PMe4oFiWOBjytlCsXGnLc
         Y6nkZLpRoYomVk1F1en4Qe5wik6ilxS4NW8WgMHfc8nKxyGjn9JdYyqMJFX6nBdEGdU/
         w0KTxNAT3sF0QouShtSjSKTmVvYiDjf6xNdRA5Jpoe+TjV75TzIdyM1NrUxjw3mEuQC9
         I2v4ssdOWZnWCPAE4tCZMcji9McTMHuxrjeAzWKPFgnRSqxOpxNH65if/qYzF4wY8EEq
         oiwg==
X-Forwarded-Encrypted: i=1; AKwUvBzInlesIDx25ZA7Wq0xx3V7lBXWiSMjglaRgsaepyksM/mBEt5UNxkB+X9R26UCKM3zbj1Y0z8weDsKZis=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmuIQQj3jz+TcBnZgg7HQLTS+TQbKZfDywadS7EfkyqJAH0QtV
	+z9tf8oL8cviAjcO49bUR12rhQbChpEZ5etBgUK4dtYcpJKmipNXNlOk
X-Gm-Gg: AYBFou3r3H0wwDmRqRQyq6kFyh8GkOrHUbX98A8lMGMWdE4k8GulSZP0IBc/bZjqFF7
	v3WDdxENxReXh9qwhiwLoZtLuInp1pQ//+vYH5I+WPAWdEKA037Fi1/zgOcquFvOg5Dg412ZIrj
	UKOHEo55mmT3DTGXHOa5BPVQ1Nti1Sa8MMlrPTya4LLcQ6gYibkZM9PCiZo7SqHpBx1FImXAuJe
	CjG6echY0yiF6rKaldth2ypeO7cDZeCEB6Q6zUBMXcuWYtI/rLh4JShDwQCPfwMyRlRyk4HmTSK
	1gD7Go2QX6gokxuv+sd5hHJzAh/FzrkPgkhi7Ocf9Rx9NX21lci/rtYkn+tdLmIUE7U/OKBA90r
	p4WZivqonNhtDM5vxdLqDNZRkZ65uy3zgfChRuusxFOuXKE9xmtR/DdvPTBKPSb50e03ODgZ5oq
	aX6DU2DU9JOZjKTzqp99ZpBIE3gC0JkP9b4XcmBM8nRyYf96ykS1Ad92nBrohQNqYcSh1q3R5MV
	w6EUuNqhH7KmXp8W6UhmjeEWC48yEMopVr8dA3WoMMn3bvGosWW+f7T382R1wk9Zd4b2KiFog7N
	oGf5Td2TglPFrq9DG6k1dc6zWqUpM0Z/JT75W94u62u6A2bf9URovZ7B+DnlNWtYFJB/V/je8Nz
	0waY+tQkLBzfT/JyIKbUNmsQStTcAYK5lWIYs4ubT5zbQcnfnlEWmHhZS37Jk/YBwikM7AxWSZs
	jvHgnmnyqu4QEo4MMBAA==
X-Received: by 2002:a05:6000:24c8:b0:48b:ec8:b0d8 with SMTP id ffacd0b85a97d-48e5d5c3dd3mr4027197f8f.32.1793175463262;
        Wed, 28 Oct 2026 01:17:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-63a8-e900-0915-3df6-8525-b963.310.pool.telefonica.de. [2a02:3100:63a8:e900:915:3df6:8525:b963])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm28393931f8f.27.2026.10.28.01.17.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 01:17:42 -0700 (PDT)
From: Tim Pambor <timpambor@gmail.com>
To: maz@kernel.org
Cc: Frank.Li@nxp.com,
	afaerber@suse.de,
	alim.akhtar@samsung.com,
	andersson@kernel.org,
	angelogioacchino.delregno@collabora.com,
	baolin.wang@linux.alibaba.com,
	bst-upstream@bstai.top,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	daniel.lezcano@kernel.org,
	devicetree@vger.kernel.org,
	dinguyen@kernel.org,
	eleanor.lin@realtek.com,
	festevam@gmail.com,
	gordon.ge@bst.ai,
	guohanjun@huawei.com,
	heiko@sntech.de,
	ivo.ivanov.ivanov1@gmail.com,
	jbrunet@baylibre.com,
	jernej.skrabec@gmail.com,
	jesper.nilsson@axis.com,
	jonathanh@nvidia.com,
	kernel@pengutronix.de,
	khilman@baylibre.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	lars.persson@axis.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	mark.rutland@arm.com,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	michal.simek@amd.com,
	neil.armstrong@linaro.org,
	orsonzhai@gmail.com,
	rafael@kernel.org,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	samuel@sholland.org,
	shawn.lin@rock-chips.com,
	sudeep.holla@kernel.org,
	tglx@kernel.org,
	thierry.reding@kernel.org,
	wens@kernel.org,
	will@kernel.org,
	timpambor@gmail.com
Subject: Re: [PATCH v3 11/17] arm64: dts: mediatek: Add EL2 virtual timer interrupt
Date: Wed, 28 Oct 2026 09:17:16 +0100
Message-ID: <20261028081716.75598-1-timpambor@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260523140242.586031-12-maz@kernel.org>
References: <20260523140242.586031-12-maz@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 23 May 2026 15:02:36 +0100, Marc Zyngier wrote:
> The ARMv8.1+ based CPUs used in a number of Mediatek SoCs are missing
> the EL2 virtual timer interrupt. Add it.

This patch doesn't seem to have been applied along with the rest of
the series. After updating to v7.2.11 on an MT8195 board I see:

  arch_timer: [Firmware Bug]: VHE-capable CPU without EL2 virtual timer interrupt

With this patch applied, the warning is gone and the EL2 virtual timer
is used as expected:

  arch_timer: cp15 timer running at 13.00MHz (hyp-virt).

Reviewed-by: Tim Pambor <timpambor@gmail.com>
Tested-by: Tim Pambor <timpambor@gmail.com>
