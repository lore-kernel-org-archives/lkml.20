Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736434;
	b=qWzk5GfQvzzzr6a9Km3s6GOAiKp6aofAuephgdm5eUxHJ46NpCaLeQQuL4N8RmcKxMYQ
	 q+ZkPwuA0BbudDJrsa8Njhym2dpoKyXM+4sW6lawMQbgnrQvv4vajJ6Onr5d9Wnsshrc5
	 Zb7EfyLysUz+Kws4qF5QJEeH9Yjz2+eyDlglJT+sv6BJzYTNSDBqOE3WA5Xwm3NiFC55g
	 OOgp6b9pgPjPCllc+XeNDZZNjx3ReInp24/Jeq5fvWqNVnzhEe1dYmdin+HRXsXAtopOp
	 O28PPtCeHRfs/HO74/qhhSRF9icpFCypJugB9M3ntmog2frsUN3+WA43pR+S8NB46fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736434;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BInk29Bm1/cypDatkmjM06J6zHFKks4ZHicr6kuplkk=;
	b=duf86ujYe9Rc4begxs3wVCfqebTVMBMvD+4CwkjrqByxpmW2/cv6Yh6Snqk51yLzV/g/
	 mKafPp1DHz8HQM+IKzX09uP82w7ZpBd4diecOoeBd0iBH9nsHhDttnrg2GeumRNK+NrDD
	 +ec9CPc6QmX8bHpPIbY0UjYVXqwqtxPsbb3/sG6xr8MJMtupdCzPbevilla5tEysBZiGA
	 XCd2sTKhmDxqBnMtGkxTfNZKuuu6EtWhP4A6+fx/g7sNo1FNVoB27c9QcqkGeWjJjOnoO
	 uH60dtWr2Ut/igepJNtQZwZQXVQMbSqNu1auQpBJwDGSd+NNbfomTq78TlomUqJL5Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pFZ73T42;
	arc=none smtp.remote-ip=95.215.58.204
Received: from mta1.migadu.com (out-204.mta1.migadu.com [95.215.58.204])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72964606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72964606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pFZ73T42
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n+BgTz1WSrNDtfZp9vDHIcJ1FE9xUZfuX05vlcrRddY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793736431; v=1; x=1794341231;
 b=pFZ73T42M4auu8W6h7xoZrBMWq67GHLfsE7dsgR6MqNKcbAJHqUnEJqFDr2G8IUMH4PVtoyZ
 sSl533VN+iSlGTdxri35Che5e9AroQCT3Nu3Hink1HNxcYZHkmzjhtS6kV/+mu/JhK49aCrXlQx
 d77cKYjTEpq/qSulMqvOcadc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9a5d9e9a223c21e1;
	Tue, 03 Nov 2026 20:07:11 +0000
X-Mizu-Trace-ID: 9a5d9e9a223c21e1
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
Subject: [PATCH v2 2/5] ASoC: amd: acp: add ACP70 SoundWire machine entry for ASUS RC74XA
Date: Tue,  3 Nov 2026 12:05:36 -0800
Message-ID: <20261103200540.3863272-3-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103200540.3863272-1-matthew.schwartz@linux.dev>
References: <20261103200540.3863272-1-matthew.schwartz@linux.dev>
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

The ROG Xbox Ally X20 (RC74XA) has two TAS2783 amps on link 0 with
unique IDs 0x8 and 0xB and an RT721 on link 1. No table entry describes
that layout, so machine selection falls through to acp70_rt721_only and
routes speaker playback to the unused RT721 amp endpoint.

Add a two-link entry ahead of acp70_rt721_only with the RT721 limited
to its jack and DMIC endpoints.

Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

