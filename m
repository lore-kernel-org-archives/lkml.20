Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793081067;
	b=5pfKrNO+otkws1VX0i0RjUR/g7tHW15E9PjDdaggc/wNEMH/qf1ATksYhX6pB6m9mT5f
	 i2WjEVYF2Mh4BNRaEcBZvW0UhMNWwK2owfW0iKSci4wCMQXw44DDSUIiiUKiVpsy8I0bA
	 C9yWPjDnZD6tfz5rB90nBavYllzHqoeSGF0qxeGhrwtIR/Fkgd3wgjtMqD1oeOzfd9FXC
	 O+ngJHVLIjPy/3E+Ha677XXwqMvli+8Yowejv7Grll88hT9In71wvsX9/u/B/cSnTTAQX
	 FtEy/RnYl2yegzh33NDeR0n2ziJeMWkeEe8m41zIdZuTUiiI8Ee/KmCo4A9GBVBqaDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081067;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:X-B4-Tracking:X-Change-ID:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lzN5XJ860NKTs7Y9KOhshhR1v5kpoeRKW05jjjJkiZ8=;
	b=NyYX9QYgQALZf777AHgji3NwXjdFEb7BtJeSFJFETCIA2pdZ9UMAhlcYXN353kCEbGhl
	 GBcbi5s+9NOTgtczt3inNUii4GdRZS60sXOozrn7rvkyC2j3D4Sibu73h693GZJhCIJJr
	 QHgab/tDvxtLnGw/1p3oUTfRZyCDuvIPHR5RadmYujngjhXAvghZKbyEg5krNY+4eMvef
	 n6Af8EqIRD7b29dq+6l+HvwYhKtr/W78s4bh1tThgWc9B6yEIeFZ7I2p38EY1ffXK3lXV
	 UwTlyfJBiEWKeqRCzu4BXCH+aian5jRNfy6c1/Xlvz5CQeMQfjXLeu1cuXRxcBBJXYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=JUaSaZBy;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B25606A31A;
	Tue, 27 Oct 2026 06:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7B25606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=JUaSaZBy
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69R63dzO6708309, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1793081019; bh=lzN5XJ860NKTs7Y9KOhshhR1v5kpoeRKW05jjjJkiZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:To:CC;
	b=JUaSaZByKGVKnr3dEEZqOic6HPNw3OlOqKG+lwbypCsolUn955CWSBuZBFFqGyUbn
	 wS+Q18coBALqcNwfQFIAdyOHaEHWaHWMYOI5NyEgT0K+yz84cyOshPqBD+k5SfzRya
	 vA0XulLfoZm0lsaioXJP5O0np08jvF2HaYUvQgf3seYxWv6SOcUYT3i+Gh0zUyWLw3
	 UxmgX8OTp5Tp8PQaKvLG+w1Z4X6/O0BPfa9InPMBACmwvpznBCG25BTJIuyfuiqvaf
	 LvlQWQ4yortJZXoOqg1glJueaskkt2tm3wKoKMESpEX99NVdVH6gtNVey6n0pe1/C2
	 Q6VHIy6zoGClA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69R63dzO6708309
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Oct 2026 14:03:39 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 14:03:39 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 14:03:33 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 14:03:33 +0800
From: Oder Chiou <oder_chiou@realtek.com>
Date: Tue, 27 Oct 2026 14:02:47 +0800
Subject: [PATCH] ASoC: rt721: Remove invalid register defaults
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
Message-ID: <20261027-rt721fix-v1-1-42cd4b1711d2@realtek.com>
X-B4-Tracking: v=1; b=H4sIAIY+4GoC/yXMwQqAIBAE0F+JPSfkHjT6leiQttV2sFCLQPz3r
 I5vmJkEgTxTgK5K4OniwLsrkHUFdh3dQoKnYsAGlWxQCx81yplvMSO2ymjTTmih1A9PJf6u+uF
 3OM1GNr57yPkBzu0EQ2wAAAA=
