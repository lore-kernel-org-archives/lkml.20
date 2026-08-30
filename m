Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2192628FFF6
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101827; cv=none; b=rgEQfJhJ2PevbBiqgVAa0TKXT9Z+ushvcYOFh53QED+USiffq3kuwFqkiEAa1uqNOmhCpYBoRUDdl4P8Dd9e/Rfy1l1ybYyi2L002UDPFWWz/1FxaGtc6XlA03MAMhV/C6iUNzV94qtNo6t2hINEX774gdPh22FfTnlc5PUU+MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101827; c=relaxed/simple;
	bh=ElOep6Q511QqyK1vIuJj37kvGcJrYgB7TO+GSLod8mk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h5TEjPDMHRo00pCSZrFeQQXYCDZ7ZlHkZ7K2AnD97SpmkBwKkkBmFZideK1VswoIP16gxI9j53r73k+PTbCgWnY2fQPELA8gRlZTSrBgz67thPKCth2oxu8EyUNRyUg0LdzqPMuRLUb4WA5HPUDQJ54toHHR7Iru87562nra6XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak4XSqeU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak4XSqeU"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ccf2360620so21042085ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788101825; x=1788706625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nVoZIJSPavkafr5vhVqrFtwPK/92We/pHsNwwCc3U2I=;
        b=Ak4XSqeUWrTkgCem9MleQxthyWReAWw6rgWrNIUF0pwn2nwHP1E4FGoBwN7jq22XzH
         cuSDzvgNGlIDQW/hQ5z4eEP5QkRUbdeD9IJ/4kuC60l1WyrHAZmbFxiGJq6n2ruR/Vfy
         lLihsXRrdiYW8gO5LQqypDbBnuKhSet4ZPaB6+G5cANxBQXu2pCN6PhBKsJUKEB1ABne
         Jg17mxi4rZHMaoo77go9zJOj9d/nQyrD2ujNdb9ayjMxtOzR3Pvac5ETG4f1CRG3hC4K
         8c/pmyRSqxHjY9ir0pv2mWl5o2BTJI34oRu15ILr2ZWMCT25r7qt34C6f6a9W2VjR/q7
         i9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788101825; x=1788706625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVoZIJSPavkafr5vhVqrFtwPK/92We/pHsNwwCc3U2I=;
        b=afLIO4RPq0Hi0PU6vaYGccT8IePDqSuDWw/4+6+WeQvu9JQ47bkpoUETwMLd1mjnBa
         bj4TTJk/ZnFieubOguwz3gYHhvL3u7aLVnwhISiTFwJeSWkvb8TsgcyedBYd6+CiY6R4
         pQenPOWC+wENSvTBm17+zC90tHgvl0kfy/DJacJELHplV6olYNIo8cmlzYjQ80abrakc
         /EXwHiZCvHF6vgddYvKLTbzC2XjtpBdTBq80tQykQA6RIsATUA/7Cybbgs1Mo7yEdOU0
         ce9z2cfRvzF4inzaIECuWJ+7HjdL55WF3KPkVVJcCTmg5pYR568kRF55WEAh13nYkcA6
         68PA==
X-Forwarded-Encrypted: i=1; AKwUvBwYYw/NqF7tt6yJGndojnXMvCcWF2466FUBVU+arkNRNMWig6rlxu2rmbx7+r1Us3oLov2xrQaKgASLmxU=@vger.kernel.org
X-Gm-Message-State: AFuF++l87ceLr23hvw7gpxgU/Wpuwgitq4wqGELK/LTO6MVwdITSGN9/
	L5i/Kxv6Nx/161YM3t6J4JMlyPnCbafm0OD1sueyRR+9T0fUKj1wjreY
