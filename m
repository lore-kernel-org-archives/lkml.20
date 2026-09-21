Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E574825B0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987660; cv=none; b=J6C8XtFupUqX7vke6zcZPbuvBGzM75fnn5W4KglIJI+Yj+ZejyYM5ltr4JdthFmVfvrKnID5ETjezZnOXsz2R1DMhGs7TuayJ3BxcFwbHZtDz7TgSoXJJTjvNA6X9D2v+onRkqzQcXFh7vJefBAUvAjezEkf1emIoGuOudXbvas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987660; c=relaxed/simple;
	bh=F0WXZVXUVvY/5McqBHwjv7xmcfG9Jon/vnRvlBQvq6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IG5xvRac4E+66tDNR0vP7zNM3C0S4W4VoKX1YnjlLoCzgybwMJ7IeavzdafbhFkAsxLFAryxemZvbDEgogmuOS24PDvBnH7gaEC0GrxbboXMEAoQYGQ5Lk+dxHDPdg5nywT5vONpDlq1ANczZppTYCOLo+DcMjup/BdhbI3ZVH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mub/tKNf; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mub/tKNf"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e211a3so2429226b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789987658; x=1790592458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xJT6VrpZEKh+GTixXY0xK6q/6U7uxcfKLL31skyjQtM=;
        b=mub/tKNfUVUhZ8sn0H5dk1pByNoxmjAdaXbM/CEirH13MDZ2eir/j6psDAUYsKwgHx
         VXvRc8WxBsBFaJTIJyOUQ45HPzPPLto9UNrY85nU9DXXTgZ8YikQZ4ZeEK08aH65T+wI
         6ousF9fP0llfuV1waG9T3CBmjvBhMPFVYamI4t7iYJhNM9DT/ycbrLFECznkOV3lOmaW
         uWpBj7BJphiYA+CU+OfMaJcol8GhMKzXHntDjl2q5Gu8ivHlfeHA0Nnlh8yGIw9WDCnf
         v8uw4E3jLabj4r+cZP7SuwhXFsHLZERqrXRFD4FCccpv0EgR7z6cBzEcmro2Mi6/mtLw
         y9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789987658; x=1790592458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJT6VrpZEKh+GTixXY0xK6q/6U7uxcfKLL31skyjQtM=;
        b=FIoz59qOomp9S4pkfI2m3XwsUwyXOszmIYvmv22LhscJuH64g9bES9FSgumfXxG2bW
         w/JygQRwhK2aBSgTLDNisD6YNmdBZlBmjGMKeq2rksLlMbW28VRcu+UiRCQaW9jkB5Xs
         9N6iFtHAcoTXn6sYt7Um/MKxLA9LerRhxLE6E9Dbp+n7w8jC+Dt4axJBNBx5BhJF90P3
         OFUm1SQN1PCqEzWjXPSOlpHc0Q2TAyN4iByv/rhq//hSwWDKq+MBEMiaJE+yZiC7gWUS
         Dhu7M7n4PVKKOKetRxwOlZTC1JastpbPiQQEyVSAgD2+OxynXoTIJ5a0Er6QxFHLpzcT
         cfAw==
X-Forwarded-Encrypted: i=1; AKwUvBxHCKsi9P3hbz6slkurjdABFfZkq20Ng/Yvlt2VrWRmqddUi76NfQ1+glx/jby2HcsqUmzYZMXYXkFAbdM=@vger.kernel.org
X-Gm-Message-State: AFuF++m7f3BhkPHRbJRRKcNzf8PEB7J3ppwr9a0V9IWK9TwzNl3s8HcQ
	v3CnwDVpTt+80kx3+aIHi8fgFHbNABSCUmiWZjX6Ed/2D1p1agiTcwzF
X-Gm-Gg: AYBFou1ra3Jkt23lkAtdKm4oNvRVcshh7ByRAcMnFGER43gX1JbuP3M7RYhm1u7oyAC
	t8exm8DOc045wCk/PIA3BFRh04JDSCMT9A2FjkPKDZMz5DubOxqDwRVUsbyLOMLQ+Olx/lGeBue
	q1h82DuoBAiIfKxEiquWBtnbS4uPl7jDJCK4Vj3/fzIgCP0zlOUAUGSXazVOgxiA3mXJaA6raA3
	RR7hbOG5cHOMtHmU8LI91ErCnFlTUAHqVe0Y0VFUt782h9Derv1JNWKJylArg9TBo/2W3LNlBlh
	nGJ5cNW08F3lc+6nZaLG1GtiU0LfpOocw+tRaHGzLPP/XhFHrHAaWYFpX9N0Xem1qGukAAs/6N5
	Hr5K2BiFJnwhsPUq1lt7fz+qLdCw92Q25Xh//luVZh2hf5Szins03Fb1Ykr4fQlQoM4YeWnB3nU
	5NuhAwXr+utLr2CH+cTSz5pJ+f6rjGdX+EjmkFY06Q7mOB78c/GvgjVg==
X-Received: by 2002:a05:6a00:b47:b0:871:b1b0:e49f with SMTP id d2e1a72fcca58-874dc3f66dcmr15598265b3a.13.1789987658163;
        Mon, 21 Sep 2026 03:47:38 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9b0d4adsm3036409b3a.36.2026.09.21.03.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:47:37 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dtor@mail.ru>,
	Sundar Iyer <sundar.iyer@stericsson.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: tc3589x: fix GPIO child device leak on probe failure
Date: Mon, 21 Sep 2026 18:47:30 +0800
Message-ID: <20260921104730.354304-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tc3589x_device_init() may register the GPIO MFD child before
registering the keypad child. If the GPIO child is registered
successfully but the subsequent mfd_add_devices() call for the keypad
fails, the function returns without removing the already registered
GPIO device.

Since tc3589x_remove() is not called after a failed probe, the GPIO
platform device remains registered and is never released.

Remove the MFD children when keypad registration fails so that any
GPIO child registered by the earlier mfd_add_devices() call is properly
unregistered.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 09c730a488c3 ("input/tc3589x: add tc3589x keypad support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mfd/tc3589x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
index 2d4eb771e230..309c4db99c2c 100644
--- a/drivers/mfd/tc3589x.c
+++ b/drivers/mfd/tc3589x.c
@@ -303,6 +303,7 @@ static int tc3589x_device_init(struct tc3589x *tc3589x)
 				      0, tc3589x->domain);
 		if (ret) {
 			dev_err(tc3589x->dev, "failed to keypad child\n");
+			mfd_remove_devices(tc3589x->dev);
 			return ret;
 		}
 		dev_info(tc3589x->dev, "added keypad block\n");
-- 
2.43.0

