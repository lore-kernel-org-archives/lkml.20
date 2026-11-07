Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059453;
	b=HKQMhAa4RfGgKTEQfQzUxbEI4JYaWDC7hqwnyqD5cp/Z55c0liyIKxvY+FcytIsrmtGG
	 QRFWenBM+xuYvCrV5xnobg5LKpLAvE4t9QPQWTnbo4EToVRRf19RW/4S9Ic6AwFxoBbFJ
	 3VYjuzVqpjOAfz2ScjfBacIdFoTEoMgntGVAB0Fy5ltItmnOS4krjc1QCNweSo1EML5lK
	 n/e2NIsDAMipW1Ghlnd7Q/5rD5FTEFbz05luTcyZKLuPBSzqcz+OEYfSiA4XKhND03m45
	 h8Ah6o19Kx6guJpeoOoM8wzEmJGLT46GxTYI0dFmI/Z+Q6fOnSDAjLY88MMDFGJWw2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t+BvgmTQl1zTo5EqV52B0itc8Z0S0F4G1wzUEK6ITJU=;
	b=UxkesSXiukAypcZbaVy+zx6X+vI5/eZdaTvTlzKnrJj8TBB7kFyHnVtwU/XXIv+xqnyR
	 TEUqkU7Kkfry3nijMQfE8Ul2OyyyWBy7u6dxlMz4zJy/662SFJ+ygXqoDTFOhuvyX1Ajh
	 Ukh2mLxHjbAxy6pjpK1kFw9pslhcO2gb1cuQTqp8eRpYDfw9lC4paymmS6ZDZp7lPoYXU
	 a8SvjLjZqObJTczaFStc/ioFHN4jcbA33D/Ve0shtr2hfRkMJO5Ry/kA2XFehXfKVIxw5
	 1MuF3Bx/ctrVSMQEZCJKXR1qiq7h7bArDwFrBFsyxVYA1I9VFOQmR18xYmlroV1w8mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJSUQs1a;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556CF606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 556CF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJSUQs1a
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so331027eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059451; x=1794664251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+BvgmTQl1zTo5EqV52B0itc8Z0S0F4G1wzUEK6ITJU=;
        b=zJSUQs1apFryTHeFGNPhbE8vS2fP6g4G5hrLi+BTx+FHU2cOiqinAvLVA+YcXDWSNs
         oeGRfnIdM5/pleBD/qVlz9XveLJIvmoaTxSpwpoiJ5AtJOAqWdOOauBEPT8N3EMfglPf
         uffAwvpJRIPKhp1a91qNDXqdu7928DOEVvpZBXDo0oZn9oh0tu57fybb+hCPoLIjj+oK
         9ZhifP/Brh4hoGOOYXYkjA8V8lN6gCgscuYPmqyy5Xw3eNWQRJMktCknO1J22iiH7PSe
         ZJfn7snBPKqKaflSycYz2U3d5WeUy52p8ReAdOZffUKgxMe8dcVZQS/1NgrMMcAIpnPt
         6iGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059451; x=1794664251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+BvgmTQl1zTo5EqV52B0itc8Z0S0F4G1wzUEK6ITJU=;
        b=aW2/QP3dZbFkSqlGJ2lkBQbECR7NH/01pZCitzuqGvyRxEc+fbCuZ9xIbEG5xYo1MF
         fbn+0SpIYIj3MW78Mu/5VSiiWu9a7saSQDMFRSVdnLK1fnXQKfar79S0O8LFXikNroLr
         +pqbbViqHPLuz9kNSyOGxp1OmbELKRq589rbW1OUidrkIDvUupHdl38tAvKEmlvgaQTD
         Zbwk2BI357NSsyTR6tfi+3Es5cv803zhD4omPhcrIbCIxOMZYLjdAC84GJiwDIqulZ2n
         pgafv4YPjfWcNxMk5YuFhryiQ5F3zDG8yatUMhAE0zDofmdhGm9xA1CID3JcGGmo3tf1
         fvlg==
