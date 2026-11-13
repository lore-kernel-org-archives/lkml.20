Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794613941;
	b=LSHrQtEZmUStywtG8ew9++K/Hr/Nr3s039lODjPnNhQ08Rd3iIIL8YrgrLE2Sil93KR2
	 SJkIgPRy5OxOjqIzm/nI53o9hz/xSMWRV9JlY0fClNt1ZvQDZts7dc1dfk0B9D3QLDCCF
	 GllqajYQJZbZ/zijqB7RFJOB5VFnET8PxWTp39tz3bdzosEbWTkE57IZphyjQzouEwjry
	 fkJybUIOl16zkch1LzCXwXSAJpmfmNYQYfj2j7Ryx1maMf5T1oZkxgaZaK6lHOn/GCgLW
	 X6Ddboua8eSUEoZuG9mQuuQGnwRV7qiopkEgk1C742rF9/N4WsJgIeV97SOkzOIH3yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794613941;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-ZohoMailClient;
	bh=Z63hzdNsCj0yShb0LqNKN0actouvBeMauSyX1t3SugY=;
	b=R1/pdvtCSWFk9mBSigICSeKupYM5JYzf6ZtiJsLDP7GNS2RgvxrXa4oFtFNnpYyyF7dW
	 nRqq6tkh8OwW1s0XdG+9mMo4R2xYfyJb+sQo/InGhKMo+ho7IcKvq8uccJ10lYGEbc9tU
	 jPe6NZEHNsSSxqIVz61x6ub7oz+p8ArCJjFHUEUMyMqTEJ52+ssbGLaTbOGMLU9IkGsOI
	 ILGYcpyyf0IFTmKXxRuw6M8gqZ3NEYTdM5GUFzdnRV/YatORPgaQe0fAC6KhUJ+YtKeT1
	 ZLhqfRE0hz8q+O0OohfQfyVgs775IpmpyhDak0yno94SQqC/XX+6o+2ZoZgq8KJaX+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=YlYcbL0t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C979606A332;
	Fri, 13 Nov 2026 23:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C979606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=YlYcbL0t
ARC-Seal: i=1; a=rsa-sha256; t=1794613936; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aPDLc/gyFTAiygM5H6GiL37qvUlAqXmeRSFgJvTZ3d4bISIeC7tbKOdeSeahMdah95ZjNEqMLt5kipdS/XEjuZkMs3HiDpWhO+21UPvNvUewE3yiQwuwiGTIBNQA55fO2Uh7Lb9K+ZY7KlV+H2BrXqzS2F1S8nWtEk+8gSm9tRQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794613936; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Z63hzdNsCj0yShb0LqNKN0actouvBeMauSyX1t3SugY=; 
	b=YfzUbapidxBQbj+OrR/7aKueqtHuTCP5eFs+Tm6QiWY+/FDb2Rmmp9Z75EZcpjBt1/lZyGz9votQmftD15YptF37VfzR+WNHx4QTHBIhrZtv2UfGadxlideKbPQgJLqQiLvdhG4XmIYT/lFdQpWcgbGUXtXzdVbn5YVzUiNHtw0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=YlYcbL0t/Hoy4uNhX34v5Wf+esYUMGkpK8J8TbRl/ytAYPdOVbmSbqJOwVbt+DYf5nYdg2WCEytUKuryP6nr1ROx8JBLR/dKMiISWnj6THMph72803cH4HwZyJEEGcs5LNrQseQO5bhrRca8IXIsEODAy6kcui7S7DOH/eY4ZFiT0Xt0Pv0wGb2dbNCxnHd7cHZgfPgVoQ/F0uQ6Fah2g1z8fLmjBUK84P6CJpcIgt8IqgHnfgixcJzsH0ux5H2UUO+elJ3f2/2d49QK0S2iEypPhGzHf/0q1qGZcOTpJCFKwyWNG5mhQ7UpZ7uN/80EUaT91yoxC+zDqap3G5GyIQ==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=Z63hzdNsCj0yShb0LqNKN0actouvBeMauSyX1t3SugY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794613935706450.2854713570015;
	Fri, 13 Nov 2026 15:52:15 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v5 00/10] wifi: rtw89: monitor mode RX filter and raw frame injection fixes
