Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928626;
	b=y3UG/3qZCA6hg0f3X/6DsjssBUjxHBPuXrtF9aZgM2k1ujsF68VD41Ww3bsvTdUqYJFv
	 nALfdtOD+un8O7gJtFqwhYqk1zYGtK7VyecLSznXnrJYQpKzovkfApqggPG83p36PMy1O
	 53Sk+p/TR+iDTekIlw8p4yAC10g9/XEQ3jmrknf9EUreBvjOx1Cr4TCSLZdP2+QFVPXwx
	 H80HpFux/DdsQIHpvV8/IJ7ULZ4JqxUhuI4ay8t+IZDNyew5eyXL+1oyRlk59VvCcziuu
	 6faph8LpCM/lTfQhfR6L2Z6OOKEkf6T1rB33Ux6rcAXBOgcUJOx24W5y5/D8H5VlC5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q1+aSrenySb7/K/4KADrSG42hPPqau3X8HKjekq9KZU=;
	b=eCtZ8GQ5OyGLV8Ghm4ryXQE5SAR8v216vj556F8HJDVrCj5zLK/29lho7pKTKy+MYMKZ
	 ZA4VxF8zxnOshlHIvOVGZU8Q41UQ4w+9skcqMoxR64dDIy5CwtB5HdxYRSxAlWDn3AsFO
	 DNKIIhgcxq4hC5laLcvaoqYgA7jUkvatJzsTLQAQU4q++1km5Gn5Xjg6upl54ympl/sfM
	 kfBFVMnYd0Ge8OVdhjKnruShyFT+iMNvU/f0uSZKtHucmw5GinspgicuG9cPPX43iDE7/
	 rqEEsjCo05/vt2Z2sE0fYbKMBjmicNYFvCLT2vftyXmPmHpBhj7FuXwwK61KnCvFW6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wCB2HZMb;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44207606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44207606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wCB2HZMb
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so20875345e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794928624; x=1795533424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1+aSrenySb7/K/4KADrSG42hPPqau3X8HKjekq9KZU=;
        b=wCB2HZMbwJo99BUTH8q0T+du9sVsbyrCt6V+eJHgWNPVC5YY2zFK/D77eb+hyVsLBn
         Cp9+V/m2GekEhQkaksnfLEtHU4lZQLnO3LtEdLm1y8IFyMNHag+Uji1eh/sd0F58qW6R
         lvlFvZjdYNUGPp/HjfFkMr8WzMyg3E+JrPzOD5gCqvr7ur64rBvPXZqEyFlJzIMXcFPU
         YAlVs6+7cVn8r6Q3gf3vewI/Pwf2nL/z8fepADoB/Kn8+pPAcvIA4FO1RyrKj6PrVT4k
         Vhi6KkEnWN6TW/FAQMs8qrWjlK+axA8VXbUkZgkrEjUk7GKP3biufOYZ+3g0iKMBQVOG
         3G/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928624; x=1795533424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1+aSrenySb7/K/4KADrSG42hPPqau3X8HKjekq9KZU=;
        b=K8Xr5XJQLr23igbk3GFJ9LE7QZ6+yc2JTHHeiJFwoxS6bkY2Fjhfh2Eqy1X609zRcD
         +Rbqmec/4TbEyMSDqr+l3C60oLpL/UaBMao41gEBW999qPaqBxQZvCfm9XCB+JfssB9U
         HUmYV7dDMSYQpie+UxkGvy16P6SgTIX+kbJLC9X5QqNZe1klmd2TCTwj4Bc5L3/Mb5Xe
         79hNSMNy1M1a32pKxiGFsXeSC9PNUC1sR/UQiCP1B+9gpTeTcf3M7PE4BrdzNe2yodCT
         wfHAbXIRSYvaJOE0oa7dLgKY8dpkeYECxByeRXH2KW/OFTjZIqk9519AodO/R3PlTWR2
         /p9A==
X-Forwarded-Encrypted: i=1; AL+hErEuJWYYlTWKl9a+6h2t/n67W2U/hAIwgBiowkCh4rxWxv9kmxrO3LOl9o075lo7KooPS/k0hZ09Iqwaja8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hRhfUZ9VqqJxqHgwpHCSkEZhVUs49ytqsPLIsApmZKIeFG5GV
	B/H0RQdccEtgefCdqOxHGiaX5qMTY6NNm3W+JTT9Wtw3hVp3vR958Kc5
