Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1261D40DB3F;
	Fri, 25 Sep 2026 18:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360807; cv=none; b=HUlTJpDujTrxZPHx5v97Gd4zjsMWT012n1IeOF/UQec4MgDF5X6G0hEhINuIO0IDf6NhBg+gt8XvCXIxc/GiQ5rY5eljIqucQd7PxcJkL8nHYfFR1ccPtRR1p88unWxXk4OBbOrS50QlA0gx8guK0CSVkzVGrZBAQFHi4pVo3WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360807; c=relaxed/simple;
	bh=ho56WNc7bXYw2yBVs4pkG9Ydg5tXfGBDDJHTvLV+H0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MqDuDgVxzx+QUT809DH8rECbkitZgCtRyOo6bGV3M1DAPK5ffDYZV8dK+ko4ZpiMb2WJs4YiRmU+krkUvDRj/ZNAQo0wW/KDs+nn9mm9T0v/EsaOmVlk3Er33MjdJ/goHU+3YDsPWxREDFvLt206iKjalMNIgx3s8g+HdxIZptM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Eku1QQlJ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Eku1QQlJ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5E0DC1A1024;
	Fri, 25 Sep 2026 18:26:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2AA526073B;
	Fri, 25 Sep 2026 18:26:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2CB6102F1E2F;
	Fri, 25 Sep 2026 20:26:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790360796; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=f68QIyzB+bxconeVfd9T5MrfJR2/wkIuA3U3iC8fBDg=;
	b=Eku1QQlJ/nFIa4zyqa8ZNa1YZGSU4AvVjDME3WJKW+ghDYaX+jW46DKSYhFsz1d4LLWhXI
	bE7KOppq9oqSU822SfWWgtFT1bG9vAXgbt19AP4CNiRMCeIMcs1eocfgc42dimbMB0nukP
	LuIJTfUGOt4KTVPoSKPlNEhd62pjvUIfPCQndp9mdFOBGPwx1ZWHUnyl2ycmih/pjyfarS
	J5H5TrTjzSLFojEpHazBdNnxxBYH3efUwEqTy36AMpr3CR/xfwxN/pAkq8H6cRS4Cjsusw
	nncMGtey8vF7ejXrx9r6S6wrrDWuaoqiYhZZUHqczZ2cieWiKB7yDULXDfo31Q==
From: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	thomas.petazzoni@bootlin.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH net-next v2 0/3] selftests: drv-net: Introduce flow-control selftest
Date: Fri, 25 Sep 2026 20:26:24 +0200
Message-ID: <20260925182628.214667-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi everyone,

This is V2 for the ethtool flow control test.

This test aims at validating the flow control implementation in drivers,
using the ethtool API.

The test can run in various conditions :

DUT <-----> Anything that has link up (not controllable)
DUT <-----> A directly connected device

It enumerates the local and remote device's capabilities, to test as
much as possibly testable. I've run it on 17 different boards connected
to other boards through various means : Usb to Eth dongles, direct
connection to the board, connection through a switch. Some of the ports
tested were user ports of DSA switches too.

Overall, this produced 4 different results (duplicates removed):

dev A : (stmmac or mvpp2), LP that can't use pause
dev B : stmmac, fully controllable LP
dev C : mv88exxx DSA port
dev D : stmmac + KSZ9031 (masks Asym)

                                                    [dev A]   [dev B] [dev C] [dev D]
test_support RX off TX off                           ok         ok     ok     ok
test_support RX off TX on                            ok         ok     ok     ok
test_support RX on TX off                            ok         ok     ok     ok
test_support RX on TX on                             ok         ok     ok     ok
advertising_test RX off TX off                       FAIL       FAIL   ok     FAIL
advertising_test RX off TX on                        ok         ok     skip   skip
advertising_test RX on TX off                        ok         ok     skip   skip
advertising_test RX on TX on                         ok         ok     ok     ok
aneg_resol local rx off tx off, remote rx off tx off skip       ok     skip   skip
aneg_resol local rx off tx off, remote rx off tx on  skip       ok     skip   skip
aneg_resol local rx off tx off, remote rx on tx off  skip       ok     skip   skip
aneg_resol local rx off tx off, remote rx on tx on   skip       ok     skip   skip
aneg_resol local rx off tx on, remote rx off tx off  skip       ok     skip   skip
aneg_resol local rx off tx on, remote rx off tx on   skip       ok     skip   skip
aneg_resol local rx off tx on, remote rx on tx off   skip       ok     skip   skip
aneg_resol local rx off tx on, remote rx on tx on    skip       ok     skip   skip
aneg_resol local rx on tx off, remote rx off tx off  skip       ok     skip   skip
aneg_resol local rx on tx off, remote rx off tx on   skip       ok     skip   skip
aneg_resol local rx on tx off, remote rx on tx off   skip       ok     skip   skip
aneg_resol local rx on tx off, remote rx on tx on    skip       ok     skip   skip
aneg_resol local rx on tx on, remote rx off tx off   skip       ok     skip   skip
aneg_resol local rx on tx on, remote rx off tx on    skip       ok     skip   skip
aneg_resol local rx on tx on, remote rx on tx off    skip       ok     skip   skip
aneg_resol local rx on tx on, remote rx on tx on     skip       ok     skip   skip
autoneg_state_adv                                    skip       FAIL   skip   skip
autoneg_state_params                                 skip       ok     skip   skip
autoneg_off_while_link_autoneg_on                    skip       ok     skip   skip
autoneg_link_autoneg                                 skip       ok     skip   skip

We immediately note 2 things :
 - advertising_test.RX off TX off Fails
 - autoneg_state_adv Fails

These are common to all boards that use phylink in the following scenario :

MAC - PHY <-------------> Peer

It doesn't appear on DSA user ports, even if they user phylink themselves.

The first issue : advertising_test.RX off TX off

ethtool -A eth0 tx off rx off autoneg on
=> We keep advertising Pause and/or Asym

This seems like a legit issue in phylink.

The second issue : autoneg_state_adv

With link aneg on :
ethtool -A eth0 rx on tx on autoneg off
=> We keep advertising Pause + Asym

So, disabling pause autoneg doesn't disable pause advertising, that's not
expected either.

This is worth looking into as a followup.

Thanks to the Netdev Foundation for funding this work :)

Maxime

Changes in V2:
	- Don't add stuff to the lib
	- Fix most pylink errors (module's too long for pylint ...)
	- Ditch the fail=False from the defer()
	- Remove duplicate patches
	- Clean the comments
	- Drop the return type annotations, most were wrong...

V1 : https://lore.kernel.org/netdev/20260920164732.349744-1-maxime.chevallier@bootlin.com/

Maxime Chevallier (Netdev Foundation) (3):
  selftests: drv-net: Introduce a selftest for ethtool flow control
  selftests: drv-net: pause: Validate the pause autonegotiation with a
    partner
  selftests: drv-net: pause: Validate pause autoneg interactions with
    link autoneg

 .../testing/selftests/drivers/net/hw/Makefile |    1 +
 .../testing/selftests/drivers/net/hw/pause.py | 1035 +++++++++++++++++
 2 files changed, 1036 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/hw/pause.py

-- 
2.55.0

