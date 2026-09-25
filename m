Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF944756CA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341026; cv=none; b=CaHXxO3vJ6C+qg2LtuH5IpSPsTFhXQkyMicUIsSsdh+az9JAuQi+PdGfRLn+mvwLmIFBNwB7m3KNb11EkYEnJLGAyUGKxm6lwI2u0BJZFemisC3MVUIUE3C2eRfVfwjfZ/h5/v8i1osTQHHvCMro5LjUSadyQkRGYF83HfxQK8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341026; c=relaxed/simple;
	bh=Ojbh+rpmbTerjzkOkZrZx99fvYmAHgItmgKQe1gUMkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BjH9rSh/JHPXfl0lp3/BUlTnyCJhQe9WBLmriT5MC49n0cc5kab8ihhmXzKUevJH3xGYV2EiktoscQ3NnhWsKB74PB9nKkxhJYgXvnNX4sF8p8MvOrSliqSQEki7xiagl76htAWDVdqNSxqeHkBA3MuGz0JCmKcUi4saU//tZ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqW4FNCY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqW4FNCY"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48586861639so392137f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790341023; x=1790945823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNUur+VAO5XL0t2pFH3iSgJjQ7R0M85XRXolYcgZ57k=;
        b=dqW4FNCYPpoR2PziurXcOz/D2AhaX3GJBJKppRxjnR1ONAx/tdIx2SGkQplzLGZcnM
         WeyAji3GBNL/1eVWvOQnrKQbtbRRHctP3o/OvbrJvzaefPDWuzVxqmyqJwUkQjwUHe/y
         dmhh3IE5XVVSXPd+XkWYA2tEOxFzMF++MMb9aMB9HeGgGjnMkinkybVm5Gms/p6DmDqt
         ekTQZ6MErK3x2m9sJNwBMKHYnrNVskXTmGwKOFy2+0KqlcRm1achxuA2/vm1eFDoSKvB
         8QSxKcKLMkrPie598BkwFgUoEC366HAEyPSJethwgU8w/6qwUS0rECJ+nIA32U1+WJOj
         1SQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341023; x=1790945823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNUur+VAO5XL0t2pFH3iSgJjQ7R0M85XRXolYcgZ57k=;
        b=CMY3hL2811w5xWI+gu6eIUKVdTqRr7VHH5OXbp53CaiF2vBPdjkkMfI3D+HSry4OEA
         XKFnK5ybk4M+3x3kJgPdofYQZARjlZcuq3o0E7xtLyC8yqOlBF5rgiuE+jq/MpV7VWUS
         1UrvEjndbXjKcwOfnn6dAX+o09+JglLpL2QHRo4rZSlrB0Kvdnz3e2DsyCZxsPRnsfxy
         ygBEZi0Vqc+kjZYqUmmMTTxD37fOUOIug0nv4Jnh0575bOnW9uNUpLXwAaT9+ZCeCBeT
         T27xIe4ZuizaOzojpARWdljjaEXYGLrAKttIwZ0y70BmDZ44EFx2bmkOrn0F/NJlsRRP
         XEBA==
X-Forwarded-Encrypted: i=1; AKwUvBzgHtufjHWRUn+d2VZnhb+4t/GDQBjZhyK8ke/LI/KSF0e80WWi0jGtpgNJ1lwjHG1J0y4r/6rO8Rz0qgA=@vger.kernel.org
X-Gm-Message-State: AFuF++mf6t+Z6llFK54G5bBXhpdjRrrT6dfvN/AsvK3IUro2+Nat5Mep
	2uR134C/CL7Gl63t880VbvQ33RhVGeTj3LCGwRUSMcF5setCeoVIzOX2
X-Gm-Gg: AYBFou12O7R1exonGybv7H9piOS9nxF6t9OSpNrJDn9AC0ZWdNUxNMq+1orBxndKgsj
	zd0+HBOv4nZbQ2D0SkI61iSN23Uh1sQuT4p8IH3IsMUTsec5kGHvCOIl7mrcJ3aiaDMCZCdM9eO
	ZvL4/IU/jyM1hb1n09OQ9cJDoIGDA35VKbMminrQxvJ1Ss1r+0Ff9uhg1JkNUKFa0eUyk194x3g
	Qa849w827izZAKTwF8HSK7dxhkazA3UhBaMeH73JLnhuoqnS8RsMgkB4k/k/1BBDKEiAh5ZOOrP
	BYoNpwnLBYw1ydWnHCFI9WnykGCmnzClX0dzzHW+FAJAze0MPhPaX5ds3lmz5hanw2Rfc9b6B6A
	18ncXWVHDf9uXkxdR/2AIeIl3P/CNljJo7P2iZLacZm0/sGo3lyluKTsp091RN0LTkyukdzFzWc
	fS7asE5lnHxRp4ezd4IUY+y5lgiepB8fAPiAuHMMAvYFxTyg1ZuBGjYGGg3IhPXBaMj3wzDwX7o
	jaSjmijkakWyhGtm9Z56aRy2cWPqX6Gu++Dt4Q+lPNWozhf2u38l+BJ5bgBsJ4g0fInbZ8TL6u4
	GxMzfJymYNt7q0pCJTRK/0JpfKETtZnwvVFxv08IeTDs
X-Received: by 2002:a05:6000:4b0d:b0:487:3c8:9675 with SMTP id ffacd0b85a97d-488716aef48mr11226216f8f.8.1790341022604;
        Fri, 25 Sep 2026 05:57:02 -0700 (PDT)
Received: from archlinux.cern.ch (ppilicho-1.dyndns.cern.ch. [2001:1458:202:228::101:284])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349fa1sm10016698f8f.8.2026.09.25.05.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:57:02 -0700 (PDT)
From: Patryk Pilichowski <pat.pilichowski@gmail.com>
To: teackot@gmail.com,
	hansg@kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Patryk Pilichowski <pat.pilichowski@gmail.com>
Subject: [PATCH] platform/x86: msi-ec: Add MSI Katana 15 B13VFK EC firmware
Date: Fri, 25 Sep 2026 14:56:28 +0200
Message-ID: <20260925125628.69826-1-pat.pilichowski@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the EC firmware string '1585EMS1.115' to ALLOWED_FW_10. This
enables battery charge thresholds on the MSI Katana 15 B13VFK
(MS-1585).

The out-of-tree msi-ec driver groups this firmware with 1582EMS1.107
and 1583EMS1.109, which are already in ALLOWED_FW_10. An independent
report for the same model and firmware confirms the same charge
control encoding.

Tested on MSI Katana 15 B13VFK with EC firmware 1585EMS1.115:
writing charge_control_end_threshold updates EC register 0xd7 as
expected (80 -> 0xd0, 100 -> 0xe4). With AC connected and the
battery at 87%, the battery was charging with the threshold at 100;
writing 80 stopped charging ("Not charging"). Charging resumes 10%
below the end threshold, which matches charge_control_start_threshold.
Keyboard backlight (0xd3) and cooler boost (0x98) also match this
configuration.

Link: https://github.com/BeardOverflow/msi-ec/issues/185
Signed-off-by: Patryk Pilichowski <pat.pilichowski@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index 566dfc73c..6d6a797ee 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -825,6 +825,7 @@ static struct msi_ec_conf CONF9 __initdata = {
 static const char * const ALLOWED_FW_10[] __initconst = {
 	"1582EMS1.107", // GF66 11UC
 	"1583EMS1.109", // Pulse GL66 12UEK
+	"1585EMS1.115", // Katana 15 B13VFK
 	NULL
 };
 

base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
-- 
2.55.0

