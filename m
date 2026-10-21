Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580408;
	b=xM8iHADOFDzW58BIgT0kFMszTzAy+ENWxRgmuxho2ggOkpYj/K6/SKYIG65+83BUDZxd
	 cMk+2qh8dR/gcB0ZSjS0o68tWncK6CCkgkpmGujPV2wjYgCHuGZ2Ov8/TOhF46fzEAGXV
	 zL6+gVR1W/HFKqLnEVV+FYSiDRkfC5K6ZO+kpHeVGu90keWaPBBUm6O6wgJmtSBMgqgrj
	 +P49MTipZ7re2GylERY/RdS5PN1UAIjx45CXtbN3zb6OOaWP/9APyBXasqbEGQBSm7IYg
	 MTXgaAGBn6KY9RW0XMZ0sWqpYLETA/kedmFO9JDM+1vzVgjRo3gs93BbvdTO/MKjA8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=An+ETgbADntwtFKiPu43Mts6liLduZLS5iQIAQ+a5W8=;
	b=N8AZKHShUw1BB6yQ6Vjk9wwhfQUriFhTUXe0v7goPHXZck1yhpefSkql6laaOxVHOlOR
	 Ss9UDauKZwhIdv8Z30rN4bHQ3vffCSNieuFxAk65d9+SmgCDp9FOSC4Z5HSBv1vc0ItxB
	 D1ZtIazYRrfcFNyz5ZGTfpyyz3XkbnW3e4klBd/HYsiNAXv/qVofpTYP3NuRWe1dGVLqN
	 896COs6NfYDzLw4/GBag1FrXqMYsrdbxZVwhCGn4+gvsibsfmL/tIad3aAPGre47pp8We
	 WhbAaCcBktLFjwh5TCgbIkGUaj76B2lYYjimKsPZPfQSAFK5UXTJvJfGZ0EuBMrlonw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cD9VTAj5;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E30606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73E30606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cD9VTAj5
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so169899a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792580408; x=1793185208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=An+ETgbADntwtFKiPu43Mts6liLduZLS5iQIAQ+a5W8=;
        b=cD9VTAj53OPERn37dHuTGUZB4REtJ1I7VzpktNygl/tR2wuIKZ9E6n4EQ94oL/kd9k
         8PakWWnAKJDJ2Nh4TzQBv6fX6/Q1nGDKDjr0Xn2LasBQk8k2VWtlG5nYn836bLakBvLz
         55ZQIwApzttJb2OlV5vPm08MUh1qTO+wx53c0cIlBVelREQvymTN8sdvIE45yD8FQCu6
         vhTvSlM3skR92w4GTAj95bOkHVkafXBkctfpbF3ATYznm5QeKPLB0Npr7QFKEy9yEfux
         J0lQvUii9GJ+pQoxKhi1SqX9iJuiQnc3wNJkP2IdX/CJsuCGT/CcPBbbajWPu8aF4cCm
         FINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580408; x=1793185208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=An+ETgbADntwtFKiPu43Mts6liLduZLS5iQIAQ+a5W8=;
        b=taEO774LOK23ux1D2Ygjw0542m/zit/144VzaYmG1zsKdxXpc/NA9UCuFbQXu95tlD
         J18rQFezgo0lXSdQoBuQ6+yHjMFr1llGHX52hFoMCW8fB2jc5O4HCEAXkFuVae2A7Eop
         1Hg6VL/QkojqTV68j3bKU4gPcHo3xeYoMJkL+zMHt28lZPh080RfrDiXY5wlLFaUEE1e
         MiubHLeeTVLuwonuYyyEva7ah+qVcvwyhbvOJ8HwsECh0NM01f3iUkgYnPb/5aN6QGtl
         GPRcKiDx0PeFPzxq8ds2uZLAf7TxiXd7q9+X4d/V5r8GJYROfZHbHrx0TLZpC0woaddS
         yXJQ==
X-Forwarded-Encrypted: i=1; AKwUvByGI20MtgIam+oOiN2qPg7cBAg1w/oLr/R1fI13msEt3yxtW72JNGBdFsi4yAVkr5GTvPMgH+qReL0s52E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNhrG526u3Anjimx1Cuzir+oK4Q6yRr6y8VDr3oLjIPUQn6wfd
	QREpE4M/kbrsenedVw7Gcnxzud+ryooOwcZK/dM+kepcrkVlfkBW8fE5
X-Gm-Gg: AYBFou3kdlJNgQB06m3XUztE7uG2lEVpWrDFBc7gBvyE3RJLi7hJKhtafeaHIJFmMcK
	cg3bWjwlhHSIm+JqwV7zLxm7mAnFdxua8ilVhQuPDRCm7w2hk7WSYOlMslv/cVlV46U3OdhujhZ
	/qo63w2htzbgqmTWceJS9XfD8Z9i4fFLQFZHcSOoVSlGzHLeJSmMSQnt8MLF9lB3E+NeFO9w64Z
	Kd+h0FuembeWRW24at7VItYwC6EEjz3XotlMa3u/ug0if+gP2NBp7CXK8J/3XpOwvBrmcg7U9zi
	NQNZmU5PGMhWIRkIs/yNqsBXJ3l6EN0ojSgysl4Ojf5RGxnDzqshG5Bj8NM1HNUmkyt/MD1hCar
	sIeCzoMMnk3dGjAiL3l38L1CecrfWCWXkGl1xTN0amC15mBB0vRwELETupRVEgDg/4XJ1HCTv2x
	Zgfal9PYnhSEe0r+6iBGG74Gdk8app/1ZaTq3/JLss1Chiekewkrn6AOo9ZPzy0Q+tkxI2QFGHR
	+XLiWfBCugLi/tGNfutQMczGEInLvdxqP81rnMyBD+Q8vdOfnah9g64DZQmCjxnGBlEYFHckc4J
	28/z1nGWGS3+r0xhhpT6kXYRtnOlL7D6vkfA7H6dsShnszvMZE9n4Pq6F/Sbqn/eZ3Z8/BmUMyM
	WFDtpouTOtmnhayExoTTyZKnw5DyAPid83cE=
X-Received: by 2002:a05:6300:210e:b0:3d3:ae1f:d7f8 with SMTP id adf61e73a8af0-3e287df515emr1543449637.24.1792580407543;
        Wed, 21 Oct 2026 04:00:07 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6a85c6fbesm656992a12.11.2026.10.21.04.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:00:06 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: E Shattow <e@freeshell.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Wed, 21 Oct 2026 18:59:59 +0800
Message-ID: <20261021110001.2905669-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083425-GKA125937@kernel.org>
References: <20261017180141.3477743-3-alan.tseng.cs@gmail.com> <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de> <20261019141752.2077207-1-alan.tseng.cs@gmail.com> <20261021083425-GKA125937@kernel.org>
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

Hi Yixun,

Yixun Lan wrote:
> but for bootph-pre-ram, isn't it about the DT nodes which needed before DDR
> initialization in SPL stage, and should have nothing to do with BootROM?

Thanks for checking with the vendor. I agree, the schema defines it as
"the phase that sets up SDRAM".

I also need to correct what I said earlier: the EEPROM is not only
used to tell the boards apart. It also holds the board's DRAM
configuration (number of chip selects, data rate and DDR type), which
has to be read before DRAM can be trained [1].

So in v3 I'd like to keep the i2c2 and EEPROM tags, and also tag the
EEPROM on the OrangePi RV2 and R2S, which I missed in v2.

E, does that address your concern?

[1] board/spacemit/k1/spl.c in U-Boot, ddr_early_init() -> read_ddr_info()

Thanks,
Hung-Chun
