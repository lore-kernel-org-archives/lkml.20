Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181158;
	b=RpR/Dfi7Iu7+VjCiOpNu7MQeFH0HH/kzdp75E83tz/GzacKqNcI2Z6oDpzef/1BSNt/q
	 a9y6Mu8GRfpMCPseN/D7QWgcYz9uhwyZAq5Z3ESw5AiJqHBpXFfh8hPlGgLZhFF8D/yNc
	 lmbfUPBV62KUS2GrFOl05oqgBfBjs+gINd/+CugOW0ok8wYEfjsr3IKV5wusfhjFn1JYo
	 7qikjV/+c+tQp5115cn/7olC/dcDwNAwJXP5IeYQzmIIgvrOVFQLFDN0K0HO8ibQmN/1Q
	 mvQkkoDOUJRE/+NV/Hh1/Dgz9cUXqdDFgqAARnmolw6KrmgBE1yP9xDMY88YzDKXqMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181158;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=07U+LmhabH8dFqhgYfSazQMSm8LvLOQc80NMswqVGGY=;
	b=n2Lc6rCineraIZVFJW0LYgr1vAgkgR+BQabUYn3tnxXPK0EaXq0h73R6orKNXryL/o+y
	 qWpBeEwjiVUkIuYYRJjt+y1Vs3KczV/KAgi2ertzUL8nVtsxkkQnb9mivDQ3gAbpOmFIp
	 0ag32MF6KlSQCDyW/33b0U8pKfGIOTlCm5XeB0mFCkbDlYrEkpqBOrWcjFvjgOrTL6JSv
	 PMAm6i9YN4MbHcEUBicA65YXEoF76VIYLCd/tvQypPPUcAJg76uobrLWQpLpUUgLZsng8
	 yXlZ0azQE3Ht1LPALsrm3sTqhJkXGqw8YfHl1lAB2+zTrFTxVvHo6uBBUmtNWArtDKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=A9xXuZ44;
	arc=none smtp.remote-ip=109.224.244.119
Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F68606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F68606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=A9xXuZ44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1794181155; x=1794440355;
	bh=07U+LmhabH8dFqhgYfSazQMSm8LvLOQc80NMswqVGGY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=A9xXuZ44cgm5rlMXgj5Z0JaFsOQKeRXCykzSY6Mj0n8rRA3pna4EKYwrGipYLABJg
	 m+UB5b+hupfd3lG48TNHRSdmlFNBLzd1CSCKlXkC8eoCQbDQUgUhVfW/uV2NGR5B1v
	 vKto4Mu/00nLv7MdaYydVc4rZ2bPEII6oywnM8ljWE7LxQfddDHVoqs5KmJwz8SMgT
	 peFTxkqxuTAgu70hG+H7quXFaskl7p0yy+ClyjM7C5JrV0g9asltTtxcKJ3Pwhkm14
	 yp75kGZ8LRp6camsGVCaab0Bob5hkNeatVAGwqtc8BD+Az6siDLTp7UoI7DV540UqK
	 qoDn5lUmpalPw==
Date: Sun, 08 Nov 2026 23:39:12 +0000
To: "Rafael J . Wysocki" <rafael@kernel.org>
From: Chad Aldreda <ca@modelmiser.com>
Cc: Len Brown <lenb@kernel.org>, Chen Yu <yu.c.chen@intel.com>, linux-acpi@vger.kernel.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ACPI: pfr_update: keep the state until the last file is closed
Message-ID: <20261108233900.4043941-4-ca@modelmiser.com>
In-Reply-To: <20261108233900.4043941-3-ca@modelmiser.com>
References: <20261108233900.4043941-3-ca@modelmiser.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: 4f04294de2988898d78ee3744635fcc7ef203b84
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

struct pfru_device is allocated with devm_kzalloc() and embeds the
miscdevice, so it is freed when the driver unbinds. A file that is open
on the node outlives the unbind and nothing holds a reference for it:
the next ioctl() or write() on that file uses freed memory. Unbinding
the driver needs root.

Allocate the structure with kzalloc() and reference count it: open()
takes a reference, under misc_mtx, which misc_deregister() also takes,
release() drops it, and a devm action drops the driver's own. The
structure also holds a reference on the parent device it uses. A call to
ioctl() or write() that starts after remove() returns fails with
-ENODEV; one already running finishes against state that is still valid.

The problem was found with a Coccinelle script that reports device nodes
in devm memory [1]. The fix, the reproducer and this message were
written with an AI assistant (Claude) and checked by hand. The bug was
reproduced and the fix tested in QEMU with KASAN, using an SSDT whose
_DSM stands in for the firmware: ioctl() and write() worked before an
unbind and, on a file held open across it, failed with -ENODEV. A call
racing with the unbind was not tested, nor was hardware with this
firmware interface.

