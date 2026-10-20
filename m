Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479563;
	b=SxQzM6TJY1K8IzxJVEGPiTMRAuqvwJki1zM6Upzx3QwujoXrDYJzbIxLMqvBsW+Bvix4
	 bttLw5ynpeosQUOSW1tbvSLcJGXNsLbQsETVmZNv2SWA1UWdjuezBefV3aA9ND6JpxXUZ
	 8gnNs/0FO32HK/y6Mdm+JOZrVCriiglywBwHQLXvQhkdLvMotpVn7BpflDIESP83qe3Wn
	 8ulqRcvfCcxSHEDOv/f/jEjWqVhQjy4Whg0t12fQnqCuvQwZMgpn47rqpjb8TC7tbzT39
	 ABdmkTE7EcubI095/XOiLdemAnfs7xt9RWraz4AmUW9k+N2Wkd0C1SwtXzPnm8lZwAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479563;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7L8VOZ1Mgmf1+RYeXFC9mvtl2/avF8cFjlj9LPSdp+M=;
	b=gOZdlOUfIKFkRnV+uoDuUGcwTlbme3Z1hfu0vSzPZqxE1vuqPg6Kx5+LxqAiLF8uWGr3
	 2zLEnhp8TuvqBR+SGkWXCUOl1ctRZTJ/6tCvkbiOOn4oarBaaeaCuPnglhwMHySEcJoPe
	 Xc0uKjeGFrLcZa2qR0Ih71pKlgpBhIfFj2701pEM7PTRytuUDXlPcbqfKCf9OsSvECeSf
	 aBfskOuBetY0OL2fEkw4BTp1cL8dwQjqdEeIgwZmGK581rkfrjMwc5XwVhS12Bu22e7ct
	 triSwf57ambA4y2KyPyTU4/3E57/oK0to7mxIzNOS91BmhZBROjR+78k+Ra8OrLw+iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=hFYUnPxz;
	arc=none smtp.remote-ip=203.205.221.155
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D3F60A2614
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9D3F60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=hFYUnPxz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479560; bh=7L8VOZ1Mgmf1+RYeXFC9mvtl2/avF8cFjlj9LPSdp+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hFYUnPxz89iyuKaVIr1Gxc7eTguVJNiytc160uEoK4d53VZ+THkUUZEEF/CbtEI7K
	 XpjxejPEa782WalitGUr9wPm0/DGd45Fw5/TxZcmmQNJ4hgCelgpqbeoSo9t5iuEGO
	 V8CY1y6q5YtVNvFCR8S1eLzsguOwt6Q4t9IGs6YE=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id ECD02880; Tue, 20 Oct 2026 14:59:13 +0800
X-QQ-mid: xmsmtpt1792479553tf26yi0au
Message-ID: <tencent_B0E9588E258C5649A293C08FC7DEAAC94906@qq.com>
X-QQ-XMAILINFO: MMwjR1C73eIsqZV6gcB16fZ88wLAeEU391eDqc/5k0i0mXi5lo8LyO8gU2MpPY
	 JJ7xL/G80gq5nSZUme5zSgn+C8gJKkz5h83GYcFWMIHJnN0kbzwu6CV97KQToseULivbhmfJU33Z
	 nxT5GPR6bTjbzi0rsOt+hq5d8bNwhIGT6cet9olX3vmiJYHoYu7pIU0xkGvviK7BoJ6pe4RxmAKT
	 9o6+VF2ldfCvj9reorHqnFABc6okSnyHnU+JEoOkJ4ah4+kKWzsEe+Huyafmtm68kyMDUYdvL7wQ
	 QQ88UQVUZv+i7nzobefZPNaDCVwt6w7g60d7a7AC1JbHs4UCPX2BnpEslR5TJq4YTMd+45Aboj4c
	 tNxvgo0ATO0bFDXeyfB9GPUJl2DoWEmHiNmTRqYIPW7J/QzK1pkl2sprZzKmg95L4E3uDKlUuxXi
	 VgmllAUC7G2sP6EXjzYZTXyXVNJIzxmLFQnxuHX3b7itvXjjksB3jqsJGicAov3zeCCYqCgNGa+y
	 aIzAmHZqmFIyIsKbung0gyGciUPqcaBppMzeSw2jYtPV4YdUspJELRRMoMBhtU6y4+DvSmQI16Gj
	 OVS3tEfEqV5221vdKcpgWj+yao8iTbzlJqI/SUoXnJdHTeDxdLzUgO6i4C1CzhFcJC4PQF0HC8l9
	 UpxhIKbbqt7l00ubnII4tAdoL/g04Id+E2KgCMVUY/Cl7DTmkfR3ewg6PaanxNGxnMtgrmvGsAx5
	 9gWEdzqHCZvUY9K1FZXXYD/NwcjVL5sDssY8PtZMZBD6u5xcZCtcpyyZ96w9s2k7ZHvfhQpfy+sy
	 nNHmAHZ4r/orTs6svjdViUj/F850/GgvyXGYazENbB61CPKkfkRP8IOV8q/68YlvUiWNuALfGzOF
	 RjLnhpAR9c/dQg9PaTHkorBWq2fy2LJiu9vQX7eKZHzOdTySWOJma0vmWWVtQfm+TumBwOblK8UN
	 stwJZXuhJgO9Pu5oS7CFlQ67iUo7cnBs/1SMpaFOcoT6IKlPbayUfiWzqXPE7X6FFDTqasxo936c
	 9MK+0ftA6kidCClFKVimVFkwqb1n8qWONE1rU4jmF5Ql9cqInAtM64zgtZkN8fOs4K0azLgnQ95X
	 /8CAXouQfmamA4lUn6Cz5djXrMRyYe/t99TsmpPzxbQdorEwlTjleRRSj99g==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 14:59:12 +0800
X-OQ-MSGID: <20261020065913.3468-1-level_zero@qq.com>
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

