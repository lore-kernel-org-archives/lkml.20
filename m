Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD61730D41C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208343; cv=none; b=Jk0MXYE0jlbJgWBXKz5y5ehTI29SnzbMe0TeuTB6KO3Ulh0zaisqAk4a5QNdwNByiEBEv7UcNWgMMgLGgNPoxBvqb1RZk9PsWIqIfTxyFrOsDOs7nH+7MVTavWKs0iwD1SWy1Y0D5AEvv8n7LRyG13pUReJAHp9n/4vukGY6T9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208343; c=relaxed/simple;
	bh=Xs3mV08zQZLRaGdOl40BpvvIbRwRw+nvV1gUGJy+5Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C2SwjjfV52MFtFRHJzSSoxo891QQ79G3xarOfzYgCJFquP3q9r+mMBqE0q+PW2JsEqM5llducJY64B/NoLOAQhuboFHOf85pHGmzSICkD5rtgaXO7cPTcdRoNiae3WDYK0HtwP9eM7+4Wwn6LlJEWVb2B7FvsZolpHgZmI4qz8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3MhT+rP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3MhT+rP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E791F000E9;
	Mon, 31 Aug 2026 20:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788208341;
	bh=TfsbK8Ir4/7tq3ftG7neE7r42oMFteiw1MDmo/yEN4E=;
	h=From:To:Cc:Subject:Date;
	b=V3MhT+rP1VvBCtwaP05w6s39SszvEXB9h2Ae6Jjbxsj49rY8Gi0G6SBofXIBGDpxD
	 eckgFkpcswYofoC1SU64G99pJVFJP+a5TsBW4VU1PjYJzoHk+LqjeI1FJH7V1jjdGb
	 4czsRppm4jjXVPALrsiiIyLbPkLVe7hfS1Hh6hkS6bnQspZ/QdPL9j8p9A3lexJbS4
	 UurK0iLP2i2NBMq+/DCmwpwKza9vs2WrARanQNvV5c57eo69yKWGW8fNSJnDaYMc6x
	 qyZdjpP002LCeD0wOnyx4MtbHVBzF04wdVOVdRiQAhqlOFze0MkwvnWaj+A6UiM48b
	 tvJnTWFzxPpsw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/bridge: sii902x: Read "sil,i2s-data-lanes" as u32
Date: Mon, 31 Aug 2026 15:31:36 -0500
Message-ID: <20260831203137.1331960-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "sil,i2s-data-lanes" binding and in-tree DTS files use normal
uint32 cells. Reading the array as u8 only works because the values are
small, but it does not match the documented DT element size.

Use the u32 array helper so the driver follows the binding. Changing to
u32 increases a potential OOB access range due to using unchecked
values, so add a check on the read values.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - Drop the WARN_ON.
 - Combine checking the values with any other error parsing the DT
   property. The exact DT error isn't important.

v2:
 - Add bounds check for property values as reported by sashiko
---
 drivers/gpu/drm/bridge/sii902x.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 9aac44ed5b67..b70818eab34d 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -862,7 +862,7 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 		.max_i2s_channels = 0,
 		.no_capture_mute = 1,
 	};
-	u8 lanes[4];
+	u32 lanes[4];
 	int num_lanes, i;
 
 	if (!of_property_present(dev->of_node, "#sound-dai-cells")) {
@@ -871,10 +871,10 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 		return 0;
 	}
 
-	num_lanes = of_property_read_variable_u8_array(dev->of_node,
-						       "sil,i2s-data-lanes",
-						       lanes, 1,
-						       ARRAY_SIZE(lanes));
+	num_lanes = of_property_read_variable_u32_array(dev->of_node,
+							"sil,i2s-data-lanes",
+							lanes, 1,
+							ARRAY_SIZE(lanes));
 
 	if (num_lanes == -EINVAL) {
 		dev_dbg(dev,
@@ -882,7 +882,15 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 			__func__);
 		num_lanes = 1;
 		lanes[0] = 0;
-	} else if (num_lanes < 0) {
+	} else {
+		for (i = 0; i < num_lanes; i++) {
+			if (lanes[i] >= ARRAY_SIZE(i2s_lane_id)) {
+				num_lanes = -EINVAL;
+				break;
+			}
+		}
+	}
+	if (num_lanes < 0) {
 		dev_err(dev,
 			"%s: Error getting \"sil,i2s-data-lanes\": %d\n",
 			__func__, num_lanes);
-- 
2.53.0

