Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288293B19B4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945554; cv=none; b=gXzuqTM7pPxvWOI2Fzo3/q9DRK8LnBIs5SVFVDV2M1OFX/t7oEkhS0dhh52//nQ3RWOmkaPvebBKWNVNv2NCC2KaSGH1ZIIPFPmZC/4rGzqxTOgSSz3aYeWbjCJO52CpXO76TEcJlbHO92YETGcPdlvNC7R7ZdKaw6SglCUK+CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945554; c=relaxed/simple;
	bh=W/X0Yntxnp/n7ZFKx0x22n16oHHEbd+BsO1u0txQcFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t2mod60AGgyi18NBor/3+Y4RwG1/10FePabaPvolitRfdOZr4U/d0xxzGoL3/LZ1SZGnsB4yDIa0BRJPvmDPCJTe4LqdEgZuMByhuXANDe+H92tqXVsaAZCfo+zlAj0lXe9Wad0KsgJ3Knlqx4Mxv8PmYwc0vSiLsBap0AvvrpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4JP6sBU; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4JP6sBU"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843971bdd0so620127f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788945549; x=1789550349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PL9pcPV+bgLn+N8hsfR6afv5u/5q3iwl14xc1NE3dOQ=;
        b=L4JP6sBU3BzUB3+x72sRHY+MGTnD7RTlUdhxwvkZlpIELH1dIZ+O1DNMqMj4UUiahR
         OiwTEuBxdyidEdPG0r+L2z03B+SaFaUExJ5vzWGcrrIGLCGErABs1pcn4Y3BVwQLPOOE
         YZ4D645ihXm/r+qe7ZJhhVfWNrdedeQG3xrWcZS5ccvCDmut47OOUoAaK6zNSavgci78
         xESMsmMOGiDLqqdyH3ngGSeHd8aXmcQfAl0Y/U5042nEl27+iamK+V/VcfwCNrsjk613
         EAJac5v5optzH5rWgtC68pfsNl8WmjnDM5U7iY3FNhAwXNG2olgr3M27Zs1mYNU05RX4
         uoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945549; x=1789550349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PL9pcPV+bgLn+N8hsfR6afv5u/5q3iwl14xc1NE3dOQ=;
        b=UYIOWBioo2/0PeDMX+WrjzkQDTlGtD90yGoO8UNsMqxHJDU7FamKcwf3hNhN0AuSP9
         WjHVSddjIVLkO3Xd8vaqN11gmZ7GdGaRIcwK7jx658vLxUk33IRKrZONOfgagf5U6NfZ
         DXBurdNdszqTh688ncxDh4RzpYH3GHcvYozpQBo133iSdNjMGajqYxUWBAWx8i21R1DB
         oj/laPfdgLzKH6ULlGF5lAA9G8lh9NBjyraLddVhB7vZaY4blJFt9OpinKSemPOItThT
         k+6Ik8J9mFqrMT4+gWiA3OkXLsg4Oa+Ebl4ou9s5AYooEQpKjvFULrX3krHn+8/BBlj+
         KO9g==
X-Forwarded-Encrypted: i=1; AKwUvBz6Euw6Hh2PhpOcGhIvukvXa3ejyckXMPevxVk/eKN/NE1kxu33Daw98aFeEwGREHEsjRgztM06lVjRtuE=@vger.kernel.org
X-Gm-Message-State: AFuF++mxY8kIF5+4jZRuQaIKjcvUHCKIUAEH46JqUFTe27Y/Z0xmUcJ/
	XAC5zfS+38i0SzHbUiMzfxsUPQNaVzwETB4IglYMnjACjh/1euqHPs1b
X-Gm-Gg: AYBFou0Jpy2H+I6UEMvh8ah8pDX3XiV4ss2ENuataNeWFI/Qf/vRf9PPY+0u4h9Lc4y
	E4Uzz5jCH4ER67LHWZjy2vv7SaPYxaNYLAst4WuGOpEBDC5W9QD76OECS68jUIrGh9vEw7YG1lu
	ayJmMDHS5crYZhZ4vJgWsu5rBK+OVXRJEvSpD693qMnrcsbV00v5/BVLJN1iErwdYpKs8o36gea
	4jncGBVj7/vS29F4jW6b2Cy1+Chv79QdzfWK2f63e88A94IlJn/kUHzfSWtOFaaN/EpBNuCFQMS
	tkts6PUz2XMmVFPEUxIXGPrncJb1qOxBlt7UJivr0ejv3BVrWJSOf0evKXb6+VE7vpmuEqqhOib
	DC07/fyHpFicYd8oX5Gu/K1egVgk1A0TbtWWp1Hcboic37xYOQ/pGMcNr1EGTmjMWRnqt/DKqiw
	04la8b2bEGj/RJ2xQpxPBNEXv/F+a/5vazIBa1NJm40Inv4snWDMxzHLHQcVcnglfPUbJ/4lVBd
	eaZyNhLExbyb7ARzLlhR7ULaQpqzlOalRTRnTZ3bPEe33BsDVhX3CQ5/43xEAtqfyaViMLHqN9J
	i2Ti
