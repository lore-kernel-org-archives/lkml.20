Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003157;
	b=0yMgxQsdKHu+8hpNW9w7QyYJTjitXZCzIKB4rwmoVNDvQ06SkTp/bshmvw8R1OJ1nmYa
	 e54hOwrh9/AnZuNgPyVMQWg9MSJoC3lPExro2wMSg60LVfdVqUevAaY74nhAGK8gvGVu5
	 8Y6lmL0mKI/k8hmUH2ExR9BsqeWLLcuHU9OE6h8LUCAN3aZjbolmsdjCsrMzzTRq22Ce+
	 GC3Nlx83tkT9okakBpoBIfLpHsCi4hhm/kjrnvbcnI0w2EbAOUqhwC2y0EzGI2jy1MRSI
	 mcIdNUoCkzLINYFxg8DuiFSlZATddJFcxpL9iu/D6eYJK3pql3NawkyurQfRB5FrpTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=z9O6BgWW6yaoipar2Lx1Z0Xt+u9evhaGrz9gWofeNXw=;
	b=2Cz7bpdhV9SBg6Xpyt5oIjitx/OncAex5xLfvZR0602WcLfLsq2DhS7R+2IVN536g1qx
	 BC/FXKbn+HfTJKpUoMwsWm0+ZBtGpzL+YD5MoJEd8kekEQKRBtrLg6jZiaAHq0HM0CZ4m
	 NzvnH9jFixuLEd8LhOYtWmRyA0MggMVVhYRkz3YQkzxbSkOmxOJg/wMVaE5Sqlq11q6zY
	 K0MYTFhPGAM729YCKxJzSQlHgA7piGO4VnLMhBEYpG8CJ7Z4W8TbzMdBCs9NbVqpxV3Ef
	 +XSSUPA9tKW3aL0kkOS/hIbNgXSE5wMtOIi4x2XusBjxcc+jmYu67b6Ydf3Zyfhd1vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IeuF7SNg;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D28860A2602
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D28860A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IeuF7SNg
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso27472115e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003156; x=1793607956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z9O6BgWW6yaoipar2Lx1Z0Xt+u9evhaGrz9gWofeNXw=;
        b=IeuF7SNgsWKr8mfHuqMn3piad19yrIPng7Qi5/R9ATgZt6+pxrUyTpRgf7mHwPtoPU
         x6eyhDcTEkq82eXc/wwnNWi+qnd6TJxkEzafUiyKIbet12xmHy0ImvG4h34Gmv2VNhIb
         EfLMFcrxug60OtriEIVRKdK6Wcv6oBbQ12mtNyEjwYTVHJTNjn12nvVe4LCucRIzJH7c
         sgYtfOFTGjXz/Qz+W+rCNStKreQgi5AwEi3aU30d9+exkKdwKWbbKplKOfeaGMaRrZCn
         kwjr8RH8wAzH1os1sw4mb74Rd+h9mFKQKb+3RWjXZ2zXjgl8kRGqmuysqwfnD7UYA2vT
         f89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003156; x=1793607956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z9O6BgWW6yaoipar2Lx1Z0Xt+u9evhaGrz9gWofeNXw=;
        b=q8//V9e1guz3jUJIAzKvQqYTkX6XPNzyd96mHtSW7KO7OG5C8pAzNwhh3t9QrZ/STY
         qApC+8nyyUVdDAEtfSRzucSMoP7CkwSpK75X5OaE6e8uXJoeeuDWv+FhJsh6L/gB0sw9
         YXIgpy7pGuEwITMlMgZU+MxeYpJ2/TM1c8y2stbETIa1YvmFHDXNpHHsdNj1d4aUtCw7
         Ht6Cal6YpYPoBXFCkqgulkmIC6z82GkdbmAY7b7YxbNaXrS9c1+p6pSK+WbZFDNGvdnE
         QbMArAnSmfWVvrk3hitY475tpvgnefLItt5MR0cBl3yDAeWxby4JJ7b0or937CihBfeQ
         yfTA==
X-Forwarded-Encrypted: i=1; AKwUvBx1y8jMJMiu7hx6Vujo8Hr9+uouk48bBNncISIWTq1VkjlwrTpZfkGQHLHtm6luwE/yTIuZiR+mlshVHvQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLbzQOkMjDbHWiKGS6KXSWPf1alLV00PeoK6EPctR/L8CFwIch
	sHWEduigWqvBHoHW9FQxPm3xXZ1Y6/lsDMezSFSZpeT2a5V/m94PJxg=
