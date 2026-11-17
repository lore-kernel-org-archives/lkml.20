Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794892253;
	b=bdQzYprgPESqlLPmfnZfvuJJWd2qkmr+JrQOBRirxy8dPlCptPJ7DyW5WQ4EVqYiUaJd
	 edHLqeLnHVcU+E0YpyROX36SApka0f22VaKVIcZkVIvDazCVb96uaCUXTNsZ5pgRg3xxY
	 XOjSY4cUiIzFY4h4LrKxGFQeP4Ct0UAVZxL82c17xMnLwKevoK1YL+1VCUpRJbzl8gFHj
	 Fn5eskDD6a3pPiTUchgbf2sFKIZTguvNKQA9+XAGA5qvkjg70WB0ITGMGz6hEwEUNTDKM
	 D0KYH/DLfauEhbzhdCEwQkPQJ/iY7C9s0HyDEhBecf7wjNrXCzHTJAD9bfGmHBquzYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=vgUGLshxhHRt0ChpdfNJyERoAh6XMg743YjhS/aQ+II=;
	b=gNqGAf+OPuBBvkQMzCj7Y4D9r0azE4XW3Br8M44J6/i1r4GuP77THqZv3E0r+gDlRpm+
	 xiQiVsNUMCJyDPNWd9iaqyXUr2bb3g5JoQZHjOEI8n9ykkb1r9x2fvx/Mb9cNoud8aAPJ
	 CIpcRt+9GLYFqBxJ7DtA5Asd+qbmlk3hIt0+C6ii9O0pvMZy08hQ+pVbzsenEgYFn38AX
	 tcBl8UM3WM1C0fOKQGsFH1ioWF54H5rLk6ouEesM/I6+ld6vYNeYI76xA+nVfRThD66c2
	 EbHNPwXZBtBMF1AvnR37fAasC/3IdwNpYHX4/7kaspdvJT4h90vcT/yzdc1cLBPS4xg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7SF4Mdy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65FE606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C65FE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7SF4Mdy
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso9426993a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794892251; cv=none;
        d=google.com; s=arc-20260327;
        b=YTkzLwW58v7XcdukvzMrRc0//KwmqBvHA07OUMdHE1dS64Dt5/UHlezyTVAGnrmEMF
         sfP7W6cyYAV93/6nZnHoOSlZxIyqSSL2rojMKutm9se6IjU8sE3GGHhfteXFLuqLepcp
         ot46XcdgqlHX2MITPZewj/OfQ1pOvqN8RhIWsZ7O1IleaT8sAhFRChGprt9Si+M5cSbW
         doUoRTX/i1sak0Wc/kQgAXiCDAciHKwu2k+9uW4VrG8rWQVX+3cbDWlL1AN77FlU9vHn
         7pEhBPByemyvCUyVpwzQ/OwH1zgqj54Vz7XVmWdUWWg8G8jJJV6pPDZGGjScGEiMcnCW
         JQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=vgUGLshxhHRt0ChpdfNJyERoAh6XMg743YjhS/aQ+II=;
        fh=ruqygnSv+EsuzcjjopSWxx0x/HeQkpeXkNNTx0rdRBg=;
        b=S30HstIfemSRIdqKeSVp04syM7bSjRuj8qWM0Kzyd8128ROwOvFmblx8Wi1ZvpfQjH
         Xji+uJDaGGZOqOQ8RTqdmcuQGB99Up2ZI130U9b3U65Tqra6hIDErkLSZqWUVCNBwN/n
         b3rT4soRsqMLnLzHmdwOg1KaoZs/xprTaog960cHJimfXrPo7xUj2zlIbqF8WshaW+xa
         oFeNu8jf+q6TE8yE5AlE3AjWrCOtcZ7Rbybk8kGlIXCGAVKeiUVczAG0yrPrbakrwnrM
         V/1i7OlQ5wxWTsFeZGdlnFAjLdoU4vw65XUnmwy9zYBYQ411UlxDCd2n2XQYM/b/PkZH
         T5KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794892251; x=1795497051; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vgUGLshxhHRt0ChpdfNJyERoAh6XMg743YjhS/aQ+II=;
        b=X7SF4MdyFUZjSVUII0FpvH941a9DfKvv+JQls1TkDtWNO6eGd/g4SRzsT81b4Qwmol
         ZuGUmWVIrjw5JoyfVeIj9n8zOUoVNPMU9n2nRZChoR6OjyU2aSGE4mVhF/Eng2QbxJpG
         c3LZMmboc1HWLf3fNIGLhGAvx8G0RLBNGoS7K/qdL0gpUR6l5sCF3LzmotBNFgxtkDU4
         7zZ+Z2JNHHbFThp+Sd8bRTC2WG/4hxQ+0nOsHk/T5SUuDuBjRpgx9kyOPOnM4xuPNmog
         5DRuSj0MtoXqw2zBo3MGF4wOPWFV8aieY5pukCCeF/WyrgUS4kIUZqJnERYwUgvGHoj0
         YDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892251; x=1795497051;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vgUGLshxhHRt0ChpdfNJyERoAh6XMg743YjhS/aQ+II=;
        b=rhdxghRCj+aLlcDCFcOReLlBkl4hHz54pg/dZ5t6sh8JW4L0WdjBlBk4teMGm5dFfu
         OhZE9PvzBQLXd6MybyLN/3tXylRDsZitf/g/Tn0ECl4M0LmlV9PWD3hw4x7yLH2uZBcL
         ofDnrYK8n+fBZ7hi/cVzWAz14m0VQTwuYGlo1Mx7Raf04rbAM/B0tgQLYm3m4kT32wMq
         fVqfbJYAbYPX7tR79kJOyJigCNMIsebODBsn+9kruxS69byCg4N8VGFEvkMWLYi0NzED
         qQ7JbmAfKdCHem5bvF3rUKAIiXK5XQbZ8CuFw0HWFpswUCeEWOj2aO5gMc+clSCJ4fTL
         m/NQ==
