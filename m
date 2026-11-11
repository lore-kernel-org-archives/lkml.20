Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404974;
	b=Oss+/YSWZY4wQXP5qSOilpvWVlUdbLyFR97rP00fl2+ytPVDMD5rfoB7mF6OUgChp1Rr
	 gjOj0Xw+dXMBkFou07ynD2d22+vsvRhg7NxXh+IlYCMfYaILh1H1UnrBfr5Hkzg3AqhX8
	 K7h/RQGS8wqwoUo2B0PUIXkHvo5e7iASClrI2BUZos3M1gqKEl2TMg6Am0bRxi0FG/Jaj
	 Myu4OGeIzb3fucpjiJEZVEVO1uzniXl4X2OqSdpDaMYvmbaTU1OR5x6sRZmq9MbR0QmNr
	 8dggw4KDHhZ/UUg55OAXSu8eDiaJkxZqGuy6dRwawY76IgkDpaAzwRtVhcddLKsQGUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OXy8NjisYDxdyWccLLdZy0AuSzDlkdMHnGHG7lMtXcI=;
	b=JYWEcDEbBBEGJ6vpd4Cnt9OPFst2g2KUiXOKF/sdVm3Wv8S/LAth7f/1ZCPpuEm6xrhS
	 BOxIimgK+ODaTwnlk1UACrvUJGCXTiTznRq1FfNmBA61UujOKRBPSLvxCtp3z/e2Yokan
	 KTHkpCKKzq3m0ii4xp9Wpm7iflW+SM7EuCjnRDKkSe3t00VCBWyMj0YkSm8rXy+cc04iS
	 BEeBKuEHjT0iFYsKiKPf9MVeasRO5+AS5/Hau9fmgI7pUqeZ5Ah8U9UMqUsfTXTQtEfEJ
	 J8x+uNsfDUJhvtsv4sAVfObSOdQV8S6x+TDzLUriGH8dQMUT1TDo5DMYnVKORMp9d1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TVNkjc4l;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274B5606A888
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 274B5606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TVNkjc4l
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b3a332105bso14612377b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404973; x=1795009773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OXy8NjisYDxdyWccLLdZy0AuSzDlkdMHnGHG7lMtXcI=;
        b=TVNkjc4lxMGHzcoYn1hWWtBkdOerZ6f8PMi1a8bYvGO9yJmLQC1Ai2FERmjGsg1VXL
         1hGNlIYrYCREyBZ3tu8x+AXyByHlD5PyDLk7vJYGXW05cJfVopHS0QOfYjerKMjWxqzg
         hTOsTqTOWVHuevHdiit46LEQTtVtQkiIlHDi/ODdWoTrqU8pBOIeZYJqs0fx5pvfrpsK
         iqGQ5uAy2bbhgavb6zdL4kp1puBT7n9pBG6meypSw++eRu4/xCWDN7hfPQ/XmLFZLuwE
         g/SOFwgzhCbq0+6R6yo4z0Z8JQBzHUox2P2kajye0io7mWbn1E+8bBEmH3xIRINdTUvj
         Kddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404973; x=1795009773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXy8NjisYDxdyWccLLdZy0AuSzDlkdMHnGHG7lMtXcI=;
        b=ViGruU5ZkAyl2ej+we9hJPHyhLQm482LA7Twvt4/Gp/kI7LKShpuxo6tas+32YElGe
         rvw1qFhvsy0NYB27VEHUczT69La3gkMtLf41XWuztun60EnYWbTsCPRFjHsZTpBnZbcQ
         JQ5NYp/gHQO1k70tbT64Xbi76bgmjFxbjmjt/w1eD5+fkBwagOC/Vbn5ADGCoIlArwaG
         KC/GqAQS3KM9oGuDWkOmWyHXX1ahjO7yO9W92YirmTyT4r/wupp3s95tVjsVgJrHmQ62
         AuRrd6WU4tFfxCJAkibFHOu+t/kw5YO+kFSrma6/IvcGh/pMqK5/mnRbjfnRDbLyryA0
         qRuQ==
X-Forwarded-Encrypted: i=1; AL+hErHKVq0KUTQTNlay6DjSJeGSNByWEPToCqb4oFBE/Nuzq5sbWhT2J4AcxToZaG1YaN/oUzV4Tr3cQQvIhf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RrWp/XzQoeYe55MIJiSMFz2Fr4+jzOhmFf4XQk0MIbpYJC54j
	I/BcNbw08kbZN8TZ5pbshK0xw64zQEpmEDYOSnSi4WSHtrAVywHbd1Ek
