Received: from outbound.st.icloud.com (st-2006c-snip4-1.eps.apple.com [57.103.76.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D693C456B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057597; cv=none; b=AJSzPt3/1ymrLnmWJjRIXoIXP59GLYVsWxRXMNr2Rb86na6yq4tttHQ2ZydwYaNAFi+R0135aJHyd0C08SJb0pgPrfsGZHQUiqD/J2UHE+bOyiuo8gs7T1UQgVHO+iqWBXXztKFnODNlAT1aoObn0De8VXeJOAahxG3pE8gBHx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057597; c=relaxed/simple;
	bh=fiqkf6675GNm7nhttV5qagPYP8x3fM05twA0PEOC/bU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q/v8/RqwvVJpXinI456SQICJ/f05+m1O59+f3p3VNjlCC48wHdcRS6KAGLozPhFa3/okD4l6tYn8h5QqtSJXeMlCuCgZptnE4FQ+mU83i3RTlVPpABKOMaD/8AlyWlPeqYv04PkSloz7jFo32hcWLzlZ1v4ficgOT01wUMSfryw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=Bd6p7TO+; arc=none smtp.client-ip=57.103.76.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="Bd6p7TO+"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-8 (Postfix) with ESMTPS id 3F98B18001FB;
	Thu, 10 Sep 2026 16:26:30 +0000 (UTC)
X-ICL-RepId: 01a08c24-6781-73a7-bb8e-f166ba5482f9
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFKHVsARQRGF0oCWhcOVk1THUEIWhIcE1gKQQxDK1sTVRdGCRkIXR0ZHldQXgheH0wcHQ5YBhICWkUGTV8OXh8EF0YZVQRHHl1WQBkZAlEcVg1XQ1QEX1BJDEFQbFoARxdIHV0ZWW9QXRwOBFQHXQVdVlACWktfGV1FD18HWQRAAEkDXAFZBEAAVgReAFgfQRQSVh9SBkteWhlBH1YfchlaFFwYU0VRH1RGExlOG1dNUBtfAkIP
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789057592; x=1791649592; bh=CedLZi6/DYp20wds8zhzkpptm7bu2Nic8V4Hjcg/RYs=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=Bd6p7TO+NiCj/R4jxkU966WagkwUUXEraYzb1kvSh4GARSS6x04NmQqaYiAGb9efNnynVzopcST0IGI2fJmrEs9vMuZ6F7MSulZ3ewNsHSdgDOVqwL73n2OTQD9GY+RLoyJNhYsOndbukQaiNhL//0sCbTR3+5WU/sH3JSWdNdwei1buPwuztuVamvBEWP22jPcTzl1I38oNohpQ294kEAnN+wWlrxRi7wTqG+wF9HECgIy40x140pc+fRRz7mx6LQKrWooGJGZrzWOWlGfz7aWOzsLjCErNpSfAWdyyvZPTjJjk4V9HON4i2ZQ0g5f8mX/+hn+Tzgc5Ce+N7vVrUA==
mail-alias-created-date: 1412714464000
Received: from bazzite (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-8 (Postfix) with ESMTPSA id E40DA180018F;
	Thu, 10 Sep 2026 16:26:29 +0000 (UTC)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Carrat?= <jeremy.carrat@icloud.com>
To: johan@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?J=C3=A9r=C3=A9my=20Carrat?= <jeremy.carrat@icloud.com>
Subject: [PATCH] USB: serial: cp210x: add Corsair AX1500i Power Supply
Date: Thu, 10 Sep 2026 18:26:09 +0200
Message-ID: <20260910162609.7373-1-jeremy.carrat@icloud.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: O2a3o71c_h5oiAOOnt4_Nz_RdN6L-JDZ
X-Authority-Info-Out: v=2.4 cv=auW/yCZV c=1 sm=1 tr=0 ts=6aa2da37
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=M51BFTxLslgA:10 a=x7bEGLp0ZPQA:10 a=SdTBC3XCTZEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=v3ZZPjhaAAAA:8
 a=u89meySVsq_JGV0VyUEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: O2a3o71c_h5oiAOOnt4_Nz_RdN6L-JDZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDIwMCBTYWx0ZWRfX1ymULZdhinB5
 175LMbjbB9AE53KacfjaRz+zPvnIxvZ3sDfUwAkXXn02YifE8GZYpduRcMjUMV/OUDoAHNldGUd
 wLx1ZSNTL3tkoJc4Dht5VcZ5hhTkF7oYP8zbUtqhs78llCAkOVs453TGKIP9+ISPu+YQ5J7uDim
 3q4rCtXzleN5OdVSzX3HT2EkmkhD2+JWqoABfo9vF5rObHvsr81t220VVuh+KE79NgUHCTB5yGr
 JiYbT1FOOXqvDxLdSQtlVf83c+JIRY007ZwInxbZUSM1tfopEmsA6D32luCBQf8NGPYacbIBSvH
 ayo8MGe8Qr1I0CBTbjRlRXDL9rVf7KO9DiiyGLUvM4TiGT5UoCdpnGGPZa3EtU=
X-JNJ: AAAAAAABjXDBPcJavW4/YXYMejBzyubKGgG1R/oQshXzBTwdfOMwKirr0vYJKvIQlteJ9U9FGLKsOQL40g5Xxw5ybbLhwcbEeh+XWAoPSV5zO63yLZ16PpXRGUsVfYYu4cmUDY2/rYZbhB5eH60xC1Q5wqgegIkoZG7J9AirijeIACH+l7Nn/HlaW4zSNZvifOVMGetbAumuEr7oYCdBWRIkbJLCTHFD3CiMsTq1d0zLoXMBvvK0GNwvzqM/PhqdGf8Cd8BBSC/dPWuVcAJTqdxm1SMD0Ad+G2f4JTDRx4/W6YKQrs+ut0wxpWO8zCbAVDS6T+RY/204xJPOCXBXrmuPz74eEnw/NBVvSbhPNJbO89gn0Do2pIlrN3ksjG7cDVSX41MvikBm4QNjcDWVd1Zu8JQ3gBuWlHWvB02AhF8NjghnKvCYlnU7VE6x3x8urexIRZOQIpmmJBJWGlmLRtHiKWqZlmUMGHGgBjJlEah12K+ELtZmyQioU8XrPNhDePQM32V6kHZ2BnfeRKbhZ7jzLb2eo+/wjHaALoHb6OAYyB+bduO5aJsIH8712YRpp7VDE6n/rENIr6qtlSMhJr97FZz+ZIoy1g9cKyruJQnbzshsFj07oJmBsxv87b+1F3YRXaBf4PXZ19pRKPX8VbEA+OoHBMSug5mJJRbvlAPsFmPm/1v/Uh9q60yihjzcerWa6Gs9GgpuZyqM1XU0W1+RosrjLCpHF+kHE83W30FKx+L6mDSKRihbhmD6xhNAVSTo5LMdkaqoaDBUwid4yYS9+nmH70PEZU5UDOLweXFAEUfx3iCTfz/ZWA8dxPw9ixi1OKa8SzH45BAuJN9UOmAJWF01E/shyx+peTpZNUAg5Yi7m92YARVAFtq4gYIC1wB8T4bPYxfXFIBgu86Hhq1lzF9ntVEKZnyY2DwhuAtr3/YHunsyOdMwCKb6TnxKkGgQ7QH1aOkJBz1XwTuKaF966TlEXI0
 L98P4iJDbAvob69owehPFeXZxwP7EzBUJPfyB5N7RnochvvWgvaMzYPgwL3OuaONbrOeY6IcsFjjAByq14fAOtSuqZS0Es5NyoBYq2QXxLYhCob6JEFi9xwXaj8zueJD1KwdiyBRu8ENdEe9mVmN8c74idxzlsnXnR8PYGBKRmU8CcHuWXEImwN+YDzsU/8SK+Xw/8OyiuNq5aH+Gf2Xpp62+2yDKDGHCkdB9NAMjtaTMPRD3sqMD3L0jc40ZL71huooHNV915fkaUixJWwejPphu20nGmqYQvGMuYQX5diXu
X-Apple-Category-Label: MTAxOTExMTg0MDokY2F0ZWdvcnkkX1BlcnNvbmFsLA==

The Corsair AX1500i power supply exposes its Corsair Link monitoring
interface on a mini-USB port through an on-board CP2103, using a
Corsair-specific product ID. Without the ID in the table no driver binds
and no tty is created.

Tested by forcing the driver association with

  echo 1b1c 1c02 > /sys/bus/usb-serial/drivers/cp210x/new_id

and then setting the serial port to 115200 8N1. Adding the ID is sufficient
to talk to the device: the tty reaches a USB-to-SMBus bridge sitting behind
the UART, which identifies itself as "USB to SMB Bridge (Firmware by Ross
Fosler)" version 0.9 and relays PMBus reads to the power supply controller.
Input voltage and current, input and output power, internal temperature and
fan speed were all read back on an AX1500i.

  [    7.806181] usb 3-14: New USB device found, idVendor=1b1c, idProduct=1c02, bcdDevice= 1.00
  [  698.526754] usbcore: registered new interface driver cp210x
  [  698.526767] usbserial: USB Serial support registered for cp210x
  [  698.527863] cp210x 3-14:1.0: cp210x converter detected
  [  698.529263] usb 3-14: cp210x converter now attached to ttyUSB0

The related AX1600i (1b1c:1c11, iProduct "USB API") is expected to be the
same kind of device but has not been tested here, so it is not added.

Cc: stable@vger.kernel.org
Signed-off-by: Jérémy Carrat <jeremy.carrat@icloud.com>
---
 drivers/usb/serial/cp210x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -223,6 +223,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x19CF, 0x3000) }, /* Parrot NMEA GPS Flight Recorder */
 	{ USB_DEVICE(0x1ADB, 0x0001) }, /* Schweitzer Engineering C662 Cable */
 	{ USB_DEVICE(0x1B1C, 0x1C00) }, /* Corsair USB Dongle */
+	{ USB_DEVICE(0x1B1C, 0x1C02) }, /* Corsair AX1500i Power Supply */
 	{ USB_DEVICE(0x1B93, 0x1013) }, /* Phoenix Contact UPS Device */
 	{ USB_DEVICE(0x1BA4, 0x0002) },	/* Silicon Labs 358x factory default */
 	{ USB_DEVICE(0x1BE3, 0x07A6) }, /* WAGO 750-923 USB Service Cable */
-- 
2.55.0
