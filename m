Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479589;
	b=zlTdwSMuG5d1zy3VjYcHJ+8Vwgom+t8acS4LV4ckmcRhUHLNGXPovXWX/uvdlrVM0I9E
	 6fb+ga6eC+it+Ee3eM5Enzjb1EzVqotqZkx77WCDTb8PpbZgw8fQu/u0+RAZV4z92D4Ys
	 LiwWd6ejRj7G03TaKo50Hie86mtD2fNyRhT3Fx2FwlFGQo3OqlbAzz25DQngpPDi/t+Ec
	 3WWKfNVswZal8hLxwmtvBxhATtHYSeK0qpkJSl9OWjqKE36T4YWc1sFVfpkghC7bftoeY
	 bkmNp5ghHc8w/xfBZMmH29BNfN68QBk77p59rQmDsrmymMfC+2AUaQAZkoGquK5BqAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479589;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7L8VOZ1Mgmf1+RYeXFC9mvtl2/avF8cFjlj9LPSdp+M=;
	b=PWA5Sjc+Xl3tPx2VVjVuY2GHwJfNMHwLaadOug50vivcXIu4wBqiQFSIcvY6Icv/t6+/
	 4I5SE6RThxow3jUFmNgQ0zrLz5oaxXJlkTwSwTwyjVq9SPG0gjpeSfr94VmY1bCZJz2Sc
	 6o4+koR/49KOrwIBQ+smIrlfcs4ocEwI5sYYu6XRWasGu2VyvbbDoVYeQTFyxg4ut05jg
	 XvjpeQ2KSdOK8lBLd+0mDPxXFunInCz0Wnra7DWZotWSsFH56ECk3Qa22U8lRgwHYob5T
	 tCeKieQiOgjNYgrxV7pUTuFTjg/PT+GAVWcWDZJ844o1v5UsteoxcXJiaWAoVlyCKNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=mUFm8+Oy;
	arc=none smtp.remote-ip=162.62.57.252
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0A8606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F0A8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=mUFm8+Oy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479573; bh=7L8VOZ1Mgmf1+RYeXFC9mvtl2/avF8cFjlj9LPSdp+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mUFm8+OyefRkdmjVsjG4YCTbNRaeud3N/vFQH/od5OwE3RbwCuGZtLmTaSIWdKtm7
	 9Lqca5+Xr2y7plg2UukhmaY+CIexvQQNLI23zuUFEYb66x5KKJbGdlvG2OFewbHdmd
	 AUJa5jzrnRCjbr+TqMX6wb0eNrtJfia61HISeqpU=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id EDC98AED; Tue, 20 Oct 2026 14:59:28 +0800
X-QQ-mid: xmsmtpt1792479568t8zvrl2la
Message-ID: <tencent_EB02491E77AB9E275663CD961B5A2B89C508@qq.com>
X-QQ-XMAILINFO: ORtWKPVVjC3BoOoZVK5YqPz0eyil/PO7H40fXPZGkYkJRahBC+h1T817rDqzq+
	 w9w0Pqq7WzXeO56L0eHBoJUJsdf7CTOSZXEgXcq1IhwtKrTDfKL7RRgsaMjz1IwqtA1rGBqXAjA5
	 5b/5DWrSMT5dY0PhMMCfkgnhDyVi4nHpIt0YoN9riXQ0tKYiIvGKZVWt95Y/46PJGitYk22apalo
	 GzrTl6ZsK9PcNkgWFbmN9OOlY9VxuYYMPoZ1TwjLQYg8252MdXMTQ7bsscaGkvnS6Zyrfk5tJkDV
	 m0vKTWhHkuAGtTWreuQKyyiSc9M1iXOHk/oaQ4H3BdEZqd41VppGoi14FGO/+yY1CFQsg/Ukb/Yv
	 rXcqrkv3a36Q0H1465dnF6YBqcnRpBJScpxczj2p7xsINFtvCdevAaSd+Sxa7B4QfNCEiLhDYW6x
	 k2aVdzVxgxpi7+HDHBAy+024x057pNNA/N7mFdSlC3RZNkzEdAbZPQlk0rAgRS7WHifzv7WvAGwS
	 Q3TMesDh7fvfqGNWkB3P+ij3M2JB1w5FgnQIk1tHjeLWCbGlcKeEYMpAKt5T1gQ3F9YY/qEuspt1
	 c72RFgF6PlaPbYRRvPYQrt1VxHwbTUBUIWx7NCgy55mMZXEEtmezxw/Hn8TL7i6BoQgpaRi1XVdW
	 JhT8h8B2XdWpPACg95MIqp+v0CWtLAJQ9ZzrFnLQF+fqRWtzj4G+QyCgvppIQL5rTPmUQmsKufRg
	 7ePxgXHzjgmYcLN4yVcGfZT8t2p2PNmhW1yEZ6hKws6c2RGfn6qosOVmOSxa5SogQ8Mel1rn9sri
	 nJM5GCSRe44tRWzaiTt4gEWzKrC/m2oVpBN8wGF5H405s8iDCVnkbxY4sMe25LSBxgW3mNi30hxv
	 zm+Z0X+UwFixCRpk8awuCRVZO5Rx1k0HC3+ZvGcPnwbkDdGwM9sSmsrlTXKr93XqDnZBnUit5aOI
	 9iAhXnIEYGH4CiOMwosJEH1evyJ6CNVbMIBP4fCdVJ0GHdbHxpGaU99sVPnpTp0fe9bY3jgab8ZI
	 +XeCCYvVaWx3wn1zrDD///P1K9mM3t6zNs64Uo4ofidHFGHV1gb3WIkwphJbF9CT/ED7DFAVXbl1
	 WgEeDZlHfVcz4o8k7JdZv+Iz/2f+2vdjaNYzZ+pryE5TM8k50+hy2HJqKnbJeSx/p63TsgoCTMpK
	 sSsl4=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 14:59:28 +0800
X-OQ-MSGID: <20261020065928.3603-1-level_zero@qq.com>
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

