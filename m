Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793301645;
	b=lSDKhM2IVP59lhlU31LKdDVSl6qHrMKoVeRszDmQTArikPy1deU1+8BN05WSO1k+aHzY
	 wtDIPu3Eve64+5O5LsPWE4y/fhm82RgS/wPXVEX6L3DGXnfJcdU3ICHdI/JLNYxGg5Nmp
	 1HQsUROWGaY4+xD2BzdKmbOBP9gFNkjHgSkBEmQUgBjpv4wZoNX1etcVNnlValyuMUW9S
	 1woNEspmLCXjoamjFKGNFXP5c5TyVYELJymSUifxMgkGJffv4TMeZKQbVicZWAUcqdXBV
	 Ksw2GU+rUPICKqxAdUIkdXqrncuI8XBRvieQykfvgUDcA/Qd3DpC+FU51Wq/PKmWHMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OTOeXd7mA5QqjS+6C2ZpxpznOieEWowecDQJlB5SCxE=;
	b=uMHC8w/3hXl1TFTA3vpZiue1yl/NKkwFSlNU+Opd5cpiSrlMEUnN51g/0ofT0M3HLgnn
	 7zzI1GDMhBZ+PlW0Ix5h/vrHAUvZQ5QWr1OSazHDcy1FrkvwVfD4u62Lr7YMsKnYF3BgD
	 dfwA1lsZnyW934+9elmWFQyzrL3MmFVepWMBmbiCIREIiywMrluE5X2V/OycNrRhWhgFd
	 gaY3fLsUuILzvMMTc+z6JZyAMefHFVhf0XKJY8hlAq7GYfvyTWk0z+oFFOm7j/TMc+/0Q
	 YuKdQovdDjhYKrz58DHmaNIUZRDBOY2DV7Gxbh/g+N7/ORaQVC4QH6acG/AYkuCYJhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDWZIvNJ;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEE560A260A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CEE560A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDWZIvNJ
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-679e6ab6471so1034006d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793301644; x=1793906444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTOeXd7mA5QqjS+6C2ZpxpznOieEWowecDQJlB5SCxE=;
        b=MDWZIvNJXJWfGggaqa/rEVWLESYuOYbys+QrQUN+FoJraiHlv/rY3p4v6OS5Lz3SI4
         v6gfHBwX2bPLwBwh7s16+VXCYDhyi+c+Gl5iWhtqXDLrAG6s3sY70j1iFCrjQosGL7Ih
         6CQlzkYLaxeD3l9hcUkSp3+BQEFfNMUIN7oCspPNwmB8sm4VKD+FIFH7WuEkazfBl1Aw
         rH0vRBihDifw18jfKYgh31PYfFSG9PFzUeqAN00d5nL0iKOOQyIL1q+Nqoj1s9h2JNbv
         RI1ovIG5lkEH8PJ8ei7PQEy68PCP1LOVRhv1ExlMaOnYgCZDWnXZ9p8qVAuSj+cMxcif
         fByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793301644; x=1793906444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTOeXd7mA5QqjS+6C2ZpxpznOieEWowecDQJlB5SCxE=;
        b=0YuC7/OadZMGZYSzuWwI0NtTgDeo9UiRlm2hnxT7RO+Ep0KhlooRpyM6xwfH9gRRYw
         nzZdFBqQQ4MJB4Dfaf1QTq+KeAzzuLjczLgA5V9wADFqeshgapT3jzppJYBqo9qMFJl3
         qVIlBgASwNV4MPLvrqTfWepEq5YJeiLXlY3CHQnTM+076cbnEoVb9DJeDQZChNQucSZP
         TbN/hfj6lH6NnAoFJO196Cc63SfrqnfvmK3DK/9ka3kF0j+yi4z+soesRxEZZGspZpAd
         07hgtWAKHAQOVCmo1YOiCAFysDO5770qmw5Fdix+1MeaKGkS5IfuwUiGJe3dIcIgwJN0
         0tTw==
X-Forwarded-Encrypted: i=1; AKwUvByY4CWNtS71wEC0/z1gkHYnSwu8IdfiOxjIc5RoiiiRk8SH8fnPhzxRRptxP2C/IdNbt/yBlgVrxKpE7PI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeQxZNZGWOQCmmXfC0yNdcnx6AtrqX1jDTp2daeP8CYZ+OGv/+
	zpjDTFq3kazq+KMbyHam2YyeUlaNapS0xc1QWWeymipngMouZU4Az7DD
