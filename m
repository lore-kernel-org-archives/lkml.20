Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6FE1DED5C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788717151; cv=pass; b=rrwfCANEim4upO36Oq8hfcktlle/hbA0iUnFDZeVUmZEBTn+iU2eTUPa0IeVxbni7yOXL0wv3DW8i3lHUvpRj29OaG9Zlldop42KranwgEbw8lgM/9wuDywszueY/JClQmgOW+RvZpvqYYLhVYjwU+0B9roy23U3PFwukwjyJZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788717151; c=relaxed/simple;
	bh=RG3h7zQGpL5wCerBSMebK3RewkxZiWHk8BZ7nIXYT1U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=NVJfLoyPKirbCgbkgd+hbhH5KALuDrSFbLScIy7qeBAQOjLlNLiR8Y2TqfvohEQsNpC6lHozWherlnf9j8zFh+/Zm5VrcK2GSi3UwGFRxuekvtZknRLtYz0Wdw3bs/q5Y/9HISFhlvUQzvw0dELBxtOUxZ+MdAux9tR1dY9Rh5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rIXwaXQu; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rIXwaXQu"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a7e0ff423dso6236739a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788717147; cv=none;
        d=google.com; s=arc-20260327;
        b=sJtr4D4mDY61jP13SZ2vjugmrIF4f8zryAkHWUKP1Aitj8lKJUMGNQRAdttU5QEyFn
         fE9yHZqPXePYROu/vc48/dOO+1NoH1eUhd0aDImydVniAO+tklx/Mm8VBuVasOsARY1t
         mUniLCLUPxZ/byqWPAL6EsRP/OQSlTBsMKY35Rtc7B72ckK33yHdvDUhVA0B9U9KyJ8o
         Z615Pu6xu8jyCmskSIJj2EkFoYcmB9CV1UZcgnlmaSItRGAE4a2JYeLdEjOdMQMsBHZf
         KEtXOLxfo5UgmtSG62VUwYii9qXCsc/N95ubY4O7fUWg9YbfxNnVIscgB+k+G0iMwGyA
         7WHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=HEcNXOX0xW+gGfYbi33gsLJqzZKqV1Gq6GN4QCX2VKY=;
        fh=Y8Trf6uAewZyQAxOazPpRCWU+pj6CbVeGRHuBSnOcrU=;
        b=V0gxHmOJ3uUhbZ0ZxI9j1Nke1B/h5O+LNXAmq++4C04rYVaDnsac1Bpt6SjdVQ/ESr
         pHemMJC2GV7aNyqEBX819Y3i6Fzt23xbnV8KkJcC1TEoCLNNFpJO9JE+VTUmm25uvMPa
         ZPXDG293Ybxr5kmP/smQ5qV635er2Gc0VTwFor+wb0mkL+FgXtunfwtJ0vSlJwznRRFM
         ScX8zPkGFC9Kv3QwoUN4OqdPxk91P3qva4DWce8dxFg7adz2EZqvjF21zs0OUoLMIw/7
         rRSej0ebU+S9nDu1EZA6vNo5EsnSvd8BQHHvlRx/g0UwsQPoDWPnK2Eo7UmAtvkQy7+x
         pPyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788717147; x=1789321947; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HEcNXOX0xW+gGfYbi33gsLJqzZKqV1Gq6GN4QCX2VKY=;
        b=rIXwaXQu+ItT5qhwy3aNfFgaHwBj6OuBI2az8ewL72JyUnqwq0xFt4Z/XscaF/4OD7
         XC1BfprlWNUzJg0kMU/6YTOBM0opKYhXCaougzF46iaSk/SmlmfZBZ/4N2UrmY7y8iXR
         GtCnbpJe7vAykq6l2+z8Nylaz8Xjx5mDUezGIFyFgXqIhvvf+Vv+XVpqCEdDfLewZktv
         P+0n4QVdSCnldp/dSJjGZz+YOnEp59tEE8ANxW/W01dsbjzw2Ynv4Q/lII99by+QKd1u
         gFFrShffFE8Uf8a90r7XWin7a4k8RzjK8bDoXh8tkqY5OIqAhRovhXiQnmGEkkDHT3cq
         DPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788717147; x=1789321947;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEcNXOX0xW+gGfYbi33gsLJqzZKqV1Gq6GN4QCX2VKY=;
        b=WmrfznY5CiQfiktf4MFA9Oa4L4di0qg2YaXWMZ9nu7Ygkv1HuIN40TUnSsRruZGP4z
         MhzwiOrfqP9r0roWKQqaIRS80jtcly0mIElrIO6lDf1PJtfzvcH9x7hU5xpcVlzIbkrt
         Hp/nBUQDwBP1JNlAaJs6iJITOttDGubsgluxZez36lgCy4NPEhLkrkfFqPos/b+BYpqW
         kc9jSjclEj3u5yKvZqS6OlpFzwLArDWaka00zbedPSuYkpcwWnT3yJmclRqaNpRgu2wo
         ZhAyFQ6LnEq27qJngipQCutDVN/YHyP0OhEvR7dn8WcyqN6ovt4kyq/WGubwfnS+R3hS
         QLcg==
