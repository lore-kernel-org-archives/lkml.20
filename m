Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479518;
	b=lxbxLHwZFjQwOeVa6V1wIHibR1o/pN58WkMlu2c0K4FyU59iaUEcp5iJCuFbbljVWej+
	 dSMNVD9wV5mhc8GAtV5mPmqAzm1nSZ8U0WBctGvX3KCg9yhNotDOpNKmqbxeoeW6E3tX6
	 dDzHyFnI0gpUwYx/C0/XdTHsdPBLfYvBxe8DmtMdK3neu7Q+a/a6Oj7Q6EtDRX8ExqnWd
	 YNuE8b0zqnAHxvWZS9/GhdsaZWfycs3mRPScRE/aRAKKu9CmcwXRzujyU1JcDtNUoddKy
	 bcgqK57I177IsVpSm8BeJu7shDVZR1+ZMn1I7qhL38cWDjHjzbmpcQLTkpELE4pdKhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479518;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3mVdC5kDTnipn3iY5p56LzjbkerlRhb7piG9XOIde2E=;
	b=BGEuAoM3R5PwvkUzk8TNZbPF3/CvJK5NFFzxLy4Sl9mS54kXSMZqzZxuXzAqFGKyX+eK
	 2BhZktJVWf5xzq7577Ih8xxKS1IB8zK1y8HzSqVaJANNxapVRX9XZrhKp6LJ1NTKWF7wu
	 QD9ySYAVnTukpgwnvNWjQwoYJzsvCt16oTB8VmBAyx8NdpVkZVop+8r3hWOUrHjZ72sEo
	 Ph4tsg1vPMOEvTRAf65OYLQ0gapXB1XYfOhJ4TaKdZ4rS39RjaKWztoJhl5kjWdqahGZG
	 ax6FsPRQmKXIvuouztC0m6WYxP9P4PlddKh3Xh/WwShy5/2SK1cuaMcXf42t0LJqPVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=eWu+K4mz;
	arc=none smtp.remote-ip=203.205.221.202
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8A160A2637
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C8A160A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=eWu+K4mz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479509; bh=3mVdC5kDTnipn3iY5p56LzjbkerlRhb7piG9XOIde2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eWu+K4mzv62ab/5dTu/F/ZMtAWCXq2d9DO+2nQiNItGGllo+EmK7du8Ld8ivgc9Iy
	 xvCUQa7f2mYE5cVWt9d5+DYZ3nHz+l3UZ8ma6j0HVLgQlLk68zMrnhKev2uFAVxyrW
	 b7ZHEZAbTgMCuiPU5d2//+gLvdVJ1gSiDaJOokOw=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id E993F67F; Tue, 20 Oct 2026 14:58:25 +0800
X-QQ-mid: xmsmtpt1792479505t9ikfwqbl
Message-ID: <tencent_5258AD658E5651628F009A47CBAAD0C9D806@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GAxUlqkVjZxQic9tu9IHE1ACMtF+tj5AGr/62VZkV4sChL1LQ31
	 Rhnu/sWGBvOTUf4MS1ffx4Ang7J4wrkjRpIvDeiXHsU0je+GHYBy5dv9tox0zQE7RodY1Se6TQrh
	 7wPTqZ4VqK9ccicLbRuYUVCbS2bSdBOlKZkm+zqVmuH5FOUCQqxrOcfsIT+CkMrOjNZC3T1/N/Qa
	 yCSqlZmSKEj7oSU1xB0BT05FrPcfSFYzL3Q0anL6POcMhUJKDVogE7wvAFgrmHe4KfyiVKgLNM7l
	 OHXKVZzZV5VP6qs/OpTqT8BN9QQFYjLf9581BvAH/fULCkj+ebVou1FQiXIztPUOY62j6tWhnQUO
	 sMyLPzGSOxB0340xX2tvKqlirB7WvHRwaS0hnA2232EzplQAePDzUuAtNB6gDZEqJC8pcXiA/63+
	 Bwe1aSUaPAzD2Iox0lMFwPyg6OCP63U6Bv1OJdcmYmsJfhNvjjXJ5ayTdV981heNFwY9UHB0avAV
	 yqQTUgLz7CFbG63YVhVVmStU4AAFUg9yZoZhaekk8anv/gWDobY/7zhh1spdQXmZyX3nWa2C4VkJ
	 tIuQx+wsRrkrSYuT5h62jQ22dilOG5OWHvHV+VJb1XGujt9AyAmUK3GN1Y1Q9Tcs7IzF+eX0vizf
	 XZ9dy/q1UmGWxgylQXwy2a/b7l0EuiXb/pDU6IPuF+wVu2zyHnFWpIWaPBuAWoiU3G/D7gl1ds3s
	 S17cqaA+r2yMV4kKGugCcxElOI6lc46utcjb29bvqWa+i3i1UwdUArWoVP2IxhYKl/ADAWikoY5w
	 mwdBi5w5ylyjqWvGLqGeobFBVh/L/n7mWAFwJghNJ9FZ4pbRjhfcaDKICOtEWXLVOH53NQiR25ga
	 XUpecszBgdBeFMx5mzTtnUoCLNmgoJfDnKDhki1udUDUf3mjUlUXAMR7cb/vtUQXji8RmCpP0AtA
	 Ie9Ru4bTNqmY2Ir76WKacbpkWaMW0KW7OcTwehfAoSvCd9vrzf008NvJpmElsY5awOVtglTVGZqE
	 0ZAaB19RibcqkPAdvRRfnOLpUPfmQw6RYGz74VJXr2D9c+oGQuan60gSJUJ63VTVKyfHj6KLriZR
	 2SPTJewjlrv9Cv+qIHlLyPOJbYIkkuKVOTBwU7
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v5] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 14:58:25 +0800
X-OQ-MSGID: <20261020065825.953-1-level_zero@qq.com>
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
 Changes since v4:

 - Keep the error messages.  The return value of an initcall
   is not printed by the initcall machinery, so dropping them
   would turn a reported failure into a silent one.

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

