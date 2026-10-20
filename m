Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479485;
	b=HQut2MNLL2t9BhlJR4TknlGH9VtEA4PLQXrl4Q48ubHbbZcdZeaoJZ0qH/zme+aiSMxM
	 OSsMOk2UC5fQlJKwfxFxOYILF4ZKGPJMgKaUnsyvliJH0bBoVyfyUSNP19hmjYoa0vFzE
	 VDxowC2ZPE2x2KJAl2uQF6MtlCtUc4uyfxlS5IUSuU8dm519Uz0bYCdkdSzT2T0A8Z0dy
	 u3BmNV7ZsScnAn73r2K5UasmEiLRu7yg+hfM7c1mZyfFH1sBVyMLr6L0IfTD85iRzML7o
	 8PFp65Hm7V9Cf/PPymauIdaFiIfRhwcEvjIBlvYdM22eE5y6e7lllIavwkxsxEkviWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479485;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EOT3lPkZxc2aVvumXo5eC/VeIlkMW6noypS8upmLb3c=;
	b=KJGzMFeCBy8zIjRyTjtWCw5bCDtSti/gxh8Krs63Dld0eJ9uY9oWYYswiYckDUySbzOj
	 JN6jgn33fIYc543W3GQrUGHLcuO9pa+Gu5pCMX0gHc+v8VrvScvItwYVjE0mERqis6Vn0
	 FW0aJFjFe3fUhskyyeUcVvNpErC6SUpOTffgev3OQx/MhfQ0ec+UaSyeiyQNM159Ej0UZ
	 Lbj/0JO5lOcMkL/4PAOic7dqDy/fLGKu+YAeDvEexLxo4rCNoS5UIfmfGaD0L2CNOSAxV
	 hmIfqMHyRq1hZ+C9jF4L9FOPqKLePq+ruMB47pPCdzVP6S9k8PD+iZsmJTrlq9hGmFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Wx5i6pYM;
	arc=none smtp.remote-ip=203.205.221.239
Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A89460A2614
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A89460A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Wx5i6pYM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479481; bh=EOT3lPkZxc2aVvumXo5eC/VeIlkMW6noypS8upmLb3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wx5i6pYMZbmrBT7VbF7+RKaKM7jZtGoAw/83idM51C3IUe0Vz0yWzXzNXXWJKQz/q
	 JZxD2SZ7Odut6MP20VA48eANpRRRFZwGNcx7dA24hdCwu7JE1zYaiDDdQdsWrnDAma
	 mImIEgevpdcP9QoUKwdEH5e7XYBHA6tL13wNzAXg=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id E7A2B2A2; Tue, 20 Oct 2026 14:57:58 +0800
X-QQ-mid: xmsmtpt1792479478tasf1ayhh
Message-ID: <tencent_62F01880658E965562B3C08107D0AAE88906@qq.com>
X-QQ-XMAILINFO: MFWpArBVhhGTRTvDQA99fJItVabeLl8BW6atXQ6+930H8ZRZYupHpvyGZuSlhc
	 PZOH1SA9XPdUwLiBaO2dOz+R53aUjrPy+9S4F3FhjniovAylTCKBDYJJgrC8NwA+9xnSsl5DmAI2
	 Lvo5cKs1/3ESbLRc/sdjljDwqVOfYJvqMemW1vKeQUKErsum3QnwdPoDm7uFUGiqlJE+SzgqOQUv
	 8v61DC7tkJgKfmNxVZXWrx4tethZiVrDq6bo4Hq1hEFeGABiBykJ3veeKG4yNEGhjYVyLkfF5Q+6
	 oOF8QDT3OP99N8olcyURuMx8QyVedolX7jHpr54OiFmpXM18tGwSGWplGnJ37zQQpypgBCyelgA6
	 q0VudH9YU75anuv8I1+ye1PaanW1Akt1YisPsNYMnVCygOQxC2SQYYqbqt4IxXA8qmDzv4TgsJwO
	 ln3gQYF1IRvO+ypuPBN2a/NKHHfzxWvw2dVxivsh91qwBwPNxLVPktLy/7mf79OK8MzvpxmlN1hS
	 1011zfHOvljZfAFyS1K54xwp6h83yapAVBPII/BZbJBeQHoSeo6vPrJfeGP546Lkpez5sPxZ7RZz
	 WZpW54PmD+9SWS0ELqsFYRALvzNnumSIzIhspqaGdFBGsfU4WCuztpy1b/sixTzQgT+Likcm294v
	 C7hP1qW/LWBBlhZXKQn7Osh6Er3XC5MTyxb8Ptj2A1Hxq5ogukxKos7vI9/l6PYXm0se7AGZ0Gum
	 M3V91NLlIHNK3DTP1kMXSPswJYjMXe0ukw93ajHzFTJAWAYChlxO8bK5QV220+OxMivREwxTHyom
	 54uLNHW132okN5a0b/CZ4oVyZECfqNmZtz4MROeaMgihfC/VfIOg+OPRE5jOnC9oWmmAavjHbIwT
	 hQ48K0cJRTzp6VwfGbrPcnL7IXsFLoYHC1GXokBUDLkPWzQQWD4tLlxM3KuWti2ZGp9PTjyfgsyD
	 dVoFMJsLdoef4BAvKD4SFfa6+MwNiKyWCy2pRr7Y1vBvNNp+aHREjiT6XuL3bzf8ylSHg3O0f67W
	 j8GKlPmp9GWnRYE6TAqN96SjDqjMD2sIhx2V8eFcQYgdNJxTGGG43qkjTP7kQXsBC02JRlOw==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v5] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 14:57:57 +0800
X-OQ-MSGID: <20261020065757.813-1-level_zero@qq.com>
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
 - Keep the three error messages.  The return value of an
   initcall is not printed, so removing them made the failure
   silent.  This also drops the incorrect claim that the
   caller already logs registration failures.
 - Use the author's real name in From: and Signed-off-by:.

Changes in v5:
- Add this changelog, as requested by the patch bot.
- Keep the three existing error messages instead of dropping them, so
  that a failure is still reported: the return value of an initcall is
  not printed by the initcall machinery.
- Use the real name in From: and Signed-off-by:.
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

