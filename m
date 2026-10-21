Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792565949;
	b=0K+tuEBMRYYBX9gZup+Az0ypGB0tO3XL8FMATOtXHyuTaeZr/tMAlh7OlFftfLtiEuZ0
	 cCPJPPVmlFBSPVz8jtTUzePtkFWcIgwrQMqulmZ1Bgetus/QneHyISHoVmTE9GOiCk8yu
	 1jTsXbRlavb4WnPhYRXkK6l4apd/ibMTdlErr4xByAXVwYR8o0w/qWHc2HKe8fEQaj5fo
	 3PB+8lbns1SysjIGstFiEMzew9O8NXpOMbw/sA6dTYQlBtJJoTh9wCb5VHCJs/xaT93Ue
	 v+Ey2iZH+xE914FcMN1iR8YqlkhAo5kFBaFItYqk1oopppBlAWFGo6SLpPhMHSA7VHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SLexcCgDK2SIVIMYs8/iOOF5BBjM2PxK0AQdb+qmIk0=;
	b=eQyrwJqu3ublTVd9PvGARU+bVQAmlod9O1W0xJ9de9sgdNnDRxrnU6XRE89v3FrcgwBx
	 cF+fSsZ7+zOr5iMsAfxY0m9DWgNZ9I2lC9BF6hYksIeVsQUcMF5qBI0xEaOnrXfVEbsdc
	 Pzm4yxK5ehOmgyyV2MhIPvk/SZBsdM3s8/kzHJ8+quTCtwNRidCDjzRHOftYMFKsFjsq/
	 ef8VJWCvtC4/rZq/T5XxQecMPmprEjWa5+Ih6BznYkt2aoUBf+CqAF/tC+99VxvIKdxtc
	 BSJ1K7gXRmLiwL5/fH8vunW4ePtvB414hXpn+7LL5Zz4Gx6QT+xT8KHQMfzhic0w0ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tooangel.de;
	spf=pass smtp.mailfrom=tooangel.de;
	dkim=pass header.d=tooangel.de header.i=@tooangel.de header.a=rsa-sha256 header.s=google header.b=m90sYhhv;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F7D606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F7D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tooangel.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tooangel.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tooangel.de header.i=@tooangel.de header.a=rsa-sha256 header.s=google header.b=m90sYhhv
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso2049508a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tooangel.de; s=google; t=1792565947; x=1793170747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SLexcCgDK2SIVIMYs8/iOOF5BBjM2PxK0AQdb+qmIk0=;
        b=m90sYhhvzoPRuC4q2/O8LG3/PGBvy/AuAbSPQJ76i8q41A+oXDvG1F7diDOAyI70C1
         wGS4ArVQcworN4xlnmSlEODt+YKzhEU+we9cAvqsfTJeN0EuvHUDQgdIRgrBZEEXQGoM
         kWpSk/MyXY0Ff9wueuUe8msUTddTTl5RGVz5f9U8OXOenpiv3IF+MYAlsDea40r6y3Af
         r2ByA2jDAU+lUnhOVsNJIjcLPanME2tmwNTg06bbZ8ZUua0blsPuns9g/kRp/BjFoUK4
         /IW3QI3MxFsX81BaNdd1ypuF83apuXpwiXFpO0meT5Jpq2U3mgOHf+gz97LoU9VpOv3A
         v0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565947; x=1793170747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SLexcCgDK2SIVIMYs8/iOOF5BBjM2PxK0AQdb+qmIk0=;
        b=rXBH+/JU1Eoq9wkMw2Wdac4lHFHw7+n0FRbZqEm6GjiQVZh/C9sFPJhp8fR4RMNU5d
         DEd4hfinv2GDQhC+6sKR8OpuTKHalNkd4ZQhSpgmUQlFR1BfyNXpMI//815syXOWDe9H
         FWSA5fBMlFm0s+fBm2XRhUkuM1aHRFYZNs7eZSfgG7whGxmJ/qbvMf+kyYQlogb9wM3N
         LaLHlFoVf9dsqFpvMMSkUJZp+kEwMjpc7FPwhF2uUjx5rmBx8a5Hf6jGP6+TdCZW0m4k
         ZaTDzynfCGbdMMkMVbrxba3b5Eo0GZb1qPGQffOFXbDvaqjuZI3KGWq728TUvP/n3lVf
         w4HQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8DhbTW++/DxmDVgYm71QmAqzmDAYyd1TaJzmbZiiCwcfcB5xIJYJ5C5kesi8o8YHEn48WXycKzC2oazQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBqeXHvXrhoKm3TC0upZ4+Z6e/5qGyfQLsuO1iQfyQgvcAqjYH
	BxtydliOuQq55m9wmVxDSyG8cI/gC340nZvs24+vzduUyH06rZpyrXL0hU8Mp/pHS43hKMhMCiJ
	fcZXB8iWReg==
