Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794477427;
	b=IYX9g/C07NE5HJpWaeeSluBJTs7a+/DayG7M6N+JhY6+FPvcKNWleII6hBrU3NeJhNYV
	 sRi8vqrpA2o05BPtfhOYjA9PQXfP1fYiMNCsoXQjlGuS6AM2Y1nSpxQLiHjfT5ICyV0RJ
	 /kDzLI/d7IT2+fF+CXs9Tf4cS6tMEd+iQy5bIPZCxFD4R20zNfFNlYllj9Tg4J40H/wWQ
	 7KqoLsEH7FabLn81WgW7nYlBVIx3PPTKTbHgFnghuGULC5nMu+U8GOuJ7snL0U5xV6Blv
	 +inDEEk64734bUf/4+qhg/AICIyF5RDoMWa4FTY1C65K5g0hHMLegRVUaAlzUgZymQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477427;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=LWMxaHvej+JAIfe+xnOcYKvqLkgpuN4gboflvAZI5HA=;
	b=SnDnlXJbrl6QUDUDDkL5naAUnscKLElfedw+NZkVnltSAztdclodf77cQEG9mLCVFpVV
	 sXFc9oej/YubGFBbmgxncm3vovX7O7lwpFmLQbpKk2xC9yvyib4UZdVjhEa9q+SGhFeIM
	 7m3Ne0maTXk+xt4njZxt4kRo6L3oiBZ6RJWJSGqfQcWVt1C6pX82ThRAqh9YvVmJS+Aix
	 CFTvAZZdvNLouxQ04HumAz6VSOwrAPoYPM9PxIKbu5CUoA7j/vmpEhqFRyIMhqMagtfrZ
	 +Ha8Yk43Yp4Ze2iU3BUqWiePQZ4kenZyHK28bqB0Q4OMbB0+EV7krDgzMoAi0j0/ZjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYSn78Uo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD67606A327;
	Thu, 12 Nov 2026 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYSn78Uo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794477427;
	b=dZg+NRy6uWHeC6IMDdV+Yx6TtFPXP1xlpTfl69t6KLpMo51p0SXlW9kSPaXDCqaeW0gk
	 Q3Igba/NpVAG9TqUr0jrWd+DagoWVATsskyt68urPXBgXtk/PBQZ6IlJOYTHhyZrqu+er
	 gGERpADUUpRXlMh49soh5YPzC2pxyYSKoTVBjH4+WovVKSbsMjtoNhonPWp2A0ElfOQge
	 fUkr4HAaCXTZTUSKA9P3vuCXCVcBJCT6cAbUbJIJA25GbM8OqrKiNW9sjaZ/b2ohuMyyz
	 zCO3cVkdh8pzqN7ldJ0G9Z8ISpBRBd/hUw0yBdErubmG89as39k2qBHuviTRqkaS5+A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794477427;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=LWMxaHvej+JAIfe+xnOcYKvqLkgpuN4gboflvAZI5HA=;
	b=fisk4GiqJ1Un0SmFIEPnzkGAaX94SeYrVLUzNSrp7ksKq0RZIhSNXddY0demyicOz5dR
	 S42BWsmy+DnDC/17jIKfhOkmqTV+KSZtNFcjDfbgtFNlWm4relOZivt2TgwUqhZu2v79r
	 fp+RQntjr5/un+Pdw0mnuN8L5ZDh3xMzfkM4OSjOs0QEiyxN4IjqFE7Q/ihryd6ndkOmi
	 Ix8x1mJWOHYOUQ9Ly/D58j37NoVo2ykiXuZzv2Qugnsdbcn4/kJaLUjAQMAnCpTcjhVf+
	 FuJje2rsYYVEWASVHybgg6HsA7AHh0uDZlAtvfNJGddcYBmYQFpshP3EBFtelk6DN9g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7E2851F00A05;
	Thu, 12 Nov 2026 09:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794477427;
	bh=LWMxaHvej+JAIfe+xnOcYKvqLkgpuN4gboflvAZI5HA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=QYSn78UoncAZ0xk9xnTCJiMp2EUezsN6pvHE5CZoYh+1mvf2LZRIjSfQeYS00xK4T
	 ONYBCnurXwtHZjvaY+6Xw3gyZDG3hoOeHGilZyOpF7YbvhmNPKNtgzSknRmVVCC/na
	 nTt68ucY8fFWdmAd8OjjAOxYpv6NAwX731papcZim9MLPVqwMrB3q/CFiA+LnDEESG
	 uM6vJ057o7Pe2CSkGlsBry8Q4mx7ilp965KgEID3pE2OcNjSAj/SxeCvv5xogYvsnk
	 fPVBHDTlhuq7//cI2+AHnfaKoGQc0FwLAOcVSnBZOdYtdCJzc4r0MhD//0427JmlMF
	 3YvaLoJKZpkwA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0B20749452;
	Thu, 12 Nov 2026 09:57:06 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 09:57:03 +0000
