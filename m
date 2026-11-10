Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349405;
	b=EFbnXWhJM0+zACjhbqaGdw0DwFXDJ5HdaIxuq6I/At6E5/4ntQ13IeAnSlJ9onyloBUM
	 NwoCUR/9uPfj129JxP8KB3+WMJ9j3JiFROeFtDQyH33KVUtpJNYufdlLVs1uXHH8u76vu
	 eFHoTtGa3akTU3eYsN44nEqGSEqtaQeYd0s7olw0BE8P4Nn2XCybWFhy1G3gA4A/V+tbi
	 DqQygllLyuzW6DsV3SWF5HbT7NSNc3vWsLu+CiUVMZXYGfaTs6dMRtRZka9lhWU2S57Vp
	 Nt6qKsZyDS6dCWHv/fxnncVio076JQ3y92Yc6SDS393hAobHHPWBKT/hJ5oJijGD1rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=otRyMeb75+VLZ1qPaOWUchAC2U7XAkcMMqGgLecGB9I=;
	b=0eIshpYkm9WFz+6Hw2P2RV8Hg9nPojqawpPp/+sPv6vyYju+z2ppNxpRxOzd+QBcbYbs
	 hoTbq5PmR5EeYNqQoxeslYH8AK5Hyr8Pt44XBS8yiizCdpoXrVwvCV+mkQFKW686Sgkce
	 9A9rIVIaaA3D87Nd3tifp92RzPjklFTTZXPSeAxgOa+QcLUeW7aNRSr9IIkjgz6LSJdAO
	 n/Tl40Fz2zuV85J5s5XWVgTVX050qT14ItlKBR7WEc6NFL74d8Rpwc3aM4D3zBYE9N25Z
	 1yfzxjdbzip6pIfbbRbBf7oDD6DdsaivDWOUX3rMiD9FjcdRLLC9smexJ6k7cSndYuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lPq7O3Wk;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FF9606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60FF9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lPq7O3Wk
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3acec6677so3968547c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794349404; x=1794954204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=otRyMeb75+VLZ1qPaOWUchAC2U7XAkcMMqGgLecGB9I=;
        b=lPq7O3Wkj/vM9r3JNDdcLozDsq3fAdAlDjXIzdHKc8R4VLWraDlUVNMFGf4MnP5gIH
         QDgj/BCupkFkv/4PTDaAkiwxxLYF43/GxA/7Z7cRo00yhngqIfiiqtWjzD7+c/kg9Twm
         BotE7kiX/vYjzMykrFH89ewEElErt+gEsRuANUeih0aSi8tG82tpNSPS/9+jH7SMzLRm
         jAtkudGVXM/tA2CJZNtQ1OLIKKowgfIDNSZv6EdOOlJJBaYBIFb8qAwDipQJ9CrAZYEZ
         YeaN2gfAfbDQKCe6p488tiJov3ZwzwCjAUiA2+oMLuI2L/y1U5/TzsTfRBK4A5SpsfxV
         0cVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349404; x=1794954204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=otRyMeb75+VLZ1qPaOWUchAC2U7XAkcMMqGgLecGB9I=;
        b=XgWX25PUV1+Ysia3J1D+al/5eoR0nwJk2fI81WyCveuznoky26vwTuKzcQ8sGJ72tH
         5EKBhYGos0loePivrg6l1A4kZKKDbb0UzHYKU0aIrlSIzroRQqhqhFsrMXWEcYTBHw94
         iukp8q3ckoxxmQRDrIVCwPnOiUt9KeIWXiRgBNPLjTHAp1uR822oB7bROD9QVIo6YN4J
         0i4L3jKdW7NV6AHAjJkfoMDxtsvQxGxOMup/DNwxXYVVOIQV/EZN/pqd/qLKE7iHTn7J
         Tr3HcjwMpLMS5lYNuboUB2z3D5NvazlmcD09P1D4l8twMBlEyq5bsMMEqTk/hdJYYkrq
         quRQ==
X-Forwarded-Encrypted: i=1; AL+hErHgzMtbCUnsuQNuuD1hoqoYTjBwS4cOnZOiYuV0hrTS3HNfwEEt0ODBI21w+XYpqBwYVlfnYjwawZUwjvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R7+w+qNEF1y8nwB4qRJCHpEACGF63irsAqHlS3MmU1M0bV14i
	x+l6TSY6sBk2I1Cwzg0UCdI1JQY+97m9+lGf+F/eSihJEG0s+9U4/5U2