X-Forwarded-Encrypted: i=1; AKwUvBy28sgIuc0My7QuaJNemtXQu9+Ay77jT35qoHLzL1Z9CjAxQKXHlvZgeQHW+eo1KUiYMrGe7achBuMyYS8=@vger.kernel.org
X-Gm-Message-State: AFuF++mfbDLCrOfpDwQcQA0ckY5gARTrxzgVtdlzX/8BYiSrDibjK9rl
	9v/Jgx9tOm2m0CFetpSqJnWIBEjfn33PkG6UOTaLQOOERYeSAaBiW0X4tK0ds/kq/DMOjf1UskI
	xvzOvYmYFv3/VK0MXDwaQV+80f9r5b9OBPEUCDe4=
X-Gm-Gg: AYBFou2RsYRJfTFq7ogv/okOV7iJQ36jUAW7XUOp/Wl0EoApWdLrp2gNvBcI4sAWihH
	g8Lm1jtYnPeT3jIsECc4w9Od3eQdTC+cWrHvx+pjUboJGoaHmV1a+AMtZFHDT8f7rYJw0/BI41Q
	pJZ9XXn3Y08BXedbfD5iEsVlAOSKZLJiqabD/cUVMgk6a2L6/SLBNrKVEI2yQGDf+JAGNsknYby
	0W3coNtyhzt/Nn97+Jya8xb3BSH6kk/Cuiwi1QX0jPhbaw1/YWxdOxIRJ81avNIkILzRA9KGUO8
	N8jnE53Xny5f5ThLaFOGnpLObok7uUxh4d6zDPfJukuqzSnUe+ySFfbxecwptjIAIKLLtPYR4ml
	6uMzv4DaX6959hEIr1IsIwQ==
X-Received: by 2002:a05:6402:a252:20b0:6a6:9368:73a0 with SMTP id
 4fb4d7f45d1cf-6a696a73aa1mr6699027a12.6.1788717147050; Sun, 06 Sep 2026
 10:52:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Sun, 6 Sep 2026 20:52:20 +0300
X-Gm-Features: AcwNN1Vtv1-XmyJNGHS1O9yKZMYSC8k4txAfqPlvEghpWq3TexGVbGKSdi8WaV0
Message-ID: <CAMnMt5bcEWOM5PRj96CpxDBq3OgY_iMHfpZn=wpNb9NeZuFMkQ@mail.gmail.com>
Subject: [PATCH] wifi: mt7601u: add vnd_reset parameter to fix probe failure
 on Tenda U2
To: kuba@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000278d0f065ad42a14"

--000000000000278d0f065ad42a14
Content-Type: text/plain; charset="UTF-8"

On certain MT7601U adapters, such as Tenda U2 and
other newer hardware revisions, driver initialization consistently fails
during probe with vendor request timeouts (-110 / -ETIMEDOUT):
  mt7601u 3-14:1.0: ASIC revision: 76010001 MAC revision: 76010500
  mt7601u 3-14:1.0: Firmware Version: 0.1.00 Build: 7640 Build time:
201302052146____
  mt7601u 3-14:1.0: Vendor request req:07 off:09a8 failed:-110
  mt7601u 3-14:1.0: Vendor request req:02 off:09a8 failed:-110
  mt7601u 3-14:1.0: Vendor request req:07 off:0734 failed:-110
  mt7601u 3-14:1.0: Vendor request req:42 off:0230 failed:-110
  mt7601u 3-14:1.0: probe with driver mt7601u failed with error -110

