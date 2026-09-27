Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2AE846A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790473238; cv=none; b=n4Wkc+b1X32ufJUcRZLZ8HOKzyTkTlaq+q/CJI4p+I/ycYZnKn1fMaHUi/sxxdDN15TOpaZ8E2+RXBmspW1MJdzEPjrizW0/e62KSSWGCZi2e4uUzBTJNFTVAUAtZH/thb2AqucjIv2bTgksoPldfMozYDaGy1vady1vv01+kn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790473238; c=relaxed/simple;
	bh=UnnR+ATLgPExGFZHufyb2ba5HleIxoZRia483qSniq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dNCx44y8Okf8Abr9YKh+o99olsSEmfyKjyQmbucOyp3xibP2lPOKBC0WAqHRgxTSqDnEA6mj7jHFjUvmCxubyXe3EAOz9+lf5ZRkixeSM36Q6xxfui9qrpYBMj6141SdiGlUYyH0+bTjZzv8rZ2nOjJ/o3h5yKdre9NPVocZOrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQWQzttE; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQWQzttE"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882c1f261so596199f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790473235; x=1791078035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCbMaHKrOBAkv4xsmVqUggrJcIbKWw7RYeOk/wu2YR4=;
        b=hQWQzttEms21Zx0/m9+N6fW9VFZdEbxTpZQtgYKawIubNY2bqPpHVbOS+5a+hPSzdf
         BESA1fYM0vvkuYJNUizPKc63CsVZQQNMvJn2Go0E1i3ceEom7CTXj8ug+9yRCrVQ62Wv
         EKMgnSZMqFWGWZbeF7ZiFmXdIREkiRNubfwE/hr11UyqRrS6b54MSd5tClpkbJ5bQ7B0
         e2nY7vIdunA/kZIlAkWLDP3ECRZDakomHdYty5zFxxzSHh4rEOAUnqboyUva/2jmi1yf
         HfrK9fvVwD9m5HrF5hSsm7GTcSMD1AhWRet2TK/y3njdWklW9LMmcOWWov2iin9o3rvW
         nUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790473235; x=1791078035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCbMaHKrOBAkv4xsmVqUggrJcIbKWw7RYeOk/wu2YR4=;
        b=HE4y9Y3U6ETqKpaoytGlIGroksYnqjie28sR3H5qIh1BFxnqDpCUkwi/T60PgAsVBk
         NHSX4jH1Q5kBIPrJ9BSXGbQbZBazbXpaTrr6BgbFy7KJpOJWr81GCrtG7Dk8IijuLFTY
         0WS6HvwCYi1VXgeJRfbJ6NYoll1wq9gcuCWOwGywFyQbVFmV0bEvPzmIy7vbnyfwTgWp
         7VyveuJfTfyhMW6D/bXUyhqlzjRbWxEJS8Pl48ZTj/RPX8bKxeMVfjZGGr8jAWlW9LGF
         g3nyB3kgrsRoK91XW63B17w4m7Bb+/DkAZzeZGp5HeG3x+LsQvxDIImxkm5AL+0agfEE
         0oTA==
X-Forwarded-Encrypted: i=1; AKwUvBzjIPPGBax0rvRRyHmayMY130bInbxZB0EoFWehT0a6bFe6YRdqJHmvV6A5uZ1J3U8kDFyG3i3fzhL8y8s=@vger.kernel.org
X-Gm-Message-State: AFuF++kQH66boOH4TZZh8VTP6H4lWLiGKeZY9kOch5LPyJlrmbF3X0rF
	Zu56Ab9Eun1bMOvL+7qEKIS545mt63xZWesL9a0klUGHQ3k4/0NgkIoA
X-Gm-Gg: AYBFou31F62R1EpBwl45ZTKg069nmOS/tHAJ8OuWpjnEmXZCOzZ1H02pigC6y1xt0UA
	og0vmqGCmBdJB1QydXr7Wgm3SJx/jouW8b39MSQ1rUcRwuVfatOO0ZQOP5V0EuFqyqq2hzKzSq2
	ep9e1OnwyRIlY71Q/zdK2+G6PN4Vul69e9POXPW7xW7bO2dShpbN40z5ehpQ0OwETPc91C1qMEj
	0g4LMpDCkaqXUwTbf3ckHMKvnXopUARVB2z/e59FEhLv56hc30ZmxoVJ2TZ262kDN+jIxWUGUoD
	GBR8SFhedkg3cc2YQwOEyRXog1P7BAci/CQhrB2/hjUggAVhZXb0rzbspYA21GEe7wjsFqc3EiN
	krKYk0TFeL3JJC8IiEEFBota9BMPpmXwqDbW7Hl2Rp/NyKkDGOoMaJr0Si9vw3k6HoEnRJq4Age
	dTsYDBPzJIxMS3OVUvJ8tFqENq2kD3fmmQAP4crgGbGsRkovHxrPqt2pKaXJzFuDN027L3pTX7i
	TcRv+haCQ==
X-Received: by 2002:a05:600c:8b5b:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49fe66f17damr169784005e9.10.1790473235208;
        Sat, 26 Sep 2026 18:40:35 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee9203f0sm114736595e9.1.2026.09.26.18.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:40:34 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH v2 0/2] platform/x86: uniwill-laptop: Support the PCSpecialist Recoil 16 AMD
Date: Sun, 27 Sep 2026 02:40:29 +0100
Message-ID: <20260927014031.3465252-1-amad3v@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCSpecialist Recoil 16 AMD is a rebadged TUXEDO Stellaris 16 Gen7 AMD
(board X6FR57TY), which the driver does not match today because of the
different DMI vendor and board name.

Patch 1 adds it with the existing Stellaris 16 Gen7 AMD feature set.
Patch 2 maps the "Sc" key (WMI event 0xD0) to KEY_ROTATE_DISPLAY.

Tested on the Recoil 16 AMD (BIOS N.1.39PCS10) with the driver from this
series built against 7.2.7: the Sc key, the hwmon fan and temperature
readings, and all three charging profiles. Charging from below 70%,
with the charge counted from current_now:

  Profile    CV (4S)    per cell   stops at, of a Standard charge
  Standard   17.405 V   4.35 V     100%
  Long_Life  17.194 V   4.30 V     about 93%
  Trickle    16.818 V   4.20 V     about 90%

In every profile the EC then reports 100% / Full, as Armin said it
would.

Changes in v2:
- Patch 1 uses the existing Stellaris 16 Gen7 AMD feature set (charging
  profiles) instead of the percentage charge limit (Armin).
- Dropped the platform profile patch for now (Armin).
- Added Armin's Reviewed-by to the Sc key patch. On whether TUXEDO knows
  more about event 0xD0: tuxedo-drivers (4.24.0) has no entry for it in
  its Uniwill keymap, so it only reaches the "Unknown code" debug message
  there.

Regarding EC_ADDR_CHARGE_CTRL from the v1 review: it needs no cleanup. It
was 0 before v1 was ever loaded, and after a power cycle without the
driver the EC had reset it to 0 on its own.

v1: https://lore.kernel.org/platform-driver-x86/20260925211635.1422516-1-amad3v@gmail.com/

Mohamed Jouini (2):
  platform/x86: uniwill-laptop: Add PCSpecialist Recoil 16 AMD
  platform/x86: uniwill-laptop: Map the screen rotation key

 drivers/platform/x86/uniwill/uniwill-acpi.c | 11 +++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.h  |  3 +++
 2 files changed, 14 insertions(+)


base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
-- 
2.55.0

