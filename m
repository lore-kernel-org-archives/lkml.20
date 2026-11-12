Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489264;
	b=2jYWFQEu0vnn8VI2ktYVUS2r7TLCXNDzFZEXHeTqXUsx/0Z3sfgZEELD/ZeAro4FJPoC
	 jajTgzZAVITQuzINQJmuvG4ni8QTsXv+iEps8Ga3VGo6WJMFFhySVQXIuxDVZ68M2rttF
	 LpB6zlt6XHLGtTJZPMEasbhYGYBYIGkangaZu3Tz0ZZnAN24UuPG4l11fjw40F0cjgMVJ
	 U4mfsC1BAe7Oxp7sw8OLShfwnUFFkiep7mAjaZq3PK5ph78cmSDhoGM5uiuLBnCbaoNWu
	 mL+oQUQrFD4706ppoHcUKUVZmyMNHYaLOLma1bUeFF4X7mnVmAXTBmJZdsdMRPub8OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YUIf9+mCMOGNl2geZMGhw0spSlF1/XyFQpN5bks8zug=;
	b=F3dT2yOWic6ZZN67v0SiDFnu5M8WDa7jyqkWV3nciVbQCarZu8Zd/gLVfZEyq3G44ZwE
	 3Wz1x0Hnjk4kPBe2OSG7xZjtcD14kBmEwVXRJOlbsXft3Ke/TrSiFqKM/VbYbKi+CQym0
	 qbSeCCRv0uAz/tTyjybNcJRrlALSERwuoMCvT3WBQU7rNdkwKYJdfBlmXK7ujhwFPlBfb
	 EavjpGUlqgwXE568Y0UOxXZFN1dwlpV7L/HyPyvjle+dS9LPYg4DjEAnN8POAtq/AORxJ
	 FQEBmxZL1PZ6imcr/d/kfNbCHMxs/w0yzKg2UAqJKJbXK6zT7gBIPITC4bo1u5yvulg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t3eiYG4L;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E74F606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E74F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t3eiYG4L
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-170135e43c7so2825697c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489262; x=1795094062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YUIf9+mCMOGNl2geZMGhw0spSlF1/XyFQpN5bks8zug=;
        b=t3eiYG4LkG/KbLSMetYxzqETR3GDnIQj9EIZGy1cPyVJSj43aoZ5FxQo4t2DKNSEMR
         lmHEsHvBtD8Q+evLwt42nBoAkE5XwOmGAfx6a+hp5a9KVqqMRhoZUo0bWWMqwODjztNy
         LQ+xuLP+7OlKFPEWlC9jJ8p45IDJlxuUo2+fDuVdeves1RyPyHR1ZxpEl9q4Bn6Idexy
         I4Y5+RWp0hqshUiAiwZhgaRfXG8HC2bf31d8lAF/6vOtRdsrLmehJFkfyB16SxNe8ep0
         v1jw98c7NuclXooSoLya11zaPff+bI71ArwR8SEP9yXm6wpSV+AieXCnuTmFkbGSAnU5
         8iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489262; x=1795094062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUIf9+mCMOGNl2geZMGhw0spSlF1/XyFQpN5bks8zug=;
        b=oPOdEDNgFIYlTIeRf5v/blTcb+K59UUZRyVcor4pVgJC5Uw1iwqKalZl9yjPfD+PYV
         k05S3GvOeIhTq5PRmtZlNi/7bHoptITyCQhUNzEaMLYULhIm3NvhFsfXehOCamj5aBIw
         LVD/FLsQ9eMqQOgpGmFmz/LPi6DX2PBbLFqpt41wcAQvZJNPcCmxE2fIyZOGlue7cIzS
         W3kQcGKsekSdGYYgfBXwLgcU0MDiAmY0cQiMncGyBpph3FMoy8YuiocbeCEZXpFhZ/nW
         1ggB7DerPn2oCOuZ3HILlPWuCPDW0whPs7UYIGXDuemGI4MhbEoNmuwMhI6HewJMwVGN
         fyaA==
X-Forwarded-Encrypted: i=1; AL+hErEukofaxmt4bmpuM8YuNho/if4N0rJOqIztaafde/JOtvOgwA2PClUDX4hFvZnljvAot5436R9FpdToRPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z94AZLqWeF57spQ515qmsrm2iUiX+To96niqHhkUT2Qv2UIRQGm
	BtUV4+hhlilFG0IQ5h9E0NPHsfXmdkjp9nVnAonkBX2acbcA34DliNz/
X-Gm-Gg: AYBFou1dnbqPIz/dedWZ+qOaILSS9ZvQRmJPKIpQJVEC0oQZ59lycYOxpY7csIg0xeQ
	y+Hmv6a2Kz/XzHpUq7g7DtIIzH3Gaej/ZzyHv/o+3iooV7EwTAbZ+Ge+oJbkuZF3bumSM6viAYx
	5kJSIDGTKEwceS4kcZvp+P9NS6nl2DrEfxARDWrRsQnqYrbjap9yNF0/il7KfI7qSDQTZ0I/sCx
	PYUxsAhCppjuibp1D/vxo3r6uxie5s1hrTmCyw9blPYb+iym7Jvl7ZmvgyUEQZmNN0A5DkvX86o
	W9xhpGHSPQgVxpe7/r3EDVxD14roceUd5h5zkb3c+nD3dONmJCx5ss/ycMtD2gjuTMaXMTA4Vfw
	MijojSNTs0mcEt11h2kYqmJLWGsbzEKmmsqnpv84Z7gdcIqLrmmEPkgbhOMzoAbsGoeoA5iKmC3
	zIc3EQ0LDI//CuyB7rY2YYHrLVOForbEbK/6/l8uPohkvhcrWCv3zA/8l8Xr3SisNCnL+G1AYYx
	0SSTUXqhOJ2yXAJPZbVRZ7R5M8muZqtQCy01HSZc9JkK670JbMs5WzJTCZ7tliNvWtlral0TNA8
	C+XzxJ44sUYin1AKEpJj1w==
