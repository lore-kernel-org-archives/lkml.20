Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479514;
	b=lkoLBMz+aEmjD2Joab3vZpTy+RGmsIeGG+EadKF1EY4hf7O0LbYaktgl4UsbybjyoFw9
	 vDRaGmB2fZ+PC/ptWHo6/IP7zfYVOulzoOP7/HtHAh3gmWUZnzPkyR7kjhZphMNIg/Zsb
	 P7FzcOB1yBFklwQeP5AoZ0PW11gZ/NnsFCLBej5FpYPiY0EuIlN5j5YTAG5pwrrBVYp11
	 KYK7kx78yR6TNu9Ly1qqvZPU4PnO+W1sbGcS3S92OwVL9MoGk2SwXtgBb/mzVW0edgeQp
	 6o11+498NiKx80EHKRUNUaU2Di+dMyJL7XTKxwnBPYfqkhH5PhHaZ1004LBoAh1Xeeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479514;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3mVdC5kDTnipn3iY5p56LzjbkerlRhb7piG9XOIde2E=;
	b=0l0rhoDnru+o3mB0Ono1fkDKuqUskzDh+pSXDP7KVAQQohlrIJokzxduLut8b4mln+Yg
	 YyieW/f2mAqpvWeZSfCHoq43+7kaL/22T3yuuwtcIQqJmSjpxv0JPmCTV+HlttAXIQlLk
	 ICEaeTL1CjxG/ZXnh+uHMwv21tG/AWbGsnh343/kcTAQijc1LGx80j3U1PHUlP5Vucwwg
	 OS3I85oznIDjMzRNK5FKV2J26lFQSKIZtNUuykwvVnW79hdmDjfFq/ON7PLQ2QgB/NWlQ
	 rTEEuXCa1CnEVyMIqFlLqHJaOaZka0ZCyZrByap3aWxubTH5M4yuYwtWlovPuHilfuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ISU6U2zx;
	arc=none smtp.remote-ip=203.205.221.240
Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BD6606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BD6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ISU6U2zx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479511; bh=3mVdC5kDTnipn3iY5p56LzjbkerlRhb7piG9XOIde2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ISU6U2zxBV95KPb1IrMZyPRbc6ItiblFzqk0PknHhAbYGY2CBX4tyjOVS+fbWGP/J
	 zI4cAJ8bgMeAjBX32Wvf3WZhK8eUT03n1gpT2Byr8yCW95LfYH6rUj4OOCMksM1+al
	 quqzf7nOH1eSkr/Hvz3u/OQAqeRuRCnXBuk2bICg=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id E9B91261; Tue, 20 Oct 2026 14:58:27 +0800
X-QQ-mid: xmsmtpt1792479507t5c39dn9x
Message-ID: <tencent_0A2D81638FD4558013D83124CB53ADB84407@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JuE7UqBPrRy19WHZn4tR5lf31gT2ZwKuR3gNC2nDwWQ4zNsXSfMo
	 YXpDLmzdLvPqbtnIaxewLPg5VjX697FuIwEBCRU9AsIN6aytWtKZ13wGHTtcf/ieUaQvKhmeFy4l
	 UCce+1A13vKlixI4dDszb9dldkhz+kH7DjhjuS5Yiu3/4hk+lb6t0HnZ2fqUqui6NGkyXv5kel55
	 ci82wyeD61nLrR/NNC+v0UPEGwXtt9y3VT93V88tn6V2njm+cCD4lrO8/9VCcvFwRqUwvpAHG5Pj
	 s5WEqZT2qpgsB7oo2GJaUgXf/2poIsWBkxsJ1lc6QwGm/QdlUfzwrO1EwaJei92z+6eaSBIHJEND
	 4IEO4K8GGkHn2aSC0sGIg2uLAi5NPtVse+Zw2hja48FwmpBiaS0P4eqpzSIlOeo2QEVSBBI6Qfsa
	 Usugs3Urd4dRvAgFMrsqnmfEMIQ+yYm0xSC0InWDf2zYKuhYVPBJINlqhrtSGkwnzYbgX5/PRCXp
	 tmX1g8BEkRBAvD0KRh43mIKmxjb22Pivoc9xPgmmJNkKtqdZtHYeUSmkhODklrAZsSn/pFvAiTsj
	 +y69nEu8gStzSHIK6VoTvz1C6jplBYVVwqYQ66jvucQtFBdGWRycTIc5AElztuvuyTIp+u1utmMz
	 SgRiAHEuaNHMWMPqL6Pvz4bQCjJYrV4KMsHaz55SkpegcDma77n8iKzF0PHeiVtq9vBdt4+FDgtV
	 5nHWOUAkxy8TAtijKKSW/9ZTA7onJ+qFPWPTuss9Uo0uNOD54X6WULkQ77u8x/2oyafkiXvmfb+1
	 PSXQTR0FjbB0chxZSJpAf2JwKPBChWByQwWVfHFLSm4GZGkEZpotQNPn1hXFwzaozm/dXAdLABQz
	 DhyJu+k58VoZYPrmlbJDnLwJ6DwrFGGmmX5LqHtSPgpzkmjydbw6EG104BtYGLWvJXkfsvfnId3T
	 FZmP8BjVKRUhWw2S8oddEPR29oFrtgHdpmhmMobXESiaWR3aW6jzyF6CrvzCWrkMIqRzHbaAyezH
	 k3CNz8cbPS2zOcg+hnDCePo6RQP7S40ALbi+uBJvEEkbRiE9RYSprbuCPwyRICiQLmX/qijC/7Qo
	 vSBt0I6QqrKC/H8V+MNXp/tP/W23G/hLAGoTij
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v5] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 14:58:27 +0800
X-OQ-MSGID: <20261020065827.975-1-level_zero@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_4592542B31D15B00CDA368D5E884674CC805@qq.com>
References: <tencent_4592542B31D15B00CDA368D5E884674CC805@qq.com>
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

