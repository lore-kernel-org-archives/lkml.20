Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478157;
	b=MKNfKCRtpQWZ9pG0aa7FnIro4V9sA70MQu57j2nYOZzREza8qiffN711qAMPR0H9aHa/
	 HnjCxL16NWEEP+bErdT+IwJNR+UrdCApsGjiDLpgHN+RikIRVfL570I39wegO8WNUQPZq
	 3YPnnv6qvfnPiVAWCG+ZedaWRsSivIvqIqvExH+ciMlHFinVCGHOE2gcEM8PUbo2VwTug
	 PXyp47m4pmYd2+7X6tz2RaA1boFi9IBSWdiCXTnxaVw/rbohs7Tmz4H3k7Dn3tZE8Poew
	 4+/kYzUvP5SN1OSnOPbsfgPwNPo9isi4wc3FVL/gAJnYXeNZAbQNN1DpW6+WYjrR1wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478157;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=izGjOc5EeWGw9wBXvc9FOqdb9EDF4a3wUl8mRE9Dwrk=;
	b=5UugWXxjhj1peah5BxADiCggdnZTE5rgk28iSGYIp3qmWC07fXKapdj9OM56F4lshDB4
	 sVdnSs3qACntbjwsxsA4uzT3+EXNTV7gL0Nb7P4CHC3sXqlasHbwys+IlkviEQEd2GjVI
	 xW7IMfmwnUen9iFMG0qHg9iTj3XPGgYRdZ43IxCijoUGFfHGDKBinRxuGzV+/ik5XfRLv
	 Tk1AOYNVNKt94rUXWqTJ50sUW8wmIVcUqyefEWsdFZdKZV0+sDMRSUAEDSd3/qjZigCc0
	 IlPcmMf9NytNEDEApG1cVOEjlhjCf50EbBKbbOlWiWcHqSjfp87XZwibHHOzaqRCrXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=l5uZChZ9;
	arc=none smtp.remote-ip=203.205.221.239
Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E2606A326
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C4E2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=l5uZChZ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792478146; bh=izGjOc5EeWGw9wBXvc9FOqdb9EDF4a3wUl8mRE9Dwrk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l5uZChZ9wXEBUR09hEFpBzVWmuAIjPNT8QFAhg/vpX5vLISIUt+xkg205trBtmcap
	 4dHgr77aPosacF9ElQuybTvFTbY1kywlYLy6TQnRkdUw1zwmQjPNwlt0ImdfagSxn3
	 QWCcXbFeYA8MuLSuwcnUlMtFnANjyEJgwFv2LZVM=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 8EB1D861; Tue, 20 Oct 2026 14:35:43 +0800
X-QQ-mid: xmsmtpt1792478143tuhe9hw4g
Message-ID: <tencent_4592542B31D15B00CDA368D5E884674CC805@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9rs+sDIduJcGtxQrsivEr8ORPi196ONgnvLSjyJ0CimW1Twufa2
	 wZrqkdZ/6eqD1StDsn9h8RhtZahBNX6SCeXP7g8Kw3oYwt3UNAQbyqgLxdSBa5Va59x6oq5RH8bR
	 p5xmjJH4V58WNdbVSnoiso3BjX5v7R2gUshlNg5G10d5sYsltzbMSWVQoXWYRYP7TtxaZN+WgUHk
	 g5lPl30NwVjGHwZfaeWAnxGJejPUwAvZwSqylMGRIOrEVWfgBO3tPqqR8FTL+EYDTlPAJJ8vsq6x
	 8p85+MKOE9u1VxW2hRaLwEZPjniToolUkO76TRbZBHD3kgrhhhUMS/ncbAvJvKOkFHKzRalhmK42
	 3wFbgzjnbaDfaOeoMRCSiW3w8NqpvzXdiTawOCnoerSH9iPsn8b7jndUD3qTopvSUilBDKni0Jm/
	 8SzYRUFq2/iSVWLPisyVJgtyHvhsC+VLnw7zaJEEwSiYPn07vyonul+DQ+j6mUEtLv72bD51rI47
	 bBGh5u9ivgnUTpAVKH2c/GJ8IxkVTfBQ4AstwkLpxF7YbBIFbup9M3zK4G2OyiR7qrxNBz3D5pmh
	 Txqifz/NIXhqexHRcV4Vp8oFGLjWN0rc8VTlDLRWdNnvXQ78Ceq5nzejeo34RjYuVRRP396fQJJn
	 cM3nn+xWPjPCniwQDarInIAleQ5PgkcgZlBem8vx8J38/Mnf6UrLmwS1z2wZRmfIOG7uokzavnpF
	 VoJ+k0JgMXIUftCXyw/9+/N+v0fV0j5uFwBzGRFzRMlmPVlC6NKkLe3XiIuIlzFdzKEeSnof4cJP
	 Nj69qZ+6/i2NpAIiA2ScAEoMHPw1/A9zxmYUTAYYk/RQWgdROcjM9v589lD75W6DK2YZeFVf2rjQ
	 q7PD4IoAkqHAP3mPN2qR+MAIlhBbf33ZdMWEBWX9CzCbRTwLuatPUbnHp7V2V93dsQs4t8vVXTRE
	 1BpxYYZnqah/3PoTk6LkjtvAWzY+p1XwemsTINjNxT+fgxpxJvzAfDZ9o1yHMjud7cveurBlK0fx
	 V0g/t/BSgBny6/Xk+9OPx897QKVoURerl7JbJuEJIyCpNL/KW3b/b42GHqdHo=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v4] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 14:35:42 +0800
X-OQ-MSGID: <20261020063542.394-1-level_zero@qq.com>
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

