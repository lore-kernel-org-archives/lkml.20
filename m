Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B655B523785
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685846; cv=none; b=tTdjGDkJGvzMlGkzhSSqdaHxksK6gET3IoKjTO57GwgLOePcOBOBd/eCzgHzjJFJOTVODWVkF3DFDMKBcImBZJoi5usX8c0VoPakVynpKmxvKBh58H0s6qzrc8GhES4gjmFnHrDLtrLwpnkhdWD6JRQ+vn5RT00d1S08UakNqeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685846; c=relaxed/simple;
	bh=U7m0o9CyvN16ZdCK9UMVN5kQKeSCp5XXgewGbIatDOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z9ohZlXO2ruUvcZFUgtf9Of2J80isw2Zsv01thh3sSCutwyyOZhPI5UAyG5kfuilMz8/4AaiQTds/St2htMd5mwe4YIaT+lBVQaDwN4eW3bAlbWyJqDEVA5NMkIrWviW48bHJxW6uJRfgBn/qBmgzbWaZeWxjqPF5FG4Hdf0/5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pYvVBSMr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYvVBSMr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so22587035e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790685843; x=1791290643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lsz7W/gFcNJmLY241fJ0lph8+ZwTQ5HGSLaR0rXfueQ=;
        b=pYvVBSMrf0PP6hfEdurKGSlamDkyrlim9HpSMjU+nnAY22gwHfgus/s0al75qwoH0b
         z66GV9rbRq7pjzQLhk06MjupalQPDHcHUv209MYnoN7Vp4MJMKsS5leTez0z6fTcgfLY
         rNmWua0seA8EielJSsqlby1VvUeofYpkIhZXxugw/7J0akN1015Z0yTYKDM5zbLBAsfu
         61Sw+Y3Ak26f6W53ggbOD9mwbDDiijC5QY1Mjcv/nxsOW8ogLirxQBH71eW6dGfGerSt
         TUttvIrmMBBdksogAxCWo/OFqroUOgcFvQsieZQmeznKL/aIdipw1uQlDEE2ImcdvU7E
         49Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685843; x=1791290643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lsz7W/gFcNJmLY241fJ0lph8+ZwTQ5HGSLaR0rXfueQ=;
        b=DGtTUYzVy3VnVi6z0aP8gaeSfjeyhcrGp9ePzkdyTeBPhOCoXpr1j3VUjBeVL10qYq
         pyiYQYXz2vVo1dM9JjI871YIAWlNSZYqfmSH13vgXCRIqt8l4YgYB5+moaBH+QBuC1dy
         l9UMi9GgGkelRCAiZ7tCxJu6eHSLHmKViayw6uKNuGmO56fEtwt8GNlzr7IqgIlOdPJF
         xe/wh6rizrIWcGCwn9CydL825mBxkKw7NL41cQk7UdmMDuTymakoP7dXp7ys6XpdI2bh
         9gIpNDE3gKjzXc/P/xA8OxbW2M0R8kw4U/igXOtpn1lqYSOJUXVwQ5+7sJ1iF+PRDDVR
         7R0w==
X-Forwarded-Encrypted: i=1; AKwUvBysDOZcBnFlk8+acezzBgmCwxo4h0JziQfA3IgIA4wIEj83+7GWVFcPBXzMCErWsW5PB7FB1pHhIUkR20Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nwD48boQ+STFVf6oGLaggTn5s11r1N6MhSFupZrCYVL4UENbHq
	ajIW623nuz9o0Y/zvQ0F2pVPH+MtvIzrbihTAvlh3z3nJNT1ZjzSkn7C/j/zBw==
X-Gm-Gg: AYBFou1wpJj0Rn7rbnKHAa1hvkue/XArl/2YBTzm/2ZBb2DrkTQMkTmQFhnT/Ksi1xY
	6i0jQt5CX4OPnxs6NXZTDfThkvYIPPVbTo5t7z6TjB2PUi0O574sz7Mg1KaP9fv6xXlTHq4rUvQ
	jgTRxGb0Tp2tyCtBIRFJmqaxhU3TtF5ykNhyUMxCuCEYUHtFY0uryMO4Lxt0SpS5+LCDC35gV2j
	LB5uL7cXIECiLma8WVIiX2ZsapmXXvhl0E/PfR5UaTN5nAywMqmRLo8dQRubpVldufvifywN+Cx
	bWQM1VlfvZ3eRdtRPpNIWBcIR7oHLWNkfCAQyQeB2XrQXxcJxUOotT3LCIypHpxjomiYBNEh/f+
	attHLFeAOnAph4X2ARP4y8CMabwan5atpclxHk5t/Ell5MYianiz+zoOwkwKn/ibEdoo6RZgMdz
	oBO0tyXQtTIxar5PRe1OW8RBiGD+GWNpa+S65ftA8GJgDyH4Y54skT50/ZYezT/sCMx68JVAQ+3
	xME
X-Received: by 2002:a05:600c:4505:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49fe66d069dmr256257375e9.8.1790685842393;
        Tue, 29 Sep 2026 05:44:02 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a012387337sm33002265e9.8.2026.09.29.05.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:44:01 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next 0/2] wifi: rtw88: channel switch in AP mode
Date: Tue, 29 Sep 2026 14:43:58 +0200
Message-ID: <20260929124400.3856049-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

hostapd's CHAN_SWITCH fails on an rtw88 AP because the driver does not
announce channel switch support, so the only way to move the AP to
another channel is to stop and start it, and every client drops.

This adds the support the way rtw89 has it (edba3f107844 "wifi: rtw89:
implement channel switch support"): WIPHY_FLAG_HAS_CHANNEL_SWITCH and a
channel_switch_beacon op that keeps the beacon in the firmware's
reserved page current while the countdown runs, then calls
ieee80211_csa_finish().

The first patch is needed for that: rtw_fw_download_rsvd_page() fetched
the beacon from mac80211 twice per update, once for the page and once
for the standalone beacon download, which advanced the CSA countdown
twice per beacon interval. It now downloads the beacon the page was
built with.

Tested on 6.12.111 with identical hunks, hostapd 2.11 on nl80211:
- RTL8821CU (Edimax AC600, fw 24.11.0) and RTL8822BU (Edimax EW-7822ULC,
  fw 27.2.0) as an AP on arm64 hosts, with one and with two associated
  clients (an AR9271 and an RTL8822BU station).
- CHAN_SWITCH with count 1: the radio moves within 0.6 s, the client
  re-associates as expected without a CSA element.
- count 2, 3 and 5: CSA announced, AP-CSA-FINISHED, radio on the new
  channel within 0.8 s, the clients stay associated with no packet
  loss (worst round trip 168 ms); an iperf3 stream on one of them ran
  on through the switch.
- a countdown aborted by stopping hostapd or unloading the modules:
  clean; STA mode scan: fine; no warning in dmesg in any run.
- every rtw88 chip option built with W=1 and sparse.

Mehmet Fide (2):
  wifi: rtw88: download the beacon the reserved page was built with
  wifi: rtw88: support channel switch in AP mode

 drivers/net/wireless/realtek/rtw88/fw.c       | 54 +++++++++++++++----
 drivers/net/wireless/realtek/rtw88/fw.h       |  1 +
 drivers/net/wireless/realtek/rtw88/mac80211.c | 14 +++++
 drivers/net/wireless/realtek/rtw88/main.c     |  3 +-
 drivers/net/wireless/realtek/rtw88/main.h     |  2 +
 5 files changed, 64 insertions(+), 10 deletions(-)

-- 
2.55.0

