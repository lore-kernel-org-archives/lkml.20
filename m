Received: from mail-pz2-f27.google.com (mail-pz2-f27.google.com [74.125.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F342379988
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790229917; cv=none; b=BDeKbedDE4H9NIgKkjfWA/aNgRp/TtsX1MKKauWcLIvJPXwcXtz/3L107NmeQ9k8AurAAWBJNcsh4OR3R28gPVlYHoM7smE3Qu3UfwbPmtUAnt6MpXoWV+Osdi8jWNcOmE4a8fQsoC1r8fsh6XIJ9lRNpaWPHkeN6dHiPFQ0RlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790229917; c=relaxed/simple;
	bh=S1ifroC1rn1KTqaVlaVfiVWIPiuDCmVpTK19OnYuAgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QYxxNNRWjZohsXAmbpdup+GcMqvV7mf/gPH1LUyHgNNrDVaPhDSI92g15TiytYFMgsJbAWl5ejDAkTWcCg35SQVa4E0Wo4ZWtdU2cOagVqT24NlmfX1Uqovdm9jIwrnUVnpTfW0jZNCpWZnR3owfKxdJgOm6G9EDwv7kkMmto9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgJN4QTU; arc=none smtp.client-ip=74.125.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgJN4QTU"
Received: by mail-pz2-f27.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so981339a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790229915; x=1790834715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PIMJm+VCyEzSCDqSRZoYpvVJ5wMLjOdy3cRjV6Xlh64=;
        b=OgJN4QTUC12UfYGIpCbR4ppevQ2hoBHn9xeCK0WBRATeEYu/sP4CdP3J5eZzbRRlha
         9MuhXnWX6jrtr2FFro4n+KTXjdibw+gWTlOCOj937/raWb8oswECUHXvW/PUmM0VtVlr
         HR76BlbAMu6gNhxbB037uJV5PAEIXwXVgBPrLgtySBjN7fxbixzQtFfTNIPM899cVrgy
         qqLvXITey1CyxFPCfd8RBo6CoGoqQpP9XAf2XF/dORbT79YB1odRT6rg3uiZTo9j9cKQ
         sGNlDBZOVEgrHBpdgCd1ZOirPznJdUDTBIOe866lc2pyPxS0JGarTKKHAmGBLc6ixAOR
         IATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790229915; x=1790834715;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PIMJm+VCyEzSCDqSRZoYpvVJ5wMLjOdy3cRjV6Xlh64=;
        b=DFUfNPFQHTNmooZZVbSU43f4seO8RnwLUT4htaifvZr7b40y83U3oR8M2uO3Vl8ZOb
         KI1Bzc8LbttEJ/nqB+abGrQlsxMLUep62Q/zLwebqZmLze9mKcH/qsxmI2ZxUUtlNCcB
         RSiMzZeXNxYILKxXJzmhg5F9verr9YxCy6KotMfEAGntmpSOwxntZBp+xI4hNtw6XB8h
         dgVy5NnbhLfdwVPgkRmpMmUPyiPscGn4/Fgy0dEJ+6NK+ZVFFiEYsYcM7gg7ntKtSOn+
         ViJb3JsRuThQdbc4QxUW1QRUGaO+wDT8eN4IO631Lb/L9nONCGzXxrIOBbU/GPcG4+1J
         pIaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTJzbka14SoRbN3hObsRhqqXCFzrfVCvYL8XxlyA1Pojr7aTsC822oVGhc9/WdB5zQTG7zruUiFacxkSY=@vger.kernel.org
X-Gm-Message-State: AFuF++m+88/B8RoFu0pkJNTHSL03wgkSwWb0MVCgPibXh7n+aVTdRXfV
	acl2tpsXVuSP0q3ykcszQY9NuQyLwJzKRD4XXfVNopQGBAD2jhjXsQ21
X-Gm-Gg: AYBFou1Dkbx+/CE6FdQytmrwPj8EC0FroQS+LALrwHSn5mcgG2UI4GjS5NKEIGp4L9d
	ax751cg6ZRq9OfzDf/TenWNIJUWxtINL8vNY9iZkkO+ORnrtrIvAj/5AfgSfhXw1+8FYc1ssrrF
	dggS6bmD+NnkjhR+M8zK1aDG4uf9/dSpwHogYP04Hhka/meYCtFzCik/Jy57CbdtW3J1vwS6JVR
	6/VpA2s2LZr7m5Jd5FE3h2G/TR6W0+WInxI29blhWBIWkBfuPNFF1M7Aavp+G2VEmkm8KZZmgA7
	uPNYIFKMTc0yIIvVhfXEh6xw4UBFBBhvz8vI2Ye6cwW1pWARwfAwyx2L5tkS9nKk6Kgac6qG4Ny
	4FGcjtMl+7Hh6R02s8hCpH2ZCIdcjwdAaLX9H5qvekxAyLrj1bsQBqnP+pPloiKFAWr2Rzb/cMD
	1LccW1m05CaLwwONn1cZQSgQW0qXNepCcrpakJej5Nkrc4WcrP5jyjwZoWMaWHKvara+4IHX0CT
	o7VG2ImcGljOFOiGq9dSyGPknuJbcDvOIHcnVX2DkslXaO6dMlOQCIFEqTeWvoc6b43Bzn0KTZF
	XnpGc6ugqQ==
X-Received: by 2002:a05:6a20:748f:b0:3dd:659e:5db2 with SMTP id adf61e73a8af0-3de0e73eab1mr1361741637.16.1790229915286;
        Wed, 23 Sep 2026 23:05:15 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f2228a2sm2056710a12.4.2026.09.23.23.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:05:14 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	ilpo.jarvinen@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v4] serial: core: reject baud_base values that overflow port->uartclk in uart_set_info()
Date: Thu, 24 Sep 2026 06:04:46 +0000
Message-ID: <20260924060511.2364717-4-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <90ddd895-856a-f7ae-162b-c80a6042d788@linux.intel.com>
References: <90ddd895-856a-f7ae-162b-c80a6042d788@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In uart_set_info(), new_info->baud_base is multiplied by 16 and stored in
uport->uartclk (an unsigned int):

  uport->uartclk = new_info->baud_base * 16;

While uart_set_info() checks if (uartclk == 0) and
if (new_info->baud_base < 9600), when new_info->baud_base exceeds
UINT_MAX / 16 with low bits set (for example, 0x10000001), multiplying
by 16 wraps around in 32-bit unsigned arithmetic to a small non-zero value
(16), bypassing both uartclk == 0 and new_info->baud_base < 9600 and
setting uport->uartclk = 16 (baud_base = 1, well below the required
minimum of 9600 * 16).

Reject new_info->baud_base > UINT_MAX / 16 before multiplying by 16 in
uart_set_info().

Tested in QEMU against Linux 7.3.0-rc3 by calling ioctl(fd, TIOCSSERIAL,
&ss) with ss.baud_base = 0x10000001 on /dev/ttyS1: on the unfixed kernel
TIOCSSERIAL succeeds (ret = 0) and wraps uport->uartclk to 16
(TIOCGSERIAL reports baud_base = 1), whereas with the fix applied
TIOCSSERIAL returns -EINVAL and preserves the existing uport->uartclk.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: 6eabce6608d6 ("serial: core: check uartclk for zero to avoid divide by zero")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v4:
- Check new_info->baud_base > UINT_MAX / 16 before multiplying by 16,
  as suggested by Ilpo Järvinen.

Changes in v3:
- Add missing #include <linux/limits.h> for UINT_MAX and move the
  new_info->baud_base > UINT_MAX / 16 check to the uartclk == 0 check, as
  suggested by Ilpo Järvinen.

 drivers/tty/serial/serial_core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 95774b0f1484..75bb1eaa27e7 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -16,6 +16,7 @@
 #include <linux/console.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/proc_fs.h>
@@ -931,8 +932,13 @@ static int uart_set_info(struct tty_struct *tty, struct tty_port *port,
 	old_custom_divisor = uport->custom_divisor;
 
 	if (!(uport->flags & UPF_FIXED_PORT)) {
-		unsigned int uartclk = new_info->baud_base * 16;
+		unsigned int uartclk;
+
 		/* check needs to be done here before other settings made */
+		if (new_info->baud_base > UINT_MAX / 16)
+			return -EINVAL;
+
+		uartclk = new_info->baud_base * 16;
 		if (uartclk == 0)
 			return -EINVAL;
 	}
-- 
2.55.0.1082.g2b9226bbc0-goog

