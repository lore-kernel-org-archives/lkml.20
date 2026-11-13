Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569549;
	b=iFouOaUkZ2rqoZLz3SspgxpHKcPzr6MMt6Q7Rx3SIwaJ7rV2ZG8jjsB2QnIDy7bi4A1d
	 p8mtSHZzLzvdkyHlT/zBRoE/wXfW24l5pufdNAFnH9lubEQrDIeCFcTNrdxT0IJQSkuly
	 X6al5BJmb9CoSXuajQL/C6VnrXE4gNZPS6kg8SNh3BMhJiM8VGFcPREfPCp1sAwYoivfO
	 Ii21G++e+5xa75HM4y1KhPqyR3YVL4w3Jy2Sweif9tNOc+AfBjQMcAV6pdX4qephRIQTB
	 KG5kQG2Y3MOVVyfu71QwDuM3x5RhwvoIb0KU2MxBP2KcRlt27Yo6RJV+rMmm0OvOglw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569549;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r1k8sF6/jOxkzBEm6hNh+i4K1WYBDKrnoiPdkqokHs8=;
	b=xIIe6DyouRcFzKexIJnKzPi9onKRGfj7h5hPWM/1Y3SF1R/xSPe9WEmEUGZo/tXAE1FF
	 RHtraJ5hKGTEIHMhUbj1dhb6aPaQEUDrmzjDBQjuHDLUlKl/OBNxyTMb2MoaIRJX64f+p
	 XELaitQDilwAgvq3SwAwUJDXLpsOuInWWSkgxElbSOD5p29v6hEvRhUUZvoAdQhxeBFsm
	 fn54Qm9ik9qZmeyGxQyzJNrqm8eOul5jbO60NsUyq5vxuMQd7ddc1C7IbkWdGoHH/xQxB
	 Jr5jH6BJU90/0GuZdO4Vv+cutEVQh0XWlY4U1oJnbk2iU2vN7ADCYtoRvXHAdK6A20w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h3d4WWJJ;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A4A606A8A9;
	Fri, 13 Nov 2026 11:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A4A606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h3d4WWJJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794569549; x=1826105549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OwTG1kBkuZC8EB63OMeSZATqjMegJYBVTddHvPqQgOs=;
  b=h3d4WWJJLOT9uvP0B+M9EuTH57v3OTk6uh37JS224jSjjE6c8PkyWz/Z
   nVNsGtKIFwvCVQ3IucbX3TrJaTQw4NvH8Wzg1EDd+2wC++okNAXGXCr5w
   li/KIYnS1asz60HiI04NoaUD/hy6uaLYrYeiVByXAKUIn4mT2+Y2Vs4gv
   deNjO2lz8xurNzCIqQvTKikPYlQ79vKet4Kk4z0hpdCx/g5QhDiCRsC9x
   7+rgsTKfwdMK672R0JsUCfXRcAzZErLiwEuN5OQJlkN3PVkSvV41pXVj2
   sLCvePH8tLIiexLVu8XeQzb9rIFI5XibpfxNW2uURMqhvBktaID+wgz1J
   A==;
X-CSE-ConnectionGUID: T1craNXCTRqUk8RbJRlDeg==
X-CSE-MsgGUID: OZKLLGEuRqyaMbXojYq+8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3246924"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3246924"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:31:32 -0800
X-CSE-ConnectionGUID: TfXC5xyVSr2kmvIuJzDqFg==
X-CSE-MsgGUID: 96ZqcDskRQWPMTdm48eHgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9235592"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 03:31:30 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 05/11] ASoC: Intel: avs: Enrich missing-format and token-parsing messages
Date: Fri, 13 Nov 2026 12:38:34 +0100
Message-Id: <20261113113840.3067489-6-cezary.rojewski@intel.com>
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
Content-Transfer-Encoding: 8bit

The existing log does not mention which format is actually missing.
Update it and lower its level as missing format when scanning for
available configurations is not a warning.

For similar reason dump the token for which the topology parsing failed.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c     | 4 +++-
 sound/soc/intel/avs/topology.c | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index e8bbc9058fc7..e9595eefc416 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -321,7 +321,9 @@ avs_nhlt_config_or_default(struct avs_dev *adev, struct avs_tplg_module *t)
 				       fmt->num_channels, fmt->sampling_freq, fmt->valid_bit_depth,
 				       fmt->bit_depth);
 	if (!fmtcfg) {
-		dev_warn(adev->dev, "Endpoint format configuration not found.\n");
+		dev_dbg(adev->dev, "%s endpoint format configuration %d/%d/%d/%d not found\n",
+			snd_pcm_direction_name(dir), fmt->num_channels,
+			fmt->valid_bit_depth, fmt->bit_depth, fmt->sampling_freq);
 		return ERR_PTR(-ENOENT);
 	}
 
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 71aaa25f083e..dc0efa1b16ea 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -268,8 +268,11 @@ static int avs_parse_word_tokens(struct snd_soc_component *comp, void *object,
 				continue;
 
 			ret = parsers[j].parse(comp, tuple, object, parsers[j].offset);
-			if (ret)
+			if (ret) {
+				dev_err(comp->dev, "parsing token %d failed: %d\n",
+					parsers[j].token, ret);
 				return ret;
+			}
 		}
 	}
 
-- 
2.34.1

