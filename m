Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529238;
	b=o3SXv+bLQJedXWBSaEm/qHSaPAS5BWJopNWsISqIh9Z0vQlpA2z0EhTm1EyEUSUghMMR
	 sFzqxixp8E25wYjPUQeEpjtPd8lUxGpTYTJCsI0Pi0dpoDSBvebTZkNnOD4/9MkCL3v2o
	 TeYU88jyJQUCnSP5GDIIy9RBV+M6vPS+fteYcwu7Ba/3cIoAXOUP5NVMKSQLVcUP6RuFH
	 MValu+i8Wxpt72zstfpE4N4RJ5JX4C0gQXQFVJ2QVuxnJomalXBIQ6kt0RVr4pMCIbWdM
	 epqylnrbCsjslItxPmGT1gK97uhvzzDwJYIOgp8NREfw9lG9UGBIkXOsgfBNY/2h3+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wLXAznyXf5bvUPPsBhe29Ol3AZfJStrp85inSZMO8Ek=;
	b=qNZ/8ifQeU2KlQURDU/65zxVfO7mWYZ/ASbB05BLogw5y8pJaXeTSbWksKUsJAJsO39l
	 /UR3tzdDGTBINi8DjwkLJ+0sOe3qH1EgyvK9fe+hM5N/BfE2rdiz8/7BD8AyQU4kPvfSj
	 g2ViQHMZCSuj4cBXROe+/X/D/Sb/YCo5yoDJHPylenjsXMoNo3ebxrVE9sOV7GTU/xxHr
	 OGQeEshSanWCSgOHFYo72aQgwq4BOHH+wyRhwFgKo0JnQbdxvvI9aQyJQPSJyjtodV+bX
	 WNIjgnguHo7YwG3QKJvD12RCyx+oXIb0dTiaNuB08RSkz15SCnU1ojhsDltLILyRBkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aBcRi42V;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FD7606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78FD7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aBcRi42V
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5363316fa0cso1125901cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792529236; x=1793134036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wLXAznyXf5bvUPPsBhe29Ol3AZfJStrp85inSZMO8Ek=;
        b=aBcRi42VccLC0FSQyV5iMgpQx+gf/aBVQY6MI2uhL0MM9YvylkDWb81C/ycc0SYiEX
         W5XjMaUco8LxmpzBTWZTMIp4K/JArrmtUaTo/EuiPU9U3cYD8nNXb2vREoDBpBYr6AkV
         QKnD/oZnivcZQq4AtYMZe3ILPfCR92zHoSD8hCeXioGqZywYywuvdYTt+LdzZb7tRunW
         slAV1xiKLIszreW9khlJzc5bmzETgKR83/NO+KQTYGnkWDSzev/9EMAl9Hy2WWbTKz2U
         JJ+mSgdBhnvpL8906B3oWXFb09MXiTCZHuH4Vj7fWLXiWfYlqFa5hdyT3FoK5865aNly
         A2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529236; x=1793134036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLXAznyXf5bvUPPsBhe29Ol3AZfJStrp85inSZMO8Ek=;
        b=jkAcDmQer1ui5evnpjVbP7MuPoeahyo9C1l9dL0EwlnvZ0lt+zCQ0P+EAV4/NRiK7J
         7itYxQXlHo6JOk9JgJfaUBJy7c34OW6IM2hlNRXH4vFfWsvX06T/ZkRuKGnh3nA6qtGP
         GrG68y8DVdnAoPZTTK/ivBwgIdSni5wcq5i3WCpuH9O9DXqO43XWq/0GoWQ/ZCYUIPP0
         ZDjNjJMBuAON3OE9aObkPie4bjiNOppdJLGNYpE9Pyl1CPR5YbCP7sf9EKJyygQWt8fi
         mAE3fBTk2qLd/jWXrpu09IQ3U8qMH70ljS7BpeAPKIhMoG0Tt2lJ6Xm6bZvMjdm2plv4
         iH+g==
