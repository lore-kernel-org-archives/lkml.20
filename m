Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792465787;
	b=iOpr8ORoVqh8v1TIxYxR8wE3MnfrOVQrKBO7ageOKv3ekEqVBk6bZTiUVCKNaWcQlrZV
	 GXM6xmU3yEJXHIfDAn/reG9wHpnJIRqZAPXLEud8+yR2gZTDCH68vxJxHkTDexePCKoaX
	 +eCz+zwjM7B9F+rIxEWcsSHfFhuF7O3NDu1hZP7ultYO8HSvV1aQ4oCfY4nupYx1dfljg
	 JK55sHbNIBwJLC1Sq7QzRfFmf0iJCV2tsmXFHY01ptZih7bhtq+/mOhkKXLNr4Kd83Kqe
	 ykA9BwyCAhW0lbrHI9UwG7jJ14z5RC4C/KzraEfYutSO0OX9+owdG8G34sQoj6VD4ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465787;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hx8ZUs2osT32CLoIm+k1ENydU4E6VfLpr8Xnugi22lE=;
	b=U0ZFtvFHJr8uXCsWP5jFjcizMrfY4mNLajTdVdKlZtmvZ3rgdE59oaY/6uvaYOWeP0hX
	 b/qb3NqqOXhWHl/x2uNlEcHTxz/dDxzjlcp9ZVd6lZt0rEKbULAPVUOvkkYpRx6GfQqXo
	 cj/BFSfoW13d/Xbwc24W1o7S6V4PEUU+C/q6y/HNdIzywQ5tprEKP2C4PEnRqZwlAknfq
	 5eH+iAG7sYTKiDc8p20c4NFU6FN/MKOkqWUr4DInelm6cBF6TNxDEHs4CS5LYRtSUReN0
	 fZKTPBEvKkIXEXJynE1izAUf9PZYz6riUnO8sYPdyfwIdq7TTlVVrOf/Poiq1rr1xBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ydTGq7Oi;
	arc=none smtp.remote-ip=203.205.221.149
Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A4760A4ADA
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A4760A4ADA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ydTGq7Oi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792465777; bh=hx8ZUs2osT32CLoIm+k1ENydU4E6VfLpr8Xnugi22lE=;
	h=From:To:Cc:Subject:Date;
	b=ydTGq7OiSeeRmGW/ylJIvfhavoYbyIur+wCd1+zs75vtntVoixoAt6ZrdQJtKAUSc
	 bZJaXbCtNN/73w6pZ57XXQgER2BBnsQH2EKYd+Ss9rJA/qo2kornYAGrYZbplyRJRX
	 vmU1qlgSDPo0Zqvtig4HQN9uIOSK0WpLXXFJH0p8=
Received: from localhost.localdomain ([112.17.237.94])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 262BD6BF; Tue, 20 Oct 2026 11:09:34 +0800
X-QQ-mid: xmsmtpt1792465774tgop9s622
Message-ID: <tencent_454B62AD90C40381288FCAD5C893EC310507@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25G6ppPf3UVlFohnShE16vw1E0hqMxOQ7jAWFTbnCxm65eiM7mFG7
	 vvEq/WrY8TCOeWeBOCLhbp82RB7PHBbByBwfth3wDDh49JyhSdfvr5ZezoyZxWsN8BxS1OOpcryF
	 5UwTIqwR5kg6CmGY++Xm3c0kv8oOPojMMYL0LQrOYoi8uXI7wu0HYvRl+TzYdQgManiWTUMHzU8V
	 1KYgyz+1vWTKmTJQ2KyPxsQVx3cyCY+o9kcbGSHfjajd6sxfrGlgAsc0mUXYNpEg6gGXv9Kwew92
	 a1DH9QRcrcNXQUoKmqFBuHClks4NcAXwEMk06TS5XjEitOWuxfKJH4hTneotw6Sn5lpkBPGvkvKs
	 bDkBWtWx/F45DUamw1s16QYoQaq/Gtq9mFbyAZf+qPhZDhJIU0fpSPiPoytlJohd0tvV5+8MeYz4
	 u6Ful9/rrpHPBxpR6m6+0GQ28IweaS/LZAxHMW/qrZC/uQ9SoVcYLUvyN9tNlr7j3i/n8tYsys09
	 keRFjgm6MDajNnOZhoeCQL4MWT5nlhq3seeMQSrgot5KD/EZwFXPLYbLzLm31kNsh7y/q/ZB1L4t
	 Kxc31uePki6SQKcwsl56Nk3Y/XVzAaqb5uIdedTwlGisQLmafwjBwn2FkRGU/rl1xiJi/qKppOI+
	 F45fb7KteMRfkzCDA/8by7ChBJVvcNjgJ8Zq3jOOoDakBJv/kCFnVpZSY35DONTdrh8JWKZvC9+R
	 OZJNMO/EtmO2dD7jmvPWRrFK+LQboDSB1Nw0OtMmOsZVEXlR5traeRAccgYKCbpm7iHbx93uiAhz
	 9TjtNPFueBmYNVGAjW437jteJ8VFh/DarCQnLzULL7ctlfs/d+izD/+nfur1IWF4yyZzdXFzebLY
	 bXpDJqXb+o3oyXegajGZhLZcBeI49ngx9WOqrUl2gvOV2Vcb5utPWCk7pOVWT3dB1fZAJWiuv7FU
	 AQAIZ2gAXHeMlyq+ol46PgpGq06R/kQNPVsFQM9p6SjBxF/aYO6PPRF04e0Ycxbch5Fk9fPXW5EW
	 oOcyQE2uf5mN6yyIByd8V2PdKsyBjHkVGjoPDdDPU1ZzlRO4eFOuqHW3RzOfpwYLswD4tnPnPvp3
	 K+nYXb70C4+L5+cWW25FXwbqradg==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: level0000x <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	level0000x <level_zero@qq.com>
