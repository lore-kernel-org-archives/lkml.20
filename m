Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479533;
	b=eXe62uzOt2cK44GjLikzQPr4ddXT6+oXCNH83pOEouLS/vxlVtRvFEDfA+E7gIdvjA/Q
	 NB31TucV9ZdN5sPr7txNzliYQneXg4ljRVT9NPsyhUQ/ZPiBu+kN80rUKmqvZKMA651cg
	 hUuw9u5rPYFERMmLJ6Byo4U+gD7mY9cLu139xiDLBJV8PgOYRqgiJ0MD6R+N/WVns9dJ3
	 sjo2G1Cz/+Y8H4vZgOD+X0tAjWAqwFN7XWKWdQXRYL6sv85ASCYhyxl3HMvv7FaQqgSOe
	 Qg3jlrrS+KEL1NmTAhu4B6WYi6NDa3317pqduPbkpJ40CuKRZqofCLY1iM4x7Na5sWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479533;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OuvF7AJ8BmifYV7Qhms/bJ3M83v3RS6mVBS0yc83dxE=;
	b=jIYe4h7enf5oBiOjgi585VU2tY4LOIR3YrWS1RvgH0aRuq+J5oKCjFTKAW7/dp6I+FBm
	 AZdBGa0BTt9lBQI1nnJFy2C7z/HLkq0zosG1cFvRTgLP/TIvA4NFXoQopCI+XgmLfJLMG
	 UXmyXW7lwkw9JFctQhJEQ+PXLiohgx3WCJQlgSAABjC3ZHViWw5gIR6z5TtQIVAtARkUd
	 fLAOkhq7O4CxXuwjVpT3xnmJPJzf3/Y00o8yCvNl0VQ4FasOm/CwyKhLPHFTPtTfW0Gq0
	 bgRXihmjDv77ArpXeei2enq/V++pxbtKyaPJEF38R4hU08xYatqRFaBLK02jWqN1zjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=jSWuVNWb;
	arc=none smtp.remote-ip=203.205.221.149
Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F2E606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33F2E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=jSWuVNWb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479529; bh=OuvF7AJ8BmifYV7Qhms/bJ3M83v3RS6mVBS0yc83dxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jSWuVNWbf8slr8dxqrAB0hB4ZK/GLzr3oiPbOvT4adfdRz7PqDexl8SNVr8s4Qdjf
	 aw917lnrfRaNSersvcog3OKsQvNmJvctaiVkIYLXahQ3GScq0n4yRxLVp1+2cAAI4F
	 hQ1fL29LfRsErABxvoJ0T4xjPiRnZv4jKsdxuHWM=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id EAC07AD2; Tue, 20 Oct 2026 14:58:44 +0800
X-QQ-mid: xmsmtpt1792479524tuq8n8z54
Message-ID: <tencent_3997C08147DEAAE1C9C3D895E5B4565DA206@qq.com>
X-QQ-XMAILINFO: OKozd4sh2iVbwBmF5x2zQLOTps3LB3SE4zmfRKXNax9yAI7OH7LG9jTUTBX0ji
	 a5faheg6qDN/tV+cuow1EAm3z20nU9xfGpFroiQD8U7RoNg45pSd6hTvHKgvP+lHD08FGCFiOiNK
	 i8mU4YVsvZ3cIFVYXu21Snj60kd4aSx9SCv/rwmZbgu1D11Dzh7zSuG+av0lYwrxPk7PzS2U1g8y
	 7XOmu5vRPDAQTN2GMmewCxacfjaWKMcfpM0551o8dlHEbQDfvKF2HQFDbBd1+YxAautsj8c80CgR
	 Ljjy08b+iEDI6+BbaIiHzU9RIJJ3L/Hymb8rcz+LfcL+dCSBpCy+YzNTr7BLJIa7WhVj6iyugwvt
	 JPrUKcmP3sEqTcDpfzmvky8SMxov96P0Ba3Jw4SSILJdrNJg13f7gMvQ8wf19njowZZus2bGdzXO
	 6zxvuVN/3I+9lMRtKqSDZmA9+s18EpnKWPGrWS3BODDMNlBfYBaCJLunR6hpUV98Ti/TvmnwP27Q
	 PQ/fxSB/ywROg8sPF1+uGyWychwtnQq87jvzyoT7o3JDAopBixEVvt6hosBv8hW3mQ31yEIFfRS6
	 hFBlnDU6BkimAlOtjoTpNqq+psRAGrSfeCJJp2tulEqZf6uxZAzzxN6KH7zHWbUWf3rNF3v8y25G
	 1IcdPfHM8dKD/2x5InrCp2/o8L62ChREJ2SEwpRo100TuaR0UszLvD2rQeD80DU3yaZj/bxGgn8n
	 7dgol/lkezCjMd3W4uvRX39z3N/ckVa6oXzOYkPKYz4JCvKF6a/5rdJOgrklaOruHVKkIQVaCD4R
	 sRBxDbWcvAOoEW0eSld9B90eQjbzt/3pdI7bFtDQ+7leIqnm4nQFO+YtxTETLn4wI7cXvgtRPc3H
	 ZLAeUAI+tBtPe3CC7Ezi0Lq2OLhVEgv7F6D6Xfs2w6muUK/HS8Fj3d8YWPiqG+gXDTk85v7VVU/0
	 lBnMIHi3f5cglf61ylwEUHMS8OXvidyRiBX2GXGick0XqLTIkeksqHLuIQX5acqXGNamprQ/3+w6
	 zEhXARQwYNreRH101GpFM32BJk5NH+KjNMRUsFNYYJeogLHaU7Dl8zAbpMCzaGJwdZiDCWJd+LMA
	 sN1dP/cwERNmrzSgdAKAV5urLzOXzQX0pE+SH5cBB2A2UCp9k=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v5] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 14:58:43 +0800
X-OQ-MSGID: <20261020065843.1090-1-level_zero@qq.com>
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
 - Add this changelog.  No code change since v4.

 Changes since v1:
 - Use my real name in From: and Signed-off-by:, as requested.
 - Keep the three error messages.  The return value of an
   initcall is not printed by the initcall machinery, so
   dropping them would turn a reported failure into a silent
   one.

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

