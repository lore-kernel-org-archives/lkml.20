Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669603;
	b=AJ9GvF7qoTT7wfFi2xyNdC6jh38eMo5NtEaHWyVuVNpOvpGvIZD5LCYrMO3sDHYk8m7E
	 X21x1ispaWHgTSKmPGSkw9euitt5SNRhR8otLwZkFHKuHUgEOd6qmDiZORUHP9ra0NFwZ
	 Sbqez2UJjDzSjBYP3FOvRPEjL4Bgc/Ly2zPh8GWgirkOK7rgvmgBKGUmk3HExXJyzbwB5
	 6Anaodt3WgpvcO2PZQ6q+XzTaSrywI5ol82yfAIlSHzoA5IWbYk2p/WIs/yhN4aHId6Ew
	 A8/MzmpEv72oEq6wvXNJyTyaQQySE21bExyNbeSn/ACUhu5UvRTzwcLhvZWy/Pvpc/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
	b=H5b+oBRK88+/Z7pUoHAWk2VH2DEoPWmxaMHTWbhiq1ydENxPexGMD2RAN7J5hr3psWyK
	 5Dsvi1yREDusDUeEKIQakoPg3+dOWhIstWRjKu6ba5l/Prg3XRHgPiwQXOacaMy5KKHyf
	 E8iwPNL6xN0ByovekJNDP6vZcUEVKbNkEdN2w+rGDFTPU4zrqKuPOmqSwOiFPch52quIb
	 ptz2RhsPuNORMgLwUt/rSf1JYpkIF1q2XTYkDQ96ZKNq2w4B2400ptpdij7Ri4wW2hNHs
	 76GYXPhtD8JJmxBlq41XF6zlMjSh4u5Y05smC95o7YTwwv5C/4vnU9YrPpsbsAnubtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lgQNLUCB;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679E8606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 679E8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lgQNLUCB
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-536c8f958d7so27547051cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793669602; x=1794274402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
        b=lgQNLUCBm2WQLGp42iXbCrYUYAs+Oi1wVQBec5h/3veTVceezeaAU3WIEwWPr+U02d
         2Jqta9KhYiNZ5r+wA66ORykt7/O7EX6mrYjoZugMnQI7BBKjwaiVlvqOwNxSpFc1mjgP
         Ki2FVx8XpKUdDwqV0xTB8ZONiEDPLqzP1RXHyn/vks/Ch4IOszlHvCLUvN2xnAjHDWk7
         P8XZW/UPtjNtT0I0GsalpPdLtMTO5gXSvZJw063l7KglxNmgIGM8vHdEEwyE0YPMMzQU
         Jp2r+69MahJzUyJv/Oe7B5Qpy0VAEJN+nXt9nO0rwgNMDj8fkMFV/odObkF+WgrigCIf
         smsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793669602; x=1794274402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
        b=on3EQV9WbXx0aOhxQ3dl/ZWlRCKzPd7ws6mRFCOa5NQaw0P4PmI+dfRg3/VZS2eAaS
         83CNmTVfXOftSP9Hs3pTNhNfIfKK/KvE0VN0qlmAwH1pw0ZoRShJZX35Y72WIP48nxyD
         IrAH1NqyaecWakkFo3ISPWSJZq74REbOZBxSpDbA/Nsx4VRQYjPOfUDA18Wgqufq2HQj
         QlcG3VT/aGqh1eXSqiFC+tttZVtSD04ZhFhIfJO9pUeH4ncUjLK5cXbEzsjnnYu0b8jT
         ulIMAp3kYoCyoRwjK2Km7ywTPdStWx+BYiiaPJQCsySSed3PYuVb0+C2m0/KktwFvOwF
         70fA==
X-Forwarded-Encrypted: i=1; AKwUvBz8HHJnoN62T9/V+1EtcEyVwk5VZJx6yNwFx7Rqt6sMrIby1udbAGySI8os1hRwSHKfmRN1audEPBDZ8ME=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgihncjg68Cu43uzroKuDYUj3TPH6bBMW4Cj0CiUuW4SjndJBE
	ZljEA7Bd3qSBBOH/E55CBbs/2IIhQgYCf1efEHXFx0cgZ7RTdLtFpB3n
X-Gm-Gg: AYBFou3DgXPdZm8tP4YnYs9Hx/LUM4weaG2z4qx9oS1YZ2vov/TCm2QNy6c3poRE4tc
	vwN7sesfO1PJ4fMMRw+Abc+ILs3Ho9ZUJ9NXh0wZE5pLt/0+toXI44ZYBAamNgJ93kavjINWOJD
	khD2z9EF252OooV08NMFW1ViSaOI17catEUb48Aqg3EBGMG3liS/P2To1fcHIEGEWBxu+4KN8mE
	5iAMrsuWowU/kUVhQcvuNKPqsWEeuYeK00a9fbYuXiiksgA44Crk/kKrruMAfXblh5I3PZt/zOk
	dphEGcHHY00UdEq1o/v0FXvZGakKU7KwbsCPvDTkk6T/eQfwNlEieBFyKLmqnmsnmCTe7zCeiwX
	XUgTbjLJi62woWR+KDKbY8un413pTm4+PkuwvnZTDft+Qcu8Hit5LkaCy+L6N7s0vSq2LT4+bAL
	MEm8QnL4octOuOvOef/Iuq4yMxhBJCQeGft4Jp7nptvOsMfRjmY8f58DP209VTniRSUIAOig7nV
	4mgJ+uOotOhadz7yEKAR7GtKx4h4wP6iiGJuA+p/Zdywei5ZmoKqAbft2xnhB5uC3NJ8ivlMVaR
	c+I5HKgTdPjnuqsT2cVnqJXPq1FTJZBlBGZbxJXm9ZfCsaH9jj8Q08Jsdi9YBWwDc0pfA6lVzEK
	WM64+vPwLKeaHi8xov1b4WB//9w==
X-Received: by 2002:a05:622a:3c7:b0:535:5fa:ca6e with SMTP id d75a77b69052e-542b75236b4mr201626151cf.51.1793669602205;
        Mon, 02 Nov 2026 17:33:22 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498cb5b520sm12746021cf.26.2026.11.02.17.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:33:21 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
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
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v6 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Mon,  2 Nov 2026 20:33:19 -0500
Message-ID: <20261103-a733-ccu-v6-fw-clocks@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Junhui,

On Fri, Oct 09, 2026 at 11:52:08PM +0800, Junhui Liu wrote:
> +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0", r_apb_parents, 0x100,
> +				      1, 3,	/* P */
> +				      4, 3,	/* mux */
> +				      BIT(0),	/* gate */
> +				      0);

On a Cubie A7S with vendor boot firmware, v6 reaches a Linux shell but
stalls at warm reboot. The system-controller firmware uses the R-domain
timer and mailboxes without Linux clock consumers, so disabling these
clocks as unused can leave its services unavailable.

Could you consider marking r-timer0, bus-r-timer, bus-r-riscv and
bus-r-msgbox here, and bus-msgbox0 in 7/8, CLK_IS_CRITICAL in the next
revision? My standalone patch has the diff, firmware references and
board results:
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com

With those five flags, two RAM boots of my A7S integration completed
warm reboots without clk_ignore_unused, and all five clocks reported
enabled. That is one board on vendor firmware. Vinicius reported native
PSCI reboot working on an A7Z without local critical flags on
bus-r-riscv and bus-r-msgbox, with TF-A and U-Boot built from source, so
the boot chain may matter. I haven't tested suspend, or shown that each
of the five flags is needed on its own.

Thanks,
Enzo
