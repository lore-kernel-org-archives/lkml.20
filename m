Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5BB314A98
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791954813; cv=none; b=SBBoTMTo/k7Zb8k9mjNPtcV0QgslAwLrKFBneRACgPRcHToWFdT+hH5ChlCTiwpfQY880rmqR/DeWSDY2yJp6WBcm631blxmCwkOnQC/2HnE84IJhJ2dR5hidhic1Sf7GEpbUwej4dYIH53/jCjc98YdufiuVX405J+9VEUlNP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791954813; c=relaxed/simple;
	bh=9L5+pPNFxNcJItTifh5cuhYQBN+IPdNZ/AlJN1nZVIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jbPx/lS3+uYYT6aB0xTu8lQ8Wv2id/qk6hsJRfhXeCczqTjNRo6WF5jXmZ0zaHoEfCnv9B84gxhclYJN0Mi8Vk6pifOY51wAvnpvy/vQID0n/6nFf8oPqHE7uqQzKsasLPH6ncOaUelSy9OmPcaDcYjVhRBOKGB38z0l50alY28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p8lRRtCc; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8lRRtCc"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so848978c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791954812; x=1792559612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o96Wr4ulgCtQjy9azqIV/+wX469kS4vlmKygYY/jVsM=;
        b=p8lRRtCcTSh1zh+t2rD3UabIvxVvyl5BxSq+vzZsYOywAW4lJ3z8fjt42MQzxCx4kF
         n98YcG0mgnnmdJ1hMN1rEwE2AcSShG0xQgvzWoVJvmu/J1gbgEt64+emHisupx1Wa/Px
         XK3CFAQzw9ywEjriPH8BbgMJKf93iCME2GRAfiP6OM2SwKDWGsNbfxrbT2yPLJhXZTYU
         NhXiAxXpS6QR3IAKaAVjU7k79Mdw3fZMMnvn6D29d0/YqmYDRGAH7Ekm4CcEmspbVLvw
         RTjA1nF87fByfeXPb9l5m5jDpDLCaMPKsyEc3CNBZ/yLQ/+tDOk2eaQL6DLiovPZQoNJ
         CVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791954812; x=1792559612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o96Wr4ulgCtQjy9azqIV/+wX469kS4vlmKygYY/jVsM=;
        b=Dim9Txc1kZZ4hlA29QiPVL26jjM7dwLJH8yXO9wPpdG8xZp3K4MG8gXqbgyJKfi7qY
         1S+EFn/PnsnHSdvUfLH4WU29Gnv6/ncu/sfq9ImQ2PaENR35nqdaVhO/UgLQtNycu3hP
         SdJW1WLy+q1xiuJNn+Az4Pr185qxp0ronYJTHI3Nh/Fgwl5PMLpESFuSLiPPbz+8Nnap
         qZPoFxVzGDiNvMfnmwQj9sDrALHh7fS0dAeRhClkJyrCe1eJCJQlwcQbcRPTHXWttWXE
         OIwKeHRyLVQA5/PAkAdUy3t+wLuz56IBxJ/Lt29qeujDEDyVQ1m7RlUmCIu6HPt8Rprw
         ivyg==
X-Forwarded-Encrypted: i=1; AKwUvBwOOD0q7I8aCU0VHsrljxzBakctcerLHvYEgnY62wsb3ZCl3la8i43yZAi91CzyZH4Efy6pCP5hGN2yj7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJarJb2hkD7in6nmYn995tUFClLJpC9iazPzD3QV6lsQdZS2BCq
	WQDFghn022yx+nOYB9YmISZjnqJo2ubU/BMiOcryPVG2iN0vr00lwLRP
