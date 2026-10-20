Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479455;
	b=yuh49H7eDUEBt3Nh6nhzKUJEe1kSKUgEXleTf/JFbWCa8c3JF9J2o+IRWUi71YDm7nje
	 rDq1qNH+3Xd92tkur0EKnZRGMQ2Jl6oEVGM0Op+Sf0aTgIZu9CpJ5VD6vij0ziG0SqsSY
	 o0L0R17BWuILvdXxm1jqZ9nj0WHHXASHHV7rjCOJm5r3Jsge3sZBEnGL7nH7gVU1RGaB7
	 QRZNW7y//V2kHUAQglgTtL3jBGfudddg9jG+O22HitAbw8UxhIcSEmFxchO9WJDlSj7tX
	 KY1pRXnHvdBA4OENuBkenlBDtZRAMdbMaoIZkRF59lt5YbITbA2tGCIGgoQKYC011/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479455;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7EB7W8kljD01QG38Fli0kE9u+xfyPuR4kBNAP98VcLg=;
	b=bk76wa+R61jrL/VwDKQOkloWK9TWfmxGwItuqGzO5KxGdSVbNw18nzleiY+6z/tClrb5
	 Eo7Xv0UMBjFkZ9NQM+lxI2trPU6C+S7IR2gJNN/5dRbbVRfRFZ4PNsRFNC7I4RQ220PKf
	 1VbuMiVyBeu7+mFInsmlbkbSfmIvhYxiRdFr8u48taoPl4BP4UgqlNNLzhG1JL8/ScoVK
	 5r5QDXTnIUrmMqtdJga0sSnQqasIAaLltH81tVShg9lCoiO2QNcyBW4hZkKqztG4mc5Jq
	 sWLJDvgvRwz1iFGmoJDyFAcuQstBvrTWBfiMmLo9aUiK93jC0JI3L64e/BZgJcw6mbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=icXIlqYl;
	arc=none smtp.remote-ip=203.205.221.173
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043F3606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 043F3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=icXIlqYl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479444; bh=7EB7W8kljD01QG38Fli0kE9u+xfyPuR4kBNAP98VcLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=icXIlqYlL1aDoW4C9Xy9fo85Tl0x4LR+G3BE0Dw16onkBiqonds8AP8GbkgyTTu/y
	 erSNbEf2ASEeqPZqQKFACQgHIOqBRkjhtnrwydIkls7S9xl6br4SqXC2pJ6Y5R7Xj1
	 5CIYw3striS2PlvsCHJsUxCWF3Da3qu2pwzGVPLY=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id E5434827; Tue, 20 Oct 2026 14:57:20 +0800
X-QQ-mid: xmsmtpt1792479440tq7yqaz3n
Message-ID: <tencent_DD23AB2D2796638B96535ABD89BB02C81E08@qq.com>
X-QQ-XMAILINFO: NkHKfw09D6j8W+Cc7kZPDkUgzcNL43rR8bMgnUBnaI5XC4IB3czTp4n1iKGTun
	 P4charjsVgHYkPQs5uIwdBF49CZgfjUu7CAWDCY1SApyyIpuL7I04yQM27Tpbfh6aoQ0NZCYqyIc
	 A7pSW/gS6QdZ3Zx3zHXa+suXalohtgtf1U7sgJhM6/WNNhW5cCG18X8c3QqGRajyVaEORzp0mCAG
	 SaiegKUrHVD9QCJzQ5tShmPvqala4f/mBuvhWdMsCQ2ETTxA3SRdW/2ztzXqvbOCVROnEfSIW6wY
	 mkle3B5arsNeG5EzUCdO4CrqNgC3BVKSeTZzOv4NP1H04Qf3KbXtGYNvqYG1hQHjKOKe2amdpjyo
	 PDTXwePej9rBsNMu+b/IU5n68nf7ZosFWZJ2uTt2d6vZy1IrE3K7an9DFQ4of4u72Bxx3W2W/KjM
	 F0IHnAt8yCjWY1/Snyu25PSj1ea65iWOKOrIQ7yVq+E9xnaFjSFUDN0OOAnDx/bSTYeiSxutj6Di
	 ASJpz8D+kKBkQq9iNLexWlJUQnpN8f/yimZNoJ+cy7J8ZdbPuMK1AJ+qvxffer77mvxYRGXQbKu5
	 ucEjnsbAk7SZzPt05aAd/iEFXk+ELFkrtyWNu0O7mPVr6ghPxsd8HG85Xyl/OD84whg7I10haide
	 uS//ROXeP+5TbIMKD1TeEfG6zOFwZRJ91mR5snlVjcsrjI0+qWVI4NDuYBb/R13xJgB9avecUtV6
	 KuRXDv3TtLsVVhkv0VsorUcJWL+EektO2iUL0np3Dxd79hzZ6JS/auAWoqRiNWBg9B1h0kkMmEGQ
	 DKwCf9jPpFbHKspjzW5sAXkqSf+3hGawf2oYlhSFU//fQ3puVLVzfa3jyRdYKtwdqjf9KSYmHknb
	 g8ruorhc7+8KgnuRGPmLx4j6xdYYvz8hX3EpMO+21mVxrH5Mx0CFio+lKr1MAM/FBwp+hdt8sotl
	 7US7rA4th+3f4Yv7KMBGW3ou1U5XU0y1THnuNL/ZeEUdTBlAMQulcZDRW9rAQuXFbfPCyNnftyAr
	 qGD42E4Y+a83tQqabubaic/q4judvDUwm3vOGoyBYheq+iRxqRpInTT9GpSaPXvQQhOy4gKw==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v5] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 14:57:20 +0800
X-OQ-MSGID: <20261020065720.507-1-level_zero@qq.com>
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
Changes in v5:
- Add this changelog, as the patch-bot requested.

Changes in v4:
- Use the real name in From: and Signed-off-by:, so the
  mail headers and the patch body agree.

Changes in v2:
- Keep the three error messages.  The return value of an
  initcall is not printed, so dropping them would have made
  the failure silent.

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

