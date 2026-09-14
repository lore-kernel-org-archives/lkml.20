Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB6B4772A3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394271; cv=none; b=ZuiSMcBuGPnyALkAwIstmYEFHWKnzwi7pr+lt4gga618J4fNZ7FlX7acpbTRs24hmN2RH+MKvVI+tmkSa4UtU1zS5+BYR6fncA6DZZr9ohpzWfxA1lTBmnBlk2GF1jjo/XFmGgV4CdP8Xs2mRSB15UdCoSjVxcQpquD++7I6E6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394271; c=relaxed/simple;
	bh=duDW4MTgv9us/ONwJoTNsNlJr2TmZ9c/C+zVNu8JAhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BWJ2QzcqusIHBhU3iEcFhdK0GwtVizRU8W4MTBx/LUlTwUYaoV1QyrF3JCy+HgY0x293elNC7VqzceM636UTHebGbL8Bj+JkCPqjFLyYv71x+QnN8bUc2X03kEYix99xgDfhZLnycIHrd5GFVTCbIUVmKzrFYDVmoSQu1wti/8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5hLORXQ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5hLORXQ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso15614765e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789394267; x=1789999067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pm6FQW4GbFGly5zHN646NB+7TgBYiGFIis+XHe7PrJM=;
        b=T5hLORXQMV27+KYjDJ4nrfR4bnw7BkRi9ENZmKcpM/m+BtRo3Q3MrSR2rmgEosIG6D
         kF0MO3TUSZsFjIIS/TB1gXyBirrNVvfsZ2IZ+n5NdrMcUFeSP080+GGNLc+VXRniHwZR
         XZqYcUalEuNMPLlsE30DIvfvGWYZuYpHk+d/08YHT6u84c0i/GHyklNgRHy2SHYXe45E
         9p8UrfBRIUsWNU7N6QI6NddeNFOzpK0yWwsng/zuokNmshOnegkXi2/q0vzJleiePvTv
         /TE0aimoXTAsxPXul1hFF3SjFjWfDm9ADsc2V4ogDJUqEJJyA3yV7dLmdkdO8gKnZbXV
         lxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394267; x=1789999067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pm6FQW4GbFGly5zHN646NB+7TgBYiGFIis+XHe7PrJM=;
        b=C/dltLnVtVvjXisTKIA3GDDgpNjVo7z4bboQ0+5bQ9LpHfMWwf++iZKZpFl109WMER
         VbYE14mJFaG0XZiUfxkcqGGSfhisITqJa5zdTUbWXzY1dGY3AgYgD3xKVNwCzdZfueN9
         FZToUK2/nNhRtXIoraGCoh0b9kgYnpCxaOZKrRqg+VtN09WnAxiEZjSg77Ll2npIYzMS
         pmr4h7P8ngGKHG6N2o/Y8I6+UPSaiUjNsAz3lbJaKpNy/VqgTnxF2eWYK+XYoCxXPTZ9
         Js4bD/noGwRhBVLzSWBzvFLJkMxiAfgNIs4NvnR2phSXGj/HqCXgEvVjFfbJcaVk2xLd
         LxcA==
X-Forwarded-Encrypted: i=1; AKwUvBxVbXNkVS20qwSp6L4SCe9y083cmvYa3QTvMGii9JL5EPucyMAYNCPwjRMiRE9gu72a/mneQjQWT+rB5WQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lOjncrLeJ+fjLWOKzfsb5cKnQH3HGxNlpNn8ueDG3+kB6r2/Au
	B6Wa+wQgdYoeRnPEvCHilGZs97x/tbn2p0TLUCpYfCIXbzz9Qsar/ub9
