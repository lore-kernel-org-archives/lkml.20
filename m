Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119896;
	b=1uQDzSnD7aTK403O+i+C4bDFqd1z2gYbRjh/h6Vzl+oY+6Gy+Sdq/T7oxTdteMZG/7S7
	 2ZIJxeiFBj5gqFIchWoQKQfXjbJiPY9W1Aby7GDgqllJzXRnERwq0wyL4/hdRGnblGLqU
	 M/fUBrjIWsvISuqKHfMEBcAXUsxaH/4EmUamLD6g+z2LDmRL3t0M9Ayq7wJnmjoasbpqj
	 d1JA81O5X/VLZ3eT4NchmV0rqA2Zid1I2pzPte6R+tBL4s1fHdtjYgXfaho8vg793N+ff
	 fb9XdjVlr6waOnqRFHtW0PbJZWWNGou7Uth9Qqcqj5kFkwyyoTcy5YYBkrCQQ9Zu5Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aAVYI7hzWz0Ro36eEs5zq4Y7AqRKeB23+7GHTzj26rY=;
	b=1BPrY+i9eH7tRaV9bsnV4ccGm1hUFuBoNhIbRmT7SH1piTAbOjr+TEcsQ+YXdGEzGbEO
	 lTQXjMAq0jerC+uO8sgBMccVc71i6bRRHyaVuileXgPA4Oc/zdJb4BRtEGarOKiLj3hnr
	 E+hrs4ASG7qDspNHbX75WMtZlndlJGNChWVA6xD28TiSnki6hpKZ23OrpdVNYCk8JNYrk
	 DOGIQKr+4Z8kDG2bZXgH9DemzKONJuvVl97H3LQAX9Ab/hoS0sjA0HvR48mTgBnZ3ejlL
	 J2o0gP69sr2GWaZPCSLboWmvL24yHqCpJKzJnjP2r/R4NIvQg+d8WUDfmqoqOnxe4cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simpleble.org;
	spf=pass smtp.mailfrom=californiaopensource.com;
	dkim=pass header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=ln0SPSKU;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94190606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94190606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simpleble.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=californiaopensource.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=ln0SPSKU
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36661f953e4so98652eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simpleble.org; s=google; t=1793119895; x=1793724695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aAVYI7hzWz0Ro36eEs5zq4Y7AqRKeB23+7GHTzj26rY=;
        b=ln0SPSKUgrarXzwNmH9xP9RtnX3Xmam1Y+XCMj1HIYO6IxoKRHEXJQZU5FWaP0SGSF
         1Ouh/C6WipUr8cOUnmIXKFJzGMwZ7FIvfoGWQHEw/dPYqyVIJrGhnb+oTDlEGQH6xrno
         HMAkD1UKct1cVcvH2UHVC9IVWRJ04zUN1DlEB3lAQdQAP5WD7UpNDpPd+IWH6sgIRbhv
         GdviVtB4uvjxAlV04LinAZDtZFk+yVj1SnDeWegziMSA5ELrvxAuxKt2S8yUUCUXfosm
         pEzxJv5QvvmyEjTSbiuLn3bVR30oIvja+KMrkZogNcWY476xvq29eAKh2+tyAeOISAfK
         aKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119895; x=1793724695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aAVYI7hzWz0Ro36eEs5zq4Y7AqRKeB23+7GHTzj26rY=;
        b=jGJdR8taeywEayknev0Gwo1asr2dGc9g9Ol0djwzUxZA7dIHxnDdT/4t/+kyiCLgLZ
         GEkvTloc+imzfKMIqVYAXhUrvlM8/+isq5+SqTJ3DFLpxrpLR/jWVd/g9enGHKHCHHXX
         3DAa36lGXvZMHJsq+zzZDclASHZ1RNHXQHSvoJ/ET1XjgdfACGDHHmGXLOTV6SxHiweX
         5670GE3Sj28OSccIpbFTBUqnfV65zJuuWuZQVG13wsjc72/6ibQggTu1Ai6G4F3iantd
         aNqYNdGmo3YsaDGIdj4PWcLFyO4/nmGxULqVKgHqzj07GaGE4Gau4F8lnY2zolfrMrn8
         WvMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxIMjmScwJqRuE9ZMxvYdfN+JDto+fs2YBc2X7Z0x3ngJaj0KZw0GlMWB3275vzxGvqGnyUD3vlO25lbk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHlD6dnZYKByXPrV+r7R3L20Dsw/nSbjz5Eg3DZJerUa6AvOHx
	y3jMLVYtAPIblAxs3LCMBJtOm46TbC3IYZatELRJAlFfP81KwX58+R57J2JMntWcwidE2CJDU8r
	nJ4IUxI9jfw==
X-Gm-Gg: AYBFou10tF6DAKeVLx4HOVw79DosW+r4rIeqf8+uID5OnmZbb6r8mEAHBBugL0NjAt0
	8hV3JXdpmt9qADh54R5ABJ8YsUslZa6JyUdU7ih/uAPr60Zj6XfcFtgJfeKRBqODpBRMqmp3TkY
	PA6stIXK29N4bSsbfJw5ULoJnh+zqN+KYbl0hOJ10Ax5F0djJs9RXRrsZid4DDGqF7r3t1+E9XU
	i59yitUP5BhLPasE1fDBdk+/d0gNnL/A/GgTkyLaBv8wKunDIxfWt7vCdgtRxQvGn4pPG+rjxO8
	CY/an8w/EjtekMEBr04YjTWMG1516q+EtwkkbEQ4KtxuIMIiqFEa4n3+fsBbZdE7YpJM1nqm2Ki
	l8/TypN3Hv8pEEDRoYyFukr5XX2ByCpy3qHedF8jG46uECUi9FPVEXiJRojDN9EUqsYYrMJJ23l
	k06KQkZKjZGzW8Dd2VOM/cSnD8koB1QNvQjhaPzPPalETgfU7KXXu61Obu35RPkTWsG14P8wB/c
	lYCu2U4AEMGul7EH7yJqNZPJJiDH6Qm19eWMWdvljj7Fucn6r63ippXzH7s80XYr9+Wsjuc8c6H
	qy/TSNsDNaMA4uQht6FhzuTxyghF+fbkxsO0Ti0xfInu1Qak0bi3vpJoPOxAJcihAeCoWBLp/Jr
	35bpGOfXPb8Z6K715FUmx5A==
X-Received: by 2002:a05:7301:6f09:b0:35d:eafd:5737 with SMTP id 5a478bee46e88-369e84e382dmr14261708eec.22.1793119894351;
        Tue, 27 Oct 2026 09:51:34 -0700 (PDT)
Received: from localhost.localdomain ([147.185.47.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7e73sm35314092eec.20.2026.10.27.09.51.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 09:51:33 -0700 (PDT)
From: Kevin Dewald <kevin@simpleble.org>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kevin Dewald <kevin@simpleble.org>
Subject: [PATCH] Bluetooth: MGMT: Fix discovery stuck after a failed Stop Discovery
Date: Tue, 27 Oct 2026 09:51:29 -0700
Message-ID: <20261027165130.74821-1-kevin@simpleble.org>
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

