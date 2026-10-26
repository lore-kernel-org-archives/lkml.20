Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041847;
	b=xV3/ooK53My1KiUojGRxc2CrJhLtjryPId/M8xhcK5XsHc5Fv7HIDh/GtSXun91Xt7Rv
	 EqZ6VNYvH8N2Y9nADXU+wyOAGrSgRG9Pla9fPF0A+TZndTrtP3ULKWbjw0ODgYRx027qw
	 D3/D1k4dYZP+e/lRocSv3HE4Y3N9KPXBakHPrtIuJeLyt+CC+R+6w5Cc6UExnKY766KeG
	 u8o+g7fcGGpXj+gaXHnstxMlJMtGRgBgskn8DW1atVi40I2OB75UVC9BGThsodnCqlxRn
	 rv+nVz56lmEHtHtFjkdBHR/2nmNsmZKowkW/DRyzsEnd+jtZRT7F8obrsGxYERztSsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DMuTtuJ1h4xjmqX6Q6LPbxG38lJtzTTle+6VtZKNkrY=;
	b=rEtcQGpF8VceXrBYyIe93ukMD7T5WvZma2B/rBAWQDAweVsLXpXlqc6Dt1yMFLeUDyOt
	 VAffagfhg9nSPVisHoVBse/8gNL2qAyzetBkL7eGXYGEA5YjKIc3wr6Y44+iRNMAw5hsG
	 5pEk3a4SvRYfxgHhH5cRJ1dqcs3RW2tsQpmJBmN/QQXM6JETEV3i2SW+m2CJXFsE5wqP6
	 weBy6UoaMpZxAzXRDvUd6WJ/zwbjTw74i5ia2uXmMLNUwCB8CKAnkXYtdPifFBqPZfXeh
	 uq7DF6VubyHfc5GdyDqpUdUzoDFUJo2KQvVTAQwzQvprIm9sd4E7TqqLRQKm+k6pxBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TN4ytapC;
	arc=none smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2E3606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB2E3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TN4ytapC
Received: by mail-oo2-f10.google.com with SMTP id 46e09a7af769-820ff812cd8so612971a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041846; x=1793646646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMuTtuJ1h4xjmqX6Q6LPbxG38lJtzTTle+6VtZKNkrY=;
        b=TN4ytapCI4BrQ3ZcXC8tKkhy7BXjIBziqzswKTCOUIfrvA35hhHia2p3KheIpZjwrf
         SxOT0QbjpA2ZKqVlh393VYXOpgIeM7vTyDbBktRHrX4ygwbU9MxAyF76VFS5z/BPpeJg
         I2Up2uSxn1h0EcNtFjGbUkz1+vtRSMGtbAgmhBxtrc+scShGOOgLtdk2AR2lCGdOaDLT
         Tx4DyOwqqsWFAlLIXplEPEaU/zr0q0Q1gTQWs4Vykn52/h7uEHW9WQUU7OsgjXgFNyrH
         3/LJaxmKsOi02epciAyHVg4kiJ5sq/VS9485eIVngpjmlxC876tjA4LPVyvrQyKhcvmc
         khPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041846; x=1793646646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMuTtuJ1h4xjmqX6Q6LPbxG38lJtzTTle+6VtZKNkrY=;
        b=eva4iRxTsy2v0uGF6/zMSXJVhXU/9RY5u1Zv3xMkP6qofz0VKNnEEj81/uej5uZBpF
         FRAdZzWL7cs/BTqBAym1dAzweMBrONQ0Jk+UFY2aVTAZb0o19DrbmqtP90xf0banPdlt
         SJE68nlsJr+sGm+SMzMs8xP+2FWEqslMecz6163OC7TUJd45JrhqYXKt4twEfBU7TVwz
         wIaeayqD+Ahw5rx/x9ecyxgCpJ1woBSKGqoCF0nI6YA2ks01h/ijkLRP72UR1YrPMJO8
         +biDJX2nMUT8ltJM/jI1wYAYAAsB6ok37/i5EHT3QzFcEQuBTFqDltP+ssdfXP+zopVH
         HkHQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7TX23/kSsy0pmhqI4WTnCc70v4nm58NuJUIxxZsLsnjbNyD9EV5lp2f67j+/qgzW6AC/2T3M0p+dt+q8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmdroyPQSZN80nd14tpdnT5E7vlsXM0jkw/W3RDgN+R0XvH/W/
	HtOlw4hnuULWVKsyaKZ1Hpi3a+XIrFFZYIMrBZ86s/8MM0VYFjHJx5ra
