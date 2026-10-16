Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C2C3BFACE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138554; cv=none; b=Da/d60WEf/NL3ZArzltGNR0JuZF1MhPX3PFa8iDPXRsNyD7r6red28Cglk1VL0Ir2C955Lnzsw385qW1KIo17PM0RuFqwqrlupkoKwoPTvW/Ue8+Ezo3pIi028MI94s9OlUpWPhmISkWkJ90j5HnsHiQ42rHs/nXrXfqeIqpSiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138554; c=relaxed/simple;
	bh=apFSD776yEKUsMejLW08NY7p2hwAd7avD6Zoj67sL3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TL5c7GyYAakoIKwFO4/U0subwZRGaPXqGF85tTTiAPBamGgjhQ4xb2gqENie3PCx6OCl6D+G3ZUHmkyW8gQCNjHyk1oKjR9Wb6dFsponWSWUVksrrIjmd9KNwKI5Q8LPdsFNKMnXzKkfshpPSl81bLyowZ3wm7UVkPCndtrT43c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XD5kSysN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XD5kSysN"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a02718da81so48828805e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792138550; x=1792743350; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8x4XnGD/4Oqx8bSJ/7ncc+zMyX6jZtywIR+ptTvzeSs=;
        b=XD5kSysNmhaT8nDKrceRYf4w2PIR8maDQIKws3V2enUQ4fjecg2YHUWO2040yd+CDd
         7PsodESLhlda1yjlAy+6LpMdo4Ylquc9zP4cl4gk3CRVuKYJp/CJITf6q+S+zEJDhns5
         G4P5e6Ze95jdcc+G6FP+PI6wnThOVa+ETXQHTj9jQdHb8OqI4fQn96houuigEfaRRMti
         DoN7P8o78LOZb78F0g55sCRCnENKwmd4TUG8t6KKgcAPHvZxOQqqTGSqdc10D92gS5lF
         9WDzd6wguoNuUk6n9QHwFgUfJrcU00oZ5wtcVkKOYXiId33DxyVGFFG79ThCW/W4Xuj+
         /lyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138550; x=1792743350;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8x4XnGD/4Oqx8bSJ/7ncc+zMyX6jZtywIR+ptTvzeSs=;
        b=K3dxxlihRYcRtOYqmdc1UWkS2uK2kXc4TJLyAZZlAsDsIut3PA+FLprNMPGnWtnYDI
         GVlIHa+MYC+8BpFBrlQEKKA9UTTEF37+NbqoHNfKtQJAk418nCpV3hw2hynK1Wu6KJKx
         t2NR3G2j9DLBccVf4BGoSx9W0TVo5SxR+QvKAx17pUzkqo93Kc4dwbXOK5+90oLkw1ql
         TzhoFTEty1ugwwnA5Ko1bRJ6GWjJa+69VTbDeK5HEItaX14nxY0ijy7oZAnugqAsDafg
         55zWekYSanyjtvY4tAIPSYtfEpHObTuLLz5WHwv/BRe12DuVkmBWC1M0pdYYEUBu+zvp
         igfw==
X-Forwarded-Encrypted: i=1; AKwUvBxm+Lm+JiNLBd74/MrwUmciHFN2NJLzubVGJ/6wL9jqO8PLmOmtn4zYJjLn/l6LfGvEfrcWT5oj+R/gQNY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4Hz1aBcDGfbkV3XMXQIUglHbYFSJ8xTUDlAZt214VUGoqFSVZ
	2cPTLvCQPpVbHi0OGJgLhH9dB9shbGXlOniK3tr2VooOax+ODgGYc8QtGMiO2c1pfGU=
X-Gm-Gg: AYBFou18XmqISUhUlcknKs9dYErGmKdik8PDhKh0A4VUYwlP99977tuHhROdokTFgYP
	0oe2sWQNxp4AlxaYwH8cQ0B48h39wSnbKv1pePb03LfSgZYKOij4p0qzdPrfEG+BfXB5J0kVCRj
	ytx0OMei74xBNJaiIYlVB0NWBjl2Kk0U3R+jZkqVmADR/Yo0+JwKBi0zsQKOupuPykxe53XlDGs
	vXJ2hPhebp0Ykx9o+g7qSvu09Mqhr7cg9NMz+fyJJ/amal27SkWx7oZPRlK4ouco0FrzjpCHp8y
	6tonBJFSyQEZ6vUJDyd1DTM13lK2PsRRopKnTDJdu88hzMM2TIfvhghhPto+O+/K4qNAiekUUq7
	M2h+UPYxjDe8f+ZH6ioCGQdv/nqd87coEuSNmRudvKyaYW6FUCgTsAt5tHI+se+b8pYMTOFT/DT
	XXBq04kSQhE/uAlmW6PvkYkWsgqMh4AEPDf8BRM+r5wX8vStAZ0mPYzXFqFVgCnU0WKopANg/on
	wD/drr3Sc1NHOAcDQa7yIydmk+dHolp96lHPe4F7NCZJf2u0qM5Vmg/6xi0
X-Received: by 2002:a05:600c:1909:b0:4a0:2391:6529 with SMTP id 5b1f17b1804b1-4a18e4d3f12mr470601975e9.29.1792138548576;
        Fri, 16 Oct 2026 01:15:48 -0700 (PDT)
