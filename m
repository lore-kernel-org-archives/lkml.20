Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A229E3B52E7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253777; cv=none; b=XDIcMYo3kP1/tk8+nUDb5zSPcYoMpLbE61nEf7f06g+9sOVVF2uPKs0paE9vlhSKO+/UgLzdEuRbFBhdxB3TcVAdCEXbixYMTS9mreSmEpVs/np9S1/BPSXok8PnXJCG2P+UX8Tf6vUWViprSfKWK/9FZFXeGibRUwGZ/7ZZKrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253777; c=relaxed/simple;
	bh=8FgMrEmm0JiYVw6ocyB7l9dBdrnuGH2s4bxgWJk2VSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T/3d0QI4VvQ6kE1m3VvehqfzF9NvUaWaEd+umaXQJ0Uxym18uLPGNzycQu3FjMw64YqKEBhGvnhXXCFy/qN2C0eVLHn1n1f/agCsC7GR97boux0DH15M720QIz/hT6OkDVBdlA2o9Tf5gNgMzIsru/vit7Q3LpdDsAySDsjQdew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRS/VT5M; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRS/VT5M"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144ee9debe9so1864121c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790253774; x=1790858574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zh0cibQ7z5HGBDLn9XfRjT/3Pcdpg2HZa7+pEHrMH5Y=;
        b=ZRS/VT5MWHrEHXgX3iOtzN7LCtdWMtItu61eG8TthTl5EHamXMqIJ1lHWfWWiBxCuT
         hq+sReBzY4KWrLZg7Hq8Z7fKS2ma5EKrURBJhOj7CBsKDpRbZKjMEw52tiBgb9CTU1Cz
         XWER6kRFanJON3SVZjMBH7jw6EbccvESKOLDyAXPUyU19CFnyCUmxRyIcOEAXIhKVsDt
         umjRh/IopISHHFb3AwljyG7baZ8GD0JkgNi90CtyT1SGaj79H3Um9ahUFFElka+ZvH4d
         Z6IhMahNJ57elgXzBuJPpgp9yOYOih5KspjP1SkIFSqGV79DCpraU3jR5/JjDeIBA3Dh
         tAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253774; x=1790858574;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zh0cibQ7z5HGBDLn9XfRjT/3Pcdpg2HZa7+pEHrMH5Y=;
        b=1bmpNSCQ1AgvUye6YlH5zoQXDfi/BK3tly8isx/k1fzDWx64SU6ukGeQ/44bYcddEt
         ErRl2jVNGYAfHOWe49X9ncEmyebqlcwCRFsYN8k0GSxk24BgfxVQE3pk/zMF56Bu3Aal
         8kbyxGRtp7l+qjkNXEpliqEyjUNEg1m6cal/CqVbEcRy6E0YUFk5+7+V8sXSxUIRKRuy
         pEfVITVPB8/vM4wGkRGX8SiXPpXTVGQMhybkwlNu5RANbWUgDbCOhxTnHOu1jfnTyIUP
         VtoCzobtK+sX82nhb6ZaHfM6mgf9nGLQZEfBZzMSBGDaDrDiiFBig2wzR6WL09F8SlRH
         JBJw==
X-Forwarded-Encrypted: i=1; AKwUvByS0O9gUJZA4j+tWZjEbBRpeffWt9Yjq3o/pROXyEpxccSucWtM1WNt4q+mYqn+X2e4u+U0RhUHJv6FH5Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lwbf8nURn2CmxEg0anoyD/GBgPjQzIrGXJ0VpyDAqfLdhaE/kn
	+ujSWnF5Bolo009kJBq58sFMFzIugdZzeVPHyX5HToapzfcD0wPw5A4U
