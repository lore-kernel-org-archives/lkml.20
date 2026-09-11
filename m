Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B111B35F8C5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137304; cv=none; b=Ls6pZQIq7P0hxACCn4hTgnFv8JU4s62vTg8kJyfH1YKP8mTWGPraACiZm/8w+1BYkkh5yP+6NfbBrsbsjNnqgvKktEB/iavn/VWi+DuUXpXOyMz1dp9ZCAA/rn76oxgVEyhSRh17zk1hs99zAm4813+H+ZEaGzHr521AsWTG7mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137304; c=relaxed/simple;
	bh=dvAk2dqkAlXIm6SK8bigWlZEwAOCZpfJJcV/gP5wTlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGdSAKV9mjvYjqYLBRi6oTEpzBGjwrsqn3iCF69GnsZJIb1DRThaDe9O4m+L542n7Anmjkb9VFGPXz9pXUvKPJ5GunNLAlAzeHJ9bfDOYeSyCwaC6qihlqopGcDGV6HjS7cwuoUkEFOL5ac4+2YfMQ6WxWvEzGczDil2BlOdONI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2onzNNB; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2onzNNB"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86323e4853aso143152b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789137302; x=1789742102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1sNp6qYMSh2Pxp2iS5mOkD4cGCz9UgtwUXiF4heieqw=;
        b=C2onzNNB1vVggh5UpvDc2zZx3GFRRhzOQScXIs6qT6acqdDtcIiQZmV/0KfVJXKYjs
         qcWOE2l8b/AgKx++5GcDc2eC3KOF++Pt/6qdabs6Pm4hDYOgDSugFc+HasYt0Uv2Tra9
         Pn2P28Jb2Leyd/ADtsYnJ5XJc1ysBc4S9Xkkn81DT8z9STktpj/ULkK1UP3GXXrBCtST
         qbQwOYuoz5UVlvQe53+9y/em5zTvJQWsDsHdBCwhfZL5DV/QbKVjwp2ZT6p+dnsbnB7+
         JTNt14cHWWRyU1EPEmaBsKCbQDQ1nFFLl8EYO9qMBv11nJaj0gOPOFp+QGJgSd/1Ovfs
         3cRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137302; x=1789742102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1sNp6qYMSh2Pxp2iS5mOkD4cGCz9UgtwUXiF4heieqw=;
        b=LEff6jt0yAQ3l1nRb6dRnUSmagdtAFMqv9D4yUpT2eYPPakxBhzgjtZqQM/zHfHyvr
         cYs2KpYElBkf7wYfYmdmtzLnAD4BnPFx1wEIpI91D8LMFlLRz0ktTHwbTPnCsp5lZonA
         KnXCmvLQw6Qq8eaDXh4mwD8FmaonB1V/G6xKqmU6Ft6sJyWULJYjJkjqIf/P8KDaYhjW
         lCQHTzTJQ01cBr1waPxls8bDsJGiRdWotcWf4ZYY0mMoiDDbbDVx9QwhTSUW2m292jOK
         EnQUHUY+SCa6CKGdqZ1sBHD/V43u27mHQjjXKKuZAqcbnw35ZVvSYYFRAp9A6yeKamr9
         leIw==
X-Forwarded-Encrypted: i=1; AKwUvByHTjIfyInQ/1o11ZRv7IQpy4XEeIeyraEfFP6xIeswg62q7sDf9AutIxcJoYnD2ANmy1x8O5S4huOuPD0=@vger.kernel.org
X-Gm-Message-State: AFuF++l8lJ8L4EPiifnzVkOqo8Z75Cw5DXNJJV/4XXeZEsRMB09JcnNH
	OpdjtFLGWfEKv4W/SVEjblBsBpMqLCG7y4S8o7lyGtlx/UQZii6p4+lo
X-Gm-Gg: AYBFou2bFfWqjeUTMXyl7JaMarbgP9r2wPLsN8s7Os4lrxy22tGXi9c0N2HFZCaZGB4
	ehebvcpSXmfTrKUPrSn2l6nCoejNKNaC3tT9lOiQFD58KsQ9JTLD2p4Mr3NGjCQsCxXvS2RdFeI
	E3u5z1hvUMGdoAxILB4UqA0V8fQgcecr2LQQzWcjME+XB1vQMjeU/B8wtEvj7nRNNL24Azkj/TV
	3mIQBujaTDD6UjVx1eA95I3MehlRcb/5bFzOouQ8M3++IXvLEDlPtSDnKA5miT6rSMAqETLeT/x
	12DyEqRmrSXRj3OyQUuLLi/jAZ9OGaEnMMVRkRPdYtYcE1RUndY7gG0I5+gBfcFp+vjY+3B8cdD
	q+pbdqdmlCXPBpBcn1/4s0qE1YFPkB+IarV40A+4WCngVL/PNGvFpNIVl6RdyJ5tnXOs8/4NIIN
	idgKJ7JPv+ybmFnAPCNhINjeGHVU7dzZHx4FVJ2bhd91JhB1d5SjzUSiU06NuP9+ms05YYAw==
X-Received: by 2002:a05:6a20:ad90:b0:3d1:56e6:daad with SMTP id adf61e73a8af0-3daecade5d3mr4625729637.0.1789137301981;
        Fri, 11 Sep 2026 07:35:01 -0700 (PDT)
Received: from yuzaya ([182.253.152.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a5c052csm1209838b3a.58.2026.09.11.07.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:35:01 -0700 (PDT)
From: Dirga Yuza <dirgayuza123@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dirga Yuza <dirgayuza123@gmail.com>
Subject: [PATCH] ACPI: video: add backlight=native DMI quirk on Acer Nitro AN515-58
Date: Fri, 11 Sep 2026 21:33:06 +0700
Message-ID: <20260911143306.49015-1-dirgayuza123@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Nitro AN515-58 requires the same quirk entry as AN515-46, since
its firmware also advertises the NVIDIA WMI EC backlight GUID. However,
on this hybrid graphics setup, the internal display is wired to the
Integrated GPU (Intel Iris Xe Graphics).

As a result, the nvidia_wmi_ec_backlight driver fails to probe, leaving
no backlight device registered and rendering the brightness keys and
desktop brightness slider non-functional.

Setting acpi_backlight=native allows intel_backlight to register its
backlight interface and restoring brightness control. Add a DMI
quirk entry so this model uses the native backlight by default.

Signed-off-by: Dirga Yuza <dirgayuza123@gmail.com>
---
 drivers/acpi/video_detect.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index e3b69f876..3037fd18d 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -929,6 +929,14 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-46"),
 		},
 	},
+	{
+	 .callback = video_detect_force_native,
+	 /* Acer Nitro AN515-58 */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-58"),
+		},
+	},
 
 	/*
 	 * x86 android tablets which directly control the backlight through
-- 
2.55.0

