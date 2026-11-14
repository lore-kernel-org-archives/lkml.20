Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697011;
	b=LRE2whkR3tlXt69ytO7teVXe92fL2YU1sivvcBAjNDpozkNL+uAXD400VMxGGqVLbiPZ
	 Zr6vF3tRyC2rB2zGf5dQfYUl+iRA7kGW5W+cZ8tt3l8snjcAHZfKnf7SzRyPPsAgJqHr3
	 ajWJOIQMyqfhpon3fqKQUuBXTOh8yLKRldZpEFb8tK7FSrpiP7Edvmw+qrKhUeZe6K30G
	 S4goCYOvQjtWkNvahzyFSEPal4hG8jmgaGDPyFvWXgj1OGjp2EVSgxvj4+L3gxIzSo1D7
	 Ye1iVpZlJ8ju3zCpKsklTAl5qxKFxi6R4IoNKHv0SEHTgTvnHG4atbZNLCryLsbt6Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=txq5guNEURnzloFUxneFtdgs7wfJ4RtNVYK1I5nSsoQ=;
	b=KoyD9jXG7sVHaEtGQa5eYuQLgJfb4g8lIw8mlRdL7OSFiiTv7F0ak1CaEV6dx4TABE8l
	 aeYCzHFhvY5MjyeJLmE8dxtHTnDSjN4FeTIlikn9dWZo6waB9nwfNLyqUVYhg8mO5mF26
	 1ZF+f/MKNQyabNWk3uZZmo/sc2fPWxARj5SMfIHQDlNbYOescwb0gBkPtnO5ysRD8HaIc
	 YnAY/z1pDTggaeWyrrDgcEm+mm2mJJr8tlCMWdFF/DogC/UNrfC7w4gA5ynecYXPc0ZUj
	 JePrwnIKxQJVvZONaqXg/y4fdJKMSJs4dKns9bvJSWuqaxsoR3QlUNE8q+358boFUIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=mwSMrdFv;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D9F606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34D9F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=mwSMrdFv
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4395d31228so396207666b.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794697010; x=1795301810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txq5guNEURnzloFUxneFtdgs7wfJ4RtNVYK1I5nSsoQ=;
        b=mwSMrdFvaSaMRaFF0ZK1A7Bi+hr07aNrtMR/yqpDHHpdOCXYAjKCfbRhpKHjJJBnUj
         2slvF7oq8zinzMNOJoaFu6wWXpg33+cSKSQWmziJJ6hnlrqeLMOJkS3okR9Z9A/ebUk6
         08qqg1uUhMdWHFmrTN9f1qP3uqEf6QKAI15SaGD996hK92sBPKzyiGhKthcnrh6FCBzw
         /agATRKU4NhuLnKrogoQqSUWtpIAtcR6trmGdDNhl2S7KMz4TIT0qXatxmZrH5dT2m4K
         3yJmuSIkqdHDYYnEoH2u15D3I5vauhFRAWClif4zc0KHrorhIomjX/j/PCDlVBJO4mCo
         ZITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697010; x=1795301810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=txq5guNEURnzloFUxneFtdgs7wfJ4RtNVYK1I5nSsoQ=;
        b=uBPT64dmN+ZlueVkB3mB1S+ZC1YzQE8QPCp7XD6qKjAAq6JSY1a4yG8DojtsLa9+zD
         r2p8ew+yr+nSYObPMODNCShhzLJbMjiO2bazX0kFjDsMORnDDK7gUA6h5iVJyioVn93E
         INY0bg0lNiXjB7b5gpsGi4VfVqaZT+nhgBEr3MlnrxDhkAZluBuDnCjjarj7qOZgbSZj
         0uO/tf481HZJBVQza+5sl0wwNnVHtsRpdHQZPEA8Pp6XPDzIGoZgE17E5Jth51ZBbN5O
         0KMVgy9GQzcFiqnVmbTHTo/tlb1VVy0NJwzwWYcnRDpWsZBGBmv5t/vnypWo24S8JR11
         t29w==
X-Forwarded-Encrypted: i=1; AL+hErEC2CBCmd8QbZF1cjjae9IcLqnm4LKe15MNczRodpgefBh/fH35iOFLnfjK/I4ivymBu1vd3FC8ycoDesU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8izwuiIHb/GIlNzRAJjmIDDHItqaWye5AGP5esWZxj1AgaDJUo
	4qmG16r8b0JChkjbPGG/kYkqpkydt+BjarSJ/WdyaDejQ7dVPaAayPpMxsFiwgyWVA==