X-Forwarded-Encrypted: i=1; AL+hErF8m3oTJ5cDLWuE/0JwHEoX+uYxWwqBpE/xv5Oo+0p0YX5rId7V4pT9s6iDsg+8zmH5NHR620ATbiNtizI=@vger.kernel.org
X-Gm-Message-State: APuU4Z98H3LN5+pZzo3aWqj9EXee4JByV2fDxp+tkgCweHRkuBrOC26I
	Jannv+DApNLWP5a0UVbLNcvOXRNW79us+SuHkW/ttB/MOYA7zXhOfi++06eK4EIHNyGJgn/2a31
	lKwPaY9DHmbP6HJ9ZieoGXNRUKaWCyOo=
X-Gm-Gg: AYBFou0RSH7D7ZfuOkFf/D5kLhKJ9wdEmFcPTfV1VdSk7YovS/XadeTUxObkzjy+Cc7
	6hSi1dkbbbLLSR0d1P0HYT9be0JEgarCTvQSKzxkdsbJgyoIY3XvTwXp5oB/tf/vVUY8UCT63SU
	7hCxZ3bx2ADnmvpHMPN1pZVpXfaZ/P7vlrJUPjsvS66G5esgNVmSLwwGXfj+2yCFxRj1qjdC4KJ
	bsuVDbrT2S1cddW/JuVOUdrWcfMK+9k8uJpIgfCyV7k8K0wyK7WuvEKlS00XEboyPJIp+kLOVUx
	koZ/k+EiQ+OoV2czlDCiXt74ktCG488ee42R6RsXDt/qPbPqW9Dekhn0A4g9WYpA5Ed6fDoYOEl
	UVpbJzk4vaBERVdRO2Y47DQi/n8F/2h2yr1gHLIGKdE4g/mHDwwquEJBqTCJkK6+wRKCfahpvCn
	mVXVVPVJIkn6OB
X-Received: by 2002:a05:6402:90a:b0:6b7:83a4:415b with SMTP id
 4fb4d7f45d1cf-6b7c0c19637mr10843175a12.21.1794892251030; Mon, 16 Nov 2026
 21:10:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Tue, 17 Nov 2026 08:11:06 +0300
