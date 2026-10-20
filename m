Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479658;
	b=JSOPJ9LpEEk148FvNmEyMEXxPHFIVfRHcPimmhUnoaKD/7rK103u/34KXlXbrt1OmPfe
	 k6UTodTHxeL/tHovWJqwdiJQ2PSJoZpoFMscwEcJJDS1UqDFqdLLb5IksAzzCE/mdS2EN
	 MO4wtFmj26O+E9wnDguITA+SoQomrsgmqcpNnX4stbRFPZhl7i9TfkO08QThQKeHNqdAw
	 MLuwsOGySH1fSBYeNQ5Webc0+iXK3E8OlNqxuCzzT6c1Zgb2mhdbW6rwhdby1HeiFWht0
	 gW7iV40j3XgjwnrfjbWBUuRsPnUbxl96aowk65tJt0Sksp328KycdTjjS1U/JCZhTVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479658;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PMF73zGjCwnvHapNHV3bH01sumcKcQUo7RssH3YIdWM=;
	b=hepvO92LFK4GUPux++/aiY1yjuXX8a5mQnNKSjNiP6FEiMLQahwnmool1Pr6WhEgIzuc
	 z6bPzXeern5OBLthbnxzaX/Ike15+UwyK0iEAYnzMlM4KW+xq57qZJw8yQK/a137CsqQa
	 cJUqPuMcgO97kQTLhHELd1ibsCAyoGN9zuw/XXdb3xhz7ereesPqapbJo7CMeU9fdi9UN
	 BYt5JcZ9nwgeVmyxjlD9BDDid/RURljlSLQCzT51Rp8LWtY2hJ3zPvyP2N3ZnTAg/9yuq
	 SPWzUPQ9LiClR+gk49JH0BU7yWDKzyMip1IUIpLmYpGDhZNCOPytsG5ajLJI/WEALsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=VaVcN2jr;
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A63606A328
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A63606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=VaVcN2jr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479647; bh=PMF73zGjCwnvHapNHV3bH01sumcKcQUo7RssH3YIdWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VaVcN2jrIJqKqWEEzvX3vk0AmMYBx5o71HVp4sBDWiEe8OSjZ+mPOKV4tPbrkoxS4
	 gG6x12lyHZgswIHLKGrmgHPnbru5lKgHPWF9IxtXGV2jOwo8/3XSwfqlZ7CzgpU9wg
	 xSkHc5QBe2Ljz1NnyvoLTuwrE9pamZsLOweEwh74=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 2A1BED3; Tue, 20 Oct 2026 15:00:42 +0800
X-QQ-mid: xmsmtpt1792479642tvbrvplu3
Message-ID: <tencent_C9897C02521E7CAB7D273F636696F95A6E08@qq.com>
X-QQ-XMAILINFO: MTEG4pe9ochhwRwTmrn6elPsnXhP20zTYNCIzKVmD+oLAjPn/I4bFqQTEyy3HM
	 3OR09LqmCdTIqyb8SDqSFKlolGGSyknAMtjRf3g5HpH4CqwKj4c65404Bk5pa1S2VtOrIl/2biMy
	 5Fw0oS6+nTYvmjsP6/i/0Qkd07u1Rh4IOdfZ2FB0sA1DEj261aapTVAY/34Ffp7Iar27hYkAetdV
	 6/bOOavq7nGSXYnn9XGFQS8KOqLB1DEFf3VkZ6zfIToNBWBf4DQuwjiltYnppDW8cUld4hQ4kgLl
	 MJwyx5O40eHK5XH/lYQA8Uknpj0EntPhJQLlm5txyoqibEgw7kvej6Rpfb4HbmznznZnpoxBuLA0
	 /h7PyECmPayBvCM1QlJS/L0K/NZktdp2/OHu0A18LJ+fqI+01d+qkHi/ZyXUMzjd4keWgXWmvG7D
	 3/WIg1LvjyMpBzdOABPfjlgxfDn3Vf7QLdmYFuxZj21Rl8XxwDD1+AeWk2VH2Ma22yNTnJEgz4Ly
	 lnng1Q/FlP7OYQEwTy6W8qvZQUzqpmWoNkoQWNbxJWCKaQ25bPPl+zUig4yhFnmIG9aJ2DHtXlor
	 IN2fi8riMGwG/XnJUz7LJ+UO6vtubJpXRUtd+0qpTYzVxjn0LSFgOOZd7Uk7vMFZNXwQF8nVTYjA
	 8ywb5q4+C5tpRMFJ4sJVZy95a44cf6PA93qamd1GtjwRkStqU7ICF2lzNDS+H+frGAsmqhSBQLhk
	 my+kGQRWTUl08xemDMg41P69i4zQMBZK+9y0OIUisfa4UX5f3R6zWT8/49h9bJkVkrEQwP6l42Fd
	 VJmH6r1vTkb/uFgkR4yEVQ89ucC6a9SqcwbDgjzWHgYmKBDSIBM+lNHfnMb6Tu04C3LlY9eK3eBX
	 eHDysUlmUpsaB24H9/AJAZDTpKRJQMzeYZxEH4S7K5uw8q4u/PwC7VskchGhVtqP7iK82liCsLVv
	 FUYf6nq7MuXmWX7+cO5NVl9O+1FC84lkrDtbKf32oBnRZcTy1EPJqi/qQt12/vLgYJrKJxf0rUh3
	 hA9PDkm/6Lmlsw9dAOFi2FcHCwturzft6MeFMohv0CXOn1vX4BKjeSDVcf9JaY7/ecHJt5Nf7CPD
	 MFhKczqEOKicsjuyXQkEgp7de1DUj20M/c4H0sxZ4YSqUbGX8+uXrKNygqpw==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v6] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 15:00:41 +0800
X-OQ-MSGID: <20261020070041.5141-1-level_zero@qq.com>
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

