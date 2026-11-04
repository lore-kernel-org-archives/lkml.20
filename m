Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833182;
	b=JPGGkN0h7yDB3xiLRCZjarQukkQfFaN33OnShid0/+sKDlhEXmraPu3BRF8L9VBugsQj
	 2CwA5HrwP7zc3yNVsVGJX58ySAvl6PbC5+I09rWzThZ9fx0TU8Q6K37SjwJgp4/XLbUR0
	 QsQUdTLBbZ1+ELItSIC1zZRDqyvVfVZSZ068weOuvG0I++wrgGAlG4F6CuawuE2wRD42F
	 ZgQtaPCWiJP6AFy8QX9pEWWzFnu9lqAc0aeLpB7pOFeCTuUHMgi2pvHNTKRZdA4lvjW66
	 wZOWy4Pvt9/toYv0NyOv5Bj6jAh9I83UYJt4qkTTL4qLFEPpgtJuKSN7EVLm4kSZoJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833182;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BInk29Bm1/cypDatkmjM06J6zHFKks4ZHicr6kuplkk=;
	b=MVAyDMg8k9L50u3b8jP95uAJN6i4uACJvOZUw1Ll9YlaDUli5HP+6UIDty3gpOdf2Ql1
	 MKPVHD/E+2Lq1cZSVyC3txANZEyU+IPuQPkSMdcyxDrVucvcIqCDxGVXkTPyD16AuYZDh
	 78Hwcpq451U+CkS7xj+C+w1LOT1Hnlvtcd+MQDrxE0Kbbx0YXylMMJTxAH0yKzYmF3wmw
	 NCjDR5Lp1T8kzk38rxYT3vi71wugMCrucU14e0Apnm8aaB6vEY9yfKheQsnAsHWUqBSyw
	 ijbKsggqeuT2kGSiTtz1cFUx9EA8WaogcD7a/Ox386clecjiE/OYIbjUcyx3X43WPxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R+n9V49P;
	arc=none smtp.remote-ip=95.215.58.84
Received: from mta1.migadu.com (out-84.mta1.migadu.com [95.215.58.84])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989D4606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 989D4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R+n9V49P
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n+BgTz1WSrNDtfZp9vDHIcJ1FE9xUZfuX05vlcrRddY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793833179; v=1; x=1794437979;
 b=R+n9V49POl6a5fezVEIzUqcpCRxpGg58+THiqnhLlG0et4HOsmDTfA+84LCsqC2hnf1le8X6
 HIMlhG+DeRwSzUTsCD0J6ME3QAHrKzQ446yTIrASWnoKQPiyL1+FOcCU2M9bPyl5z3BqTuM0OWm
 kPqLJOKzpahmDOSjexcw3LvM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 93d0879ff005aedc;
	Wed, 04 Nov 2026 22:59:39 +0000
X-Mizu-Trace-ID: 93d0879ff005aedc
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
Subject: [PATCH v3 2/4] ASoC: amd: acp: add ACP70 SoundWire machine entry for ASUS RC74XA
Date: Wed,  4 Nov 2026 14:58:01 -0800
Message-ID: <20261104225803.1574849-3-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104225803.1574849-1-matthew.schwartz@linux.dev>
References: <20261104225803.1574849-1-matthew.schwartz@linux.dev>
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

