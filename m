Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077CA38F633;
	Tue,  8 Sep 2026 06:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849224; cv=none; b=L0wvD1KoTAhKiz5b5gEy5c4fid4XEt/cDQQ5TywgqH6vjE6VtbNcvRdB2aTwoKzPexwuxsaZRcFOn7jA0IArztsEpSF7LecwXeE/NIlc5eiy1p/3yQJuNuPi+ZxxgsMAMaU1swEO5Nww5HGnN830jFQ/fYotz7BcwfVS82aMcX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849224; c=relaxed/simple;
	bh=MrTOmImD9QpMyNyc0iatSCfJ+NyYKitfcbouRCqbLC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QMMGBArpn17PVWs8nCqHxOelmTllLTNGwG6oyq2NKjHug7mnEGe4RN/PhBW7dDRi7JbSCOzKMN+eoPB8tRfbjQMvpcRTtfIQp2rkQ6Bfu3u4Fg9VZyDQxtS0fDEHbdodBV/LbWUfM2zsJDtRFfyTaZY5xlTq9zGGxZmtw528ibo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kUo0lltS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kUo0lltS"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38B6BC48;
	Tue,  8 Sep 2026 08:32:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788849121;
	bh=MrTOmImD9QpMyNyc0iatSCfJ+NyYKitfcbouRCqbLC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kUo0lltSCf8kuZwENYOKmYYc+F2kYGue976R6E2D0QzKyhEA0HDo8Jg/6Y+Ip2DtE
	 t5yqavOKKBv+LPe4GvQazWB+c5SnrWqWyfV5u0M6wUVpBCoSXUXZ7Wmc5sISWf4fiI
	 OqYeLW/nCa7Y+JpLna+DemjfxACCvy6aqfYGWEBE=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 08 Sep 2026 09:33:06 +0300
Subject: [PATCH v7 02/11] media: rcar-vin: Link VINs on Gen3 to a single
 channel on each CSI-2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-rcar-streams-v7-2-c406a2c2930f@ideasonboard.com>
References: <20260908-rcar-streams-v7-0-c406a2c2930f@ideasonboard.com>
In-Reply-To: <20260908-rcar-streams-v7-0-c406a2c2930f@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2578;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=MrTOmImD9QpMyNyc0iatSCfJ+NyYKitfcbouRCqbLC8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqn6w6dOkGXnzo3s/gcHEvzb32E/bogNGhq8O9t
 ft8wQL1CTCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap+sOgAKCRD6PaqMvJYe
 9fipD/4jQpKefaj/v0DfH/tWm1Pj5IRwUoTu+FAFYFuslgJSJufzdiV3qNrjOtgbGU7bOIk2/Rk
 VfE9vPqBpS0ii7b9bISqy3VVloXt7hB0JBEy7CSFWs+n09zQgsS4bSZa1wgB6M042dLr2VDvckx
 iTRGwsHvy8tUKHL4fU9K6VQ4TspNyeraBKKxR3B7gZbp/ZEW5SBmHOIGwBOOm9jkG65g7HGw4OW
 63XHrZlHo4Z38ctSCgOOVJ2zISkL25nhxCc3SwCcIu3YFyQ/j2+Osx7wP4jEF/k2Z5TYaIzjkK/
 iP0PQvV6CILm+MldoFalvXDUA/jcpJVuyT2qpTgY2HMqgO438BDR/1LjjtmKSejcVq3wH1l3JDU
 wU7n1uB3Z4ufjmFkIUps/PQkW1vX6pqV3mv47JPF3vDxbL1zrUKufoZrnpC/hdyE8bgm1PnYsGN
 JS690iOY/yDkCdtDTQQyuH2/aP/WLeEFcBPVuJlhVEW2cq1oidx7SpOyokL7wyY7le3JMKSwYdR
 fKN9rn46cCD67c48NfPT5PK6MM87Ogw4+dOnASHfYX3j0rPB2C1jFhiZ5nZAOLVLQM77T0TpnYP
 e5Pzngy3FMsiB/R6uRZoCjItB7rAMG0rPCNlkK3gbw2Bo256E4oVKWXaq7/4PlAZuB9nXrfHfem
 2/1isxZJQBwctzg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The stream routing will be fully configurable when we add full streams
support to the rcar pipeline. Thus there is no need for the user to be
able to link VINs to different CSI-2 channels. In fact, allowing e.g.
VIN0 to be connected to CSI-2 channel 3 would be wrong, as the hardware
doesn't allow that.

Change rvin_csi2_create_link() so that it creates media links only
between matching VINs and CSI-2 channels (VIN0 - channel 0, VIN1 -
channel 1, etc.).

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../media/platform/renesas/rcar-vin/rcar-core.c    | 27 ++++++++++++----------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba..2fcea715101c 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -673,23 +673,26 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
 	struct media_entity *source = &group->remotes[route->csi].subdev->entity;
 	struct media_entity *sink = &group->vin[id]->vdev.entity;
 	struct media_pad *sink_pad = &sink->pads[0];
+	struct media_pad *source_pad;
+	unsigned int source_idx;
 	unsigned int channel;
-	int ret;
 
-	for (channel = 0; channel < 4; channel++) {
-		unsigned int source_idx = rvin_group_csi_channel_to_pad(channel);
-		struct media_pad *source_pad = &source->pads[source_idx];
+	/*
+	 * The channels from CSI-2 blocks and the VIN groups have a set of
+	 * hardcoded routing options to choose from. We only support the routing
+	 * where all VINs in a group are connected to the same CSI-2 block,
+	 * and the Nth VIN in the group is connected to the Nth CSI-2 channel.
+	 */
 
-		/* Skip if link already exists. */
-		if (media_entity_find_link(source_pad, sink_pad))
-			continue;
+	channel = id % 4;
+	source_idx = rvin_group_csi_channel_to_pad(channel);
+	source_pad = &source->pads[source_idx];
 
-		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
-		if (ret)
-			return ret;
-	}
+	/* Skip if link already exists. */
+	if (media_entity_find_link(source_pad, sink_pad))
+		return 0;
 
-	return 0;
+	return media_create_pad_link(source, source_idx, sink, 0, 0);
 }
 
 static int rvin_parallel_setup_links(struct rvin_group *group)

-- 
2.43.0

