Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D04F50AC33
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869417; cv=none; b=ZKMpEqF76BT3WOhQmtAF5eHuSrnXv0xruXFl0SZKQGhJFxKID4+VAeynQgd9FFWZlPOQedX/Qbjgu7KOwUEW4M3378+PfIRzksl1qt/LXP3CH0su6P+djp2q4v1kBwOZ1yed6sIUW1dhagg7QXEGFSDv7QTGuu8I7qPpAFDflKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869417; c=relaxed/simple;
	bh=j9l1v7SIh1agy+d/CcExB7uuosTnCNp7Ova34dlK+C4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W6CIzOL3wF+Uq1tjQZrUFWfd0CaLyhdf5DjG4j0oYH/9MzMv1HjM8JffXfwuPflJ9PjYCGXcu8SaiqfOAoVtigKspXv0d9A92e1ykrKE8Zw1xkqAqqutGOgxXCeco8W1gSmMcFqQo/N/S1lm7DRajiroaQg6ljcxWj9aJvZruJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uegk7I5v; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uegk7I5v"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso68880945e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869413; x=1791474213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mIaBbe8F5fUbSrAQQEV7tPEg3S5HZdRq+Ky+H8+JXg=;
        b=Uegk7I5v9aNjou9OucGzKvmOgXm6sAKL6XsmgKtblas5GOouOmWH3WeXtZ77Dts60V
         SzblQ1hmd3OsZW9FgTQvM5LY9/RFNMk1PuUZ0+dh9WPldiSlWAEzb8ZQfSBSRn+Dh/+A
         hzBkh/XC8ERT55GZzzkU6jjXFaLEzDLtm5ugY+pb1hufReKJDLkPbjR9Z5FCkHiERd/H
         v8vPWjf4ze7p02VUZrIpN91Z5igBhLnlVxZvWZ5MO52ZPH3LURdQ8lVWpCDG7o3MQbPw
         KSwu7Z0C5ueayQubxBT0g2F6TFzmSCCHeBNqXU8ChWr8tp85hQu3Puh1prNAMwL8IKeF
         AH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869413; x=1791474213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mIaBbe8F5fUbSrAQQEV7tPEg3S5HZdRq+Ky+H8+JXg=;
        b=YHbK2AA1ZPLef7W0ICeksiLhJI75ujD0T/BMfEONRetIBTFQCEbHE2kjM2fcj/qVkB
         7j5Vkz3PUgF+O38ejbWgkijRCTTHGiF+OKqkqp9TOgqt136/uggepnTlwsLGvgqLXfFB
         dthoozgp8AE/mbMCx0GSqWxXWLEGwYZ0GJdkQ7rvIUXD7+1z0DAJlQ4/nY15XH2YXrPs
         jhN7/XdbrvBHS376fkYoEV8rylP7jQHRU9HkVsPn0oohdY99I+sD8e+euDDJj/G9s4nE
         Tsj+3lYg18zuDSRWGCIqRirmLaiJYPVGcxqzAF8WA0L8i7WtwzTr1LhXemheXN55oC/E
         CpqA==
X-Forwarded-Encrypted: i=1; AKwUvBx71+YId4DmGeqSrABwVp0DuubnR+MtJPvLuj6vKJGMfXYJEvz618jhwqjjFNncppnkb3YyLuEObAMDPAc=@vger.kernel.org
X-Gm-Message-State: AFuF++n0+UoJ9hk2n/3UBkVTBKjgWL/Yo/kMWrUKqfWLO4KzqpqxLw5k
	8Mvu9TBJI6G9vldub4FR0gB/o+ULSdC6YtNIZWrgPSJ9ukfDHOKnUBJF
X-Gm-Gg: AYBFou0mUhFWVBNpP5wAjvQgDG3Rdp0+azSvu/tS0vyo+2/cQ+YDL/pz6bXYapFT7eN
	62s8ibo8erq4yWMGhd4o4zGmY80DerhVyjhBtlNWDXL49yviG//mBf5sfpEAjdoIfoXhq4ndGfX
	COzgSspMYxA8JYIEUga6cmIFsSJxoLf89s3o1+3d/X6k1KO+NqvmvjprxMjbb9I9R/0ofx4kxZe
	HjTw4au49pBITqkTasMGBu29qBZA5t1oOobf4xuSFM7hEGmpmJLBIA7Xrdkj7Mng3Z400yO1zPi
	ipZgRcytK3SlzdbZO8yAXFe+TKF1ErpodkgkCHry8icNwVpiAXRg8XLrTViI07IG6zMHRz46g/x
	EYsXe1depfqtzNWPoHRHo3icIB/ZAEgsJhmfe8PYzwn48oPGRvO4JUG5iqRJAfm73T1T8OyBox8
	SGVI+9FZWGGW6j/cdDMxTy+Xphdjkz1BGXESyeNnHk6StSCZ4Y7Te9Cwtielt/z+cZmCHUWToKG
	H7ztYjpc24z5I8wMqORxc9a0bsKt38UuhmniR6dopYNdAg4v09l66lm0l7aujMaR5CBLNhUdLbL
	q0O0QDqy
X-Received: by 2002:a05:600c:4e4e:b0:4a0:62d:4424 with SMTP id 5b1f17b1804b1-4a027566f93mr163105e9.8.1790869413262;
        Thu, 01 Oct 2026 08:43:33 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6db98fsm65195615e9.0.2026.10.01.08.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:43:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 00/12] Add ETHSW support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Thu,  1 Oct 2026 16:43:13 +0100
Message-ID: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series of patches adds support for the Renesas RZ/T2H and RZ/N2H SoCs
which integrate an Ethernet switch IP variant called ETHSW. The ETHSW is
largely compatible with the A5PSW switch found on RZ/N1 SoCs, but has
several key differences in register layout and hardware configuration. The
series includes updates to the DSA driver, device tree bindings, and
Kconfig to enable support for these SoCs.

v1->v2:
- Added RB tag
- Fixed review comments from Vladimir.
- Added info about the IP issue and the workaround

v1: https://lore.kernel.org/all/20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (12):
  net: dsa: tag_rzn1_a5psw: Drop redundant ETH_P_DSA_A5PSW definition
  net: dsa: tag_rzn1_a5psw: Add RZ/T2H ETHSW tag protocol support
  net: dsa: Kconfig: Expand config description to cover RZ/T2H and
    RZ/N2H ETHSW
  dt-bindings: net: dsa: renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW
    support
  net: dsa: rzn1-a5psw: Add support for optional reset control
  net: dsa: rzn1-a5psw: Add support for optional timestamp clock
  net: dsa: rzn1-a5psw: Make use dev_err_probe()
  net: dsa: rzn1-a5psw: Get switch info via OF data
  net: dsa: rzn1-a5psw: Choose tagging protocol based on compatible
    string
  net: dsa: rzn1-a5psw: Add fixed frame length workaround for management
    port
  net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch
  net: dsa: Kconfig: Enable support for RZ/T2H and RZ/N2H SoCs

 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  | 154 +++++++++++++++---
 drivers/net/dsa/Kconfig                       |   9 +-
 drivers/net/dsa/rzn1_a5psw.c                  |  79 +++++++--
 drivers/net/dsa/rzn1_a5psw.h                  |  25 ++-
 include/net/dsa.h                             |   2 +
 include/uapi/linux/if_ether.h                 |   2 +-
 net/dsa/Kconfig                               |   9 +-
 net/dsa/tag_rzn1_a5psw.c                      |  22 ++-
 8 files changed, 250 insertions(+), 52 deletions(-)

-- 
2.55.0

