Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480224;
	b=rAKHVkCKc+R5Zkwhqj6zBEXReHfzRkZiU90iB2b6AXR2SzmPe33CA7rsaf0JYBgL9ILD
	 X/yYpIiUtlsDjyqWrEGr01fiqr8BBc0JFFH2jw4IERU8ZLwgovx1FqdpXLD1/IBkh8EP1
	 zSLzUZKphvJSfkrf+N5L9tKN75KPHj3MZU/WfigGypSRShR3US7hJJrhEU4fDELwGG3Ee
	 xhTMLwCb3zeeZjllBXGTlywZpnotrsQ+IQ+F+8jbGC09/aNDQsrE8gAwLTXbYPz1pWDyQ
	 bbtgJu7V/8gIgCoS9laiXcTjoFVIyLC4jW2Hehh4B+CEusDFUjmYsXLI1q9VTTtm3UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480224;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XsZ5jUo7Ez3Qg1joQhIaLu4Yeboe9RpEDHXpd+79SHk=;
	b=ylT7kGadBzlD0DzTWZtsjeE95SF++u/P1kUgiDa+OLqaAIQGFcoZTNkteAuuZ3Yvog4d
	 IVXhZIMc21eEttWfio7jQYp7zrhvdC4W0LlnSqt3BgV0tBamLncFTyQa7eHvXZyY3Ima3
	 xneGvsvbPJ3Y+a3mn8E+dT1sX/jIZO0F6tFJaGcvEKjjotQppBfQfHIfasD0VSe2i31Y7
	 x5eoCbkJxgmCH/DkCB/4GSNL3CcPuN+Dg/foiLVz4cH9ePmXIT7mbcACVhICaz6nv7+1V
	 m+s+i72IlCAGXVJdQxq5119ZpB81aiTo7oAoipqFlbvM9vewlKZXoaGRxXTacakydBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=YfPK1yDd;
	arc=none smtp.remote-ip=203.205.221.231
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5ED606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E5ED606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=YfPK1yDd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792480214; bh=XsZ5jUo7Ez3Qg1joQhIaLu4Yeboe9RpEDHXpd+79SHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YfPK1yDdvT6C75zxpOEkuyqWhSXiAeLFzi+BG9H1CxPainIZigKoncjETf8vYU1nu
	 67DR2zmoCnboN2FQfEZfKEzk0YRfVNR3TOahXYsKbNapKlDOC6yOr7De2CU30CURA4
	 a+Y5fAy0tWfsPlFgkwozRckbCKQ1HsQWxz6g7eTk=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 289886FB; Tue, 20 Oct 2026 15:10:09 +0800
X-QQ-mid: xmsmtpt1792480209tsi54rwhc
Message-ID: <tencent_0AD505B63D2257674E40C6F22D5FB5B61209@qq.com>
X-QQ-XMAILINFO: OYTBn1rNHH7thROZc/MJn2cvFUpGKM9osJEcpTFjyikQ7sxY1PGHRKQ2m/3O6v
	 xjgtWvVszCtB+0cRdyESlWKgAde5wUw+nR08+bK8eAqFXewjlqTeXOJ58P9lkXhzWUkSYkew5XKE
	 ypDRufdEjsZ/W7vV8k42QVahwz7mSFgFeeL8DfAx6uR4Y1NprRWsp94BSsumQxHiLiHKMCoV+SjS
	 JtYgd17hiXbJXQkwvxVF0AgoCaQLRSIBLY8l3OFJn06CdRKuSigTJiUlPN9YuYqGpDgn1b/IAbI7
	 dVLuiVaOh88SucleK0PpOkqRPBb+GZSfNdyJxocJSb+MpHcTOl+f1JV/RfgTm1EktbhyFMSInKJZ
	 9EOHL4aDZD6g09gEIJpMTZPfGx4IrqsNsgQnPLcT3BRILlf6PS+Xvr9C/lQP3ZEhhzmQusMIyapQ
	 0vHb3HgwAfjY6oFrTluozyPnA1MkO5sKvrqhX8awmX7uLkS98H7z1DdytSjn5jN+/pEcaP1yCzks
	 V5I2KQUSOrKTV9X9WTQDrb2qbki6b4VDleFUQzBa2aVrxeBIS7zqw7IkwjjYjsMtoxH5xFEQzI7T
	 I9i4J9iv010aXOHqWxpeticiapt8Bux8INmK4N4+clpSxoVJxb3oh5WSjZ3PgkWZabLaa1LBzxQx
	 FW3oFIRyKOZ3yVRcE7LdLMzTadj4+RMQ/ZlP/3YaYSvltFjpfdptvOggeQSWxvsjiIN+IBdepBim
	 YADJMbtGy7oswWjZpJ2hvqVGhUC7j6Wflp25IUHlg20/VC0yHhh9oTNBXWFYQAcqpindgS6WHJ35
	 SGdSuEz0iF7DqQd31FwCOIptLyHz5d+wF3JfUyJnzac8XYEwjsLxnkrxuPC46+RKh5NjFyXgjB8U
	 7vFK+x2qdt0zFGyfn0FYxh71vEY0o3kmjCacpsbfOCPJqhJpLwstaQ1FpPH/LViY0oK2qtpIyS21
	 sCDyBN0yi8CR0/Sn4U1mClzzWP1K7NQa9s7qg/Jau2DzFIvN7HN1QGo/6jzl0+p77eHWY0vPm2OW
	 P2JXNW550YzjAWVgYQLeipZqQYYvbjSfGzyzAJZ0Kjf+Lccu2jEjFqgguw8iAnxkA0EEIkiGjdGU
	 ZF56HQviPc5lzLfBLS9L0hKkZuDQ==
X-QQ-XMRINFO: NIY0FsY06mWik60O6xSizP/2tkZG+oPoPQ==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v6] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 15:10:09 +0800
X-OQ-MSGID: <20261020071009.26718-1-level_zero@qq.com>
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
Changes in v6:
- No code change.  Fix the changelog section, which was missing from
  the v4 and v5 postings.

Changes in v4:
- Keep the three printk() calls.  Earlier versions dropped them on the
  grounds that the error now propagates, but the return value of an
  initcall is not printed by the initcall machinery, so removing them
  turned a reported failure into a silent one.

Changes in v3:
- Regenerate the diff with git format-patch so that it carries the
  expected "diff --git" and "index" lines.

Changes in v2:
- No code change.  Fix the author name so that the patch body and the
  mail envelope agree.
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

