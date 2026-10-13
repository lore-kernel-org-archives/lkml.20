Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2669349CF0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876618; cv=none; b=BLr/2B0WyMsJ3gnX6rFMnllTkIdguSCsQ0ZZxIx2HqiBzzL8gS0lrRsCUPSQHTIlSwZC/WgYUPE01RStVf68fR2U72vxF787GSevX1/bF9AqtLZHwyZQFcFUuGDJPnvT4/guqEPurBrl0REUxglMFTt8BzwZShicD6FJT3m4QMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876618; c=relaxed/simple;
	bh=8Zcnc8WofbtCm3DYN8jyqiFBVQ6+ylqXd3wr/rTkc3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y4RQ6q60M/w/ZvlhxSr7v9HaS9Q7Qr1CjuiCj78YIJq9xs7CsAU0BBZKKUXydqQPDYCvOmsTGCk9om7eklOr2AHYmb1WaPemT/29yx+swY2SqfsF3qbvNh8iB6NzsDHvEZ4CKBRq7Zgq5hHjXedgQfTnSPLuPa5boT9E5F4qIlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3Lwue9C; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3Lwue9C"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a01933b584so22439895e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791876615; x=1792481415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eWcmy1Ej3WG6kz7u3KgX8RQlcedhdjpfbUCLK+AYaEw=;
        b=Q3Lwue9C9eiy7Ho3SfzNca6DBMuEvvSymJkOEIqbFT6ZMdVE18vgexAoyEfLXPXkIA
         ah1cKCFN+zXvwyjswRRK8rJVQsBAUiiVcctGnjQ9f4Sby1P7tkTHT5eKA9xdQRMXUVeg
         Rv1JmcoE6mDTwxgrLYeWZb+Dv7GHX1Hpv2iEdSodZq8ZvX6VcUh54m+s2K5wqRiwxAE6
         mrosJTlMGOsbwWDE1piTfcKkFJgFcJVIPDxzbKjJolzjOGGHVRx41hzHFqg0QxHSNTSg
         IUY4hJCCwon28izkxP9+w11sDp9fwo0acH8ZI+ufBp3XKq7m0S4pr2vNi/J/nYOdhkg4
         0e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876615; x=1792481415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWcmy1Ej3WG6kz7u3KgX8RQlcedhdjpfbUCLK+AYaEw=;
        b=wyoXwKaHZG0Gkg7oOnBvUHp+WAKtp0luDUdW6EX0voIS39NQJZqr0NMP/Ne5XfEkhc
         dZ/sePwF9vpDreiTvddqhVDi8CeVNNd/3xXiTZZ6b4+JTVP31yznKN9XxVYyic9b1Y2W
         TURDdKo1XRi0cGEOsmgfrVpNmmLqR8tcfFO2Yuptqy9x1JREAJ0Hj9c6sfxvUCSIMpdw
         SKpy4LQo7KpdGnvxssMN4Zf7fkl3ytjtIeyWhX+n8EPU82CPee0FcMUaeAKuuVKVN4Np
         wAF4e8TOiCZZJM60XYE993Gkf4S+4PVvQYinaLkyTUWestjjcWACP5WGMzFgaAaRZGix
         T7aA==
X-Forwarded-Encrypted: i=1; AKwUvBwyMu8HLlNlCApDNVKPpHUDxCakiL2bAq1S+CaTHv1ZGEhetqc6wbW5bCjiZueImCZ6XZDsSyqCRFjD3mk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoP57XvMQE2Nzt6q+R0JmoAwpuQ5viA0z04EEZZhlRgWstHHBm
	e369ezqWnQxvUGDqKIDMeHyRkS/RUExIM2KvSPCFTE39TVGB4RhC+j7ItaAacr1H
X-Gm-Gg: AYBFou3Kza6/2kD6ZjOyNv89jsuWVN8ospBB/TS+CPD1/wMAxi0eeOAYrPwkkbCk9JQ
	MfCsl7ju/qyqge3g+HRVfqmuhfQdupXWVIeVC7QObdYAoNLSDNhz6mLFKgl6qPZ7Z3AjWoi8iaA
	ao3AJ5DppFxdkXILRwWlDSJgm8XkZC+XV2Ut+VF71LjHukQe+BlcbSf/K/PdkiOHUbzQwhLEonu
	BfZo+Sk5o0HlkT2e9dlEgCnV/IZ3N7CLOOQ+KoB5NR8SteEQAuR4mDwUUxW6T7tFJmAdCYmfg+W
	CGZzziz1930vkAG5Ft+5cXqv9xo0Il5Fuk2D6MpLoHrCFtPwgNM3WcOmeL95V2fLC40BstSRuKT
	mh5yN0jVNhBkb7K4lLCXWNqy/LH0AYyt+BA71pDRpwHBRD7d8MZhviiRsYsau3YLK0vnNMghrpY
	NEvxUwNQQr4YIZgIF8u4dobYsrXTfnn1vCrBEsJl52fEnWGSxi7cpqLwyo+kjY1aEMuOWORCqlu
	/jP
X-Received: by 2002:a05:600c:5308:b0:49e:823a:9dec with SMTP id 5b1f17b1804b1-4a18e43a395mr229443435e9.3.1791876614692;
        Tue, 13 Oct 2026 00:30:14 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm332839925e9.14.2026.10.13.00.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:30:12 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v6 0/2] wifi: rtw88: channel switch in AP mode
Date: Tue, 13 Oct 2026 09:30:08 +0200
Message-ID: <20261013073010.358756-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

An rtw88 AP cannot change its channel: the driver does not announce
channel switch support, so hostapd's CHAN_SWITCH is refused and the
only way is to tear the AP down. The series fixes the beacon download
the reserved page build makes twice, then implements
channel_switch_beacon on top of the firmware's beacon page.

Tested on an RTL8821CU, an RTL8822CU and an RTL8822BU (USB) with
hostapd 2.10 as AP: switches with counts 1 to 50, scans during a
countdown, hostapd stopped and started, the USB driver unbound and
bound and a firmware crash during a countdown, IBSS, a station
interface on the 8822CU associating while its AP counted down, and a
Windows station following the switches without a re-association. The
8821CU and 8822CU set was run on a PROVE_LOCKING kernel without a
lockdep report.

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

Mehmet Fide (2):
  wifi: rtw88: download the beacon the reserved page was built with
  wifi: rtw88: support channel switch in AP mode

 drivers/net/wireless/realtek/rtw88/fw.c       | 120 +++++++++++++++---
 drivers/net/wireless/realtek/rtw88/fw.h       |   4 +
 drivers/net/wireless/realtek/rtw88/mac80211.c |  44 ++++++-
 drivers/net/wireless/realtek/rtw88/main.c     |   6 +-
 drivers/net/wireless/realtek/rtw88/main.h     |   3 +
 5 files changed, 156 insertions(+), 21 deletions(-)


base-commit: fbfa27d9b06f025c5f2cfa79d0e01e6400eeff2a
-- 
2.55.0

