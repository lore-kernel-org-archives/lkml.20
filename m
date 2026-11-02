Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650427;
	b=DHELR3XxziE/siyh5M/mLw2+eardkQqoSLla9e0+k8l3JK0L7emC2QjkjPnQO0fTcGM6
	 0gmmqUPQx1IOOtzjb6WBF6Yth+6H4jFMMtNQPRHC1gBWnPlob5csmOVFbO0SOfE5j1B9O
	 17/CZUyrNxxIK/SRBECdL2DSLAdUPG/UDGqIcgfnYXoH2yINY9cj+ppyvLTM3uKlcBAoE
	 FiURgdMg2eMiCFUxFniewLi/wpgU7hacPgNuaagWuTdFAzgdpjOzRNEt9+78u5Yu2mFpk
	 Iayzw96SvHQYSh8gOvdS46i3/U2IixXHsSMGSQeFEXi95765t03K4lSbD2Wr5rQ+HUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=Qc8PK8+/O10m6VtJJvpZberX9cTiU6oSN01rBzhKGIw=;
	b=fe0NcWqgzCMit4leh2N7j1BnRdDdXjA3cGyuwSwlCaj75tkaO6EACW14Qiv8m/aH/RcH
	 HwPADOXvtpOMhrMIIRQ8chgIxbzhXaFkRa9n+onw4euQxt0mir2SfE32CdrxFJGawXrSV
	 ZLkpyFTZa6Boqam2tEqdJCVohbvZMX3uXxKhvfp9n9ec4VUF3PWb6Sf2AwQh8ocM2Bd+R
	 CC9UN6VFRDBGaQmPI1XxY3q92msJ4urx3+cJWm33OdKA3910RHu+aFN3n/u7+s8yDIa3D
	 blnjM5UA+cEx5saH5GxH0Nhh2baPH0KGRf0yUyfz1IxTSRAC5UwZgHbQfaMLBHkbkfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxW3bpx+;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC519606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC519606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxW3bpx+
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67990a45e02so3073853d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793650426; x=1794255226; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qc8PK8+/O10m6VtJJvpZberX9cTiU6oSN01rBzhKGIw=;
        b=yxW3bpx+rF1L539z0piZy0xhtfIXhlEkuKT40jmhvy10wOGlqLgvwrcCHvB3JaXhGA
         icGslHDlPimA52iKv0a80fenRdnuuDspB9+ogzYACd/VEk6QTlgDC0ttfA2YCXW82uoR
         YNOuKP7FSeF8lEa/reEvB3geSSXzsgbCbg4hcJUvefVSajARHU8UK1dasvvNYGUVZfDC
         /AoiFEC6C5SIwUN2b3TWPlsrJ763OtJB/U0d2ECWuoWC/4wsaDOlcPh5bC9TeFRI4hnZ
         kJXmxbaxbv6yyY7JgUBlEBzrIZwMGGOMiFdRZJGgyXvknD0FzWGiFsbH5TtXw9BPCnT7
         zXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650426; x=1794255226;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qc8PK8+/O10m6VtJJvpZberX9cTiU6oSN01rBzhKGIw=;
        b=zD4hXuCbtKJ/eVXTEGD7DgCJydszG1MyRGphOeiCA1jDSsODjTPS/ENnLC1oqID0lK
         VjqQNJdNuQ/VbPUtO38zHs96gWupogyxDYRfX+cRQYwa16N+JWWZftQcvrsD9G0noN+N
         wGrzaCFergJ8R2v/kX3KekudkIVihAblvjgAB/PfbrHe3KDQU6LIcySGp/IKqYBJIwxC
         yKEYAxqZrrvMwGeX94Rnw3t51ESeuFxSS2kLjDvL86ZCiSCwV38txnIghWfHUxva02nc
         Hxczornk9yciwdEifugftqosMS3LSqKuVmWbVvMLv6Gscw3Om4Jmd2BIYGKkUVuHEZQ4
         dyFw==
X-Forwarded-Encrypted: i=1; AKwUvBzxyoU4+a7AoudMO21zhtX2yliXgqey+nAckhQ7u5v0ltQGvapgnm+BTZTNu/J4H95o06RKFErG3g3mg7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WeEnMl5LkZlp7rWv2EbR4R3cgmqvpuWvWWd2Xmx8eSNUiyCyC
	dhyxWmwHdblqVF8akdT0PNonInQKC7xBizVPiWE0EEfnkIQY/I4AcCvoFB7wUQ==