The failure occurs because mt7601u_load_firmware() unconditionally calls
mt7601u_vendor_reset() (MT_VEND_DEV_MODE_RESET) before uploading firmware
chunks. On these devices, issuing this vendor reset leaves the internal
MCU / FCE DMA engine in an unresponsive state after the first firmware
URB is submitted. As a result, reading MT_TX_CPU_FROM_FCE_CPU_DESC_IDX
(0x09a8) immediately times out.
Introduce a boolean module parameter 'vnd_reset' (default: false) to
make this vendor reset optional. When the vendor reset is skipped,
firmware upload succeeds and the wireless interface initializes normally.

Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1716301

More issues with Tenda U2 and Linux:
- https://www.opena.tv/viewtopic.php?t=63919
- https://askubuntu.com/questions/1418850/the-problem-with-wi-fi-u2
- https://bbs.archlinux.org/viewtopic.php?id=224859
- https://www.reddit.com/r/archlinux/comments/1d6dfv5/mt7601u_usb_wifi_not_working/

Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru>
---
 drivers/net/wireless/mediatek/mt7601u/mcu.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/mcu.c
b/drivers/net/wireless/mediatek/mt7601u/mcu.c
index bad6ca821..abf4767f1 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mcu.c
+++ b/drivers/net/wireless/mediatek/mt7601u/mcu.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/usb.h>
 #include <linux/skbuff.h>
+#include <linux/moduleparam.h>

 #include "mt7601u.h"
 #include "dma.h"
@@ -21,6 +22,14 @@
 #define MCU_FW_URB_SIZE (MCU_FW_URB_MAX_PAYLOAD + 12)
 #define MCU_RESP_URB_SIZE 1024

