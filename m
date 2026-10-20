Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.58.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479644;
	b=LZci6J9y2Wh+5M09WJqQrK5buqF24QPq0JrdhPBFio9MkA2Jj98a0xV7oH5n94Xsop9n
	 YPhcrs4n+ma0BGT9ScPFLd3FKuLjUB5wrIDwYWFo82HntFJKYD+I2SI3D2ROBwVpG8psg
	 4ZX2DFYZw5COX5KSK8JmacizqPhIopZONy/kEqS0Snvy6NjIkA6o0gCLqSp+OHWvtOkZ0
	 j9X70jbpUCO3Coo+0FP352lvHKV57dPPw4/vUOZwm6b51HEG+1YMvLcuJ+YXcOn+EdAH2
	 69ChSeBb/Cg+8vqiy0EXQACY6fEQbthquJqs40oloj5eEQ7UT7u5kKu14J4Vwvdymvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479644;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PMF73zGjCwnvHapNHV3bH01sumcKcQUo7RssH3YIdWM=;
	b=VCi92mpHwobTrKlJj7PZKv3w7/Zrs6MbNXDNeiYNqF1i2tCuDpOEp/rAJ2DGAbNRjF24
	 hvSlvGRI3wANPW+3JaJiCtVWa4Ui2kBmKKWm4oHB3frW0lgP4+787hu5AYbASs+ZJ2/ag
	 x5LU0a5Wx8fwSkAPQsggAw6QvIgc4HE4LOYH5zuNydlYFcINm9Jf7j3Gkksb3UUL+2PJt
	 1Zz1+7qjIKz8laz92UHRiNPk5lbfniUfpaAdlZglGLBSPAEzdnNisxtmPK467NLd9ZQHs
	 qAroK99tfSlspCQnvbXbA6NoevxV2HIziZvZYPP7ShQSHqetcfm5zau4J/cg5VG69Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=PHSqQDIK;
	arc=none smtp.remote-ip=162.62.58.216
Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56961606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56961606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=PHSqQDIK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479626; bh=PMF73zGjCwnvHapNHV3bH01sumcKcQUo7RssH3YIdWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PHSqQDIKVnKBy4/lVgdK71AmwaZuYIwa+KX/7GqNPvqZ+xBXpsy8svCRK9smbM7cQ
	 EX0EuXCGNUVUQjmzCWaO/aVt7f/qoRvBwBFarwAOrHEXBF76ES0J6BbyTTfFo4K5XR
	 cz6Vf7ZRCov69M8aAFHudXQTZwZ/FmDxxZ4IMwj0=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 1631887; Tue, 20 Oct 2026 15:00:22 +0800
X-QQ-mid: xmsmtpt1792479622twby6cdjn
Message-ID: <tencent_E04FB8C75A2C61B480120104263DCA56DD09@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GBJmnhDpyhV1N18Z+t8hY05D4e2pXpKKWWhEsGWmf8QWK4BJ9qk
	 nFeIDQnhVSyoDr+1poKKfbtPo+35YFBMzmpzLSgz6RnAvQE+s54YNtXwEXJFBUoRtGtFVjarUlGw
	 7kPxV83HnoSgFbM4CEsXbIAPpdb68mbzmP2OcBemAwCQ+xzKpUzNlv1X1cB0HrK/8215NlQsRJwc
	 FaGpfFoxnxhGswk27zLHi012qw1mYmyK/LBGBwW0QHzGReruhbJxfXoCRY2SLEmaT3dVR/3kX3IX
	 +A9mKIl2HmzAH1ymNeMZ8yRC/4i8GA8f4hgxV357xCZ+8pePqUjDZOtrApVWtFiM6Aab1hgC8BLx
	 1iXT6cLy1aNB1GrEBaFrj0+j7k0THYqefCvhOr8CHlseqdXDfsbDzzVNfF6IuQLkhF8opa0jrsNA
	 hJI6yJIC3QojFjvdQCGKOeGoC6AkFFgTL79kdNXhymCsjC6p0C4V1vZkuEhsl9p/qfCgN81Xuuq1
	 Ax4zdRALthcqK89W+Ffa/vRrV6J9OE6fky59zBpl3FG+cGxayc33rf6+mkLAGCCoEKVAOosCDKin
	 LAryJ+yxtwTS4DZ78y6GVf146iEnxx5S4XG5lpA1LdpEF0szKZo3RLpLPLNILMHJxjfadFB9CD2M
	 uK5fv9dYM6bwDNYwPUD88N5jMB7o+xJq36+6/ztZ+lGjTOp3psDLBayuTT76I3S3fl/ZTxE/dn4f
	 CHao9Ai2MmpSwif4UNn0Tb5OoQxf3odCtgvee04vfW4PNvfMdkHTqh12ORvBau81FbD3yg3tQKHK
	 UvjL2POkINmfEHr81BcS3lf97jkiVGegEnGc1zWJ/N9hnENDtljL3Jm2sCRjifBeXGiGVEMdAjjW
	 18GgiSC9+MJU+uIonq0kUoprc85Aop2xX6FM+1Cl6XFyNRHpBz2i5xPOPCsBJwgPq5Sa0+5Ww6fJ
	 ZOkevmFcfvD/C1SPXsHkoAWTTGNKuvViKmMcvqaLRho0y2FwakFr5RBaArM7XjpooIwHDuX301I0
	 a93OwSWt6I9WxRnvyqhI9vNdK7PPwtW1T9JTMUKRBpywrqHa2QB/6k2hbz6u6VIaiOzxAjH0C/5F
	 A8g9WgmXn/90192GyoLGXVvLiF6tjFZDT7k6t8
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 15:00:22 +0800
X-OQ-MSGID: <20261020070022.4976-1-level_zero@qq.com>
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
- No code change.  This version only adds this changelog section.

Changes in v4:
- Keep the three printk() calls.  Earlier versions dropped them on the
  grounds that the error now propagates, but the return value of an
  initcall is not printed by the initcall machinery, so removing them
  turned a reported failure into a silent one.

Changes in v3:
- Regenerate the diff with git format-patch so it carries the expected
  "diff --git" and "index" lines.  v2 used a hand-assembled diff -u.

Changes in v2:
- No code change.  Fix the author name so the patch body and the mail
  envelope agree.
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

