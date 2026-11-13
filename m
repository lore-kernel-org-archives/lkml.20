Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569549;
	b=vyJXEf6Nd1ge+PcAc6NwGcEy3rZrBEcNZEfC0TdJEtB8+dWgos/pKxVjMPGw1KX5kZOI
	 /IZ55faKNKt6WNSqdYszOYEamNfQfmQTEDlzZicH2bZ+2hzGJ2J5djrWGOQYlHCfITk4G
	 RsBmrGHTANpEjn6vLD4wo4jEkdlhHzWLPZatk5jDld7Q3FkSqa1ACusvfgUlbm7Umu+cx
	 co/ALYFDcPib+HuCMAGCwdUc89htE1DDVj/Onyu8EExU2QibayWe25aKmKdwfeTAISTQG
	 mj2ZYRoDxiybUg3Sil4Cta/OexmQGd/+Rma06uMmdvPitsqqDGCKAMcNU0/ji0rzAjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569549;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Zj425onEfXkYNnEDdTJyaTohUJ1Kq3BFHKaJvxydo4c=;
	b=yuP/mraZZ0PPJmQMyL59pNs7BzUAno6rhbyz0JTgT4QW7KmdiAAb8kMMQ06YGti/9lOg
	 XIN96w+7ThbT6F5+7uWjZlV9GwFIX7FjxfZbbTxAJgQFgCX8D/9xIjiuXD5oBpeN0QYKC
	 XL40QaDmjrivCfJBtAc5h/0B5mmZb7nJLzi6wbnFBpfwB9nu2iCYveaIqErBqKcTWZwuT
	 LCGq+U3dYmsgwa5sfAcmajb0Q9UBv3wWtXDj66wGRwJAt0qn99nXxHvKYFFihWQsKh+EI
	 Tic13S79S5XNlatcD3t/dYhSm+Xw6KqExIXAovZgNUExfs2FgUEoCiFBU4eVwi3/gGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VtBM5TYf;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED3B606A327;
	Fri, 13 Nov 2026 11:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EED3B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VtBM5TYf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794569549; x=1826105549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NAXBVO6TgFQiHMZBKPpzGh3EYIwOIAGBUVtjXiZKU6o=;
  b=VtBM5TYfQT4ZW3tkiXw76rErUP/Z06XoXkjnc1tMQg9nE4kcGrZxwYRp
   SPp06p+Y6vU/5o1ktA+lI6mSIidVtnyIVyMJsOZLpiW+oyKAqbRXDWuw5
   lRxg578Sz4bdKZw2Y+PApUJDjpT+cNUxoks2EOBnuh64t60tbczv4LFeA
   WOL5LFjCLsuBjswIAXjC2dq3Y8iyKgGnoNm5zRI4np+FwzkAm1261zth7
   HydoRyzAUbtXswSOge7YffNgdMAnKAhhuv39aKT+bL4TjUevy3x7TDeiw
   WMdPDRKJ0BHm1IVe8q8HrzBG7wXX7+y5NaVL8qbKKWWhUUeyo8gUFnava
   Q==;
X-CSE-ConnectionGUID: YcS2wFyARmOBlCBGM/JyXg==
X-CSE-MsgGUID: 9jgASgp6Q8yPmHSPfaoNIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3246940"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3246940"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:31:37 -0800
X-CSE-ConnectionGUID: K81rOko5S9eC5OxpCCw68g==
X-CSE-MsgGUID: Cvg6NY9fRsGE9a/8xaM8EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9235604"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 03:31:35 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 07/11] ASoC: Intel: avs: Streamline topology parser names
Date: Fri, 13 Nov 2026 12:38:36 +0100
Message-Id: <20261113113840.3067489-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113113840.3067489-1-cezary.rojewski@intel.com>
References: <20261113113840.3067489-1-cezary.rojewski@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All other parsers are named with avs_ prefix,
there is no reason for exceptions.

Co-developed-by: Amadeusz Sławiński <amade@asmblr.net>
Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/topology.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index dc0efa1b16ea..273b104c19b7 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -356,8 +356,8 @@ AVS_DEFINE_PTR_PARSER(binding, struct avs_tplg_binding, bindings);
 AVS_DEFINE_PTR_PARSER(init_config, struct avs_tplg_init_config, init_configs);
 AVS_DEFINE_PTR_PARSER(nhlt_config, struct avs_tplg_nhlt_config, nhlt_configs);
 