X-Received: by 2002:a05:7022:170a:b0:1b3:b3de:9232 with SMTP id a92af1059eb24-1b3c02f06bdmr4731155c88.9.1794489262258;
        Thu, 12 Nov 2026 05:14:22 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::1c5:160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b48a9c34c9sm8985969c88.4.2026.11.12.05.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:14:21 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v5 0/3] wifi: rtw88: firmware recovery fixes and LPS hang handling
Date: Thu, 12 Nov 2026 18:43:58 +0530
Message-ID: <20261112131401.236433-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses firmware recovery robustness and LPS hang handling
in rtw88 based on review feedback from Luka Gejak and Ping-Ke Shih.

Patch 1/2 from the v2 series (DMI quirk for HP Laptop 15s-fr5xxx) was
already applied to rtw-next. The previous LPS leave recovery patch was
dropped from rtw-next by Ping-Ke Shih for respin.

This series splits the recovery fixes into three focused patches:

1. Patch 1/3: Clear RTW_FLAG_RESTARTING on stop and start failure.
   mac80211's drv_stop() skips local->ops->stop() when local->started
   is false (such as after a failed drv_start()). If rtw_core_start()
   fails during restart, clearing the flag only in rtw_ops_stop() left
   it permanently set. We now clear RTW_FLAG_RESTARTING in both
   rtw_ops_stop() and in rtw_ops_start() upon rtw_core_start() failure.

2. Patch 2/3: Skip already reset station in rtw_sta_remove().
   During station disconnect (e.g., ieee80211_set_disassoc()), mac80211
   leaves LPS before removing the AP station. If recovery is triggered by
   LPS leave failure, __fw_recovery_work() removes all stations via
   rtw_reset_sta_iter(). When mac80211 subsequently calls
   rtw_ops_sta_remove(), rtw_sta_remove() ran a second time, resulting in
   a double free of si->mask and underflow of rtwdev->sta_cnt. We check
   si->vif at entry and clear si->vif and si->mask upon removal.

3. Patch 3/3: Trigger firmware recovery only after consecutive LPS leave
   failures on PCI.
   Restricts recovery to PCI devices (rtw_hci_type == RTW_HCI_TYPE_PCIE)
   because USB (usb_control_msg()) and SDIO (sdio_claim_host()) sleep,
   which triggers a "scheduling while atomic" panic under
   local->key_lock during key clearing in __fw_recovery_work(). Retains
   rtw_fw_dump_dbg_info() on the first failure (guarded by RTW_DBG_FW),
   and requires 3 consecutive timeouts (RTW_PS_HANG_MAX_CNT) before
   triggering hardware recovery. Gated on FW_FEATURE_LPS_C2H because
   legacy chips clear REG_TCR on failure which masks stuck firmware from
   accumulating consecutive timeouts. ps_hang_cnt is reset on success
   and in rtw_core_start().

Changes in v5:
- In patch 3/3:
  - Drop redundant rtw_hci_type check in rtw_fw_recovery(); the check in
    rtw_fw_leave_lps_check() and the existing PCI-only callers already
    guarantee non-PCI devices never invoke recovery.
  - Only increment ps_hang_cnt and trigger recovery when the firmware
    supports FW_FEATURE_LPS_C2H. On legacy chipsets without C2H support,
    clearing REG_TCR on failure causes subsequent register checks to pass
    immediately, resetting the counter and preventing stuck firmware
    from ever reaching the threshold.

Changes in v4:
- In patch 1/3: Also clear RTW_FLAG_RESTARTING in rtw_ops_start() if
  rtw_core_start() fails.
- Add patch 2/3: Prevent double free and sta_cnt underflow in
  rtw_sta_remove() when recovery races with station disconnect.
- In patch 3/3:
  - Keep rtw_fw_dump_dbg_info() in place on first failure.
  - Restrict firmware recovery invocation to PCIe devices to prevent
    scheduling while atomic panic on USB and SDIO.
  - Explicitly check rtw_hci_type() in rtw_fw_recovery().

Changes in v3:
- Note: v2 patch 1/2 (DMI quirk) is already applied in rtw-next.
- Add patch 1/2 to clear RTW_FLAG_RESTARTING in rtw_ops_stop()
  with Fixes tag.
- In patch 2/2:
  - Count consecutive failures before triggering recovery
    (RTW_PS_HANG_MAX_CNT = 3).
  - Reset ps_hang_cnt on successful LPS leave and in rtw_core_start().
  - Suppress raw register dump on transient failures to avoid log spam.

Changes in v2:
- Rebase on top of rtw-next.

Kalpesh Solanki (3):
  wifi: rtw88: clear RTW_FLAG_RESTARTING on stop and start failure
  wifi: rtw88: skip already reset station in rtw_sta_remove()
  wifi: rtw88: ps: trigger firmware recovery only after consecutive LPS
    leave failures on PCI

 drivers/net/wireless/realtek/rtw88/mac80211.c | 3 +++
 drivers/net/wireless/realtek/rtw88/main.c     | 7 +++++++
 drivers/net/wireless/realtek/rtw88/main.h     | 1 +
 drivers/net/wireless/realtek/rtw88/ps.c       | 9 +++++++++
 drivers/net/wireless/realtek/rtw88/ps.h       | 1 +
 5 files changed, 21 insertions(+)

-- 
2.53.0

