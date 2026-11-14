Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697009;
	b=o/KlzTtd532JS1ZJ9W27yXq0dPk6LAvL5ncLsdE+UKwN0S0vt+rirJZ93tbgA/2/XKdv
	 AFm9j+D+BWsi9TU8NCD8XjRVuEYBDK6i1YTm/ztzkdNe+9tUywRD09V/1KsOEvgszApGS
	 CbnA3XKG99jLnhZz6BJPnvJ61SaHKfRGHnHAc8JVSqDfn9/NXV4h5vNvDegN0oANxbr2R
	 l9om2SRpjIlz2H/g73Xxbr0WjEqjb34nUnuQAra/Vz9D2Ziaqz4FqcYT9xFF3R8SuJjQ5
	 1qOl2NcpCF8OfsGfym1FpyhvD5ME4N1YWIrRq2klW1pFoYP6IaAuW7cS0xWwyKn/JIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Ac5TEAvKMoiywm52qpn9d1RqtWSFCZ0uy+PXykYl9o=;
	b=yL+fXUCvwqPQwelQWsQH8PJ/dhp+TlV3vuGKKasT5INvpbBS8JZMCLdMR0SpeYd9E1/G
	 hxAUUcDHb2ExS1cxOX5sZYH3b14oIXs9tv0D2Ex7/fmq/+EJ4uSZoKHcU1SWLBTwAZtJp
	 yWroMJuQlniNGDMSW0pxOxUvvmNeN56KBWMReJay0vDgnuujN4TuXGbgukIjDOl0zVqaQ
	 6mTZ164zzVDTPtbq7Xa3P+5hU8GFUnUlVhSZS7k9XA9n6Q3zEbJi722T4Wu8jhW2UNKug
	 PXm+7oWiyDlltSMt7tfIw7kEaMoV6x/cywM6UewiI6pOacwiwjHRpqDr+OEWKC0wt9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="FnD/mjZH";
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0214606A881
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0214606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=FnD/mjZH
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso489830766b.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794697007; x=1795301807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Ac5TEAvKMoiywm52qpn9d1RqtWSFCZ0uy+PXykYl9o=;
        b=FnD/mjZHY5174VHzgTXAXnBittsBYe6XZIffGEXXS4WHJanLmyr/IpQj1U9vv8XCVG
         ByKojESN1A981LMB2crZFhFSJT7Y6TlVxuuuY6YcGNkFBw0ylslSImEmYwOG6/xam+/W
         gf22QoZ80yEkHfLM0LdQbMuOPBw4KIxKMHQALUbjNuDQkEPzHcj4BOovzBSBSDO/yzEP
         WvF4JNZM20pWAjFbKpEMjJnJzmfL8HFwcmM343AEftOxhUH+Ta4X0C/wGPefh9Dso4/E
         9s69SjD5aonDjeMnKnSZoQbrcFYRgS/yQ48/X48aPJt5kwVlBa8LRVkFG5jCTIvoxJeo
         yIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697007; x=1795301807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Ac5TEAvKMoiywm52qpn9d1RqtWSFCZ0uy+PXykYl9o=;
        b=L3WwNxfKzrb+YhsCF09B3rsBqRRqLSkbgUv1/oAuXzfpQifO1R89bszP1FP4hCe5y9
         CBEXv5Sjs4xsjjz7hgFvIVhNt07Xk6P/DiS2ljn/FhkM7q2r/MXcxSScW6k8abxJEAAZ
         o2gaSujMoyHVhZXKXvtMp0f3LiAU0tC2/ftSpd6FUVJ9pEo4e31C6u4Kzzz28BVVFddG
         bg2O4rxFrAz+aShhwTcubLMb/TShnJwGd/NO+hcPdHKNEqG30Z20rTXhoLHrsoGAhzd4
         PZ12n5xl5ldClSHbqkeWXtfG+/7I3ZEHOLc20Uc3IgH8WkCdPjbffoLN5DafnQglHafl
         FSmw==
X-Forwarded-Encrypted: i=1; AL+hErEwb4o2VEWvE6D1wZ0hJUJlU8JKN6VyEftJsAet66lvpwjzost8jIb5wuUpOeLvjyQ4/e5Bkv99XYz72PI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+GWUAse7M5BcK0Wsz6BZoen8F1YfqyI9KiOXP/KNu7c5/FRMA
	9RRModiRQ0+dC3H/pwKAJfXp585KSd5wN/TtZJOtC0QV43FS+EmaP5wvj5+4ut1j6g==
