Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119909;
	b=0glH64uGecsih1A1F7k4g2nkuKIWbSMTjVHqJYpITM5TVWV04DZmAU+vhd4tDyeUMXct
	 gZhnSLS1sr9MqNkIi+IYEH1hUQJY83keyazj4xCfLWftDWq/Ty2slkUVEl4uTzNbPI7XG
	 42D0JHHHhcYuZ/dPcMVIrSbBssK7fssD7QBjE/P7OBr4IIiZ9Bf4NYGQgFe0SS3YUR8LW
	 84GLGp/BPUopLlQEixXPNrLA5Uun26srbzI6IXxEQ7aYrX8WLcZjuNcqlKMjibUPi5q7F
	 cDjqt8/4/HpB7eRVaDsSMI3xAmbaTZ3W5Kdfa5+QGaNZSezu7v6M321V8jCoKL6OgEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aAVYI7hzWz0Ro36eEs5zq4Y7AqRKeB23+7GHTzj26rY=;
	b=FHzNywsvlM/nVbh/pa+gSAuu4XYKkyT0BiUq7+eNeG3NsZ6nZt66c7jbVQVqCnyIdDFH
	 zOsvq2nEYy3+uopaxtjFYGHTX59wS4VV6vP5csm3V2ep0k+0PAuoZU/erJPCzbD5aJcYM
	 DvtKEk582mTwTAp2gxJ+0xyU7Vmw0SZqoQZvS54055OFCuM+dI/b8oTEAQe4hhrI2Pr23
	 BKJ6jWit29X9jy19Aav6780DDKDnmFn0jDiNfceOgZuP73s4QHLhNvu2yBCSqDU0dK9KI
	 46oIJACsVkAOI+umcqtS0ffjuU5U+hq96ZgsATFXYJ+U6JGPS71HUiht1++AM7kPMWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simpleble.org;
	spf=pass smtp.mailfrom=californiaopensource.com;
	dkim=pass header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=avL7x7D3;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0C9606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA0C9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simpleble.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=californiaopensource.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=avL7x7D3
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-188406bb948so3606240c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simpleble.org; s=google; t=1793119908; x=1793724708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aAVYI7hzWz0Ro36eEs5zq4Y7AqRKeB23+7GHTzj26rY=;
        b=avL7x7D38BpE7bqjyGyVziff6PpmnBwDe9Yl1ufs/u922LMszIu0XxXweYGggEmAHr
         IM4w253lGOHOZ18/tKqehpt9vhoo+CXlPgMy0Eb9xpohhEuyML5xOs/dTndSslEU13zh
         bomgeHyT0/nPzCz/RrUtu6O8Ax4LJgXBm2fX0aZeXP/UFa6bRZzuhMXPA5oviyJ7fxYj
         tHsPpdHQlNzKFV1A2P+QB+kG1uXUY90i5Qgo3iHAWUEh8PhKfng908FY4i59d7QGtRth
         CYBKItmyf1J9aq0NhyyhVmTOU/GFKbWSy5ed8e7zMeLueaAUNP6TYsHTowL4Kv3WDqIC
         92Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119908; x=1793724708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aAVYI7hzWz0Ro36eEs5zq4Y7AqRKeB23+7GHTzj26rY=;
        b=dkDnCjztXXMxl7Gz1MIQef1rvMaSSkhS6Vpzmeo6C8P7+rNy/xxbkmKmZ/SgrxLIO3
         CNTZbGfZhcvEgbEVFF2m6OFbZJ13no9rTr8FvqKwEFI5wXETmi7ZZ7RDmlfKQWb99coh
         VanoJd43VRbpv8fzDvQpqxayDEjC3cz7XTRsBkaUpGUNsdKgoGECQ1I6RhWx7z2ePs0c
         BBvSZsTwB1C0dg8m29Bi82OAYjH7Mh7t/GL6BVUFYw/qFs9vjR+s86nS1I1kgAceCATa
         gFp/l+5tJXOOUIUVp0b5/+XSK6ys4++2tv+j8w0slrzYohcBYTr97/XzA5qZfd84WlxU
         XVkA==
X-Forwarded-Encrypted: i=1; AKwUvBxt1brInKpdH18Lcolh3lg6e6pxqJok9nTASeYTza26lgxs7r87Mjnmm907auTe+ZXMgOO0YVnTOn9lvLw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8Cm88qcsvEE+A0VPMoJVOBo7YFrqH5lgfbASO3BvHQs/qsK7+
	uXiLRdomn/A9os5gm6p/GIfJT0Sb1llENaH3h/7yobjT+dRnV2iVdzPKKbznlOOBql8=
