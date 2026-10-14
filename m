Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396724A5EC0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021886; cv=none; b=kE0UajjMINK5cRIZr9C/okrZpRzFKwACyz59n8kmoGGwkHjDRfiWItatSfP60b6j3q14X0RxEsWX7pzILBu5xp/w6n14ZBFJkewq4hnh5vTZtfKZqeucqt44FQ6Ux9mXxE/uyXh5GBWvpUwi+z3pgkVViqtcDRl04Tr9Xkt1BpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021886; c=relaxed/simple;
	bh=uxEKoIf9pD9eLqMra8RGSnV8Sa/zzEwMkp50N77CX9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cVLvd3KYGt6Yr4Znn2RDZNB2T33T6SZD45SoqZkrISWe5P+xlA94mrUzksv45yxTt97MFeMwYL1qJCcsAWeL2M+k+rdGxdbpFQdS+07ZtsK0/I+9AtNgwnD7E8txyt2MsjW2dfLliJoxlhqA/5ZpZrLfJnhD0AZfwAyGQrzfTWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phorex.org; spf=pass smtp.mailfrom=phorex.org; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phorex.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phorex.org
X-Pm-Submission-Id: 4j4nz45YSKz1DF4p
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
Subject: [PATCH] drm/panel-edp: Add BOE NE140WUM-N41 (0x0d9b) panel
Date: Wed, 14 Oct 2026 17:50:35 -0600
Message-ID: <20261014235035.1731419-1-luke@phorex.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo ThinkPad T14s Gen 7 (Snapdragon X2 Elite) uses this 14"
1920x1200 panel. Without an entry panel-edp warns at every boot ("Unknown
panel BOE 0x0d9b, using conservative timings").

The panel's timing requirements are not published, so use the same delays
as the other BOE NE140WUM entries (delay_200_500_e80). With them the panel
trains and lights up reliably on this machine.

Assisted-by: LLM
Signed-off-by: Luke Macken <luke@phorex.org>
---
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

