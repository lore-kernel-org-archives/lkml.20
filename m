Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736436;
	b=1BxN//GspK6Io0gD4oogReFZxgSGSh0HFL6FeGT2VfcDJR5l49dqTt3fRUj0RygQ3J/w
	 8rHwH1IPTwscKW+19L5V09iPzid30JjDqyTcFgCwFhwwhkW5igdqcoeqmjbz9sKRN2ljZ
	 LNWLU9jJ3ltiWQNG9UzTSOKrR5LxF8fAgat6HMIRFu6OGTM+uF0q51tk2fRqThZlTqLpn
	 bx1NZb7/9voAdYdWgBZ5Cplrrkf73JERtco9+9Rm7PNii3vBzcCY9VCm+Y9uKX+Qkm9fc
	 82Teqk/SoH7m+HnSrlBric8Tszj3JwbT8rY9eVlCzVEmcxYg2iGi3B7gtSpFZiZ713g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736436;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P3ejjsP5CUTkIgbJxIswC08Q7vBzgePxT/LNcIoo2w0=;
	b=qFGi5nr6Kg7lFP/qyhihQZNPFOT0PFdgQlunmN2NUnSoOWAUoXGbmQ2neZ+OeVwspWBW
	 NCCON6lEHorQ20lHulG2nanYVHhjW5imLQkGO3H5BI+P9Xe/kMnj+xXRldcap4vuw2KDO
	 /cW+bcwPNS4V/72UffbcUO8PzogwPtSlbz1veyRm8ND0xn8i9H2omfskMpojjhOSAA6n1
	 e+lN2JB2JijvJJ42DISra+hFdQujcQ4wU1a1S29VffryYdgZAXjNyAxEVOgMJcxMRQ97N
	 FUfXi4sbraE4kIAJ06PPP4O+h1JQ6ZKDewcldFNd7X8W+w30vTSdYp/Bd2+/kPtAH5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eAvCtXOP;
	arc=none smtp.remote-ip=91.218.175.138
Received: from mta0.migadu.com (out-138.mta0.migadu.com [91.218.175.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3D2606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD3D2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eAvCtXOP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GpkFyOepvSaTmprHNZGRwrHOetWFypuIqLJ++aQFUwA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793736428; v=1; x=1794341228;
 b=eAvCtXOPONmdcmRovqwMoy4IjWVj8ku8HYc7kDBDfXT0A8rUFUeVZ3BPXt0/lvqUkSSMlrFZ
 GowwEYMkPmuwob80uZjtYxWMxM3Fpyh0W1eotqyG0OfmUBWq0XA+jfF+lGCxEwMNQy6aPE/7CqV
 h28wMSyYkqUHQlGRliDLybB4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d9b7aaec3df5e4b4;
	Tue, 03 Nov 2026 20:07:08 +0000
X-Mizu-Trace-ID: d9b7aaec3df5e4b4
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
Subject: [PATCH v2 1/5] ASoC: amd: acp-config: force SoundWire probe on ASUS RC74XA
Date: Tue,  3 Nov 2026 12:05:35 -0800
Message-ID: <20261103200540.3863272-2-matthew.schwartz@linux.dev>
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

The ROG Xbox Ally X20 (RC74XA) BIOS reports acp-audio-config-flag 0x10
(FLAG_AMD_LEGACY_ONLY_DMIC) in the ACP _DSD. snd_pci_ps then rejects
the device, so the SoundWire links carrying the two TAS2783 amps and
the RT721 are never scanned.

Add the board to the ACP70 flag override table so snd_pci_ps probes.

Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 2fb9789cac0ac..858bb51fa0383 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -105,6 +105,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 14S DS14265"),
 		},
 	},
+	{
+		/* ASUS ROG Xbox Ally X20 (Strix Point, ACP 7.0) */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_BOARD_NAME, "RC74XA"),
+		},
+	},
 	{}
 };
 
-- 
2.56.0