X-Forwarded-Encrypted: i=1; AL+hErHVZkIHt7UYFkwJOZSgpqpZql4cvdifhuvI8MntenV6wmbW0d6sFgNRCuaom2NfZKO3tXI/JigOWyNr8h0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d7KoMrUCK8zcll4aX+E2nc23BSK9kWVMtoVSOT6nS0InW/VWO
	LLLANrPySouEGfh4jig0EZQvyzI2UqqDyA6ZQXh2Ie5XtvdyimVxSLwm
X-Gm-Gg: AYBFou3/AJW3fErjptd3ng4AF1GDC6rgkso8GsJeEkrCbDibjhLSD8pkaFCJHNltV5a
	+skxWYhtybASHqvYuF/KoeOdf5euD6GKIzyUmClaAcwSc8UknscUW5swSew6qANTCAmBjaSWBpp
	byjbqX4q/QxWjZRE6VnhfK74nh+p5cttDwg7DNvgYvlQ3wCIZZH9FvYbGNhP5ybkrPW9qznOMeJ
	A2ZAwUQ8Ykf5U4Az8qZw8N9M0dpiyvBuR9HS5dcYEa71TUqHUckPX2Nw+JtqJAB8yu7Urdr0z6P
	aahfYT0njjiMkXF95NWAuoXuljHwGCIklhY+pmw0KGhcgw2zCFziDHwl26+4dQ4JjXxcrrS3me+
	Amqu7E5A1coi7WXkwtg+SD6wH78DTpYPRl/4mybE+AI60vyg0fhoyIS/ocTgDrS9IzryktHCrQS
	bofIE4QZ7Iic9ztNd3bjkvkSgnb9LnahQQ1y4eLPG8uHnKI92Mr8RKRs26NSYptNmrNb7ZEPZra
	FbKdSKjw+EDzI/C0Lt/3tD6n41SI6jesWOzITsriTc0JAEBQTa1GN0VDedsucVs6S7zf55SFM/Z
	/+Iu0Tlv90X2HVhY/jJBt86IMyVjzpY8aJxHEBugzQ7FThQRfOlB28ujaA6brZ0msJ8d3M4=
X-Received: by 2002:a05:693c:66cc:20b0:351:2958:1740 with SMTP id 5a478bee46e88-36f778f4a83mr7688087eec.37.1794059450625;
        Sat, 07 Nov 2026 05:50:50 -0800 (PST)
Received: from KRHW1CJW23 ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa999654sm14878430eec.27.2026.11.07.05.50.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 05:50:50 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Benjamin Berg <benjamin.berg@intel.com>,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH wireless] wifi: wil6210: restore the GTK as a group key after recovery
Date: Sat,  7 Nov 2026 21:50:30 +0800
Message-ID: <20261107135030.10329-1-enderaoelyther@gmail.com>
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

AP recovery fails to reinstall the saved GTK because the key-type
conversion changed the former false pairwise argument into
NL80211_KEYTYPE_PAIRWISE. With no peer address, the pairwise path finds
no station and returns -EINVAL, or, if the AP advertises FT, sends the
GTK to the firmware as a pairwise key.

Pass NL80211_KEYTYPE_GROUP so AP recovery selects WMI_KEY_USE_TX_GROUP and
reinstalls the saved group key through wmi_add_cipher_key().

AI assistance was used.

Fixes: 3191dfbf0779 ("wifi: cfg80211: add Control Integrity Protocol (CIP) APIs")
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Compile-tested only; no new W=1 GCC/Clang, sparse or smatch warnings.

 drivers/net/wireless/ath/wil6210/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/wil6210/cfg80211.c b/drivers/net/wireless/ath/wil6210/cfg80211.c
index bf060281c9a2..2563073b4766 100644
--- a/drivers/net/wireless/ath/wil6210/cfg80211.c
+++ b/drivers/net/wireless/ath/wil6210/cfg80211.c
@@ -2075,7 +2075,7 @@ void wil_cfg80211_ap_recovery(struct wil6210_priv *wil)
 		key_params.seq_len = IEEE80211_GCMP_PN_LEN;
 		rc = wil_cfg80211_add_key(wiphy, vif_to_wdev(vif), -1,
 					  vif->gtk_index,
-					  NL80211_KEYTYPE_PAIRWISE,
+					  NL80211_KEYTYPE_GROUP,
 					  NULL, &key_params);
 		if (rc)
 			wil_err(wil, "vif %d recovery add key failed (%d)\n",

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.56.0