Subject: [PATCH] thunderbolt: Keep the USB4 port when component_add() fails
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-thunderbolt-v1-1-fc30057cb7cd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAG6N9WoC/yXMSwqEMBBF0a1IjTtgZeBvK+KgY55aIlGSKIK4d
 2P38AzuvSjACwI12UUehwRZXQJ/MuqnrxuhxCaTznXBzFrFaXcW3qxLVKVlmNoUFbimVGweg5y
 /W9v9HXYzo4/vgu77AQjJtbFvAAAA
X-Change-ID: 20261112-thunderbolt-7d1eb9b68e19
To: andreas.noever@gmail.com, YehezkelShB@gmail.com, westeri@kernel.org
Cc: heikki.krogerus@linux.intel.com, linux-kernel@vger.kernel.org, 
 alok.a.tiwari@oracle.com, linux-usb@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794477425; l=4179;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=ki/sIY/g7xSk0EAREsQF/l4ZOt4JaXBRGwX2+sn3T8U=;
 b=4LDAM163qsvP4HlzHvmtX2k/wcdBdvgGPl2BALV8K6VUgwrm8O60yNfau0R9Wemt/4GblZWBS
 JsS/lKdTq63AOy1zQXc/Fcni4Hj6WJIGaJoSNqnGcNBspWJNcnx+0i0
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

When component_add() fails, usb4_port_device_add() unregisters the
device but doesn't return:

    ret = component_add(&usb4->dev, &connector_ops);
    if (ret) {
            dev_err(&usb4->dev, "failed to add component\n");
            device_unregister(&usb4->dev);
    }

The port was registered just before, so device_unregister() normally
drops the last reference and usb4_port_device_release() frees usb4.
The function still goes on to set up runtime PM on usb4->dev and
returns usb4 to usb4_switch_add_ports(), which stores the stale pointer
in port->usb4. When the router is removed later,
usb4_switch_remove_ports() calls component_del() and
device_unregister() on that pointer again.

component_add() can fail on allocation, or when binding the aggregate
driver fails. It isn't common, but when it happens the result is a
use-after-free and a double unregister.

The USB4 port can keep working without the component link. Keep the
port registered when component_add() fails, and track whether the
component was added, so that usb4_port_device_remove() only calls
component_del() for a registered component. Otherwise component_del()
would hit its WARN_ON().

Found with a static analysis tool and checked by hand.

Fixes: 5dddb4169284 ("thunderbolt: Link USB4 ports to their USB Type-C connectors")
Reported-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Closes: https://lore.kernel.org/all/20250622140455.2884518-1-alok.a.tiwari@oracle.com/
Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Alok asked about the missing return in 2025, and a one-line return
patch was posted in May. In both threads Mika said he'd rather keep the
port, so this does that instead.

https://lore.kernel.org/all/20260517142923.80585-1-darknessshayder@gmail.com/

Compile tested only, I didn't try to force component_add() to fail.
---
 drivers/thunderbolt/tb.h        |  2 ++
 drivers/thunderbolt/usb4_port.c | 12 +++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e86845762e22..8ed373e94b65 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -314,6 +314,7 @@ struct tb_port {
  * @can_offline: Does the port have necessary platform support to move
  *		 it into offline mode and back
  * @offline: The port is currently in offline mode
+ * @component_added: The port was added to the component framework
  * @margining: Pointer to margining structure if enabled
  */
 struct usb4_port {
@@ -321,6 +322,7 @@ struct usb4_port {
 	struct tb_port *port;
 	bool can_offline;
 	bool offline;
+	bool component_added;
 #ifdef CONFIG_USB4_DEBUGFS_MARGINING
 	struct tb_margining *margining;
 #endif
diff --git a/drivers/thunderbolt/usb4_port.c b/drivers/thunderbolt/usb4_port.c
index 890de530debc..7582acadf37c 100644
--- a/drivers/thunderbolt/usb4_port.c
+++ b/drivers/thunderbolt/usb4_port.c
@@ -320,11 +320,12 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port)
 		return ERR_PTR(ret);
 	}
 
+	/* The port works fine without the component, so don't fail here */
 	ret = component_add(&usb4->dev, &connector_ops);
-	if (ret) {
-		dev_err(&usb4->dev, "failed to add component\n");
-		device_unregister(&usb4->dev);
-	}
+	if (ret)
+		dev_err(&usb4->dev, "failed to add component: %d\n", ret);
+	else
+		usb4->component_added = true;
 
 	if (!tb_is_upstream_port(port))
 		device_set_wakeup_capable(&usb4->dev, true);
@@ -348,7 +349,8 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port)
  */
 void usb4_port_device_remove(struct usb4_port *usb4)
 {
-	component_del(&usb4->dev, &connector_ops);
+	if (usb4->component_added)
+		component_del(&usb4->dev, &connector_ops);
 	device_unregister(&usb4->dev);
 }
 

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261112-thunderbolt-7d1eb9b68e19

Best regards,
--  
Suyuan Wang <shyckless@gmail.com>


