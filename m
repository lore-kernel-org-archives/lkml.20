Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792652987;
	b=fYWDIxqN23C1TgdpiIo5fLhYyv958g+1kpexRLTcAaet/RvoAoyfgwGrcfWJa2gKqNdU
	 VP+iH+sXpxARkisd33INplrN+WBYdWu9zgaBWuXOTphV92nS+pfXQuJLxm2vXKkdrmpkw
	 7hpqPcJljfFnVHvkfhY0f4aFKWe37VOdrYWom8k6buQCdjZRBEaeYITCDlGKLY711jl9g
	 V3ksgkZBfAcZspdA0+faOjzbKLj6O4+uf6YK3jFR6oy9AsdkOy8+BJbC9h+acJ6T8L/Bf
	 boW3Pw0seg9ffiWRCtbBaLhL84uImsIA3NBmYOZc6nYt3wdpGYrbpmCEl3QpirjdQIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792652987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MnlYdPOPJlOuiqma0L/KGA43PVF31d9BgFd4VINQMpI=;
	b=y/G8o6S8dhDIRev7q0SxNpZAmp8FjUVMs6JXqTfzpbhVUzetKFRwi3BqAlW1gdPKGRU1
	 vDI1vP9/aBPtl+h7uGa5K6qqCBBJlrITuoFBmJ2w73EVUhcPA9OxFmT8mUC7x2PCEHdGm
	 d6U8PmCV8bKo5iORKZWywIPuRoFhieJpya6uq7t2W9k1WA7JMy3eooXoGb0aueNdgwFel
	 Ol8aZVw9yyGzdOUna1TRDcXOLLmEe9pPfD9i036Bq/ZlxDpoDTEhsbagFlDSURa3b9Yx4
	 z0voV+0TwN3qGn2r9U1c7GAcIeInp/Jsi8FaqISiWz8ONjNItKDbe7fgUkWpGgdOv+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FBF1Lipi;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B62606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5B62606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FBF1Lipi
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd66d7e32baso142678a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792652986; x=1793257786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnlYdPOPJlOuiqma0L/KGA43PVF31d9BgFd4VINQMpI=;
        b=FBF1LipimvlOXg4hcf0YrlXHky4zAxyQTFinP8CkurFD/jn6M+yJwf6tRtFBg6yqXw
         GK+bdxY6WZg5zL7A063h1/5kly2IfPqDaL2wa92lxQjXdB0hI2TkmLmjwHlzMim2oVGw
         s/VIKcLAXnYeR6Cr1sEXqZaDgow1ed6sRGg8c5pMr4D5joTBodOPesrPvhW2PzWYmrcR
         FJnfNSYGzRY5DNosRdZBwXilRX6mMukUcyW0IvZVdzt68lcmxTCLHwhJhz0aE5NcMViE
         vRH943rWPi4qlUkRqEeLU2OwKnQ07L1exEd0iDtK12SGnoHDkQu1HayJO3iAeMZW1Qc8
         BPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792652986; x=1793257786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MnlYdPOPJlOuiqma0L/KGA43PVF31d9BgFd4VINQMpI=;
        b=iPJKCzELROH53AXztf8XRcBapQadtvcDM/h50MhTBwmum21KQdeEZdlmim1iNzr5i+
         abVYdR1St5hZZIbGz4JP0zn9rSkNOQ0Rqh898z4CblNkcD/yvU+xf7nyZkrCXJ04WP2j
         iCFGJWVnhfzS6BUcXZNJtG6BO1u9tSoUt8QDI/TVMzugNN4A3Mc/z3AyctkUwslZ4WlE
         vJvfI1ir14FPI/SrT/qrpxYHGZXXb78NSzmZPS18sXLGRFN9+z9BJ5hG5VKomqB1szle
         DSaijlfm/iWCXD2ivfsnvF4JMNe6QNItY1cXJ3w4ytxFS23Ybmg4AHC/Mt0OBzrPLCLI
         vgRA==
X-Forwarded-Encrypted: i=1; AKwUvBzCDNKsHg/1yzWyODBrBYqJWULqcZBENzPRLFHyWenZ5Eo5icGsztCmGMSIFrYLvRaN7M99+vsUHAUYTnI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLp5rceAgiP+yx4aFpEgncFmuDBhVRClVA6Q+SEe8RQXExSS8fy
	YdTNxHr7Qx5n6UpMLo0MYMbXvb8HFHuFKROszNzsF+28iAMJTuyBo8A3
X-Gm-Gg: AYBFou3fySMX/d0/VPntTxdQ9VxtGO9kiizCC0gx6u6alktTAs6jNeu1av/PmqGt+kB
	2Q67+3oYECSXY4D1bez35wvPXvZz+/oQ6rpGDo/if6ZAJF30EKcbPF1ZX3rYVd8hO3ZrK9ak66W
	rASpFvjGnj3sUXVsrczqIV8ZcWHwS48er9AYc7ACzvXIIpV6hEkEsA0apOcYXr6rK01XJ5xVgj0
	7MC8cIhfptaZGFSziZjc3GAUMcmZmpW0M531zQUbUMopoiElCcv+0MHbeiiSQxN9M2RtUBg/Say
	vHsP5J7q40zJ6ie47LdMRuPqMQKnZZFxM8sTcFIHvNcRwQ/qh809suPEZUmnvqgtOaCNvRxH3oV
	AFreDwk9EC6fkEDcHHRicULb+JhPsMELDJcNBLWsS4sYjUBU1NIp/g2COtxOXq5x3skActdGZaO
	b5nmlXQShajOoYJhwAPMv8C4YnzNtIFZ+qiUCdfpu3rlAaJlX3vaDEXWNEn04om9JI/QQzoBAiE
	HVVEgjAZMlz2bWrXzlyl5TM3dpp69+yK+m0axOwmlS6FFI4RBRSE3mvzOSXYi3JO9iWI68lO5U=
X-Received: by 2002:a05:6a00:a387:b0:882:94ab:20f6 with SMTP id d2e1a72fcca58-8a089c3eec3mr3115617b3a.1.1792652985830;
        Thu, 22 Oct 2026 00:09:45 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b49d1sm1706039b3a.12.2026.10.22.00.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:09:45 -0700 (PDT)
From: Shihuang Liu <shlomojune6@gmail.com>
To: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Alejandro Colomar <alx+linux-hardening@kernel.org>,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH v2 RESEND 1/6] USB: add usb_make_subpath() for formatted device subpaths
Date: Thu, 22 Oct 2026 15:09:24 +0800
Message-ID: <20261022070929.20820-2-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022070929.20820-1-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261022070929.20820-1-shlomojune6@gmail.com>
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
