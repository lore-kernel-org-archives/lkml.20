Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886141FCFFC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792190524; cv=none; b=ZuIbqUhJyFoaHHcwdpWDD6wISHno9DSgd61iLb0o5l5u55vuu6yIszhIoVsW0gPyIpLbzBA59yuncDqTwOkw5DdLS06yRZz6Zbt6lfEDxb3o9JoOJyHO9N2PVjlCA9JYSxVAiIkwh2fjryjQIQRdOAetepUjFkslth8PD7Nhq+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792190524; c=relaxed/simple;
	bh=26nYS9F98fpOF3WKkmoBuNLTRswB/xYDkQKsGGXLWZ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HZtWDRH+yfOE2mH7QbPpF2H/9W5FbVOMKIndt0gdErMulHuR13+cWzfWZZwcGSPb02/iZDzF6QOQSHeN4x/klItuwLg74hVRNFEQ7BkG2BCYStfNiCLWftbpK27g48XwvrWckIVSxw+jXdLORJ2JFPp9ugfRRUOatvSxX6rW6BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTbCKXKr; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTbCKXKr"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35c76e9614aso448755eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792190522; x=1792795322; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eHvg8UIlEplOtldiPLGiOMZ7Z9btapBeKpPyh1admsw=;
        b=UTbCKXKrU2Ge/iQ7ppxqcpgxRayMmgIYwSc7KTT3+ykQ883oBg0NAaLg6WTNvjo8lP
         4SX+SdUwVkJm5Y92gxXbj+tfdVg2YHm7nwnyB6bRN18QgvMwG+omDl7k2j8+X+zyNX5d
         S/OtdGCsfwnq6lMqIRpdJkSuxyIepa5mtePxRywNDomGWd7c14pEIbx/231g0mjebzHs
         S/8Wt1b7GclokeQKZpdVGVq9LIWB6LCXozAaxODRBZ/26YTVPtSbDPsZrRuA/L3UR7SP
         zg0dg+J+W+m1WDeA/TJUzQwI5KEpxZWT+mbUi0+8rQzJlUfTT2X1W4fzXEDl4nCAkv3B
         mf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792190522; x=1792795322;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eHvg8UIlEplOtldiPLGiOMZ7Z9btapBeKpPyh1admsw=;
        b=tKzVphZqiDk5SajvOAL5WWIvPaarKp/bsV6+oP26N4H3t5pmgZpAoo3qH+BYTHWGZw
         LphffTIBGa80B6OQHz0RGGo5MsI+sAdJp7tfuppYHfJaTIu158Je1CZVNPttR09OsUTn
         aIE4HDe6hXud4/BkIycA4D56hu04bvPbavMlHi21xelNfomYYnFr2/iVI3xTmoxG2OH8
         LuHxlUz90WAZDKYjnMxDQ1ivbA9oO/ZKxvlZ7W4oRrcTWNKfRfFytTVJgH7Sc5C42dLn
         bWwIrGTl2MsP1pC+rQxuWdqFZ+wqIlFOuuH7k3z8d1cyp3tYGvOKadHAsXHtR+8KYF5S
         wwvw==
X-Forwarded-Encrypted: i=1; AKwUvBzOxcyquQcTbiiLkXqCADQ2th7V0JvMrYGsSmQ9899E4kD3a7mV2XZl5HwtaRCeIuiPMDeZq/Qn61v4a7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7ZRcu+NJDM2azT2X234fcwFh6zuVXd5R+cThlPcaI20Bvsrid
	DlqIUXWIi21XAsu4bjiIaiz6hYkLcs2i1jip4Omxiq7rP1cRem9snTyI
