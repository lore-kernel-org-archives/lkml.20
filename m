Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919783;
	b=H09kBDlswb5Mnw/uTqFILD6c2iiXTBoz8JkhOVyGRdMGAWSE1HNB7jljd/vX67R7ZAwE
	 ihxjImp9YGXOZwmBn7AYy7f+5MHIICLkTDyS7c+ARWlevWF3w1LGxLme80Ha8rtUQONY5
	 atWY3QO+7IobRO0ReL0pd7X5fcaZ0eN0ODCQ0hO4k1I6iDrgHouThRtVfl1nYzJ77Vwmp
	 FiOsYZqbKwZM1Xn83u7H9Mw6EGh0wiLdfMufqzzgu4Qu6F/cO0DHxhBlDx9iD9ZBlmvxz
	 gHfmYe1ODQcBUGpIkWBUmMX8o2I1gYI/6fAcMFXOvZzEA7FIx7lfII45QREHrhCRo+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919783;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer;
	bh=2PnaqtXw3xP/DEZjShIz9TjEPt/aVa0YMLGordJIl88=;
	b=0OY4uwJNTQ0eh/Bz2GdDqH6u3J6ks9uu7bnjM1mT5AiuytkhkSLTFyWeI7w1/PciVSyw
	 EUPide/hLCHihFw+zflX8bXpybXEO/S61GFFBkULFKDfZM9YkZcaMYiQpi90RZASTXmH9
	 kl3wFyDiKWS/zkm4xN/YgVxK5BD5ZvA60W6cXKgwf7WUj8vZbkCLfsLIF9whFhHmH/V94
	 qmySMdOM0B7DlwMsmgozgVQNOrKzpxiBpw6ByZjZB5Q02VqAdYFWfOmtlgaWVvBje2dIr
	 u5Q7dijdbp6ztCl5ndTTZQy4V8gbGukZzh8oFGm/4q5dhgrnCGnonMuKAdVP6Et2TSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=hCT3Nuux;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F373C606A32F;
	Tue, 17 Nov 2026 12:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F373C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=hCT3Nuux
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794919783; x=1826455783;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=23fZaWsqH2GktMaggPg3MzMqQkMiD5EkfpKVr5oGkIs=;
  b=hCT3NuuxlTiPFgNCgm1BefHkrd7wSYozNGTaFCdZT2TLT59ilCTWG7zC
   7p+wgbDawMfkjyCx2w901g4vaWGnHqUKlPZI0LForGi3uCxsY8RzhnZ3l
   bkfglBp4nubxBUxpDAAxHwbLfZas2hOaYyTxyMcb6sB0pPWCf338GTAoX
   krLIDLqNgXFr/M/G7MvdsBUaFHaD0l3fBI6a4GokVJTIwXiD/lewFazxc
   ohpjUCqRzTDpJVvskSZsCIWVRwWtfsExgznhnxC71APBSC4uK2l4/JylO
   UsPO6xbmqelXTxcuqJ/O9XCPMTA7sAQdg4pQLeIwAscZE012pOA3rqlyl
   w==;
X-CSE-ConnectionGUID: m2Kv3tRXQ0K0L4FdZSSOqw==
X-CSE-MsgGUID: qYVP/6FDRouel14QT0nZkA==
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="298044327"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:49:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Tue, 17 Nov 2026 05:49:41 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 17 Nov 2026 05:49:39 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Tue, 17 Nov 2026 13:49:34 +0100
Subject: [PATCH net-next] net: lan966x: extract IFH fields with word loads
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
Message-ID: <20261117-lan966x-ifh-word-loads-v1-1-93063ec6b701@microchip.com>
X-B4-Tracking: v=1; b=H4sIAF1N/GoC/x3MQQqDMBBA0avIrDvQmBCxVyldpM6oAzIpidiA5
 O4Gl2/x/wmZk3CGV3dC4kOyRG0wjw6mNejCKNQM/bP3xhiPW9DR+4Iyr/iPiXCLgTJaHgfr6Gv
 JTdDiX+JZyj1+g/KOymWHT60XTLsgJHIAAAA=
X-Change-ID: 20261116-lan966x-ifh-word-loads-3e9734db3d4c
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Daniel Machon
	<daniel.machon@microchip.com>
X-Mailer: b4 0.14.3

Every frame the CPU receives goes through lan966x_ifh_get() for its
source port and timestamp. lan966x_ifh_get() builds each field one bit
at a time, with a 64 bit shift for each bit.

On a lan9668, this bit loop takes about an eighth of the CPU time spent
on receiving a small frame, which limits the RX frame rate.

To improve the RX performance, read the fields with word loads instead.
The IFH is a big endian bit field, so a field spans at most two 32 bit
words. Load the word, or the two words, the field lives in, then shift
and mask. On a lan9668, this saves about 1 us of CPU time per received
frame.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/lan966x/lan966x_main.c  | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index b8696fc7e9b93..6aa53e5208a02 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -11,6 +11,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/unaligned.h>
 #include <net/addrconf.h>
 
 #include "lan966x_main.h"
@@ -633,21 +634,18 @@ static int lan966x_rx_frame_word(struct lan966x *lan966x, u8 grp, u32 *rval)
 
 static u64 lan966x_ifh_get(u8 *ifh, size_t pos, size_t length)
 {
-	u64 val = 0;
-	u8 v;
+	size_t w = pos / 32;
+	u64 val;
 
-	for (int i = 0; i < length ; i++) {
-		int j = pos + i;
-		int k = j % 8;
+	/* Load the 32 bit word that holds bit pos */
+	val = get_unaligned_be32(ifh + IFH_LEN_BYTES - 4 * (w + 1));
 
-		if (i == 0 || k == 0)
-			v = ifh[IFH_LEN_BYTES - (j / 8) - 1];
+	/* If the field continues into the next word, load that word too */
+	if (pos % 32 + length > 32)
+		val |= (u64)get_unaligned_be32(ifh + IFH_LEN_BYTES - 4 * (w + 2)) << 32;
 
-		if (v & (1 << k))
-			val |= (1ULL << i);
-	}
-
-	return val;
+	/* Shift the field down to bit 0 and mask off the bits above it */
+	return (val >> (pos % 32)) & GENMASK_ULL(length - 1, 0);
 }
 
 void lan966x_ifh_get_src_port(void *ifh, u64 *src_port)

---
base-commit: 994089a3fa3882f27f4bed9fc5815ee7df502e88
change-id: 20261116-lan966x-ifh-word-loads-3e9734db3d4c

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>