Date: Sat, 14 Nov 2026 04:52:01 +0500
Message-ID: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
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
X-ZohoMailClient: External

This series fixes a NULL pointer dereference and a negative rate index
bug on the rtw89 TX path for injected frames, makes monitor mode
receive frames that are currently dropped by the hardware RX filter
without disabling hardware Auto-ACK on concurrent active interfaces,
enables raw 802.11 frame injection on standalone and concurrent
MONITOR_FLAG_ACTIVE monitor interfaces, and restores the operating
channel when leaving idle on devices using mac80211 chanctx emulation.

Patches 1-2 are standalone bug fixes with Fixes: and Cc: stable tags:
  1. drop frames without a vif instead of dereferencing NULL in
     rtw89_ops_tx() (reachable when injecting on a passive monitor
     interface while a station interface is up)
  2. treat the radiotap "no rate" index (-1) as signed in
     rtw89_core_tx_update_injection()

Patch 3 retains FIF_CONTROL | FIF_PSPOLL, tracks FIF_OTHER_BSS in
rtwdev->hal.rx_fltr_other_bss, and clears target-address, multicast,
CAM, beacon check, and UID filter drop bits whenever B_AX_SNIFFER_MODE
or rx_fltr_other_bss is active (including across scan/ROC/MAC reinit
restores) while keeping B_AX_SNIFFER_MODE restricted to pure passive
monitor mode so hardware Auto-ACK remains intact for concurrent STA/AP
and MONITOR_FLAG_ACTIVE interfaces.

Patches 4-9 enable raw frame injection on standalone and active monitor
interfaces:
  4. RCU protection and sole-monitor tracking for pure_monitor_mode_vif
     with optional deferred RCU synchronization
  5. RTW89_SELF_ROLE_AP for monitor interfaces so the JoinInfo H2C
     initializes the MAC ID's CMAC control entry without arming client
     TBTT tracking or AP beacon transmission
  6. resolve standalone NULL-vif TX via pure_monitor_mode_vif and direct
     MONITOR_FLAG_ACTIVE vif TX via rtwvif->mon_tx_ready with coalesced
     synchronize_rcu(), track rtwdev->monitor_vifs for radiotap/PHYSTS
     enablement, parse frequency IEs before pushing VHT/HE/EHT radiotap
     headers during concurrent scans, and validate linear 802.11 header
     lengths via skb_headlen()
  7. route injected control frames through the management queue and
     guard hdr->seq_ctrl reads on short/control frames
  8. skip host-side IP/UDP traffic stats, WoWLAN AKM parsing, BT-coex,
     HE HTC, and A-MPDU/TXQ aggregation hooks on injected frames
  9. honor IEEE80211_TX_CTL_ASSIGN_SEQ, IEEE80211_TX_RC_USE_RTS_CTS,
     IEEE80211_RADIOTAP_DATA_RETRIES (hw->max_rate_tries = 63), and
     IEEE80211_TX_CTL_NO_ACK across AX/BE TX descriptors and PCIe/RPQ
     TX completion status

Patch 10 restores hw->conf.chandef when leaving idle or toggling
monitor mode on devices without assign_vif_chanctx while RTW89_PHY_0 is
inactive after rtw89_ops_stop() / rtw89_enter_ips().

Verification:
- Firmware behavior in patches 3, 5, and 10 was verified against
  RTL8852AE firmware 0.13.36.2 (JoinInfo H2C role/CCTL handling,
  scan-offload RX filter pause/restore, and absence of BEACON_FILTER
  forcing no_chanctx even with support_chanctx_num == 1).
- Each patch builds cleanly in isolation on rtw-next (Linux 7.4-rc1)
  with W=1, C=1 (sparse), and CONFIG_PROVE_LOCKING=y, and passes
  checkpatch.pl --strict without warnings.
