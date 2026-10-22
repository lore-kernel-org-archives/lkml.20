Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659157;
	b=tX4hZg4sqYepZwZk2jhXUMzDewHNSY4ZcR5wyTJjfOsYCxj/oH6B+8TwCXBo653eMzKk
	 OVYKwZsiM+39loKObpv6CLMCBjfv5AiyJnenFalkFZEUZWmF/Aoj1W0ilNb0m6mZ/XChi
	 pU6sqDF6Bx/YJ9yypMvFW/O3CPmqgVovCwHpGZTT+Wrb3nZg9LN6XMYkJ+ArrnUbWYv4N
	 wwQgQUmWDVtcG6Lobsi9MBhBsmNCW3HkGivcqqwE3gFTThsUGKG9bOJkVLUfPupc+IZm3
	 aK09htZP8NfQAMyKW/1AV9aD6RFuEPPOK7cvJXGaYmn6aAVvipVj30+myKjgJkZSQWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659157;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=O6yBlpuOxfizbYunp9VGeD1o4T8S/iI/hNccth1cz7I=;
	b=PPInSdjqK1rBs9TSUZfm5SBQNErwI+si4cXHJTuVfDUi894oyMdJNZZmpYX6ynh9Qtli
	 zIUy7ng96t+03UvKgSnZfCY4MxUGHcXN3934VcjYKBc8/xgaoxLvh9Zv67uRmW+QQIQYE
	 5sjq7Dha+1GVoLrBoumgwjI5faSOLnRT12o0rGRCmYSFR52PF9SpHbGBKUknWizPbwNlQ
	 +gk50CpGnMPDAObnmeBNqVJOhfJFD85eoHK9LF3FE5tXB8oSO6HdndqHtJNIFetT55f6K
	 xZU5Yrep2psaRAaiEu0/V1u+ZPr5QPkzUNalvzlGRgACU7pMZ134B5fLW40aIIUIvOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=ocxJy72y;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=BHRWNcXa;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320FF606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 320FF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=ocxJy72y;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=BHRWNcXa
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 454FD14001A4
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:52:36 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 22 Oct 2026 04:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792659154;
	 x=1792745554; bh=O6yBlpuOxfizbYunp9VGeD1o4T8S/iI/hNccth1cz7I=; b=
	ocxJy72yM0D7KzlpU06fUICc5hjH/OvY9oB7iipHTiX2sFk9VO0fnfrov1BZqXEc
	AHzlxvC1CKXBnJmG29O3ifdqpyT4ylKO6fMxSWzXim1Lot7s9u5QGrNzp5TX34ZY
	BW86VJq/qu51q89r5iIMZyOLtgvym3ml3EGHFmD63n4DFvh+yX1jCBWSdztVMJAc
	CqDH20UOgeOjlcZu7rEujjeFPS908CEQXI4LgPe7lUmgQH2emSZxsGm5wU4odcdM
	n3H40SJSgd+PlLMDvZaJApttip81Wuo4Ib81usjm+4MP2STscW3o+VmM1U8j0s05
	B/qmr0hNkZu7f+jDrYM5jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792659154; x=
	1792745554; bh=O6yBlpuOxfizbYunp9VGeD1o4T8S/iI/hNccth1cz7I=; b=B
	HRWNcXar2vKWXKSPCrlRTjLM/BCVPDqqA92f/TSmOxkXLCQ4499+pSOA6PoZkwpe
	4X62w1YSinWpLcJfLOcrMT2FTbeEkUVfrzAUhJR3z+gTnL+dFbodnc3/B33X4LRj
	9lWDTnigYWA2ven1rSlTwK3TLn5toMytcIa4vJDDYim12vKkwc6G+8EJAVS0AU2g
	CK4W06zQJ9DyEhAFS1+3WdiBn63kwFnA28TJZeU6h6WulKUF68s8RMO3G9Nkz3Vg
	eCnpzlXWEXZFRZQ6zZMsWwmK9CLY+UaJ/EqNOCEYNOz7SErEFmIufS19xkuJCfSu
	WCYv7oZlGDvkfXbLqUNwg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792659154; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:W7CDmNCU1A8zYe/QKVHdGDctoD7P38bDHTNJgQUN45s97dh
	piasgBz/yQRAnciCcalN/u7l9ucQAHuaXSlFVOHpoOjGrIalHIuApxcDBVRsho6f
	MM+10pp7rI2cqK3K3NMUIXmIR2JdK/anE6Vsc2iCmuZ4lXNLvUjnHchaPDCxvYwE
	tBUOAR+uLYogW4VMrGKV4UznIBc7YooxkRDGELkKSmqH/N/qiCsJB2BM9YWQ+ZQb
	k0nHpl0vsarTnPYzY7hWOcGwuLH9CrtJFSEgazQv8ngXzSvCnhmQSvOilsn9F0YI
	ThbLgx7j197XO2p1jc9IGKbDXlXX/IH39PxxONQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:hTIA4wejWoa9ZudLpR+4WWeuGoQSxYTB+GiN07kEPNc=:v6VAXOL40dCjC9BVJxsmqBYYSb/lSlhxnZL7xs/8oGs=;
X-ME-Sender: <xms:z87ZakwmI-ewIkPkraiaLsoxsTBCAbp4NNSX5HJIMbmpfkUoHwqpNg>
    <xme:z87ZajFq_g-oAJBRLcQmNYQ9PQhNRm6qvpx7BgOFkvhi0ak1Kp21u2oQqpwKwEEwW
    vuibdOAkyGQjeOu4-U0NgCAxkMtCchm39HbeL6Kq6fb5mP9slr0lmxr>
