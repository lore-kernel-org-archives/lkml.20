Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583147;
	b=RGqsVa/1LLZA8FU1M5+hV+RFjU+D9eMPF2gmMyrQz2DSIbd/4PauTCjd1il4H0s8Qpv4
	 UvZ8YmcyJfMYRMrM+rgZZxcqe3XYcCXqqii4viC+BKfRZJ6sEglVuKNAt7bhmjee6HjZw
	 rYw2gfq7Rexj83agFi2vUC7gXR8Pavz+dMurQO1LH7iofVXQCjwFlCXd15pq8UHN+C4Q1
	 2sDrqsNGPxM7LTQPHDGsNuyo4ENl0FM1GZPfMtz9oQwMNj5Oc895l9gTmtJcImZwlD7/P
	 SUywInAn0onOGhrdGxi68hRf1Nj1CtjF+iuY9U1OtVQfDVndCfwLSVOfxrf3F9XN7vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FHbThYz167MEuXs9w/+Hau2h5HTGZ7DYbXa22SkueE8=;
	b=lFJMpAqFO3taMfQm/U5bLNDzyhUQhTSr1NbLbXim8AnWHeF/wRjWtARPFwuwB6CJPCkB
	 /y6Z0UlRMLICJaPcyYk4uqKjCAdo2L3zdoL4KpKMkIdU6BYVdmk93Td0LM1rMTqgwxKri
	 5c89keDXxmOTOcfbsroZYyqBuUYH5q351IlSCSSpDqeNDRz+ZAPkmn7MYokHqPmg7n3dL
	 4t1hxxdQ1gUEkYWDqZLl2ly0NvCIP2Kr3wiVJ/geV0qzNoDimYN7pYE7fIP4l84SjZiq7
	 n2iZkzgdG1uBYoW5WQZT8cn2mF/o9fbbnvHrolegTvczBrNvShrW3t3RAomcuCOrHxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oSuZqhOH;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88A4606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A88A4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oSuZqhOH
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so549353f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792583145; x=1793187945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHbThYz167MEuXs9w/+Hau2h5HTGZ7DYbXa22SkueE8=;
        b=oSuZqhOH51CC/JiGAn5+S/PWA8RvzyyWo7+NvEPVpENg5NgughMt+lIDDK9vQEz7Py
         VlKYmVH2trCc8oeMdC862cXgVcX9dL9MoKx2St78mxsoRHlqhGjrqaBn1uuTW6XeStQx
         xbxPQAYhWwhPAbNJfvaF6X3cmyStd7XG1HiiDPdoMy66Z2PV/rwDRrWLDbrXAJhqgEk9
         uzWp5kmNRFyLA5q4mt6MGfdihtoO6aIzFYUzPpdoyZOiCGzGmN70ae+jFYQW30o3ygim
         KuaXW1hdgc5XQhkE2Qbawq/3iXtG4gGT558+Pfh0+oIdRG/CG1p4VRg8xUt92tsQJ/Vk
         XOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583145; x=1793187945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHbThYz167MEuXs9w/+Hau2h5HTGZ7DYbXa22SkueE8=;
        b=V/IKW9PdKap3mP8ro/H7h4pus/NLoG8bSzTEjjThbV9XUGfeK108TUo+oCEN5TiPZi
         z8goi/lE/TV6YNZ6/wL8Cfahv0L/wlKPZ1/iCb/kEo8YqKOgqT/WmXIXV0l6j4wf8Nu1
         fU4B5ol0mNEJrPjotYjRf/tjYacNTnB1F/HGd/Bg5fWPGJ6vtMjifhW2WPdar0CYKFjE
         h+ZI6opS/paukFC0sR5ZjAKN/jUq69VFKyVIM6te8bFll1taukFgIy6lHGOb0zYjjS5F
         wYyDeqP5XqOXSsFRgCVgrJcO64BvDAdT+JeJ8foMv4m61qjpLhTYUX+jyPSXvvbBXJ3e
         QCgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvhEKz6qulhv55tfnIPau1kus+NzgYb+PVkkT4NIsrMuhFBugeoNqTyVhx2QrIG73bXSXkcD0RvvR4M+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgl9A0NoZMPNoZM4opEtCBUUJlfkGZ0iwfpgIXeslqiqJCRjYu
	WoUrRc9SiLwjnNFudzCFyEmpO4BB2XFcu5JMqHH3V0zrkPZ/EQxIWH9L
X-Gm-Gg: AYBFou1FGQ7fbXp9WpyooRt1L8/thO0nJlm64+9wiu4tVbGR2jwzYdJcIdwV7hKuw8C
	WltfMxN2IoN5z6F8Ouk3nN/9DlucHYckJhgefLyIcoXcH010ran2EUOkL2ChHwpgnK5YVNQdNpt
	TTkQgb3zU1FRxqU+kMb6Gbn5Jn73NTZjlwd/UcnG5Mly21tmCVCWlmofrIUaVWZW0pU0cEkDlld
	mD78bD11rtvJJiNPDXD49Gp95v++Lw/Yvv4oHg7S9K7cGL1JZaZNqQlI/HuLS/+mR8Qlf0kIJye
	UjIfKfcJBe3eUxSF1jwZNBwwuUgTW54nqICXZIKZHnHsiVQ4WPGgmBnD2FdX6kiY2rh/1pvVzEo
	4pDDxB4gYE8QeJu/jngdpVm9Z4rdC0+72kIuh9KM0GfLMyLgU0OTxghRr68GBQQz7ULq17pz4rk
	Xg0wfp5B+9MiNTTz1/SjNpyNVwJkFrN8QlBhsgmtWnsCUrVM2a7r3+3nSS/hUzHBZzYJt8vpEL/
	UKRFUoQUBGV9C7N0JoFySsBbBeyQaf1Ns5OFmaSd9mXm7vje41N7m82I7g0aMzH/3KmkAq3f2ZP
	xOp4UH1n
X-Received: by 2002:a05:6000:4283:b0:48e:bf0:35c with SMTP id ffacd0b85a97d-48e264a636amr3684083f8f.13.1792583144832;
        Wed, 21 Oct 2026 04:45:44 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828ca3sm4944112f8f.25.2026.10.21.04.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:45:44 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v8 0/3] wifi: rtw88: channel switch in AP mode
Date: Wed, 21 Oct 2026 13:45:40 +0200
Message-ID: <20261021114543.4132776-1-mehmet.fide@gmail.com>
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

v8:
- 2/3: Acked-by from Ping-Ke
- 3/3: the TSF read retries once instead of looping, rtw_fw_csa_queue()
  reads the TSF once also on start, the port 0 comment is gone, empty
  lines where asked (Ping-Ke)

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

 drivers/net/wireless/realtek/rtw88/fw.c       | 151 ++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/fw.h       |   4 +
 drivers/net/wireless/realtek/rtw88/mac80211.c |  39 ++++-
 drivers/net/wireless/realtek/rtw88/main.c     |   6 +-
 drivers/net/wireless/realtek/rtw88/main.h     |   3 +
 drivers/net/wireless/realtek/rtw88/reg.h      |   1 +
 6 files changed, 183 insertions(+), 21 deletions(-)


base-commit: 9b0be45d4d52fd223994e151f169743a97abd290
-- 
2.55.0

