Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.58.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479679;
	b=X+RS95lqdjg/b5TCLqhfzLhhLVXHx5SJWGBvFCLutRARYEjZdO8LOrugr7pNJRyFpGfS
	 C17vjSDLPMY0c6fDE5AkoqS0oWzS03L7hctZns0XreH4JjUaJR1IW/E6H7WPFfOnk9Fsj
	 MR5K87rL3hh2jep5Ei8utQCjIKzDmw6Lfb/iIQhWbWrTaMeRwsdJAUGHaJEAFJZLKhvFJ
	 CGQwVK5wfKeSQIBzAOimy1bVNUlEeS347bZpfCtyFz/9vAGShlmtUHxSvOm0PdVmtvPMo
	 S091G6odn6hlB3PJTkPBknNcRtYDMiSYT3Cs7Du6ic23JpkmqeG61rAovLrESR7u8dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479679;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2SHzzHRATrkAb6N0uSHoWJfQ+/jN9/wK6xzQ4MSKZWk=;
	b=H+8RiAERZoQLIKU9mOHFflhZzZwbP+7MYEr2cEd0u3FPKH8sYAz3TPncDXGcMdaqFaRG
	 GchCA9zs8CUA4MWljHdT2ZKY+Rp1p5pXgKAyG2ntnL+pX3mg+XpeYihOZ7DVjd67qsJD2
	 g+o7vPmJXBOtPwgwNy/98CScrCtvh9kLrANO2sQLF8o35P/6uKnezZAy40Hc1ZJBJ88fV
	 4v1wlQ9mwfWk0tnfqa3WKDw07uHNLc2U09A/1I1wbFn4iUO20pBNw/4dFkHuMqWIlPkKE
	 yDGQUhli+VRaAhBAPyVV1so7EJazRbbFqrZ2gKNqDJWmPaeZimRAQF9jKkiP2BebdLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=dps65iPy;
	arc=none smtp.remote-ip=162.62.58.211
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5475B606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5475B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=dps65iPy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479674; bh=2SHzzHRATrkAb6N0uSHoWJfQ+/jN9/wK6xzQ4MSKZWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dps65iPyBCus4asj+Hawm4LysyMr1NY9wbpdopbFUq9MlYqPUShb5gISjbmT0Zefa
	 6kDkUKsqFB3bT0fMcA3dnQHLFkAH0bQJXFWoVDABz/ZvfW/CpAVxru6ixZbG9UoQTa
	 4iDChA9BTqiZJbh4KWSKp+UP4Nh5TIFY1Lu4Saus=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 4715686; Tue, 20 Oct 2026 15:01:07 +0800
X-QQ-mid: xmsmtpt1792479667t77z2qugz
Message-ID: <tencent_CD07EFEAC409CB188665971666A291009806@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9X5KvRYxWqg9WhujIiV6uBb5QNHPZ2iKPN6dJmPnoUiBQONswlPm
	 juzA8nm/jGVBGWK4pp9O6Cgur8A2q/l7foRvnJEio4cTywuj8VyWOa4AINH7lbWaKsT0FkhaHk7q
	 nBQbrFJSQjFOf3+nRVNeS48ZgDxtW5AOi5JVyHh+mICKFbzZ3OB5I1sLXqEN/YO8NjAsrcfXOZtr
	 ssvr7MLZPX0GkF82BVFm9obHGYFuuVGRTibFQC0gqkcer/HzON10RiKRTTlZLrFh+f/zkkDXJkM8
	 PTtuG92TnbnxknQMeDcvB+pB1Jm9pKlNmZUTslpKOQ8nm2LsPocV0CB+DfgyMfnipfiCYQ6d9Lsb
	 IH05ix22i/mFcrR1WbXqpKTXUuInLFxJB1DzX9hyo61cN06UgO8bfctbAgZJ0saoV1XBcSY/9njR
	 7GPzP6rL0I/k8cnbPI8DAszXftDF54CDKy7UhzZNaeShrECBb5FaRHjDOnC8GDL++XtfBOq7Ka8q
	 401mgHiaoVGJn964ghDcj6DgyEECOShaeKSCjsUACdQXAvkzbV5n4IPCfmo0jS/0GHBFObdhRtw3
	 GkrWTDjsC04MW2hM3Ha1zBRAyCX32rbpA9N1IBryQCT97OA9Ct6/jGYhWLNOR5t/d4UToW6qrz7/
	 atum9xrkIfUCME7eom5NZR0NPYCQfcoSov5RSDAwWwF1e46LKJsgWsojSgPeXCB1VOdzcrNA/tUV
	 6GNFQV0T5y8hyC3DxrO0ZycKpb/o3tYoGI81DPOCsWIA5jGcAJ77MksHINpXp5Te01DOAlGKd7ce
	 i/Szmu6jKwxBtHL3M+w87XHIdgCMyPre/0QuI0rjbAPolSFpZQYt9OixwKCO5pkJiiXgdh8EGUX8
	 vJdrFQU/glBr4TsEpkD6ctBmbTzxZ5RbpHTSUtxtE5htbnGYKW1iQtRLWxhz0+wTqt0z2fitFqn+
	 41jUKXZSjr+q5dqqb1wbzIg01ZgpY1/AZ05UpJ2m3vff1WyVB+YWHqEwYXvk+C6HVsqhPmnw6xsZ
	 z1TKDQmtrvfzpaHUyBFO5EXRch/drYIseXReCUQyNmcCWaF2UWeJ0mZStD//sybqPH5HpnhkUjTs
	 r4xpOhsnsvepvXpwH3U9ReWtXmT1nvnmRTgj2S
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v5] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 15:01:06 +0800
X-OQ-MSGID: <20261020070106.5300-1-level_zero@qq.com>
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
Assisted-by: LLM
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

