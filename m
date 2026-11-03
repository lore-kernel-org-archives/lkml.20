Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707933;
	b=4O9xS0Jco41v49FLNvv5QrdleYvnYvv8C6l+8o+LIN6Jk/ksioUHQoY8F2dnTJ7yHHF4
	 iudcnlQn3pOAVzeKZ/x8sVxcmeJpZTFMIM+7mMuBWYJzdb/ZWxvx8/jLhRam1tUv6Ix5A
	 jPjXkIABgV4Hi7GfOk9hrSfaB0LpUhmwfVoSpv7l8pv8SEEBnGdz9Lt/a3v8HlIN+5wG1
	 xcDOToysVKjhF6yq2GHxXw7jcJw78bOuOpvqvMxZntjM3g5YErkpM51jGz9qMcOnflwM3
	 7Ar0PitNI4xfBK8uempO5IiPQ/x7YebCiYKmoW9eonQtVl/nAg1Uc+rwYrRXmIdk6ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=p7XwenWdW96OgNgWcGPygbhPSyvm8Dmo6vx2RBl2lPo=;
	b=kvVKo1G/cq4Wv17TGsTcEAAJu93jc+Jk0G0ebxTo/31VVYatyhEg1x26aUO+LyvAVVO4
	 2HVdqtvapXxleyaGss8/E56D74U2vwoVMi20FwONLRc0lSuee7JG9CRGYkcna5sZWwvZY
	 X5k/D9evT0TEGgd/Yn28JUFaUbGKFfC6EARUrghbmbxrh7XO5vqF93Jw6wLtDDb57+XvY
	 cQuhWT+xoNFzZA5rlE5nZZuWbORrxUXXHpKHWCpm+skgv9qqlcvbjp4YOaDHR1n45J44R
	 xZeQ2ZTbXF43E+d9HZKuQG3Hss0Elrt+rCsYkhhSFQnbDwNkv7wzRoxsyWsOjO2SipQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGkxPCLX;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5991606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5991606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGkxPCLX
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9950a7530d9so1234032241.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793707932; x=1794312732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p7XwenWdW96OgNgWcGPygbhPSyvm8Dmo6vx2RBl2lPo=;
        b=DGkxPCLX5GXvmx7M8dJnArR00vt8VtdGbHun9M0TeHbmz4k8r8YkOtmJx2Ok4rPPHu
         +IyyaebAkT0PCI9hcq6wWzwfa4+Ir39EyF1hBUB/YTm2aqp/Od1kw10j98TRkpxAOopA
         /YpE4umx9UMpsxEa3EJScBaoG7kCMx9RaFx0J50OYl0Ug5qm1Iu3MyvpXCjT70amlUX2
         eF8iQyRRquy4+y3XIOlPL8Ompve33U3UDw4XHE5tjYNsw/J9X0bTDrlWIohLLzjCeAvk
         g2lrhjn6EqumWcrGC/u0MrminOOvZ+mrLuaBfCngZZajxspfBocPmHuNRO1M1AD2OptY
         aUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793707932; x=1794312732;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7XwenWdW96OgNgWcGPygbhPSyvm8Dmo6vx2RBl2lPo=;
        b=edF6mvboWWVEmpSMYp3vsWJMsKjgnC0T50U+kZF4qK8C5nnLVc9/3//ylTu8SfBXQS
         /6cHG81AELmYX3/H0NwMo/avqeAtSsUarrlYOgPQTbavMdaduxdVwVbIM6HEsI0i3Vw4
         YxngJDlX3ec+hKW9oZhFKAjtdetSyQyxzASWMa+EPfmmE/+fZz2hxxZqAWzhwBszGn5D
         YJ0YDIpfGZ8aGbEqu2T1G+B/vqxZgz0HeKJB1pD/BtFROIqZEF88wC9RyWxmSPGNxyt3
         mDni/5osgYaIHbE6fvGg9ixpQhiuQqQfyiISBKqJaJuRg5oGZTm706IKROJrhgFeyTrW
         UMIw==
