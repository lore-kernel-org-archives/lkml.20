Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60492205E29
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876417; cv=none; b=GYC376bJuakxG7LS3edLPiRO9WaJLYUBiy7tlQgMZ2LdqTfXQObcCyA5vk8Uu9L+0jVQmLi1PF5SX5u4hgi8lI23hlF2y4493YvJlHK81qTZRG7eo3LR98KWBmd+nbfjL3QSgtkexVGYrBif+lN9yJCUg0XlYHKupji2ml8cbjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876417; c=relaxed/simple;
	bh=xL7yFhdpHiit2/cFQTs8EvD+0Z6SV64HywflMVMopa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HCKWbZUQvuSg/US4jM1gUmCkah41q9kmvijmQb0AonKcBfEzEYZIU7hjg5cEhjss20P+zJrNAkEdNaVlR7Fp7rPM3ut3/5n4k8AFwJUzppTS8GCkwcIXvDffRzpt85EwZ9MOxa10GxKhyXSYI5MfCy5SkdxUfgOO4pASWuZkcHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdMKRX/H; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdMKRX/H"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso286394f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790876409; x=1791481209; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AIcovKn9vKJekcvLwo/O2wEmH8Zef+9GdrR6OoMLQaA=;
        b=MdMKRX/Hrj1fy5d+MnTHCp9rTagb5dID10Ih7cpeNrK1Rnnw6f5fzaVhmPy154Cw/8
         GFUbu916ehVduBFOLQ7T3OjzQ7XtAKWTM9+gbQf/9znFxO2axzPWurHSMs8FGr7hPZdC
         k+zc5dxxmWKf9zGHdzBEDpqYKDIbYP3IjQBwnxRet6BgG5eDOF27D346O+Xhymeao/Hs
         wO2vBR5LSwquBdTBH7CZ8/5tKTa7EsVgtNJ7zZMIjTf0BZcmbM96suvjLwKdAx4fvpoF
         Az7c3RX43SeHShZfKxlWCZj2NLWbwWyDCm6U5KtGkwd4zD0ZJYbjjOEi2KX8DiYNxPh9
         JaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790876409; x=1791481209;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AIcovKn9vKJekcvLwo/O2wEmH8Zef+9GdrR6OoMLQaA=;
        b=Reh2WJwIWE0cKJkBbwkZP28kZ87dHUYqieGwrek2YgvACPecVh5AFcMU008a9xyLMV
         C3eDXVjgQTtX59MyHM1CKqK99ztM8PA6C73Nr5+FLdUqMIe2TA6XMx8TNAE7QyoHYhuZ
         AUQeDp/Mdo4/V0DDBcCqNpkXfC08/vEdlbEkZ723fl3My8EkXnC6iGbK9scU6hLYijWe
         pvDE2vrNE+hrGiR3USzff+xC39xw47W6qr2mV45Dn/wNJICNbdBxSAYotAMezb406pmo
         p+izbauwKlQeIlYuDKf5ip2kL4MFy7bVT682zmLeK2SilCzb4bmSDz/pmtnHqRxssDl1
         DCmQ==
X-Forwarded-Encrypted: i=1; AKwUvByA4kDV4NHrQ6Z56orQWgtxQS5NIeu9GMwYgMxKcuEIrk/uUZeDq6HJ8BbEPbiiuGrQ1BQgmafJS2Z8Uyo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWI4GQoBEexEfSDG3UgFnL11Hib729naSdAhZxAQ4frxfDKFib
	44kWJwW2KFUg5ntFBsBCRKaVASG2jwkp3wV7ER1bXlMIkGiz2+qRMlMU
X-Gm-Gg: AYBFou0K7QaZhAI0YmtUfHrEASLwjTdPbp+hrB1oBpRJCGzG4eN4kltdnm12k3GSmDr
	aVqBFQDoCAOiZWAYGEMOAq9EqBTaofeX21zotej7taqZNEyEQjGyDreQyW9e1sTfvLkpDP16vVK
	Fhe7O4Pi6ClpSIJ+dvARCPWkbb7JkXJRSNiBCa4TIjELOWBOkp4U1TA6TeV9STi2E81XMTvI0Yn
	gzzC/Po/Rf5bp4RfLj8DoZbxi7vEkZYx2ydloWmaLJHrxuIff6pTPhY0Fr5+cqyg+sshttVVbj6
	NbGaUuEXZnvbcmCvQyGk4hKB8zt9MHhZygOoCeMPAqo7R/d9GGReqQOcXG0dYYV0Lc9XeIA0Z/4
	/9L83AzZnx4+TmYK0QrVHUFY6hj8b03a58a2VHwm4VwAtW1iojkcXTW4VsODLyrmcS/95Uj/6bW
	4sOEDy/IS9ygTaBfth/b5qkBc7C7d7tZbgNSuHCgRP7sLl2GltmmHqRWZxl1CRPjDqYQ==
X-Received: by 2002:a05:6000:491b:b0:488:8913:e64c with SMTP id ffacd0b85a97d-48b067bc3b3mr7204758f8f.18.1790876408779;
        Thu, 01 Oct 2026 10:40:08 -0700 (PDT)