X-Forwarded-Encrypted: i=1; AKwUvBwJ438uTmC7sbVzafY0eDpnVBgwcnQye9qQedD/An1uZclUhyIX6ZE9NsZJn/4JrQXwh/CkiPpD/Q4Lttc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ+8RPdUz+hRSGzkenYsEa6JeSy0ffkY4yywuqHr5ig4ltpAXg
	sbdYG92hovZnmbZ/4UAgjQRpiTQfTRGfN6grIkEHjOGc0mB1BDjm26or
X-Gm-Gg: AYBFou1PGEngXADXAucArv6O0MrU/p7d594TdQfi5CMBceHbsO4zC0A7Wd/ZHcoZxV+
	XzunjY/jr4bbsPOh2q3mcF36rdzH5RxyB8BVaIzQJrTqg8UYX9TrSHK9iVOUo9Bl/xwkEp/9gKa
	Q4ABRmapzvawEY+gSnK4Nf1Ie141CS0bWupfsGiMUAybfeCdQDubnrEjRZSiZaLSUeuhwmN2ZRS
	OxxVQ9r4q5O7pXbW62WoNZS60Utjjur2HiT0rbJx5VREo599T2zTUxzkIHQYQk5nAhvZQ7U1p87
	EZcL4n9mMkK5JikcsS8tB3/HHsbj0IqloI0bjLK2iIP1od0vwcOCb5raKRo7RiaqEmOlKinFvU/
	+4ihQYfe6KrP89gsSdcQ3NxUYGEanxfDhvRXba6Rj2cTW4gEYUvi+rvOp2/BoUxj3sawecQlSYr
	8IcYhTY1phKnnGBeKLAH15T/N8i6xCYCgfgWZqucbyikH7GXiyi+nF9h1TuboQw6sGJCym834W1
	cmw
X-Received: by 2002:a05:620a:3703:b0:93f:1dbf:6cfc with SMTP id af79cd13be357-93f57fb8621mr81012385a.36.1792529236372;
        Tue, 20 Oct 2026 13:47:16 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56c6f16dsm79336785a.4.2026.10.20.13.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:15 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v7 0/3] wifi: rtw88: channel switch in AP mode
Date: Tue, 20 Oct 2026 22:47:09 +0200
Message-ID: <20261020204712.3252023-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

An rtw88 AP cannot change its channel: the driver does not announce
channel switch support, so hostapd's CHAN_SWITCH is refused and the
only way is to tear the AP down. The series fixes the beacon download
the reserved page build makes twice, implements channel_switch_beacon
on top of the firmware's beacon page, and times the countdown
downloads from the TBTT so that every count goes out on the air.

Tested on an RTL8821CU, an RTL8822CU and an RTL8822BU (USB) with
hostapd 2.10 as AP: switches with counts 1 to 100, scans during a
countdown, hostapd stopped and started, the USB driver unbound and
bound and a firmware crash during a countdown, IBSS switches, a
station interface on the 8822CU associating while its AP counted
down, and Windows and Linux stations following the switches without a
re-association. The 8821CU and 8822CU set was run on a PROVE_LOCKING
kernel without a lockdep report.

Patch 3 was tested on the RTL8821CU with a build that delays every
second countdown download: with a 60 ms delay every count still goes
out (sniffed from a third machine), with 95 ms the delayed count
stays out and the next download follows at once; the AP finishes at
the same time in both cases, and a Windows station followed the
switches with counts 10 and 50 without a re-association. With the
start forced to either side of a TBTT, and with iperf3 traffic, the
counts matched the beacon timing in every run on the RTL8821CU and on
the RTL8822BU, the first on a PREEMPT_RT kernel, the second on a
preemptible one without RT, both with HZ=250. The patch 2 fix was
checked with a build that queues a TIM update right after every
countdown finish: the WARN came before the fix and not after it.
Patch 1 is unchanged since v6.

v7:
- new patch 3: the countdown downloads are timed from the TSF, 10 ms
  after each TBTT, so a download that runs late by less than a beacon
  interval still reaches the firmware before the next beacon; one
  later than that is followed by its successor at once. Ping-Ke's
  question on v6: with the absolute due time a late download and its
  successor could land in one beacon period and leave a count out of
  the air