X-Gm-Gg: AYBFou221mdE9pheevB/iz8U1zy+rHCSM7pwXcj+khOjMXTbJ3xzVwcIq0BXZ7Qd134
	60t0DQ7cPU2CIYJ8yrYI6Dh9H9EbCJjAD9yzm+5X6/eQMdcqOIDy3jDvV+Zmov9N9+AjRDk2jgx
	PP7POBkif29ljujRb8Fw2+/RbY5vkmLdO2Dutod7Lf63K6/GoFOVzj3upPAAqdut+1ueLtup+9R
	vKzpm8RSAoJ9ye1aDbeZ7UPou3SHQDR3gKGWJgKvSF0P0yd7hbxLSbv9pRKg8Ium96VxWDucUlg
	+vf4YiGmWbidBOClXgN047/K5DPVOlpZsICp8iCMVUopp5RpCxMrsOoXqpV8hIMt9jWVeb6gP2W
	Z/QQb/7T44OCY+7LXdrcbKflYEJICByVQXw9X34xKWxpqUxJhI3AjkllSKsct88JqN85u8OCZdp
	KO3cQN8Bgimg9r1vBS6oOHo1Y/lJWwkNmofrMnhZkGG5c9g5qmLIpBDevLQ9OcXLdIvH4dUzuml
	7TPzv8xSZz+vM2DLZRtITJGaNSLIoTWNNaVpqJvMM87oANZgbjt41Q+8KVRDzWI0X/1hSILWuAB
	XdOr7NntE88/fLsX+/UOM4fQjOfaZX0vbvXyKRjJmPbj/+ki8bCXVVrZsHwUh7S3Xqgv+3SU6ow
	LLZazfRjrwz+btx8caoRWsUvKfAmtBBBWuTYbp9AvfFHoNJsBKVOuM9LR74SlesLBYy1dPRgcee
	w=
X-Received: by 2002:a05:690c:399:b0:873:5c6b:a31d with SMTP id 00721157ae682-8b3a80c2c99mr17468437b3.23.1794404971972;
        Wed, 11 Nov 2026 05:49:31 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm44519817b3.34.2026.11.11.05.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:31 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
Date: Wed, 11 Nov 2026 10:49:14 -0300
Message-ID: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Add a board DT for the Radxa Cubie A7Z (Allwinner A733), based on Enzo's
A733 SoC description and Cubie A7S DT [1].

The A7Z differs from the A7S in its PG supply (BLDO5), the SY8089
regulator feeding the PMIC's BLDO and CLDO inputs, and the microSD
card-detect line, which has an external pull-up. The series enables
UART0, the AXP318W PMIC, MMC0, RTC, bank supplies and the green user LED.

Tested on a Cubie A7Z with v7.4-rc1 and the posted A733 prerequisites.
Eight CPUs, R-I2C0/PMIC, MMC0 read/write at 3.3 V, RTC, LED, PSCI
reboot/power-off and CPU hotplug worked.

MMC0 card-detect hotplug needs the separate A733 EINT-mux fix [8]. The
tested DTB also had a local 16 MiB no-map reservation for my boot
firmware, which is not part of this series.

Dependencies:
[1] https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.com
[2] https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech
[3] https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
[4] https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
[5] https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[6] https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com
[7] https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
[8] https://lore.kernel.org/r/20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com

Vinicius Pedrosa (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7Z
  arm64: dts: allwinner: add Radxa Cubie A7Z board
  arm64: dts: allwinner: sun60i-a733-cubie-a7z: add the user LED

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 298 ++++++++++++++++++
 3 files changed, 304 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: 0ed6b92774b5b794761c7ce34db653a5435dc833
prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
prerequisite-patch-id: 74d03898c5ce14763f4e89fb73e021de59f0fb9f
prerequisite-patch-id: 9225cb094cf6cbb338b14ac63711d68bed12d24d
prerequisite-patch-id: 568dae1c91a0d7318d6eb14a18054343b84b603a
prerequisite-patch-id: ff3806332e741f0e2c8dac1c11f4c71449c16c8c
prerequisite-patch-id: 39461e0543aefb5c40184664625cbab19ac8408a
prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
prerequisite-patch-id: e27ef0b1e3a7fc0a659a1a82c1a7184665451265
prerequisite-patch-id: c598480f753e36b7f6230129b864c559b9f185d5
prerequisite-patch-id: f86b468a896a40f132adfcba885700327dff1bc5
prerequisite-patch-id: 079d60101e1b9e5425458060314bde3e9cc2fe4c
prerequisite-patch-id: 5d657469bcf35ca76bbe291203363403e00fab54
prerequisite-patch-id: 85db03df3394cdcb2780a0da122a74b2c1fe220d
prerequisite-patch-id: a3e883da50bf03e8f522444def66fec7f996ffbe
prerequisite-patch-id: c6889699a6dc13c336ce4cf4659e21b551e9a9fc
prerequisite-patch-id: af0aebcae7c38d58354925119c412178b5821b5e
prerequisite-patch-id: beb8a098ba14724e316ff243bdf8e00e729243c1
prerequisite-patch-id: 63342c5ec38e8eb9e55c8c74d3c5a81a630d5f69
prerequisite-patch-id: 1dc8d70f80674c98b2b15d09556dd27f643b20da
prerequisite-patch-id: cf6d9a8d3f2089f59a8a5afb4cc9375d7a6dc482
prerequisite-patch-id: 4cdaae8c384016491ce01e6e328acbb347debd62
prerequisite-patch-id: cb253a02b7d81079cc1ea4f75def94564468c80c
prerequisite-patch-id: 1f869e65014f3cd678bab7f235cbcb14c60a1608
prerequisite-patch-id: 184825f979a16a0b6900c58ba342899747da11b4
-- 
2.43.0

