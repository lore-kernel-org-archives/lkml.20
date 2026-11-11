Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794401516;
	b=48VUNJQ2J4FTl51KWnoh1cKW92v4XcEiAgnzFNediWf7yiNL0AlHENZ1TUczN1cqfTsU
	 X46iOsNDmxYv6r5+ojJXoRrnTgbUoS+OG5U1Tx/bw79hWfY8V99SBQPEN1t2g0icRziMd
	 LbvYsq9+rb/K+kPFKkZq8c6HwhNMc4mGL8KAWSHK5Abn72F/+Q4GzACLPSeYwqjliX3ok
	 KcH6YbZ5yyuDytSpGS7NGXArCrImLZxDoR5gqfKYLvkeG4DoJAKnw13Dxohwy9flx/jRZ
	 LGOskyVxxLnGcZPDCd7uLolIR4DDfzhKeQ+uOlsvMX5lyX3yIxzAUrvM6SEY1FQmrmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401516;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GTpqPv7EmkrA2JeQju9TsSg9zyrr7ErJ6T0eRUbdX3g=;
	b=2Sf55hxXKpkPAagLk5mw4hIPo8DOTAD3kFptA3vdUJp/cHErY8iL4DNPG5NTDMLnI/M9
	 N25v/2fgnTqqP9uG/To4yO8nTGneYNDeIShhCvqGyF5z6d3lUjU/cn3a7KWklG96bmaN6
	 PeRaNIk4lXf1SEndRq3LzzRRxMNguL6ao/uSE/HOWuiMUQi05+5iverB3KKHgpH/55D52
	 esb587hinojTbKjlOe3ZAe/BEK5XjikZ1uE601gg55Thxem0E1Z28MqfwKd2+VqMXszcZ
	 6XuDYZhnm3Q+paFv1QHnZM9FB7fLX/+dS8kPwLUGJnkiDsuRU9y45C4dBUGmmNMKM2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l509RJZ9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3E2606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l509RJZ9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794401515;
	b=ndcho07SrsqoHxLeTlSKdWt5AScZ1oellvXvcOsedcfsxmUUrBBRVjXZdKfYVm7Um2KE
	 c+DKXL2k2ureTJ6ghZTTasIcxDDkO3Qw5nS/uyYeiVnYP5VQYF7LP54NJEGqj93tKL57J
	 521L/58miEnPbhNKctTLwuRRLZUfiCchm8JIcbBASWGLnn3GhMqBA0qrF+9+RscNqaDDA
	 6/ga0HfARX3nPOlO0HsG0k56Amn4tR7ulbdJUSLgdvU5VZ1Xn6LTnydk9f6navR/RJ+TE
	 rQiOOzn2WbPKd9Q9WH+CZOaLIAoR3NB0tmsvTx6C9zYMP6z27FGJ94ps68lsujmle/Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794401515;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GTpqPv7EmkrA2JeQju9TsSg9zyrr7ErJ6T0eRUbdX3g=;
	b=d+vEpRKSrxrh0gTbu023s76eBYftTshWkKmQXdVrQp8gw9m/mAoHCwZIewFiehtBV+ME
	 TIxge8x/k/DpNYReQFEAifAeVShdNROr7i5Mr8AkHYKkCtYKEWzjJLBFSs7kdn0uDTqK9
	 vFWUNiwY2xSxFT5MFX8fDKANLGoFAPUPTKfhRYBzGGGoBGrdr/YPHHR3+HqhPNRsm3kMZ
	 Cbo5cj9A0980xLBkOD0eZcpTmB1pbaah9lOEFR7+vkKSvp0BBETXfUo47/nBLhJ70Z3hZ
	 1ITweW9NDo//90vkapERLe/SFUI5OtFTRkIfx3aZrkb14o454FwVBKFi2HmgT0gn/kw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5723E1F00A05;
	Wed, 11 Nov 2026 12:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794401515;
	bh=GTpqPv7EmkrA2JeQju9TsSg9zyrr7ErJ6T0eRUbdX3g=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=l509RJZ9NXfEqyUNb3gNJAVeWlwnjmF2Tpy0Eeq45rp8iDch2C5KihJOwZAE0atn4
	 wUR546//vXnn6ONkcQoYyEkn/NZL0omnLP0Rbbmsc1+USx3/jIHtufLWG5W99rzD62
	 Fecw+molph6EPDiyYtIbZ27EVbBzC5YaYzBfHHZnSxuM5MTqAz+8BxabN9nfj8se3f
	 M55CxAWD4iAJQAd1SQXQf96ho7+qTWkFpNfOGZ3U9JKRKefzsnDczxhV4rFDc/1aYG
	 mqXLUS8cJFWPB8kVrpMMIS2aenQ3Cr2nGK/lI18iv9+fVQXtywyZdSLGhpXF+/2zkq
	 szaFjT9zK/OAw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A1D1E48FAB;
	Wed, 11 Nov 2026 12:51:54 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Wed, 11 Nov 2026 12:51:54 +0000
