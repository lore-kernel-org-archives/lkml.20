Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044286;
	b=f2QfTJnxCwfVYyDDaa8ph7IPRIxeGGE9N+QjTDFD9PTMteD5Ljs9EWyB508k2D8owjL+
	 JNg+9MT6wJbvkXiWGXnrNuh5CvGWkVYGRkh/PffaFqhHyNjsaxQlmpO2JJdJ+PoudesEg
	 ZLJUIDtpobPLkfrGk7QKGcoqnRABfDWcbQt79W9VGPazB3fQKxt9TLXx9KhXd4SNtzAoU
	 fH0y/fn+85tIVcel7BXFuYXbUJCOqeUvu74HE3+28hJHNKnPlo+xg6/7qckk6obEAkPiv
	 fLjlft8pZAS4psGBRrVBX0qVP5yPtQXQtWZNmg9pDpefmHqjm1bi/9VxsqnHFbhBy4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4b2ajp4FBPrDna2YeWMnx5O5XVNt9W3jkATtNW1wXKo=;
	b=iN55ByMWaOQN9ANUawYcpHiVeOZiwq5nDoog4kq0OAc5mNFlt4DGhDYQyLF+Gl1mf3Ee
	 MXOZxY0DmkG9VonYpSt2grrwziU0IkY8FXdZEXafMIpUQPwbx8WL2+nFPyiVY+K2AYA9J
	 MHu/aZUcs8zDPki6vm69W6/T4xafaliK488glSLgdG7S4c8HX47nYSzENSrOxeKjhCdr1
	 BZ09ly1Q+cWPYaTZaQFjpN/3l7F86d7bAEvB+kjM8xZ0xBxYYgwVsk16+Q+zG/e4+v9CO
	 cQwbk9Nwu3Jmi4ZHodqX1dixXrNfuvx6M8VI2HdWJ+mKO3yqcoq2qrPXXpteSBidiXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=feYEH80F;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF94606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DF94606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=feYEH80F
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so2564607f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793044284; x=1793649084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4b2ajp4FBPrDna2YeWMnx5O5XVNt9W3jkATtNW1wXKo=;
        b=feYEH80FuTGX+mIFQCD8uHGEvbXlUSxByhEejpRyuyYMvBwvTKkmB4LKU/2Q1Dqxn1
         rYWTjYz66FLvEv1pfmg27AmldxWdkiAxR3O1SFimiZStr7xUn6PdYCaj+Hbv+XikVdFj
         VTknQCYldsZepXSHr7pp0srQrvhA3eurw+JQoWJ4au1n4XOlbJ+pJruBw4sDCnxExG1F
         8P/7jSRwzoUNjBfF6RbEwwgRfBtinYu+JXUyGzlsCdrA6yj20YrVZXSXab6v0Ch/mH4i
         x2FSuRADTowDXvsmjP6zwXY/6pEKpkH8ywOmrIJbHazptQKGEeUJVjTBqBk4qOUXKN/t
         OzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793044284; x=1793649084;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4b2ajp4FBPrDna2YeWMnx5O5XVNt9W3jkATtNW1wXKo=;
        b=YAczxDClIiKoSlpVN9CdNAmh4HE9ms5HQj4kdeJoumQ4eKOyiqJW3RIvB/n7wfBv5V
         aSUatuiMLNLLpWo9HSqpqvsS6/wafh+heS9HK4x8vtIJUxueydUk2gJH0nmFXyAQuj+S
         ZiuOLh3XgWbyOylcASC9V+k3P5UyOdJfAD6Qt74PPz3YD0i+QnoQkcP42xnD9cocBeY2
         mptae4ZAcimdp1dNf8uu2J25cxazoSXN1ZwFExQVAejdh6HKOKzM7Oh0nhzsGi5+WOz5
         Jb3OqSo7Y67XTihfzsZDdUXTlVVwzkaF7JIkBALEXN96KgWBMAI63LoTeN2BGc9VitdJ
         DnNg==
X-Forwarded-Encrypted: i=1; AKwUvBwlAOaa4eiR7EzDgc9l/kx3F95TaG8qpKI67bzxSXj3lCpJAGkw7p4L52mNYf2vzHTBFGA2Q0+FqSqR5Cc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkzS6HCkLZHDNpsZrpNeg+QaPhnyCyEl7CzexNNE7Jb/jRmGMB
	A32SQZ97XmG8SE1FV3y7XMZtAxSZmvEcQsOyWFcOgzyO9TJd3o6SGwGR
