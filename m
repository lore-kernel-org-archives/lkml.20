Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DF8523782
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866318; cv=none; b=tYv0ad7PBr7ui2u2HFGL1Br34j75uCgfVqJJGDFsbW/Yaa81PRkx0AdKq4ym0A2V/XFp904MD1OC/ik8Aha5pTJT9JBXaO1fQERDvRyw+w1kCGEBThlXVeOoBmAfcrBbHykEQvxDkBjHesv50a7I8hFtL/TM0BqsCn3cGRZe03I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866318; c=relaxed/simple;
	bh=N1EE5/HFwj8La12KmNKwWRt7P1AzcTsE7MK4yiQ22m8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aDhVz/CRIgaJe7sIjW8/cSke4nhf0UOfDPQK6iMDGFbpt4HYt/vR4+JRlG6okY0WolMGvFLejM7GIYr+V82vfkdXF6W3hITuuHPaAcfGWzdY3158LA//JV+0WNXOnq/Cb4vQzqODZwr4+QhMJOpm53348QO6FU96kyeBEBzVWOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ptaZ7mAr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ptaZ7mAr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-485850cbac3so2897565f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788866304; x=1789471104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EqgF/+AOII+vyLq+5hcCiZzNgkbEl0skMpyhY7dZ7CU=;
        b=ptaZ7mArpclQUFeRCVomDmrTTYbbsnTZzKZr+xrG9B5mTeNqoXq2Yv6tYWxy0eZYki
         TuJqRZrfOjgu+w32AKHWP9sfQmBQwr5FAo0XffM25PzutmZtJ5Q47avfMkQKeOieghAf
         wamygwLYQZz5asq9lxw6/dQ6orfvmtcfiS1h/vTv3XtqR7h8TwU+29Iyybbt86f5qqjh
         TUP/7k7fKTlMLK2+ZFi89v+/g+RvCVIXBpaTJpiF1RKDz4gfHSjEjNETB0v5lyUoJb8C
         7wEYz3jcZ5Wq1mqYQPj2LkiOCgtsKSfKebbYPUYFuE3J80U9bikN8iwnTBhWgdzodVuw
         Y6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788866304; x=1789471104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqgF/+AOII+vyLq+5hcCiZzNgkbEl0skMpyhY7dZ7CU=;
        b=R5gxvon7l3r2jjV7tUFKpisMQPxH77B0eBjxFzNJqM4DgdbB5x3qDnRITf1kVG8Zpv
         4eqvR7tZqJSmSAoPiAdNnziKcWQqnc0ueWNvvW2RpReBqQcX98yYc9Ob6EsbdZX+zdGM
         YsRaHbYTn5OmOHbalacpYXcl/6MhQKudcH/5uuSVKSFztHPoFLOqPjCtxL2C+1r4WBSF
         +xjer/fcM6nO1QQFErxGd03RzJHqbsYd5cFLQb8rbVL8Tl3xCb6sPtK9iZiM6LLrNY/E
         v96pXkAtl43zPs5+iMVQPSW7LcjiII09PLhz3iQByHH9/jkOW3HxcLKQSga94bicINYT
         uwRQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6PbAHw6pUqts1zU/uyH0L5TGF2JlcByJQYg+9deGqdqiNS5Ug37CG2jMwWA6sRnaUnh0+jsU9vTQ4IKc=@vger.kernel.org
X-Gm-Message-State: AFuF++lhlPsqsYaiEf338nAEUNMXSAfOWK4Cq7ToBcT1UwBC07ugrDK4
	YkJ8zzrsD4zJZsMurq15zrneeGeNOFe6vx7inBnm8iClkTu9v4akiv+a
X-Gm-Gg: AYBFou0JmQ2iNpipvlUZRfAiXtHbU2t07aeMkInre8QGc2yN8MXkHFeeUcLT9SJ5SH3
	cV9Ztruc+1wyeei7Nss1Pm7OGEHx30rwdAvIWHRn72fwyrlVVAy/92URHplnWgE9LzHnDNX/W31
	BkPAKyGvT867I+2SerJ3R4BtZMDFzFfGGaWZn+r/bRxTQP3slVDsgxiZ718xxLugueZHVQ8JB00
	DbcXVNVBXLEwpschTWi2Ab0eeg8uXa/OjcD3Bu+9MS3aaWbFJvQqeYjbU4fUSV1lKBxkyttBjyX
	SzygdmgpS7S1IuHIAiseM7LlCr9xj3385RYgp/8ZnLcJWJlu6HveLXKCNn5ltMZK6M2bLoFMuw0
	3MpTMI088RefdCwHaiH1lebP7PmrMNT7Doc9rN3ffnGIleT44vp+8IllOg73p++jMfIzweUsU7f
	nWmZ7GWoUlNYPCW6lMANKhV+9aWYNA6UDe0L5zpQcUpm6VCi17R9xPzA4XNZJGTqvGtVYtS8Q1i
	1KnnA2l+h4HffiNX1U9PepRZlvYXDPTLQY=
X-Received: by 2002:a05:6000:605:b0:485:8c16:a360 with SMTP id ffacd0b85a97d-4858c16a6abmr25770017f8f.56.1788866304271;
        Tue, 08 Sep 2026 04:18:24 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm34422099f8f.3.2026.09.08.04.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:18:23 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] HID: Lenovo Yoga Slim 7x Gen 11 keyboard fixes
Date: Tue,  8 Sep 2026 13:18:10 +0200
Message-ID: <20260908111812.43837-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes for the ITE keyboard controller (048d:83db) on the Lenovo Yoga
Slim 7x Gen 11, a Qualcomm Snapdragon X2 Elite (glymur) laptop.

Patch 1 silences a one second timeout on every probe and every resume:
the controller performs its reset but never raises the interrupt that
acknowledges it. Patch 2 suppresses a phantom KEY_RFKILL input device
created from a Wireless Radio Controls collection that never reports
anything.

Changes in v2:
 - Posted as a single series. In v1 these went out as two independent
   patches, which was a mistake: patch 1 adds
   I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_G11_KEYBOARD to hid-ids.h and
   patch 2 uses it, so the hid-lenovo patch did not build on its own.
   Ordered here so each patch builds standalone; verified by compiling
   drivers/hid/hid-lenovo.o and drivers/hid/i2c-hid/i2c-hid-core.o at
   each step.
 - No functional change.
 - v1 patch 1: https://lore.kernel.org/all/20260908091926.5773-1-okerixx@gmail.com/
 - v1 patch 2: https://lore.kernel.org/all/20260908091907.5653-1-okerixx@gmail.com/

Oleg Keri (2):
  HID: i2c-hid: add reset quirk for Lenovo Yoga Slim 7x Gen 11 keyboard
  HID: lenovo: suppress phantom radio control input on Yoga Slim 7x Gen 11



-- 
2.55.0

base-commit: 5e036ce12de91c6fd674dad33b169c6150be2a7a
