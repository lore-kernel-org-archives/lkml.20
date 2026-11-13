Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530157;
	b=Bgpxx3HoH1qLyxJdx82wq2+OI2jcty3bBYGHT4Sr/8S+l6C+WNisyjUMDsvUM9U8SxF9
	 fJSdeRShpTg9lk3fwGy+xZTxlxPSSoy5GsQQ1h3p4if+hflxWLu0xw2F8JajcLRKtorcS
	 gF46ezY440Ytgi2grdIBNXHyQVLvLY4SJmSgBRC4ybGFCByvCoIFJrtGRhJHoC8xzClXb
	 PtJ0DQlEcBF/HciBTJy2E7RSh0j8HX9G2gytH5flryDj8i75r5Mu76CP/CYNyqdNEEgjI
	 TRsGqIIuC0/hTwCKyz82cu+MdeDG1GyqNLrECljdMUPMQWFIvo8D7vffmMNsh+yd5gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kTNrEmxNbCnmj9l3gKKv43Fyixiy3ZR1yX2zY41P3W0=;
	b=0CJoCJAC7T2veRyLJ5ZOZovLAUcRo6reDqEe6dK3XO21hP1Kv4hq5wnNhC8Jl8V3TCQQ
	 WsYzYoT2J0tsMsREc6eI0U1lKsAg8sAq2W/+h3da+7OImWjfeHbBdRC6FvIClHVX0XP9q
	 16BIKZvVf8RVKOnsNQpSIGDSaC83UKZ8EE1ItG7oHCK3QIc3CeyOx8S3WkIg2OM1pbvRi
	 dwjRiRvumsL7jhsVWga1NJimzYReCWXxVXj9S5bTSzadNhbU7w/9XVaBK3xt9IyYDrUEN
	 fvqCp5Vx2DoWYWjzAEIKheTVzw6wSp8yDTQLf6YNHpwGh7huxxWF72ZpH8DirUKh2sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pm4bRzhY;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14D7606C25A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A14D7606C25A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pm4bRzhY
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491971ac844so386940f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530155; x=1795134955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kTNrEmxNbCnmj9l3gKKv43Fyixiy3ZR1yX2zY41P3W0=;
        b=pm4bRzhY2y3ustnK/cV3mx2MU4TpafN1DP6eVrVfEWP6zwyrwZ8WcDJbBpaSn4PCS1
         q9/VX/T7EbPj4GABXhTxz1EpjBBlJ5C6LjvWS8+R1MyrkwtZqFceJNwX44oFw+7COG4F
         1gfOA+vK6jEPJTD/xSnbdkkUcNMj3shVBA1DlbgDKzaydRB4LWv4xwEw4b0FU73Ik21N
         +vouDhlWEkCOD4DZamc4To4pzA8LXBUO2O7oFaIdM7cWs47aP2/ISYgSiypk/Ibch+NN
         iUQoIvdKBDkOBgZw/fIiTtBmgSBvjcKDT5zuJIZZ/Wp8eQMkuKNaarb7YNm3NG1cX3MH
         ShMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530155; x=1795134955;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTNrEmxNbCnmj9l3gKKv43Fyixiy3ZR1yX2zY41P3W0=;
        b=k3IWk9LNs7AodjAqQcrhGp0FeWYI4HV+Kq3cg0hzESTi9xPTYpcjAmkeH6/oa6ue3T
         lTwKf9z2X3e7ZNFJPJnYt2jzaRdpiigXFOYDYXbwC/gwGmKiBvQPsDCEWJVb7iaIWDiY
         uUIuyF4PdNw4eWMgqpFVGpTLEFSJ/PqFDYQ35BR5EntrsyxSNcCBLZTwE9yGgdVsvxOT
         HX8K2JZd3aLyotMA2gCDBPzVqMYpHWVAS3DkguQmPhU679kEiRRP83AL0Iz4FDe7jwvX
         c1oI/DhgKLmpgoiAKwiTW5hU5U9zhhFXHAbZrfX6W4dU3ZzxK8NtBcugjjy6N9ewyli4
         QbhA==
X-Forwarded-Encrypted: i=1; AL+hErHDMzJDNFh1IrXJdhlgzz4Eva786Sws3fW7T8HuzpDlvq2IYIicvon1HEjz9GtTWjHNj/XVCS3c/9kce5Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z843wSCAbOScmYUM32RYqI992GOabFf48IMan2yOrBGI+F0Ahm1
	lT54TPGG9uCaOesYinAUS/o2HmCf7u+/vRWRe5imF+7ErCqWSn0jdpQh