X-Gm-Features: AclHuK9BgHM4X6QwlTTmSvN_88WWLGWKbZdruwkqCJEgkEw10pUY_FO_jZmlL4I
Message-ID: <CAMnMt5ZdwbOrSeCbP2j-+pVk-3JvEpfuzyJRJOnCLs6VqbHeXg@mail.gmail.com>
Subject: [PATCH] wifi: mt7601u: add monitor mode and packet injection support
To: kuba@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Herman Semenoff <GermanAizek@aizekgroup.ru>
Date: Tue, 17 Nov 2026 07:55:00 +0300
Subject: [PATCH wireless-next] wifi: mt7601u: add monitor mode and
packet injection support

The mt7601u driver currently only advertises NL80211_IFTYPE_STATION
and lacks proper monitor mode and raw frame transmission (packet
injection) support.

Specifically:
1. When switching to monitor mode, mac80211 raises
   IEEE80211_CONF_CHANGE_MONITOR in ops->config(), but mt7601u ignores
   it. As a result, MT_RX_FILTR_CFG_PROMISC remains set in the hardware
   RX filter, causing the MAC to drop third-party frames.
2. In mt7601u_add_interface(), adding a monitor interface (e.g. via
   airmon-ng) allocates a GROUP_WCID and overwrites dev->macaddr.
   If a station interface already exists, add_interface() fails with
   -ENOSPC. For monitor interfaces, do not allocate a group WCID and
   do not override the device MAC address.
3. In mt7601u_mac_start(), ensure MT_RX_FILTR_CFG_PROMISC is cleared if
   IEEE80211_CONF_MONITOR is active.
4. In mt76_configure_filter(), include MT_RX_FILTR_CFG_RTS and
   MT_RX_FILTR_CFG_BAR in the control frame filter so RTS and BAR frames
   can be captured in monitor mode.
5. In mt7601u_register_device(), allocate dev->mon_wcid with
   devm_kzalloc() instead of uninitialized devm_kmalloc() to ensure
   rate control fields start in a clean state, and add
   NL80211_IFTYPE_MONITOR to interface_modes.
6. In mt7601u_tx(), transmit packets via dev->mon_wcid when transmitting
   on a monitor interface (vif->type == NL80211_IFTYPE_MONITOR).

Signed-off-by: Herman Semenoff <GermanAizek@yandex.ru>
Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru>
---
 drivers/net/wireless/mediatek/mt7601u/init.c |  7 ++++---
 drivers/net/wireless/mediatek/mt7601u/main.c | 20 ++++++++++++++++++++
 drivers/net/wireless/mediatek/mt7601u/tx.c   |  2 +-
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/init.c
b/drivers/net/wireless/mediatek/mt7601u/init.c
index 5d9e952b2966..c01bb3fc4a7f 100644
--- a/drivers/net/wireless/mediatek/mt7601u/init.c
+++ b/drivers/net/wireless/mediatek/mt7601u/init.c
@@ -242,6 +242,8 @@ int mt7601u_mac_start(struct mt7601u_dev *dev)
  MT_RX_FILTR_CFG_ACK | MT_RX_FILTR_CFG_CTS |
  MT_RX_FILTR_CFG_RTS | MT_RX_FILTR_CFG_PSPOLL |
  MT_RX_FILTR_CFG_BA | MT_RX_FILTR_CFG_CTRL_RSV;
+ if (dev->hw->conf.flags & IEEE80211_CONF_MONITOR)
+ dev->rxfilter &= ~MT_RX_FILTR_CFG_PROMISC;
  mt7601u_wr(dev, MT_RX_FILTR_CFG, dev->rxfilter);

  mt7601u_wr(dev, MT_MAC_SYS_CTRL,
@@ -583,8 +585,8 @@ int mt7601u_register_device(struct mt7601u_dev *dev)
  dev->wcid_mask[0] |= 1;

  /* init fake wcid for monitor interfaces */
- dev->mon_wcid = devm_kmalloc(dev->dev, sizeof(*dev->mon_wcid),
-     GFP_KERNEL);
+ dev->mon_wcid = devm_kzalloc(dev->dev, sizeof(*dev->mon_wcid),
+     GFP_KERNEL);
  if (!dev->mon_wcid)
  return -ENOMEM;
  dev->mon_wcid->idx = 0xff;
@@ -609,7 +611,8 @@ int mt7601u_register_device(struct mt7601u_dev *dev)
  SET_IEEE80211_PERM_ADDR(hw, dev->macaddr);

  wiphy->features |= NL80211_FEATURE_ACTIVE_MONITOR;
- wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION);
+ wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
+ BIT(NL80211_IFTYPE_MONITOR);
  wiphy->flags |= WIPHY_FLAG_SUPPORTS_TDLS;

  wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
