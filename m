Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583710;
	b=kccj16q94YiRIrOcMgJCnJ1Ps3WBkkxOJZeioQYX+qA5txYuKFnhZEOAsX0829zb98AR
	 GFXtACM0U/2OJTH+fzTqMKc49GVoYJhMB5E9vRR0bkkw7aEltRQ3bRcs/gowxp2r2Sl89
	 zKSVfOs/ZaXldAEm2mlRa3he2Hv8hPm9jF7wyJl2UJ3dR1zAFYZ1zfrFefCHahzQpUgdr
	 5t6mQt91fTS0erPFLh0MrE2D+ZjM+9fI65q+BGzhY84Zl4oKivOQrWV9odgbL6z594vL2
	 J+OlXu3ukzzb2c4WPZuLNJJiURRq6f57AQN1A3+KiZ1YDP0yQwrkCTRs5RhfM3lheDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EW23E2mFb7Fm/luf0IceECOkzJ6tAxozkU+iJmUE+Xg=;
	b=1taQFfKu4+LlJkzmxH9M8O7B4B0eOPFqswDXwggjapN1VSGSpQwYFgxz1cMONVoQfGFT
	 NjbEvFsJi5mnKPngO4/IQ6Rc6JKK5rF0ud1Gip3mNZ9iajNyRXt2ah9VsZfNc7hXzThpb
	 /ZH5V5sbNkwDH4EVSYgT4KX1ptG8++u6jqxM+DP0gxtIEG7Pq3Rx3EQbIdtzzeYIDUYL8
	 JbXm53OGLZk1B7xDes5hRkX3Boe/FzYey7dIIE2DAndqym6dJbp0JF7l/DtObuqfW1M41
	 lit233w+YAUz/BfOvKbYRT5rEwFyXH9qc+J4nwdeqVJZYhxyi4xWWWpH9isLMS+tl/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bjlKIOGH;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7FF606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC7FF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bjlKIOGH
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53667180af3so6357711cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792583708; x=1793188508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EW23E2mFb7Fm/luf0IceECOkzJ6tAxozkU+iJmUE+Xg=;
        b=bjlKIOGHlz5hzoMozqCIuAyfQWlsh+Eo1BWemeBKwpcsF9hFlKit0J1kSvT8STWfi2
         sngXEvLTtHuetAIihH/5LDP+XO961AMNSe4NLBEVjeQUa3eEoHGtkevBhlXU3WWHZvFj
         WuJcUemeJ0vbAXGPS8hoXJZF3ICe1LIBM+DMxDTMBCg5RrcBsONiw/uwEqZ+0uJ6XRLy
         wUVf1Wv12S98YVa7m8Val/TVepJTkaQpk1KLmTrRk/iiGypVjw7cYEuun+MYVXckBN6y
         MnEWA1onKs0FkgI0C/+6QsIHYSx8rbnhp0LskPMNWk7yNUsojl5SO3irZQoJBGG6j79h
         2x6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583708; x=1793188508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EW23E2mFb7Fm/luf0IceECOkzJ6tAxozkU+iJmUE+Xg=;
        b=AFXKbYM3JGEk3UmWIae7WAInCiB3ZgqUTxep0n1lHQWgDt3/8DsNDAEjz9EuEbT2zr
         8185D6KBr5W62QB9PdxDNLuaPiDIBp9/kxJBm3mD6fIOHNU0qjnLs922RUa111vs94+k
         7nds2hlN/oJ1Vvha4gB8PgMQv494s4/FOINI2E/sdYq+srMCCRaARbriQwJAZUl8WvUM
         se59qE5JYdpnI4kMI4H0t2qCuxiG/FDo9oMmTlD/wws4je0AfhdEfwKBUZwFk64o25N0
         JOPfh/yqdCTdbB6aoJdGLA8iDk6qKuGCbG6xR9qUtrh8gZL1c/vFcBujXrDA/nEe2YPR
         JqlA==
X-Forwarded-Encrypted: i=1; AKwUvBwFZlfu5dFPa+Z9UOf4oZZIVmZLK9z3joLzaVdFNUq0kaslRKTyB9DS7SHGx0mQw31FCAdub7Hi+oFCIns=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhml+BHV53jN0OqJFJdQsddkQ2mAOJxIlMM83MRVSF6SZP1j9J
	7M4fSxUnB5Sfekx/hlPgwccflpHbuKNuuYwYNZpqMCeir/NxdZPjeL6q
