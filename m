Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5033147F3A0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253783; cv=none; b=VWw0GEuVoFEmhlxzphUNop8QBb/bvCUqDyt9y10sy/zriVkSlAkv1EOPPWr61k+R0o+1eIjfi3HR5zbiecTbddlW/kQJveieJiWKQwrFhGecxvnEbeop/cOBGCCLcU651kUUJPFZwEzmlr9PsHvCHkH/I5/5KtyJnaaoaeOVH8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253783; c=relaxed/simple;
	bh=iSvvSNclJPG2ooYiR9bHRNj3aceifTgkKrBOLKWAyB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=acsXCMjTicWYdYyeHde27f8MYyjPYT2WjeIN7IJefxYaXoZvx1o0DXcD98AuZTYOeR9ZpxoAgka8lQIUkhJJMcRPzEXKd/8kNs8xznEc41C8x9xshJajHkGJDIyF0x/h7SsKTBAsK7P0/tkBL9tqPmVhPy/pUhqNXzNlt6sgJTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knqcXpX1; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knqcXpX1"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1438f55921fso793845c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790253781; x=1790858581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3nSA9EEF3/n3h1KuMWloOJQEZf6Lv9q69NWlFq+IQMA=;
        b=knqcXpX1HYDFlM6xJNqj6/I99wiQHxzEUFptVmk5ZGa+hFvxG28bXy0XT/GV0BxkJh
         m1GFRtv3gcNtYhJawk5Gw9/WTR0XrZ6cga8KvST3NJMiJOnZt+4gAVWn4M1nb79TGVMQ
         UCNvitdrOuhPArXp4C3tnjRjot0O04hH6S9jYtow/Ay54Uj73LwAH3NvGTNqMTkZtrT6
         Z32V7YeeoiweeLuMapO6zBR0L/ua5HbWp3qql1DipzOCnwePioIA67m5A0/bTzVSMyCl
         AFbNDTCigLbIDNWAc55SyDAkJxvhqMqLtNJQPbjMnehFE9dfRkPzq9UCilqhvLCCMfqW
         zYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253781; x=1790858581;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nSA9EEF3/n3h1KuMWloOJQEZf6Lv9q69NWlFq+IQMA=;
        b=Gw/mSA+8p4Duu38mRHkWGopZTOpMCcqHpRHmcX4UuXEYEl3ItbhXdiNtbwyuDoNISX
         Bq5s73Ky4NnUDH+Ytl4zXtOfI35eMyvPhs99fLxPrU6lUP06DQ4c2rNU6IsBOg2KlWwk
         yKrB6LKG27WZS5/PQgs/4Fs05AO+Ht2GcaFhaUd995lS90Vn0BUcPefpHRMd+EQa8Tbu
         8p2f3jWa23YHyGFedjSeKP3pZ1+TMonr01GqrfLuNgLdKVVRwt5ZVJQ7oagcDMnctV74
         V9nKS13yxFNkW6LYPcFDEUMPOe0OrlmgAwZDCDC1pH76W1UbY18q3WMcBvjm4QN8fEyX
         I5VQ==
X-Forwarded-Encrypted: i=1; AKwUvBxY0V5rHoj7vdB38EXThejD1ITIZPjteOGvntK05mVt4pv0U7XBmC59G7GcllbGCNE92/aV2m8iVuwY4MA=@vger.kernel.org
X-Gm-Message-State: AFuF++k+O1MkPwjaPLW78XXuHZpX0jz+yrdVVenDdirNR6yFLQ9RbcpD
	DDKKfwPYg+uZjoqRk6TjCa/Pr/zcmpwUrB6ng7c196Aq4bAX/faIDZku
X-Gm-Gg: AYBFou0iF7fXOWPjtkGNMLRy5LuAErl1Mymunl4xtHfyOpfJAfxzgI+M6iLPf73QANR
	uyU1ajtSeGJxvgQ8KvHRRLr5fYl8RDEKoDJF+kg3e+xGEiovRZf1kG73z2a4to964XYMIkNFVzZ
	YZnRi9rsvslQh4zBZXwukTMMkEb6vNG1+8Arecpx540/qNXhV0nHNRtS22spBI9ZUTX1YAl6teU
	B9j0CP5zCavkvmPR9LWSsiO3sFcpbnAOUgAE3HbYMmFp9zg6WZCJDe8QR0ovR8U4cgIVYUX8hRp
	Rk87c/xOtHaaTenNtLxF2x8WGjcv6ZGhiHEsUQV94dPYA2ou9v6+vXgsJNjiUgjL8n5nBw05+UE
	U2TtxG8tGUnFVsfL/cZWTgLRBekgmej8ZYItgPO2c+VD0COWlfFinXetMhvoCF0BQ59fchaIWUP
	KEvXbTiiwyvLI3yFdw00WN7+YlexDk3+7ZUykJh+u42lZvThErB6YSwTuUa6g6R3cuIA7rFroQn
	dN+ABFA
X-Received: by 2002:a05:7022:c4d:b0:143:8829:5fb9 with SMTP id a92af1059eb24-14503f3c3fdmr1827214c88.16.1790253776803;
        Thu, 24 Sep 2026 05:42:56 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:43a9:9b8b:ebdc:6411])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f986e465sm13466113c88.9.2026.09.24.05.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:42:56 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: bhelgaas@google.com,
	linux-pci@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] PCI/PM: Do not restore a config space snapshot that is all ones
Date: Thu, 24 Sep 2026 09:42:20 -0300
Message-ID: <20260924124221.12374-4-fbeltranmillalen@gmail.com>
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

Belt and braces for the previous patch: even if a snapshot of all ones
is somehow recorded, never write it back.  The vendor ID of a device
that was present can never be 0xffffffff, so a snapshot whose first
dword is all ones is known to be garbage.

Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
---
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1833,6 +1833,17 @@
 
 static void pci_restore_config_space(struct pci_dev *pdev)
 {
+	/*
+	 * Vendor and Device ID are read-only, so a snapshot whose first
+	 * dword reads as all ones was taken from an inaccessible device and
+	 * is garbage.  Writing it back would corrupt a device that has since
+	 * become accessible again, so leave the hardware alone.
+	 */
+	if (PCI_POSSIBLE_ERROR(pdev->saved_config_space[0])) {
+		pci_warn(pdev, "not restoring config space, saved state is invalid\n");
+		return;
+	}
+
 	if (pdev->hdr_type == PCI_HEADER_TYPE_NORMAL) {
 		pci_restore_config_space_range(pdev, 10, 15, 0, false);
 		/* Restore BARs before the command register. */