Received: from localhost (p200300f65f19a904af4079c70d984f00.dip0.t-ipconnect.de. [2003:f6:5f19:a904:af40:79c7:d98:4f00])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1c8de8c58sm39262175e9.15.2026.10.16.01.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:15:47 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:15:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] pwm: Changes for 7.4-rc1
Message-ID: <atHZhAtSk7UGkVGX@monoceros>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gllu2bouvaejzpvy"
Content-Disposition: inline


--gllu2bouvaejzpvy
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [GIT PULL] pwm: Changes for 7.4-rc1
MIME-Version: 1.0

Hello Linus,

the following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git tags/p=
wm/for-7.4-rc1

for you to fetch changes up to 00e917df050d79ac26ec700717680ad6421d2808:

  dt-bindings: pwm: Add IPQ5210 binding (2026-10-14 11:33:04 +0200)

for 7.4-rc1.

----------------------------------------------------------------
pwm: Changes for v7.4-rc1

The usual mix of fixes for older issues, devicetree changes and
cleanups.

Part of this is a shared branch that introduces device-managed variants
of atomic_notifier_chain_register() and
blocking_notifier_chain_register().

----------------------------------------------------------------

There are a few more interesting things still in my to-review queue, but
I didn't manage to review these in time to make this PR a bit more
interesting. (Though I guess you like it boring :-)

The series introducing the devm stuff for
{atomic,blocking}_notifier_chain_register() also touched iio, gpio,
platform/x86, input, acpi and kernel/reboot. I didn't check which of
these were picked up, but I guess you'll also get e38b9eda475f
("notifier: add device-managed registration APIs") via a few
more PRs this cycle.

Apart from the top-most patch (which is "only" a trivial device-tree
binding addition) these changes were included in next since
next-20260930 without any hassle.

Please pull this during the upcomming merge window leading to 7.4-rc1.

Have a nice week-end,
Uwe

Alexander Sverdlin (1):
      pwm: tiehrpwm: Clear period on disable to allow reconfiguration

Chen-Yu Tsai (1):
      pwm: mtk-disp: Fix period readback

Danish Khateeb (1):
      pwm: Allow 32-bit tasks to use the character device

Eduard Bostina (1):
      dt-bindings: pwm: Convert TI PWM Subsystem to DT schema

Eliav Farber (2):
      notifier: add device-managed registration APIs
      pwm: iqs620a: Use devm_blocking_notifier_chain_register()

Hemanth Selam (1):
      pwm: Fix typos in comments

Keguang Zhang (1):
      pwm: loongson: Reload PWM configuration through counter reset

Manuel Ebner (1):
      docs: pwm: Fix bracket and punctuation

Manush Prajwal (1):
      pwm: lp3943: fix NULL pointer dereference for an unconfigured channel
=20
Ruoyu Wang (1):
      pwm: renesas-tpu: Fix runtime PM reference leak

Surendra Singh Chouhan (1):
      pwm: ipq: Prevent potential 32-bit integer overflow in hi_div calcula=
tion

Uwe Kleine-K=F6nig (1):
      Merge tag 'devm_notifier_chain_register-for-7.4' of https://git.kerne=
l.org/pub/scm/linux/kernel/git/ukleinek/linux into HEAD

Varadarajan Narayanan (1):
      dt-bindings: pwm: Add IPQ5210 binding

 .../devicetree/bindings/pwm/pwm-tipwmss.txt        |  58 ------------
 .../devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml  |   1 +
 .../devicetree/bindings/pwm/ti,am33xx-pwmss.yaml   |  82 ++++++++++++++++
 Documentation/driver-api/pwm.rst                   |   2 +-
 drivers/pwm/core.c                                 |   1 +
 drivers/pwm/pwm-brcmstb.c                          |   2 +-
 drivers/pwm/pwm-ipq.c                              |   2 +-
 drivers/pwm/pwm-iqs620a.c                          |  23 +----
 drivers/pwm/pwm-loongson.c                         |   2 +
 drivers/pwm/pwm-lp3943.c                           |   3 +
 drivers/pwm/pwm-mtk-disp.c                         |   4 +-
 drivers/pwm/pwm-pca9685.c                          |   2 +-
 drivers/pwm/pwm-renesas-tpu.c                      |  23 ++++-
 drivers/pwm/pwm-tiehrpwm.c                         |   3 +
 include/linux/notifier.h                           |   7 ++
 kernel/notifier.c                                  | 105 +++++++++++++++++=
++++
 16 files changed, 231 insertions(+), 89 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-tipwmss.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/ti,am33xx-pwmss.y=
aml

--gllu2bouvaejzpvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrR3S8ACgkQj4D7WH0S
/k56awf/XGPoEp9Ha0pX108rafUC81Ymdd1Hl7hJ2KJG5DKbglBRWpENZZYuKPAK
dI6fYCBadtDr+yzAcZOrY44f4Eo/SpE8ix/gHWeWGBBfyVvzG1ZOdQEE+YEBYaEk
D+UiAn+eILPxnSotlPLwePK6ko1SvYWLYi9AL7WCnLd1+XfEh/Oj0NjcV2G+92hC
ypa0+R8tjVnhAp/wGjOQkI/ApZSdV7OaJqy7OGVCPvpp7MwPtIPODTUAFMJ6lABY
0laYwUdEcycw2JqY5kZGT8lrBKv97iQfVADqAy+dnd9+zA6oYbr1MAeW77OCEvlg
GuBVeKPysZmiour/xI8CBAyWRE59Ag==
=81RX
-----END PGP SIGNATURE-----

--gllu2bouvaejzpvy--
