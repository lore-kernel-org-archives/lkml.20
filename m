Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914390;
	b=OGsEKzyp1pyxCLLdzZfiSmiZjs6He/U5gYQOp4yCQn1m2qUgzqQvmHxXA7SkpdqeFNSe
	 eEvZ71SbQwbOtqlCGBPOp8uBOpfC+M6lyP/JtXHj/hnC8eFtq4LcZkRpoucs/jpCBZMy4
	 4Pn0KQijbTQAPDmj16AOVrgZuwrhq2+fk8zrxXecQKKiwWc/EDJ4H2VpvjuiXf9JZbod4
	 rgRsPuvzgBxv6KMOnehJKndIgda1B5ktz+JCHxQq/e1BDvPIkvVNIeze7RtifvXqJDPDK
	 INqEB2UVNK/Dsr5EJ9jku3vuelvPyYizCsy9Sys08oRJwBssVpXbc1VjxrPCGrR9Idw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914390;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DS9RFPceSFfS0ImZMtexVx47AGwoymN92dPbqndTs9A=;
	b=IsWLodgLCMheFtiOcrbOG8aAroT46BA6UpsEcOtTWtC2WQp6cpvntm5jvVIfzKNFvQSk
	 zNPW7RdyqMrSdhQHDubZt9cRn9zh3fAsJ0UpM/cgoba2S5gD07rcVv+aVH5FT4XlP3HZf
	 Tr8H4heTcZI7nfuKoQfi62ITlo8Qz9o/4dZT9b5Nyhni6vMr8VSolJZiKnLydZyI88Uqo
	 bF7N/8Hgz4A4n9PljW5jUxX0DU2L+1ZIvbWujN301b0aOW/9C/tbvD93/swLZAa8IpQ9M
	 Y31JS5+VQ5l1guE3rxBDKs12n3e1MrxSWmmaap+91smeTOVll9HpdUGXfOiSUemVRvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C61D606A88A;
	Tue, 17 Nov 2026 11:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C61D606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c6321454e27811f19a56ed5b684f684d-20261117
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:f974caa5-7ffd-4ccd-b368-56320d0b7f48,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:160f99bb53ca6582fd09f56866da212c,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|850|865|898,TC:nil,Content:0|15|50
	|99,EDM:-3,IP:nil,URL:99|97|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c6321454e27811f19a56ed5b684f684d-20261117
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 488385902; Tue, 17 Nov 2026 19:19:37 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	leStoppe <lestoppe@gmail.com>,
	Craig Hesling <craig@hesling.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH v2] USB: serial: simple: narrow OWON match to avoid breaking VDS1022
Date: Tue, 17 Nov 2026 19:19:33 +0800
Message-Id: <20261117111933.3508470-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2026111722-freckled-baking-d277@gregkh>
References: <20260810091322.2201740-1-huangwei@kylinos.cn> <20261015025456.3927808-1-huangwei@kylinos.cn> <2026111606-penpal-reverse-14b7@gregkh> <2026111722-freckled-baking-d277@gregkh>
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

On Tue, Nov 17, 2026 at 08:24:39AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Nov 17, 2026 at 03:12:50PM +0800, Huang Wei wrote:
> > Hi Greg,
> >
> > Sorry about that - here's the context.
>
> Sorry about what? You did not quote anything here, as my bot says:
>
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>
> A: No.
> Q: Should I include quotations after my reply?
>
> http://daringfireball.net/2007/07/on_top
>
> thanks,
>
> greg k-h

You are right, and I apologize for the noise. My last two emails were
both badly formatted: a bare follow-up note with no quoted context,
and then a reply with the text on top and the reference material
below it, without quoting the message I was replying to. Let me fix
that here.

The context: the owon_device entry in
drivers/usb/serial/usb-serial-simple.c was added by commit 4cc01410e1c1
with a broad USB_DEVICE(0x5345, 0x1234) match for the OWON HDS200
series. OWON reuses that VID:PID across device families, so the entry
also claims the VDS1022 oscilloscope, which is driven from userspace
over libusb and stops working once a kernel driver binds its
interface.

The v2 below (sent Oct 15, reworked per Johan's review and carrying
the reporter's Tested-by) narrows the match to the HDS200 interface
tuple (class 5, subclass 0, protocol 0), which excludes the
reporter's VDS1022 (class 5, subclass 6, protocol 0x50).

The open problem surfaced during review: Craig Hesling found that
the VDS1022I variant reports the same (5, 0, 0) tuple as the HDS200
series, so the narrowed match would still claim that variant. On
Nov 3rd I laid out this data and asked Johan how he wants to
proceed - take the v2 as-is, revert to the broad match, or take
another approach. The thread has been waiting on that decision
since.

Full discussion:
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