X-Gm-Gg: AYBFou1CX1AE+DoUmCwLenA5frY+qbzTiz6VyK9SfIxo9b4rTYZMKnA/uOzd18qChuK
	WmIKoHFyJ8gFryYMZB0IRFXaPImxYdo3feaqyWKd/aFKOzUQXbH/oLKQC5hpWPCxU/O8OpWERtQ
	NrFRZnrfghThFdS8nz4wrYwcifcmDG/RCMzdCuH5hnlCGHZuje2o2/5xRSbkhVF34zU6x6aev8S
	kosVw/+QcfStyGn7slFglR6Zx0oB0wXQuXHBIsCl1b/tWyFL5K0TSXQbPdJD8nLWkaJbYEKoIhl
	9CAfhi/E45siOyB90QUKpSy1VorQ1/ExdFxMmvgrqAgcy+Z7GRnfPtSXob9eKwRKGoFsGgBcZg7
	F6rBegl5S6hKyslwkd67N4u8hdi7U0lbDdgiuUHTDu4Xvujk8nuLY6mpYGeUdgzBrNZr4xcYXGE
	76Z1EQmzEEesGqEweF+LdLKSfw1opFiFgiqkM0qJ6tlyK0RptanQeoXK2nN16VIWnKsY2pB6Qdj
	0GqdOXhwW+DrDJbbPCXaDiJpxSTy+nLU/6tlobC/qRQM108ZuKPcgHEZSACguU=
X-Received: by 2002:a05:701b:290e:b0:14e:8d1:1012 with SMTP id a92af1059eb24-18512b3e51emr1424452c88.19.1792190521476;
        Fri, 16 Oct 2026 15:42:01 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:34f0:f27d:9a5d:56e0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm8252348c88.21.2026.10.16.15.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:42:00 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/5] HID: hidraw: Encapsulate struct hidraw and make
 hidraw.h private
Date: Fri, 16 Oct 2026 15:41:47 -0700
Message-Id: <20261016-test-hidraw-base-v2-0-153f67a20cad@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuo0moC/z2NQQ6CMBQFr0K6toSWUoGV9zAsSvnQr0JNW1FCu
 LsFE5eTzJu3Eg8OwZM6WYmDGT3aKQI/JUQbNQ1AsYtMeMYly5igAXygBjun3rRVHmhfyaIXspC
 6UiTOng56/BzJa/Nj/2pvoMPe2Q2DPli3HJ8z271/PitYzmWan0shqpIy2o0Y3JJG396NnS/Dq
 PCRajuSZtu2L5Uc/7y/AAAA
X-Change-ID: 20261014-test-hidraw-base-f965f4656c9a
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Michael Zaidman <michael.zaidman@gmail.com>, Rishi Gupta <gupt21@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Andrej Shadura <andrew@shadura.me>, 
 Johannes Roith <johannes@gnu-linux.rocks>, linux-input@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

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

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v2:
- Rebased onto latest linux-next (next-20261016) / hid.git for-next
- Updated hidinput_connect() declaration in drivers/hid/hid-core.h in
  patch 1/5 to use unsigned int connect_mask instead of unsigned int
  force to match upstream changes
- Link to v1: https://patch.msgid.link/20261014051326.3784498-1-dmitry.torokhov@gmail.com

---
Dmitry Torokhov (5):
      HID: core: Move internal declarations and drop unused exports
      HID: hidraw: Introduce hidraw_instance() helper
      HID: Use hidraw_instance() in drivers
      HID: Drop unused linux/hidraw.h includes
      HID: hidraw: Make hidraw.h private to HID subsystem

 drivers/hid/Kconfig                     |  3 +++
 drivers/hid/hid-core.c                  |  7 +++--
 drivers/hid/hid-core.h                  | 20 ++++++++++++++
 drivers/hid/hid-cp2112.c                | 15 ++++++-----
 drivers/hid/hid-ft260.c                 |  2 +-
 drivers/hid/hid-input.c                 |  4 +--
 drivers/hid/hid-led.c                   | 10 ++++---
 drivers/hid/hid-mcp2200.c               |  1 -
 drivers/hid/hid-mcp2221.c               |  1 -
 drivers/hid/hid-quirks.c                |  1 +
 drivers/hid/hid-u2fzero.c               | 10 ++++---
 drivers/hid/hid-winwing.c               |  1 -
 drivers/hid/hidraw.c                    | 48 ++++++++++++++++++++++++++++++---
 {include/linux => drivers/hid}/hidraw.h | 32 +++-------------------
 drivers/hid/usbhid/hid-core.c           |  1 -
 include/linux/hid.h                     |  8 ------
 net/bluetooth/hidp/core.c               |  1 -
 17 files changed, 100 insertions(+), 65 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261014-test-hidraw-base-f965f4656c9a

Thanks.

-- 
Dmitry

