Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315323;
	b=IUBuYMfe2Hw86ntHPzn4sWMQ7M/WqKKlhm+SUkHh0kB3PDeNc/OEo/82RI7987bQ5x0p
	 iu5mZhROkWJGyUgPRCNFqqMnFFGHP4ZGnzX3Ebtw0Wtv6pfL5jvLy8cCngracFtb55pra
	 Tqv/2CrUace5jNqrXRpEaAfX7IqVTB6n8/h1zN7uYxzxJszTtUcPZPV34zPOQdMq3B0iw
	 Ar4qfgR3wnfMbvDZRoKBIsE06S/ZHUuFj54RWYFhfJnkZp73fdEKe+mTA/3mnmmCk7pjs
	 SHgGA3PzUZCbuiq0v8Cn38EU94O4trLWCXh6uZVDzXCLCbVthNZQe3INSdV+tPTBamQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=TwRZuvAXgLAEcFSDE6vuvRmvdHxyqb0LUu/3ZbgkOwo=;
	b=vqg/X8z25FGuCBgBhhqCPjb5T1OOm2Lwb6OCHry7KOZWDeIrAPeQbNCXWy0Od1QXcegm
	 N8tAfIOIMEL2qPsvjK5suUUYbbRqc6dT+koSoxF9qfdGFqnLT9M3x0P2VuIyjDxHlnPbj
	 GegbHu5uCDrTbpFOrR3U9SV1Etil1a6IuuLQBdCLEx1Pg8Ix531xg4sYbCux2KYGwzllu
	 YQmt51cEFXSb+QEKEgNCpr1Hc3O7aT7DsZ7U5FvwM1BsJs/slXJnMgwB+EnMU3RNnClOY
	 +MgrhzzKuntiMIF/NRmvAeACxcQf8LIQn++I/uocEg2LdkEFnNC5KJA2ATysovi3Wyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o+dkBeZ9;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386D160A3820
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386D160A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o+dkBeZ9
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3720addb068so3507572eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794315321; x=1794920121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwRZuvAXgLAEcFSDE6vuvRmvdHxyqb0LUu/3ZbgkOwo=;
        b=o+dkBeZ92Heur0Y/ge5JcPI2o/HVPQgIjxuuRVsitAoburkYeB3B4JeMEvzcgtAY2K
         svAsrgxqnAHZagQKq52bPHWuRQt4CWJKCcOwDj6x4FUeFkTtBhQIG93zMeZsQVxHElhT
         8KXeUSa1xRZpAr3mbYcAH4U5lTsqL+ygKY507GDrBor89KR+hp8KPGPJ8XFNwWMmX6NK
         6G4PV0X+24jjFh+nXo1IUuKDYMXser8FrU0th34YLw8X6yHKPu+4HIrz2j9aT5H5beYu
         uEJyArnh2G2HQQVYWd8KqBqKs3rt4xo7Pfsa8Nh7/SZ/TFKAQyDqbjINev4WOiuwvTJ7
         m+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315321; x=1794920121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TwRZuvAXgLAEcFSDE6vuvRmvdHxyqb0LUu/3ZbgkOwo=;
        b=FaRN/7htbBCHW5yowC0PZCIW7mUGNVcdJacJkNguFX1spVNGOJ83Wzr9AhRO4hqQEX
         hqvxq+Cm0Eqao0qLWpwoB+OY/E1Y+uuPWtZFZQFpK/X2wdpaNPfism0S1Z3OEXuluZ8l
         l89cMnjgP+sVotT45MQtMQUx2DZLvF0fB/3bCm68RK5qxIARuLyMsuM6+0XXH4eWIYTx
         WZRZp2b/esOgB4JUQzCsVZsmIsVoA/L0Jdge6lsvd5zBLaTeyVLTggp0tpfXps+Q+0Ls
         q+bMliKO+JDSbXGrVxnN8Dg/vAXCUqiNS7zBMIFlRy3F8/FI2CLuFvdxseCd++y7+d8A
         pf2A==
X-Forwarded-Encrypted: i=1; AL+hErGqYWlQCUqwDeKzqrjyr6j6r0QhjG0/iO3EUxutWr76NEYFkpgwhbd+/hkTY5as8RlEZSDPgM+NmikOm7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uwMm/N1Mg6z2U85SFA7RNQ05cEBG9SR4VMOCfC/RdnQ0wsvbK
	AKmPlyMhxmWnX+w0EjTOkUXkSIwyZFBU2y8rYGHEiYScSF4pyoIskaJ+wWcwi+nhhMk=
X-Gm-Gg: AYBFou0ZDREffuj1tarbl66nLNZqR2eeEpmR2LEL/NjS3LMdabPsYCszaWYtwnK9edl
	CquICTNHrMNzx0STh7+7ex+yI3pBcwGbmT+trI2a0E/TGEPHCgIebwaJUCNsOPDscVDbHEHhkVc
	X6JguzSCFRhCdBPSe8N+ZsK3LzkRlG5eC6hY89/CKNo3JNtbB7opbVelJ2O8SSzYEslS+59pf/H
	0pALsc2SXKTQmIfGLK6bagL0eRAIdumDGMObmRWivDwfBBDolYvhFgA6hDY7v/cNXtKZZRsrLDk
	+OKpIriSMK9l2KFRl3k8baIE8BOxLrEfR7/ITvopG7Ejp4SvBBxyoLAMyo2wTF+czIQz4EKbUsU
	IdRUi01agnIDBqHepjhmJXETmbly4XgTMkJ0TyycnsabQfprgugmDaVefZNcTWSWWsstuAARLgK
	fH/8NLwI+BDOkS1DY2n4dm4h6UFPiQzOAGCZ1KJJdUq7ms+DtjOU2knjBt4vlHXymSUDKznVA2/
	ayW7tkBBSxUDh0NCnhMuT9FdhOnSUXsQiD0xAg6fL8QWTuz0MTutWHN2RBMhaHM/1njqzefzumE
	k8L8geUERyZRWPx40l7RIw5J
