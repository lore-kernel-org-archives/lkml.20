Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6473BCD2B;
	Thu, 24 Sep 2026 05:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790227289; cv=none; b=XJ9+rTQ3N9RcDcPZk1tIL4olqTtb9xobPsOTCpXlD2oLfvBEpnRV++xg/2lgT6Y8MmYn4clYobxXyLWaIg+VStlS3ke+/OToMAkcQgI1aNHRJowq7PGZnoYUgSFbbkjvxg7wzODvMRzZwDlT8xFaqrsK7Lt/kElY9bFotphYGA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790227289; c=relaxed/simple;
	bh=ElMQPFX80h+SlZiGidQoxs1WrxQt2ShDUcd9K90C68g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=oL17IAlFzSpoAsTIZxe+syyp/Mfg0TGSgk9kskqmlUXf33sxzvoiyd89cvdtNfEz0nAHKoz1N0Q2vnT9o9SKxNWD8v3hFkvz8QNl0xP4RmbFqEDZPj1BC9vXIP/aPwefuRX8bOBW+/ua4uFALFWd8jYkvWym2ZPVGuQHUfdD+qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=T7IY24FE; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="T7IY24FE"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68O5L9mP4950761, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790227270; bh=cHLI1u8Ge1fqKKB8Nd7ghqhpuVPJ8c5wFJYqEpn0ODs=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:To:CC;
	b=T7IY24FE23BTneufxc/Vs2AlY18kyHTM4oDOpbMSvQIy+GWcTfcjmaIHJW0bqJ03m
	 5jEthFZw156JXYPWGvlkc+ViIM8LwU+i+7SSUsOis9V2OI/DpcWqBySiywRXepuNOK
	 3A3vhbjFj8r+d8oagrnIRfC/XPBSQdAalPGr4lCGeDnq7gm8TdtWZY6eBCqgAB0R7/
	 Wz4BYCckb7n2JaWWwT37rIdp69gaMGUoHq9awyGi9dAN5fcsv/yvuHABit8pckYwpW
	 /gOO5akCRi7BdeB0mGaeDLE8F2PTTwCoqdTWlsVKGz0xnOUV0JTHgrxA+NpI4NMJy1
	 DVmdTISQyt0sg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68O5L9mP4950761
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Sep 2026 13:21:09 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 24 Sep 2026 13:21:09 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.49 via Frontend Transport; Thu, 24 Sep 2026 13:21:09 +0800
From: Oder Chiou <oder_chiou@realtek.com>
Date: Thu, 24 Sep 2026 13:20:27 +0800
Subject: [PATCH] soundwire: intel_auxdevice: add rt718 codec to
 wake_capable_list
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260924-rt718fix-v1-1-d92674696e73@realtek.com>
X-B4-Tracking: v=1; b=H4sIABqztGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMT3aISc0OLtMwK3SRjg0TTFDMzY2OzVCWg8oKiVKAw2KjoWAi/uDQ
 pKzW5BKRfqbYWAC3CYCdsAAAA
X-Change-ID: 20260924-rt718fix-b30a5d66336e
To: Vinod Koul <vkoul@kernel.org>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jack.yu@realtek.com>, <derek.fang@realtek.com>, <flove@realtek.com>,
	<shumingf@realtek.com>, Oder Chiou <oder_chiou@realtek.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790227269; l=795;
 i=oder_chiou@realtek.com; s=20260924; h=from:subject:message-id;
 bh=ElMQPFX80h+SlZiGidQoxs1WrxQt2ShDUcd9K90C68g=;
 b=iU0haHUIGY624XhJ0mHuO1sAn+VsLI69N8j+YbkVxITYNYOX+8nEMGdYUrt7fvy+fUYjEWk4v
 ZG/7jmNaIRvDRUKSQ3+XIqnpPsy/JSrU8nRhNTpHaXoWEiy1TFoCu8q
X-Developer-Key: i=oder_chiou@realtek.com; a=ed25519;
 pk=kxHXyDR720aeJLqtY0EdHompRip+/kDrmfMzKLqz+7k=

rt718 has wake capability. Add it to the wake_capable_list.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 drivers/soundwire/intel_auxdevice.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index a8407560bf4f..b36cf3928ed5 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -71,6 +71,7 @@ static struct wake_capable_part wake_capable_list[] = {
 	{0x025d, 0x715},
 	{0x025d, 0x716},
 	{0x025d, 0x717},
+	{0x025d, 0x718},
 	{0x025d, 0x721},
 	{0x025d, 0x722},
 	{0x04b3, 0x9356},

---
base-commit: fd5c356039fadd6517c3b770ca62b1d8d1d22eb8
change-id: 20260924-rt718fix-b30a5d66336e

Best regards,
--  
Oder Chiou <oder_chiou@realtek.com>

