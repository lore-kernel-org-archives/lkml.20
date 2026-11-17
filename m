Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899585;
	b=5CGDAmQT/J9R3OVB/WadQ1mBHe5SLQ349+Q9cE+EW+nb/dOXoIEnHwgAQUoACUlDZJMN
	 EW50HPafOEf4SK2pixqdzzIoFGaaMeRPetCS/zgwWyUxaMuNd+DnmL9De8BNd0P5SJoCi
	 K26O2CLY8w3jlcf16aiMp2Q5eWLedUEJgpaQpWOBFcVPV8aJpPr3EKZLGSl8T8yXaSTE7
	 VYnZN87pC0L0SCcdAFG1WDHCh1TtjKqed8lqjQZp+46/xj3VvNTZDjVUV4PG2sqXap13l
	 b8/qniwHmvWvHIlOUPJ9OffPf2Xa5nRIcOB6/vyv0QJFGfDU2L4XJLb8uFTFskILHVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899585;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w2iYvgn6DDbcR3QUnXnHrp9nv03ht11VB7+mRxqvBGg=;
	b=Ip5KYw7/6Fk8SUQjnH6dsTUdNzqwQlL+nTocK9MSMAo8S0tMIpZrT4jAjQQMyaSkW0qE
	 TIgP23zC2yHtWd6kr+1zw5xMTr5xbRFDZ65pvaiP+CtJtWsHt6RjL9QuezzRKYKcJx11I
	 eWwuiycM72aHJQfkw+pAp8hNlZt8m6rwTmuqdEovqILe5oerG1nMIfLxQAH16GY4EYjtA
	 z0uH+iz40f/AebDXWBBfZ/3BAUIzbKjoA3OhUmWoCahY6BjLUzZzScBvIa1DkJzpyJ5l1
	 ztMMuD3pRHRNC4vp50kPG8afDnAPYtQKb4MsM8Uuy/bom+ZZ+e2+VgPYQhLMU50m+qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72600606A31C;
	Tue, 17 Nov 2026 07:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72600606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4fe3ee98e25611f19a56ed5b684f684d-20261117
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:994adf11-6679-4183-a860-4a4a80d9c356,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:2a9c66e6fbf9540f5e2a88647239e607,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4fe3ee98e25611f19a56ed5b684f684d-20261117
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1729750488; Tue, 17 Nov 2026 15:12:56 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	leStoppe <lestoppe@gmail.com>,
	Craig Hesling <craig@hesling.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH v2] USB: serial: simple: narrow OWON match to avoid breaking VDS1022
Date: Tue, 17 Nov 2026 15:12:50 +0800
Message-Id: <20261117071250.2843769-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2026111606-penpal-reverse-14b7@gregkh>
References: <20260810091322.2201740-1-huangwei@kylinos.cn> <20261015025456.3927808-1-huangwei@kylinos.cn> <2026111606-penpal-reverse-14b7@gregkh>
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

Hi Greg,

Sorry about that - here's the context.

The patch below adds a USB_DEVICE_AND_INTERFACE_INFO() match to the
owon_device entry in the usb-serial-simple driver, to keep the
owon_device driver from claiming OWON VDS1022 oscilloscopes (which
are driven from userspace over libusb and break when a kernel driver
binds their interface). It reworks the commit message per review
feedback and carries the reporter's Tested-by.

The complication surfaced during review: the VDS1022I variant
reports the same interface tuple (5, 0, 0) as the HDS200 series
that the owon entry was originally written for, so the
interface-level narrowing may not reliably separate the device
families. The reporter's VDS1022 reports (5, 6, 0x50), which the
narrow match does exclude, but the VDS1022I does not.

The open question for Johan is whether to take the v2 as-is, or
revert to the original broad USB_DEVICE() match given that the
narrowing cannot fully discriminate. The full discussion is here:

  https://lore.kernel.org/linux-usb/20260810091322.2201740-1-huangwei@kylinos.cn/

The v2 for reference:

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


Thanks,
Huang Wei