X-Gm-Gg: AR+sD106ZTyCbpTs67S//ZSHpIKLxQ24NuLgjHgh/9bLEpLr8xaWs+amWzKtlhERx3V
	C5OJr17AYtyMCRy537lvD6wBmkp6ez7jCPWbhRnTA7YjBAm56QGnWM94azBuzy315lYgJ5aFB6J
	waC3F93npoUDa1EzS6MvaMt4PIeLhXtRqfPi3CXgzaCndvjxSdo/ElvPa/L51bwDkouNdUxTzui
	/p1eb5SkwcnuLsrOmILQ3UUcWDB8GNdZJyKxCpWui6Y/t2HNcp8lRZE9L16qPn05sRfutgE05Uc
	fxGreSH5ynxnmAPZGJlIuX5FDA2uJ+yRgtNwKCyZw0vhr3KV1SoEFY9ZuJZrrlV8aU9qv6Xddww
	6n6cEnMTytNUXegE9LCEXwLjVCXQCopzBQ1XLu+oGInXpKdP106sd65ina1pUD+4aukJWJpmSgM
	yk+D7NJsNyAZ5uabj71VVY0lGoD2JcSRSU0qdLt9EOeWtHyAzdtVc1C3mbvLASUYDNf2+lvqodl
	jFIV1W8bgQII1fF57aP
X-Received: by 2002:a17:903:1a30:b0:2d8:d4ce:9f32 with SMTP id d9443c01a7336-2d8d4cea3demr176901435ad.16.1788101825349;
        Sun, 30 Aug 2026 07:57:05 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f959575sm23198024eec.15.2026.08.30.07.57.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 07:57:04 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] HID: hid-lenovo-go: fix controller configuration
Date: Sun, 30 Aug 2026 20:26:52 +0530
Message-ID: <cover.1788096666.git.mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes several issues in the controller configuration and
calibration paths in hid-lenovo-go.

1/6 fixes the calibration attributes, where the command and sub-command
are swapped. 2/6 fixes two right-controller attributes: imu_enabled
selects the bypass feature, and reset targets the left controller.

Before 3/6, any decoded configuration reply completes the shared
completion. The driver then ignores the result of the wait, so an
unrelated reply, a firmware error, an interrupted wait, or a timeout can
still be reported as success.

3/6 tracks one pending request in the driver data and matches replies by
command ID, command, sub-command, and device. It also returns request
errors to the caller.

The firmware has no sequence number, so a late reply with the same tuple
can still match a newer request.

The remaining patches fix calibration status handling.

The calibration status table defines 0x00 as unknown, 0x01 as success,
and 0x02 as failure. A Legion Go 1 returned 0x08 after a Stop was sent
while no calibration was active. The driver stores the raw value as a
status-text index, so a later read returns -EINVAL.

4/6 preserves the defined values and maps larger status values to
failure.

5/6 rejects 'unknown' as an action. The action table contains it at index
zero, but the options attribute advertises only 'start' and 'stop'.

A previous result can also hide a new calibration attempt:

failure -> start -> failure

The status appears unchanged for the whole operation. 6/6 clears the
selected status to unknown before submitting a Start. Stop leaves the
status unchanged.

---
Changes in v2:
- Drop the FPS DPI patch; the existing request is correct.
- Drop the v1 Boolean calibration-result mapping. Preserve values 0x00
  through 0x02 and map only larger failure values.
- Move the existing pending command state into the driver data and
  initialize it in cfg_probe().
- Use scoped IRQ-save guards and validate the report size and ID together.
- Drop the v1 no-wait calibration path. Correct requests receive their
  matching SET replies within the existing 50 ms timeout.
- Reject 'unknown' and clear only the selected status on Start.

v1: https://lore.kernel.org/all/20260821214810.87826-1-mradityadash@gmail.com/


Aditya Dash (6):
  HID: hid-lenovo-go: use the correct calibration commands
  HID: hid-lenovo-go: use the right controller selectors
  HID: hid-lenovo-go: return configuration request errors
  HID: hid-lenovo-go: normalize calibration failure status
  HID: hid-lenovo-go: reject unknown calibration action
  HID: hid-lenovo-go: clear calibration status on start

 drivers/hid/hid-lenovo-go.c | 179 +++++++++++++++++++++++++++---------
 1 file changed, 136 insertions(+), 43 deletions(-)


base-commit: 1292bca0f8d835d2ad96d309595b2e97f3106d3d
-- 
2.55.0

