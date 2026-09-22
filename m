Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D380A3BFE41
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064358; cv=none; b=QY941y73Qxn6V21KeNeffOPr+X8FuckZorAOUQTLGqP0TesftHi2bUcobTLrHiR2pFrFwwXHPKCHCxfNemtcgc0xa4lkNbze1wkmlILyhvRFJE7cG73y/6e7Zv/K/QIbYpaYzZ66l6PFjChEtscem9GgMt9k15KV2uSMq2AFmRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064358; c=relaxed/simple;
	bh=mAzOYQqUt4F72g1YLtR8zyHxUm6A24el4YGVu4iM8tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k9cpMZu4e76FnWfLpHroTuaN5VtpRnP8L2vtMDFAgCA9NeW5n88Ec4WjKPUDCtZEVQH0xvB5tn3+15DZ9ap7iACICmCnbdPR4f79XkJJcvD0HigFelI9rF+bGdb4rlWq4oAUFcReeN3qCAfcWBo73KUUhNEfbnG20QFP03Yq2Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aIYPhoC9; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aIYPhoC9"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso3665157a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790064349; x=1790669149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpOZWpxjdXQXhMPgIqRaZuniCjJ67+oosNX04DosQoc=;
        b=aIYPhoC9ZGSM4JtP5va72Hal9eyr5Xz4XLs2xyYBrtSxL4Z72Ae1WcE2QOhyr5TA+x
         357Dgf6GSbGsoRNakGGD/tZBVQkPfuvGsceMoYV6OOP/o3B7ip+VUvEqCjbp7g9Z/VYw
         eFjglOYXKvVaqP+7me0yjCQjYzuGisIPMTYVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064349; x=1790669149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpOZWpxjdXQXhMPgIqRaZuniCjJ67+oosNX04DosQoc=;
        b=oL1XSQ6gsyDFsARFqvmUziCGTI3IKNiyiRD45dBzPANXEM+/PtEXTE6OkSAEddJ8pZ
         lt8hQeBfVuKrizj1j5nduIJBIMPwXv9R2UuyKSqqjp91lNJF9tir9zWy07InbM2ZqYv+
         7WLbcM4BlLPnoJcLWZmNtarjkDbu4l5rZ4M3VtKgXOZehEAlIpcofDX32DSCWpDuOv3A
         0xHhOQBvVPEhpIUTMM6LzgbVdaxYM7M7AsO5v2LKO7UyCJKOnCi1YQHwi5L/Y+Nm6y0m
         RYbqPpdteJCAsTMDDQHtNDcOnEw4BLMMLfJ/O6SwwSbO69lrXvF7ROY/T4bJsDPVBkWY
         9vAw==
X-Forwarded-Encrypted: i=1; AKwUvBzN+aASUfY5BrLzCkNcP2yZJVvsShUuAxl3aDn4IjwMxXgkONwhjmoy0azz3lqsdsyBMrGjD5JJTpXOHIA=@vger.kernel.org
X-Gm-Message-State: AFuF++nK08MdHZCUpXl4jEAXFU1UrHveRzHs7ni5r04hfgjPbojNx+Tw
	DeHn3FgCBRVsMeUI8RMgnCAsAyHXPUwjaELG0GeuMxC4HNd1Ra8Cm0+MfJNwk8GWKQ==
X-Gm-Gg: AYBFou12WBlrAda+4RZPsLyiPDNyXHZwG43VqkoYMAk59J/M8XMRZhzua9DUr0h6xG0
	nLJrmMVduqZLFl8nVe7bZWG/mZl+CkBFW0Tac2QhRhy9wskj6m/DolvorFn26timknfI1N4t1bz
	U/y8yPJRWCc4GCxSXfZHdHSMGMs24baVPLlZF1WjFOpuw52X08cWtbnfn/xgYdw11GOscl7Hyq8
	btu4j81o9z1Z6KBIFYr2I2eycQEs4B+8U9YVuDn7h9shNVUFgcxn1fG16/CmL5b0jYzrCMR2VQ2
	90cI2SWysYRQYUO02RxPX0o07F8I8y5b1svTwYjL3eevd8DU6xQDpEEcA8bPC0wsbOSYegb4Ejr
	wP3YwqbS9XJVvvEW5Xt/fEneo6uaLvoXcaj86AL7n6LOBbUok6oYnSLspISG4p/M1a+gW1Uw1Rh
	cjc801YQy6OKc5YN09DWJyHSmP/N+9Cu3Em/Izl3GoiB6qcQXxxRwgKtyk8MBvb+HBUqWd6y7rU
	3XWox+A7nzTESWvHn60yu9W/j6x1PBi7Og3WumUjVUdQN6TLZXHY3HEoA==
X-Received: by 2002:a17:90b:35d1:b0:39d:f95d:bd08 with SMTP id 98e67ed59e1d1-3a073112cc5mr356439a91.14.1790064348807;
        Tue, 22 Sep 2026 01:05:48 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:387c:500a:8415:7dd1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674df8bdsm3334602a91.16.2026.09.22.01.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:05:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: hub: Set proper message when usb_hub_create_port_device() fails
Date: Tue, 22 Sep 2026 16:05:41 +0800
Message-ID: <20260922080541.1986179-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now when usb_hub_create_port_device() fails, it prints a separate
error message to say which port failed, but otherwise leaves 'message'
set to the default "out of memory", which is somewhat misleading.

Allocate some memory to put the custom formatted error message in and
use it as the error message. If the allocation fails, use a generic
version of the error message. The allocation is explicitly freed after
the error message is printed.

Variants of __free() were not used as it ends up mixing usage of __free()
and goto. Also, kfree_const() won't work as it uses is_kernel_rodata(),
which only returns true if the symbol or address is in the kernel image's
.rodata section; it doesn't work for module .rodata. And the USB
subsystem can be built as a module.

Assisted-by: LLM # local reviews
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Explicitly track and free the allocated custom error message instead
  of using devm_kasprintf()
- Link to v1:
  https://lore.kernel.org/all/20260728100005.413868-1-wenst@chromium.org/

Sorry Andy, I ended up not using your __free(kfree_const) patch. My LLM
was telling me that it won't work correctly if CONFIG_USB=m.
---
 drivers/usb/core/hub.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 0e929a4c9fa1..398ae53cd8d7 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1480,6 +1480,8 @@ static int hub_configure(struct usb_hub *hub,
 	unsigned int pipe;
 	int maxp, ret, i;
 	char *message = "out of memory";
+	/* Used to hold and clean up kasprintf()-ed failure message */
+	char *msg_alloc = NULL;
 	unsigned unit_load;
 	unsigned full_load;
 	unsigned maxchild;
@@ -1756,8 +1758,11 @@ static int hub_configure(struct usb_hub *hub,
 	for (i = 0; i < maxchild; i++) {
 		ret = usb_hub_create_port_device(hub, i + 1);
 		if (ret < 0) {
-			dev_err(hub->intfdev,
-				"couldn't create port%d device.\n", i + 1);
+			msg_alloc = kasprintf(GFP_KERNEL, "couldn't create port%d device", i + 1);
+			if (msg_alloc)
+				message = msg_alloc;
+			else
+				message = "couldn't create port device";
 			break;
 		}
 	}
@@ -1792,6 +1797,7 @@ static int hub_configure(struct usb_hub *hub,
 fail:
 	dev_err(hub_dev, "config failed, %s (err %d)\n",
 			message, ret);
+	kfree(msg_alloc);
 	/* hub_disconnect() frees urb and descriptor */
 	return ret;
 }
-- 
2.55.0.1082.g2b9226bbc0-goog

