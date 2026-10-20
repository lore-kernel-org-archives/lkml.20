Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479525;
	b=QWT4GIknsNDlZ2Ghh6quf3xhyWiStH9GZRi/YSy5UZDNR7cg9uMu1RcJNy4hiIYNZqbD
	 SEyg5faCFhfrPpnuvBIVY+l6W+/+2hYyrb3iYZiIFNOdkp4mkzdAitDfTm680bsykyfws
	 LpWUu6E0uUW92dz3lFxEKVV2+mvkfcfh/5dDvt9wjOrgfC3+MOC53gQx9PSphXKP9NtwK
	 sadQnAs1TX3+Zm5D4ZL87NxvhLST3tIw3r4M6XE3MOrvq2YvYnDo36Fc9NlvkzSo5qAtK
	 2LXdqH5/nNDd0ARpkuAQSZBdnJkFGbg1rbqlSG3//QDad4MlGouWp3SgmcqH3jWelFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479525;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3mVdC5kDTnipn3iY5p56LzjbkerlRhb7piG9XOIde2E=;
	b=W6f8RcQlyqw1GfiLq+GipKsmqNbuY1diIKd95+qGyzGwZ6hWTkR2c2/oAFONdHiph6tr
	 0aMfrIW5+uu0y90aoTHY0Sii8SmQ+Dp7mNuA77HbfMQNXSBNmCKnIXRhMv0tds0BbuKhZ
	 B9pLpMd5pDkrcsqN4xEKkRCpCeGMePbcwPpPC5ck1w8sgLVMv/6mQpzmrsrzraw43cO4c
	 Iv497hM4MTiQKYFoXdlQdHm8f+acP/S9LVF7G6O0X48Sht7RZmClG0lVJmFwIZr88YyqJ
	 aw/02Tush6nzIEIHP9oFjzDpuaK/BepydOUH3yKnZhbFB95DRI/4fyNmCVzz29RFV+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=E+sE6eXQ;
	arc=none smtp.remote-ip=203.205.221.240
Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE3560A2617
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE3560A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=E+sE6eXQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479522; bh=3mVdC5kDTnipn3iY5p56LzjbkerlRhb7piG9XOIde2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E+sE6eXQ8CAt2dgOBuJOTgZ5Xh2D0LJMBhTd+K5vkzSykpZeAremdqRKsKUTVzLsw
	 nPzIGvKFRrHKVlQ30+4XD3pBg4aRTJQBKOfR7pCu6271WcJQVbTa3m7I7TH3k9HqUd
	 kC4fHWfGCioBG/HAxbLtH4MMv7mkuWCqS2d5CbLM=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id EA693479; Tue, 20 Oct 2026 14:58:38 +0800
X-QQ-mid: xmsmtpt1792479518tgenrm9uw
Message-ID: <tencent_8D3DC257454EFAC7CC2D09B51012F1041809@qq.com>
X-QQ-XMAILINFO: Nj1udQkdSD4ebpQFGPY+GwW/l+p4GreUDp1r1LfNpYOxvspuMt122vIDnMdp5C
	 Zn70vkCjayStWa2Nid9kAg8/iFRDYmCmYpquytqzPfKgbt5W3DveTV3cfhch+mq11WRiF8xwLcZP
	 GmWivJrIECyOCv+5Sk+wsbmoDat1bzKi6AvcIq1sD5Q7tHyVgKLF2rQ+CPYGPavCzLU6xQj1rJkY
	 N/gtnu2JnmLOAgNIbC5oYVQqwMh5FXCdH1YLxgxSslEWf620xLMjptSYS8v0qDKeC/Df1vTw29XY
	 tiGbqM+l6JVyf6/l52EoczXfxYpmc3QDfz4HGcdGijPgntkcQvBFFET/54iFA0Y7bZyYIES6TtWD
	 Ir5PdBEcck04M1XZtkOxvRMOcWMc7MapPpHZYaGrRsIJvLadx+nS2kCJxv6ljstkI5JL81kGBxTJ
	 1AR0ugFzloTctKCpkG0N+99NUk9anD2J7O17UTnXnmq4uqt0iFnDR3qO/aWPm0+AfksKRBTSJXz8
	 BA91LOg1DQ9i4mvmxbTcGQNRHMkValRwxccA0950cZe/MdgNI+LHgumRywiyNwNzyi2yW0KeyWI3
	 vTEUJaZJlmznAIXj16kKAihFbu2TabzZFk7ZtvJCrv9XgRXyJeDnT2MRhCbJuqjwOmLER0wynvz8
	 5IjLV+rs/O4Sc6Ekt365mnmm+gl+62wgFeuFeS56Bh7mBqs+/N/fj6ywZGiWkjJPXMO4ofomEX2b
	 /kG5oZIZYdY3x7xqW+Cf1oVUt9Id38c4IYuKKF5YG/u14YYhBeYS3STE0Oo0oNa/t2BmzZLig/X3
	 62R8Fd7wir0F1I9abtiW7A5Kt8xNP4EK8dX6xFXFwpoTO6iMslt1n57qbga4pCMZL/pPmLbXJJ0u
	 UQR8dfnabZBjVBa2RcWLZWIYDuQtyInTryrZasqF/brphFHv84+RxTdC3u7zMS8bjz2rl+37z8e7
	 4f9rHhKjM4cO46hSMG7G3JDOCCWJXq+Axk27uai5PXGIayfR6T2w2TIi0Um2cr1bQdI+RwYCj4k+
	 a8j8sjJa7OGiBo9gdm89zEWnGnnz8ECYCBRnJahbIOlG63S6cBQPHcGzvvNFdrqVcmw43jf1uqbu
	 wZZ3jVhYeaMenR1eVU9Cb1JZDMXUzbWLWbN5Sa
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v5] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 14:58:38 +0800
X-OQ-MSGID: <20261020065838.1047-1-level_zero@qq.com>
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