-static int
-parse_audio_format_bitfield(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
+static int avs_parse_audio_format_bitfield(struct snd_soc_component *comp,
+					   void *elem, void *object, u32 offset)
 {
 	struct snd_soc_tplg_vendor_value_elem *velem = elem;
 	struct avs_audio_format *audio_format = object;
@@ -399,8 +399,8 @@ static int avs_ssp_sprint(char *buf, size_t size, const char *fmt, int port, int
 	return snprintf(buf, size, "%s", fmt);
 }
 
-static int parse_link_formatted_string(struct snd_soc_component *comp, void *elem,
-				       void *object, u32 offset)
+static int avs_parse_link_formatted_string(struct snd_soc_component *comp,
+					   void *elem, void *object, u32 offset)
 {
 	struct snd_soc_tplg_vendor_string_elem *tuple = elem;
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
@@ -578,19 +578,19 @@ static const struct avs_tplg_token_parser audio_format_parsers[] = {
 		.token = AVS_TKN_AFMT_NUM_CHANNELS_U32,
 		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
 		.offset = AVS_TKN_AFMT_NUM_CHANNELS_U32,
-		.parse = parse_audio_format_bitfield,
+		.parse = avs_parse_audio_format_bitfield,
 	},
 	{
 		.token = AVS_TKN_AFMT_VALID_BIT_DEPTH_U32,
 		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
 		.offset = AVS_TKN_AFMT_VALID_BIT_DEPTH_U32,
-		.parse = parse_audio_format_bitfield,
+		.parse = avs_parse_audio_format_bitfield,
 	},
 	{
 		.token = AVS_TKN_AFMT_SAMPLE_TYPE_U32,
 		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
 		.offset = AVS_TKN_AFMT_SAMPLE_TYPE_U32,
-		.parse = parse_audio_format_bitfield,
+		.parse = avs_parse_audio_format_bitfield,
 	},
 };
 
@@ -1096,7 +1096,7 @@ static const struct avs_tplg_token_parser binding_parsers[] = {
 		.token = AVS_TKN_BINDING_TARGET_TPLG_NAME_STRING,
 		.type = SND_SOC_TPLG_TUPLE_TYPE_STRING,
 		.offset = offsetof(struct avs_tplg_binding, target_tplg_name),
-		.parse = parse_link_formatted_string,
+		.parse = avs_parse_link_formatted_string,
 	},
 	{
 		.token = AVS_TKN_BINDING_TARGET_PATH_TMPL_ID_U32,
@@ -1822,7 +1822,7 @@ static int avs_route_load(struct snd_soc_component *comp, int index,
 	int ssp_port, tdm_slot;
 	char *buf;
 
-	/* See parse_link_formatted_string() for dynamic naming when(s). */
+	/* See avs_parse_link_formatted_string() for dynamic naming when(s). */
 	if (!avs_mach_singular_ssp(mach))
 		return 0;
 	ssp_port = avs_mach_ssp_port(mach);
@@ -1880,7 +1880,7 @@ static int avs_widget_load(struct snd_soc_component *comp, int index,
 		goto static_name;
 	ssp_port = avs_mach_ssp_port(mach);
 
-	/* See parse_link_formatted_string() for dynamic naming when(s). */
+	/* See avs_parse_link_formatted_string() for dynamic naming when(s). */
 	if (avs_mach_singular_tdm(mach, ssp_port)) {
 		/* size is based on possible %d -> SSP:TDM, where SSP and TDM < 16 + '\0' */
 		size_t size = strlen(dw->name) + 3;
@@ -1966,7 +1966,7 @@ static const struct avs_tplg_token_parser manifest_parsers[] = {
 		.token = AVS_TKN_MANIFEST_NAME_STRING,
 		.type = SND_SOC_TPLG_TUPLE_TYPE_STRING,
 		.offset = offsetof(struct avs_tplg, name),
-		.parse = parse_link_formatted_string,
+		.parse = avs_parse_link_formatted_string,
 	},
 	{
 		.token = AVS_TKN_MANIFEST_VERSION_U32,
-- 
2.34.1

