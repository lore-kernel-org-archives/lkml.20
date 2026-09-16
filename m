Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37374570C7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545259; cv=none; b=AT6yj1TUQtHo07+QN3ZdVWA8d1KzV1aSm7b8orIL8tSfq75z5VKw/bmuPed6eJ71gnuCdsAuMXiRlxLlLDeQM/zU7bZgkahU0iGFhoFfR1hngUwZ75FJTlc6T6yZwqZpZIIj0th5jtTKIOJHsn0TNXMQUsQcgP2IJAE5vPTuaoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545259; c=relaxed/simple;
	bh=lLSadu/EO310l+5enptiwtcga/navS10peFbAJHVsAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kTll0DEs1JhlG4fVW7SznCEilbkB4B2WVCjPIi38hHiPcm+x/bJ1b8OC8DaBqsVxLcInnjxVstLIe2aZble2tE0744K9eCKGU/peZJoZ9gLug/0ILD6KUUKEzyTMzG2tkHIay0zyniyiNrdgYUmWZlCffSUV70AomkqnvxUWhrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b=ECf3D7UE; arc=none smtp.client-ip=185.136.65.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b="ECf3D7UE"
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202609160753561982ebeda60002075a
        for <linux-kernel@vger.kernel.org>;
        Wed, 16 Sep 2026 09:53:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9EWFgn3dpCAtj64YounGQfAW1nszSWPj6WwClkhLfOE=;
 b=ECf3D7UEXK3DZ/UQqCAMugQ1kjO3Ek5EPtAWWCiyMqdJuUkucknHhbFac4aubXq0PBXyW3
 HgRugTgAhXQzC1vnAuDl3j9j2NaSK004Wi06XFdhYKXipAuKBVV8VKwizC9Qvn5DONHA5UsQ
 K1EqGRVS6OADzA4hzm9vRGu5D9nFLIGp53mYMg+FlbJfEu7yqbs6GqK6YyvBcRRzm+nDxmZa
 j/nYWIDFoB3hLb97sP8TJabhkNLLxhIH1ohED7Zbv2yJeiOSyLpRWE67+3DP92KBNqBpnoGE
 4KRaD5I2G1n2j93o/YnmZQKVw/VKeL/h2fFDlSSsr4TKQUiE2PNopmKg==;
From: Alessandro Zini <alessandro.zini@siemens.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH net-next v2 0/2] net: ethernet: oa_tc6: add reset-gpios support
Date: Wed, 16 Sep 2026 09:53:47 +0200
Message-ID: <20260916075349.21822-1-alessandro.zini@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer

This patch series adds optional reset GPIO support for OPEN Alliance
10BASE-T1x MAC-PHY devices using the OA TC6 framework, and documents the
property for the Microchip LAN8650/1.

Patch 1 updates the Device Tree binding schema for the Microchip LAN8650/1
to document the optional reset-gpios property connected to the active-low
RESET_N pin.

Patch 2 implements optional reset GPIO handling in the common oa_tc6
library. If specified, the hardware reset line is asserted for 10 us
(datasheet specifies min 5 us) and allowed 1 ms settle time for crystal
oscillator startup before starting OPEN Alliance TC6 communication.

Changes in v2:
- Moved reset-gpios handling from the lan865x driver into the common oa_tc6
  library (drivers/net/ethernet/oa_tc6.c), so all MAC-PHY devices can make
  use of it, as suggested by Parthiban Veerasooran.

Alessandro Zini (2):
  dt-bindings: net: microchip,lan8650: add reset-gpios property
  net: ethernet: oa_tc6: add reset-gpios support

 .../bindings/net/microchip,lan8650.yaml       |  5 +++++
 drivers/net/ethernet/oa_tc6.c                 | 21 +++++++++++++++++++
 2 files changed, 26 insertions(+)

-- 
2.55.0