X-Gm-Gg: AYBFou19RNfqlwJMDGJUxDKv7ER6WKMg8gajU18DnzB7CNrYRFJgpFDSCcFzpZpUfOo
	RNnIntU38UUNB/hTj4v1ji5VqKpklxWBzIEafVvm4FfppfacA5rjzAkniD3H3n6P+75/iVwMVYN
	24JYfA+7Se8EwQop8aLBLFcCzBDoYEYKvXPr5/l5cwYS8q+jiiXe3qR/4Zf8zM3PasBB+5roYPh
	R7LdZ9qOj8Sj8iWS8nRvjX+6qujyd2Sv19m02X76rGEpc/SiLEC7TZGV2P1xSSk1kCgqJWWC4rj
	m4InNjwH+Z0HcYvPeGm6/bORzhMmkbEEY98jBOGdIPPkKk4bL7/FfHSvhNI02Z2awOeOY354i6P
	i/tClzMkJuUpPWyYoqIWmzo9EPJZsMx+wrKoAuo10c3CKN2lYWhEjuJux7/8137Oo+Kx4/zNbwe
	2UCRlGgvgkAoHJ5oIJUu1ODm71Gz40EbnxByeXZLGqPUNEYf+sXj1C9ZOkh2HlQn3oJW/qek6Pc
	qOAhrrQm0T11gzOVPIRJtSB0UBylj1Qyn/zo4pV/e/Xpz31cuaoNwj4gYK4JuFHrHPMu0T7tQ==
X-Received: by 2002:a05:7022:295:20b0:151:6e80:baa9 with SMTP id a92af1059eb24-16a5e49fdaemr18617461c88.12.1791954811647;
        Tue, 13 Oct 2026 22:13:31 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:875a:117f:b9ea:5a08])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm51629125eec.21.2026.10.13.22.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 22:13:30 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Michael Zaidman <michael.zaidman@gmail.com>,
	Rishi Gupta <gupt21@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	David Barksdale <dbarksdale@uplogix.com>,
	Andrej Shadura <andrew@shadura.me>,
	Johannes Roith <johannes@gnu-linux.rocks>,
	linux-input@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] HID: hidraw: Encapsulate struct hidraw and make hidraw.h private
Date: Tue, 13 Oct 2026 22:13:20 -0700
Message-ID: <20261014051326.3784498-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up internal HID core and hidraw header boundaries.

First, internal HID core declarations and unused symbol exports are
moved out of include/linux/hid.h into a private drivers/hid/hid-core.h
header. Next, a hidraw_instance() accessor is introduced in
include/linux/hidraw.h so HID drivers that only need the hidraw minor
number for naming or debug logging no longer dereference struct hidraw
directly. After converting the drivers and dropping unused
linux/hidraw.h includes, hidraw.h is moved to drivers/hid/hidraw.h and
struct hidraw along with its internal buffer and list structures are
made private to drivers/hid/hidraw.c.

Dmitry Torokhov (5):
  HID: core: Move internal declarations and drop unused exports
  HID: hidraw: Introduce hidraw_instance() helper
  HID: Use hidraw_instance() in drivers
  HID: Drop unused linux/hidraw.h includes
  HID: hidraw: Make hidraw.h private to HID subsystem

 drivers/hid/Kconfig                     |  3 ++
 drivers/hid/hid-core.c                  |  7 ++--
 drivers/hid/hid-core.h                  | 20 +++++++++++
 drivers/hid/hid-cp2112.c                | 15 ++++----
 drivers/hid/hid-ft260.c                 |  2 +-
 drivers/hid/hid-input.c                 |  4 +--
 drivers/hid/hid-led.c                   | 10 ++++--
 drivers/hid/hid-mcp2200.c               |  1 -
 drivers/hid/hid-mcp2221.c               |  1 -
 drivers/hid/hid-quirks.c                |  1 +
 drivers/hid/hid-u2fzero.c               | 10 ++++--
 drivers/hid/hid-winwing.c               |  1 -
 drivers/hid/hidraw.c                    | 48 ++++++++++++++++++++++---
 {include/linux => drivers/hid}/hidraw.h | 32 +++--------------
 drivers/hid/usbhid/hid-core.c           |  1 -
 include/linux/hid.h                     |  8 -----
 net/bluetooth/hidp/core.c               |  1 -
 17 files changed, 100 insertions(+), 65 deletions(-)
 create mode 100644 drivers/hid/hid-core.h
 rename {include/linux => drivers/hid}/hidraw.h (58%)

-- 
2.56.0.385.gd3acb90ef8-goog