X-Gm-Gg: AYBFou2vMkrn54BQVUE6XJsQLePMPRG16FgcoD8UA2BTpIcoWNyV8RRWAH+n1M8zeIA
	NunulLmSZt06ynpxQrm8lGH+Ox34pTBbk5Tdyq1tgreLqMApcED8EsoAhTRMLKW5nge8h0g+8Hf
	qnLdWEtpZsw18E1bc+YQed7Dukm44MxWEHPnhpvhJS8qks2mHO67uHcfZeAvN/2cjY6pUB3Zj2h
	KR3v6uma4Iao15A509DfqNZsKVRvCg+IScTn0794lplk/nqxlun6jK/jT6UUy3YW0uDwk3jYlVW
	LNbqRHMM6eGjCCZsr+q83zlZl0lvkZNYG6ROcpgFf53TtXOnV/0mkGhIT9QszEJY1XELjm4MIXP
	zUM9MW4+8sprrVXU6WO0NvgGvfaq2hU+SwvN/HUyVsnfGuq2QyvFkLWOmOY7PZrGz8EvRa9qjAt
	BMYaf5ia8H0ihJ7vDdK4MTUiZAOxYztlezYoGoFAfgm+dEtfxrJnimyr4CAG8zCfync2OgpYr/8
	TZPLtO5cjtnyhzaR+uZXdXU5D0r3+rpsdXZ2p88KZlG/2ic9B/osGZMY5kZTCJp4ZjXRpN8PFg2
	J6ISplcWWsgaqSdW03SXrJc0ncI65Tl9UbWicABX45NIFfZw+vwdKhprhw==
X-Received: by 2002:a05:690e:43c6:b0:677:adc8:b1ea with SMTP id 956f58d0204a3-67ba5010450mr6242676d50.75.1793650425680;
        Mon, 02 Nov 2026 12:13:45 -0800 (PST)
Received: from daniel-HP-Stream-Laptop-14 ([172.56.75.200])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf2aa655sm5705646d50.10.2026.11.02.12.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:13:45 -0800 (PST)
Date: Mon, 2 Nov 2026 15:13:41 -0500
From: Daniel West <daniel.west.dev@gmail.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: media: radio: corrected comments style
Message-ID: <auju9S2V1Od_6Y_O@daniel-HP-Stream-Laptop-14>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Updated comments to align with the kernel
comment styling standards.

Signed-off-by: Daniel West <daniel.west.dev@gmail.com>
---
 drivers/media/radio/dsbr100.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/radio/dsbr100.c b/drivers/media/radio/dsbr100.c
index b8e0835a1998..87c37b4634b7 100644
--- a/drivers/media/radio/dsbr100.c
+++ b/drivers/media/radio/dsbr100.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* A driver for the D-Link DSB-R100 USB radio and Gemtek USB Radio 21.
+/*
+ * A driver for the D-Link DSB-R100 USB radio and Gemtek USB Radio 21.
  * The device plugs into both the USB and an analog audio input, so this thing
  * only deals with initialisation and frequency setting, the
  * audio data has to be handled by a sound driver.
@@ -19,7 +20,7 @@
  * Fully tested with the Keene USB FM Transmitter and the v4l2-compliance tool.
  *
  * Copyright (c) 2000 Markus Demleitner <msdemlei@cl.uni-heidelberg.de>
-*/
+ */
 
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -50,8 +51,10 @@ MODULE_VERSION("1.1.0");
 
 #define TB_LEN 16
 
-/* Frequency limits in MHz -- these are European values.  For Japanese
-devices, that would be 76 and 91.  */
+/*
+ * Frequency limits in MHz -- these are European values.  For Japanese
+ * devices, that would be 76 and 91.
+ */
 #define FREQ_MIN  87.5
 #define FREQ_MAX 108.0
 #define FREQ_MUL 16000
@@ -140,8 +143,10 @@ static int dsbr100_stop(struct dsbr100_device *radio)
 
 }
 
-/* return the device status.  This is, in effect, just whether it
-sees a stereo signal or not.  Pity. */
+/*
+ * return the device status.  This is, in effect, just whether it
+ * sees a stereo signal or not.  Pity.
+ */
 static void dsbr100_getstat(struct dsbr100_device *radio)
 {
 	int retval = usb_control_msg(radio->usbdev,
-- 
2.51.0