X-Gm-Gg: AYBFou2D7gOfyv70j0em0vNL2XvMpmOWMK1Te71SWbqGvR25SxWGwvIPilSmDPnEUzy
	QQpK8ITLAEmFmjQcbfbVfKSCBTWIEwkeUWiCnC6ZyDAvaj569/NXfLIlmmkqxT8kdSMqZrqK2Ua
	yOVPuI2+LNqemVN7NA+MNeajvkD3VRBnDMb77Xsgbjll0pUssH/xEahm553RGK2Cl06UlcBNbRj
	n5Q6DDc3b1iwLdFd4p3WYzjmLosogwaq7NF6D7f9Y5+GDTYEi1EgNeitTcCXNz2O8Ev1cA3gZav
	x5weKjqaDfrEyKjn7PoH1w9OIzAX1x2PzVBSbcHliqEkxld1TogCE4UaETi7EUhmxxvrUFDlIIb
	L7xZ+AZMajX6j/aM0aNi7/daATtWWp7u9p/pZINdFqUYnpMX34bGLblvpp0cgBVBqPZOTMFo14k
	vUoimEde4XBb4hstNSO2b9WL0QrJ3cBJOsbffiXgSqJhlKc6Pq20ksVfxLAzF52LZi6JXQEL/ld
	Rg6N6K31fiUAzqF2sG4N9Eb0lMXS3XPJ7IM1+5/PFSTf4KaC9Cq45uW8FdrWiqfHoHSCnyoHafu
	9X5tUQ1e+gVKxudM7FTh6S638ueRUxs6vhh0Nj+yrKvNpVGoavmtVGsZiuaOVdBAZmVuTqCWzB7
	5l/X6RJUuDIvO/gUkQBdgCA==
X-Received: by 2002:a05:701b:4209:20b0:14a:d8fe:3390 with SMTP id a92af1059eb24-1a631c9284fmr820274c88.32.1793119907564;
        Tue, 27 Oct 2026 09:51:47 -0700 (PDT)
Received: from localhost.localdomain ([147.185.47.151])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm34399611c88.1.2026.10.27.09.51.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 09:51:47 -0700 (PDT)
From: Kevin Dewald <kevin@simpleble.org>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kevin Dewald <kevin@simpleble.org>
Subject: [PATCH] Bluetooth: MGMT: Fix discovery stuck after a failed Stop Discovery
Date: Tue, 27 Oct 2026 09:51:44 -0700
Message-ID: <20261027165144.75105-1-kevin@simpleble.org>
X-Mailer: git-send-email 2.54.0
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

Stop Discovery moves the discovery to DISCOVERY_STOPPING, and
stop_discovery_complete() only moves it on to DISCOVERY_STOPPED when
stopping succeeded. When it fails, for example because LE Set Scan
Enable times out, nothing else moves the discovery out of
DISCOVERY_STOPPING, as the LE scan timeout was cancelled before the
scan was disabled. Until the controller is powered off, every Start
Discovery then fails with Busy, and hci_update_passive_scan_sync()
skips background scanning, so devices set to auto-connect are not
connected anymore.

Move the discovery to DISCOVERY_STOPPED also when stopping it failed,
as start_discovery_complete() does when starting fails. This sends
Discovering (disabled), and the passive scan update disables the scan
again if it is still enabled.

Fixes: 0e05bba6f6f8 ("Bluetooth: Update stop_discovery to use HCI request")
Assisted-by: Claude:claude-opus-5.5
---
Reproduced in test-runner with a new mgmt-tester case, "Stop Discovery -
Scan Disable Failed 1", in which the emulator answers LE Set Scan Enable
(disable) with Unspecified Error: without this patch no Discovering
(disabled) event is sent, the scan is left enabled and Start Discovery
fails with Busy one second later (3 of 3 runs); with it the scan is
disabled again and Start Discovery succeeds (3 of 3). Freezing the
emulated controller while bluetoothd stops discovering gives the same
result through the HCI command timeout. The other kernel testers pass as
before. Only tested with the emulator, not with real controllers. I can
send the mgmt-tester case to BlueZ if you want it.

hci_pause_discovery_sync() has the same pattern on suspend, which I have
not reproduced.

 net/bluetooth/mgmt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 3cb4f9ece8..06595175d9 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -6322,8 +6322,11 @@ static void stop_discovery_complete(struct hci_dev *hdev, void *data, int err)
 			  cmd->param, 1);
 	mgmt_pending_free(cmd);
 
-	if (!err)
-		hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
+	/* Leave DISCOVERY_STOPPING also when stopping failed, since nothing
+	 * else moves the discovery out of it: Start Discovery would keep
+	 * failing with Busy and passive scanning would not be resumed.
+	 */
+	hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
 }
 
 static int stop_discovery_sync(struct hci_dev *hdev, void *data)

base-commit: 47d4d9f67e92d56ef3965f2727f9c98a5a611368
-- 
2.53.0

