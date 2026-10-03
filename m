Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DAB4A35
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 20:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791060460; cv=none; b=pWYd35soVUsS+z5iAKm6jrL37VwbGYzwEDtFpcEsjv7MFLVTcL/EGyL/vIgd7Vrho8GZHvIiUKeXiz1TzlZ6bx0/ofC2toxx2dt1jyOgFym0yXIgIi6YoB2zirCbbemyDRM+1gs9i/vFYRcBPbp4CDclT6n0yifEB9+T5Tvbco8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791060460; c=relaxed/simple;
	bh=3waTcqu7WfSqnyy1qyZwokR9PDx0faALLxsyPG9SpJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cPSDRe8AOcHP1ymjsUSbtRwvoxUj4FojeuT91T8NmsLUs5VebuvAsA8+KZcTxQtpM3JWQqMZ3RRXbgRKXkAz5ya3suQY4bFYGuvav9D5xTEKzo9NVmJVWcf9z0yMin5bLADPv19PGbalM807B/N2w+dB2Rp0uCsIdhdCK5IFhNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQr9uVSX; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQr9uVSX"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-344447f9c3dso285545eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 13:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791060458; x=1791665258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LWI6jJflnF3Jznt6V7RyFKMPgWKtj7c0n940mijqVvA=;
        b=JQr9uVSXsv2Ua0enSnOay6YLetoxy4uX0DdfnZAoYNwmasUjq4tVDgtAWs+e0c71Zp
         MKUO1BfrRoOaV3pGjROMiKz27HwO1cgbIUM8YI8RZeVXYabNthwWvpG8J2oR9zaJzKHF
         6PYD8RZp3j4SRJJRsoDGRs//G18+kVz5RE1zxpKMj+aNKRm6abf27M2kNmrEgkU8Phrj
         ISFZ5jeJ118U5oNzpTM18bHIIp2RmlxtcYiu/Sn9M9CxkULWLBDInvNzi3SgoOTJ9e1e
         UQKRUc8Kl3bckexOdiRgxI7exnDWGXsQonMg4WyLV6Xr5r2f4Mq3szBjzxzB2j9w0q95
         JBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791060458; x=1791665258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWI6jJflnF3Jznt6V7RyFKMPgWKtj7c0n940mijqVvA=;
        b=VtyssXxWgmsl2fmOzCl3U0SEiVa+qoW6Cg576XKtl2wdf2PJU6VUHmpDqxauLcxpPA
         Fcz4hgLNg4n1jn7+9cxbrkzk27vl8+qoIkP/DLZwL4OyuIWEty7/mSNiws6C/kD1yzOx
         DamJ36JwWZ3+sA1NVhq4gumMuWVZoUVldbrEgXrEkkmZ/l3LSGwWD+Ggy5UKFKYich0R
         7y1e3A6PJancYFv7wWpECsjkHJ3JrcmpV+rpwguwslIL9BNsE688lBVk2RAwbk4byhzd
         4VsL9JYHH6xs5SSPSuaZb4vSOhhC14bzsa5QJscEexgAgWGSeYCca6f50M/Uod0wgXiC
         jYVg==
X-Forwarded-Encrypted: i=1; AKwUvBxYEpmr/Hx0ucNHdmot5/8ciwk50ZXtxKEnhOxbrsfM118DhE7OJwwCqEnyQ+M/LjA88vj4u3mvzFHGRy8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+fOHscrZQntze7tktuJ6EjLBYmesfTzu24bHd02nM7p9Mc/0q
	5RRwENxwnWqH/ZfRxRVpldQb8K6mCv2eYF3uuVa2QpWVw/mWnS4bFBJp
X-Gm-Gg: AYBFou1cUldbVtIwT73Nz1wQ2Lw4fhDUf3IhvVpWoEPSozVeAKPWPZkwhtJiGLgXcs4
	RGMr/xye7d4XGarE6K0UH/AK2KfwXDH4ti8dk15RWHDckN7K4M8cK72MnvNMKDFq5ghSNzUN0x5
	cSWy1wpzzSn2KSPC9zCqPjZfLM3Padrel6oLDCiaLaQ+5uYWm1oBhqZvBD5+E+aCrisduoJp8aT
	sLYl+H7hzTD8gWX3T6mOy9jQuCAHsbuzKr0i6IoMqX/7JMkRqiV2urNy4GaaXn/wYf/JYfdB1Fw
	C7qPYcFyqyXdG859ZkI6MKCFm08BmPwmP2jrtYdTOu2qhsadynb58CvN4ZylcLTfi68RjdUFrHP
	bahjCcpPlxdBZk4+4mqyLMHILU3amw+i68J5AMDOgpq1sUE3IB4PhYCeVPf05DKSh+4YeBQOD1J
	jgYVNf3Krp3qQOfmwK0bPdwT4bn6QJNC0e1eYTQzBuPxzYJXpsN1f0YIo873cM7n4i4ii6pVtoq
	tmmPkPnaioFHzGY0TMTocCPhkeOQdZXrsOJ3mSxwqPbBkH5MtBl83YN9BscwFcvSF3leNs7Fe5L
	Umo=
X-Received: by 2002:a05:7301:702:b0:33b:fc17:e786 with SMTP id 5a478bee46e88-34f150c35bamr6919058eec.16.1791060458241;
        Sat, 03 Oct 2026 13:47:38 -0700 (PDT)