X-Gm-Gg: AYBFou34RwQEUUFZj7Qt41O274yuZaz59Hq4xMYGO1qNdtI9I4XeSTAVGFxk8fHr8ur
	WQ9ncJ0bo8mFX+/xSPnRal5HJMh6pXV3mE68OqM5SpE4WDbXCRp/jqapqOyrhIq7ricq7DvuK3Z
	4PI2xqSLz41SZg95vV4AZZOVe7+0xHK1PCEs4Y7X99lb1jy8edw2hbo4TtYiFGrgHLyPuKClcRW
	P7DB6KJ5EqK9NeNWp+GzmvVqGjVM6BIlywJUjJGvnHK/Tbi9I548/5zNWkQT/GQKMDAI6bhKswi
	04mSoyT+0PKy9sncHkmvm4h5327GQZj6RW/s1N28hb1TGYZGMcAlF5MryWpHpC4MgUAryCkFyvt
	GCj6eHh2birqUqclC1WygMdkS+wLfm9LWtKbs1h7L8W9/PWLZTqa2q/iQLDWLV6df+3Xz/NlA36
	tEDV+faNOHFqKj1tTcGLFRuH1ejEEeMrU+08r4HqG4w2pZzrA30PqCNTwZGOSOpvw7Nd1PNKKhM
	YRoSdprWlmjnH5jD19doBhUsoUy0nzvEKC2mtRYHGRep+fNGUnMufKd2x5QuzmTk0RNrJ4J4Zic
	7oZJkia0jz11wnKRWQ6NKDzqvG3lBPXFo8xOmEp/ORR4LSgL9oAdbXQ02DVlnmcEzek=
X-Received: by 2002:a05:6808:1919:b0:4d6:90d4:6bc with SMTP id 5614622812f47-55c002d9eb8mr6575517b6e.46.1793041845770;
        Mon, 26 Oct 2026 12:10:45 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c03dc3524sm5740834b6e.0.2026.10.26.12.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:10:45 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 14:10:37 -0500
Subject: [PATCH 2/4] wifi: mt76: mt7615: wait while Bluetooth downloads the
 MT7663 patch
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-2-944b1f7e63a8@gmail.com>
References: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
In-Reply-To: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041838; l=2027;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=HkEhUCJzkwct3RuygSMeROndtW02Wv2ZhGyJ5rVshHo=;
 b=Xp3Ukesylfb4khPHpZ11/Jn435KT1nrvFR8ZhqyM/mUHsf6//IDNqy25niqgUN/TogKP5/5MO
 H4QgjZPCBcVCwSr69a0/W6h771CNP1sQjSp1Qa2GvYgSEJiwTO2+/Pa
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

On MT7663 the Bluetooth SDIO function (btmtksdio) shares the ROM patch
with Wi-Fi, guarded by a semaphore in the firmware. When Bluetooth wins
the race at boot and is downloading the patch, the semaphore request
returns PATCH_NOT_DL_SEM_FAIL and mt7663s gave up:

  mt7663s mmc2:0001:1: Failed to get patch semaphore
  mt7663s mmc2:0001:1: failed to load mediatek/mt7663pr2h_rebb.bin

Retry every 100 ms, for up to 5 s, while the semaphore is held, then
find the patch downloaded. Tested on an MT7663 SDIO module with
btmtksdio built in: across repeated boots, whichever function downloads
the patch, both come up.

Fixes: a66cbdd6573d ("mt76: mt7615: introduce mt7663s support")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 152b75178b27..e5c2ad5fb458 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1241,7 +1241,7 @@ static int mt7615_load_patch(struct mt7615_dev *dev, u32 addr, const char *name)
 {
 	const struct mt7615_patch_hdr *hdr;
 	const struct firmware *fw = NULL;
-	int len, ret, sem;
+	int i, len, ret, sem;
 
 	ret = firmware_request_nowarn(&fw, name, dev->mt76.dev);
 	if (ret)
@@ -1253,7 +1253,17 @@ static int mt7615_load_patch(struct mt7615_dev *dev, u32 addr, const char *name)
 		goto release_fw;
 	}
 
-	sem = mt76_connac_mcu_patch_sem_ctrl(&dev->mt76, true);
+	/*
+	 * On MT7663 the Bluetooth function shares the ROM patch, and the
+	 * semaphore is refused while it downloads the patch: wait for it.
+	 */
+	for (i = 0; i < 50; i++) {
+		sem = mt76_connac_mcu_patch_sem_ctrl(&dev->mt76, true);
+		if (sem != PATCH_NOT_DL_SEM_FAIL)
+			break;
+		msleep(100);
+	}
+
 	switch (sem) {
 	case PATCH_IS_DL:
 		goto release_fw;

-- 
2.55.0