X-Received: by 2002:a05:7301:fc0b:b0:36a:18d2:8c79 with SMTP id 5a478bee46e88-37520216c5fmr2704198eec.19.1794315321086;
        Tue, 10 Nov 2026 04:55:21 -0800 (PST)
Received: from myarch ([121.165.40.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae63a6sm6855380eec.1.2026.11.10.04.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:55:19 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	shumingf@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaehoon Kim <jaehoon1744@dankook.ac.kr>,
	"Claude Fable 5.2" <noreply@anthropic.com>
Subject: [PATCH RFC 2/2] ASoC: amd: acp70: Add rt713 + rt1320 SoundWire machine for LG gram 16Z95U
Date: Tue, 10 Nov 2026 21:54:29 +0900
Message-ID: <20261110125459.3924-3-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110125459.3924-1-jaehoon1744@gmail.com>
References: <20261110125459.3924-1-jaehoon1744@gmail.com>
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

From: Jaehoon Kim <jaehoon1744@dankook.ac.kr>

The LG gram 16 (16Z95U) uses an RT713 jack codec on SoundWire link 0
and a single stereo RT1320 amplifier on link 1. There is no matching
entry in snd_soc_acpi_amd_acp70_sdw_machines[], so no machine device
is registered even once the SoundWire path is selected.

Add two machine entries:

 - rt713 (jack + DMIC endpoints) on link 0 and rt1320 on link 1, used
   when the RT713 exposes a SmartMic SDCA function (rt712-vb check).
   On this machine the internal microphones are routed through the
   RT713 SmartMic function; the ACP PDM controller is not used.
 - a fallback with only the rt713 jack endpoint and rt1320.

Tested on LG gram 16Z95U-GS59K with kernel 7.2.14. The "amd-soundwire"
card is created with these PCMs:

  SDW0-PIN0-PLAYBACK-SimpleJack  rt712-sdca-aif1
  SDW0-PIN3-CAPTURE-SimpleJack   rt712-sdca-aif1
  SDW0-PIN5-CAPTURE-SmartMic     rt712-sdca-aif3
  SDW1-PIN1-PLAYBACK-SmartAmp    rt1320-aif1

Headphone playback and internal microphone capture work with the
stock alsa-ucm-conf (1.2.16.1) HiFi profile; headset microphone
capture was not tested. Speaker playback through the RT1320 is still
silent although the stream starts without errors; that is being
followed up separately.

Signed-off-by: Jaehoon Kim <jaehoon1744@dankook.ac.kr>
Co-Authored-By: Claude Fable 5.2 <noreply@anthropic.com>

---
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 85 ++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index ccd0115..2a6d829 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -553,6 +553,80 @@ static const struct snd_soc_acpi_link_adr acp70_rt722_l0_rt1320_l1[] = {
 	{}
 };
 
+/*
+ * LG gram 16 16Z95U: rt713 (UAJ + SmartMic) on link 0 and a single
+ * rt1320 SmartAmp on link 1.
+ */
+static const struct snd_soc_acpi_endpoint rt713_vb_endpoints[] = {
+	{ /* Jack Playback/Capture Endpoint (AIF1) */
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* DMIC Capture Endpoint (AIF3, SmartMic function) */
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device rt713_vb_0_single_adr[] = {
+	{
+		.adr = 0x000030025D071301ull,
+		.num_endpoints = ARRAY_SIZE(rt713_vb_endpoints),
+		.endpoints = rt713_vb_endpoints,
+		.name_prefix = "rt713"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt713_0_single_adr[] = {
+	{
+		.adr = 0x000030025D071301ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt713"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1320_1_u1_single_adr[] = {
+	{
+		.adr = 0x000131025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1320-1"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_rt713_vb_l0_rt1320_l1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_vb_0_single_adr),
+		.adr_d = rt713_vb_0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1320_1_u1_single_adr),
+		.adr_d = rt1320_1_u1_single_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_rt713_l0_rt1320_l1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_0_single_adr),
+		.adr_d = rt713_0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1320_1_u1_single_adr),
+		.adr_d = rt1320_1_u1_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_adr_device tas2783_2_adr[] = {
 	{
 		/* left */
@@ -714,6 +788,17 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 		.links = acp70_rt722_l0_rt1320_l1,
 		.drv_name = "amd_sdw",
 	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_rt713_vb_l0_rt1320_l1,
+		.machine_check = snd_soc_acpi_amd_sdca_is_device_rt712_vb,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_rt713_l0_rt1320_l1,
+		.drv_name = "amd_sdw",
+	},
 	{
 		.link_mask = BIT(0) | BIT(1),
 		.links = acp70_4_in_1_sdca,
-- 
2.43.0

