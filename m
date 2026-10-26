Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041346;
	b=HD7WNytqYJuXmJmQiW4CG38Pwctj78Qeka2JevmKWZGZFt7cpVZOlYNlG3HN6z3oS8nT
	 G3SmLSQmtqsrw2uo2/d+jCfVTuETJA+WaNCvnjTybUl7tnDLpvG8i1hh0EhVPhOS5Qrd8
	 4DxK0NH2k0qdgNS+kzlhyVB9YoZTCOP1+vE3gBkjPId/aG+oXjr6q9UfaP1Am1W/LpEXQ
	 sKa0FdDjpIsQQwNKJU3clKdhpAU/znd73z+fPghogphgi8WuZ7elxyH49dEpqd+RO6tfP
	 mk9Cn3Quywr2Yu/8A5gqSGLjjhL3xpZTXrpC7fV0RzVL6/9w1hgDBEWvt3K4Kl2EWeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=C0/sOWlN1MqwJBr0A98O/WByIk4UA9hHkggdJ3H2bxw=;
	b=jzS82dkzg67ohXPpxxi8MrjXc39mDeXjF3oJFVkWIQxKeIJKzIA6eE/5Ru9CAhAQy3JJ
	 t+SsSS/8yFlGRpng7f+moQAEXuWVArgaHZODZbbQW7tPXSmvVazqOumxVcNwlDoTKgiRS
	 9cIA4dIbFyvkKO13s2oGCG3GKKMVJc9MIrJgfCbZAJGI3tIOTTTPlUK3jv36/ww3I0tfm
	 1ZyqIE2DzRdlG++byFI/YfVs/NtRlnedyCJNmnG0LptqYBsP1iD5wjpL3kNsMhT75ulnp
	 H4f1btQeCawBk6m+DX98tqfKqclHYDU1dWAP/jzmeSdNQn8nMdE+OKShVURp3ydCX+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hae0fN50;
	arc=none smtp.remote-ip=74.125.231.199
