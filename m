Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442111;
	b=rjO9irQcNj4THuuvb5HSXXGtSue5gv0P46NP4kyU8V3hYkGwRZkmL/mfynbbvLOoHZyz
	 6i/UyyFrWmpbhEsrmrDRIVfjRzKj0nylviEtPjhy43rNW8JaCyk97QIDrYjnGRh6IP1Yi
	 LS0TXe4olUsT0OlZjv7ZMS6XMNqUN8FUosOJecvr5MOiKrU95PkWAzVkElKkNWqP923zX
	 U2sl9qmtjUZyxiozin95zEb4HUGyV7c4wDcKBVII7c2iTV3snO7YNJ4OM2ad4+l5Zbdxa
	 gmWorQyJhKudv42dC+nwlIC97SzNk2ouivV+63cjJzRaSwrzlN0uVcF3Sa5FRXaNHfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H2n5rvEmZawleJvXW2iwJ/2FM80C7pwmFa2gEkkaLOQ=;
	b=ecIu5G24W96PNPI3+cFefrcaQIfu0ys6wgPbq0UUn64DIgyDQuS2CwYeKsm5vLd2Y+0U
	 DxDU9IGlb3e70p+/zaX1kIRC97mZLjAUitbdDPC6nFVdIo31s7Jvv8t1YdedWWq8GBwm/
	 i9KNOeyCBcvSbiFyh4bnKZQA0E7wti/+q5hQHsqRU5gWpSF3nSdk33Jb3OSRWVn1Gx3Kx
	 LhkRqrql4IXIQf3qfXq+cpdRY9ShtsVojN7fkYuTzlwI2Np5CMblK7ipPHkhfMaRtAMvK
	 cuUxNN+uKFLQs2Q46e4Ta2kmBysjyTBCecRNhbkTtS6ORBusIhkeIY/444oK2/Ho/fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aHCOAozE;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D4E606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4D4E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aHCOAozE
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so9422805e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442109; x=1794046909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2n5rvEmZawleJvXW2iwJ/2FM80C7pwmFa2gEkkaLOQ=;
        b=aHCOAozEayO/tn/0TW0arhTa5D7UGVboOJkhGa0sRb3GIpYYiHFVGlKSaWSg+LkZRG
         whKqQ+BmwPd0Rz86HU6PuFwNvPDFBcIU/c7aVNVmokCaDm00RZokt6NNSyJz/12Qi04U
         08r7r3yZs+gsu8z0/AOOy1vO2ViZXsrbw54hHCKBtjBeka+XAeYTJ49NYM0CU2maykdJ
         Kexc+WL0XAVfVKtuB+5NB17l1gD191egPnSa1AHzCwU38IOJCMtoSu7Ywp1EkgfJXeHW
         iecdqubAs/ghMtah/Z7BffR5N6ZK1XHTlou19m+xDzqg8ZTCkCd2anWqycIGhQqHq73M
         edXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442109; x=1794046909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2n5rvEmZawleJvXW2iwJ/2FM80C7pwmFa2gEkkaLOQ=;
        b=Q2drqtkb2hEyKlOcFu1aJXx18zt5S+LQokYefPelQSL3Zy/3agqtOvWUOfAftF3CfC
         9YCEslrjTj26GgWTbmeckTSUsb1/vtS0KxUqP4oBcI0BD/EEe1OLueNKkLixvgFe5obD
         NsXIkSD9l9BI8i4umIsfVTzZoJpWM1vLqejUIk+bmkUi4oBUSRS/7r1xDwCWcUnB4mx7
         ViKhoyiFB0JegFuP7tOEG3EVDD/EtuRbSXZ7TyCUhvnSwIsz44S2EQMLmzFSmZXz0KRE
         fW7WnNIAjJcQyCuP1XcATo1PoUoMnS6rtrA5a3fwSlatHUfPLj2PzPW+3x0/5D2pz48S
         hUag==
X-Forwarded-Encrypted: i=1; AKwUvBxNiTaU5gTKcRAmIhKs3CE/mieKuoyvl+0ePvhueaz8xq+FIb/a6y6MCLtOSRhurWgiGk/M+q/TdBIKVAU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjytmhChv0Fk/O00KcQap4F1XVKr53F5m/eoG3Z5MUo24lvyNz
	s7KmBWp+PE0FdjP6q4DRSpFKM8ozc6hIgJX2zcahMTlf6fmnjYezKly6
X-Gm-Gg: AYBFou2veowWLYuZuT5k25YLPW0VvJo3wSbVPeyGTKUPyq6YeTw+qFr4kwctiAtzaq3
	fVgUJEMTXg0uyI11YT7BlWde3RFtboAKJ+D/hCMFMPDV3adkOE1pRE0IvTjgeqkj0i7kxmh1c0K
	411Vd3EF9bsocpg8020ewWzphqmtVzW6NLMdaj/vgQxy1V+Ahek4RUsueB3HkfKClZYr+SGL0Q3
	a9XyzGkefi29JFUY1r50JhxgxZl1nL8AiuRPDkKr0dntXyTE5lGzDN1DnNmYW7JtWb/tPa946qw
	A9hkwnbjygUqm79vJQQ2B7vK2K/TOs5rCWME5xkTvY94CNqa2R5FgZyaBNyyjOpp2yW8hBhLrNg
	3D16pOqLUDppDEF2CYFU0kodXrmv3Aue5U2OVOhm/v2hlCzCHesE1lz5aiCERkBu/Dw/NJ/IZRF
	oMNovz5ECBIbVq0ODLySqOLKrzX76RVtsMJiOhEvMlrE0Qr8OaRLTwoMMPYjTp4W4KA3edD7ps0
	LTR09cs4dK1Kp+ACrN3MbzkK4gM0K6PeKcOzWVxZ/owXz7e7jltQSBBL+LUXyKbuT99qOXZ0MSM
	RdDVM8xRjv9BedFRPRWaQXvsaODp77OkxiVRBGOHl6ikKYbBiXTmh0U4h8YiXpbfgAg=
X-Received: by 2002:a05:600c:19c8:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4ac1913ef8fmr107844405e9.27.1793442109074;
        Sat, 31 Oct 2026 03:21:49 -0700 (PDT)
Received: from OmniBook3.station ([2a02:b023:13:69f1:e78:b69f:1c29:ec5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea72254csm65226785e9.1.2026.10.31.03.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:21:48 -0700 (PDT)
From: Gianluca Balboni <gianluca.balboni06@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianluca Balboni <gianluca.balboni06@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for HP OmniBook 3 Laptop 16-by0xxx
Date: Sat, 31 Oct 2026 11:21:36 +0100
Message-ID: <20261031102136.24600-1-gianluca.balboni06@gmail.com>
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
Content-Transfer-Encoding: 8bit

The HP OmniBook 3 Laptop 16-by0xxx (board ID 8EE3) has an internal DMIC
connected to the AMD ACP6x audio coprocessor. The BIOS does not set the
AcpDmicConnected _DSD property or the _WOV method, and the board is missing
from yc_acp_quirk_table[], so acp6x_probe() returns -ENODEV and no DMIC
capture device is registered.

Add a DMI quirk entry for this model to enable ACP DMIC support.

Cc: stable@vger.kernel.org
Signed-off-by: Gianluca Balboni <gianluca.balboni06@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index a7fa0e8c460d..7a629b35e076 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -762,6 +762,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8EE3"),
+		}
+	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
 			DMI_MATCH(DMI_BOARD_NAME, "8EE4"),
 		}
-- 
2.56.0