diff --git a/drivers/net/wireless/mediatek/mt7601u/main.c
b/drivers/net/wireless/mediatek/mt7601u/main.c
index 05ba43e1985c..29486c4767e3 100644
--- a/drivers/net/wireless/mediatek/mt7601u/main.c
+++ b/drivers/net/wireless/mediatek/mt7601u/main.c
@@ -56,6 +56,12 @@ static int mt7601u_add_interface(struct ieee80211_hw *hw,
  */
  mvif->idx = idx;

+ if (vif->type == NL80211_IFTYPE_MONITOR) {
+ mvif->group_wcid.idx = 0xff;
+ mvif->group_wcid.hw_key_idx = -1;
+ return 0;
+ }
+
  if (!ether_addr_equal(dev->macaddr, vif->addr))
  mt7601u_set_macaddr(dev, vif->addr);

@@ -75,6 +81,9 @@ static void mt7601u_remove_interface(struct ieee80211_hw *hw,
  struct mt76_vif *mvif = (struct mt76_vif *) vif->drv_priv;
  unsigned int wcid = mvif->group_wcid.idx;

+ if (vif->type == NL80211_IFTYPE_MONITOR)
+ return;
+
  dev->wcid_mask[wcid / BITS_PER_LONG] &= ~BIT(wcid % BITS_PER_LONG);
 }

@@ -91,6 +100,15 @@ static int mt7601u_config(struct ieee80211_hw *hw,
int radio_idx, u32 changed)
  ieee80211_wake_queues(hw);
  }

+ if (changed & IEEE80211_CONF_CHANGE_MONITOR) {
+ if (!(hw->conf.flags & IEEE80211_CONF_MONITOR))
+ dev->rxfilter |= MT_RX_FILTR_CFG_PROMISC;
+ else
+ dev->rxfilter &= ~MT_RX_FILTR_CFG_PROMISC;
+
+ mt76_wr(dev, MT_RX_FILTR_CFG, dev->rxfilter);
+ }
+
  mutex_unlock(&dev->mutex);

  return ret;
@@ -118,6 +136,8 @@ mt76_configure_filter(struct ieee80211_hw *hw,
unsigned int changed_flags,
  MT76_FILTER(PLCPFAIL, MT_RX_FILTR_CFG_PHY_ERR);
  MT76_FILTER(CONTROL, MT_RX_FILTR_CFG_ACK |
      MT_RX_FILTR_CFG_CTS |
+     MT_RX_FILTR_CFG_RTS |
+     MT_RX_FILTR_CFG_BAR |
      MT_RX_FILTR_CFG_CFEND |
      MT_RX_FILTR_CFG_CFACK |
      MT_RX_FILTR_CFG_BA |
diff --git a/drivers/net/wireless/mediatek/mt7601u/tx.c
b/drivers/net/wireless/mediatek/mt7601u/tx.c
index 5aeeac0dd9fe..d3328181f961 100644
--- a/drivers/net/wireless/mediatek/mt7601u/tx.c
+++ b/drivers/net/wireless/mediatek/mt7601u/tx.c
@@ -211,7 +211,7 @@ void mt7601u_tx(struct ieee80211_hw *hw, struct
ieee80211_tx_control *control,
  if (sta) {
  msta = (struct mt76_sta *) sta->drv_priv;
  wcid = &msta->wcid;
- } else if (vif) {
+ } else if (vif && vif->type != NL80211_IFTYPE_MONITOR) {
  struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;

  wcid = &mvif->group_wcid;
-- 
2.55.0
