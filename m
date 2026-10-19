Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436358;
	b=NLIrgS2F9csYq0nMPnImK7B9bvjaty551lOb4oBfqBSklEbhXMJGJ4zsK2isQD8W3FNE
	 SdSh3I1zWSAWljSnfMZ1GOe9yFKsibbyEiQ7cjRBeT67jWwhZ2ZRtgbvFR2z5uYe1spA3
	 Q17EC0D66wAImdXeA4WwVlY5syqExyvSl3Lqug0n6R6xd9JR5qH/JmdWui/PXNTTW002Z
	 r+0W5QP026cSoSbW5wf9Nif0qBX0qK5VHbMD4Ks0RrTcNQalsQAFNrSsgBuDm9yO4MLoM
	 OliM1wIN9o+MPmt7DYN8qda/pw0N9Qh2EccQR9ihzykdDp49RiMz36FryG2NuiZ70TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436358;
	h=DMARC-Filter:X-Pm-Submission-Id:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/LL+etfeO7ZopKYgEHJoqIogqNww18O7Xdbf95eBubw=;
	b=F6r1c3RIjsYiDyQqd0hdkmPk6E/Z9kf8DXHm+5iZlGomHM5EWuL59+t9jzKg7kfiqNm/
	 LzjM7O32qPYWCzg6+gURhqAKyjb+73f7LirIVehO6fgAmsY/Rl9lBrkBovMstvlrqOV3w
	 2Us25C0+qyv11lBJy0KdsrnRgUJaX9UPiD+na+MMK1OcnZ6kuT6+Ro+NP+tozGpot6PTO
	 d5q1KYM5ReVahomceENVCabsCtk8GsUfFXln/ORBnfyFAP0MllolgeXx8KKRCvttVE/07
	 BzrINJ4PZ75984XJqUGxhmQN/1DDMHH+s6H+mlnhsp8Gj4b1M9EbjDTA2DaAUY+/W4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phorex.org;
	spf=pass smtp.mailfrom=phorex.org;
	arc=none smtp.remote-ip=109.224.244.106
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C15606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C15606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phorex.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phorex.org
X-Pm-Submission-Id: 4j7lFp5vPPz1DDs3
From: Luke Macken <luke@phorex.org>
To: dianders@chromium.org,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Luke Macken <luke@phorex.org>
Subject: [PATCH v2] drm/panel-edp: Add BOE NE140WUM-N41 (0x0d9b) panel
Date: Mon, 19 Oct 2026 12:58:57 -0600
Message-ID: <20261019185857.2381360-1-luke@phorex.org>
X-Mailer: git-send-email 2.43.0
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

The Lenovo ThinkPad T14s Gen 7 (Snapdragon X2 Elite) uses this 14"
1920x1200 panel. Without an entry panel-edp warns at every boot ("Unknown
panel BOE 0x0d9b, using conservative timings").

The panel's timing requirements are not published, so use the same delays
as the other BOE NE140WUM entries (delay_200_500_e80). With them the panel
trains and lights up reliably on this machine.

edid-decode (hex):

00 ff ff ff ff ff ff 00 09 e5 9b 0d 00 00 00 00
0c 23 01 04 a5 1e 13 78 03 ce 51 9a 5f 58 8d 26
16 4f 53 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 33 3f 80 dc 70 b0 3c 40 30 20
36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4c
4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
4f 45 20 4e 4a 0a 20 20 20 20 20 20 00 00 00 fc
00 4e 45 31 34 30 57 55 4d 2d 4e 34 31 0a 01 ca

70 20 79 02 00 81 00 15 74 1a 00 00 03 01 28 3c
00 00 60 42 60 42 3c 00 00 00 00 8d 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 cc 90

Assisted-by: LLM
Signed-off-by: Luke Macken <luke@phorex.org>
---
Changes in v2:
- Include the panel's EDID in the commit message (Doug Anderson)

 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 5d7d696b7..6d6bce01f 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2078,6 +2078,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d45, &delay_200_500_e80, "NV116WHM-N4B"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80, "NE140WUM-N6S"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d98, &delay_200_500_e50_po2e200_d100, "NV140FHM-N5B"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d9b, &delay_200_500_e80, "NE140WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0db3, &delay_200_500_e80, "NV153WUM-N42"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ddf, &delay_200_500_e80, "NV116WHM-T01"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x386e, &delay_200_500_e80, "NV116WH2-M30"),
-- 
2.43.0

