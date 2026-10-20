Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479755;
	b=bn9R3OSwnoEr1yJGxyZCernuwIgIZCvDpxQdRshFOnowkZbKlxnQxWsWIt2yy8wRa3zi
	 vosmhBxCSSclbhSIypJzTJeeOmf8puyx6qMFaGaXhwEIDvPeE10zWPbvM83KvLOk8+K9f
	 bfsgcVnLhFL1rEYIXqpwmGOoPiQ3FRRCdPuFnHNOGzmWcYeMOnsQ+zIeqAoVd2t+QsLVP
	 P0LySbQC9M83m3FMmRSeHUlVeqv+hqPAED2t2xz7o2Bn5QbXyM4F7UMaqOAV048g9D0ve
	 XfiQIqdaVZ1fBumx+63kshHHk19nxk6ZD9rdJmH8Gjlc1FkjWyi6HQKe+gMFEiWU7rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479755;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GlLe684qBU2TCqTPborCtb+yI21EZTLo7weBtfb7Efc=;
	b=bV69uxX5ssnO6Q1LOSwX8kg7omgUDFfls0l/JZPx/2zAOYpVnGQvK/dFXHdOzMP+VTcW
	 4KMIJ3oMAjzJ+oPZM3ndUD4kcq1WyVbOF0in1mSOTL336MIl4qmN7O5h4WHVOaI5xCIQN
	 GrdOw4cjO0W1tvhE0qSiqA6d2DAm7loHr3W8xb+AeNlrFFjjzNebbpmwAdzWaimGQp9A5
	 y7ZKsKRkg9SG9wyWK9WPlWk0hCw1S2CZcl5Gnt+l7PeCEhMnukwApkrInLuBdOeA1GHc1
	 vrrEbFiNDekUFacp03J8M59HgJ1JZn23/2jQyG/q1oEwdQZRbh5RanrEZ46bRs5LWMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=jxGxJqNk;
	arc=none smtp.remote-ip=203.205.221.153
Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39F9606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E39F9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=jxGxJqNk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792479746; bh=GlLe684qBU2TCqTPborCtb+yI21EZTLo7weBtfb7Efc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jxGxJqNkpWaugMfD0VfHM7YkOo41hTAh+WmR8cwYZE2avEF2AmVupTbQoo9Q7g+VR
	 trS9o1JJF+yWgtwWJgUw9B048/kHk/F0V+FquR0iivyTVPQmaNXXGAt47vYR3UQRtX
	 DEaUbJ9roDWyLuvybgZQXUU9eKIobBlM9oTIuKgo=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 96B401E; Tue, 20 Oct 2026 15:02:22 +0800
X-QQ-mid: xmsmtpt1792479742t8825zq39
Message-ID: <tencent_728DF9581669A1255E08547A6CAFE29CC80A@qq.com>
X-QQ-XMAILINFO: MOkJNRSuAOU2svNX5j7S9oeUMqj/CfjxcaeVdW7C1bax7tFHcKJqhyFvhmF4sr
	 sFuKNFfvHzwrX34CESavmM1wQ1yFBuOR/tOou8Zwk/oz3SuOT4Bm08BHx9ycd0pTlCWmixPdrgOW
	 ZCkKYGPLzoshwiqVAV0cHosuj8up1L37oyYse1YAkgx23yihEvkmhhNFyKTuMaZIewoCW8p4tNsA
	 fifPi8rOwcL/PLXFL3yDYJnHEE2KHozPraOloV5x1EQXl/rjID0EOInVbrPcernLf1tILafneMy7
	 +THw3cDwuXIJ8g0Nw7O0ZNpQ9Tc6qVINIFsTDhZAPRUzxCE1AHSkmTgx16BuhwpP24Dqhh6EjeiW
	 6EHUo1kq7l8Tb/gUTrICRHYSAHGZPVg7CUSksKs1X8Gu/2knB6MtLmdL9WdafMx/xRqKTYOP4ZmX
	 pzScyrXDmxS11lMhm2fcl3kH3+5XCcbUDDTWXdbalv9bW6pt5CkuH0p3HCaaFQV7nl23oeMH7AYI
	 etfJkUi0LnJiZy56sXcBZKCbQ/5sQ4I2gvD2EAmtvwnHrlGYEsuzQgLd69JZ/tOZTamPaVcy4SlZ
	 hRVe2H3bEgVmYwwrebXBbQ1EIz+AcQKrMiDNJ/y0Odz5r/Tu6NyK/QqT3i1V5nDBna4oOtgs0JI8
	 5dZ5ZSI8IjHuUZV4VGaqIQONVqjdF7+aevp7QMe/IRmEzjRCktSsXH90kVKqmRSCsRmnVZud5Lxr
	 bJ8xuf4nUY9uypmD6WZR5j9suJulcxJ3nZMCzNAeX8ibJCdWTiZX7PBFJKM9YnTFBXWSH5CmyoEu
	 dKSSYdNrm/YIURG1LPEyKxBtUSw5Cy4kiklR5J7cjRfCP+tn91s7J5kXzOcprC5Sj5gfJ0SIeCzu
	 Yas+2GfowyTa2Rapj1mSsyjqAFhn2fG9cjRk36C6My42mTWJ3sbGsO33dKtx9IptyEQavJoiaaYy
	 a/U3fCaUSPlsqfWEEkrPm4Nz+tjprRr17AYzb0smeUnbNk6o0EKBqjVwWaLrSyzaO2a/mVvRqMml
	 nDa36fPGHSsMoD5/n2o8i4nufbINKFNAX8y30oAnofEMBXxrxwfIiGEnzlASi7Tn05YnfHtgZpJX
	 RS/KLKPnD76xcr4iM=
X-QQ-XMRINFO: NV153Ut7BKVGEBPxNGBppa2DJCr1urzIPw==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v6] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 15:02:22 +0800
X-OQ-MSGID: <20261020070222.6538-1-level_zero@qq.com>
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
 Changes in v6:
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