X-Gm-Gg: AYBFou0NbSiOQ6NsZiA8kMwukL2n3cLLKg/I72/QwFzQdB+iNOc+PsdS0ZMfwrltvZq
	ssCHX6/hZ4M/XEZBrBxdaEaaV+a1tH9f4+qCRTJtGhxTcq9Kvi4zJofZ06bazjnFvBcWOE/dz4J
	uSOfbr8xxYwdygMEzFWzlZjzGUki2ToCNe3CGqSqb2VmSkTWtTKJyN6xHv8QYC9BoAGvjj5E0Pv
	cX4iAqAry/IFBgxe6y4j4bUVL7HHBj4WXly270klEKGyjahqgd1cfBv5/wpfe6aNnFAUSkqW+AJ
	QIzZgDXOEucStTPi+mSsX2gFSbnXdhGIFu4k5ew2YavTWVCy9fFhOGiHsN5B3c9ptzHm6/cqbJE
	dHvhwF7n/XLlEIPx9dSwjmWeGLXOgsPGPI25M+jM9dUUFwWW3KB1kSitAGbo1xXtzvgUkK/K1wO
	8etDXuWeR+x26R9DHLZPy5vry8LsRNQd7F+4ZC7pHwWgNgruhHfNHQXbUSkjz2670VbkQ=
X-Received: by 2002:a05:600c:4f81:b0:49e:6683:d23c with SMTP id 5b1f17b1804b1-49e7a5edd99mr31944155e9.0.1789394266695;
        Mon, 14 Sep 2026 06:57:46 -0700 (PDT)
Received: from zephyr ([2407:d000:508:1732:c5ca:107f:bc81:7575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bc5fsm382832675e9.3.2026.09.14.06.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:57:45 -0700 (PDT)
From: Muhammad Israr <7israr.work@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muhammad Israr <7israr.work@gmail.com>
Subject: [PATCH] staging: rtl8723bs: add braces on all arms of if/else in rtw_mlme_ext.c
Date: Mon, 14 Sep 2026 18:56:39 +0500
Message-ID: <20260914135639.28269-1-7israr.work@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch CHECKs: braces {} should be used on all arms of this
statement, and Unbalanced braces around else statement.

i checked the kernel CodingStyle, when one branch of an if/else
requires braces, both branches should use braces.

did not change any functionality

Signed-off-by: Muhammad Israr <7israr.work@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index c39fb142302e..e60b2c825162 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -356,9 +356,9 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 					channel_set[chanset_size].scan_type = SCAN_ACTIVE;
 				else
 					channel_set[chanset_size].scan_type = SCAN_PASSIVE;
-			} else
+			} else {
 				channel_set[chanset_size].scan_type = SCAN_ACTIVE;
-
+			}
 			chanset_size++;
 		}
 	}
@@ -1221,8 +1221,9 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 		memcpy(&pstat->htpriv.ht_cap, elems.ht_capabilities, sizeof(struct ieee80211_ht_cap));
 
-	} else
+	} else {
 		pstat->flags &= ~WLAN_STA_HT;
+	}
 
 	if (!pmlmepriv->htpriv.ht_option && (pstat->flags & WLAN_STA_HT)) {
 		status = WLAN_STATUS_CHALLENGE_FAIL;
@@ -2838,9 +2839,9 @@ void issue_assocreq(struct adapter *padapter)
 	if (bssrate_len > 8) {
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate, &(pattrib->pktlen));
 		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (bssrate_len - 8), (bssrate + 8), &(pattrib->pktlen));
-	} else
+	} else {
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, bssrate_len, bssrate, &(pattrib->pktlen));
-
+	}
 	/* vendor specific IE, such as WPA, WMM, WPS */
 	for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
 		if (i + sizeof(*pIE) > pmlmeinfo->network.ie_length)
@@ -3848,9 +3849,9 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 		memcpy(bssid->ssid.ssid, (p + 2), *(p + 1));
 		bssid->ssid.ssid_length = *(p + 1);
-	} else
+	} else {
 		bssid->ssid.ssid_length = 0;
-
+	}
 	memset(bssid->supported_rates, 0, NDIS_802_11_LENGTH_RATES_EX);
 
 	/* checking rate info... */
@@ -3928,8 +3929,9 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 			if (le16_to_cpu(pHT_caps->u.HT_cap_element.HT_caps_info) & BIT(14))
 				pmlmepriv->num_FortyMHzIntolerant++;
-		} else
+		} else {
 			pmlmepriv->num_sta_no_ht++;
+		}
 	}
 
 	/*  mark bss info receiving from nearby channel as signal_quality 101 */
-- 
2.55.0