X-Gm-Gg: AYBFou1vNa52HN+wBvoVTk0jUxjFydwrBuV83uOZIUnJ5OzlAztwdhW8vnGfoL+ptYO
	Pcc2l+mo98HP+Mxi+TE8XLRN9izkX+RTZeb0mKroFfrvCw90itpg4TDiK8CHIFVL9SCQgOu2zu9
	dPCvRfa1VHz5COMzL1Mn5myRLn1ncQKKRsJ5F/iIMiqPF1U5e202Tr89pnxSUuOVDrvp3ESd8ju
	XhXfDMT2BSbOsSpjam/grpZdTZ65Oq1OI9LyKHey4M8h/0Qn6uQLYQ97/uzORoKKwPlLHyqhCv0
	B3jWVpxCGeGsh0ZrZSKWgsNCMq7+U7VQuzm34E14o3jwNymjashQaACTjvE5aQpNWkG8WI1CKSH
	8qTxomSGphRJcfE9T/vINJccnbURDwrwzRwXobtz2fFr/fL4Ag+kFdiS18DmtRAGp+joHkKO6lP
	ZfiRT9rih/jp0RCkft1LQ+fTg/pByz1WhMs1k23mFoNzfG2sUZm9RibG7ZTDxbZ8qtXa1o710Ej
	cvJ3pBdkLka0YkpfThLv73juLarR5ARhTrZRlJQ1YxDwCve78qPjKzOI2v6gV+/wfNwDYFVdIlh
	rdOayr7jJeaZZZd0Js16JvI/2ACv2Tqo/XZ4
X-Received: by 2002:a05:600c:6384:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4a35ac3acb7mr104137425e9.3.1793003155767;
        Mon, 26 Oct 2026 01:25:55 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm211058215e9.1.2026.10.26.01.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:25:55 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: sakari.ailus@linux.intel.com,
	johannes.goede@oss.qualcomm.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	fernandorimoli11@gmail.com,
	lsa.uz@pm.me,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] media: ipu-bridge: reuse the software nodes on rebind
Date: Mon, 26 Oct 2026 09:25:49 +0100
Message-ID: <20261026082549.662885-3-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026082549.662885-1-dmanresa@gmail.com>
References: <20261026082549.662885-1-dmanresa@gmail.com>
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

The software nodes are deliberately never unregistered so that a rebind
can reuse them, but ipu_bridge_init() only takes that path when the IPU
kept its secondary fwnode link. Removing and re-scanning the IPU PCI
device clears that link, so the next probe tries to register the IPU HID
node again and fails:

  sysfs: cannot create duplicate filename '/kernel/software_nodes/INT343E'
  intel-ipu6 0000:00:05.0: Failed to register the IPU HID node
  intel-ipu6: probe of 0000:00:05.0 failed with error -17

after which the cameras are unusable until reboot.

Look the registered node up instead and restore the device's secondary
fwnode, keeping the reference the lookup took. software_node_notify()
resolves a device's software node through its secondary fwnode, which is
not set yet when device_add() calls it, so it takes no reference, while
the device_del() of the next remove does resolve it and calls
swnode_put(). Dropping the lookup reference as well would cost the node
one reference per remove/rescan cycle: measured on a Surface Pro 7+, it
was gone from /sys/kernel/software_nodes by the fourth.

Assisted-by: LLM
Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index aea4699..45a304c 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -1098,6 +1098,7 @@ static DEFINE_MUTEX(ipu_bridge_mutex);
 int ipu_bridge_init(struct device *dev,
 		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode)
 {
+	const struct software_node *ipu_node;
 	struct fwnode_handle *fwnode;
 	struct ipu_bridge *bridge;
 	unsigned int i;
@@ -1108,6 +1109,27 @@ int ipu_bridge_init(struct device *dev,
 	if (!ipu_bridge_check_fwnode_graph(dev_fwnode(dev)))
 		return 0;
 
+	/*
+	 * The nodes registered by a previous bind are still there, but the
+	 * PCI remove/rescan cycle dropped the IPU's secondary fwnode link to
+	 * them. Registering them again would fail with -EEXIST, so reuse
+	 * them and restore just that link.
+	 */
+	ipu_node = software_node_find_by_name(NULL, IPU_HID);
+	if (ipu_node) {
+		fwnode = software_node_fwnode(ipu_node);
+		/*
+		 * The node only becomes the device's secondary fwnode here,
+		 * after device_add() has run, so software_node_notify() took
+		 * no reference on it. Keep the one from the lookup for the
+		 * swnode_put() that software_node_notify_remove() will do on
+		 * the next device_del().
+		 */
+		set_secondary_fwnode(dev, fwnode);
+		dev_dbg(dev, "Reusing the previously registered software nodes\n");
+		return 0;
+	}
+
 	if (!ipu_bridge_ivsc_is_ready())
 		return dev_err_probe(dev, -EPROBE_DEFER,
 				     "waiting for IVSC to become ready\n");
-- 
2.43.0

