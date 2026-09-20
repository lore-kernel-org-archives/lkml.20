Received: from mail-vs2-f16.google.com (mail-vs2-f16.google.com [74.125.227.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E674C242D62
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789867281; cv=none; b=db3GNktTk56XvxpzaJ4MYaub5HO7PeVDQBy6ib6jhB4//kj3V3AvQP9yiXY0DjFGnLr3IBmErP+QvR+qEjigxRwj64Fiv3eNitYtMynSCuQHAxwiFVl0+ZFW3/u9eCX0+XLvWWfXvpngn2z9itNw0ruQmlChQUp9RVnGunTZhGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789867281; c=relaxed/simple;
	bh=2zaSWf5r9NwHO8bq30a3+zlb6fuk3dWRT56RBawh42A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nkpo0z9qGvy+OGdF6WUror/X2KFS8loKEStvYDi0gffhJufjA4hIU+3llZknA0LizuxgbhtD2SNQ7e0zARt5UCT6Vn1JRNwLnB4BPhMvZS96qPxq60P0ukqMmfcOsGJu8KiuQ0fLpt83RQBCnR8Pm/goEvUqzI4fu6oj08FxUz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3G44PZz; arc=none smtp.client-ip=74.125.227.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3G44PZz"
Received: by mail-vs2-f16.google.com with SMTP id 71dfb90a1353d-5c67e5292fdso612055e0c.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789867279; x=1790472079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7dETFL01Uf/V8b/sJtlYLOgTsT5+0OY9xqQKkVwMJU=;
        b=H3G44PZzgdTZOnwKmIw3EfAOWZV8DplBDKkbWkjwyy7wB6EfswLhgeKgMFJZEAj+VW
         n0OcUcITPU10YpZW+9qgeV2fXNWLyA0UVETSuHv4YWmKIhgNJdn9liLECsfe9iJZvmNw
         8zKWLHpDEpjvQ5hCGKYDsvnWUycdt0HYpgBGaGNq4vUWsrJm8AMr/hFEjXCEkRESCxM8
         RuOn1SoltfgonOAr1twZTSw3uHuAFyOS2P9IKJdDrF+gvHT7+5uEC017VLyCzZ/e5Zyi
         OaZc3L0jAKaDPmkXo/egZ5B6CiakuTn0fRuGhGuUvv8kCI37xMJznn7tAuH0HlbwolkZ
         nJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789867279; x=1790472079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7dETFL01Uf/V8b/sJtlYLOgTsT5+0OY9xqQKkVwMJU=;
        b=Fs8mrT5b1DobY/wpUfiwn3KVl/336dYqHp4KIFcQGB0cb44bxP6lo+8xOkGVgDPfK8
         JDZmCuq6hP75u8listsH0a7oiuagQ/bEc8tZScPBnp1fF4fXWAFG3uNIk8nfJTRIhVHe
         Tm/FfPLgofFK+tSmWJU/fC0Ftj4HKx/xH5v7mXoLFrrAXsFHCFanBl1N9qcS5jhNiqcL
         LZUsYIfRGXG1VsipvGZP6ZJATYN8zLLTHwBjXOzHv13WS81YEQOqlLp9MB2VLRp11kBy
         9daA+tLP2NcmoCdkNJRO5N1QjN0G3fagexTxOleG19wYIrgMQfIwxZwQ2CfGIS0FmyFX
         CIxQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8JMGz7Cl6H49FFwTtLIGNahY/zosBv7bfqqvzl0kZ4OjJ6lCrvt6rddXWaKjMTq6w1VukVtFlRj5Jt7w=@vger.kernel.org
X-Gm-Message-State: AFuF++lh/IOfXiL4pEP/Qdvsbs8UEV6stJZsqetYqU/brAtT5mcDqxWN
	8aJdXjCgkB9yuzePF7Y9G6p164fUuzfijmn0e5pIosOeuEhImOrNeCNf
X-Gm-Gg: AYBFou3xH5EtzPiMGP5YcllGUA0ePIBndJlJoqNNMKOlqGMJ9Ab0UU7V0+AfSdTjgpC
	ndGHLFRReTbpLtv7A5dYQW7fTzmFHigfdiEQJrVriyKyrhVEppoFn8frC/TINQyJlK21p8020DM
	j/zdMT5HAQk370TOw11SjthrLFOs3ksyht6pLvfyUGGF5jnBM4yGjDzKvL3iBm6n4Z6XDk+LwGe
	Q79WuUxDiTl8aKGCNym2BkN44cR/M8DmKXRS652GltvxObklxf2cZoVfCord5fhvOC5h2T3dClv
	D6D0DffVbhu8h+/w0UmBy10RfFy3o10sR0dC1WSLlperyEaPJ/PdDMottHBjH4sxOUgoRax+fae
	NPHW8IGylkZ7c1ET67i3Ax24PFj/ZQfEGHqNxr5LXknHZhr85C5woH2k0BZsJTVJANoSg7YLpTl
	RcXfuOEZesRYqrHnQtGCtSHpElT4lwCnsyKfgdpYIs6k5WLQEU3juXeh8v/FZ1jtao2lQM
X-Received: by 2002:a05:6102:2922:b0:7a2:2a6b:e7b4 with SMTP id ada2fe7eead31-7a55a0253damr2427061137.2.1789867278724;
        Sat, 19 Sep 2026 18:21:18 -0700 (PDT)
Received: from danozmo ([38.51.243.36])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a6ac5e08c7sm4064319137.8.2026.09.19.18.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 18:21:17 -0700 (PDT)
From: Daniel Ortiz <letargopausado@gmail.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for Lenovo V15 G6 ARP
Date: Sat, 19 Sep 2026 20:19:20 -0500
Message-ID: <20260920011920.2482786-1-letargopausado@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo V15 G6 ARP (product name 83UU) uses the ACP6x PDM interface
for its internal digital microphone array. Its firmware exposes neither
the AcpDmicConnected _DSD property nor the _WOV method, so acp6x_probe()
falls through to the DMI check and returns -ENODEV, leaving
acp_yc_mach.0 unbound and no capture device registered.

Add a DMI quirk entry for this model. With it, the machine driver binds
and the DMIC capture device is created:

  acp_yc_mach acp_yc_mach.0: Enabling ACP DMIC support via DMI
  card 2: acp6x [acp6x], device 0: DMIC capture dmic-hifi-0

Capture was verified working with arecord and PipeWire.

Signed-off-by: Daniel Ortiz <letargopausado@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 79858fc..f3f3592 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -381,6 +381,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83Q3"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83UU"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.55.0