X-Change-ID: 20261027-rt721fix-f2286b7b8d2c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<flove@realtek.com>, <shumingf@realtek.com>, <derek.fang@realtek.com>,
	<egor@crazyrussian.pro>, <jack.yu@realtek.com>, Oder Chiou
	<oder_chiou@realtek.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793081013; l=2776;
 i=oder_chiou@realtek.com; s=20260924; h=from:subject:message-id;
 bh=z120Az4uzqTBtJeVj2+FuENE9VvGaJgqUlUfuB+E30Y=;
 b=3V6LEP2ESLaseaiCTtg70cDKGFAcHqC+1uwrbgljr5OZJZklqP+GVK256kDLKII3NW3XruNx5
 vJFV/pRx+b5CZLEldhn0plR8q+8Ndn7oo2+uq8IzKps+s3dGPLzI2r2
X-Developer-Key: i=oder_chiou@realtek.com; a=ed25519;
 pk=kxHXyDR720aeJLqtY0EdHompRip+/kDrmfMzKLqz+7k=

Egor Poderiagin reported runtime resume failures caused by rejected
writes during regcache_sync().

Remove the PDE23 REQ_POWER_STATE default and the defaults for the
volatile MBQ registers 0x2000046 and 0x6100006. Also remove 0x2000046
from the MBQ readable and volatile register lists.

This allows cache sync to complete without suppressing sync errors.

Thanks to Egor Poderiagin for the detailed report and testing of the
default removals.

Closes:
https://lore.kernel.org/linux-sound/8a12a2d9-1b56-4e00-8ccc-cf31325f8366@crazyrussian.pro/

Fixes: 7a0886826308 ("ASoC: codecs: rt721-sdca-sdw: Propagate regcache_sync() errors")
Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 sound/soc/codecs/rt721-sdca-sdw.c | 2 --
 sound/soc/codecs/rt721-sdca-sdw.h | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index fc34a0537d5f..0c78799793bd 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -92,7 +92,6 @@ static bool rt721_sdca_mbq_readable_register(struct device *dev, unsigned int re
 	case 0x2000026:
 	case 0x200002c:
 	case 0x200003c:
-	case 0x2000046:
 	case 0x5810000:
 	case 0x5810033:
 	case 0x5810036:
@@ -174,7 +173,6 @@ static bool rt721_sdca_mbq_volatile_register(struct device *dev, unsigned int re
 	case 0x2000026:
 	case 0x200002c:
 	case 0x2000030:
-	case 0x2000046:
 	case 0x2000067:
 	case 0x2000084:
 	case 0x2000086:
diff --git a/sound/soc/codecs/rt721-sdca-sdw.h b/sound/soc/codecs/rt721-sdca-sdw.h
index fe04a3726334..eb093992759c 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.h
+++ b/sound/soc/codecs/rt721-sdca-sdw.h
@@ -63,8 +63,6 @@ static const struct reg_default rt721_sdca_reg_defaults[] = {
 		RT721_SDCA_CTL_FU_MUTE, CH_L), 0x01 },
 	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_USER_FU06,
 		RT721_SDCA_CTL_FU_MUTE, CH_R), 0x01 },
-	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE23,
-		RT721_SDCA_CTL_REQ_POWER_STATE, 0), 0x03 },
 	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE23,
 		RT721_SDCA_CTL_FU_MUTE, CH_01), 0x01 },
 	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE23,
@@ -91,13 +89,11 @@ static const struct reg_default rt721_sdca_mbq_defaults[] = {
 	{ 0x2000003, 0x0000 },
 	{ 0x2000013, 0x8001 },
 	{ 0x200003c, 0x0000 },
-	{ 0x2000046, 0x3400 },
 	{ 0x5b10017, 0x1b07 },
 	{ 0x5f00044, 0x6040 },
 	{ 0x5f00045, 0x3333 },
 	{ 0x5f00048, 0x0000 },
 	{ 0x6100005, 0x0005 },
-	{ 0x6100006, 0x0000 },
 	{ 0x6100007, 0x0007 },
 	{ 0x610000d, 0x0051 },
 	{ 0x6100010, 0x0180 },

---
base-commit: f77c0553a0d526c733e61dfd916c300b6bb032fb
change-id: 20261027-rt721fix-f2286b7b8d2c

Best regards,
--  
Oder Chiou <oder_chiou@realtek.com>

