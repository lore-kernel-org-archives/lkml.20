Received: from mta0.migadu.com (out-244.mta0.migadu.com [91.218.175.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EDF529417
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569550; cv=none; b=oZKIG3S1SBAfHiWZWMr+eH7bG5VtkKHwyKEvTodJrX0ux0lwjEbbPeeBcwvxlmdS5eqBJJBMZZt9q9Z0dGFYnBkbDFuDB2+W9mFG5spL28d5puTwUc8afMizn0h0aD5c5aP82zrm9ogkxc7zUz6q7K5UIpInpYsEpqs2gOj9Izc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569550; c=relaxed/simple;
	bh=P9XV2XO4MmtDvdZItN3sTDDtWP1gBvv2w2g7tC4qrkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXcKyC4jFe+lvRiHyDPdo9ooWqI7bfVPcGuZrux0THxfJEWCnYLx0OwZ71jdfx7RonnHZM5YZ9gbyBJI1xp37ArggqQQjQnpdaDz7/PUfjJ9xSlOnutKs8+5LqrQDTLWciebwvH/46BgayQF2M3nBYsEnCX14Atrd+9YNqLX/qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RAEz5zoE; arc=none smtp.client-ip=91.218.175.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RAEz5zoE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P9XV2XO4MmtDvdZItN3sTDDtWP1gBvv2w2g7tC4qrkE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789569547; v=1; x=1790174347;
 b=RAEz5zoE+LLErtU0V3xfw1QelNAuW6Hu0MdmCos0GsqA59aJnsQwz0yJGuu3ug+MTWalElmz
 tScfhDIPTE4MqPk0zTYwgmofjsCUwVyWhk/6/vKsMv2j32bX9Feaw8//hQMObOmlVrQ0BX88XVA
 cgJEeyrhP485fxa12pNbUc9Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 97704f99edd96b49;
	Wed, 16 Sep 2026 14:39:06 +0000
X-Mizu-Trace-ID: 97704f99edd96b49
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Hans de Goede" <hansg@kernel.org>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Luke Jones" <luke@ljones.dev>,
	"Hugo Baigue" <hugobaigue2004@gmail.com>,
	"Ponali" <ponali2k@gmail.com>,
	=?UTF-8?q?Manuel=20A=2E=20R=2E=20de=20Or=C3=BAe=20R=C3=ADos?= <deor001@gmail.com>,
	"Salvatore Bonaccorso" <carnil@debian.org>,
	"Thorsten Leemhuis" <regressions@leemhuis.info>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v1 3/4] platform/x86: asus-wmi: use backlight_is_blank() for screenpad power
Date: Wed, 16 Sep 2026 14:38:27 +0000
Message-ID: <20260916143838.170950-4-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916143838.170950-1-denis.benato@linux.dev>
References: <20260916143838.170950-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The screenpad backlight sets BL_CORE_SUSPENDRESUME, so the backlight
core calls update_status() on suspend, resume and fb blanking with
BL_CORE_SUSPENDED or BL_CORE_FBBLANK set in bd->props.state while
bd->props.power keeps its value: the switch on bd->props.power alone
ignored those flags, repowering the panel at suspend entry instead of
turning it off, and ignoring fb blank requests.

Replace the switch with backlight_is_blank(), which accounts for both
bd->props.power and bd->props.state: the panel is powered off whenever
the backlight is blank and powered on with backlight_get_brightness()
otherwise. Writing a power state other than BACKLIGHT_POWER_ON or
BACKLIGHT_POWER_OFF to bl_power now blanks the panel following the
core convention instead of warning and failing with -EINVAL.

The visible change is that the panel now actually powers off on
suspend and fb blank, and is restored on unblank and resume.

Suggested-by: Hugo Baigue <hugobaigue2004@gmail.com>
Closes: https://lore.kernel.org/all/CAO84+xJ9aW3pj3x8e9b5biWtnNd4EyH7A4Uy7aqBR4qZMDcVvg@mail.gmail.com/
Assisted-by: zcode:glm-5.3-flash
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-wmi.c | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index ded1aa356cf3..e6f3a5c0dba9 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4536,32 +4536,18 @@ static int read_screenpad_brightness(struct backlight_device *bd)
 
 static int update_screenpad_bl_status(struct backlight_device *bd)
 {
-	u32 ctrl_param = bd->props.brightness;
-	int err = 0;
-
-	switch (bd->props.power) {
-	case BACKLIGHT_POWER_ON:
-		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
-		if (err < 0)
-			return err;
-
-		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
-		if (err < 0)
-			return err;
-		break;
+	int err;
 
-	case BACKLIGHT_POWER_OFF:
-		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
-		if (err < 0)
-			return err;
-		break;
+	if (backlight_is_blank(bd))
+		return asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER,
+					     0, NULL);
 
-	default:
-		pr_warn("Invalid screenpad backlight power state: %d\n", bd->props.power);
-		return -EINVAL;
-	}
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
+	if (err < 0)
+		return err;
 
-	return err;
+	return asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT,
+				     backlight_get_brightness(bd), NULL);
 }
 
 static const struct backlight_ops asus_screenpad_bl_ops = {
-- 
2.47.3

