Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822974;
	b=qxs5DG62/oG7X/q5RsRzis0VhL64KiR5VkbDhslmDG+uqpBlkzPeBhyH6JH1GP9YmheX
	 SVg3vZtHqe1mrzYMNwPmdS/na6751aH2zgyW018ttRyUGFAKA5jNyibVrTmQ5sw4twb5p
	 t6+qjOHlwYJDNA/E+G0Qq6K5jw07ZcjKSEb2Gq3TRI4/GXivVdWV9HX878wuvbuzOTpan
	 /7Dg/Z433QK11l/RkQIKVu2IGjAkge7xDPIMzdI2xYeQybMDr5iMhelP2x+tljIvXlrX9
	 sPotZ/t0rWXlCdsRQS/yjenxU+Wc3h7fTibxDzAXjcr12RALIMsNQMvzdrKprCLWVyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822974;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:CC:X-Mailer;
	bh=sz/ytHr9Wpa7WqWlf+C0CzGHrGjRm0Wk6TtL0RaWyWU=;
	b=Zia2VX1+7IaLY8Njtv3DHtsBPmz+nlgE1YZbCqj4vicVGPGaTNOPm8rnOxUImVEQajW9
	 yg+URns/5bKvE310wKDQDWXQ4xdYAIJgAd7rXtWOOHWgrj3v/hW20ryjfrE93hTudfdSI
	 7+MIYChHPMuKZSNv9PrnR0paVAPsIIjKLr7ab7z/1HS2p0CzN4j/jRx6s5HxzNPlNq8Ca
	 JhDO4cKdFGrayf5HMDnntPgGTrLUvUT53HCenf39mPSp/MqI22RVUEbTZ4qVmKuI7vTSI
	 EceaUTG8z77K/p4TnfOJwVozzyRqJayDlcThWJdIzT54kmp4uwS4MnmnC02xklbagWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=uBbefQ0w;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78817606A323;
	Mon, 16 Nov 2026 09:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78817606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=uBbefQ0w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794822971; x=1826358971;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=nvsMJYaVVCe8GxHgCBUgUEMBnbsD36LbAm5VEdFo2io=;
  b=uBbefQ0wu1fBjX9YcYWgzs4ge5VlBstkFsgL/gaV+2PQ0wgIIEUHNbeY
   JVI69qjKkfF03FpwvlYRNZkHXdSLhbLRQeHBBjA52eFoo5eK7m2W2emTS
   sboCM/2n6Q52pdbO1D4+ZXG3uKIK4QHW7VEhoD7j/lsoo7N+rEKIh9JRJ
   pxTV6FqHL61hT+SBLUZXl1YtiE74YN+HG7XIkw8Tpp6rgR4XwAUvQQ9WQ
   vzBpPFd/+4IijnqL6DZFpfeUgspOw6Eyuq6oMf1wfpjK10zAkNakes63a
   7F5ScaBmwzU1aPJS2PiiPxHI1eL2hNl9q9zHNw3w7zITfwS+lob4ttEIe
   Q==;
X-CSE-ConnectionGUID: 6W+TpeuWTm6cWV37+MGgNQ==
X-CSE-MsgGUID: 2mX59DyTSo2Y1iw3w/9lgg==
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="77268192"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 02:56:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 16 Nov 2026 02:56:12 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 16 Nov 2026 02:56:09 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net 0/2] net: sparx5/lan969x: fix RX ring stall on frames
 from inactive ports
Date: Mon, 16 Nov 2026 10:56:03 +0100
Message-ID: <20261116-sparx5-rx-inactive-port-v1-0-343d8bab58bb@microchip.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADPT+moC/x3MMQqAMAxA0atIZgNGsaBXEYdqU81SS1qkIN7d4
 viG/x9IrMIJ5uYB5VuSXKGC2gb204aDUVw19F1viMhgilbLiFpQgt2z3Izx0ozOm864wU8bWah
 1VPZS/vMCgTOs7/sBXPOqum4AAAA=
X-Change-ID: 20261116-sparx5-rx-inactive-port-df606d3f9b1a
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: Zhang Hewei <memoriaru@foxmail.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3

On Sparx5 and lan969x, a received frame whose source port does not map
to an active port is never consumed from the FDMA RX ring: the NAPI poll
stops on it, and finds the same DB again on every following poll.

Patch 1 fixes Sparx5, where the same skb grows on every poll until
skb_over_panic().

Patch 2 fixes lan969x, where RX stops on all ports.

The issue was reported by Zhang Hewei, and these patches replace his
series [1]. Tested on Sparx5 and lan969x.

[1] https://lore.kernel.org/netdev/tencent_D2451CD0D7B4B812CEBADB56DC722BC33406@qq.com/

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Daniel Machon (2):
      net: sparx5: fix RX ring stall on frames from inactive ports
      net: lan969x: fix RX ring stall on frames from inactive ports

 drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c | 11 ++++++-----
 drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c          | 12 +++++++++---
 2 files changed, 15 insertions(+), 8 deletions(-)
---
base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
change-id: 20261116-sparx5-rx-inactive-port-df606d3f9b1a

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>

