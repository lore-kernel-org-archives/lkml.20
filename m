Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479739;
	b=Ue8DJz+WoRv46lkRWTng3NF3M8K5PW1IqveiGjavxBuBXWhdbyHqygF23O/n8uivxTEG
	 TWPJvAbx/949S0kqRYj4e8o/sDKi7t4yhXiR3Zlnx9nuiDQBfU8+9lWmHvQPZO4nSIh6a
	 wVyiauBf2or/sVge3fKua1AiJJLsPl6/EsorK+jF499ta2DiEYU2P9TahaoIUqjLicVIs
	 heta0Ux+A1RJaS0TUCM1r6zxEmepCVeMYGr5ZtUlpZjlJaP8YUmP4IU7BB73g/uSfbP5W
	 vHPlue6w0ruukMPA0flJ1y2rbPUSgxxg3uLvKoFl+zNAGSQTd3Bx4E6CEM+IHGMVSWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479739;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EwYG0Qqs4R24C4Z13i5actK0Jsbdi4OllWPNuy9tp3Q=;
	b=yp0vxXmV+iDElWrkCF6+OYCiGH35rMPVYzLABesQubtfOZ9bx3b/AIrzsK8g/kwt8Xm2
	 wpsJ1m9m9rYHf0XyjhN9EnuWEw1ypDkLbn+5fEjDUXv/KPg0vSChaorF2GXXPpkUPAUr0
	 eBln3P8ZnM/jhtHe3Va/JXL/QhiM0xXC9IRxNzrB7FHBvtPYb0rnrLjTsxsjiHEEDSSAY
	 82Rmc2O6G+PC/8PRuUtvmcwHUNEGfoEBswAneVRs0JGUWcf2UPjLogMe/B+3181fwDdNE
	 HCtSwRO17QPjGeqGCEf0mIvO5yBGIH2/f2RajJEPij0Jw3LISMTa/Sa7rjYWE8ZOwSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=FrI+gruz;
	arc=none smtp.remote-ip=203.205.221.149
Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939D8606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 939D8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=FrI+gruz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479736; bh=EwYG0Qqs4R24C4Z13i5actK0Jsbdi4OllWPNuy9tp3Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FrI+gruz9EHxugPSDF9vgqtObQTHlJ2N7cNX8pHEoF9/p/ytVaLMpbK2QAE10oLUB
	 4nfjlhiIyDnzGBCpR8uEyQ0/CL+3VPMMhe/idrVtb9paovUsGlcGDud7Vm8xn4GZD8
	 QEQMmQqGShnxapJhT8bgBofF4wxpIs8PLypaKeZI=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 8B12444; Tue, 20 Oct 2026 15:02:11 +0800
X-QQ-mid: xmsmtpt1792479731t54lo12wf
Message-ID: <tencent_1C87F16AC189C958ACA5B9D657E28E009F06@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJvwT4u18evKtNZtvAYtJhhqaA3lFOMm8abI3AsRN3t6oLeCMRWp
	 vAHTfTAcpiMcjf4Yy+cZNQOWA5i8vQxqsiiGPI2dJH5HnuShuIMA9700czKHGo9d3REyZjO/HrFT
	 xafcXe9YRyWQ3g4c8NGxL9GEfkJePQalMn3QSvobUKG8uwKndLQ9MPpgl5kpZG/JhzCTEDlpstSW
	 AK/KwKkZGnMebF3dXiNRkpPKQCZWI7Tv/BUSqaC5PnKoRoS/zfrtd5liPXenZIhsJ6fkw+R9Qcob
	 f3wsnpXuWClZyBINQhWuUuCw/dTN0a6/CuAVCK4MERCyfkaz+To3GAHrNSjXP0RXZWBQZ4qcF67J
	 ZhlEta9jD6QJMRBMfD/XYfhBOOAFwBmTwboIJho1Hn9JhVmjaLSt3Ptpgg3fB0AxN+donJ/iV6/K
	 ehtbiu4CgNhfZHMqeGT53y9v7ZIzB93MZaRTSy17COTC1uto82NLc+/LMlZHM0MboTiirXvQehhR
	 wm4s7yNLcodYq4QqJMojfDi3xoIN+fu+ojx8ImD4z49SJYTNmLX/TRI+2dqTwttTxrp7ZlEAHJiC
	 8ejQBe/5hTL24I4Rmfgko97rmZgui5ZeVGEgIBOm7N6cvZdacybPvW0joM49zEGzbSswclaG5mvU
	 Opmrf5OjVOcShwyZSscist427lP9FhD8Fv+Kr3bihI8l/E3VqrphHDkkktctYre+A2nxEBEzt7uZ
	 ZXC/YRBvMtU+pg0qebR/YqJ0QcrDtW5ib7UOJTQLjKV5xkWF23UAhOhkrv6/50l8HTe8HL42Dxfg
	 T/OTbg5KfV5d/S+j1020S3/uvstvEKZtd35Ab/YLvKPPkKUWmEH/j7NU/XJKi25OEqEg37qREooX
	 hEBAMSxZn6peeep/YvhB7krhbKZnqkntZoTw0U2wgrBu/vxEUf9Yd+FHl30QvRR76m3m7FuzZJ5m
	 CCxLLPQBJOMa9eDKgTbVri6O48p++HzSGNQAlGzL32/sZ8LOyNecUnvEIQ8gcvBwlIT/4sX44Bzw
	 v2fR1dD54GC8reHy5h+6fXzaFE2wi9ZvhuzIvHeyFrJGwhTKAjTDTvsB3sRQ8u2bUZg21TCyNXA9
	 YRvO6A
X-QQ-XMRINFO: NIY0FsY06mWik60O6xSizP/2tkZG+oPoPQ==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v5] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 15:02:10 +0800
X-OQ-MSGID: <20261020070210.6348-1-level_zero@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026102057-udder-arrange-c2fc@gregkh>
References: <2026102057-udder-arrange-c2fc@gregkh>
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
- Add this changelog, which the patch-bot asked for when reviewing v4.
- No code changes from v4.

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