Received: from eve ([2601:644:4300:43e6:fe7a:b82e:befa:cd4b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fd4dd2sm19853100eec.20.2026.10.03.13.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 13:47:37 -0700 (PDT)
From: Sergey Tiraspolsky <stiraspo@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sergey Tiraspolsky <stiraspo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/chrome: cros_usbpd_notify: Don't use a non-EC parent's drvdata
Date: Sat,  3 Oct 2026 13:46:23 -0700
Message-ID: <20261003204623.18124-1-stiraspo@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_usbpd_notify_probe_acpi() takes the parent's driver data as the
struct cros_ec_device to talk to. Only the Chrome EC (GOOG0004) stores
one there. On older devices without the updated device hierarchy,
GOOG0003 is a child of the ACPI EC (PNP0C09) instead, as on the 2017
Pixelbook (Eve), and the driver relied on the parent's driver data
being NULL to fall back to sending a 0 event.

Since commit db65a06d10b3 ("ACPI: EC: Convert the driver to a platform
one"), the ACPI EC's platform device stores its struct acpi_ec as driver
data, so on those devices the probe treats a struct acpi_ec as a struct
cros_ec_device. The "Couldn't get Chrome EC device pointer" warning is
no longer printed, and every USB PD notification, e.g. on resume or
charger plug, oopses:

  BUG: unable to handle page fault for address: ffffffff96103220
  Oops: Oops: 0002 [#1] SMP PTI
  Workqueue: kacpi_notify acpi_os_execute_deferred
  RIP: 0010:native_queued_spin_lock_slowpath+0x29d/0x330
  Call Trace:
   _raw_spin_lock_irqsave+0x59/0x80
   cros_ec_cmd_xfer+0x2a/0xf0 [cros_ec_proto]
   cros_ec_cmd_xfer_status+0x1a/0x90 [cros_ec_proto]
   cros_ec_cmd+0xb7/0x140 [cros_ec_proto]
   cros_usbpd_get_event_and_notify+0x42/0xc0 [cros_usbpd_notify]
   acpi_ev_notify_dispatch+0x4e/0x70

When it happens during resume, the machine stays on a black screen.

Only use the parent's driver data when the parent is GOOG0004, as the
probe already does when deciding whether to defer, and continue without
an EC device pointer otherwise.

The root cause was found from the oops logs, and this change and its
changelog were written, with the help of an AI coding assistant. I
reviewed both and tested the fix on the affected hardware.

Fixes: db65a06d10b3 ("ACPI: EC: Convert the driver to a platform one")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Sergey Tiraspolsky <stiraspo@gmail.com>
---

Notes:
    Tested on a 2017 Google Pixelbook (Eve), where GOOG0003 is a child of
    PNP0C09, on 7.2.5 (Arch-based distro kernel; none of its patches touch
    drivers/platform/chrome or drivers/acpi/ec.c), building this change as
    an out-of-tree module:
    
     - without the patch: four oopses with the trace above in the logs, one
       3 seconds after resume, and lid-close suspends that never resumed
     - with the patch: the probe prints "Couldn't get Chrome EC device
       pointer." again; a charger unplug/replug produced 9 USB PD
       notifications, all taking the "EC device inaccessible; sending 0
       event status" path; suspend with a charger unplug/replug while asleep
       resumed normally; no oopses
    
    Not tested: a device where GOOG0003 is a child of GOOG0004 (that path
    only moves into the if branch here, its logic is unchanged).

 drivers/platform/chrome/cros_usbpd_notify.c | 37 +++++++++++----------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/chrome/cros_usbpd_notify.c b/drivers/platform/chrome/cros_usbpd_notify.c
index 6f5eea4938..5657b93a6c 100644
--- a/drivers/platform/chrome/cros_usbpd_notify.c
+++ b/drivers/platform/chrome/cros_usbpd_notify.c
@@ -110,24 +110,25 @@ static int cros_usbpd_notify_probe_acpi(struct platform_device *pdev)
 	if (!pdnotify)
 		return -ENOMEM;
 
-	/* Get the EC device pointer needed to talk to the EC. */
-	ec_dev = dev_get_drvdata(dev->parent);
-	if (!ec_dev) {
-		/*
-		 * We continue even for older devices which don't have the
-		 * correct device hierarchy, namely, GOOG0003 is a child
-		 * of GOOG0004. If GOOG0003 is a child of GOOG0004 and we
-		 * can't get a pointer to the Chrome EC device, defer the
-		 * probe function.
-		 */
-		parent_fwnode = fwnode_get_parent(dev->fwnode);
-		if (parent_fwnode) {
-			parent_adev = to_acpi_device_node(parent_fwnode);
-			if (parent_adev &&
-			    acpi_dev_hid_match(parent_adev, CREC_DRV_NAME)) {
-				return -EPROBE_DEFER;
-			}
-		}
+	/*
+	 * Get the EC device pointer needed to talk to the EC. Only the Chrome
+	 * EC (GOOG0004) stores a struct cros_ec_device as its driver data, so
+	 * only use the parent's driver data when GOOG0003 is a child of
+	 * GOOG0004, and defer the probe until that driver has bound.
+	 *
+	 * We continue without the pointer for older devices which don't have
+	 * the correct device hierarchy. There GOOG0003 is a child of another
+	 * device, such as the ACPI EC (PNP0C09), whose driver data is not a
+	 * struct cros_ec_device.
+	 */
+	parent_fwnode = fwnode_get_parent(dev->fwnode);
+	parent_adev = to_acpi_device_node(parent_fwnode);
+	if (parent_adev && acpi_dev_hid_match(parent_adev, CREC_DRV_NAME)) {
+		ec_dev = dev_get_drvdata(dev->parent);
+		if (!ec_dev)
+			return -EPROBE_DEFER;
+	} else {
+		ec_dev = NULL;
 		dev_warn(dev, "Couldn't get Chrome EC device pointer.\n");
 	}
 
-- 
2.55.0

