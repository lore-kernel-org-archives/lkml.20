Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCD732B10E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791225070; cv=none; b=Gss+BtQN6jg2KhQMoyWOSD8o652jWP8i1soBiXO0e0BgMsKEOlu6dBO9E+r2O9F2AXD4x0bv1RRaNAxnEssbyhNONs0EH8iV0ETMGUg782lPf/nqb1CKYm7rq6sdVEpON2FbPj04r1mGU02ojnmjrMdBQLjhYGwaglE8C05ejUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791225070; c=relaxed/simple;
	bh=/YjAT+PTANp5RO4duL6E//TuMjIjLHUPGD7hH8q1nCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ak4090kVDZ44oWb6DqTT5A/Mii/363VUpqB2Wwkgoql60uzF5NyHU3rhVb/d3sNJEX62+uoyHzwSMrmvR2ClE+Y9KKoEZFXN7Zj0KJwuEwEay99XA5BdJBvC1o/JrpzkHrPYPCIr+r/5hcI25w0OGtWZi6fZaMnFGqqwnlX7Fzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPp0567a; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPp0567a"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so5893351eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791225068; x=1791829868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6PuYbZh3CSJx/YeySaraDhA8HTOEwlS5gR3oZ9G0OMs=;
        b=mPp0567abLw7JG+WLzGJMH3XRtB8NuakHDzWTv9g5TjEdG07ni23ONXk7jRK0IVOPN
         wWm2WhuxD04bvvttEcwS2+cXKT66WtRkXBzQBhiBhPNRtKpBjop5DTOTEXSCW6OacQSP
         +Hem3A8aBZ68N076PQnd/jY2EvFAb5Tx2usUG/VUpIy2jsfCAXNC+Fp8ll1l9CkhpHfV
         26rD7s+K33w1vZ9IV3CApU5Ac0cR3ntU8L6+w1UWGpv1UM7I2r4pVPvvz6CA+K2kAlBx
         ZnLGzSk3WvqbExEl9rWrshJIwkC+Xs2dN/4TmcGxC1fDEIBbvtUXY7fxgxqnnIPVmcUH
         VWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791225068; x=1791829868;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PuYbZh3CSJx/YeySaraDhA8HTOEwlS5gR3oZ9G0OMs=;
        b=vO7zOts6fB1o4kWCNcJfz+gOmbxBSN1Tt5p1leT2jZTHmqT0guDP5dRs1dwYAyIgF6
         fPitzT2h6vXAIC20tmwWGxXyMfeD6Jv2DTS64c1UlUz0ZyTe4KdC33l7UxG4bQuFKBcf
         Vp7mWdE0RHW4iPoFJMTBESslz2414xmMPQ1CdyhwCHxi0bP4bkXxijEVw2jQe4hy0yv1
         4pgGz5IO7QQiOH2M7VeVsC7e0miz/LE3bxKRbbNAt6kL84OxhEGqUIH2g3RNdw2Zwv4v
         hs37HZQIezvBg5JDr9tTnhGxfV6A06RQj6MBrDTuqDKLn2YGW8jZIbP43l7vs1GC1148
         1fug==
X-Forwarded-Encrypted: i=1; AKwUvBwces04KAQBqeMvOVQCSO6IvFSybu48f2Y2CNk539hwfLZbKXJFyyi1P5SDWMCB60casK8ttd0G5Z41IB8=@vger.kernel.org
X-Gm-Message-State: AFuF++l96muCYI4hEXGUjWdHl0ZaelsGVKOoc0lLGh8V8YzQw6MoodnB
	TUxkQf9Vo3TVqRsS+Pn5c2CuA8KAm5ZW25OO7DQ1no8eampF7K+/usPv
X-Gm-Gg: AYBFou3dWEJamVa7e1AxjzL/IEPQHGJmyMKpsa22cJd80Bcvgr04uyuWX/FbtlmuiPb
	ur26XQzclgIFSt2FDIBtVieGfumEK5lWy063HQGpLgUYilwAiu7MBCy0x7D4MPBW7a1NEdNu/mj
	YDeuqYklxuYVwSHm7n9Tq30xISlcagdFTd1Y8WspscJKbmthd+CLUBau9MROAirUQPNH9XnOsG2
	8RhMjN6rvW+MSPapq5y25iKscl0rV0O9a7Kr5f4Mg5vLkRnjT+ZbDSflz5HX3LWp2mBFTwLAAlX
	a0DwvsaqRXsKG0P6hPNURHCE9ACkic4mZKd/4wzndgd1W/66T+QMkUap3ttFfktrOyBYZqRkTgx
	PN1TQKDPf8jkISoWBnL0yee7oz2D07X/6D2HkDWWkWhg2pEsXT2NmHq3YdM8I3pkGtcSpK+HSgJ
	+mvfVrXimul6QGn/cPNMdWLTP9nDoTtKPkriarZylM4odsfcBP++tZtR52C9Pf7v50eKycsaCMB
	OufiWOXJAz1N58FMcramGYi0JsHg5M0x2MsRaalcF3O/dVHMtJTKKAlRd1uE6LBxzfgFzMCVdSF
	LDPQ+Vs=
X-Received: by 2002:a05:7301:f84:b0:34c:1f07:2d5 with SMTP id 5a478bee46e88-3511162fa68mr10914269eec.6.1791225067702;
        Mon, 05 Oct 2026 11:31:07 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac4dc4sm140223eec.23.2026.10.05.11.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 11:31:07 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v5 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Mon,  5 Oct 2026 15:30:20 -0300
Message-ID: <20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Junhui,

On Wed Sep 30, 2026 at 1:26 AM CST, Junhui Liu wrote:
> +static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);

[...]

> +static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.common.hw,
> +			 0x21c, BIT(0), 0);

I'm bringing up mainline on a Radxa Cubie A7Z (PCB V1.11, 1 GiB). With
7.3-rc6, this series and a local common-DT integration, PSCI reboot and
power-off hang once unused clocks are disabled. The boot chain uses
vendor boot0/BL31 and source-built SCP/U-Boot.

Keeping both of these gates enabled fixes reboot; either alone still
hangs. With only these two marked CLK_IS_CRITICAL, reboot returns to
boot0 and power-off drops DCDC1 from 3.3 V to 0.7 V and turns off the
green LED with power still connected. I haven't checked whether each
gate is needed for power-off on its own.

My guess is that BL31 talks to the SCP for these, but I haven't traced
it, and it may be specific to the vendor firmware.

Would it make sense to mark them CLK_IS_CRITICAL, like bus-r-cpucfg
already is? I can test the next revision on this board either way.

Thanks,
Vinicius