Link: https://lore.kernel.org/r/20261106193517.3267013-2-ca@modelmiser.com =
[1]
Fixes: 0db89fa243e5 ("ACPI: Introduce Platform Firmware Runtime Update devi=
ce driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Chad Aldreda <ca@modelmiser.com>
---
The same Coccinelle script reports this driver for the misc_register()
of &pfru_dev->miscdev.

Reproduced in QEMU 10.2.4 (q35, KASAN, booted with kasan_multi_shot). An
SSDT adds a device with _HID INTC1080 and a _DSM that returns valid
packages, and memmap=3D reserves the communication buffer. A process opens
/dev/acpi_pfr_update0, uses QUERY_CAP, SET_REV, write() of a minimal
capsule and STAGE, and unbinds the driver through sysfs with the file
open. Repeating those calls gives, without this patch, 9 KASAN reports
in pfru_ioctl(), query_capability(), pfru_write() and start_update().

With it there are none. All the calls succeed before the unbind and
return -ENODEV after it, and the same sequence behaves the same after a
bind. Unbinding with the file already closed, or never opened, gives no
reports either. ACTIVATE and STAGE_ACTIVATE were not run; they share
start_update() with STAGE.

No lock is added. A call that passed the removed check can run during
the unbind, against state and a parent device that are still valid; the
driver has never serialized calls from different files. An rwsem would
make the unbind wait for a firmware update to finish.

kzalloc() rather than kzalloc_obj(), which first appears in v7.0, for
the stable trees.

 drivers/acpi/pfr_update.c | 51 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/pfr_update.c b/drivers/acpi/pfr_update.c
index 98ace679601b..b9e4c1065ad5 100644
--- a/drivers/acpi/pfr_update.c
+++ b/drivers/acpi/pfr_update.c
@@ -16,9 +16,11 @@
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/idr.h>
+#include <linux/kref.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/uaccess.h>
 #include <linux/uio.h>
@@ -82,6 +84,8 @@ struct pfru_device {
 =09u32 rev_id, index;
 =09struct device *parent_dev;
 =09struct miscdevice miscdev;
+=09struct kref kref;
+=09bool removed;
 };
=20
 static DEFINE_IDA(pfru_ida);
@@ -428,6 +432,9 @@ static long pfru_ioctl(struct file *file, unsigned int =
cmd, unsigned long arg)
 =09u32 rev;
 =09int ret;
=20
+=09if (READ_ONCE(pfru_dev->removed))
+=09=09return -ENODEV;
+
 =09switch (cmd) {
 =09case PFRU_IOC_QUERY_CAP:
 =09=09ret =3D query_capability(&cap_hdr, pfru_dev);
@@ -476,6 +483,9 @@ static ssize_t pfru_write(struct file *file, const char=
 __user *buf,
 =09char *buf_ptr;
 =09int ret;
=20
+=09if (READ_ONCE(pfru_dev->removed))
+=09=09return -ENODEV;
+
 =09ret =3D query_buffer(&buf_info, pfru_dev);
 =09if (ret)
 =09=09return ret;
@@ -518,8 +528,39 @@ static ssize_t pfru_write(struct file *file, const cha=
r __user *buf,
 =09return ret ?: len;
 }
=20
+static void pfru_free(struct kref *kref)
+{
+=09struct pfru_device *pfru_dev =3D
+=09=09container_of(kref, struct pfru_device, kref);
+
+=09put_device(pfru_dev->parent_dev);
+=09kfree(pfru_dev);
+}
+
+static void pfru_put(void *data)
+{
+=09struct pfru_device *pfru_dev =3D data;
+
+=09kref_put(&pfru_dev->kref, pfru_free);
+}
+
+/* misc_open() holds misc_mtx here, and misc_deregister() takes it. */
+static int pfru_open(struct inode *inode, struct file *file)
+{
+=09kref_get(&to_pfru_dev(file)->kref);
+=09return 0;
+}
+
+static int pfru_release(struct inode *inode, struct file *file)
+{
+=09pfru_put(to_pfru_dev(file));
+=09return 0;
+}
+
 static const struct file_operations acpi_pfru_fops =3D {
 =09.owner=09=09=3D THIS_MODULE,
+=09.open=09=09=3D pfru_open,
+=09.release=09=3D pfru_release,
 =09.write=09=09=3D pfru_write,
 =09.unlocked_ioctl =3D pfru_ioctl,
 =09.llseek=09=09=3D noop_llseek,
@@ -530,6 +571,7 @@ static void acpi_pfru_remove(struct platform_device *pd=
ev)
 =09struct pfru_device *pfru_dev =3D platform_get_drvdata(pdev);
=20
 =09misc_deregister(&pfru_dev->miscdev);
+=09WRITE_ONCE(pfru_dev->removed, true);
 }
=20
 static void pfru_put_idx(void *data)
@@ -554,10 +596,16 @@ static int acpi_pfru_probe(struct platform_device *pd=
ev)
 =09=09return -ENODEV;
 =09}
=20
-=09pfru_dev =3D devm_kzalloc(&pdev->dev, sizeof(*pfru_dev), GFP_KERNEL);
+=09pfru_dev =3D kzalloc(sizeof(*pfru_dev), GFP_KERNEL);
 =09if (!pfru_dev)
 =09=09return -ENOMEM;
=20
+=09kref_init(&pfru_dev->kref);
+=09pfru_dev->parent_dev =3D get_device(&pdev->dev);
+=09ret =3D devm_add_action_or_reset(&pdev->dev, pfru_put, pfru_dev);
+=09if (ret)
+=09=09return ret;
+
 =09ret =3D ida_alloc(&pfru_ida, GFP_KERNEL);
 =09if (ret < 0)
 =09=09return ret;
@@ -568,7 +616,6 @@ static int acpi_pfru_probe(struct platform_device *pdev=
)
 =09=09return ret;
=20
 =09pfru_dev->rev_id =3D PFRU_DEFAULT_REV_ID;
-=09pfru_dev->parent_dev =3D &pdev->dev;
=20
 =09pfru_dev->miscdev.minor =3D MISC_DYNAMIC_MINOR;
 =09pfru_dev->miscdev.name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
--=20
2.43.0