X-Gm-Gg: AYBFou3V/wnIEbAoLyujYUsT4Wl+Knvr7OpLv2euXA8/UhD4JJB5Gl3SW5jD3R8SKDD
	atb9g3fcGwzpXuTksHUg9s2z5Nue2q/B0rrXL+mE6Ga+e5XJqC69ZlzMtYKDfitVqqi4KCSlJQi
	G4p3mB60N/tiYz0D/+KuzJlR8WgkuvczI2brhDi+j0/970typp9EafA6xRy9Ui3NK1GDzqD7OaU
	ryof927sMfJ+lyEQ37RWJngGqqJ9JNlhYS4bHL4nhCoG5z2rejM9xzz/chhNb/hfYhoiDlLg8zR
	G7tNGCekeuEjuFkpN6T9v1zJmxfw/HhMrKBb3mzP5KKZQtNKrffZ7bA1CNBJ3WErC8GfqFvDDme
	fdQl/H/6zVjOqqL9XoWO1FX+5MFXZFUmYUk+Lw4XPWeEa0HZJH5R0vci+cZEUDaE/6f1DYxI4iY
	fAA2j5m67mxX9PoYppC3/hhj0lnNj32QDBkd45+nCup0kmntNwsFPGmARco+fmhSXVVPeJIda2Q
	BB3XNa34rCiWYzdn1tNyCfdkHkmxNMX4++LlyJYeoPOkcf8PS8BrMC6sjexCFWtfWthMk738kXV
	oehX/gB5aeQ8FwvpyQl+LobmS3ZhzCxnDb2Z1W0jZkrKmIqCxVGLiV8GTvGJPbTMU4k3ZXAxOkV
	H7IE0McXZmlcXArCPZ9/9icg3kueUb6GMXKFja+MSifJPi/+LmJjUKrvDJFhmleCdEqLEsegiqw
	RgJrL4+hXv2qTATW6Y3q5/VK/NY3YMD3Vik58zD/27edUkwQNXWoGLnXZWNYroVoMd/r4ll4ZA5
	zBGrQEa5Wm9KL6Dbg4A021X1SnT9JvVqJncWWFVykLamt6J0IuGFlV8F51GECxU3K8iHqJ7gwSd
	h4VWornSfAEWphme5s8DKSETNOfz99OxqkR6G6wVymf0SvWzOOIxQ1inIs8Vxs55
X-Received: by 2002:a17:906:f043:b0:c49:9247:9688 with SMTP id a640c23a62f3a-c507bc6cd67mr755011266b.7.1794697007245;
        Sat, 14 Nov 2026 14:56:47 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709e8006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:e800:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c757esm2751595a12.17.2026.11.14.14.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:56:46 -0800 (PST)
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
Subject: [PATCH ath-next v2 1/2] wifi: ath11k: forget a key the firmware failed to remove
Date: Sat, 14 Nov 2026 23:56:42 +0100
Message-ID: <20261114225643.962015-2-julius@bairaktaris.de>
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

mac80211 frees a key after set_key() with DISABLE_KEY whatever the
driver returns. When the WMI command to remove the key fails, ath11k
returns before it clears peer->keys[], so the peer keeps a pointer to
the freed key. While the firmware is down, removing a station frees its
keys this way, and the following ASSOC -> AUTH transition passes the
freed keys to ath11k_install_key() from ath11k_clear_peer_keys().

Clear the host reference to a disabled key also when the firmware
command fails.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v2: new patch.

 drivers/net/wireless/ath/ath11k/mac.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d..9c3f577c9562 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4615,17 +4615,22 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
 			     !arvif->num_stations);
 	if (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta) {
+		/* mac80211 frees a disabled key whatever this returns, so
+		 * forget it below even if the firmware did not remove it.
+		 */
 		ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
 		if (ret) {
 			ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
-			goto exit;
+			if (cmd == SET_KEY)
+				goto exit;
 		}
 
 		ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, key);
 		if (ret) {
 			ath11k_warn(ab, "failed to offload PN replay detection %d\n",
 				    ret);
-			goto exit;
+			if (cmd == SET_KEY)
+				goto exit;
 		}
 
 		if (flags == WMI_KEY_GROUP && cmd == SET_KEY && is_ap_with_no_sta)
-- 
2.53.0

