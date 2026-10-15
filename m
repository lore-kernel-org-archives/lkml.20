Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3124438DD3;
	Thu, 15 Oct 2026 02:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032911; cv=none; b=c0cZwp7D5I4OuVAASzCCCWqjNLLNclwIz7v/LkXvTL320pmW/NLiuRzN9x0irhp427G4a9ZQ2guL7UCCdmzY/RuHbehFUalT/vDtL/qn1aFZmVojni9V8WW9uXOE9eiaJK2edXzkSObLCwMnjB4KfddeBKFg6ymI6lEFbc+Cr3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032911; c=relaxed/simple;
	bh=E1wRGPA/x0gNvyro0OYTIuwxpHkAaaD2CrDKabwwEqg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=joxOqJoipSdkf8Ym0n4wBhocIMmHqMaiewmjIg0x8CDj3Yl5OvrQIt+M4+2a1BJ3iy8EnSF5VKgaNDcLxxjad0moD3yLqePogo0w+qW8WK+9Z0vE79OHfw7ah4zj+D5tMmataJHmcpIfmkTwtkZawbANMc964VLSYZU3aiaaAmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d0d1b6acc84311f19a56ed5b684f684d-20261015
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8276e19a-ccb7-4451-8a9d-c23f774c19d2,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:b5a651a0c9e50a2cd979bddb28569e5d,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d0d1b6acc84311f19a56ed5b684f684d-20261015
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 36289395; Thu, 15 Oct 2026 10:55:01 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: johan@kernel.org
Cc: gregkh@linuxfoundation.org,
	lestoppe@gmail.com,
	craig@hesling.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: [PATCH v2] USB: serial: simple: narrow OWON match to avoid breaking VDS1022
Date: Thu, 15 Oct 2026 10:54:56 +0800
Message-Id: <20261015025456.3927808-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810091322.2201740-1-huangwei@kylinos.cn>
References: <20260810091322.2201740-1-huangwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A USB_DEVICE() match on VID:PID 0x5345:0x1234 was added to the
owon_device entry in drivers/usb/serial/usb-serial-simple.c by
commit 4cc01410e1c1 ("USB: serial: simple: add OWON HDS200 series
oscilloscope support"). OWON uses this VID:PID across multiple device
families (HDS, VDS, SDS, PDS), so the broad match makes the
owon_device driver also claim devices such as the VDS1022.

While the owon_device entry is equivalent to the generic usbserial
driver for kernel-space users, the VDS1022 is a headless scope that
is driven from userspace over libusb (e.g. the florentbr/Owon-VDS1022
tool), which can no longer claim the interface once a kernel driver
binds to it. Prior to that commit, no in-kernel driver claimed these
interfaces.

The two families can be told apart by their interface descriptors
despite sharing interface class 5 (Physical): the HDS200 series
reports subclass 0 and protocol 0, as documented by the HDS272S dump
(firmware V5.7.1) in that commit's message, while the VDS1022 reports
subclass 6 and protocol 0x50. Match the full HDS200 interface
tuple so that the VDS1022 remains unclaimed and stays accessible to
userspace tools.

Reported-by: leStoppe <lestoppe@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220193
Tested-by: leStoppe <lestoppe@gmail.com>
Signed-off-by: Huang Wei <huangwei@kylinos.cn>

---
Changes in v2:
- Rework the commit message per Johan Hovold's review: describe the
  libusb-based userspace breakage instead of the incorrect claim
  about falling back to the generic usbserial driver.
- Match on the full HDS200 interface tuple (subclass 0, protocol 0)
  instead of the interface class alone: both the HDS200 and the
  VDS1022 are interface class 5, so a class-only match would still
  claim the VDS1022. The tuple values are verified against the
  HDS272S dump in the commit message of 4cc01410e1c1 and the VDS1022
  dump provided by leStoppe.
- Fix the multi-line comment style.
---
 drivers/usb/serial/usb-serial-simple.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/usb-serial-simple.c b/drivers/usb/serial/usb-serial-simple.c
index a0afaf254d12..879508f54d69 100644
--- a/drivers/usb/serial/usb-serial-simple.c
+++ b/drivers/usb/serial/usb-serial-simple.c
@@ -100,9 +100,17 @@ DEVICE(nokia, NOKIA_IDS);
 	{ USB_DEVICE(0x09d7, 0x0100) }	/* NovAtel FlexPack GPS */
 DEVICE_N(novatel_gps, NOVATEL_IDS, 3);
 
-/* OWON electronic test and measurement equipment driver */
+/*
+ * OWON electronic test and measurement equipment driver.
+ * OWON uses the same VID:PID (0x5345:0x1234) for multiple device
+ * families (HDS, VDS, SDS, PDS). Match the full interface tuple
+ * reported by the HDS200 series (class 5, subclass 0, protocol 0) so
+ * that devices with a different interface tuple, such as the VDS1022
+ * (class 5, subclass 6, protocol 0x50) which is driven from userspace
+ * over libusb, remain unclaimed.
+ */
 #define OWON_IDS()			\
-	{ USB_DEVICE(0x5345, 0x1234) } /* HDS200 oscilloscopes and others */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x5345, 0x1234, 0x05, 0x00, 0x00) }
 DEVICE(owon, OWON_IDS);
 
 /* Siemens USB/MPI adapter */
-- 
2.25.1