+static bool vnd_reset;
+module_param(vnd_reset, bool, 0644);
+MODULE_PARM_DESC(vnd_reset, "Perform vendor reset during firmware
upload (default: false)");
+
+static bool disable_usb_sg;
+module_param(disable_usb_sg, bool, 0644);
+MODULE_PARM_DESC(disable_usb_sg, "Unused compatibility parameter");
+
 static inline int firmware_running(struct mt7601u_dev *dev)
 {
  return mt7601u_rr(dev, MT_MCU_COM_REG0) == 1;
@@ -459,8 +468,10 @@ static int mt7601u_load_firmware(struct mt7601u_dev *dev)
  mt7601u_wr(dev, 0x94c, 0);
  mt7601u_wr(dev, MT_FCE_PSE_CTRL, 0);

- mt7601u_vendor_reset(dev);
- msleep(5);
+ if (vnd_reset) {
+ mt7601u_vendor_reset(dev);
+ msleep(5);
+ }

  mt7601u_wr(dev, 0xa44, 0);
  mt7601u_wr(dev, 0x230, 0x84210);
--

--000000000000278d0f065ad42a14
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-PATCH-wifi-mt7601u-add-vnd_reset-parameter-to-fix-pr.diff"
Content-Disposition: attachment; 
	filename="0001-PATCH-wifi-mt7601u-add-vnd_reset-parameter-to-fix-pr.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mtq3zl9y0>
X-Attachment-Id: f_mtq3zl9y0

RnJvbSBjMDNkNzNkMzdkZjQ0MGQwMDQ2ZDY4NDA2ZmRlMmFhMWY2MmZlMGQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIZXJtYW4gU2VtZW5vZmYgPEdlcm1hbkFpemVrQGFpemVrZ3Jv
dXAucnU+CkRhdGU6IFRodSwgMyBTZXAgMjAyNiAwNzoxNDozMiArMDMwMApTdWJqZWN0OiBbUEFU
Q0hdIHdpZmk6IG10NzYwMXU6IGFkZCB2bmRfcmVzZXQgcGFyYW1ldGVyIHRvIGZpeCBwcm9iZQog
ZmFpbHVyZSBvbiBUZW5kYSBVMgoKd2lmaTogbXQ3NjAxdTogYWRkIHZuZF9yZXNldCBwYXJhbWV0
ZXIgdG8gZml4IHByb2JlIGZhaWx1cmUgb24gVGVuZGEgVTIKCk9uIGNlcnRhaW4gTVQ3NjAxVSBh
ZGFwdGVycywgc3VjaCBhcyBUZW5kYSBVMiBhbmQKb3RoZXIgbmV3ZXIgaGFyZHdhcmUgcmV2aXNp
b25zLCBkcml2ZXIgaW5pdGlhbGl6YXRpb24gY29uc2lzdGVudGx5IGZhaWxzCmR1cmluZyBwcm9i
ZSB3aXRoIHZlbmRvciByZXF1ZXN0IHRpbWVvdXRzICgtMTEwIC8gLUVUSU1FRE9VVCk6CiAgbXQ3
NjAxdSAzLTE0OjEuMDogQVNJQyByZXZpc2lvbjogNzYwMTAwMDEgTUFDIHJldmlzaW9uOiA3NjAx
MDUwMAogIG10NzYwMXUgMy0xNDoxLjA6IEZpcm13YXJlIFZlcnNpb246IDAuMS4wMCBCdWlsZDog
NzY0MCBCdWlsZCB0aW1lOiAyMDEzMDIwNTIxNDZfX19fCiAgbXQ3NjAxdSAzLTE0OjEuMDogVmVu
ZG9yIHJlcXVlc3QgcmVxOjA3IG9mZjowOWE4IGZhaWxlZDotMTEwCiAgbXQ3NjAxdSAzLTE0OjEu
MDogVmVuZG9yIHJlcXVlc3QgcmVxOjAyIG9mZjowOWE4IGZhaWxlZDotMTEwCiAgbXQ3NjAxdSAz
LTE0OjEuMDogVmVuZG9yIHJlcXVlc3QgcmVxOjA3IG9mZjowNzM0IGZhaWxlZDotMTEwCiAgbXQ3
NjAxdSAzLTE0OjEuMDogVmVuZG9yIHJlcXVlc3QgcmVxOjQyIG9mZjowMjMwIGZhaWxlZDotMTEw
CiAgbXQ3NjAxdSAzLTE0OjEuMDogcHJvYmUgd2l0aCBkcml2ZXIgbXQ3NjAxdSBmYWlsZWQgd2l0
aCBlcnJvciAtMTEwCgpUaGUgZmFpbHVyZSBvY2N1cnMgYmVjYXVzZSBtdDc2MDF1X2xvYWRfZmly
bXdhcmUoKSB1bmNvbmRpdGlvbmFsbHkgY2FsbHMKbXQ3NjAxdV92ZW5kb3JfcmVzZXQoKSAoTVRf
VkVORF9ERVZfTU9ERV9SRVNFVCkgYmVmb3JlIHVwbG9hZGluZyBmaXJtd2FyZQpjaHVua3MuIE9u
IHRoZXNlIGRldmljZXMsIGlzc3VpbmcgdGhpcyB2ZW5kb3IgcmVzZXQgbGVhdmVzIHRoZSBpbnRl
cm5hbApNQ1UgLyBGQ0UgRE1BIGVuZ2luZSBpbiBhbiB1bnJlc3BvbnNpdmUgc3RhdGUgYWZ0ZXIg
dGhlIGZpcnN0IGZpcm13YXJlClVSQiBpcyBzdWJtaXR0ZWQuIEFzIGEgcmVzdWx0LCByZWFkaW5n
IE1UX1RYX0NQVV9GUk9NX0ZDRV9DUFVfREVTQ19JRFgKKDB4MDlhOCkgaW1tZWRpYXRlbHkgdGlt
ZXMgb3V0LgpJbnRyb2R1Y2UgYSBib29sZWFuIG1vZHVsZSBwYXJhbWV0ZXIgJ3ZuZF9yZXNldCcg
KGRlZmF1bHQ6IGZhbHNlKSB0bwptYWtlIHRoaXMgdmVuZG9yIHJlc2V0IG9wdGlvbmFsLiBXaGVu
IHRoZSB2ZW5kb3IgcmVzZXQgaXMgc2tpcHBlZCwKZmlybXdhcmUgdXBsb2FkIHN1Y2NlZWRzIGFu
ZCB0aGUgd2lyZWxlc3MgaW50ZXJmYWNlIGluaXRpYWxpemVzIG5vcm1hbGx5LgoKTGluazogaHR0
cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1Lytzb3VyY2UvbGludXgvK2J1Zy8xNzE2MzAx
CgpNb3JlIGlzc3VlcyB3aXRoIFRlbmRhIFUyIGFuZCBMaW51eDoKLSBodHRwczovL3d3dy5vcGVu
YS50di92aWV3dG9waWMucGhwP3Q9NjM5MTkKLSBodHRwczovL2Fza3VidW50dS5jb20vcXVlc3Rp
b25zLzE0MTg4NTAvdGhlLXByb2JsZW0td2l0aC13aS1maS11MgotIGh0dHBzOi8vYmJzLmFyY2hs
aW51eC5vcmcvdmlld3RvcGljLnBocD9pZD0yMjQ4NTkKLSBodHRwczovL3d3dy5yZWRkaXQuY29t
L3IvYXJjaGxpbnV4L2NvbW1lbnRzLzFkNmRmdjUvbXQ3NjAxdV91c2Jfd2lmaV9ub3Rfd29ya2lu
Zy8KClNpZ25lZC1vZmYtYnk6IEhlcm1hbiBTZW1lbm9mZiA8R2VybWFuQWl6ZWtAYWl6ZWtncm91
cC5ydT4KLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2MDF1L21jdS5jIHwg
MTUgKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9t
dDc2MDF1L21jdS5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3NjAxdS9tY3Uu
YwppbmRleCBiYWQ2Y2E4MjEuLmFiZjQ3NjdmMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvbWVkaWF0ZWsvbXQ3NjAxdS9tY3UuYworKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9t
ZWRpYXRlay9tdDc2MDF1L21jdS5jCkBAIC0xMCw2ICsxMCw3IEBACiAjaW5jbHVkZSA8bGludXgv
ZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC91c2IuaD4KICNpbmNsdWRlIDxsaW51eC9za2J1ZmYu
aD4KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGVwYXJhbS5oPgogCiAjaW5jbHVkZSAibXQ3NjAxdS5o
IgogI2luY2x1ZGUgImRtYS5oIgpAQCAtMjEsNiArMjIsMTQgQEAKICNkZWZpbmUgTUNVX0ZXX1VS
Ql9TSVpFCQkJKE1DVV9GV19VUkJfTUFYX1BBWUxPQUQgKyAxMikKICNkZWZpbmUgTUNVX1JFU1Bf
VVJCX1NJWkUJCTEwMjQKIAorc3RhdGljIGJvb2wgdm5kX3Jlc2V0OworbW9kdWxlX3BhcmFtKHZu
ZF9yZXNldCwgYm9vbCwgMDY0NCk7CitNT0RVTEVfUEFSTV9ERVNDKHZuZF9yZXNldCwgIlBlcmZv
cm0gdmVuZG9yIHJlc2V0IGR1cmluZyBmaXJtd2FyZSB1cGxvYWQgKGRlZmF1bHQ6IGZhbHNlKSIp
OworCitzdGF0aWMgYm9vbCBkaXNhYmxlX3VzYl9zZzsKK21vZHVsZV9wYXJhbShkaXNhYmxlX3Vz
Yl9zZywgYm9vbCwgMDY0NCk7CitNT0RVTEVfUEFSTV9ERVNDKGRpc2FibGVfdXNiX3NnLCAiVW51
c2VkIGNvbXBhdGliaWxpdHkgcGFyYW1ldGVyIik7CisKIHN0YXRpYyBpbmxpbmUgaW50IGZpcm13
YXJlX3J1bm5pbmcoc3RydWN0IG10NzYwMXVfZGV2ICpkZXYpCiB7CiAJcmV0dXJuIG10NzYwMXVf
cnIoZGV2LCBNVF9NQ1VfQ09NX1JFRzApID09IDE7CkBAIC00NTksOCArNDY4LDEwIEBAIHN0YXRp
YyBpbnQgbXQ3NjAxdV9sb2FkX2Zpcm13YXJlKHN0cnVjdCBtdDc2MDF1X2RldiAqZGV2KQogCW10
NzYwMXVfd3IoZGV2LCAweDk0YywgMCk7CiAJbXQ3NjAxdV93cihkZXYsIE1UX0ZDRV9QU0VfQ1RS
TCwgMCk7CiAKLQltdDc2MDF1X3ZlbmRvcl9yZXNldChkZXYpOwotCW1zbGVlcCg1KTsKKwlpZiAo
dm5kX3Jlc2V0KSB7CisJCW10NzYwMXVfdmVuZG9yX3Jlc2V0KGRldik7CisJCW1zbGVlcCg1KTsK
Kwl9CiAKIAltdDc2MDF1X3dyKGRldiwgMHhhNDQsIDApOwogCW10NzYwMXVfd3IoZGV2LCAweDIz
MCwgMHg4NDIxMCk7Ci0tIAoyLjU1LjAKCg==
--000000000000278d0f065ad42a14--
