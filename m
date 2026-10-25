Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936687;
	b=p1a/NVQ1VYTN/n8HOS3+D6VOAxN4hbvvhCsfPv+RYqiHY6iHTIMhLBMNwHstGN1/ziTp
	 IaBcIwLWnjsgeTU6dXFZP5mzwj83mmf1dBTraCp7m4HAOzGBMiAwXFfUBtYGI3oMKF2vh
	 nD9g/9skCC96u51LTciaUMKayLJp+xSXpHMRSSkBYII5pwftd7ts79wi8yuhTP4m2lMFd
	 nluPpYmVcwTihHqEBDe9bSU75tI2b1PYJvTSGwatLtKtBd/yFBd5SkorvlQc+miKz1Nfm
	 DnxsGu9cMH1DvDeMVM6c39OJglRt8W4jemX3TnrZkaeII07r2lkIDym0tFvb7V3zsxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qkMrb47+RHanbLgsTwNr0QXPtl5wufkJw6Ld4BtzfH4=;
	b=a4RCSRr0DKcc/spsC3EmUMBknKGsUgGewa5zwnxSf60RIMMWGcrlfzB3uYhyICOHvJjE
	 DMq+wdfjFKtlp5Tfl1xLg449pVCxubjhy5+gg3Ovodskb2ji4wCGcO2HdWvdyiAzAUrYV
	 VNGM9wUIuCJwd9Fy73tP8pxPXZiO6XQKo5vmy6ahzHXU34l346RzbVkhfPVKp3whdXd8V
	 Zgslx/Tl4qgkaalzOKETl5lU8loWtjZWDmVvrYeLRfK4QTUZXj93xa5Gcj62jfS7SKsfS
	 Tdi+CxeKHdDdBpB2PZxOHRMOFHjY967Ybhhd6OTrqr+onvvkKIcdGSR5Ck8r73ZPIXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=celnVUjz;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84CD606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B84CD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=celnVUjz
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1333239f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936685; x=1793541485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qkMrb47+RHanbLgsTwNr0QXPtl5wufkJw6Ld4BtzfH4=;
        b=celnVUjzyZ8riqqT/ARqFvt9z4k/NHLK86xuATMVdPDr6kaLZTTT2r+GCU14BDWnHb
         3fJSaXpBZbkXX0G28U6S/4p/5X9QvkKAcOzdUBcAr9Xxjljg1cLKJlmysIUOrLDb+OsI
         UnMt8FmHp9GKNffFb08sp5UTcTtqZ6Dq8dvaEoLKM7duXoPq8/tzKwbpEfWyIctDGZYJ
         UX0niJD7GNp51iwmyJPaEL5wo5vlEFmIcgnabGuy6uJdKrGX3d0Ji06M1k4f4C6dG3zq
         UfsrphygzVrxpFvHut3PhBzATLc5HaiEV00ON/wK9KDTXJSxU2VDMpFzU7q3UAJqefvD
         RW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936685; x=1793541485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkMrb47+RHanbLgsTwNr0QXPtl5wufkJw6Ld4BtzfH4=;
        b=JHiVRX6+uI8/33ZwDmBSZKSNcipibCoAgR5WliKnue0kouBXJ6vwFsXluvlFmcWlLc
         /yZiHadL86xMIjMymsmDT9nits7M9GJqfKrRHaOjY96fWFa1lz4RVVX4DyXpX7UwOK+Z
         HHjWSUFxkXYejMP+LGEM3DpD6vrwcF2bzMj5JKVx7ntRqD7l9UlpNnEVAOmkB2i2Tho8
         rYMzT2D9Yq2AHzb2fE0IE3YDjfk7iEqw7XDyvDN9/RI8IBgllWrP1LGN+Bzy6ogO3BQH
         cwZKFfXj0dfcTYDuw/kHDNQwehFcT82ZWyEdk1Q7rDoY6C7gpkV9uANMW2LIwm5VRrDi
         RDcA==
X-Forwarded-Encrypted: i=1; AKwUvBzN3OLPFN3AqOVuvYEbw7N+Dd2D4fTbp2FgeoVmcfJywXtUadujqfbCDr2+jWURhgGhJ/Ja1NWzDoBDIv0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ6tKv6LpRVz70By/7DUS1ru4Q54yWnfDdvL9SvvI7BZwb2guy
	2QGNsQ3R28IUZPlgO9rh9/AY5GZMrJbDKNxzrgLUbVO6wuWmGZMg/7XH
X-Gm-Gg: AYBFou1gRw/0i4m0cIqCQIK/y5E1ZqtX3EMwYhLXWTGiTBsTPHA9p5VtMKxNUI+ENX5
	EM/lSr86eXzxyWMb64VBfS2sbNZxjyfqIpv93iarWsD6sy9xgwxYd1xU+O0aPavpS5bzsKJ6laQ
	JM7yqOzEcWN3LRhFF61BuaenGO8LC208P0LnqomwJw8hHASrR0e0b4NzZxd9uuYoM7S2bRc9z+S
	E25gxzz4YXZlK2H2ivTz3XAjaNQiqGSQl2MN/9WdMG6t8udUKzbFYCGsNX7B0ktdwL0x43QUUFX
	c8GikeMdUBcnsLdFRB2OBq1IMUm0xRRTQrFG/P28oQ6d4fWGCwQJtmikxQHDiod4BAP6Nr0xXjp
	cybjeNQEy2yy0V3B2K3c9c3CCVY3GGUJ2/Hy4iQ8Po7/F37J0A7KjyOZhb01QJOyp2DB7t8Mleq
	t7R4P2P+7YN+P0ma7Wv/EvKd9CzN4/u06OHXtx/IBjTf0AY67bHOGfF8PkMpRcwl3xAP9tVw3/M
	X5qBDLWUKh/9XO1Z5ulLkLFTodvS0GDrjBQcrFEcrZS/STFIgu2McqDa15HZfXIDqcERtROND7s
	uJ+bxBmW376JGA==
X-Received: by 2002:a5d:6308:0:b0:48e:20ed:ce67 with SMTP id ffacd0b85a97d-48e3eb8bf9cmr5477047f8f.23.1792936684892;
        Sun, 25 Oct 2026 06:58:04 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:03 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 13:57:42 +0000
Message-ID: <20261025135745.102970-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
none. The A523 got a DT interrupt for its unimplemented PA bank to work
around that, the A733 would need the same, and on both PK is written
past the end of irq_array.

Number the IRQ banks like the static drivers do, with irq_bank_map for
the A523 and A733, and drop the PA interrupt from the binding and the
A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
made-up interrupt.

v2:
- give the A523 and A733 an irq_bank_map, and drop the PA interrupt
  from the binding and the A523 DT

Pablo Mazzini (3):
  pinctrl: sunxi: dt: number the IRQ banks from the first one that has
    IRQs
  dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
  arm64: dts: allwinner: a523: drop the PA GPIO interrupt

 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++-----
 5 files changed, 13 insertions(+), 13 deletions(-)


base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
-- 
2.52.0

