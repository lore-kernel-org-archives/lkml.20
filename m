Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477842;
	b=TWvd4Wki0qFUoSXI5JA4IDh/3eld9EQY6zW3tg1yRDlPMvCIv2TkyH5ykgjZ7W4qJI59
	 xmfiyYzpnVDNZalkVKcswD1y8M4aBJzO8rUzII2v2E8NtRAQ96bjCxuGIHFant/zekXJD
	 ct3DmYgsglk7jmR2gh5YqEUTWKFdqcvynQZdclI/6H5lp72mWe78ZGE2nGsq4f6+aSVc4
	 C3qEMrNLtyE3/smc0RAX/MfodQuSvdmUb8XSFgbmnLPktGUGIkX+kY7E8NYFttZ/FeHs5
	 R05SmXgNFc2d6biInBlpJDDUpgmdhbAwatNC9ljEER9y03R0onMt/chZG3T9vASLfLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477842;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Xt+yB9qZ1SMyxpkCTUeVdP+7lRjN90NbzuMiw9l++Sg=;
	b=KI9kDO8CKO8tDE7YLdX4d+yent3QL7eQ75SrjvuldxhNc1B58VWfc6KPFUR3I1OiASnL
	 yGEZ5sfUJQHWwu1qUb2+71/EpAY82RsvwtVYGBMKYyQ6imM4t0mo/5TSZkNUlgGQzQLJY
	 JRTSIHBFLl00iEbOfT7N4BXTfNvdwWqvA5gjX1O9hzsYYNsRTZj2sfbjgmO5PkqH2lGlS
	 a2fppnhwZhy3DL3I+XFl7vco8MYQ2u2bTLjTGORAvsMBzQsFsbf3633YH+9/+U0FUJXHq
	 Sv4CLv5rYvkGQG2sWjMV1LRcCjT8HG9gdI+5snchAr4cAZVpAc7GgajLnf4r63GgWMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=xON8151N;
	arc=none smtp.remote-ip=203.205.221.149
Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A19606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A19606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=xON8151N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792477838; bh=Xt+yB9qZ1SMyxpkCTUeVdP+7lRjN90NbzuMiw9l++Sg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=xON8151NKYIVGpHUYHZLZcDi+1bA8BPGMfcbfuDDjKTx8RGn+iyqR13FdUMOqsAzf
	 cp0GdwVXCBQ9qL7aRvpEDGZY4fJBMpcIVwF9bdK75Mxe1svjLtX9eXXnU/MiJ6U6+2
	 JhQ+HjFTif7y67+Prn6wFsF1l3F6dhON4/p4dY0A=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 7A3B2CA2; Tue, 20 Oct 2026 14:30:35 +0800
X-QQ-mid: xmsmtpt1792477835tf9mikm7y
Message-ID: <tencent_8925A208247B28AD929D248D655B8E6A690A@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5HafjnjveLSEENKP44oToplOd2lSEpgvq2D76bTKftFt83ef++1
	 wel5LmQFVQ7qbO2J7HYsgAO7115H9JUmhCcy8KyYxy5RQgIvXy0rY0hpT7EQIiiF1i4DeCm2iIPl
	 WTrBu/QLkj5XwcXfQMW7QYVch6ZFLszO2ztYtwlogkMpmy5Zfp5cto/kSvmsT8a/DKkz/oA0ckG2
	 11i5Uc8IHXcrEvhb8l692mY5RfgG4cwiosFNoXCtfro+AOPcWyEUMIIrzI+tiqhleSI1R4LcnGXp
	 qzhDoLUD6jVNrkCFnvSah8O8f8rGFSnWlRvUtg1oijmBl4Rh5WyD1M3GBw4KbDTex5dfMUPk4uoZ
	 riCG2szXyrZ3+A6pXNK4FfMWrqh/TSp8etoirU1awy05c8tr17YTSGrIlKvRtpXMGfJC8B8c8Kl2
	 Vmpsv07Nf+mrWmjKsW/2ywlz7hEP7iFJetodmOq5vQRMM+xysKW589PULuV0kdpOrjkMqsQGnSxk
	 G65T8twEtGiwjWhD9NSRT7xDU2p26gHdxue1v1mNhUuiiFmJj6fjTwdculzAWJnYpiz1foJvRpVy
	 0yzo+67aX70YrCbgPSsy7A7D9gDYgMzlcmsfZsoF3N2mFeZ9SJE/UnPiR/oXH5g6g3i90dFFikwi
	 7W6Q/YUV4D5p6WVSNJ/el8EUrCcxE3S6x8cFTAD2O3gDJFPKZG0uMC5XEcHiD6OLaFuXyeSVvNpR
	 ClA/q5R+F6RcWrm26C74FQWyHaMWyyA0F9a0Gg7xrJtj1PbrIIAOAVICiUpCGqkzfc/pWsJuFSJ0
	 hlxO36o/VeVA2CDne108NSxp3OZnM9fmdZqgT3zLpbbPDL/4CIx3MgiFKdxBGkSGIweXW4iZkYNY
	 JWLn9ux5tU2oIOINzEohjUuY0bkXTpWrtuoFBg/uELD52R3rbSPtPeD9g8sxTGAdaW2WvZU7dBR7
	 Ktf33ckpGdn2JtOUqudc1x7tIox76UMZglQ2/bmRtPUS2gypuB4TjM4H0pK0k07A7WrkJSyQnQPB
	 ZioqYXaQ8WgK2VZ5wQA6x9P3IpU6u6d5soWLxvLg==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: level0000x <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Yemingxuan <level_zero@qq.com>
Subject: [PATCH v2] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 14:30:35 +0800
X-OQ-MSGID: <20261020063035.470-1-level_zero@qq.com>
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

From: Yemingxuan <level_zero@qq.com>

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
 drivers/base/bus.c | 26 +
 1 file changed, 5 insertions(+), 2 deletions(-)

--- a/drivers/base/bus.c	2026-10-20 14:29:46.248067968 +0800
+++ b/drivers/base/bus.c	2026-10-20 14:29:46.266034395 +0800
@@ -775,25 +775,28 @@
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