Subject: [PATCH] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 11:09:34 +0800
X-OQ-MSGID: <20261020030934.401-1-level_zero@qq.com>
X-Mailer: git-send-email 2.34.1
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
driver groups and the bind/unbind files.  When any of these fail it
only prints a message and still returns 0, leaving the driver on the
bus while the sysfs files user space needs to manage it are silently
missing: bind/unbind cannot be used and the uevent attribute cannot be
triggered.  Nothing retries and the caller is told the registration
succeeded.

The device side of the same driver model already gets this right.
device_add() returns failures of the equivalent sysfs operations to
its caller and device_del() undoes each one, and driver_register()
already calls bus_remove_driver() when the group registration after
bus_add_driver() fails.  Commit 85d2b0aa1703 ("module: don't ignore
sysfs_create_link() failures") made the same change to
module_add_driver() a few lines above, so the driver side is now the
only place in this function where a sysfs failure is discarded.

Propagate the errors so the existing unwind runs.  The new
out_remove_module label calls module_remove_driver() before falling
through to out_detach: bus_remove_driver() pairs every operation
bus_add_driver() performs in reverse order, but the symlinks
module_add_driver() creates live in the module's sysfs directory, not
under drv->p->kobj, so the kobject teardown does not remove them.
The attribute and the groups need no explicit removal because they live
under drv->p->kobj, and kobject_cleanup() drops the sysfs directory for
the caller.

These failures are not expected on a working system: driver_ktype
always supplies sysfs_ops, so -EINVAL is unreachable, -EEXIST needs a
bus group to collide with built-in attributes, and -ENOMEM needs
memory pressure.  The point is not a user-visible bug but keeping the
failure diagnosable and the resulting state consistent with the device
side.

Signed-off-by: level0000x <level_zero@qq.com>
---
 drivers/base/bus.c | 27 +++++++++++----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index d17bd91..e5c8a12 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -772,28 +772,23 @@ int bus_add_driver(struct device_driver *drv)
 	}
 
 	error = driver_create_file(drv, &driver_attr_uevent);
-	if (error) {
-		printk(KERN_ERR "%s: uevent attr (%s) failed\n",
-			__func__, drv->name);
-	}
+	if (error)
+		goto out_remove_module;
+
 	error = driver_add_groups(drv, sp->bus->drv_groups);
-	if (error) {
-		/* How the hell do we get out of this pickle? Give up */
-		printk(KERN_ERR "%s: driver_add_groups(%s) failed\n",
-			__func__, drv->name);
-	}
+	if (error)
+		goto out_remove_module;
 
 	if (!drv->suppress_bind_attrs) {
 		error = add_bind_files(drv);
-		if (error) {
-			/* Ditto */
-			printk(KERN_ERR "%s: add_bind_files(%s) failed\n",
-				__func__, drv->name);
-		}
+		if (error)
+			goto out_remove_module;
 	}
 
 	return 0;
 
+out_remove_module:
+	module_remove_driver(drv);
 out_detach:
 	driver_detach(drv);
 out_del_list:
-- 
2.34.1