X-Gm-Gg: AYBFou1M+gfcUesHAEcoUUZt0SeHEokW8vecUulNG/zmHW0z3OqZAKXZMaURwt8nKA4
	XQqWwRzoZkgUXcHqWaGNSnk81Q38R9OxISDAjptGqAVZEgDAbxXQ/ajMdq03T+Eii+mWpjfRhzk
	LVcSKBddB8qLxy3bqFS6CuS8F4W8cPnvXw9denEZSHga7Egn55n5ERC8meFMGenW9zUn7vA/OTv
	AMnlrFwr3hpQeLX6bLa5zJf2Wc04wTqXYqNXTKpSMejtNGQ+LU1W8aivpB3m5adiAtqYpsvL5w0
	E3Jll6+0Uqx0FedRRK+m88t7ChtKlFsD+cwLCTxhn1NCEnwgIntJ/SRKcOHTXhjNoXOz9wxs8uS
	3XEOcoS/D3oNgitQbrzq8EdZfqcWLhYpa8CI9WKHSdrQ63dVTcDAztrN4r8To6d2NL8bhQX/MLt
	CYQAF8ak2rtLqxHvQEFFsGNcOazOVErKSSWRzSyWvTXYrk88ybl+ePkeqaN0ikoo79+KuWPyLEP
	Ai/z4pG
X-Received: by 2002:a05:701b:42d0:10b0:145:f4:13ff with SMTP id a92af1059eb24-14504057eb9mr2029569c88.43.1790253774401;
        Thu, 24 Sep 2026 05:42:54 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:43a9:9b8b:ebdc:6411])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f986e465sm13466113c88.9.2026.09.24.05.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:42:54 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: bhelgaas@google.com,
	linux-pci@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] PCI/PM: Do not save the config space of an inaccessible device
Date: Thu, 24 Sep 2026 09:42:19 -0300
Message-ID: <20260924124221.12374-3-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924124221.12374-1-fbeltranmillalen@gmail.com>
References: <20260924124221.12374-1-fbeltranmillalen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pci_save_state() reads sixteen dwords in a bare loop and then marks the
snapshot valid unconditionally.  If the device is already inaccessible,
every read returns all ones, and that garbage replaces a previously good
snapshot.

Restoring it later does not merely fail to help.  On a bridge that is
still alive, writing all ones sets every writable bit of BRIDGE_CONTROL,
which asserts Secondary Bus Reset, and clears the primary, secondary and
subordinate bus numbers, which unmaps everything behind the bridge.  On
a MacBookPro14,3 this is what removes the Thunderbolt USB controllers
after a suspend/resume cycle: the bridge keeps answering, but the kernel
has just written 0xffffffff over its configuration.

Check whether the device answers before saving, and again afterwards,
because it can disappear while the loop is running -- on this machine
the window between a successful read and a failing one has been measured
at a few microseconds.  Read into a temporary buffer so the previous,
known-good snapshot survives if either check fails.

Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
---
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1740,13 +1740,43 @@
  */
 int pci_save_state(struct pci_dev *dev)
 {
+	u32 buf[16];
 	int i;
+	u32 val;
+
+	/*
+	 * If the device is already inaccessible, every config read returns
+	 * all ones.  Saving that would replace a previously good snapshot
+	 * with garbage, and restoring the garbage later does not merely fail
+	 * to help, it actively damages the device: on a bridge it asserts
+	 * Secondary Bus Reset and clears the bus numbers, which unmaps
+	 * everything behind it.  Keep the old snapshot instead.
+	 */
+	pci_read_config_dword(dev, PCI_VENDOR_ID, &val);
+	if (PCI_POSSIBLE_ERROR(val)) {
+		pci_warn(dev, "not saving config space, device inaccessible\n");
+		return -EIO;
+	}
+
+	/*
+	 * Read into a temporary buffer: the device can become inaccessible
+	 * while we are reading, and then only part of the snapshot is all
+	 * ones.  The previous snapshot must stay intact until we know the
+	 * new one is good.
+	 */
 	/* XXX: 100% dword access ok here? */
 	for (i = 0; i < 16; i++) {
-		pci_read_config_dword(dev, i * 4, &dev->saved_config_space[i]);
-		pci_dbg(dev, "save config %#04x: %#010x\n",
-			i * 4, dev->saved_config_space[i]);
+		pci_read_config_dword(dev, i * 4, &buf[i]);
+		pci_dbg(dev, "save config %#04x: %#010x\n", i * 4, buf[i]);
 	}
+
+	pci_read_config_dword(dev, PCI_VENDOR_ID, &val);
+	if (PCI_POSSIBLE_ERROR(val)) {
+		pci_warn(dev, "not saving config space, device became inaccessible\n");
+		return -EIO;
+	}
+
+	memcpy(dev->saved_config_space, buf, sizeof(buf));
 	dev->state_saved = true;
 
 	i = pci_save_pcie_state(dev);