Received: from strix.localnet ([197.250.96.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0690d284sm7098316f8f.17.2026.10.01.10.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:40:07 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Brian Masney <bmasney+clk@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 mturquette@baylibre.com
Subject: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver (v2)
Date: Thu, 01 Oct 2026 20:39:27 +0300
Message-ID: <hUBEMGo3TGyVsIj5LaphmQ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartts1z5F9iR2ap04uw5rhYqQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartts1z5F9iR2ap04uw5rhYqQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-clk@vger.kernel.org
Subject: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver (v2)
Date: Thu, 01 Oct 2026 20:39:27 +0300
Message-ID: <hUBEMGo3TGyVsIj5LaphmQ@gmail.com>
MIME-Version: 1.0

Hi,

This pull request contains the device tree bindings and clock driver for
ZTE zx297520v3 boards. It contains the next step in adding support for
zx297520v3 boards: Documenting clock and reset manager hardware and
adding drivers for its PLLs and clock tree. This is v2 of the pull
request, based on v7.3-rc1 rather than clk-next.

The patches have been reviewed and carry appropriate R-B tags by
Krzysztof Kozlowski (bindings) and Brian Masney (clk driver).

The PR does not contain the MFD, reset and device tree patches. They
will be submitted to the MFD, reset and soc trees respectively. The
clock driver compiles without them, but won't be instantiated without
the MFD parent.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/v2-zx29-clk-f=
or-7.4

for you to fetch changes up to 75e4151c9e157d84c8c6c365893ecf33d221bca5:

  clk: zte: Introduce a driver for zx297520v3 LSP clocks (2026-10-01 20:20:=
43 +0300)

=2D---------------------------------------------------------------
clk: zte: Add clock drivers for zx297520v3 SoC

This tag contains the device tree bindings and clock driver for ZTE
zx297520v3 boards. It contains the next step in adding support for
zx297520v3 boards: Documenting clock and reset manager hardware and
adding drivers for its PLLs and clock tree.

The PR does not contain the MFD, reset and device tree patches. They
will be submitted to the MFD, reset and soc trees respectively. The
clock driver compiles without them, but won't be instantiated without
the MFD parent.

=2D---------------------------------------------------------------
Stefan D=C3=B6singer (9):
      dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controll=
er
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
      clk: zte: Add Clock registration infrastructure
      clk: zte: Add regmap-based clocks
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks

 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      |  101 ++
 .../bindings/clock/zte,zx297520v3-matrixcrm.yaml   |   98 ++
 .../bindings/clock/zte,zx297520v3-topcrm.yaml      |  122 ++
 MAINTAINERS                                        |    7 +
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/zte/Kconfig                            |   28 +
 drivers/clk/zte/Makefile                           |    6 +
 drivers/clk/zte/clk-regmap.c                       |  237 +++
 drivers/clk/zte/clk-zx.c                           |  192 +++
 drivers/clk/zte/clk-zx.h                           |  137 ++
 drivers/clk/zte/clk-zx297520v3.c                   | 1657 ++++++++++++++++=
++++
 drivers/clk/zte/pll-zx.c                           |  576 +++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  154 ++
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h    |   12 +
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |   62 +
 16 files changed, 3391 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-=
lspcrm.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-=
matrixcrm.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-=
topcrm.yaml
 create mode 100644 drivers/clk/zte/Kconfig
 create mode 100644 drivers/clk/zte/Makefile
 create mode 100644 drivers/clk/zte/clk-regmap.c
 create mode 100644 drivers/clk/zte/clk-zx.c
 create mode 100644 drivers/clk/zte/clk-zx.h
 create mode 100644 drivers/clk/zte/clk-zx297520v3.c
 create mode 100644 drivers/clk/zte/pll-zx.c
 create mode 100644 include/dt-bindings/clock/zte,zx297520v3-clk.h
 create mode 100644 include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 create mode 100644 include/dt-bindings/reset/zte,zx297520v3-reset.h

--nextPartts1z5F9iR2ap04uw5rhYqQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmq+ms8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoimP4P/AlDoLf0Z0G4fKmz8YN+
uuz5P2zDF96YqNAGoSBR8m3DW+j+BYbR0VFUtMk88UCqrWC1zFxKqkVNBVTZlxfe
n6zBcPQ6ROY9kcVAbgjDL1e2nQgqdBQlaIJgZl0X/pxICu4sm922MQHygNWTSsNI
TrtpvC1BSx1PWIAZXlXV4cUxfRBNv/MUER7Qjfh5qHfVlyA8PuRe4FeOHsHSbBre
x56NucU+9IJfFRA5NLml97GYkxoSSR3WSvtB+O/g2oL70ASgBBH8LjBn/HZlUg8s
AEAr9ptju+ZizC7GqZpkKe09RMqlBX8dD7o/k4frkodXlhBQdohAoW0Lky13k/ge
W6y2JKNpFS9nthDRpXcrdDju9VGoHyzLIzuCKnZRkt6XhUbERc08wkMpaYpnn6md
t3fhbVOorMFlUC8IXE609RBE308Wzlx/EX17EBwmhVNVMV34OGQNIecVk4esrE2s
M5oKJuTQgVGdQ6sM/ZCR/e95B1rmaHU2Y3eC0+e0+kS98Enj5ykk3R4wVrhGwl6Y
9ckevWzJnPLmYWoP2lRlstOa4T9UFk/0jPOT4PkXCgMluG8vRVczcEez45n3uiZc
fe+re0gfkc7/zRJ8QI4JPQR884aY4tIQu/Ma8L11UjyWxer5qMR8PCVEGLqy9PTy
8YV8gwDXL+x/vbleLCfi/JAr
=86gf
-----END PGP SIGNATURE-----

--nextPartts1z5F9iR2ap04uw5rhYqQ--



