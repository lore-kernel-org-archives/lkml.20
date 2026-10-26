Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993047;
	b=5E0cBB6wo/Dcgl+kjQbuRYKwjk1MBH5CyYsz/yy9Y9vojJLcHDaLV5R2hLX2mLsagpLf
	 0QwwGtuDyx1psPE/CL84my4PJsdWQgIR/FBcjkBBSTLymuHY4tMmxSpDJouytmYOhEDfF
	 wPh9OuPbh+lcMVO4aM++5EFS1v1mUFZedVL3KgJ8ZhX2JjVvhspfko24i11Ee/ywhyZ6j
	 LomCl7T0RD2i77RJ+bVlBtbkdcqW6dABQ5Iz2/HSe7Vc0C/EvK7NobvQooq77ez0gzdFS
	 pI1I7uiEP8zVXRnNAlLp1clQHsISmSNjbSlSKZ+MT87P4npJlpZVPVeuQmZ4CLWR2XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cdjemExUanYI/hEJuo3YfwdKRJvOmxKb9CCJzMVOt5M=;
	b=JZx4DqdtZ6LeqtENgdO1vd/eokIs8+uO7rJHGQu2L2UKvQKhrSMeDagRLuh0HVB0xZMr
	 oMCTAvhHbPrJQ9BlA8yIAmrwgBTm+U0SUqjZ9Oh/HuGF+C4CE6EBFDXwmHz7JT1k8DfG8
	 XviXSKNGL9LZcCfplGTxUNkkhH7j/SU+6pShpBfY9MeF2aUwy08TFnAnIb8hHPDXJurIm
	 JNwdGrrYXg+voC3xniymSEQSXvUVbYDxWVf/aeoQCINOoCwA+mHK1q9RWL7RsTTLOrNl8
	 hByFq8+O6yPAz2W17gFWsytApS9ScGza9xDh8HRPpyn1W5MeD3dbT2HBsfgLGAzhjng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eMqiACDE;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96FB606A333
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A96FB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eMqiACDE
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06b436dffso1172689b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993046; x=1793597846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdjemExUanYI/hEJuo3YfwdKRJvOmxKb9CCJzMVOt5M=;
        b=eMqiACDEGwBmfzTw8w/a6w84CCEaDMUvw0eFqNu52lB81TmgZ7B6MCf5/CW97oxu5N
         D6wVjwGech55e2Boft+dFclJFKKD+rTra2lDg18N2SAHwyFGD0+kNOrmcwb5ReNRvrSj
         2KnYPNsqigvlzrOCgq+w3KaRiUb286HYdnFS3bRh9oFMzN5mQ1AqelMaMpcSa1s8X+6p
         iazvsVkLnrJLO8zxpEjx5rqkJckqMDG5OPoz4CUKn5BkNmDJRfl9Qt9v9DScScfAR3iy
         /+UZGLSDjQIyNjp+cMxJ5Qpkmtq22Tm7b+rV2ipwt0xc8L6vyLkeGnyQPHG7VfglmmkE
         /3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993046; x=1793597846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdjemExUanYI/hEJuo3YfwdKRJvOmxKb9CCJzMVOt5M=;
        b=1Kzo8vl2xC4RZeZSr8Fnrj9GIMJfbWzxAb6EsgqKBicl1JtfX/BbNarh3XGPdpJneJ
         HXdd+/5tLXQAAYpCvCqTWSYLBJCagJjhuyXqJOHBK4rhq1IcLSBffIVFYA0JpmjcSg5H
         DaN/9bfNg/DFs4kX1CwRi9Jv2j2VgaCumIMpF5KqvdgsQhVv1AsyqPZxua9xTZFHeJyd
         sVNkpeXNXS73SlR8mRPQ05lyloorVGVnEOsPZgqTbPcRYLX8cb8+73OPS7ZDhtU4QcuC
         R1RB5Zu2XHVAmSy+nTshhzy3sZpSN7oLFD6tnH0z2bzDL7fo67rtW6sinB5aNw9TjB8e
         rvBA==
X-Forwarded-Encrypted: i=1; AKwUvBwk5kdZLws08qgQHsbZrtY0vQz/9PfeMrv3T8glgUfgbsk2KlWuxbKaEF77e4IQrUM/in4a9A646d+zvB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcX4FhCDfiQ2VolFvymYOw454UyXUuTc/yBEdqoJPyQq6WlzM9
	ETvtGwbkf5+AC2YYPPAt0I6SpWCLirg5EkqPrfvvDS5zKFvQ+JVKmBGf6QRVaopE4v69pQ==
