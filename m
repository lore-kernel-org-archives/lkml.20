Received: from mta0.migadu.com (out-124.mta0.migadu.com [91.218.175.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FA34611C2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792193086; cv=none; b=TtThbNLaGGXPmC4RW2otYJHYhRp6Th7kcXhV5lOVP6gaa5tGEkuq+qq1jtXSuI15taYlZkXHITVFUYLGRe3T5MJV3BkNucNdw4jl/HGJPETk0z/Y18F3wDtsEZWQ26s1mWgFVFbL7FK/x+OqvYxRQfkS4rkWGZUPaUVvJC68dIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792193086; c=relaxed/simple;
	bh=ZIdfjHz+0OLDjF331M8Isw8fnj3PbEuIrC0pvuG1d94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e4n5Ml8ai2aMk6NLS2DfMJgPAkduX2f4aOyRRRXqjHrw2+Tq81t90FGk7i/HOiamcBognlK5Yf83lLAYtwf+ZFLZ+k+UvaUCTBb3SbpcdXocUzWBfefH4jgcf610CMNMCHhGaUkVbUSYfRbjISYlddew4Fu8lTlmOPbuTWtMgeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=phjWY8wC; arc=none smtp.client-ip=91.218.175.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="phjWY8wC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZIdfjHz+0OLDjF331M8Isw8fnj3PbEuIrC0pvuG1d94=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792193081; v=1; x=1792797881;
 b=phjWY8wCDAxthw4d/E/C205JlilGwEgp9Owc9dqTjWZzQsb8+0x6uGMjSVWg5SgDBa4rQgvq
 Im7kgTqafd+b+aIqTpdYB9fVZBGGyZmqCOZnTX9RyjHVrz6ASDrcBlsqvn88KvuPUGE/mraAlLb
 E88YGIYTGJbFZEjX7W1ZQ3Ek=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7910d0187f47b065;
	Fri, 16 Oct 2026 23:24:41 +0000
X-Mizu-Trace-ID: 7910d0187f47b065
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: broonie@kernel.org
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] ASoC: amd: acp: add ACP70 SoundWire machine entry for ASUS RC74XA
Date: Fri, 16 Oct 2026 16:24:12 -0700
Message-ID: <20261016232416.2628603-3-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
References: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ROG Xbox Ally X20 (RC74XA) has two TAS2783 amps on link 0 with
unique IDs 0x8 and 0xB and an RT721 on link 1. No table entry describes
that layout, so machine selection falls through to acp70_rt721_only and
routes speaker playback to the unused RT721 amp endpoint.

Add a two-link entry ahead of acp70_rt721_only with the RT721 limited
to its jack and DMIC endpoints.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 44 ++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index c2f0479301ebd..0c1a7a70ce146 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -739,6 +739,45 @@ static const struct snd_soc_acpi_link_adr acp70_tas2783x2_l0u9c_rt712_vb_l1u0[]
 	{}
 };
 
+static const struct snd_soc_acpi_adr_device tas2783x2_l0u8b_adr[] = {
+	{
+		.adr = 0x0000380102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "tas2783-1",
+	},
+	{
+		.adr = 0x00003B0102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "tas2783-2",
+	},
+};
+
+static const struct snd_soc_acpi_adr_device rt721_l1u0_jack_dmic_adr[] = {
+	{
+		.adr = 0x000130025D072101ull,
+		.num_endpoints = ARRAY_SIZE(jack_dmic_endpoints),
+		.endpoints = jack_dmic_endpoints,
+		.name_prefix = "rt721",
+	}
+};
+
+/* ASUS ROG Xbox Ally X20 (RC74XA) */
+static const struct snd_soc_acpi_link_adr acp70_tas2783x2_l0u8b_rt721_l1u0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(tas2783x2_l0u8b_adr),
+		.adr_d = tas2783x2_l0u8b_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt721_l1u0_jack_dmic_adr),
+		.adr_d = rt721_l1u0_jack_dmic_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_endpoint rt721_endpoints[] = {
 	{ /* Jack Playback/Capture Endpoint (AIF1) */
 		.num = 0,
@@ -906,6 +945,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 		.links = acp70_rt721_l1u0_tas2783x2_l1u8b,
 		.drv_name = "amd_sdw",
 	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_tas2783x2_l0u8b_rt721_l1u0,
+		.drv_name = "amd_sdw",
+	},
 	{
 		.link_mask = BIT(1),
 		.links = acp70_rt721_only,
-- 
2.56.0

