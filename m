Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9652372B2B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244587; cv=none; b=PuLx86Yyqai9uWWLMGLcbcRQAf9Mas/iwNmqEkaJKxaIYp4+XjyQoye6cB+JDdUo1XenGg7asj2TpibbIYFSmLbPrt7X75jrOqj20KvEpiZaqUGsbcGEf38JNDXPkKJVRt06+GG4jbVsGy/O6A6mIffp5QueMduz+FF7D62yr/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244587; c=relaxed/simple;
	bh=UPqoKv2odN2alKdKmCDWKQEX8FGs9CSOoE0x0PikD4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gX9haw5hsSttBJ/80TpV0wcLqXiR1uEc70p9O4XlTHbClU5k1ALhId4hempt58s5o34olIyAdbfOQQBDYehbYz9jqRBhpKEj1cij8ojKBOwQ/6wmYQlFpB0qwifgukVhuzyK+y+/Cee3do6YKIYUA0bctYZ4XIqqZfAVapOmuS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8srwwIS; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8srwwIS"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so812885a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788244585; x=1788849385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWXzOdnKhbhpWmdwzC3tIWpczbOSi2dbzs4RTvDwpr0=;
        b=L8srwwISH37UTbJRP+eTmv5yFlTxRWqkozQ6Yas4sKgbkXEm1cNlwyygCtiA5CGyZh
         Q/CgkNxgMk7XNkemi4Lc9Df/bkR/spg0se4KsvqlhlXHH/Ck17jO3pNi0QTcWGyR0Pda
         727AepTQtuflUFOYFf9g65dS2tDQzQ5H8wDUmKDPrIYhS9s3IjW+z4z/F6VzaZeW52UY
         Tsy5DKKsAq3YFl7d1GMCRwDHcp/0GvpTTmv9l9dVHK8bjExtVqWkUEn/dxS2C5NWpeCq
         8r2lr9BTf/VV9TRsn8RHdef4f2o3obysYOeXrO0x4NxymIlkaBvP21CoqiaySKrO6Lp8
         gRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244585; x=1788849385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AWXzOdnKhbhpWmdwzC3tIWpczbOSi2dbzs4RTvDwpr0=;
        b=jycRSU86uXahzEn+0IRrc+CHShf0CEqA+wJhXmzYEw4NNwXStu0dMZ12/S0pEazJ3o
         YIvIudryiCKHB87AHiIATmkH92p0X2XtD4jWLrSU7JH6ivoynqvCr41g3rXxruRPgGFu
         wevCGdWdq3zXAa/+8Bx5vbpx71yIAD4utH9vNiGROqWdsraouO2bUbLuhzbqNoqtMISg
         k3qj48F7W3Uk+300JVvojGjFL/tUaNIBxsoq2it4Xd/r1II6djLh+qvqhdYiZ/jpnskm
         l2r/KXPtaqNzGImWtrNrBny4sLI4bS2l28p9KYGE/pWVzkF40jLsEZwmBg1fyyQkXb4s
         4bow==
X-Forwarded-Encrypted: i=1; AKwUvBwIMLIvOZwZOuN5SbWiEqGdQ3AD7xzlCHuiJQftgIhOYOrQx21L2qpzSkcreolPCVAqJPmB4hb1s8iabqI=@vger.kernel.org
X-Gm-Message-State: AFuF++l3U4D5tZXdVHRif16MpIsVlb1uJYa9eHqZLnxOuDrzu8qyqE54
	20zczhm9ObHd1eDMefXARH2MZzeExwYL7op0EHy8+pa22nm+oy/RzBOQ
X-Gm-Gg: AYBFou3bDGjf3viBBkRn1edE571Mn3qntpUqtnCArt+MJSgL805HS1eWvVAH1shaNDS
	3qPPm2YHIn2tkr2B0lOyBcqY8H3qp195aCFIhspVEwFBYHpcJxf264PczaxXeJzYQ6PXH4t6z1/
	Z4czPXZCKnKhqsVxrI0JxneujTzKe7mAyyIMDgd9VLfmleejUPtPvQZYSA8Q7lutw3rwOKG5CaJ
	n7GiPefw/5u812tyGqTx2wBMu57+wePeLAJ9RKPJb3VdrdSHkCwX/9GtpBZ9yKH1/GZmxfga92S
	8SCtAE9jJPRSZt9cu8uL3NdkHcwNBRVO2QRYa/GN7wEnX0I8lzATKNz2RY10RzDkH2koWcUTw0m
	jR4lY1qn94rgqZPwFoELFwWUw+1baIcgovKj5I9KdcEJNo3ZZ31qPn0HqvfzRXSkRFuEu9+ree3
	3/eqWMLZzkCt2ZNN/JOYesxjrbZgGFkZ+l64zpB8Iwj6xhLrnSfmpIoBU6zxj+HTMzekiI4FvKC
	1IuwP/82KttXA==
X-Received: by 2002:a17:90b:51c8:b0:394:ed5c:ff9f with SMTP id 98e67ed59e1d1-3990f890efamr3798410a91.17.1788244584948;
        Mon, 31 Aug 2026 23:36:24 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.192])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc854dsm32694425c88.10.2026.08.31.23.36.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 23:36:24 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] HID: hid-lenovo-go: initialize command completion before hardware
Date: Tue,  1 Sep 2026 12:06:04 +0530
Message-ID: <2421c0ebbe4a487acb20317d03e581b3438e4471.1788222001.git.mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788222001.git.mradityadash@gmail.com>
References: <cover.1788222001.git.mradityadash@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The configuration interface initializes its command completion in
cfg_probe(). The hardware starts and opens before this call. Keep the
completion ready before hardware I/O becomes available.

Identify the interface after parsing it. Initialize the completion for the
configuration interface before starting and opening HID hardware. Keep the
remaining configuration setup in cfg_probe().

Fixes: d69ccfcbc955 ("HID: hid-lenovo-go: Add Lenovo Legion Go Series HID Driver")
Assisted-by: Pi:gpt-5.6-sol
Signed-off-by: Aditya Dash <mradityadash@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index b937d11dd6f6..51e3112780e1 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -2388,8 +2388,6 @@ static int hid_go_cfg_probe(struct hid_device *hdev,
 
 	drvdata.led_cdev = &go_cdev_rgb.led_cdev;
 
-	init_completion(&drvdata.send_cmd_complete);
-
 	/* Executing calls prior to returning from probe will lock the MCU. Schedule
 	 * initial data call after probe has completed and MCU can accept calls.
 	 */
@@ -2436,6 +2434,10 @@ static int hid_go_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
+	ep = get_endpoint_address(hdev);
+	if (ep == GO_GP_INTF_IN)
+		init_completion(&drvdata.send_cmd_complete);
+
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	if (ret) {
 		hid_err(hdev, "Failed to start HID device\n");
@@ -2449,7 +2451,6 @@ static int hid_go_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
-	ep = get_endpoint_address(hdev);
 	if (ep != GO_GP_INTF_IN) {
 		dev_dbg(&hdev->dev, "Started interface %x as generic HID device\n", ep);
 		return 0;
-- 
2.55.0