X-Gm-Gg: AYBFou3ocK1Yl/i67xxZnLaLSGrnDwucI34nfggNIfHFy5T6b0YIJLBgxBAbtVCEmK7
	811ZY3uEPudOBBFhdeld/dJZ/tL4gxMd8SlH1drX6Gv+HRt1NG5fh08VtPldKn6pljXoUiJIEdn
	GLogpEsjd0dwyC9NS5A2nK+SORH54XoOzq+HAsxfIMIrbg88ZMZWdpfngIP1PFRM+eiQKkoUZoM
	8EzpkiSwqS4s1s8VeH4uCPwFAOUWPn8J0EYc2WBraAQYvZxUlpzj59E5cCAgvoBICU7L0DjjWfH
	HhzSurmJbFAi2f6KpgVgBI8yKAR2sbOV5H133YcgPhnqPjQRqGgzmz5evUXPHt9BT+ISM/ozaSO
	GhiHvD6PnSUu8j/egP6bf56AxIPQwgp5gSIPmZXWaybiYTDXmKngJzjfm1D+DL0z5ocxSxlUhU1
	M5lCLDSXciLV3U01tgoVU61V/+pES1GD8A2SpQ+sMgaD0sr4gaaC76XP3NhU9jRPFWyXrlp3qyc
	6wRpU6tv8F49AZYEGO5mUPBrYmypuksJHQ+It9PrSF1AwHjq5q86hxLdCF7cHmPIgObXHhdqCqv
	mLCW
X-Received: by 2002:a05:6a20:3c8e:b0:3e2:b295:7678 with SMTP id adf61e73a8af0-3e7bfe01e08mr4900297637.50.1792993046052;
        Sun, 25 Oct 2026 22:37:26 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:673b:a930:e065:eca])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d867a0sm927851b3a.2.2026.10.25.22.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:37:25 -0700 (PDT)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH wireless-next 10/17] wifi: mac80211: export ieee80211_get_bssid() again
Date: Mon, 26 Oct 2026 13:36:16 +0800
Message-ID: <20261026053633.361454-11-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026053633.361454-1-ragulbaby@gmail.com>
References: <20261026053633.361454-1-ragulbaby@gmail.com>
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

Export ieee80211_get_bssid() again in preparation for the
new driver.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 include/net/mac80211.h     | 12 ++++++++++++
 net/mac80211/ieee80211_i.h |  2 --
 net/mac80211/util.c        |  1 +
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index a1a6409b4..607369e32 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -6166,6 +6166,18 @@ __le16 ieee80211_generic_frame_duration(struct ieee80211_hw *hw,
 					size_t frame_len,
 					struct ieee80211_rate *rate);
 
+/**
+ * ieee80211_get_bssid - get the BSSID of a frame
+ * @hdr: the 802.11 header of the frame
+ * @len: the length of the frame
+ * @type: the type of the interface the frame belongs to
+ *
+ * Return: A pointer to the BSSID within @hdr, or %NULL if the frame
+ * carries none or is too short.
+ */
+u8 *ieee80211_get_bssid(struct ieee80211_hdr *hdr, size_t len,
+			enum nl80211_iftype type);
+
 /**
  * ieee80211_get_buffered_bc - accessing buffered broadcast and multicast frames
  * @hw: pointer as obtained from ieee80211_alloc_hw().
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 1a6cbbb5a..ee3a49321 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -2968,8 +2968,6 @@ ieee80211_process_tdls_channel_switch(struct ieee80211_sub_if_data *sdata,
 
 const char *ieee80211_get_reason_code_string(u16 reason_code);
 u16 ieee80211_encode_usf(int val);
-u8 *ieee80211_get_bssid(struct ieee80211_hdr *hdr, size_t len,
-			enum nl80211_iftype type);
 
 extern const struct ethtool_ops ieee80211_ethtool_ops;
 
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 44feb8027..182b41db0 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -104,6 +104,7 @@ u8 *ieee80211_get_bssid(struct ieee80211_hdr *hdr, size_t len,
 
 	return NULL;
 }
+EXPORT_SYMBOL(ieee80211_get_bssid);
 
 void ieee80211_tx_set_protected(struct ieee80211_tx_data *tx)
 {
-- 
2.53.0

