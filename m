Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32503D411D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790516246; cv=none; b=DXWGByFLSmHI1jv/bZmy0Ybq2xcmv9eWzSSeWfNuvdol2PRe8grLmnnA1ChCwHCSltBYl+7URSA7t/V6D/kwOgAoryHTOQark+b0Hz6qB6elKTI0iLafzpESFnoPmA0feqbjVNglHfSQ5zl8dl3nKoRIuR2HJggFnXVzgu3ulMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790516246; c=relaxed/simple;
	bh=y2XQNiedrD/GbweFwiRwG63lCrwaAPfIBOifZlSTGTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z6yBptT93KNq7pSDPOv24Pcivt/AC5Gbtcj7LnL43G3jSAaLo+6TDc6AL2kCvdgKXNF49qk94xoZP5cjukOsAgEJbmdtmrL1vbgocBrgOKAI6ErvFF4i6984QD4TclgP9oRhaZch4k32McKZ1n4t4QGKLXJ3OYgknVadt02Lbw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yuji6sq8; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yuji6sq8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C2184E41021;
	Sun, 27 Sep 2026 13:37:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5048F604FF;
	Sun, 27 Sep 2026 13:37:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93528102F1E66;
	Sun, 27 Sep 2026 15:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790516239; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z13EOcnX8B1/8BD2O0e2wgJx2zHuu7HyJIbYUX/IvJ8=;
	b=yuji6sq87xQa34o57ctC8bpZqRxm3Xg83qGNyrkZi4fbw28Y93IKuTFZNxzAmiELimkyw4
	9EpJEJv/pA9Vezd19TwJAq6fXk9crOgjZelrj/nVYtG/9iqTfWg8Y5gE1dCK+tXjkYn7W4
	xS5e+3bGwLlIyIPyy3aezs/TfQEAVA9wJjjYHABo1x9XS502IvGmrzyHYjysuzuh2ouhsz
	C4zhuc5bz5w3tj6Z/rHwqAfUwM4SJmUJzrnbFGHUWyAVu2j+6veNpFB+Zy2aJQmM+KJoo5
	Yvo0Ug2l9dhlBfYYzZJjeDcWvJs04dEze9bpcT52ENyyBmfA6z48sVTpn/VAwA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?UTF-8?q?Nicol=C3=B2=20Veronese?= <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>,
	mwojtas@chromium.org,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Frank Wunderlich <frank.wunderlich@linux.dev>,
	Pietro Ameruoso <p.ameruoso@live.it>,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net-next v18 10/10] Documentation: networking: Update the phy_port infrastructure description
Date: Sun, 27 Sep 2026 15:36:19 +0200
Message-ID: <20260927133619.955236-11-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927133619.955236-1-maxime.chevallier@bootlin.com>
References: <20260927133619.955236-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

With SFP now properly supported with phy_port, add some details in the
documentation. Fix a typo along the way (driver -> driven).

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Aleksei Sviridkin <f@lex.la>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 Documentation/networking/phy-port.rst | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/Documentation/networking/phy-port.rst b/Documentation/networking/phy-port.rst
index 6e28d9094bce..2a9b1ec93b70 100644
--- a/Documentation/networking/phy-port.rst
+++ b/Documentation/networking/phy-port.rst
@@ -99,13 +99,29 @@ will eventually be able to report its own ksettings::
             (_____)-----| Port |
                         +------+
 
+SFP ports
+=========
+
+SFP interfaces involve 2 distinct components, each represented by
+a :c:type:`struct phy_port <phy_port>` instance :
+
+ - The SFP cage itself is a :c:type:`struct phy_port <phy_port>`. It's special
+   in that it's not an MDI interface, but rather a hot-pluggable MII.
+   The :c:type:`struct phy_port <phy_port>` associated to it lists the different
+   MII interfaces we can use on the cage.
+
+ - The SFP module, when inserted, will also be associated to a
+   :c:type:`struct phy_port <phy_port>`, that represents the various linkmodes
+   that it gives access to. The module's :c:type:`struct phy_port <phy_port>`
+   doesn't supersede the cage's port, it references it through
+   the :c:type:`struct phy_port <phy_port>` :c:member:`upstream_port` field.
+
 Next steps
 ==========
 
-As of writing this documentation, only ports controlled by PHY devices are
-supported. The next steps will be to add the Netlink API to expose these
-to userspace and add support for raw ports (controlled by some firmware, and directly
-managed by the NIC driver).
+As of writing this documentation, the port's presence and information can only
+be queried, and it's not possible to change any of the port's settings or select
+which one should be used.
 
 Another parallel task is the introduction of a MII muxing framework to allow the
-control of non-PHY driver multi-port setups.
+control of non-PHY driven multi-port setups.
-- 
2.55.0

