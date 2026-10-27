Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793121559;
	b=UdlklRccHr4RLWk01cUkUIuecY2ymGfZJys7CYeLPtYAziqw4hgD+29Er9QDXmezUWg9
	 Ne1b/AqjK/SBeDJfOKvbgqNZaiukgueI2ZGT1hlaWmlHrNwh1fTl3wOIvHXkKmLBNaBl3
	 NKNYyCUOtCyiQ7x3X/AwGLknke3Lb7LGWeEaKBwSOjOSvH3ThxP5hod+S4PXuuUVWFIvr
	 5NVHhn3K7rFpxyOMIl9IApiEbWaWIkd5Ip4pwTMMKzZB/uLIQhZt5gPINq+ufxkRf3jCC
	 58Aai8n4DIwV2rdPnJ2ej16ZCv9Wq511gzp3QB25cqa2wA3e6Jsf7dqp3mSrO0ESPRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aAVYI7hzWz0Ro36eEs5zq4Y7AqRKeB23+7GHTzj26rY=;
	b=QHYoqyb9TjmDnCs7Lt0tyDQIB4XbHAqKSWpYKZk979HBlXZTI/jVC4RH9WoF+ItUsXuK
	 xLAm0W1oCijepe9qpm5ZTmkScgVCgyr2Zl5mEo7NGnLpqq7OmMcdDk8zlAJVHYQddAXIJ
	 spkMfh1fBQEfrqa/KD7NmE996u7yEcWVAtAecdaMyMLwFbcRz37rTnbYCjU+Sg7R0J3Sh
	 95hB4apj6Iz0/NUNmAZJdrs0ye8zvrnrk7pj9hkqxc+oWWQvXsV/p537ueh2sqPuerElo
	 8Zy8l8WMNfzzHiPhYDVKAhaeXISFClbS3Mvjj8bJdMow6DSW8QxQDKKm7LxLzhSs+cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simpleble.org;
	spf=pass smtp.mailfrom=californiaopensource.com;
	dkim=pass header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=OMV+wd5v;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15DD606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B15DD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simpleble.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=californiaopensource.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=OMV+wd5v
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14394530ec6so27856c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simpleble.org; s=google; t=1793121558; x=1793726358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aAVYI7hzWz0Ro36eEs5zq4Y7AqRKeB23+7GHTzj26rY=;
        b=OMV+wd5v0uEIfsIZPUPU/X3XoJzGUe4i9Cwr4VY6wWsDBbYeb+h5JeTRDDeLxRr6lB
         dwV1BYI4lMXjtZxGK0EkpDr6yOVsCRBqQu1xIUgKfQSrHwinwSJa7JhHOQcn4PnNeS8c
         Pd/vy4FwwvnXu1ke/0eDpmNQOA9kAsPi962pzvDSp7FQDIajDr+TADTPnYhUGwuhajIY
         llJfKY0zTkz5CQgeB+YDrmjf3+FHpUflAFPav4A0pCA4N25PgVxXZzv93FP9HmtirhC/
         sqZA6Ag5wPRN1uRh76urKFutUsmBUteki/rCYCNu8oWGk1gCkplQDC2Q4XsORJJDFJjU
         sI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793121558; x=1793726358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aAVYI7hzWz0Ro36eEs5zq4Y7AqRKeB23+7GHTzj26rY=;
        b=UPZexPPDQpIJhWKxAw1CctSoVExNu0EmY4kn3CqZJj5P+T5auDCfpHTvTGBPm0dUjR
         LdFukbTDWBKb8+0l0XbRByezIH6UlwTGElMh5urMsz4jA/6Xrtc9TVtC9vWbLJ54tSI7
         X5XO4Mo6IWCLuRChRapCEuv41T6C2YaAIeeWlbHe8VxfDdMQVF+QIQcwN8LeXBNOyjNX
         4k0nLFfHwUDMDmtp/BqkeCj2kviAjEEFbOBRf/ZREaw7mVpRDQYkbdCB/nYJyR8IwgbJ
         Ie1UaFohyBQHJpNhtUzL+rFPjRrw+FtX9I1njQa9czJNTR+gqJhOF8JLHsVFklMR/N+h
         GU1g==
X-Forwarded-Encrypted: i=1; AKwUvBxPpnvEafxEUtW9uVKtj73BJjXfJau7hPo7J98kg0DpdC2ci+bLRlxPl9uhm4NAeFbEfmzDSu0aNvUp+0I=@vger.kernel.org
X-Gm-Message-State: AFq9FYILNdPxVqukNulzHqQR66NKF8ZIQvF/TXi/eDaO087glUVAGWUC
	enORRsuB2UbP2ez1a+pxCIQlhT27xXS+f0ptjQ2ebWruKm8SI/xV/K0DLPPmXtYUMIw=
X-Gm-Gg: AYBFou3zPdoJsNE1BiGO1RIUpLdzoBi4xFw8F+Kt7OHpP2bbz5KSnYwfTDTxg0VnvMU
	QWZrG9/M7JP5qisAGcO9Z93nTJKiHKzlUUoY4sw201uZGT8D8EoezNOjyZC37LzuqVC0VLt1akH
	XYcWGORa5Zq1SvIfXhGrKXE2H5GESdvR1L2j00HF43CbymjK6CPNbHKfJHSIh10QtJC7UwcDq99
	+pXV88l/hX1U9+cPa8L1He9E++oWMT9T8iGMiO+j7L1boNvfFQijfPYBi0YRvCosSnjNuC5iTBK
	hg1jmJWiGcH+nfqah/24FPLU7tquJBHgEWnnT8FQhKd0fM4tl67jK3cwbo2qBF1xjJL/NVRqzkg
	5GQQMk9h1TMCQoNyLVTjCOeAo/sY+kYiUtzcLZKXjN24K27A2X6yG5anz5kdRcgqAMnTMs6rpml
	VM2S9SAPAy/+CMF3JnTcl1zJgMhjtWCSvPR04lOZ43UmCCLD1xiJeO9zxEc2tzk0G8oi4J7RmW6
	pffS3Hfw8kBhaEPKkZDWOioEZJFGjz8T6sS/K0dD8Pb+YMoropskTGVID4lw28jzktQ43zpukFZ
	KCegEhYfT//r4qPjo1RAU/aKO/9BTpxkpYRCXQp68QjV4y0s43FElSOoXAjbhMO9SHYJhafwPWl
	tmQZAo0OxiTX2lJP4WT7uPg==
X-Received: by 2002:a05:7022:7f12:b0:179:a1d0:be39 with SMTP id a92af1059eb24-19935fcba5amr14595800c88.29.1793121557565;
        Tue, 27 Oct 2026 10:19:17 -0700 (PDT)
Received: from localhost.localdomain ([147.185.47.151])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm34517842c88.1.2026.10.27.10.19.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 10:19:17 -0700 (PDT)
From: Kevin Dewald <kevin@simpleble.org>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kevin Dewald <kevin@simpleble.org>
Subject: [PATCH] Bluetooth: MGMT: Fix discovery stuck after a failed Stop Discovery
Date: Tue, 27 Oct 2026 10:19:13 -0700
Message-ID: <20261027171913.82628-1-kevin@simpleble.org>
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