bus_add_driver() creates the driver's uevent attribute, adds the bus
driver groups and the bind/unbind files after the driver has already
been inserted into the bus and its module links have been made.  When
any of these fail it logs the failure and still returns 0.

The driver is then registered but incomplete: a driver without
bind/unbind cannot be bound or unbound from userspace, and a driver
without its uevent attribute can no longer emit uevent notifications.
driver_register() reports success, so neither the driver's init routine
nor its caller retries, and nothing else ever creates the missing
files.

The device side of the same driver model already treats the equivalent
steps this way: device_add() returns failures of the equivalent sysfs
operations to its caller, and device_del() undoes each one.
driver_register() already calls bus_remove_driver() when the group
registration after bus_add_driver() fails, and that branch is only
unreachable for failures inside bus_add_driver() because of the
unconditional successful return.

Propagate the errors so the existing unwind runs.  The new
out_remove_module label calls module_remove_driver() before falling
through to out_detach: bus_remove_driver() pairs every operation
bus_add_driver() performs in reverse order, but the symlinks
module_add_driver() creates live in the module's sysfs directory, not
under drv->p->kobj, so the kobject teardown does not remove them.
The attribute and the groups need no explicit removal because they live
under drv->p->kobj, and kobject_cleanup() drops the sysfs directory for
the caller.

The error messages are kept.  The return value of an initcall is not
printed by the initcall machinery, so dropping them would turn a
reported failure into a silent one.

These failures are not expected on a working system: driver_ktype
always supplies sysfs_ops, so -EINVAL is unreachable, no in-tree bus
defines a drv_group that collides with the built-in uevent, bind or
unbind attributes, and -ENOMEM needs memory pressure.  The point is not
a user-visible bug but keeping the driver model consistent with the
device side and leaving the failure reported.

Signed-off-by: Yemingxuan <level_zero@qq.com>
---
 Changes since v4:

 - Keep the error messages.  The return value of an initcall
   is not printed by the initcall machinery, so dropping them
   would turn a reported failure into a silent one.

 drivers/base/bus.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index d17bd91..a63e55c 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -775,25 +775,28 @@ int bus_add_driver(struct device_driver *drv)
 	if (error) {
 		printk(KERN_ERR "%s: uevent attr (%s) failed\n",
 			__func__, drv->name);
+		goto out_remove_module;
 	}
 	error = driver_add_groups(drv, sp->bus->drv_groups);
 	if (error) {
-		/* How the hell do we get out of this pickle? Give up */
 		printk(KERN_ERR "%s: driver_add_groups(%s) failed\n",
 			__func__, drv->name);
+		goto out_remove_module;
 	}
 
 	if (!drv->suppress_bind_attrs) {
 		error = add_bind_files(drv);
 		if (error) {
-			/* Ditto */
 			printk(KERN_ERR "%s: add_bind_files(%s) failed\n",
 				__func__, drv->name);
+			goto out_remove_module;
 		}
 	}
 
 	return 0;
 
+out_remove_module:
+	module_remove_driver(drv);
 out_detach:
 	driver_detach(drv);
 out_del_list:
-- 
2.34.1