X-Forwarded-Encrypted: i=1; AKwUvBw6aYDRLqQ6KSn4ftYF6/T+zBzccnVJa6GJpZJWeoWlo+G0DaHuRztw6LTsfCdEZAgiTvPytQsyS0XrsrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/02ZCCQSvfuzQ8JS7QFtesF+1AirWlPT8A8WjoNO+LP4LZXLwk
	8EAZh7jRfYCU1Q+vlo7ajWek6iZ3oQGHTqVHjQlTaqHn7JGjEJOb0+o8
X-Gm-Gg: AYBFou2eMD5WgBCX9kPkL2JrwyUdCeHwWE8AHz93KIEZFk0cgzyKcfFv48MSbPfXWRC
	231C/Yxg1EekgYZn77J8oISR/0XgJyE1tW2WqU/rfQHig+lxywf0ZA8vX0JWee9+fQnSciCBs3M
	NUFkJS9avwzKUfk3qtTOHBDnxqoSsSa9gByGiTKdBC+mSO5NyyqLxC+heYTWg9wkiuZ02YAsc1G
	9KQ5Rz1p8fFen9194WIDQ8gCb/BPd99TUeb5q2bN9BsqYvTBAi5TTPvWj/qLjkaH6WHjpwKaqKs
	9+VLhJCMeyOzGbwlVBYPplNGt2YbgB3hxWUDYEAcJwdhqxpOOr2CCC6bmvPfjpZGVVqSwTter/p
	UviJZIzy7Nvtxmn/9bBaoFdjukFkwHfNyeOMi98P5f+XlPOyW06T/lp/lMs55MrCgaU2xCWnYxc
	SIBzI7yxQoSOCAUKPm6OrXj+j1TAKqL9mPSgKO/r8OCnQjPasS8irZuJ6qYBMUqp0g9qv4rlbdy
	Ju3tG3u1x7pO/9RY0hOpi1kk1C/U1+g/bP5CLOG3FVpo4t4wAq0oifse3XBWTwDX+9AzhgV39YQ
	QnXZJU2U1tXMor4dK3fHIMSGjFNCz+iAI9yTeApWpRc4St22FMgEC+5Zix3+gHJCiRXaOs6H7Az
	11KXI8yqlLeiWqSV1xOeaV8CYfbzp6cNr4blS
X-Received: by 2002:a05:6102:fa0:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7d072670942mr5461054137.16.1793707931886;
        Tue, 03 Nov 2026 04:12:11 -0800 (PST)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d0775a716dsm12606282137.6.2026.11.03.04.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:12:11 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
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
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
Date: Tue,  3 Nov 2026 09:11:49 -0300
Message-ID: <20261103121149.33238-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <30e43e84-e6e8-4024-b415-dedf67070c4f@arm.com>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech> <30e43e84-e6e8-4024-b415-dedf67070c4f@arm.com>
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

Hi Andre,

On 11/2/26 16:32, Andre Przywara wrote:
[...]
> > +static const struct clk_parent_data usb01_ref_parents[] = {
> > +	{ .hw = &sys_24M_clk.hw },
> > +	{ .fw_name = "hosc" },
> > +};
> > +static SUNXI_CCU_MUX_DATA(usb01_ref_clk, "usb01-ref", usb01_ref_parents, 0x1340, 24, 3, 0);
> > +
> > +static SUNXI_CCU_MUX_DATA(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_parents, 0x1348, 24, 3, 0);
>
> Don't these two clocks miss the gate at bit 31? So it should be
> SUNXI_CCU_MUX_DATA_WITH_GATE instead?

Yes, both have the gate at bit 31 in the manual, and the vendor CCU
models 0x1340 with it too. usb2-u2-ref resets to off, which is the one
I hit on my board. usb01-ref resets to on, so nothing breaks today.

With the gate added, clk_disable_unused would switch usb01-ref off
unless something claims it, and in my local DT nothing does (the
USB0/USB1 PHYs take osc24M like the A523 ones). On my Cubie A7Z,
clearing bit 31 of 0x1340 at runtime stops the USB1 Wi-Fi traffic, and
after rebinding EHCI1/OHCI1 the device no longer enumerates (error -62),
4 out of 4, while it enumerates again with the bit set. So at least USB1
will need CLK_USB01_REF kept enabled once the gate is added, likely
through a consumer in the USB controller or PHY, as suggested by the
vendor DT. I only tested USB1, by writing the register, not the gated
CCU itself.

Thanks also for your guidance throughout these discussions.

Thanks,
Vinicius
