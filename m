Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233378;
	b=rHDw1wkW5H/YxcYADBsdbh8s9CGjoV0y7vDVGiHIapMqBN5M+PhwcWrMF1L4z+LaOqqG
	 yBBetMfqMWV3yahTJh9k4aDQ0m0c/cHPQG6Nt9+b+Nci4dkwap9PtOVNCH8g5fHCjjanR
	 h/7ZyjT54OGFz98RPBOG+pIGOPfOJzF0F++Sv1dBVcjk2bfaLnFOZkvLCyuLhKdN6z/T7
	 4NXZxLVT1mXgMGUa4kNhrRR7Wz43cqAOIYoYebdmJn4gQ/by9elvCQqA40aYmzwGhxR1U
	 sPOz9nLYVAwF8ehv8wzsN1XXk39EBY7QrThrLOMH+MK2HAMUQCboAoX8QmRvbpURbtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233378;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=2H+AVH2q7EhcjSyHMuWAQKmHIf+eX/uuzTxGhvydkL0=;
	b=dvLjvsfwMJEjHU4mng+J8PjitTU5huTVRcR0DcSuO0WDF9Ct4D0VPD7B/EvEDKN1z1s/
	 qo8MCPrQFEuhpdp+ouO78rzeituuvR+7tcePDcTZHXGVcw/lKQCoSMpPBw818C9RP32R7
	 tsR3gFlAdcPTobT9t0AWGk2KVFHM/BPdKzRAOM2Z5VEna3AkFhfK8TAtTwxVX5h444ixm
	 N+8QG/6GrEdnJgvsa7VB++Iz0N2yljIOLpk3WyY80JsYBzZetI7AuFeakIhkNxe3l8rr1
	 6uiVBvi64wIvcSGpzGGTAK70L9pUlbJnipSRBdz7WE9SWPHwh+n7kTpDjoKlkazv2+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hpn85cwv;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEBE606EEB1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FEBE606EEB1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hpn85cwv
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7105CC79A80;
	Mon,  9 Nov 2026 14:09:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8680660051;
	Mon,  9 Nov 2026 14:09:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E343103293DD;
	Mon,  9 Nov 2026 15:09:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794233368; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=2H+AVH2q7EhcjSyHMuWAQKmHIf+eX/uuzTxGhvydkL0=;
	b=hpn85cwv7AffrRaT4le9iTRnVGyJo3Z8o8GZlCH3mg5MKIWRAsA9vGsmgtQqtv4+Y/BXE4
	lYXwPw685Ys7y0tfO7PwhQp9uPkOQJcr3WpwB4y0MTW7eM3EIbF2pMlmnmp87M6b5ZsKsy
	vrqjhQIetHTuIEQFxB20sI+9VqiFTteEvp5+Za3WEnwujbOCWQZ5hgN8C2+UiAzoyEqJy7
	4wiPyL0k1pm8oxyurXk0cyWN+76HvjPAcQrbEwjcb/XjWfUYkpfoM3vIWlRRby1Ia/2jdN
	FWbIP8LvwNS1uqiUAuFNXPiAnDFU0fOtE6wB8bGhNlHGoC5b4gKekgtkq8I45A==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Cc: driver-core@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v9 0/4] lan966x pci device: Add support for SFPs, simple-bus part
Date: Mon,  9 Nov 2026 15:08:38 +0100
Message-ID: <20261109140916.90625-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
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
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Previously, I sent a big picture series adding support for SFP ports
available on the LAN966x PCI device [0].

In this series patches touch several parts and sub-system in the kernel.
Reviews have be done and it makes sense to split the series and send
parts separately.

This current series is the extraction of patches related to the
simple-bus driver. It has to be seen as a continuation of the big
picture series but related to this specific simple-bus part.

Patch 1 fixes an already existing issue reported by Sashiko.
Patch 2 removes the no more useful remove() function.

Patch 3 depopulates devices populated at probe() when the driver is
unbound.

Patch 4 makes the simple-bus driver compatible with fw_devlink
expectation consisting in creating its child devices at probe.

[0] https://lore.kernel.org/all/20260325143555.451852-1-herve.codina@bootlin.com/

Best regards,
Hervé

Changes:

v8 -> v9
  v8: https://lore.kernel.org/all/20260630102717.413501-1-herve.codina@bootlin.com/

  Rebase on top of v7.4-rc1

  - Patch 1 (new patch in v9)
    Fix an issue reported by Sashiko related to possible inconsistencies
    between operations done at probe() and the ones done at remove().

  - Patch 2 (new patch in v9)
    Fully remove the remove() function.

  - Patch 3
    Changed the way depopulate is performed and use devres feature.
    Took into account a pm_runtime possible issue (reported by Sashiko)
    related to async pm_request_idle() triggered when all child devices
    are removed from the bus.

  - Patch 4
    Use devres feature.

v7 -> v8
  v7: https://lore.kernel.org/all/20260511155902.34534-1-herve.codina@bootlin.com/

  Rebase on top of v7.2-rc1
  No nother changes

v6 -> v7

  Rebase on top of v7.1-rc1

  - Patch 1
    No changes

  - Patch 2
    Fix conflict due to device_has_driver_override() introduction.

Older iterations:
  Patches 4 and 5 in the big picture series
  https://lore.kernel.org/all/20260325143555.451852-1-herve.codina@bootlin.com/

Herve Codina (4):
  bus: simple-pm-bus: Avoid inconsistencies between probe() and remove()
  bus: simple-pm-bus: Remove the remove() function
  bus: simple-pm-bus: Remove child devices when the bus is unbound
  bus: simple-pm-bus: Populate child nodes at probe

 drivers/bus/simple-pm-bus.c | 90 +++++++++++++++++++++++++++----------
 1 file changed, 67 insertions(+), 23 deletions(-)

-- 
2.56.0

