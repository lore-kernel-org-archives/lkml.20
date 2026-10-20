Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479726;
	b=BYmr+5wlvqXRc+g+VUgqq+HeJY1Pd1EdIkcqEBmYbgRgUGWGieIo6DrLlliIUddJVFf+
	 zbj+aRijTrxDaetvq+Kh/+206a7/OTiEUBJtbYOFdSdSmgGFuJ+WfMhIuHUDZkJa1XjwE
	 TfKvjthfN39RBpnk1NXP0BZBL0EJIy6yVCvarBEXHfIYYVpl9prgw0oWcjdnvP7XQqx/Y
	 mB13fBL4XciRcpG+8+9UhWqTvJ38lDhYBbgD/zfb8hjU6b5CxcJEr/5F1nqaIP0KhLVLr
	 ZU3p/3pud15WsyAhkoc8wO7FuOh8caSHaNpIBLN1UlT4xxPjKWu721jNFnWCetMoYlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479726;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lL4KInTkrWK1huKqgiRN9Mfn5t/LESdYOix/l060acI=;
	b=K+52y/AqIzfr/htCwjKGTtAkeasvECO6D5PqRGX7kHQAevstj7eaxtTIE2FqPB0ckwCG
	 In9WEs0yrHFYfEeY7hCQqljEVSj+Nh6L3BuEF2lNCU8pAw9obZcK2NwvPe8aQLhUw0dXM
	 ssAYmdwYhtkln73BvHQxzIGe8lggkoW6YYbMe3efirXYwXy/hx+1WGW5ruvZI+bIensXH
	 yrJLcaEHlzs/m5ZucyDqLBrM5Cveb5kqNKTjWPtCPOGNvJoeLd0y/Kadj8DtzE5iproEb
	 c0VKZARp23ew567226LjFuji+4ovo3oDwChgiKhCfFvPcJ2qBltAzymfCxNu8HDU8EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="QGteB/De";
	arc=none smtp.remote-ip=203.205.221.173
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67087606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67087606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=QGteB/De
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479723; bh=lL4KInTkrWK1huKqgiRN9Mfn5t/LESdYOix/l060acI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QGteB/DeST/6lcrxJrElMtl/nuuZXhhoLG28jrqR4ppQfLDTpBcMte7pmnw2J6NVI
	 ljA2KWnSLh2POTB3YeW3VYSI3v318sWdDyyX3rmi5iDCdUaRgtw/DL8+mA+dEyTo8C
	 9U4cXfSXKmwU1tOV8Epk4bvItNHkMTZ8AzUcDACE=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 7993464; Tue, 20 Oct 2026 15:01:57 +0800
X-QQ-mid: xmsmtpt1792479717t63efucn8
Message-ID: <tencent_C61A6A0D268A0BE07870ACFA9CF08F09580A@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3Ju7W3ALgM3F5n7/mIK5uYINr/Gi2GwdnWSfxnvrdmI4gHN0oWyzA
	 oiy+XPpIfcx8L5woQgHws5c2Jh01x5OVrVwle/g8MUFlZ8LV24euZFwcJKhMCcoa+SWXoMB0xl8K
	 Xe4LvUtCb7EcQSHH4Jpdob+f89zh43YImjKl8HqpFH7Q7t8/be+E33tM+SEq/aAZuXoX4oxbenXa
	 hNBMktOkctANn8P5VvtBTXQcytPN5KdsxWlAbxGJcOd6+t6JWHIk7fqeNS0loPZrD4uKrg/e5B/F
	 Gw9jpP63UWR6DnnrnWiBqdIxPeyo42Xuyp28DFTjGlhcfSMla/EDM6vMu55LIoGK3+TxKoJufoux
	 zdzU951agzPeMsfaAOqQ+1IZBycG5/FW9JYKJguDKwaJ6XPgJbNSSPIkQqM026Ej2WbMCK1oRsj2
	 IQDvapZqt3881x1FAmWaNF3yopDv4thmxcnTsILpH3NygSvD35X7eOaMYRqttLvYzFkmtiyg40Eo
	 1i6Sb/PFQzKOSHSX+/dMyxNg/ZMZ7bHSbXOURqWqWlocShmPvOGonA6xgBguY5jzJErjuNzXpCIy
	 nHv+RiT6kZ8ayzfQtuEBVVdvZiZxBG+gASzXSo2kEKiu0Zh76yPl1yeHcDHj40D3LwO41JAWejiA
	 e4Bs+c60q/1zEv/vA1JuRrJfGJLb0VVx1X4rsgRqQovk+xL43bTksw6IRnlRujZzVwj5XjkqtvCB
	 HtoxcZB3wRkbPf/w1JGWdBZPOZmP1xQzSrN2jx9txrRzDRQVQh1TGTCaT52092DIYmCEdFntLsvS
	 CDbH0Wu+mFyQp6yuljaxVM3RJyG8n8VJT+hD3f2nUyJLb00YOjNV812LMU0rNwwVd+IQA4CeWzg6
	 ATMVqNv4AnH+J5cEACk1AtQC4TAi65AM6uoSb5ZX1j+H4TcinhTK2Ns0k41D2j6RXvrM8f0SYn++
	 HbGd4qloicP3ePbfQKixixY+EgYPyiQIY8aPkRB6FKrbRzxTPm2/fo3Nh5Fsh4+BB07tMKigXFJs
	 8CSxbkTLTzrPrAOv93/YY4yPFufUpx7l3mvITqCKVOW3qYXjK9Lj5kKk5LloVysUbygBFsP0NUZt
	 QCwGbhMcr2zlDGgTWKF9zA8k0cFjAw9T93pALh2kMlLA//Bw8=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v5] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 15:01:56 +0800
X-OQ-MSGID: <20261020070156.6058-1-level_zero@qq.com>
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
Assisted-by: LLM
---

Changes in v5:
 - Keep the three error messages.  The return value of an
   initcall is not printed by the initcall machinery, so
   dropping them turned a reported failure into a silent
   one.
 - Use the real name in From: and Signed-off-by:.
 - Add this changelog, as requested by the patch bot.
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