- Runtime hardware validation was conducted on RTL8852AE (10ec:8852,
  firmware rtw89/rtw8852a_fw-1.bin 0.13.36.2, Linux 7.1.5): promiscuous
  RX across down/up restart (ftrace confirmed channel/RFK programming),
  NULL-vif drop on passive monitor while a station interface is up vs
  concurrent MONITOR_FLAG_ACTIVE raw TX + Auto-ACK preservation,
  10B ACK / 16B RTS / SN=1337 Data & AssocReq raw TX, NO_ACK vs
  DATA_RETRIES tx_retry_lmt telemetry verification, and 25 concurrent
  del/add RCU stress cycles (0 dmesg alerts).
  RTL8852B/C, RTL8851B, RTL8922A (BE), USB devices, and DBCC setups were
  not runtime-tested.

Changes in v5:
- Split the NULL vif fix and signed rate index fix out as standalone
  patches 1-2 with Fixes: and Cc: stable tags.
- Split monitor injection into focused patches 5-9 and support
  concurrent MONITOR_FLAG_ACTIVE interfaces alongside standalone
  passive monitors while coalescing synchronize_rcu() on teardown.
- Route only injected control frames through the management path so
  mac80211-generated BlockAckReq frames keep the normal data path.
- Separate FIF_OTHER_BSS drop-mask clearing from B_AX_SNIFFER_MODE so
  arbitrary-BSS RX works on MONITOR_FLAG_ACTIVE without suppressing
  hardware Auto-ACK on active interfaces.
- Advertise hw->max_rate_tries = 63, honor rates[0].count, and avoid
  false tx_retry_lmt increments on single-shot NO_ACK completions.
- Gate channel restoration on leaving idle / monitor changes with
  !rtwdev->ops->assign_vif_chanctx so non-chanctx devices (such as
  RTL8852AE) activate RTW89_PHY_0 for both standalone and active
  monitor interfaces.

Changes in v4:
- Use full legal name in From/Signed-off-by.
- Retain FIF_CONTROL and FIF_PSPOLL and clear B_AX_A_MC and
  B_AX_A_MC_LIST_CAM_MATCH in monitor mode.
- Split RCU conversion of pure_monitor_mode_vif into its own patch.
- Handle injected control frames, negative rate indices, NO_ACK, and
  sequence number preservation.
- Move monitor restart channel restoration into rtw89_ops_config().

Changes in v3:
- Split into a patch series.
- Dropped direct register writes in favor of driver abstractions.
- Added RCU synchronization around pure_monitor_mode_vif.

v4: not sent to the list
v3: https://lore.kernel.org/linux-wireless/20261104203051.564-1-owner@ph4ntom-rev.uz/
v2: https://lore.kernel.org/linux-wireless/179371849554.20972.16232816164394690660@ph4ntom-rev.uz/
v1 (RFC): https://lore.kernel.org/linux-wireless/1a196d6dfbc.35537d221913104450.3720060455831933789@zoho.com/


Enver Ikromov (10):
  wifi: rtw89: avoid NULL vif dereference in rtw89_ops_tx()
  wifi: rtw89: handle negative rate index for injected frames
  wifi: rtw89: fix RX filter configuration for monitor mode
  wifi: rtw89: protect pure_monitor_mode_vif with RCU
  wifi: rtw89: use AP self role for monitor interfaces
  wifi: rtw89: transmit frames from monitor interfaces
  wifi: rtw89: send injected control frames through the management path
  wifi: rtw89: skip host-side TX hooks for injected frames
  wifi: rtw89: honor ASSIGN_SEQ, retries, and NO_ACK for injected frames
  wifi: rtw89: restore channel when leaving idle on non-chanctx devices

 drivers/net/wireless/realtek/rtw89/core.c     | 144 ++++++++++++++----
 drivers/net/wireless/realtek/rtw89/core.h     |  17 ++-
 drivers/net/wireless/realtek/rtw89/mac.c      |   3 +-
 drivers/net/wireless/realtek/rtw89/mac.h      |  18 +++
 drivers/net/wireless/realtek/rtw89/mac80211.c | 131 +++++++++++++++-
 drivers/net/wireless/realtek/rtw89/mac_be.c   |   3 +-
 drivers/net/wireless/realtek/rtw89/pci.c      |   3 +-
 drivers/net/wireless/realtek/rtw89/phy.c      |   2 +-
 8 files changed, 278 insertions(+), 43 deletions(-)


base-commit: 61a5eb87b2d9b4d5e353780b781cf691f39ba9e1
-- 
2.56.0.windows.4

