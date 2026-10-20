Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479553;
	b=uX5WR+9cB9vddEW1eGnbHFDjR48hJGhfgOfu0Ks17abyBqmoseToi59qbgKNoOaeFEyr
	 ROorBBZS8oaQ/4+tmLJMha4tF+juPpRBHn4tiUB5872qT66mLWf8s53iKwRQ9RIHUQT8T
	 Hz79y2UGQHuiAkg3+bdkce8IwudglHCQstD4+lOfK6q/awG84qN98p91nf8L/JgeAbo/B
	 78oEubNmIgcBuWmIyNbIaiv6AoINYxpLq02MYbI0vMG6UgUiOIjwp24qRGrzQAi0/1m97
	 IH6GooxUepgdPjAJpxnsV7P3hvlf9GsQfsmevQlIPElUmAaJqeW5Hz1ANDD6noYZHSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479553;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7L8VOZ1Mgmf1+RYeXFC9mvtl2/avF8cFjlj9LPSdp+M=;
	b=5dGaZoC3mQuJHNUmXKJ60CXCQhk7WX445BbeIReVlnpsauKsfIWxOHya9wK01w9AdLim
	 HNN7Qj/JUYLuwwxN247L2eT+BTE14U0GuubvLpbPb39Q1pWM0eUzX6lzuAQuoEF9vuYrV
	 jw3WcUO4L4z8m7mAqmZvl9oLTaMJQssi5JLv2BELsG1fXuhKhkCil6r50IolboqNO9Dgu
	 A0BLOGhKd0LEikABsnWSdw1JC/o/is34D9OKSiM4VWehimLpeu2OMCbzmEXzQVpI1s/kh
	 1ZxFNJK3AAeOw/FzkO8N36Mi+xJcCj+sArYXZ++QZMr5YpDCc0YBCGC/FaEWQ6QpnvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="W8N/Kx+4";
	arc=none smtp.remote-ip=203.205.221.202
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6911C606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6911C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=W8N/Kx+4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479549; bh=7L8VOZ1Mgmf1+RYeXFC9mvtl2/avF8cFjlj9LPSdp+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W8N/Kx+4AMhfYXcmVYvagsSxV3rztIjVqd4sSsoFwxZlGiryyAVznTBWaWHzIggyL
	 CnQUEPcV3Q3VWsTOUiBvU9UbDdr0D+6/O4uoUhggX9rVkCrNduZbXJEbUI+IgU5sUw
	 N7IUdaBQnVP8zJ7inXOzBlJTqzCHWPvpaBefTg2s=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id EC4038BF; Tue, 20 Oct 2026 14:59:04 +0800
X-QQ-mid: xmsmtpt1792479544tgsun87fq
Message-ID: <tencent_E4D492428B38715120C10368D5F5047ACC05@qq.com>
X-QQ-XMAILINFO: Mhzd+K3mccYx0Wjfywtljku4lecHKg0IZf5hZBDdDFMwM1HRBjCiO0+9BxRG0P
	 V2uz3i/3GPxiV0jCGpejws7WIOWw19mqySjvFrWqbJsj1hixrHatTIrtkhZustMi2b2qarWgCzXW
	 QLYuYeXDsuEZtM1397kGNtFmKcut/WpJm7PXlH7HILdUrdoKIFlLST1Tlfvz41qPv3VKt2PKuhNu
	 S3XSbQas/NgTleRAfndv/R7aoIEBhD/Q+0tRMv+JfckeMzw9cjhIDP9tHArD6bI2lYcxa6vPRgXw
	 Ie7/J+OSTIqp+pGzWYPgj7IzRjLzBUH0oN16b4ohx8GDct+W/elSQ+GzheQ/5nBULlxTOZNvNtJ2
	 Ie9Yt76odYz2Bj4cp4ZMh3qGKKBJWLXSQoBBWZcYexH3PIrTncGY1GqjGDwpnn0RoQ3MIOt5f05R
	 AZCAofnVTBGXF5W3Za11NG0sB2hR6uZQhGbYVIWZfgnWqWMf9ZnlC17Hqykn6YwEeLXw+dosxgdT
	 YP22MHkR4VnNKiYNlaVTfMH7VBDCYEIHcVshWERajzqgIME/9GcR6brbBjvG7FUgCB1H6XXZIHyw
	 BkHEGwCG4EQMU7GU/UHhTbz8o5O8rCKjL6pErO2ZwccHPczblC552b2JXQGKABKMLgaZd3qs/yRF
	 NcjXF3PW6s+uddAh4vefQqA17ygIsElxBUacgDqh0gCEa9q1OuHFwJc+988cfMujyVCKemE+XY4s
	 cHtNjMCzGz264ZMgDbjOy0cz1FfQPboVIknMHVA2TdnNJPjwdMqxkS0jagv1gLFl7/uS2x087tLa
	 0cCmjx1R99126n+/tdstdCSLIcm58ZN0VnJncUh/drhmXrmzFYgn74ThA0PGqTBOCV0n+0Xz/EMD
	 otLNULM+12DL78b2i5kVtHBtYZZsfcFlEpX4OaEbNT15uGtvzkQ95wgMe48TNrUz7eu+5EL5gJaw
	 oZJsOG0hTUcOQV3+kWBaTzUWaN04oH4iKRHtRbropn6ie3GmwTSBLw/hIlXduPaOQjdX3bsjg6q6
	 DyecJzK+n1fS3dDVYmkYpS23NDZuiHyhHtEb31vQ/S7Y80uttoPYGX5LABIO2aiPXKVHHhoDAqfA
	 Ig1Jxjiu8s+8/FNBwi+l/RQ8PUqQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 14:59:04 +0800
X-OQ-MSGID: <20261020065904.1226-1-level_zero@qq.com>
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
Content-Type: text/plain; charset=UTF-8
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
v2: 只改了格式，没有内容变化。补丁体与邮件信封的 From 头现在一致。

v3: 同 v2，修正了补丁 diff 格式（由 git format-patch 生成，含 diff --git
和 index 行），此前用的是 diff -u 的手工拼接版本。

v4: 保留了原来的 printk() 调用。前的版本删掉了它们，理由是"错误会传播",
但 initcall 的返回值不会被内核打印，删掉那些消息会让失败变得完全静默。

v5: 本版本没有任何代码变化，只是补上这节 changelog。
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

