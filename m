Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793122054;
	b=fv+BPihRMkzGlPqqcZpVZ73J3hSf51efcn/4kSac1PkYiIIGn0U+TJ8T32URJvGDnTdc
	 iZiht8Yy1kN1Vsx/qMWUCHPh0a2e+CzBYXHqKC8nh51jS47lYE4s1sdCA0K7o2zcK0Hgl
	 dQIJCHfuhWqePRZldBrduk9lZjIxbmRWeoeAMDJxGlx6ZeOQD19D6D1D4YP+dTZylEPTY
	 nDD0nXIFwq8hk6IoUN0ntJyuf3RWiFPmpafIco3MdxF//JYMii04fBdJXg4U2Vmbdtrrr
	 9AMP4P/cmZSl+Py3s2MoUURTNjitWYUC0blUupZBUd06oym8v4lmT1YTNs0mkrfj6Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0srGsQcriNeZSAqortz28JS4GFexyzZHlnolS5P5yFA=;
	b=hL/frX+jADEcxc/7ti+vJkeugJrv2hfc9qjAXJ1RwPsqnb/Gr+4ZW+FSxJVer3u2knot
	 gqZ3JaJeEtmNPoASSxn+vcUnhgqAORgordYVnYTDl9zvgqxTMFW1UOU0iJ2ONOxiUSn2i
	 3HBfjxvgK44FoMoPFqdNvqHSUllCIfHJmyEFEMJJctTwjQzbWVmhSAskhu77xVaOQ7tnT
	 0dOY7jVoSiFdRs6d0u0jdJW1PSUpxFjobgMB+xCAA5zuI3G+h1/kVIjZKRAgy9FneVQ2c
	 01u74yNwT/ZlGkSVTQpQmK3k1DlwQv8PR8sRpSKgXRJtrIElM2D1sQdmBWLaFlV6+rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simpleble.org;
	spf=pass smtp.mailfrom=californiaopensource.com;
	dkim=pass header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b="q/G2WVUB";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929A4606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 929A4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simpleble.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=californiaopensource.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=q/G2WVUB
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a1947498bso239776eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simpleble.org; s=google; t=1793122053; x=1793726853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0srGsQcriNeZSAqortz28JS4GFexyzZHlnolS5P5yFA=;
        b=q/G2WVUBiccGDptMSNCe72hnkJVveHRSnKbQV5E5cFUgAGxYatXjJpm0ai6RAe7hNe
         oB2uLaCLPrKO5dHQzxQR2m7YChQWwl9Mycr6dARRtCcegTrIVYk8By3J27lwW+gC+mO/
         FNoiZnjw0npoP4sOkBkbHjGX6kH5EcYpt/g/zECjF3mUoNx1zWH3Kgjo0RjqKcnKI/iz
         WHHWlC67T+iPksZS8JDu+uFpVAdFqDgRZBW7myuLyFGhHAhBpflLYkRxlqCV8x8wzRjX
         XlsjYbUDQkBWm6j6L7ISCWczkDJbx1luw0cMq1eOMX7RHK5pkZY9k1FQ2l8jK3Eunyw0
         yvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793122053; x=1793726853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0srGsQcriNeZSAqortz28JS4GFexyzZHlnolS5P5yFA=;
        b=SKFjgMsksc2fcalT+SmoFHOcbVayQxhLJ9ekhcZ8Vz0exEPK+iuGCqElkMeX3KWwfs
         gkPWm+D+yHthUsTzfba55juOpyjAJBwJLHA84r/ijB17lu4sZ4rNdru0jb/zgT17fp8p
         m1jmdBmx3EZHcvdjmymWGrUVoDJCvPEGnu8FRPkw2Twyehwj7dSh/9n31vaS/MZ4Z5zP
         sO79wsB7eYc/XccFiTC5ccofStTrW5RFpp+2kPMYzMxb3rtZOURayLde69ZawHT3fkIF
         phVv454bmUtBPmqyPVZ8lpCaKnadNWgu2RdtfsS4doKqfKGr6EV2PNjordbV4rHV7DCq
         LNYw==
X-Forwarded-Encrypted: i=1; AKwUvBw2q/dlLXUBeNtcst1okfPnIMSp1kzh2OsXHENdvWViRZ1iJv34WT28uXglNbdMLbzJnMsp8eIeJ3UYqB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz/1CmpyqT2xMJaYNFoPV1FH/97IpKcIZH2HHncOvv6zrF1TyU
	SnvgEs+ToiHqEWtn2i0QIlAb+McUHoZ6wQckFtqNJr1H7/JhWvHldKFAFdQOIttiRyWr8Pbz47s
	g/NQVOehddg==
X-Gm-Gg: AYBFou3fKeUpwfnjhHw7XNk/C/bRxEQJLUlrmwH+6F3FXdVTaTigNnWMvEQA0L44cjV
	rEKcwJOb74c41dB6NFf8khvUGly9x4mLfTgGHbBufCsA4ykvDno9gF7Ysy/v2DCOjiOB/BZ2Arn
	w3uA3UqLq/pVjyF0/re4HyKCDHqzGyLRzUU38EFfzguE5DRJZzba39PDbnq/sLVmKwcEDd0oBKu
	7cW/6uMDXhaP8JH+09yRpWc7uHWWZxwAX8qxWmk2BFU0bYtuyEBgYjovbceobJ/zBuvzmmgv+SP
	62CHRXSDOJ0w6eAJMwEIYlcYgOokna1IKVtTBxYIV3XRzkxphD1Eiq2kzo6t1+J1w/4WvSVY39O
	3xWxmEfI4olLcBEsaE6K3KrA9ZHH16/DsG0neSwRunmZes89bSjjw8PDxF0dkquLhE8QJUIcqNg
	7esbWluhertp9KmrZSqte5rkuMK3s/cbPIOhy5MEOYyt7xGrjUS0MMDh0LxuF88OCiNBiM1B1Ul
	Jl9IGRcXyvd1So9dCuPjKh0X72YQYgvjVCZ6OlFCcN6+Ov9dfYhLPIbzSD98lzpYcnUr9k++RSf
	e5KWkg4Zj0blA6QOndu1q0mDnqsEHd5W9r61UUCs953fkDWe5TjT0KeZEjYghdpS4E2J4ViPCtC
	MjJg6IMe4mNDCp6Eq1RpDDugCdhHSE0cUu/X/pDqYdn8=
X-Received: by 2002:a05:7300:d0a1:b0:36a:16f:c550 with SMTP id 5a478bee46e88-36a203cc3ccmr109085eec.15.1793122053338;
        Tue, 27 Oct 2026 10:27:33 -0700 (PDT)
Received: from localhost.localdomain ([147.185.47.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a002a486csm20385023eec.22.2026.10.27.10.27.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 10:27:32 -0700 (PDT)
From: Kevin Dewald <kevin@simpleble.org>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kevin Dewald <kevin@simpleble.org>
Subject: [PATCH v2] Bluetooth: MGMT: Fix discovery stuck after a failed Stop Discovery
Date: Tue, 27 Oct 2026 10:27:30 -0700
Message-ID: <20261027172730.86568-1-kevin@simpleble.org>
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
Signed-off-by: Kevin Dewald <kevin@simpleble.org>
---
Changes in v2:
- Add the missing Signed-off-by. v1 went out three times without it,
  sorry for the noise.
- v1: https://lore.kernel.org/linux-bluetooth/20261027171913.82628-1-kevin@simpleble.org/

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

