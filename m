Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585919;
	b=Ai7tH8AVLOEB1+tVE512htGXvQ/SD1/tcRZziBAmzYSFZf5ygr5oDDRf7UGwyKA6WvGC
	 MliCaFXZ1UxnTuc889ENCXnTbJj6HW9B287RWV6iGuku57UMsTo1vX+YwMcqUJaIocQWX
	 kYNtIMfkyciQfDgxO+ep19X/e/tn/DpiVZeDaPe++YCsjbN/tRSc8EDb8xNa1za/QRta7
	 thUypoLtr9O0fmOGSZKIrf78zegGw2j+OUl99tUEEVM2PB1XyY6hSQ1s5BiTC1d9pMrC5
	 kK8tAmZZ0NJ3B/UN9r5hLgbvQzDtS0HDWrMtZ7n1qwsAfihW8elm6zZucKTHpiHzVHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MnlYdPOPJlOuiqma0L/KGA43PVF31d9BgFd4VINQMpI=;
	b=u8ssxBeDnpgsZYlVQdIvvD377idShncn9xQ0HUUoUJdTQq8hbuOW9MEBwZfa/vA781tU
	 GIQLSBqpXpLenr8+c3GroK8le+j3+nSJw5Lwj9+nTlY7h1nhXJr74B5gp9GoNeuPYtt1i
	 rKtnZo/Bp4IfaPWjElYSXRqz87fSdo4EAsClZ2J91YpBxaiB34IKemxNf4k34sFREmbac
	 psJ3n9VyBB0X4jtJgeYVfCnLzmCEvMd/2vqoKJcKNzIuN+i3qaPx5xEgyqey9iFIVK6uA
	 ccGGxYOFAWgEyc7VcAJhDH37w61pZDyL/xiIHOPC69FyH36pWslsjNJPCWJGVx+/MXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nGb3wX49;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D07606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11D07606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nGb3wX49
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3ac144119e4so360550a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792585918; x=1793190718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnlYdPOPJlOuiqma0L/KGA43PVF31d9BgFd4VINQMpI=;
        b=nGb3wX493/8Cy5xh9Atv9Axf7FdB26I4tXoOvows+NmU+dGzu9kENcWlBHxs15w1GP
         mdcvYp8AEG55IbTZ5Su3d8WP8ZNv82n/4ckpyvmOsVLHo1K5XWHuSPH5NlMRCCZHLTC1
         AwhAhGqyJe4T9JdWlEB0XGiuEcl1WM9Fmqo8PdAXOj+iRrGF8Ti52eDst6wiCw1JuTmZ
         1b4WTVdujyqoMQTdQYM80J7ooVmOkE/gOq0bckjO00L4tHmA6mOPglYdczt3NREXSWbY
         WYyacpcewNI4/xJGRDOUhavr2nBe4qPA/rhpY74WpXAbssUGEqpfKn0GAOmq4nILfOHW
         Sd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585918; x=1793190718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MnlYdPOPJlOuiqma0L/KGA43PVF31d9BgFd4VINQMpI=;
        b=hengtj5T8cBCX9By4LsWmAHDy15Kxtv3+NrEqfxpjKc29uhR2xsrZICGUSmjHIJFy1
         wWECktc//qeL3aFOW+TXNiDLOKGWpiRV7hUgV1xK9KT/S8mzbA/Q3nIBa4UTArLTHoiK
         /G1C3mQ3oM7DHifbczVjjezN1OqPle179bC3JLpN+8gt/u2g3YMHRDdYOIPdqQHHgMgU
         xF0wU2EUUJKgMshMFLQj1IvzdB5ZIXst/yA017nUj0jSe4qUoWdvBThdUwr5SaxcnIN1
         H+81dWiV58viwuJst7x1W1bCm/Wa0WR13bbVt5TawLCu/GDllDsTVsL0Vy4qMLCfXank
         mscg==
X-Forwarded-Encrypted: i=1; AKwUvByrNvyxUnzJILVZ1Q+V4y5o/Q7MbVRdvR+uGrM+Z2/35rvv5X2wzl/Jokan+CGYRH7O7bUoeJNtFlxkgcE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0PeT1rX8slfjB5YafaJN6qo4QB1B+xOpPwNojBNxQEYfPFD5A
	PmIUdzEEU8ICUCpPgD1Jp0GQppj6fl+o1gdqZeSFJhR5PfFRtPS5z2u+