Received: from mail-oi2-f7.google.com (mail-oi2-f7.google.com [74.125.231.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A269606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A269606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hae0fN50
Received: by mail-oi2-f7.google.com with SMTP id 5614622812f47-4b39374fab5so1424134b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041344; x=1793646144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0/sOWlN1MqwJBr0A98O/WByIk4UA9hHkggdJ3H2bxw=;
        b=Hae0fN50KSZf/ZM5NYrMRFb2a7Ij7HcbwqlV/tZqvdqCNbanaEhwTJ8N4NGCOG4Q/7
         Bln/ZGvQtwELoK2mrf3TWWyB3hAK16KWWQdRZbGlTXJO1UG1LqetbzGxkrooXWn4DGBB
         PWooVulvBduk7cEg9GdsNFTX7fbD9bnJA93iXxxPXauZ6fwxEjPLjIzxw4QaJZkm9t13
         7de6DclzVVvJhS4O11YeV4GiA3RKJyqNtKjl/rxSN+vn0IBQBgGQLsnz7g6rDo0SEg8V
         DerIsGiyh4nKaxRwsbLY6YlUVpWMnn2J/hcWKw/dxVc4SekvP4CTh7+N+C/P7l24FYrw
         C3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041344; x=1793646144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0/sOWlN1MqwJBr0A98O/WByIk4UA9hHkggdJ3H2bxw=;
        b=EYya+TaKDokCKJevs36GNC6mE7nOwNOsa0vBlPBya0xmNPoGClitwaMHsCInTtxxQB
         7/5XxrGZuJIeoIvo3kbMr777iEZns89HauuynZkB6rzgD9Cmj1rOmV1NAqsgf3Q7CS6f
         YCTyJMkZqfU0wkA9l1KkFd4WX33/kUcTUKbVR8f3K3ztkO9ZU5JWiIEc/V5Hi8myHXim
         7LzWsb9sRn6CzFFuvWhlMCfysZBhFVd56t399drZKRxICzFllOeqWnmPbPt/C5bBvCr1
         2EHKHIK4dZSABDuWnGFZ3nz/LBLIhUqvz4dwQwpQrLOA5OjV17Uzc4u3YsB/LzjNIHs3
         A/Cg==
X-Forwarded-Encrypted: i=1; AKwUvBxNJfqCcEGVjylaaKBle5GjdN3Hz3uO7tAkaTg3NRKu702G7GtEiPRTO238ZhKgICdWtJD2FlmL7RCUqQ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYILxzy8x4sSqRRK+1fmUuhRzlNaF5WOPaUsz8YKNwnAFiToespw
	1AxU3OPKwdE51VkUfgpXVeHlnh+62JFsBuJ/TtedcUJr1N9o6dIGy9pi
X-Gm-Gg: AYBFou1MpppnL7wO9IqMMc9ZSne4vB8TI2s3O3gpHQ4R+tkMmtOQo4fW5qNUEWXHgbX
	Gb2AMQgUmWetnzyc0BFtG/8faUgkmNzvsRX2PUJ82vsZCg2W71ooV80LRkPzUSaxSTnh1KFAeiJ
	xbNORRJTA6XbG7SsfVAkqocXAEkkPsh5M59CBsRvStYuIJ4Y/Zu6+LdrTqHyx5REBJ2Ni3UKIl0
	YyAZPLHdstZvMpzWM8QL9slPtdNpJjBMAqtFsb0tfvnPvyNbIinrCk8yXo1YA9wEZ1OX83Y1jVm
	PipJ0LqPyjprUeNnK3coRxo6pWqjIsxKN+E0gKW+zDs7r2Zfvz4azhHWgXkQqin0TYgxgz4KE0o
	aP9D9gjgIekkNJmFDtUUzlGd6M1IrVlncFP79/iF5rjhyi+CLmzHUMnCYJo7NrByo5jq+y7xrq0
	AZQxr0705IpJZkohy7zK9MKh7SP50Z4JTMXD8Ei2E62AtHAFIvlrb9s7Cj8gdM2tM4estE/IxMA
	Q+H5xCdh5BepDwmN9CA7mdbewtZTl4cgboa7ZRgdHYiQvNHEV1Aah5XJkSP+heqBRFdThHC7108
	zFCS/Rvuc85K2C0sGlsFnHAsnsLSZj6tLiGJDuQNCjYlWX3acwJjGY9EDq/MPY4/Aeurqfb5RQZ
	8C8q9HELUifzJ8R4Lovs=
X-Received: by 2002:a05:6808:c2f1:b0:4f5:d3bf:edf3 with SMTP id 5614622812f47-55c0038dac2mr5576376b6e.59.1793041344128;
        Mon, 26 Oct 2026 12:02:24 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c04311a8asm5958356b6e.16.2026.10.26.12.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:02:22 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 14:02:13 -0500
Subject: [PATCH 1/2] Bluetooth: btmtksdio: wait while Wi-Fi downloads the
 shared patch
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
Message-Id: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-1-121792305f72@gmail.com>
References: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-0-121792305f72@gmail.com>
In-Reply-To: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-0-121792305f72@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041338; l=3241;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ddztoRYUESDPWb2PQYPya2Tntue+gD/4f8ofmkkWRzw=;
 b=Xpakt9Wyhh2fH44z/HY3v5CV//e6jdBro+k8eFbYlXhtJ3WfwmxDtQGqwSusmrwJNYH6TjbNb
 2hHcf/PxIVLDax2JTueLWoyqslFrC7Zmb2Rbz+fxerGE9NUNOiar/kM
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

On MT7663 and MT7668 the Bluetooth and Wi-Fi SDIO functions share one
ROM patch, guarded by a semaphore in the firmware. The WMT semaphore
query answers 0 while the other function holds the semaphore and is
downloading the patch, 1 when the patch is ready, and 2 when it needs
downloading (MediaTek's own driver: PATCH_IS_DOWNLOAD_BY_OTHER,
PATCH_READY, PATCH_NEED_DOWNLOAD). btmtksdio treated 0 like 1, so when
it probed while mt7663s was downloading, it went on to enable the
Bluetooth function on a half-loaded patch. On an MT7663 module
(Amazon Fire TV Stick) that left the chip unresponsive until reset:

  Bluetooth: hci0: Firmware already downloaded
  Bluetooth: hci0: Execution of wmt command timed out
  mt7663s mmc2:0001:1: Message 00000007 (seq 13) timeout
  mt7663s mmc2:0001:1: Failed to start patch

Map 0 to BTMTK_WMT_PATCH_PROGRESS, and poll every 100 ms, for up to
5 s, while the other function is downloading, as MediaTek's driver
does.

Fixes: 9aebfd4a2200 ("Bluetooth: mediatek: add support for MediaTek MT7663S and MT7668S SDIO devices")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/bluetooth/btmtksdio.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index b9563df72983..bb311986271f 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -234,8 +234,16 @@ static int mtk_hci_wmt_sync(struct hci_dev *hdev,
 
 	switch (wmt_evt->whdr.op) {
 	case BTMTK_WMT_SEMAPHORE:
+		/*
+		 * 0: the other function (Wi-Fi on MT7663/MT7668) holds the
+		 *    semaphore and is downloading the shared patch
+		 * 1: the patch is ready
+		 * 2: the patch needs downloading
+		 */
 		if (wmt_evt->whdr.flag == 2)
 			status = BTMTK_WMT_PATCH_UNDONE;
+		else if (wmt_evt->whdr.flag == 0)
+			status = BTMTK_WMT_PATCH_PROGRESS;
 		else
 			status = BTMTK_WMT_PATCH_DONE;
 		break;
@@ -842,20 +850,35 @@ static int mt76xx_setup(struct hci_dev *hdev, const char *fwname)
 	struct btmtk_hci_wmt_params wmt_params;
 	struct btmtk_tci_sleep tci_sleep;
 	struct sk_buff *skb;
-	int err, status;
+	int err, status, i;
 	u8 param = 0x1;
 
-	/* Query whether the firmware is already download */
+	/*
+	 * Query whether the firmware is already downloaded. While the Wi-Fi
+	 * function downloads the shared patch, wait for it to finish.
+	 */
 	wmt_params.op = BTMTK_WMT_SEMAPHORE;
 	wmt_params.flag = 1;
 	wmt_params.dlen = 0;
 	wmt_params.data = NULL;
 	wmt_params.status = &status;
 
-	err = mtk_hci_wmt_sync(hdev, &wmt_params);
-	if (err < 0) {
-		bt_dev_err(hdev, "Failed to query firmware status (%d)", err);
-		return err;
+	for (i = 0; i < 50; i++) {
+		err = mtk_hci_wmt_sync(hdev, &wmt_params);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to query firmware status (%d)",
+				   err);
+			return err;
+		}
+
+		if (status != BTMTK_WMT_PATCH_PROGRESS)
+			break;
+		msleep(100);
+	}
+
+	if (status == BTMTK_WMT_PATCH_PROGRESS) {
+		bt_dev_err(hdev, "Patch download by the other function did not finish");
+		return -EBUSY;
 	}
 
 	if (status == BTMTK_WMT_PATCH_DONE) {

-- 
2.55.0