X-Gm-Gg: AYBFou30NuW2yom9Q8b9RQ6M1VEXg+UHLbzwJpBVRspXqb5Ft+HAmrEsiSv0YKO3Yeq
	ZJTyV/oN+5a7N24pyz3XNQE6UJF75k6vN+DmlhKmujissJhhRyaji1qQNLe7z6Fl2vRyf0R1FWy
	X3EyWGD0m53sqRKw0fNbuEH5gy64gyQb4KDkokfDaIYCNNg/l/6ziiu6g5WAHTJQa4dgtBGxI/O
	+LLhpHzHiXSr9WumklIu345/qBCeOjJYhCHa4qN/xf8eerkCtZMqgoRPgpSUPTb30ESP2F96LNK
	+ooRnQMkSgJzzRc3luy4KkIfJJ9uiYEX+yPIWzdAHMdxGF8TzpD4tU6c4JSVPJ9ZxYlSwihZlmN
	WRhjCoNfd4uyjujKG7F96I/0Ha5ULXTftr5znzYw6ySxmpEzQirgfflGQhIKXslLdYzAmKZZ13Z
	xCQvlj4ZZig8YvR/L0tPbEiai4NSD0usRbpOaB3g9gATi+oV63PGY4M8s1WVjyd4scQvo9hyHI9
	2revNXkLXYeGgLpX9guc3bDi8vD/5Ki73JWaY7rV7q2E4wh472l2lo1he3b+YuW/yjAybXl07B5
	CbxWFMOHMHqWeag9smQmRrG8i+/xPODYy7Sk13a1Gtr9MtBsJ+zJ7RqLl3hmj7A92h1lMxCQhma
	n97py1VbgrDws2ofZWHvrjrp1Y+I5ln9CQs87UBOFRvoD/La0IchYPJAHsRiFYA==
X-Received: by 2002:a17:907:b045:10b0:c46:7fa4:9212 with SMTP id a640c23a62f3a-c467fa4a4f2mr33166466b.23.1792565947131;
        Tue, 20 Oct 2026 23:59:07 -0700 (PDT)
Received: from toogaming.fritz.box (2a02-8206-7df6-9800-2fb8-381c-b7e8-86f2.dynamic.ewe-ip-backbone.de. [2a02:8206:7df6:9800:2fb8:381c:b7e8:86f2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679006ffdsm45166366b.77.2026.10.20.23.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:59:05 -0700 (PDT)
From: Tobias Wilken <tooangel@tooangel.de>
To: linux-bluetooth@vger.kernel.org
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: MGMT: Return RFKILLED for Set Powered on a blocked controller
Date: Wed, 21 Oct 2026 08:58:33 +0200
Message-ID: <20261021065833.120347-1-tooangel@tooangel.de>
X-Mailer: git-send-email 2.47.3
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

Since MGMT_OP_SET_POWERED runs through hci_cmd_sync, powering on a
controller that is blocked by rfkill fails with -ERFKILL from
hci_dev_open_sync(), and mgmt_set_powered_complete() reports it with
mgmt_status(err). mgmt_errno_status() has no case for -ERFKILL, so
userspace gets MGMT_STATUS_FAILED instead of MGMT_STATUS_RFKILLED.

Before that conversion, power on went through hci_power_on(), whose
error path mgmt_set_powered_failed() still maps -ERFKILL to
MGMT_STATUS_RFKILLED. bluetoothd relies on that status: for
RFKILLED it sets the adapter PowerState to "off-blocked" and returns
org.bluez.Error.Blocked for the Powered property, for any other status
it returns org.bluez.Error.Failed.

With the controller soft blocked, "bluetoothctl power on" printed
"Failed to set power on: org.bluez.Error.Failed" and btmon showed
"Set Powered (0x0005) Status: Failed (0x03)". With this change it
prints org.bluez.Error.Blocked and btmon shows "Status: RFKilled
(0x12)".

Map -ERFKILL to MGMT_STATUS_RFKILLED in mgmt_errno_status().

Fixes: cf75ad8b41d2 ("Bluetooth: hci_sync: Convert MGMT_SET_POWERED")
Assisted-by: LLM
Signed-off-by: Tobias Wilken <tooangel@tooangel.de>
---

Notes:
    Tested on Debian's 7.2.9 kernel with a soft blocked MediaTek MT7922
    (btusb) and on bluetooth-next in test-runner. mgmt-tester passes
    515/515 with this patch; the new test "Set powered on - Blocked by
    rfkill" fails without it (Failed (0x03) instead of RFKilled (0x12)).
    The test is sent to BlueZ separately as "mgmt-tester: Add Set Powered
    test for rfkill block".
    
    Not tested with a hard (hardware) rfkill block.
    
    This is my first kernel patch, so I'm happy about any feedback, also
    on whether it fits the conventions here.

 net/bluetooth/mgmt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 3b9c82bd2f0..0f93e9e2728 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -304,6 +304,8 @@ static u8 mgmt_errno_status(int err)
 		return MGMT_STATUS_DISCONNECTED;
 	case -ECANCELED:
 		return MGMT_STATUS_CANCELLED;
+	case -ERFKILL:
+		return MGMT_STATUS_RFKILLED;
 	}
 
 	return MGMT_STATUS_FAILED;
-- 
2.47.3