X-Gm-Gg: AYBFou1UIE5SnuhQJ4jSRWbybka4eOEG52WqhjevWfaxbbuVFURnIBxsyv0nubMBRAe
	YyuEAAXCiNlpf6Jqfil7aUcsQscl1ZcKEJhwAIuy7uSzbDv+/zK+9mtjDXS9F/f3+6MRHIuMtjh
	zLgUK1GDS+++c/AKqDhTlR8ktREqjEhoFIihIrixpaWyYWiTpwfW0Ox1J1tfPsX2BEZRVR+gCjV
	CRf8OjsXb6jzDHD7fkKhYT5mOpLGljztG9IVr+jj4o4WfXRQYWcpfox7QRdQKS8vZL4FaAZvIzf
	svWPCrJ1ltU/y/22hdWoGoW0iA6dS2oCn4TwYKmlbmi8lB2eMXdEZ0mAWsClv6cEfy8c5OpriLu
	j3Lx5Nq8nePNG7PoS2B7PeRMTWomKPoMvPhlj7FS4bNcUICiF3cfghRNG0hKrA6paSiVt6gLgRe
	ssWNh3OlklYO6mJGgq/RUGJYWDolAVsgEXI9Eq360en5ERvmnsIqqw9m7VTuskgXWge8XCcXfEl
	NShGtbtXiyqEPE54WM2kfthmePv1AkIUo5I/pAtiCO1bOTPTuKae+vdaCCUWYUCyYeF/0jptXMw
	WQwgcGYU2nBPqeZMckIDBcPZtW3w
X-Received: by 2002:a05:690e:400b:b0:679:b274:8998 with SMTP id 956f58d0204a3-67a8d6366e5mr2701592d50.47.1793301644142;
        Thu, 29 Oct 2026 12:20:44 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:45::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba3a15d42sm151406d50.14.2026.10.29.12.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:20:43 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kbusch@kernel.org,
	Alex Williamson <alex@shazbot.org>,
	kvm@vger.kernel.org,
	Nikita Vetoshkin <nikita.vetoshkin@gmail.com>
Subject: [PATCH v2 5/5] PCI/sysfs: Use user config accessors for serial_number
Date: Thu, 29 Oct 2026 12:20:29 -0700
Message-ID: <20261029192032.1325629-6-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029192032.1325629-1-thepacketgeek@gmail.com>
References: <20261029192032.1325629-1-thepacketgeek@gmail.com>
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

serial_number_show() reads the device serial number with pci_get_dsn(),
which uses the kernel config accessors which don't check
block_cfg_access, so a read that races with a reset goes to the device
mid-reset and can fail with -EIO or report an all-ones serial number.

Do the capability walk and DSN reads with the user config accessors
instead, as the "config" attribute does, so each access waits for any
pci_cfg_access_lock() holder (e.g. pci_reset_function()) to finish.
Also wrap the reads in pci_config_pm_runtime_{get,put}() like the other
attributes that read config space.

A reset can still start between two accesses, but the next access just
waits for it to finish, and the DSN capability is unchanged by a reset.

Add a check that both DSN reads are successful, unlike pci_get_dsn(),
and fail with -EIO instead of reporting an all-ones serial number if
the device is disconnected between the capability walk and the reads.

Unlike pci_find_ext_capability(), the walk doesn't check dev->cfg_size
first. serial_number is only visible if pci_get_dsn() found the DSN
capability when the device was added, and cfg_size is final by then.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
Tested-by: Nikita Vetoshkin <nikita.vetoshkin@gmail.com>
---
 drivers/pci/pci-sysfs.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index a272f8583a8f..c2a5f53affc1 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -696,14 +696,25 @@ static ssize_t serial_number_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
-	u64 dsn;
+	u32 lo = 0, hi = 0;
 	u8 bytes[8];
+	int pos, ret = -EIO;
 
-	dsn = pci_get_dsn(pci_dev);
-	if (!dsn)
+	pci_config_pm_runtime_get(pci_dev);
+	pos = PCI_FIND_NEXT_EXT_CAP(pci_user_read_config, 0,
+				    PCI_EXT_CAP_ID_DSN, NULL, pci_dev);
+	if (pos) {
+		ret = pci_user_read_config_dword(pci_dev, pos + 4, &lo);
+		if (!ret)
+			ret = pci_user_read_config_dword(pci_dev, pos + 8,
+							 &hi);
+	}
+	pci_config_pm_runtime_put(pci_dev);
+
+	if (ret || !(lo | hi))
 		return -EIO;
 
-	put_unaligned_be64(dsn, bytes);
+	put_unaligned_be64(((u64)hi << 32) | lo, bytes);
 	return sysfs_emit(buf, "%8phD\n", bytes);
 }
 static DEVICE_ATTR_ADMIN_RO(serial_number);
-- 
2.53.0-Meta