X-Gm-Gg: AYBFou0ugZ6UpV15ozxUwU20FVl6JsEMbvV49JDjvSqN34+Lpfy7Ks04zO/fl3z8p48
	uKgi+eCMoEoXPU/ACa+7yc1OQJ2Hh/2pdvkqGlQIoF+zt3Z2TF0njyq+Iygc85+lyyK9mAt81TU
	OtFo4cyoYaE22LRh8rWuastNiZecKq3Q9GYUtax0PLHC4p7zYYp7oPPqctecSUmjGn9hcJCl7cz
	D8er7iC/dXgHBA1+MBuQktp+voNUx6QujrDhUcNKjfiW42JPi911uCbcZtyIOwgOjiUvlrSL4WC
	sHSwoIbRHgPIkUKKNEmcLctAYiLIe5E+xP3joRaTo0BpnayiGFqysYD0rPHupULHp2BJZUF/27e
	pvjdeqyGg0rBkF2JUrPDO0xe0Oo8tk3Ny7/a9o77GJoj26kPQXVNWfUydzp9HW2eiujQbq6qOKN
	ckh2liGnedlvxyDoDX9tMbF22/Yg3PcAUFB6bVWysKyNFEW6HWU33ae/40ivPpln7Yg/N0CYYup
	BzWh1Y+jmPKBDKEPnIzCvuAG4S0GF8O6RlunHD0GjIygRlU5FYk8NWS/hwP7eIkQAJEmI2YhQ==
X-Received: by 2002:a17:90b:2646:b0:3a4:ca46:8d44 with SMTP id 98e67ed59e1d1-3ad86f1c073mr1747613a91.18.1792585918204;
        Wed, 21 Oct 2026 05:31:58 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813eb9casm4229523a91.15.2026.10.21.05.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:31:57 -0700 (PDT)
From: Shihuang Liu <shlomojune6@gmail.com>
To: linux-input@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-kernel@vger.kernel.org,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH v2 1/6] USB: add usb_make_subpath() for formatted device subpaths
Date: Wed, 21 Oct 2026 20:31:41 +0800
Message-ID: <20261021123146.17202-2-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021123146.17202-1-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
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

USB drivers often build device paths by calling usb_make_path() :and
then appending a subpath. Several callers use the deprecated strlcat()
API for this.

In preparation for removing the deprecated strlcat() API[1], add
usb_make_subpath() to format the USB device path.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 include/linux/usb.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 1da4ad1610bca..c90ccea0cdbf6 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -14,6 +14,7 @@
 #include <linux/errno.h>        /* for -ENODEV */
 #include <linux/delay.h>	/* for mdelay() */
 #include <linux/interrupt.h>	/* for in_interrupt() */
+#include <linux/stdarg.h>	/* for va_list */
 #include <linux/list.h>		/* for struct list_head */
 #include <linux/kref.h>		/* for struct kref */
 #include <linux/device.h>	/* for struct device */
@@ -987,6 +988,34 @@ static inline int usb_make_path(struct usb_device *dev, char *buf, size_t size)
 	return (actual >= (int)size) ? -1 : actual;
 }
 
+/**
+ * usb_make_subpath - returns a stable device path and formatted subpath
+ * @dev: the device whose path is being constructed
+ * @buf: where to put the string
+ * @size: how big is "buf"?
+ * @fmt: format string for the subpath, without the leading slash
+ * @...: arguments for @fmt
+ *
+ * Return: Length of the string (> 0) or negative if size was too small.
+ */
+static inline __printf(4, 5)
+int usb_make_subpath(struct usb_device *dev, char *buf, size_t size,
+		     const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+	int actual;
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+	actual = snprintf(buf, size, "usb-%s-%s/%pV", dev->bus->bus_name,
+			  dev->devpath, &vaf);
+	va_end(args);
+
+	return (actual >= (int)size) ? -1 : actual;
+}
+
 /*-------------------------------------------------------------------------*/
 
 #define USB_DEVICE_ID_MATCH_DEVICE \
-- 
2.43.0