X-Gm-Gg: AYBFou3oRVTEkUBnhHE9aMDVYRf3F82JCyk6SFcIQ+K8eWS+aMUv5mwTiKovZskJ1fj
	8ZUJ4P7V/N9nag/EdPhxRJBlnLgwRCeBnI6s7AeaWEmj7PHjFxiYMEcmSF5PaYV0IxQiUA4MGHI
	zFEEsRkIeoXHr5UqC8EFdD4WKRehbXUemevds0G4Z3twDcReMnBGrE/tPF7dE8N/XjkQDMPvJ7L
	Eb7dWeMTtzEk6NNGbPU1nf0l9ssy+DdpgCBkMe2fjzBNiR8gUMnQS/lhPRh92y05vr8CXOHaxDh
	i8xK2YNMJnJGQCVO0a2E20+YPhMqP0VoPh6ifKZYZvDJsp0Fbmif/DAJcSY4ux2PVfCh/U2sodI
	JQihoSZoYwa8JBeMf6wtTd6Lnk6iFBnmOGlSyW0EuQBS8qdkaC0utCssFWycHyfiHnLEHW4+8bA
	pQyctcjGmoUm2Yr2um9mZdNEEJHZIknOwmygTIe+S4Hqlv3b6g3HR1rfZXErFXsIGW89y/RXIjz
	6xelUzKA9ZetuGH6R0T5FSlLpHXow5rxTMYvJhcmuLsRuncsaDJKk+sJU36RluF9CHJ0TRxcXh1
	cldGC1KOWNP9h0Y=
X-Received: by 2002:a05:622a:1b03:b0:533:3e09:22bb with SMTP id d75a77b69052e-5369b82fee1mr25272531cf.42.1792583708345;
        Wed, 21 Oct 2026 04:55:08 -0700 (PDT)
Received: from virtlab805.virt.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698ae9290sm17472821cf.8.2026.10.21.04.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:55:08 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vincent Whitchurch <vincent.whitchurch@axis.com>,
	linux-kernel@vger.kernel.org,
	syzbot+eaaabe90f486cb6f31b2@syzkaller.appspotmail.com,
	syzbot+061cb4ee001379dbbfaf@syzkaller.appspotmail.com,
	Rahul Kumar <rk0006818@gmail.com>
Subject: [PATCH] mtd: phram: reject non-RAM ranges for module parameters
Date: Wed, 21 Oct 2026 07:53:48 -0400
Message-ID: <20261021115348.799538-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.52.0
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

Writing a bogus address such as "p0,0x8000000000000000,0x1000" to
/sys/module/phram/parameters/phram reaches ioremap() and triggers
WARNING in __ioremap_caller on x86. On arm64 a non-RAM address can
map and later Oops in memcpy when FTL scans the device.

For module-parameter devices, require the range to be System RAM
before mapping. Also default that path to memremap(), matching DT
without "no-map".

Fixes: 9401911f2d9f ("mtd: phram: Allow cached mappings")
Reported-by: syzbot+eaaabe90f486cb6f31b2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=eaaabe90f486cb6f31b2
Reported-by: syzbot+061cb4ee001379dbbfaf@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=061cb4ee001379dbbfaf
Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/mtd/devices/phram.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index b42cadcd76b1..9747e7e58e6f 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -19,6 +19,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/io.h>
+#include <linux/ioport.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -126,10 +127,16 @@ static int register_device(struct platform_device *pdev, const char *name,
 			   phys_addr_t start, size_t len, uint32_t erasesize)
 {
 	struct device_node *np = pdev ? pdev->dev.of_node : NULL;
-	bool cached = np ? !of_property_read_bool(np, "no-map") : false;
+	bool cached = np ? !of_property_read_bool(np, "no-map") : true;
 	struct phram_mtd_list *new;
 	int ret = -ENOMEM;
 
+	if (!np && region_intersects(start, len, IORESOURCE_SYSTEM_RAM,
+				     IORES_DESC_NONE) != REGION_INTERSECTS) {
+		pr_err("start/len is not System RAM\n");
+		return -EINVAL;
+	}
+
 	new = kzalloc_obj(*new);
 	if (!new)
 		goto out0;
@@ -138,7 +145,7 @@ static int register_device(struct platform_device *pdev, const char *name,
 
 	ret = phram_map(new, start, len);
 	if (ret) {
-		pr_err("ioremap failed\n");
+		pr_err("failed to map memory\n");
 		goto out1;
 	}
 
-- 
2.52.0