X-Received: by 2002:a05:6000:25ed:b0:485:82f7:9053 with SMTP id ffacd0b85a97d-48589246177mr34007529f8f.1.1788945548438;
        Wed, 09 Sep 2026 02:19:08 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8369007971AC9F7C06630F.dsl.pool.telekom.hu. [2001:4c4e:1b83:6900:7971:ac9f:7c06:630f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm41822588f8f.3.2026.09.09.02.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:19:07 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: rockchip: rk3588: add an OPP table for the NPU
Date: Wed,  9 Sep 2026 11:18:24 +0200
Message-ID: <20260909091825.10838-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c58d711ff5c9a01cfd69c2ddf86bfd969b36cc63.camel@ndufresne.ca>
References: <c58d711ff5c9a01cfd69c2ddf86bfd969b36cc63.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 2026-09-08 at 15:44 -0400, Nicolas Dufresne wrote:

Thank you for taking the time on this - and no worries about the PoC not
being posted; the credit in the commit message was deliberate, the rates
and voltages really were arrived at twice independently.

> My impression, and I was to study this properly is that having the same
> table on every core and adding the opp-shared set on it was actually
> probably the proper way to describe this "single clock for all"
> relationship.
> [...]
> I'm curious what's the right approach, and what is the real meaning of
> opp-shared if I got that wrong.

You got it right, and I got it wrong. The binding says (opp-v2-base.yaml):

  opp-shared: Indicates that device nodes using this OPP Table Node's
  phandle switch their DVFS state together, i.e. they share
  clock/voltage/current lines. Missing property means devices have
  independent clock/voltage/current lines, but they share OPP tables.

That is exactly the hardware here: one compute clock and one supply for
all three cores. And it is not only documentation for non-CPU devices
either: in drivers/opp/of.c, _managed_opp() only lets several devices
share a single opp_table instance when the table node carries opp-shared;
without it each device that points at the same node gets its own table.

So the accurate description is the one you had: the same phandle on
rknn_core_0/1/2 plus opp-shared on the table. Putting the table on core 0
alone describes core 0 and says nothing about the other two, which is a
worse description of the same hardware. I will change this in v2 unless a
DT maintainer disagrees.

One consequence is mine to fix on the driver side, not yours to work
around in DT: the driver currently picks the core that carries the table
by taking the first core whose node has operating-points-v2. With three
carriers that choice - and with it the name under /sys/class/devfreq -
would follow whichever core bound first. That is a driver bug the moment
the DT stops being lopsided, so it gets fixed in the same v2.

> We must not justify our DTS choices based on driver behaviours (or miss-
> behaviour). We must justify it based on how accurate the hardware
> description is.
> [...]
> It should probably be fine to not use opp-suspend, if transition back to
> 200Mhz works. It not fine if its to avoid a driver deadlock (argually due
> to a bug).

Accepted, and it is a fair hit. The paragraph as written justifies a DT
choice with a driver limitation, and that is backwards regardless of
whether the limitation is real. It comes out in v2.

On the meaning: your interpretation matches mine, and it is stronger than
"descriptive". The binding says opp-suspend "marks the OPP to be used
during device suspend", and the devfreq core acts on it directly -
devfreq_add_device() reads it into devfreq->suspend_freq, and
devfreq_suspend_device() then sets that rate.

Which leaves the question you actually asked, so I measured it rather than
argued it. On an Orange Pi 5 Plus with this series applied, in-tree rocket,
the OPP table of 3/7 read out of DT, simple_ondemand with min_freq/max_freq
left alone: 25 s of inference, then 60 s idle.

  - The governor takes it back down on its own. trans_stat records six
    transitions for the run - 200->1000, 1000->800, 800->1000, 1000->900,
    900->500, 500->200 - and then 60129 ms at 200 MHz with zero
    milliseconds at any other level for the rest of the window. The step
    down happened within one 250 ms sample of the load ending.

  - The transition completed, it was not merely requested. vdd_npu_s0 goes
    700 -> 850 mV under load and sits flat at 700 mV for the whole idle
    window. In _set_opp(), when scaling down, config_regulators() runs only
    after config_clks() has returned success, so the supply could not have
    come back down to the 200 MHz voltage if the SCMI clock set had failed.
    All four voltages of the table were exercised: 700, 750, 800 and 850 mV.

  - The clock summary in debugfs agrees, reading 200000000 for scmi_clk_npu
    after the load. I only sampled it after the load, so I am offering it as
    consistent rather than as an independent check.

So the transition back works here, and by your own criterion it is fine not
to use opp-suspend. This is one board and one part, so I would not call it
more than that.

Two things I want to keep apart rather than join with a "therefore", because
joining them is what made the original paragraph wrong:

  - What guarantees the rate across suspend is the driver, not the governor
    and not the DT. rocket_devfreq_suspend() in 5/7 sets the recorded boot
    rate itself on the system suspend path, and 4/7 restores it before the
    last core goes down and on .shutdown. That is the answer to "is it safe
    without opp-suspend".

  - Whether the governor walks back down to 200 MHz when the NPU goes idle
    is a separate fact, and it is the one you asked me to check. It does.

opp-suspend acts on the first of those. Since the driver already puts the
device back at its boot rate on that path, the property has nothing left to
do here - and that, rather than any deadlock, is the argument v2 will make.

Worth saying plainly: every number in the cover was taken with the limits
pinned by hand, so this is the first time the governor was left to decide
anything on this board. Your question is what exposed that.

> This is irrelevant, I think you can drop this paragraph.

Agreed, dropped in v2.

> Ack, this is safe thing to do.

Thanks.

Regards,
Igor
