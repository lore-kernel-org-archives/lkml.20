Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D55847FB1A
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792247914; cv=none; b=AWx8IWf6Jlh5enSxM853ebQTL2Rg9avOLwOAkpGoquUy4DvP9SrxNxONwf7SE54A8W665mWwMJ5hq9qqoYOpHkOGusybXwmw6dsC5rKEmOx9NsCCq9ryGsjDMM1Bv46EXihgtKtItMM3zM0Cn7z1pf0fzfuSVgb5367yxpk60rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792247914; c=relaxed/simple;
	bh=Z3NdKlWVlqAPME95Aop1Z/FVVgK4zViRb+bOxx34PFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PxDKw3MGrjTyQrXgH1j9WHC3CJ+WlQgdubAdPF8uKxHSxw4ooigTpsPbKo44+c0oVGxjMusZqB7orP6fxQWWG3JTrKqX2gD1ogOBs9FB0OGS3zIKUbIRA41nmP4TpLxFTXs5mVZeOsOlaTCn0fSOfR7bniB4x4Xt4zo1cALuFgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlkJVeV3; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlkJVeV3"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3514b90bb89so2097890eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792247912; x=1792852712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=omiuJv8MmcCiww+ZKW5+WdH4aNs8y923/45k9gUA+w0=;
        b=BlkJVeV3eMuFKCt/XXbJy4lf36A39tyThlzudex+GVxyzqgJaSSGGzHWD6xNZ2v2IP
         aHy3ueNTjT5hq0RawjIqHzwiT09WYNOY7MhK5XBRodV/7o+V8cDIjsKJEjf4zORxp3qA
         awBXs744HsWNhW9dPa/wO/kVXaoFVTZmcx+EgEFmtgmKdVuZRZKM1+3dVrqVNu9sW1kO
         aiQ6bFpqw1Ylip2c/ZyTNDlrbD6LGaK9cEb70ZeNDkPVZ1+XRKp07V19tIDu6nXf+4vR
         f3bR5/lpmi2OfoNItNAH7pByaPOgd2KiWcbVA5bTBbcsbn/rvWpknSKN8ltCTz/L0gdt
         RpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792247912; x=1792852712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=omiuJv8MmcCiww+ZKW5+WdH4aNs8y923/45k9gUA+w0=;
        b=rQHlfVV9joDe7lKeHVMONRCvnFmwrDYEsIy7wJFL+Cj9Da7ZLhdVMIMNi7ABArarI3
         WOyYPDL/0FqblPRBW4PLly6OQT9OdWaVrctqM7ihfZBs6IOghVhW/5CwPYrK/TV5LgCg
         3miUOvAvDwjGavAyg4cpYCglkOU3PkYTv4t3FuVlZJiMJjfxoaV6O9rRjYxrKkCtJw22
         1g0GuP91Gw+W82CcYBYd+eHygiM2BA9tcZm0EJJkoRY/QjOu37OIewyEsWhs9vmVoyn6
         JtBCpgbgj6S0iXWrsU62xwVfzvItQDjoS5KJOH7VmWLem0z7VqBde0RrByT0lX4EjBCK
         4u6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx999VEM7/QXRxiWZWlEKZGBEf/c8RENsv3s0R+4/Aid+nhe4VMioh5Mm4+rAR7xFKGMdqJ/5n9fMNLapA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8fv2/yalm2Nrg0qLxPUOv2HtPTRnVjuACaLur/mA6V86u8pWB
	jxdlivClOXj2bwsRvKLjRP9KGJ8lrRPrdHKg8x+qORoDLZgy/Z/Q8LVg
X-Gm-Gg: AYBFou2qPvmNFr/WUmg/H8EOSrl4BhfTDuhBhmGXFakoRSnTX5gJExCopAL15rTGEkQ
	Zb1bdlm2s99ZfkpWxJwwpPNeX7IabTgc0IlT4KqqK5Q5kGDBNJyw8JKXMYvPFkdH1svNZPC+DQ9
	M9TuzyHsLq23+EF3FyEPfxhnH9cXekNlB94jR0pSnkB/u9kjhJTvbhTSQ1ZjW+OHzf8WvVQnrz6
	xSC2ST/PvlqYquga09l9GiuIgWnuHfZLz4o+PyoPbwfDvWRAFsgnYxJMiqONiyP8DNkEBtDEees
	AtTn9KNR+dq3GU/wGo9Dup+fgmbDC+AQ/ttB3r8F9cmCm8AGZi91aWJ6mp3W7YXggRMT15wGDRt
	Dpcu8BTtdWQTwh8+7bKT5NuOHXJax7u/JIQwT4Wn97AsORGSz8h5XwwcA+9jXzOvIHHKvZP1Fkf
	WOMbe184t5qIMtBLwrL3Ra6GPYV9f/7SlncsGt1dZtm68lU2DObMmnRjp3A1NN
X-Received: by 2002:a05:7300:880b:b0:361:7ab9:47b5 with SMTP id 5a478bee46e88-361a2e393c2mr5031610eec.36.1792247911459;
        Sat, 17 Oct 2026 07:38:31 -0700 (PDT)
Received: from beelink ([186.22.57.86])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm26652075eec.12.2026.10.17.07.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:38:30 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v10 0/2] HID: multitouch: fix haptic lifetime on delayed input release
Date: Sat, 17 Oct 2026 11:38:08 -0300
Message-ID: <20261017143810.1567677-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v9 review found that a non-multitouch touchpad report can precede
the actual multitouch input on devices using HID_QUIRK_MULTI_INPUT.
The first report could take the only FF instance and become populated
solely because FF was added. The multitouch input would then lack FF.

Patch 2 now waits until mt_input_configured() has identified a
multitouch touchpad report before initializing haptics. Only the input
that receives FF gets INPUT_PROP_PRESSUREPAD from the haptic setup.
Patch 2 also uses scope cleanup for the cloned state and all of its
subresources, removing the mixture of __free() and goto labels.
Patch 1 is unchanged from v9.

Tested on x86_64 with W=1: built-in HID objects, a minimal vmlinux
and modules build, and hid-multitouch.o with HID_HAPTIC=n. QEMU/KVM
with KASAN ran 10 virtual UHID haptic cycles and 10 multi-input cycles
with a non-multitouch report before the multitouch report. The tests
checked FF_HAPTIC, effect upload and playback, HID removal with an
open evdev fd, and final release. No KASAN report was emitted.
Physical hardware was not tested.

Base: 58161ead29e50d70a317ea26b472e0c7508e69da
v9: https://lore.kernel.org/linux-input/20261017140332.1480375-1-qwe.aldo@gmail.com/

Aldo Ariel Panzardo (2):
  HID: haptic: make FF creation the last fallible init step
  HID: multitouch: give FF core ownership of haptic state

 drivers/hid/hid-haptic.c     | 161 +++++++++++++++++------------------
 drivers/hid/hid-haptic.h     |   6 +-
 drivers/hid/hid-multitouch.c |  36 ++++++--
 3 files changed, 107 insertions(+), 96 deletions(-)

-- 
2.53.0