X-Gm-Gg: AYBFou0exUusYNjgktaL4Gaw4Re3N/IuUfeWKFkBbyBu6fI+rR9EbdWfnv4ecop73q0
	XVEmW6AK2awVkFA4aFKIjgWDqsophu8IAIgoW4DMD/n1KhdyGDrzV4D+omjW1eGuydnGm8dbsaw
	6myPhsPTn/h/JmxZrEjf1ksFuZBCGXsQClrr+Pohc2AxlqhgYWJhtOVnCt+FW52Rh5qHvrsXI7r
	fq8Q3BLWqzpyFuEUujUWCVZbAI9NCTW6MKhyjD+Wb/UhDUrNYcBeGzBLM+sicOJ2lsokDMzOQWn
	KTbmTgEigdwOXt7g1WuEPVJ86/ymh/tuIxLNqejoZx3eaMMUCX49NTkal8Dlmdiuczvdx/PPiL8
	XF792S0X5yYipAOF1G3Gg1bmYql3KYioKizOapdrEqUU4dP28f67x03woirKe7wEugbt6paDYU3
	wmWDKirk4nbrCo85QSWtBNwiuF994OdB7+R4+CEKwQ3QivXf3sanbiBiCp2vRCLAZxAsDkVXfzY
	LRpXF9sTWOdwQ8xm+Cfl5AhxaawNQqrC743J2XkD/8L8tChX9dtU1nJOr1nxk5zEz/L8dS5oBMX
	utonLSH6iTvA1zUhp35BK6cu1pWGLjc1+oUty1p2VLY2TV2H/rimUg8PVOLq6rvzyYmLWjo4L31
	LPAwe9GChCKmsvq6HVIz7erVyv8leg6yB7dZkXCvcxx/NxvCsROCeXktmEJt4kOrLDclYi7hpVk
	mCZqcVx9psRRNeXLTV7xwsznm1S5YEvPTOoHRZ5p/chhTMkK69OM1U3OZQ9vYbU0hYoWBFcESYP
	5hqFHtSh18NgAkTvm9zeYMkmmxxaUfu9G9tP01ViBSBpWDtlPHVY685ajoS7ZR+xODVoO5W8R2o
	eCDtiBiqoedKV/VOI5AfxnNXRORTh8CW5wycyrO1E2BF4zbCFbXoNMwy2nO0YrpN
X-Received: by 2002:a05:6402:194a:b0:6b6:f5b0:889a with SMTP id 4fb4d7f45d1cf-6b7c0ccf784mr6027031a12.35.1794697009564;
        Sat, 14 Nov 2026 14:56:49 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709e8006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:e800:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c757esm2751595a12.17.2026.11.14.14.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:56:48 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	John Crispin <john@phrozen.org>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Rajkumar Manoharan <rmanohar@codeaurora.org>,
	kbuild test robot <lkp@intel.com>
Subject: [PATCH ath-next v2 2/2] wifi: ath11k: do not fail down transitions of the station state
Date: Sat, 14 Nov 2026 23:56:43 +0100
Message-ID: <20261114225643.962015-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114225643.962015-1-julius@bairaktaris.de>
References: <20261114225643.962015-1-julius@bairaktaris.de>
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

mac80211 requires sta_state to succeed for down transitions and warns
when the driver returns an error for one. ath11k returns the result of
WMI commands for ASSOC -> AUTH and NONE -> NOTEXIST, and these fail
with -ESHUTDOWN while the firmware is down. A station removed during a
firmware crash then triggers, for the disassociation:

  Driver is not allowed to fail if the sta_state is transitioning down the list: -108
  WARNING: CPU: 1 PID: 5952 at net/mac80211/sta_info.c:1561 ieee80211_sta_eosp+0x119c/0x1668 [mac80211]

and for the removal:

  WARNING: CPU: 2 PID: 2080 at net/mac80211/sta_info.c:1652 sta_set_sinfo+0x1118/0x1144 [mac80211]
  Call trace:
   sta_set_sinfo+0x1118/0x1144 [mac80211] (P)
   sta_info_destroy_addr_bss+0x34/0x48 [mac80211]
   ieee80211_del_station+0x1c/0x54 [mac80211]
   nl80211_del_station+0xf4/0x174 [cfg80211]

Two of these failures also skip host cleanup. On a non-AP vdev of a
device with vdev_start_delay, a failed early vdev stop returns from
ath11k_mac_station_remove() before the DP peer cleanup and the station
accounting, and ath11k_mac_op_sta_state() then frees the peer with its
rx_tid state still in place. For a non-WME station, a failed RTS/CTS
update returns from ath11k_station_disassoc() before the peer keys are
cleared.

Warn and carry on with the host cleanup in both, and return success for
every down transition.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v2: continue the host cleanup after a failed early vdev stop and a
failed RTS/CTS update instead of returning from them.

 drivers/net/wireless/ath/ath11k/mac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 9c3f577c9562..a86d1b6c0d73 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4984,9 +4984,7 @@ static int ath11k_station_disassoc(struct ath11k *ar,
 
 	if (!sta->wme) {
 		arvif->num_legacy_stations--;
-		ret = ath11k_recalc_rtscts_prot(arvif);
-		if (ret)
-			return ret;
+		ath11k_recalc_rtscts_prot(arvif);
 	}
 
 	ret = ath11k_clear_peer_keys(arvif, sta->addr);
@@ -9922,10 +9920,8 @@ static int ath11k_mac_station_remove(struct ath11k *ar,
 	    arvif->is_started &&
 	    arvif->vdev_type != WMI_VDEV_TYPE_AP) {
 		ret = ath11k_mac_stop_vdev_early(ar->hw, vif);
-		if (ret) {
+		if (ret)
 			ath11k_warn(ab, "failed to do early vdev stop: %d\n", ret);
-			return ret;
-		}
 	}
 
 	ath11k_dp_peer_cleanup(ar, arvif->vdev_id, sta->addr);
@@ -10079,6 +10075,10 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 				    sta->addr);
 	}
 
+	/* mac80211 does not let a down transition fail */
+	if (new_state < old_state)
+		ret = 0;
+
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
 }
-- 
2.53.0

