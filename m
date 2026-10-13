Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4032C4A99D1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922544; cv=none; b=IP2FCcP+qt1jiSQjx5hvjwiqhKPajKvjdqT2F5+P8xd8jpd6JTniLyVgTb5W05zNAw29y/biG1odalsbdtCfv18spHEWl4rQw5bTHLYKNBxMM3+Eb2RioIqv7+yQ8l6K7qXfYrPSDwOe447hj2/DpyccV/rXnYVAK94UhOFkuOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922544; c=relaxed/simple;
	bh=sHpCU+9yAPTLoySTgFTRF4pweK+WQunMTURy5a3w1dw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gWQCJyoqetw2L8p9FeMNu5Lpedi0DVr+N/HrlwN+i+35cA8ePmkIK591l6E2gdUEC0n5pPYxRIYpxjfiAPCn+VDkHuSpkofv4ttG8T2BOr2hOuGeNk0Pu46+zh6Y7Ywyc2KOJQPKas646oYlpjZwIVhCtrNjkzKqCw3XjJfzUK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWFz1n2S; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWFz1n2S"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f84a55e31aso2060558a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922541; x=1792527341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VBBwqMR1fjyPGEzDUsocZhc9LoOhNGKbGIC+3VowAZY=;
        b=PWFz1n2SwIFhSn+UV+qrH3cf/TZhgT9EgQxZkXNxPy5ZhXkOMz72iQ+4WIP+ItYBSY
         ikO6OLwEFv3rt35ttVChD/H4NlDGjGcV6f1ltqsPUEyndm9x8/lfgjefpjRA4rF4kLtc
         tNkC8Hxq6o3Mr1paR/UgjMkoLEQ6D+Eo9eAG4iWIkp5iBa5CDXEjSBYAZh33UFDXtpay
         xvtuF+2VYrLbX7+Zt6TFCpPSSoK9x+qz+Def2cvrqrngABTMKxXJKWX6kgb0fDJWT7Ck
         l2pikFCgf0ZIIICyckb8+QXr2bTQSg2up6hHbGX/IxluQeLQTDDxXuUTmoPtOC+KkOfU
         5lSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922541; x=1792527341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBBwqMR1fjyPGEzDUsocZhc9LoOhNGKbGIC+3VowAZY=;
        b=CVkCZF0j7rHlAgOP64pT/Kf8qxux2GPpbrSXI9MrNipOcKDZdQ2bblNc5qYkDmSELo
         pJbsjGTFNjYeT89HjjpQZy820ocgLbje9852CmHuUx9jXAB5VPiV3H0JbfrlTUy/OVZn
         zYa1yUoh+NZSZX0NAuNRRcDxfO49BsywwUu9G+qE25rg5iduCsEfxzJc9leZBBz/tvOx
         wtkL4GNRDS4qtPOqjiceIWEd2cELK9bbXH02YwinrFmIeEUoSeny1Iqt3AVTdN82C/yY
         Qki/jE1tBZRxDwjk5NhxoCdZV2uTraJAD7tBTqwlPGehMcLwB6E59xDNOm+3+LtWupd1
         VoLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxw0j8trb4NpPxtaxpz4/I4o4AvV/O9NolhfXlrGGDCaVWvLDLaEscI0SFdMPFfr1ITwQzByzw2OgdzXMI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRstkIKPn81+yCsFSHX8MMMOfMhfMuVp2t5JdShXN5zXJhSPVZ
	mhfbrc/ZwySuDpdCvUQj4kNXdlNhI1cfp3QfI/ZxWpWUaThqv6c2QN9k
