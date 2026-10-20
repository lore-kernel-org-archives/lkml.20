Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477879;
	b=pXXAVZtg2HTG8xZ7lt7Es9ExWvPeLicPF00xA/QXATQVlIvGSJC7SwywlLV3K28gq+x7
	 K/2hFS8g/2zJFqChGc9qOSL+sp2lqK8/anWGUwmjL5k2rHwEYxauvDpc7ubEvBmg27Epe
	 cSrFAMk7kgL2c9TOZEJHIFMpSsheneGgOD7T/2KDsC+vIga7ZkkgFATVsus/zOB8Bc+Va
	 hyT43X8boT+JTL/dbTXamxYK6DEMHMC4pjT84qg1Y7/zPdWxqiBWf4WO9o98X7Pu2uuRv
	 sSwv2hqqlpMkRYVOUFklOOpWwzFC1u9KmmM3cT36Xr1TfFCyVIl9DjgcHwlopAjWS6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477879;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lbAnaXB8uyKpVwswuX0+taIrXKB1jE4zRciDEt271ZM=;
	b=o2cDccN5dJsFObgfY1kyP3sfpTzNbINzZQuVyzhEHlWFnN0cw98OZX7p3wKDWOiUnlpR
	 OctPg9ksbQo+SFKfUqq25Ur2B4cjHvRZ1AuP6W9U9Ebt2JZcJCX9OGCrb+2Xo190LSAgq
	 h+lBDpJHTAdi10lIbgyLTYw7bcx6LdDBLnwqhuUUJ4DLdA+zlDLdDn6l2GMuFPEd2Cgr+
	 WCmUJ3S/3RGVgqBYwm/bfR9n17HnlKK1PMHRFxz8QNGp/7JcTgWjb0cx96C/BnMVLtUwr
	 NjIbGk5CmW4BS0RwqyHQh6/L2f/ddNCu9fx5qf5OqSi2mj9wkStgHvjBk0DkP0VCyLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=vGD+D3KS;
	arc=none smtp.remote-ip=203.205.221.240
Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B1D606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B1D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=vGD+D3KS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792477870; bh=lbAnaXB8uyKpVwswuX0+taIrXKB1jE4zRciDEt271ZM=;
	h=From:To:Cc:Subject:Date;
	b=vGD+D3KS8nw4lzwhhh6ZHoPVIYNXdsxT/WnCriA/eDTQM2j+WH/Nns0CR+TXjTioW
	 oJEb1zQtRsah6Nxe0bSyxrIXRj55Mvrf4qyXB0+TJjmpF2gjrsGB8YyR1bHl7Jj94c
	 vlr6kjfiUVQR07svgMrIdwmV/+JJs2DBwYPQNi1w=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 7C680C10; Tue, 20 Oct 2026 14:31:06 +0800
X-QQ-mid: xmsmtpt1792477866tg0mmsr4d
Message-ID: <tencent_82888DC1594A685D25620A7078BCAEB69D0A@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+PoDgppOSogQtDfuBGjE9q3J6xVBue67UxYiJxW1lHyYrFs7EwH
	 lQamCaQW3q6rvEDZAzLr33NN/Laytrznw8vS9MmAEfUeendwMoxjo86OHmE/9JFTt5ZYxFhj+nm3
	 xWyKNK/oW+ejOeeepKgkTR0mCBJ6Et8o3kgy7MtibZCYx0V3Ww6ASN5iEuhnSBDDZEq9DCedHKwy
	 p3Op1VAMKmUA8p7mXnxYDLmGioqVSOgiqu6sheXO2Jh6vQKXUmLxpq7RCiEsuEEb+Y/beht4iNoC
	 vQeWl7+ksYM9lEPcTZFl0wpESCvhw/W6X0AKU8kmp/cyVYl35poN2peFvhHEB/Kh5iCfwMWFncN5
	 KVNe6DZl38DqwHyQR/LodoD8Q/1MKhkQo9ZL64kCh9eNzb679nacmrolGtfRrYxK28Hy38Xs9FXe
	 PwrFjcnnkRHjbX7xG578ZkHjs6rb/hF9nYYhBR7pzvTkyAUeWA6g91qhIz8nXq0TrL02b4yVKW6g
	 ZMtNWErdZvAlpUBbYROWQmrpqymkhShi1bjcUYo1Azmwmiw9wSbreaFNjDAtlQczHiPRNTSEGEQv
	 fT//rBkr1tzoY1ajR8H5qp/zPGkg4teMI2FWjGKiDwhxUxCRHqi8FmNCk8zzXtUhpMhB52Zgvf6A
	 5XxUDNcehCgCnEgT6DeY3n9zpguKWY3lwmyT3QMbrs+Vy8rY//sCdtzkDjx1eU9Z1ACqUA7xRB2T
	 7HHKhkQV3cOU3mYJo9GnGpZlPTcAOWnn7Y89xyepm6Q4oQOYXPTPJJjLL/4NEOf3+8L/+9wOBMkQ
	 +42Jjfq5tg6OVXDwuUOrSlwAGIpInbjOb1DLkdJpmI992qh2E/lH56FOTIL/aVs48u4eGjBT92R3
	 Q2ZHaSAm96QhbvTH5DyVZSBgEb35p0GlrVCR9x3uAUvpJXFq+D4edBUvc+R5iePpvftLvSn/emcV
	 XbXrsfLALLMUmOW8KfIaTajchOSDjPWlBJGWLO1wYjd8Bm5jjLr1fYuCujm+aYSQvR/psAZnwZ1Q
	 Ct4tPv6Pul2pCIoPikburdTk3CY21UWj+VBIvvEX4F2goLQFHOA+OokIFwtxCrCOhYK95cg/+a3d
	 ELiZjo
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 14:31:06 +0800
X-OQ-MSGID: <20261020063106.511-1-level_zero@qq.com>
X-Mailer: git-send-email 2.34.1
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
 drivers/base/bus.c | 26 +
 1 file changed, 5 insertions(+), 2 deletions(-)

--- a/drivers/base/bus.c	2026-10-20 14:29:46.248067968 +0800
+++ b/drivers/base/bus.c	2026-10-20 14:29:46.266034395 +0800
@@ -775,25 +775,28 @@
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