X-Gm-Gg: AYBFou0Si4VWfzHJH3R0IRlUAozR4e2izRBDUmuVnU9pyCzB53hthD35Or96LRVIqAf
	Vk4j+r+bgvUabt2hOfSkpn5rK/+B9nL+0Ozuv0jbYsbJBZ96XFZDCuoO5E/7JKEJnRO9Fdav/RS
	SgCp9HkQLAVhlWfhRERyUfsIvzrrudbSMhuIJ4Ocivg0EI96of0CHK4qfcKpPTT92ZH44TNBOON
	bXDVpMy0Z71o+9uLDXaWSB1efAhMDLS+onbmFGpuMs/UxVDhIRU8tB0lftv8Y3YQkcGuedyJJHk
	TQQVA88n3iHMs1Ch2EK9OUHKPcLWKkNGwZ6Jo4Uv6fXY1nQ4YzYu4G9EYXdDXMLopByqhhc5K2h
	ueTLIqO8ddk87vNaS9l7aFamahiawFcsxV8EM3c8kN5Pox8zsXoozYT17lK1baHEUfA7+ZBxcbO
	jsEHXsYmhwRoxyyJeeoBxvbozHBcgIZZhA4xfFL5e1TSIjfL2cvXBs1b6LP5QkMPRkmYycecusb
	5hztXRJIZJwrKzgiFccmtCobTG2klee3MsXkzQfYlHtdVpwaOZxUTKMixepKwTUonmpuBCXJR0o
	p8dczRHzvW8lKsC1AspgeYu1HFQ4/S4fTEk=
X-Received: by 2002:a05:600c:8905:b0:4bb:781f:6067 with SMTP id 5b1f17b1804b1-4bb781f6085mr45664955e9.1.1794928624394;
        Tue, 17 Nov 2026 07:17:04 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783e9288sm76088175e9.15.2026.11.17.07.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:17:03 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH ath-next v2] wifi: ath9k_htc: do not fetch the beacon of a finished countdown
Date: Tue, 17 Nov 2026 16:17:03 +0100
Message-ID: <20261117151703.1802556-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

ath9k_htc_send_beacon() checks the channel switch countdown only after
ieee80211_beacon_get(). mac80211 replaces the CSA beacon only after the
channel change, and ath9k_htc_set_channel() re-enables beaconing before
that, so an SWBA event can fetch the CSA beacon again on the new channel
and mac80211 reports "beacon TX faster than countdown".

Check the vif of the beacon slot before the fetch, as ath9k does since
commit 4effc6fda7ab ("ath9k: prepare for multi-interface CSA support"):
skip the beacon while its countdown is complete and finish the switch
from there. The check reads vif->bss_conf.csa_active instead of
priv->csa_vif, which ath9k_htc_csa_is_finished() cleared at the first
ieee80211_csa_finish() and which was set and cleared without a common
lock, so drop csa_vif and the channel_switch_beacon callback that set
it. Calling ieee80211_csa_finish() more than once is fine.

Fixes: f0e449627e4a ("ath9k_htc: add support of channel switch")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v2:
    - check the vif of the beacon slot as ath9k does, and drop csa_vif and
      channel_switch_beacon (Toke)
    - based on ath9k-pending main, where "wifi: ath9k_htc: clear csa_vif
      when a switch is aborted" is applied; its csa_vif lines go with
      csa_vif
    
    Tested on rtw-next on an i.MX8MP board with an AR9271 as AP, hostapd
    switching between channel 1 and 6, one sniffer on each channel counting
    CSA beacons heard on the new channel: 3 in 80 switches with a count of
    5 without the patch; with it 3 in 200 with a count of 5 and none in 40
    with a count of 2. The 3 left are fetched between mac80211 clearing
    csa_active and replacing the CSA beacon (a print in the driver showed
    the same 3); a mac80211 patch for that follows. With both, none in 200
    switches with a count of 5 and 80 with a count of 2. 150 back-to-back
    switches and 65 AP stops in and out of a countdown gave no kernel
    report, lockdep on.
    
    v1: https://lore.kernel.org/r/20261102123430.1136741-1-mehmet.fide@gmail.com/

 drivers/net/wireless/ath/ath9k/htc.h          |  2 --
 .../net/wireless/ath/ath9k/htc_drv_beacon.c   | 36 +++++++++----------
 drivers/net/wireless/ath/ath9k/htc_drv_main.c | 20 -----------
 3 files changed, 18 insertions(+), 40 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc.h b/drivers/net/wireless/ath/ath9k/htc.h
index 59e0b3cf7f0f..fd128426b6fe 100644
--- a/drivers/net/wireless/ath/ath9k/htc.h
+++ b/drivers/net/wireless/ath/ath9k/htc.h
@@ -534,7 +534,6 @@ struct ath9k_htc_priv {
 	struct ath9k_debug debug;
 #endif
 	struct mutex mutex;
-	struct ieee80211_vif *csa_vif;
 };
 
 static inline void ath_read_cachesize(struct ath_common *common, int *csz)
@@ -588,7 +587,6 @@ void ath9k_htc_tx_drain(struct ath9k_htc_priv *priv);
 void ath9k_htc_txstatus(struct ath9k_htc_priv *priv, void *wmi_event);
 void ath9k_tx_failed_tasklet(struct tasklet_struct *t);
 void ath9k_htc_tx_cleanup_timer(struct timer_list *t);