X-Gm-Gg: AYBFou0/OjdNC+ulway30AT7ri16AM+pfARqxeaOjdTDUUskLWBvlyYc5GNKgFpoySh
	TLp1PXJTUXZNygEGHMRjf34J/GrHmVBdhvizIvskwtsfiX7XMbYCClLtqhTwTKbW6c6CirBze0L
	fQPhfjp5/aA9gub3fRccpvu1iF8Yt2Y0l9jIlg/UQx75CPUvT7isvindD9x++hXxkr+eS305VZZ
	sIqPYKZ0GNcyhC35qRnOf0PGUCYjeJy/H59pnJ3yIRjAwLsR4GDEZiilHkhv9fpapWetCE4j+zJ
	6agsOUsMZO7EI43RAJwuHG2E4WmfCmq0ufFQ62QovCIE2Jg7ivJHGvK83h420tA5mjEySrLdtWP
	afc4oCLSD96sp9nn9gU5bVPAthCdA9XKPdyKFbdZGHmXCAyS8Pu6E7hfUz8658gyhImv4nlJibV
	TDhC+/iysK+/eBgHcTZVJhZVrwppLS0oIpMgBrbeMjynoSPgupxVJyF7dmajZ1QAvEBdyUZABxq
	mg=
X-Received: by 2002:a05:6830:3494:b0:805:cd51:568a with SMTP id 46e09a7af769-83090c23e37mr12339060a34.2.1791922540631;
        Tue, 13 Oct 2026 13:15:40 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13557570a34.11.2026.10.13.13.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:15:40 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH 00/10] staging: rtl8723bs: replace private 802.11 header macros with generic helpers
Date: Tue, 13 Oct 2026 15:15:28 -0500
Message-ID: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtl8723bs driver has its own set of macros and inline functions in
wifi.h for working with 802.11 frame headers. They access the header
through hardcoded byte offsets and pointer casts, and they duplicate
struct ieee80211_hdr and the helpers in <linux/ieee80211.h> that
mac80211, cfg80211 and other wireless drivers already use.

This series switches the driver over to the generic versions and
deletes the private ones from wifi.h. Each patch converts one group of
macros and removes their definitions once nothing uses them anymore,
so the driver builds after every patch.

  Patches 1 to 3 convert header address access and the Frame Control
  flag checks and updates.

  Patches 4 and 5 convert the frame type and subtype checks. Single
  comparisons use the ieee80211_is_*() helpers, and switch statements
  mask frame_control with IEEE80211_FCTL_* and use IEEE80211_STYPE_*
  case labels, the same way mac80211 does.

  Patch 6 removes an unused struct member. Its initialisers were the
  last users of a few private subtype constants that have no generic
  equivalent.

  Patch 7 converts the frame subtype setter and removes the private
  WIFI_* frame type enum.

  Patches 8 and 9 convert the Sequence Control, Duration/ID and QoS
  Control fields.

  Patch 10 replaces the driver's destination and source address
  helpers with ieee80211_get_DA() and ieee80211_get_SA().

None of this should change behaviour. In the few places where a
generic helper checks more than the code it replaces, or where the old
macro kept bits that a plain assignment would overwrite, the commit
message explains why the result is the same.

Compile tested with W=1 after each patch, and checked with checkpatch
and smatch. I don't have a device with this chip, so it has not been
tested on hardware.

Rishik Yechuri (10):
  staging: rtl8723bs: use struct ieee80211_hdr for header addresses
  staging: rtl8723bs: use ieee80211_has_*() to test frame control flags
  staging: rtl8723bs: set frame control flags with IEEE80211_FCTL_*
    masks
  staging: rtl8723bs: use ieee80211_is_*() for frame type tests
  staging: rtl8723bs: use IEEE80211_FCTL_* masks for frame type dispatch
  staging: rtl8723bs: remove unused num member from struct mlme_handler
  staging: rtl8723bs: use IEEE80211_FTYPE_* and IEEE80211_STYPE_* values
  staging: rtl8723bs: use struct ieee80211_hdr for seq_ctrl and
    duration_id
  staging: rtl8723bs: use IEEE80211_QOS_CTL_* masks for QoS control
  staging: rtl8723bs: use ieee80211_get_DA() and ieee80211_get_SA()

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 254 ++++++++---------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 134 ++++-----
 drivers/staging/rtl8723bs/core/rtw_security.c |  41 +--
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |   7 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  75 +++---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  42 +--
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |   9 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   3 +-
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   1 -
 drivers/staging/rtl8723bs/include/wifi.h      | 255 +-----------------
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  19 +-
 11 files changed, 319 insertions(+), 521 deletions(-)

-- 
2.43.0