X-ME-Proxy-Cause: dmFkZTGeolMu701xNJW/s/rtoYy6nZYfW+evt4Uy9xZgzghGkvk5U+yfdyAaDx4soJ2JVI
    wk+F+4s6HcEIRtn3gJ7CPe0lFVjXsH9eIPMj+iwjEA7QUr3GsHo8Fji3dXXsS3klk2b17k
    wXGiovdXyimdNZkJouNnz3KNl5G4nTdEU2BDyM6DIuM4oDMjO+DAPpOwWIBE8r3LiKvFeC
    0l+pT5kmOI30tzOlMrSJr5YABHVixrALB6NHBZWiFnwzHzJDGAQvdegZqqXOTZXIcUdMPm
    GPzpQRRQEjID0rzYFqh2tGbrUyBGeo9//O57+90xMDobW3Ga5pgLEK2mRbgc7xsPBp+Jim
    FJtdLxQIgwaNWyrheUM85YELFYhmSXRXzXwwUA5vTUyuSrHrUM9uaHGG7JdwcJSUc1DmLT
    eXSvOz4lo9sFliSvkDVuiB4Pxbnh5f4SJlEDj8ad06pQpXxD/TQjBLjj879SZfE9ahd8tr
    7ZqHSzSmU/rHVKM/zBgvNg/5lW7ovJn5VMxvwcglQyQpDUO9S4+AyCiKT77sq9P3RMbXhM
    d/OZ/waHdwWuau3ZgW2Fb0jII+6Dn+WZFx/qATblXcRzTnWk0mmZ0Op897G03f92qbLRe6
    rPuBFz7UYVEZvEW491ZL5kt26RbpTHvHUORk0Fr6GNrdy+Av7kAPQR0PP+Kg
X-ME-Proxy: <xmx:0c7ZaudWWKOERNcuJrUqdOlRM54UGVDJzkOrCd-MEDaeIa64FG3gDg>
    <xmx:0c7ZavFw0XS-kq0b93usKApbmZ2RKH-0mLtvyUrtuuIXT-Bbpagviw>
    <xmx:0c7Zan0v5KcHkUZhpYp6TMZxmcWAU0EeUi67dMrCVAQDxBnidnfj7w>
    <xmx:0c7ZanmwrzHLTlTnxWeyyq7Toh_N3eh4um28OkZv4yyxWZVVWkX9aw>
    <xmx:0s7ZasXiNLmHkuqXmYq-KGTLGlNgmTp9yHiVJy0ruPkXEra8g4l9LPj->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D296732A0098; Thu, 22 Oct 2026 04:52:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 22 Oct 2026 10:52:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <ad9ad328-9f10-4a62-a698-139cb8b6b1a5@app.fastmail.com>
In-Reply-To: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com>
References: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com>
Subject: [GIT PULL 3/4] soc: defconfig for 7.4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.4

for you to fetch changes up to 6db3ea21a541d34e45f3727b71575424495df44c:

  Merge tag 'qcom-arm64-defconfig-for-7.4-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig (2026-10-13 17:22:48 +0200)

----------------------------------------------------------------
soc: defconfig for 7.4

Only a few new drivers get enabled this time.

The size of the defconfigs actually shrinks here, though that is only
the result of all the Qualcomm clock drivers now being configured as
modules by default when the corresponding platforms are enabled.

----------------------------------------------------------------
Akhil R (1):
      arm64: defconfig: Enable I3C and SPD5118 hwmon

Andreas Kemnade (1):
      ARM: omap2plus_defconfig: Support for compressed firmware

Arnd Bergmann (4):
      Merge tag 'omap-for-v7.4/defconfig-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/defconfig
      Merge tag 'tegra-for-7.4-arm64-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/defconfig
      Merge tag 'ti-k3-config-for-v7.4' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-7.4-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig

Bjorn Andersson (1):
      arm64: defconfig: Enable PMIC5 Gen3 ADC thermal monitor

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v7.3-rc1

Krzysztof Kozlowski (4):
      ARM/arm64: defconfig: Drop redundant Qualcomm clock entries
      arm64: defconfig: Switch Qualcomm SDM845, SM8150 and SM8250 drivers to modules
      Merge tag 'renesas-arm-defconfig-for-v7.4-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-7.4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig

Loic Poulain (1):
      arm64: defconfig: Enable EMC2305 and PCA963x drivers

Neil Armstrong (1):
      arm64: defconfig: enable the necessary drivers for the Ayaneo Pocket S2

Nishanth Menon (1):
      arm64: configs: defconfig: Convert TISCI to modules

Qiang Yu (1):
      arm64: defconfig: Enable QMP PCIe Multi-PHY driver

Sean Rhodes (1):
      arm64: defconfig: Update coreboot firmware symbols

Sen Wang (2):
      ARM: omap2plus_defconfig: Enable SND_ALOOP
      arm: multi_v7_defconfig: Enable SND_ALOOP

 arch/arm/configs/multi_v7_defconfig  |  10 +--
 arch/arm/configs/omap2plus_defconfig |   3 +
 arch/arm/configs/qcom_defconfig      |  14 ----
 arch/arm/configs/shmobile_defconfig  |   3 +-
 arch/arm64/configs/defconfig         | 151 +++++------------------------------
 5 files changed, 28 insertions(+), 153 deletions(-)