- patch 3 takes a TBTT within the margin before the start as the one
  that sent the countdown template: a TBTT between the template
  download and the first TSF read made the stations see one count
  twice
- patch 2 keeps csa_vif until the beacon after the switch: a TIM
  update before it fetched one beacon past count 1 and hit the WARN
  in ieee80211_beacon_update_cntdwn()
- rebased on rtw-next

v6:
- the wiphy work patch of v5 is gone: the countdown work is an
  ieee80211 delayed work and csa_vif is driver state, both under the
  driver mutex, so rtw88 takes no wiphy lock anywhere (Ping-Ke)
- rtw_core_stop() cancels the countdown work and clears csa_vif, which
  covers the IPS path and the firmware recovery; the wiphy_lock() in
  the recovery work is gone (Ping-Ke)
- the BSS_CHANGED_BEACON path says why it starts the countdown, the
  replay after a hardware restart, and stops it when the beacon comes
  back without a switch announced (Ping-Ke)
- the downloads are paced from the first one with an absolute due
  time. Queued after each download, they drifted by about 10 ms per
  beacon interval on the ordered mac80211 workqueue; on a count of 50
  the AP switched half a second after its station had, and the
  station re-associated

v5:
- 2/3 is new: update_beacon_work becomes a wiphy work, so that it can
  look at the channel switch state under the wiphy lock; it checks
  RTW_FLAG_RUNNING instead of being cancelled in rtw_core_stop(), which
  runs without the wiphy lock on the IPS path (Ping-Ke); reverted in v6
- 3/3: rtw_fw_csa_active/start/stop() assert the wiphy lock (Ping-Ke);
  reverted in v6, they assert the driver mutex
- 3/3: hw_scan() takes the mutex with guard() (Ping-Ke)
- 3/3: a comment on the association download names the STA+AP
  combination it skips the download for (Ping-Ke)
- the whole set ran on a PROVE_LOCKING kernel without a lockdep report:
  switches with counts 1 to 100, hostapd stopped and restarted during
  a countdown, scans during a countdown, a firmware crash during a
  countdown, three stop/idle/start cycles, IBSS, 50 switches with a
  station attached, and on the RTL8822CU a station interface
  associating while the AP interface counted down

v4:
- 1/2: Reviewed-by from Luka
- 2/2: the countdown work is back in the device, initialised once,
  with csa_vif naming the interface; no interface iteration and no
  lookup through the reserved page any more (Ping-Ke)
- 2/2: the countdown is cancelled before a firmware recovery restarts
  the hardware, instead of guarding the work with flags (Ping-Ke)
- 2/2: the page download on association skips a running countdown,
  like the TIM update and the PG backup (Luka)
- 2/2: the scan refusal comes before the scan offload test, so that
  firmware without scan offload does not fall back to a software scan
  during a countdown (Luka)

v3:
- 1/2: the beacon out-pointer is initialised in the caller (Luka)
- 2/2: the countdown work lives in the interface, remove_interface
  cancels it unconditionally, the queue wrapper and the comments are
  gone (Ping-Ke)
- 2/2: the TIM update and the PG backup on set_key skip the page
  download while a switch is announced; every beacon fetch advances
  the countdown (Luka)
- 2/2: the commit message names the refused hardware scan (Ping-Ke)

v2:
- 2/2: a hardware scan is refused while a switch is announced
- the rtw89 mention is gone from the cover

Mehmet Fide (3):
  wifi: rtw88: download the beacon the reserved page was built with
  wifi: rtw88: support channel switch in AP mode
  wifi: rtw88: time the countdown downloads from the TBTT

 drivers/net/wireless/realtek/rtw88/fw.c       | 146 ++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/fw.h       |   4 +
 drivers/net/wireless/realtek/rtw88/mac80211.c |  39 ++++-
 drivers/net/wireless/realtek/rtw88/main.c     |   6 +-
 drivers/net/wireless/realtek/rtw88/main.h     |   3 +
 drivers/net/wireless/realtek/rtw88/reg.h      |   1 +
 6 files changed, 178 insertions(+), 21 deletions(-)


base-commit: 9b0be45d4d52fd223994e151f169743a97abd290
-- 
2.55.0