X-Gm-Gg: AYBFou21A1XFwDeGuvzJHh3edraviYCMTltOIpnOy/LmWUCs1EEuGJoMtqEWypujg0h
	incOcyRdsvltW5+egY4dgSpHwtxXXv/cSnv4hKPtoi1aUYxE/XOQuBb+QTjcdwQ9r8qcfeuLFtW
	XVPqxPcJpjZSEfKsXe9P51LgXjIARnBZ0xE6bQqtLino6pQuuFgWwFB6UiGPghTiina9oXSoORs
	KBbBUV4j8nexD16v+/CxkZX8CZ9fdkdUe3pKyLJx/FP4BAOwZ1a0pFvfyN2H+ZFUSEMK4VXuhIo
	saenMybGSkjMK83Qpvg4fLWZI3DksOrWGDtBH46a+5xXmvlTXqu8YnJyp/XVUA2m6n2yFDPT+yo
	R3+VpISxPxIZyK12gAJMtgy8PRm8epTp9PpnbO0kGpYCrTb4yLvYQjZTmShhRvmIIIWvOSZ6TXS
	Sxc3fe0+LS+Znurq7dqjbjCILC2BpSsrz/cUMx16mDGNg01z/jCJdFlM01mJ/7EE0Z8Xn7olG4G
	a5JhOBvyRXILso2WR+DlRvfHtL/YlzYz3BE45TVnZL+o10f5OH5xsIXvECHNZtj4D0CUF5Irshj
	KIj5+RCeFHQjd6YBHHyMGeGFKfH0Hs+6uJ9rdp+nZ1/zl/WLHSd9j+g/20c=
X-Received: by 2002:a05:701b:2903:b0:136:c443:80e5 with SMTP id a92af1059eb24-1b3c023c9aamr353445c88.6.1794349404165;
        Tue, 10 Nov 2026 14:23:24 -0800 (PST)
Received: from localhost.localdomain (wood.seclab.cs.ucsb.edu. [128.111.49.37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm9882751c88.9.2026.11.10.14.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:23:23 -0800 (PST)
From: Praneeth Balasubramanian <praneethb2002@gmail.com>
X-Google-Original-From: Praneeth Balasubramanian <praneeth@ucsb.edu>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manish Mandlik <mmandlik@google.com>,
	Miao-chen Chou <mcchou@google.com>,
	Praneeth Balasubramanian <praneeth@ucsb.edu>,
	stable@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_core: Hold hdev->lock when freeing an adv monitor
Date: Tue, 10 Nov 2026 14:21:44 -0800
Message-Id: <20261110222144.204736-1-praneeth@ucsb.edu>
X-Mailer: git-send-email 2.25.1
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

hci_free_adv_monitor() removes a monitor from hdev->adv_monitors_idr and
frees it, and its comment says the caller must hold hdev->lock. Readers
such as read_adv_mon_features() walk adv_monitors_idr and dereference
each monitor under hdev->lock.

Since commit 7cf5c2978f23 ("Bluetooth: hci_sync: Refactor remove Adv
Monitor"), MGMT_OP_REMOVE_ADV_MONITOR runs from the cmd_sync work, which
holds only hci_req_sync_lock. On the HCI_ADV_MONITOR_EXT_NONE path, which
is also taken while the controller is powered off,
hci_remove_adv_monitor() then calls hci_free_adv_monitor() without
hdev->lock. A concurrent MGMT_OP_READ_ADV_MONITOR_FEATURES can load a
monitor pointer from the IDR and read monitor->handle after the monitor
has been freed.

The MSFT path already frees the monitor under hdev->lock, in
msft_le_cancel_monitor_advertisement_cb(). Take hdev->lock around
hci_free_adv_monitor() in hci_remove_adv_monitor() too. None of its
callers hold hdev->lock.

The missing lock was found with an LLM-based tool that checks callers
against the locking rules stated in kernel comments.

Fixes: 7cf5c2978f23 ("Bluetooth: hci_sync: Refactor remove Adv Monitor")
Cc: stable@vger.kernel.org
Signed-off-by: Praneeth Balasubramanian <praneeth@ucsb.edu>
---

Notes:
    This was found by an LLM-based static analysis (GPT-5.6) that checks
    kernel code against the rules stated in its comments, as part of research
    at UCSB SecLab. The patch and changelog were drafted with Claude Opus 5.5.
    I reviewed the patch and take responsibility for it.
    
    MGMT commands need CAP_NET_ADMIN in the initial user namespace, so I am
    sending this as a regular fix rather than a security report.
    
    Testing: builds without new warnings with W=1 (x86_64, KASAN and lockdep
    config). Not runtime-tested.
    
    The patch applies to mainline 9ba46df34488 and to next-20261109.

 net/bluetooth/hci_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 74d9865e08c2..b66d3c295e5e 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -1966,7 +1966,10 @@ static int hci_remove_adv_monitor(struct hci_dev *hdev,
 	if (status == -ENOENT)
 		bt_dev_warn(hdev, "Removing monitor with no matching handle %d",
 			    monitor->handle);
+
+	hci_dev_lock(hdev);
 	hci_free_adv_monitor(hdev, monitor);
+	hci_dev_unlock(hdev);
 
 	return status;
 }
-- 
2.25.1

