Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479495;
	b=cjad1smX07aVg9ndcBRtB5hdmdfOHvQ7gSpgOI2LhKF839hyZbZ3UUHnvTEKWwT9psBC
	 jOBe6+6qKrTDtIiqwG9/O2ctJLbttIxH/s0B/jf9KwA5JTIuUydWEpJH5W/p8X/kogSLl
	 gBenTS6ubLIC1G5ML+MJNWUCqEvPnh2CT58g8Oo6zfLMljxNefBTEhXGdyhQIiKAJf/OK
	 49CtUhYaGyYKQiw/aBXou8QAtfDBiUYRYEKk+pCTqbY4BH2CYg1BC9Q+kgHvQnb/xA+5c
	 mWpHZ+I6BJ+RsyiR+Rw+LslXLDGXm6obWU8JmsvaIKfLK6xM8YY4+7iY2ZKd3mU/M/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479495;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3HQS1xnKh2LG5cRmwXfGtctlu2fUP4FZq4o4BZfgch8=;
	b=OV5PkttiIy+PTfdXMEi0rhLJel8im+B/Es2qThMAtRl7fxcYcbdavh3iapLbOm0q7zVh
	 /PJDYjpMjwOLMGrYVjgyomj7yCaZ4ZG6UA5Gq5PzeLUjnpPMs9qQDLieNWPLRiDlmYMmG
	 l+t5ZNtDqEcAoMG/VhD96qOjt6rGcdBptq1x+69Uh5IUwWcxLBwNFlgWxAbwe+rgGveBp
	 RI+X63NpNW9ktWJYGOBe5coU9rMOanlHy48Okw0uCV/w3Is50ftr8iLJdS091YLwtp2nV
	 uR9/AoBeQq6Mw14eeBf+CbvKXHKttg31YY9ivRBagRPwCqSaWmqUWhX0v1dxVAH4L5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=enX5oOZ9;
	arc=none smtp.remote-ip=203.205.221.155
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE260A2614
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65FE260A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=enX5oOZ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479492; bh=3HQS1xnKh2LG5cRmwXfGtctlu2fUP4FZq4o4BZfgch8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=enX5oOZ95CCWfNkIzafFVEGiaF2h2WVz25o17Pr2wv18xiFtaLS/Lv3Stew3HOwd8
	 ylFpd9DXSRjidZwI01jLs4qOictfg3Zrwn5+4AimGI2E6NYCyg9KLaAXGP1FCaZAjg
	 RmtUp/pSFV5K7cIR40xebFWVWjiDAXEOk4xdGPRg=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id E88A1022; Tue, 20 Oct 2026 14:58:08 +0800
X-QQ-mid: xmsmtpt1792479488tj0eu1lbz
Message-ID: <tencent_39A2408D47D26AF689C6989CE5945678A206@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLhJG/f3PCAILr/823hQSxZ6lA5p14inCLje9NrFsWCJYFmUganZ
	 3JrBsRvbT9dp0DhOMjd8DfdRHq1Biyq4ODbpkaoRQ7LILOqxUGwSb4WVslskVBS4ABjn2JL24zSL
	 QQjG+EU9V1x16K3G/70Qx0/qrmSZm6R8ZNVbT1Y8SY8qFBLRaGkNl5y43hAKgHrj41AxedmnXjKf
	 P+lk4r3AXfIW2Tm3SjucBx7Fq9o5IsGg83H0JQkxdGIlsrnH7qfA8cJRcZCj0gIoChjfUDR9bBXV
	 5U1wiVVoWm0X8Wb7JXRlgT2JqszX8mu7Ax3Swhz+WKfeYs+pRdaiKwOsCQ6LF40Ot3NbX47p71Ax
	 FE484XtEncn9U5WjfDrP6I50jp/ykDMd/Zp4LpZv2/HLDM4+6h0TA/x/fiapB7wphz8xlPS45qtP
	 otIvSW6iLvxvH6mkZtgF2XE1Z4AJodryfdxdg5TfrNgUWDJqjjDyF8Z2kbkk8E+xBMp3TaxxeUDh
	 bWhYxKpEVvvLIEQ24qYQzZiN34DnlQl2B7JMDt3MVL3WZJhw24ZlfdnoyXHBMjmdRIJ86gWK/QgY
	 uXAj3gtq7PG/I4rmAY2RBb5hcOgoiG6R/zdsz2uNdT1TYdPWqjTPmyW/fB/pvmIZwGGFFn7Nw3Yx
	 h2xm03wzx6sGZlZGCgUiKzYqKwKSFJEbJonIge3WnlxkOa3y3ww1nxJmZvji2LFbvVgPDohCOfcu
	 6bpbdxTGSIwiGOG4gpyZDVY8B/kqknmIiCJStDvdOq/Z2TElyUmm6u8r14C1XV7xli3qa4GyJ/48
	 nl0LBnC7UcHRNU2/SoliKfvj0zVFGa0tVeSOfXTUwzuy0KR0Z8c2v9At12gOOjt3yxQMB0GXy8L0
	 UMBr0lHVBit4I9FJiuK1OndSXlXn4NezTPthbODhU7pyViJF+XNw9doGHWTGzlwkR6vZl9wtwyFi
	 qmSHxQ8T260HC3MjkfGsFymAIfgJigtkc5R1QOmlPlzLs1MGoxq1DdBQt/s5LFlec14kB4BuJ1vJ
	 csbqRK4EmhcnmZZD33ESCAvCMSgn6RNop/GELOFLIR7QSQDiP6XrzzqH9x+DA709uge/S/VF3j6L
	 WRv40mRFaEKOTjNxfV/QMvAYvU5g==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v5] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 14:58:08 +0800
X-OQ-MSGID: <20261020065808.870-1-level_zero@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_454B62AD90C40381288FCAD5C893EC310507@qq.com>
References: <tencent_454B62AD90C40381288FCAD5C893EC310507@qq.com>
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
  - Use the real name in From: and Signed-off-by:.
  - Keep the error messages; an initcall return value is not
    printed, so dropping them would hide the failure.
  - Regenerate with git format-patch.
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

