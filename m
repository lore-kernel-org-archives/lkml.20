Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3302D4052C9
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789904169; cv=none; b=BTOMzDn/Uc+EKcf6a2nE5ydhItUlxxbcR0JUaFqqOzvGdcYFFHk+pqLMmaAhsEoaHn5kHa62Iiv34Y+jAFHZBUDruCjoSts79kmdk0Zv7N2+zFVK2ci1TQGobM3LtKc86kuMNWfpUbz9KoQHOTjm4XZbZ48Lu5eeIoCvtEdkbxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789904169; c=relaxed/simple;
	bh=af9WY+p/oH8SFjKxjvYqHQNA32Ad45vOJqGiQwpRFEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WJX60NNCK6DV26GQskf7VQKYlYtPcS1/5mkkHTq1lg5Yx9vroZz1Z+3wG6kU4cZzEeESAmDCvGhD7t91S7D1iutoA1kd6khNz/8uvkBT+SE1zxXMwaipxeK8YVaZrN2j+RbA9jgCJ0f3LFIGHKkJirozpbdvybR/zSWpABGSbWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rSaTQyCQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rSaTQyCQ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db22383fe8so13180245ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789904163; x=1790508963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ma0Da1G7CdT08M9jKrj7qHEWDC5YDVs3rXblA4Cn+xM=;
        b=rSaTQyCQbqN3yggfjqWnGNk+eDoNpi8mba4Z4jpOE8tH+5xITARispRWMEAM+t95Q/
         dgxmgcaj1XioJcTbp8cUNpMdjMzO6uLpSkldqsrYp0EnyG5amaF0nxYn1yj67egKjEWy
         tcHfopCcFQfwIUDvfCebSz5jrMDHvp31ZSyklQwIg/J2tTtZwyjwVxNCqESOsqNfdcFC
         7+zqBzsDzT+F6BEMbD7vfnyfdJDW/tviW3yXT4SOvnLVp0wWaIW1Eey4r4VIMYbKekSG
         PUzhMhLfQgiqMciZY0yye2PGLDs43+t4zvRX0snEVEjG3LNg3Ww86YDxT4Jtu9V0+Fvg
         jBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789904163; x=1790508963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ma0Da1G7CdT08M9jKrj7qHEWDC5YDVs3rXblA4Cn+xM=;
        b=I9Zx6TKVicT67BMNX/yhgyZgtDxPYEBGPa3lNBNCpRvBF4hYJ4r1sjeooPStOVAcuz
         nNMcf+IOtQ9DQJ/vURIFqykC7pAb0w6YwhkQVMmOD4T2GQP+aABFKsmZAeG6jSubu/Yy
         WhAY/22elw8lpVpKJkllxARQmBmkP4deqnrX4GUHf9YdvSgXcfn2UkzjD/9IpFGxwkYU
         V1So3naayzbXSuWDdhR2WJ3dQEvJR2UBu5JGk/37g1K/pGLPu5zvmBphR0d96Jl601xM
         4AtQ6fMoRGS5LP5ksKe3rjp2/rNWy+kyWnwySlm0B5TLxDTu8XAMw1AF9biGEOD9SuHO
         EowQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+7fcuf8S2FwEdXiFITQs9oG7kxU/HINomrzo2gFpzxsriH4TCeBj3hfNkscMjwnZHL8naSogDxEJr4/s=@vger.kernel.org
X-Gm-Message-State: AFuF++lh/A0XlFMdKLEB40iD1MATYC/uwOp3xJSifMOP3plnEm7Wm1Hx
	OVv7CgMJq8xN12+SxqlTVeJYNCMIvYR0UD6RSQUUh4uetpalBDVUrVgB
X-Gm-Gg: AYBFou1VnjFmgLZXBeyX9xZLy7JEPjRfMfzLt57AHOHd2352oGC+M5R5mcDiTWknAqm
	E3jiyDoOhPJQ80wWxs3JmMMgFuW3P4KPFgpwROaY2FbxzETlhZ9kDg72btVOMROsKvBOwA1PGEU
	R9WTWgS+DURsOvGAgLmxRybTHdxHIFVr83SoSvnWdMAaWPivxMnSHFOdSddjz9IkEy/uWHOZDof
	lC/wkM/seRkG0VOIu4a0y2iZnPlMELxgzSIZW5xki1Sxh2fwN7Pc4zuSso67L2QHcVscRxXQFAH
	d4C4GFkRI8yR+C2nJ0mnLDApVprWWiG0BHTbIpkS2OZqt74FyXUJ1vYQeLdxWLIS1YeVip5xKPN
	s3WTwyQBM/5hHi+cBBj1iLFC5hVQb8mPwM1yeaog90GDzp62lKWegqYVJIX7Pld5Jp64qyOFrEc
	7qdmOH9Lvz5I3+1J4+BwG7Or1YT3FmYJt9U/YIV6xZjymBWIpn0klfp0Im6yjO7PrU006n9r8CM
	Z5RVTwICYWZYH8YphSY7dwH1XlgkAu2dGF6mA==
X-Received: by 2002:a17:903:124b:b0:2dd:ad73:c981 with SMTP id d9443c01a7336-2ddb1ba2dcdmr106961685ad.25.1789904163365;
        Sun, 20 Sep 2026 04:36:03 -0700 (PDT)
Received: from localhost ([2409:40c4:136:c0b:7911:68d7:f26b:cf67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a6e5sm11764312eec.7.2026.09.20.04.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 04:36:02 -0700 (PDT)
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Heiko Brey <cico0815@gmx.de>,
	linux-kernel@vger.kernel.org,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Subject: [PATCH] Input: i8042 - add nomux quirk for Fujitsu LIFEBOOK U7410
Date: Sun, 20 Sep 2026 17:05:41 +0530
Message-ID: <20260920113541.1484808-1-lovekeshsolanki00@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Fujitsu LIFEBOOK U7410 the internal keyboard and touchpad die
shortly after boot if i8042 multiplexing controller is probed and
switched to muxed mode. These multiplexing setup commands disturb the EC
emulated keyboard and atkbd reports "Spurious ACK" and "Unknown key
pressed" warnings, after which both keyboard and touchpad stop
delivering events. Both touchpad and keyboard work in BIOS and GRUB.

Disabling multiplexer using i8042.nomux=1 makes both devices work on
warm/cold boot.

Add a DMI quirk to force nomux mode for this model.

Reported-by: Heiko Brey <cico0815@gmx.de>
Link: https://lore.kernel.org/all/89f36f3f5e4c2d07b9ff72bc0b355875c336e498.camel@gmx.de/
Signed-off-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
---
 drivers/input/serio/i8042-acpipnpio.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index 9ecb0eed48c4..edd9f2e7c65e 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -664,6 +664,15 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		},
 		.driver_data = (void *)(SERIO_QUIRK_NOAUX)
 	},
+	{
+		/* Fujitsu LIFEBOOK U7410 */
+		/* Mux mode also disturbs the EC keyboard, causing spurious ACKs */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU CLIENT COMPUTING LIMITED"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK U7410"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
+	},
 	{
 		/* Gigabyte M912 */
 		.matches = {
-- 
2.55.0

