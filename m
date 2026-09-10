Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A51939447C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021869; cv=none; b=eLxlRZ0Q5CfqDOAgnUgOvVEWDCUSkhiengnteLLdo6NSFj9kAxhZaG9hV8LjMN37uyRoXQyRRuY+RtnlGoD6rjIEYnISYH6bzSRkNZVAGrbP/0irumIq3NYp0su/zEchJseWrwiIVZ/ycwrZe/Xp8BwZlM/+HBKChQ/cagltcmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021869; c=relaxed/simple;
	bh=WMRZuSLNkMYvarqhnRsxONvyGTX9zmFRHIo8fK4Mcws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U/XrRbQnpXCuPrjYFsJ73iODde09Wd+6vHK6P7LOky3YiqqG1cSSwdxF5VZxouBrKfdlmz2GB/m/fnxA3Lmd4zgm8rihEDw9XVRRf3ffWtDGWJpmpqTdJtx2nJP7il0CY728suZ7AOzoF2TapA1Wf+oO7xX8PvA9cNAtELpGtGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noOCC9TT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noOCC9TT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b965570d7so74600185e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021865; x=1789626665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yit7H/tRXuShodzrH2KswWmmIcKYW0pMr8GV43v0zBw=;
        b=noOCC9TTPqDwrbLXGDGmiu5UffuLQzQD45IqNp+/0q+a40TDnhKrpHrERf5CpRk9J1
         Y3qyHJ7d16R6BDYTU9iZnjVdnAfzWr1eGnoC7IE8m3mAP/tAoqWlFXCLbqUKMi+WZr18
         RjoLjlv7eCTW9DiJ069tUteKMhzlWYrTArq6AXyji2M9SczA19V2ANM3eEF8FGIMFqMJ
         iait6QKzlN4lrKDO0MOJNNHx2JvUqKebzFsqyNLl0ksaUCH8wI7YT3YbwFzDt8Cm7Kl5
         u6RSjJTDYQ91bjgcs+3cHl0vdKF/WlmtXZKmBSrfvi1sX4BPSvfAl0L0hZ9XTTl3D5yl
         PX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021865; x=1789626665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yit7H/tRXuShodzrH2KswWmmIcKYW0pMr8GV43v0zBw=;
        b=SwzYBezFuVTjkI7aSraaRoOXNNaNuQVOb+fEjmHilDEit36j185bAXfliKxC6bc/f7
         5D6f06iFrSumJhNxd6FSuRt1joKTNHcaPVrtu7+aAoJeOi+DpldmP3hHuATIoBuTWOWv
         /s7KaI5nLeZBe07Gl8gp4hWqj+0ouxUvarf/xwS6a7NkrKs5vt5/oZ3CE1ZQLOxN1QGy
         0D+90Tcl5VAR3HpdFfoR6tu3cs3qm2g+TYwxUyJgTAq9s70J82IDK8MTZDHJ4OusILLE
         8dcA7e+t9PdrY0FME5vl5glJQSvs9JWbZLZXzIjS/Exqnc34BY+v69nBiUWfpnG/eYkq
         xbCQ==
X-Forwarded-Encrypted: i=1; AKwUvByIFizIbPX368ghsQZ4M4BtBL0xHf1cRdH03hYqRZi0AzQzZq3qLfhS+T4W5ACoipNtIqr1o5y1VwQuOpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n9YP1XKOQajL6tqmfQMgeLP8WRjmHGQqSkRvs3hbforuShu5Ga
	j0fSd1mn9jMqb3I4q1UG3cekEZt17dLzLVeHKvF6A4avXHSP6ddeU/uL
X-Gm-Gg: AYBFou1WS/wCnoi+hL0ox4kaOcemDiclpsETGWnOXblJZ7zJhEac7T0nfdpqR3/P6Wz
	yDKRuqs/Gg/M5s3hKoWHX3yuSAXLeut58O74chXabMDS3U45slE3ctG/R+XjTdLC9071aojodak
	Rpnq8EH3RzOp5WRjgEY6nR3+MsbWK9S0vKdZ/ukbXJ8N2ax0bzBUfNI+5o3XA+5sfiPTaVgAjqS
	tPHEtJRh1TFQPB9JjqcNkotATMzcdHBD7cDayPlmCtKBSjlCTE/dshEqckXCIr6H8iMcNPkTO5K
	AzHy2aABVwv6FDC9zJkQiriGWF/nuK3wk7cOwvij57+l/8ZNVje0s8+RL3GXicRvNTy6wYcWrjC
	yLfz++W4We76wBxvwVbxHLjrIrOsd8ZdL5eEuU0N7GOrSnwI4+PWk0CRBP6KbhaTQO2xwZHKkUB
	EWZ7143SeZYY8CuGgQy71VQYHZJppIGEf56HOJVKsAcK4nrjU/L/h/g9YyzHo76RtPIV0olB7vf
	3VXc5O7sCxMdq3m/2QyNhOYV8BxlCSm/dNwXJPvPL7A3NKy1uVbjHM=
X-Received: by 2002:a05:600c:6305:b0:49d:2803:22fe with SMTP id 5b1f17b1804b1-49d28032d49mr18957815e9.32.1789021864481;
        Wed, 09 Sep 2026 23:31:04 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26bfdb4asm47441825e9.11.2026.09.09.23.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:31:02 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] HID: quiet the keyboard on the Lenovo Yoga Slim 7x Gen 11
Date: Thu, 10 Sep 2026 08:30:49 +0200
Message-ID: <20260910063051.4556-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two small fixes for the ITE keyboard controller (048d:83db) on the
Lenovo Yoga Slim 7x Gen 11, a Snapdragon X2 Elite (Glymur) laptop.

Patch 1 stops i2c-hid waiting a full second for a reset acknowledgement
this controller never sends, on every probe and every resume.

Patch 2 drops the Wireless Radio Controls collection the same
controller declares but never reports through.  The airplane mode key
is wired to the embedded controller instead, so userspace currently
sees two KEY_RFKILL sources of which only one ever fires.

The two are independent in effect but not in ordering: patch 2 uses the
device ID that patch 1 adds to hid-ids.h.

Changes in v2:
- Send both patches as an ordered series.  v1 was patch 2 alone, which
  does not build on its own -- it references
  I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_G11_KEYBOARD, and the #define
  for it lives in patch 1.  The kernel test robot reported this twice:
    https://lore.kernel.org/oe-kbuild-all/202609092332.pk1AmDaL-lkp@intel.com/
    https://lore.kernel.org/oe-kbuild-all/202609100719.bu2saXPQ-lkp@intel.com/
  No code changed; only the split and the ordering.
- Link to v1: https://lore.kernel.org/all/20260908091907.5653-1-okerixx@gmail.com/

Oleg Keri (2):
  HID: i2c-hid: add reset quirk for Lenovo Yoga Slim 7x Gen 11 keyboard
  HID: lenovo: suppress phantom radio control input on Yoga Slim 7x Gen 11

 drivers/hid/hid-ids.h              |  1 +
 drivers/hid/hid-lenovo.c           | 14 ++++++++++++++
 drivers/hid/i2c-hid/i2c-hid-core.c |  2 ++
 3 files changed, 17 insertions(+)

-- 
2.55.0


base-commit: df2908090cda368b01ff43709f51890076c56157