-bool ath9k_htc_csa_is_finished(struct ath9k_htc_priv *priv);
 
 int ath9k_rx_init(struct ath9k_htc_priv *priv);
 void ath9k_rx_cleanup(struct ath9k_htc_priv *priv);
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_beacon.c b/drivers/net/wireless/ath/ath9k/htc_drv_beacon.c
index b478af1502f2..7e49ab8181f3 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_beacon.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_beacon.c
@@ -188,6 +188,18 @@ static void ath9k_htc_send_buffered(struct ath9k_htc_priv *priv,
 	spin_unlock_bh(&priv->beacon_lock);
 }
 
+static bool ath9k_htc_csa_is_finished(struct ieee80211_vif *vif)
+{
+	if (!vif->bss_conf.csa_active)
+		return false;
+
+	if (!ieee80211_beacon_cntdwn_is_complete(vif, 0))
+		return false;
+
+	ieee80211_csa_finish(vif, 0);
+	return true;
+}
+
 static void ath9k_htc_send_beacon(struct ath9k_htc_priv *priv,
 				  int slot)
 {
@@ -214,6 +226,11 @@ static void ath9k_htc_send_beacon(struct ath9k_htc_priv *priv,
 		return;
 	}
 
+	if (ath9k_htc_csa_is_finished(vif)) {
+		spin_unlock_bh(&priv->beacon_lock);
+		return;
+	}
+
 	/* Get a new beacon */
 	beacon = ieee80211_beacon_get(priv->hw, vif, 0);
 	if (!beacon) {
@@ -258,7 +275,7 @@ static void ath9k_htc_send_beacon(struct ath9k_htc_priv *priv,
 
 	spin_unlock_bh(&priv->beacon_lock);
 
-	ath9k_htc_csa_is_finished(priv);
+	ath9k_htc_csa_is_finished(vif);
 }
 
 static int ath9k_htc_choose_bslot(struct ath9k_htc_priv *priv,
@@ -508,20 +525,3 @@ void ath9k_htc_beacon_reconfig(struct ath9k_htc_priv *priv)
 		return;
 	}
 }
-
-bool ath9k_htc_csa_is_finished(struct ath9k_htc_priv *priv)
-{
-	struct ieee80211_vif *vif;
-
-	vif = priv->csa_vif;
-	if (!vif || !vif->bss_conf.csa_active)
-		return false;
-
-	if (!ieee80211_beacon_cntdwn_is_complete(vif, 0))
-		return false;
-
-	ieee80211_csa_finish(vif, 0);
-
-	priv->csa_vif = NULL;
-	return true;
-}
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
index b46be3682f21..320deb6c3630 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -1135,9 +1135,6 @@ static void ath9k_htc_remove_interface(struct ieee80211_hw *hw,
 	priv->nvifs--;
 	priv->vif_slot &= ~(1 << avp->index);
 
-	if (priv->csa_vif == vif)
-		priv->csa_vif = NULL;
-
 	ath9k_htc_remove_station(priv, vif, NULL);
 
 	DEC_VIF(priv, vif->type);
@@ -1569,9 +1566,6 @@ static void ath9k_htc_bss_info_changed(struct ieee80211_hw *hw,
 			priv->cur_beacon_conf.enable_beacon = 0;
 			ath9k_htc_beacon_config(priv, vif);
 		}
-
-		if (priv->csa_vif == vif && !bss_conf->csa_active)
-			priv->csa_vif = NULL;
 	}
 
 	if (changed & BSS_CHANGED_BEACON_INT) {
@@ -1861,19 +1855,6 @@ static int ath9k_htc_get_antenna(struct ieee80211_hw *hw, int radio_idx,
 	return 0;
 }
 
-static void ath9k_htc_channel_switch_beacon(struct ieee80211_hw *hw,
-					    struct ieee80211_vif *vif,
-					    struct cfg80211_chan_def *chandef)
-{
-	struct ath9k_htc_priv *priv = hw->priv;
-
-	/* mac80211 does not support CSA in multi-if cases (yet) */
-	if (WARN_ON(priv->csa_vif))
-		return;
-
-	priv->csa_vif = vif;
-}
-
 struct ieee80211_ops ath9k_htc_ops = {
 	.add_chanctx = ieee80211_emulate_add_chanctx,
 	.remove_chanctx = ieee80211_emulate_remove_chanctx,
@@ -1905,7 +1886,6 @@ struct ieee80211_ops ath9k_htc_ops = {
 	.set_bitrate_mask   = ath9k_htc_set_bitrate_mask,
 	.get_stats	    = ath9k_htc_get_stats,
 	.get_antenna	    = ath9k_htc_get_antenna,
-	.channel_switch_beacon	= ath9k_htc_channel_switch_beacon,
 
 #ifdef CONFIG_ATH9K_HTC_DEBUGFS
 	.get_et_sset_count  = ath9k_htc_get_et_sset_count,

base-commit: 465fcc982a221f774594aa7d7351fde8c03a3deb
-- 
2.56.0

