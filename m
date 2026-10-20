Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.58.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479640;
	b=yo5Ard3D8VmrIKIMuXF9Bz2kdODCCqpgM/7P7TaMVZGgBGPZeOf7y0AUBB4FgtqtH1bQ
	 BvyhSij7cp5KbDgevnfpLL5GNhvDnyBX6GFQhEM8Ygl1RrhyX8gwTrmSKwlIyPG9jUnna
	 6uv3NtUhMdVuuv+V87Ua6fwJhbcWKRVVb8ctmwzqv5fkKFK65f7nqFwH7qx5pApZiezWo
	 NIpM6JSg+7+mbnKr9Pgj+N/wwEErZWCN2iSgDn2OvBz83BVJRo1gcfeWfp8tsWk6NgZSq
	 X4aWU9Z3YtIdTZ/qhIMUQl0sVhmCQMsXubLd9O73S0p5jhHNbjLtWEk9DE5Gm9BTv3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479640;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T0vaJwLCtgV0MY4MRDE4pnnqus2yFX5T03cHszYKAKQ=;
	b=UVfuVyF/e8TDYbwpvfNrJqBqWZVhzVGB+xPVRK5ac5BYKzpbCQhEKHIEg7L6rpManwbp
	 DrHBBR6pJnLBiqynCmbJkcIBF2txQi57Sdhho6H9IuNsXfBLsW1e2zgEYGRxah4A4Eor6
	 T0PxxukcDu4/nR9ZNRmJ6LaIXHY1erfNfcIzMJJLuh+ST+b2Zz0svfFZnhsHmzch0irKo
	 tCTLuMC95ouHN8Wj86u+5MyTtHZWYYp1QH8sU/5Lj6EsvzykG3txhomL4hQNz2cRv4JNq
	 1/HRPS9QDrpK6p9FpsWfE7BhVB79ZdmLQBwWZ61UEmUK3FbTO5LYygdBXIbkkkTDg4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=cVos4ftw;
	arc=none smtp.remote-ip=162.62.58.211
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A33606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A33606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=cVos4ftw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479629; bh=T0vaJwLCtgV0MY4MRDE4pnnqus2yFX5T03cHszYKAKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cVos4ftwLU6nc1wyOQDSC62lhEEulmUTnCP1jxuDz3sLmdJjZKoaY9jtVQmHT89E4
	 iJpTBRdmww/n0dNwZSZ0WHfOjhGbz8y8sipblsqPelgBt6sk8/6s3f3QXK6rV1yv5m
	 AIKM0syDE3MB5IgK+fwk8pnGNMHuTbvMq5g5hNsc=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 1936EDE; Tue, 20 Oct 2026 15:00:25 +0800
X-QQ-mid: xmsmtpt1792479625t2zidv7uc
Message-ID: <tencent_E6332DE3447401308F8F55BF13BAB101CB07@qq.com>
X-QQ-XMAILINFO: MfnHk2ggLakh2eMd6AoWFYA5K3c/aEIdasVdCT6T6myVmJp6yxGQt0hPEU7wvC
	 OGuofr4YOIfCvy8vT5PgSk2QZJJlZK7SxmbDJBvLmS90W42I1UkNvaheLg0B+8CL35m+GGsg+nJ1
	 18ApNAkqZ5YGC8/5UQMf1jFZtrYTEcMPiu4wXcMijosChqGaPFNt18GOlmTRYgXH3I32bEERcXo4
	 QHEEytSvO02+Bf5ozm7hvmTkhvtLUdDL815Df4IryDEDbCOnf/cQCt5jCk11EgIVNRVxnX2IQBqf
	 IF3/mE1Sbm2BB/RIJa/s8Jw4OZN/GlA4p1WspR0zpG4zOLgbi10GmJo+vflS7jGvnlUhR95yiU15
	 tv04x0k8fpBppG+fIfgJY47eSBSgscpqI7ZSn3ZCP6CHyL1V1cMoAe3GuQ7R247sPu9NljRKIFnd
	 ZW59/XyYdKH6WM8EtE1fTKT7BimEoK+CrGXenq2R/g5x+Oti8Y3Yir2fA5TxrpWZWOIFZYlo3fvz
	 SPKU4cmCydOnBMmROGagu5i87ybDd4ViK+xf8PalJfpjhx08eS8YEJ4Gbgkd4olYFpaoV7nGhlKm
	 LlrRb4+05f1k8CUajChlYGzCSIdLwILINwYIPCNTql+4ehWFactr/kIevcDkPx15/ZPEYMJSsgXQ
	 cz9pv60m7XYs9oe24/SEmi3W8dyk/edNrcRYKUr2KJhf/EvFxSG1ieDvbOzrnZ+3CWF50aamFQuv
	 aNAMdwP8wQ4DKGOpUt7yAcSaypId8ETqh5TyGWYRmJ7P1h998TSSXlr5ETMi+s1sY7av2DTfOoRr
	 wh0CFnZlHhqhVDQQu51BQTuFom6T6dZoXUwD3drmJJLFu4U40uk/nfSiZulb5c4YIL7LCq1urvgw
	 hY7iCwG0KK7fpt3b7vVcGN1nfEZKLEFKY1OuztXaDBX9jcMGZoqVPfKF0AG9AqthHRog3uwyJCH9
	 fqGdWV/kVLQZssuln3lQDjiKALtjyujMa4APNSgggfCMss/Z1bmaDRJM6AX7XOFpdpphKdhNncTC
	 Tz2UbRhSUmFeLQIrIbul1Z456BaStggHqVk2ej01uxqQWYMGzOVp3eb0cfFbaCBmKytO3FoO5R6O
	 TEhROTLcRNpRUNcb4mICahkq44aemU8ZNJ9sGq1a35R5llhu74VJ/A+FI/iw==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v5] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 15:00:25 +0800
X-OQ-MSGID: <20261020070025.5001-1-level_zero@qq.com>
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
v5:
  - Use a real name in From: and Signed-off-by:.
  - Keep the existing error messages.  An earlier revision removed them,
    but the return value of an initcall is not printed by the initcall
    machinery, so that would have turned a reported failure into a
    silent one.
  - Regenerate with git format-patch so the diff carries the usual
    "diff --git" and "index" headers.

v4, v3, v2:
  - Format fixes only, no code change.

v1:
  - Initial version.
---
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