Subject: [PATCH] regulator: tps65132: Fix incorrect bits for VNEG/VPOS
 discharge
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
Message-Id: <20261111-tps65132-discharge-fix-v1-1-c796428a5d43@protonmail.ch>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQ5AMBBEf0X2rElbJeFXxAFdrAPSRSSNf7eY2
 5u8mQiMgZChSiIEPIlpXQRMmkA/tcuIirwwWG0LI1H7xkVuMqs8sRhBjIEuhZ1HXWpXZs6BjLe
 AUn/HdfMzH92M/f6+wX0/2TlL1noAAAA=
X-Change-ID: 20261111-tps65132-discharge-fix-ebde09049344
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Venkat Reddy Talla <vreddytalla@nvidia.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794401514; l=1425;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=PnrNFcAZ5ldwdIhMuy2jJuUkQIJHnuZAIh/FbHRKmRo=;
 b=r7IRW4fYtS8IbbyW3nAx9vl7nERViBONi/sgE13jFnSj/khyFacRQmcxkg/H118+a+3JdteNV
 /llHze4HQABBXJ9SBQmBKtvLDv7uMTP5QeKvtFxiz21vKy20d3K4l0h
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
Reply-To: bengris32@protonmail.ch
Content-Transfer-Encoding: 7bit

From: Ben Grisdale <bengris32@protonmail.ch>

According to the TPS65132 datasheet [1], DISN (VNEG active discharge) is
bit 0 of register 0x03, while DISP (VPOS active discharge) is bit 1, as
described in Table 6. The driver currently has them swapped around, so
setting the active discharge of one output changes it on the other.

Swap the bit definitions to be consistent with the datasheet.

Fixes: 77c129bfefc8 ("regulator: tps65132: add regulator driver for TI TPS65132")
Link: https://www.ti.com/lit/ds/symlink/tps65132.pdf [1]
Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 drivers/regulator/tps65132-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/tps65132-regulator.c b/drivers/regulator/tps65132-regulator.c
index 912db82ab51d..42388a170116 100644
--- a/drivers/regulator/tps65132-regulator.c
+++ b/drivers/regulator/tps65132-regulator.c
@@ -37,8 +37,8 @@
 #define TPS65132_VOUT_VMAX		6000000
 #define TPS65132_VOUT_STEP		100000
 
-#define TPS65132_REG_APPS_DIS_VPOS		BIT(0)
-#define TPS65132_REG_APPS_DIS_VNEG		BIT(1)
+#define TPS65132_REG_APPS_DIS_VNEG		BIT(0)
+#define TPS65132_REG_APPS_DIS_VPOS		BIT(1)
 
 #define TPS65132_REGULATOR_ID_VPOS	0
 #define TPS65132_REGULATOR_ID_VNEG	1

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261111-tps65132-discharge-fix-ebde09049344

Best regards,
--  
Ben Grisdale <bengris32@protonmail.ch>