X-Gm-Gg: AYBFou3r/uhVjG6gjwvAn2Zj8/K6xLDiFohcFxQrSU3aTEHHrk3edzlIgkbgLl1HOg4
	ncSIpsmLV1pJnRr0kDMXDRFoYea36F8D1D5OFJfSVxOIvVIQ93nMdJeZkKjs4BZSb3HVbk1P7g/
	Nu3j9Pr5RB2OsyvBLoFbzc8aleW97E3mthDwrV4XvzmNNm+pFy1nWYOAttcBpZJbA9coIdZP5iA
	o49oDBbuba4JoE/uBw/l4gsIe36MAdgFPct0axaImYZ7ElYWdQLw981B/c7OsaMQGi5M9GmIfeS
	OP0JTPqKdMZuQnaaZPdLiCd7RHa/k/B8g+Y89CNcgzrn6b3xVYwgmnkK4as+hFyHaJb8QiFSJYu
	bNYF4NDCxlvyHxQvTzcv+sQzTrsU+pb2mlbX4LKww8n5b+Iwnnxgruo7Lj9BDkTehTab6JyGrZf
	J3HKpk3kE/u96lyBs8wNUd189CRM1sNRNbp7xx0YMaE+FR5cEJW9vFxrx+MzP5Fekn6ODSyrkv2
	G//mWYEEwcjnHhB+6G9XNVi3re/jTYClwbrYoRKoOv+PCpMcwk/1TVjX3PdRYLsihUgI/vDmHuX
	wiemfatV4U2QiSoRE8Eo499MqsFYyeHB2t1MAgYyt6zKhKI+YgM/Mz/rGt+OtuH8s0whec/9OPP
	e8FjnTzFNmUbzs4CIL6GDZT/aaQMp0O7wJP8WWACM4pt7nPC2ukd3dkHZ+yuMTnXM1Cf2siwU/z
	VKKWqxm6tIVSh0Sji+
X-Received: by 2002:a05:6000:2508:b0:498:a72d:c097 with SMTP id ffacd0b85a97d-49c70ed7c56mr2426773f8f.19.1794530155089;
        Thu, 12 Nov 2026 16:35:55 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm1497029f8f.5.2026.11.12.16.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:35:54 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 20/24] spi: zx: Add ZTE ZX family SPI flash controller driver
Date: Fri, 13 Nov 2026 00:35:53 +0000
Message-ID: <20261113003553.3661566-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <jjb8MyAPSXaXqHtedDkkwQ@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-21-ghahramani.navid@gmail.com> <jjb8MyAPSXaXqHtedDkkwQ@gmail.com>
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

Hi Stefan,

Thanks for looking at the changes. Since you plan to submit the driver
yourself, I am dropping the SPI patches from my series, so this is just
to answer your questions.

Stefan Dösinger wrote:
> So IOW, this function should primarily configure ZX_QSPI_TIMING_REG. If the
> target clock can't be achieved with the controller input clock (e.g. divider
> is larger than ZX_QSPI_TIMING_REG supports or clock rate is lower than
> requested SPI speed), then a change to the wclk is in order.

Agreed. I only changed the wclk because that is what worked on my
board, and I never checked whether ZX_QSPI_TIMING_REG has a divider.

> > +	ctrl->min_speed_hz = clk_round_rate(qspi->wclk, 1);
> > +	ctrl->max_speed_hz = 50000000;
> This looks wrong - the max speed is probably the highest possible wclk rate,
> the lowest speed the lowest possible wclk rate divided by the highest possible
> divider.

Agreed.

> > +	/* Ensure proper data sampling point */
> > +	reg = readl_relaxed(qspi->io_base + ZX_QSPI_TIMING_REG);
> > +	if (!FIELD_GET(GENMASK(17, 16), reg)) {
> > +		reg |= FIELD_PREP(GENMASK(17, 16), 1);
> > +		writel_relaxed(reg, qspi->io_base + ZX_QSPI_TIMING_REG);
> > +	}
> I don't know what this is doing. Can you elaborate?

That value came over from the earlier driver I used on this board,
which always wrote 1 to bits 17:16. There is no public register
documentation for this SoC, so I kept it, and v2 only writes it when
the field reads 0. The sampling point in the comment is my guess at
what it does and I have not tried other values. If it matters for your
driver, I can try 0 to 3 on my board and tell you which ones read the
flash correctly.

Best regards,
Navid