X-Gm-Gg: AYBFou20SRVGbD8usjDFw0X1985bV7z0AQrUqF3SZEsvolRT+dij3aEJSABnecaOXgi
	HTzpx8fOjjDK1LyHk3JgMDkJF434WBy1rvwYL4znP24kp3kve1Z3nzfJCNbA9JLJbiwa+ez4Na8
	pecFhLSg9Zo1T0cIA3jo5N4aPwOwr+212YnilNQfATGuBfTBIm3T38ODeIS6xFVpQwjwfb4xFXQ
	CMEk8fKRPZfNejII1JkVfuqTTwhRJH9OiUuKKSVadRHIX1QwtzsvzXjBb5iE64tii738pl34Q5S
	zBRc4lsBuxngKDf1w/u1IdNnjsGEYFNb7C23hAqj+BLwOwMlVwLAXi7sfHfKgqKNaFRRxclMdze
	ld+z5LjVZXpT0mXqAaqA3SFNhfcLzBc6TFa7gqUudcOmzfd1DL8w2f3kywmfu9nVRBycpt3zmxL
	jA4lC64ULT/QwpfSFqmr+fTHRd7Rly/IzgQxD69O87oydi3XFX60J2kD2kf3ZzSHI4aWfnN7G/I
	fCa3oT7cmddXgePSq7hXQAXcmVBfeD9mzuAu/7x/QZs8QHdcAR1MLKmPinWaL654n76b5fbPXNL
	sKle03ldYHEPXTIRl7aj5j+gcabPUe4yA4CwCDlLb4ke4jAsKq7RdyD121L33tnaPJLcNG4H+RV
	u+8RNyJoiAWcDj17EkFEK2akp8Mwook0yHD2IQHYK2ApJ02PCfePB20HxHLUdLJ01JZnegCV1gw
	mVn18q
X-Received: by 2002:a5d:5e8d:0:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-48e3eb3cbfamr12691780f8f.8.1793044284375;
        Mon, 26 Oct 2026 12:51:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3c5bsm18877654f8f.9.2026.10.26.12.51.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 12:51:23 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Rong Zhang <i@rong.moe>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] leds: Add support for CZ.NIC Turris 1.x LEDs
Date: Mon, 26 Oct 2026 20:51:18 +0100
Message-ID: <20261026195120.12759-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The CZ.NIC Turris 1.x routers have eight RGB LEDs driven by the CPLD.
turris1x.dts already describes the controller, but there is no driver.

Pali posted v1, v2 and a RESEND in 2022 [1][2][3]. I took the series
over with v3 [4] and kept Pali as the author.

The main change in v4 follows Marek's review. The five LAN LEDs share
one colour and can only be switched on and off, so rgb:lan-1 is now the
only multicolor LAN LED and its colour applies to all five. All five
have max_brightness 1.

Marek, I left out the symlinks. Linking a single attribute needs
compat_only_sysfs_link_entry_to_kobj(), which is meant for keeping old
paths working. Instead, the ABI says that rgb:lan-1 sets the colour of
all five. A link to the whole rgb:lan-1 directory can come on top if
you or Lee want it.

The global brightness moved from the Omnia ABI file to the Turris 1.x
one, because here it is a 0-255 CPLD level, not a percentage.

Based on leds/for-leds-next (59cf91cf87ab), because the driver uses
the hw_offloaded() callback queued there.

Tested on a Turris 1.1 with leds/for-leds-next plus this series, the
driver as a module and CONFIG_PROVE_LOCKING:
- the colour set through rgb:lan-1 shows on all LAN LEDs that are on,
  also while rgb:lan-1 is off or under a trigger
- brightness levels, triggers, unbind/bind and rmmod work as in v3
- no lockdep report from the driver
- after a reboot, the stock U-Boot (2015.04) finds the LEDs back under
  CPLD control, after sysrq-b they keep the Linux state (checked with
  v3, the shutdown code is the same)

W=1 and sparse on powerpc, COMPILE_TEST on x86_64 and arm64,
dt_binding_check, dtbs_check and get_abi.py show nothing new.
checkpatch --strict only asks about MAINTAINERS on 1/2 and warns about
a macro argument reuse on 2/2.

[1] https://lore.kernel.org/r/20220705000448.14337-1-pali@kernel.org/
[2] https://lore.kernel.org/r/20220705155929.25565-1-pali@kernel.org/
[3] https://lore.kernel.org/r/20221226123630.6515-1-pali@kernel.org/
[4] https://lore.kernel.org/r/20260928111907.72592-1-pepe.schlehofer@gmail.com/

Pali Rohár (2):
  dt-bindings: leds: Add CZ.NIC Turris 1.x LED controller
  leds: turris-1x: Add support for CZ.NIC Turris 1.x LEDs

 .../testing/sysfs-class-led-driver-turris1x   |  58 ++
 .../bindings/leds/cznic,turris1x-leds.yaml    | 132 ++++
 MAINTAINERS                                   |   9 +
 drivers/leds/Kconfig                          |  13 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-turris-1x.c                 | 624 ++++++++++++++++++
 6 files changed, 837 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-turris1x
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
 create mode 100644 drivers/leds/leds-turris-1x.c


base-commit: 59cf91cf87abb67a49b1bb7b9d3b06486abde8cf
-- 
2.54.0 (Apple Git-157)

