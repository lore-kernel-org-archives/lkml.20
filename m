Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588189;
	b=ebFqvA18melXYHMNp8DUWeTV2pDf2+e0k+YrGDM9BpmPbqDhPkrw/KOxUEV9cF0HaCdC
	 r5IC1Co2kJgeLRRvBEgJePAPdmeTm0WYh5KaqXMqQJ7FIReMgJmHteKME6xLXB3Dr/ssK
	 7w0Q8g1L71h3o+ppj8ieWoExkYQS4D6YdXVrFgNyisBEbCB1aISqOCrdvhvNL5NtX5Z/m
	 /9vVhAJgNveqOLkt3qECgQvtxsfdPr0TJAnQjnsOvAcOsQy1OmrEBWIMdp/c5Q+f7b6k+
	 t/vJPksxVy8jahWbyzht8nUnGWzSQhLcxY5BL8L8oboLczxmN5oVxdfNKlrdGgtQAzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588189;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=gUduWREE8uimErD+JHAl4hb5YFTf7B647K+Gkk9dmUc=;
	b=ysNOeUIFhkb9FBkbS4EKH1gol6KwOA+2YQr10OK2OhfNz8HppNuaHj0b6bFEyQXQGdWL
	 tNSrFGrD3/Dy5Q/MjS1+JJpFjbunuG28cQ5hSk3PPYzwAInQfNj+eLV2mk+I8/mTjvhIa
	 YP18Ku1y+LIh87DxEXwF/94dDYwBvDSl08TP69jSCwfO/n+ktpyvkbUOxJ5nZYeOuYRVw
	 vD2nzrGEkDIipc2FS8nO22i4T9tYPhM9Lx3tmuQsUcTmMiltNfMVdOnDq5niI9DaCcfri
	 dY9wPu1Dz6bE3TwUgRZ1yma4ZR2RcP9lW7ZDuRKrz/8Xncrn6DYT/ftfToUqwCcmUrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=QTq187E2;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C99F606AFC0;
	Fri, 13 Nov 2026 16:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C99F606AFC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=QTq187E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794588180;
	bh=o3e+jRFQVUw9l7ZbyzFtsBneMJ6V2msEfKuxV8ZGQLs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QTq187E28xVYqLrfxoK550wk5gvTW2KEjeQrRSCLZHpYwNMRLpUL11pmnic/IYvJx
	 zAw5ReG1EVA+r+VxDmkku6n7AhYdJFlg5A1GzumnQ6VUiaDLvQmY9hZtchpuIiR+mB
	 VbXVlr3wzNkJv8Hq/njuim0jTmlylNITrLa/S8hCviYvNcrs+mJQH2oHxVLVS7t/jX
	 ZTK9Fc1vq1xwsPkK4GXOz7SM/RGs8Q3a5tjNoah7/zPSPvHguNnadnLmVa/bm3iZma
	 RpJ44741zevo1dakvdoy4DVjhDL0FPXn3wMREyPWVh7OWm+ULH54bd9OcDy6Pw8Qxd
	 WE2JxZfky19fw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A940817E0F7F;
	Fri, 13 Nov 2026 17:43:00 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 647F8480035; Fri, 13 Nov 2026 17:43:00 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Nov 2026 17:42:40 +0100
Subject: [PATCH 4/8] usb: typec: fusb302: switch to devm_pm_set_wake_irq
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
Message-Id: <20261113-fusb302-probe-cleanup-v1-4-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1808;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=o3e+jRFQVUw9l7ZbyzFtsBneMJ6V2msEfKuxV8ZGQLs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3PhQ3TG8mcA9c92UfTHH2+zmxDg18/hdge
 4XzYQeBbz2VkokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9z4UAAoJENju1/PI
 O/qagWUP/3Zjd85vtADNZ/VL9FCcz98+EUDBvMR1jiFY61XG+nTFeLnVTKkyIfkzRIAhT6lBC0a
 3WgMZxf7nYLtOFlDz7S6IfoDrgxJPcNsa02t6OfrcFCweX7BrRpnDA9EtUlXJhSXc+hI0cn/r6H
 JOrvvh/vw1VQn2tmCxG9YADyGhkzt/EczbF7U16okUzPLdiA7PxENEOTGWwEeOk0zhim8ljy4gJ
 4Iraxe1r53/MdE4R92C8gycaU/JT0uAd5tog4ac717OacBB44tULWy0oHohZfNgDfty0mXFAhdw
 usSWGaVTaHBSSsJoHz3xLTWQYfSeCw6ko6rGSOoRmTdYWTGVkgVciH8/shbo/Jyis26NmN8SwWr
 Z0S5PgHbnYRE4M4r6aYEjSQ0AxspLYFYENccj3rv48t8rmhnltYpsF303PnALvuadzmP9Nvzi9o
 x2+5KndFiTZ8NsjCP9GsrNyeSZDXlfwicNfw0zXuz6YBjE8BHZoxLl9hJw6Ad4BNrxmic0+ubDq
 2jn5DnyybYFZJWVvhjI7Lf1AkwpoAL9vo8iCeH8Vc+CQ3R5pDd736IVQ86Szd9h+PdpTQ2kJGPO
 BB7/6ts7+3DZF3GouzIga+b8WchCy0FsB2NzC30mDKHFbXZ5zM7u9BmsdLxlp9n2RYTHVImhkmd
 2rAqGqrTFkvOmvzYnsvAxNg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Use the modern device managed wake IRQ helper provided by the PM layer
instead of directly calling the interrupt wake enable/disable functions.

This results in the wake capability only being enabled once system suspend
is entered as its not supposed to be set while the system is running
normally. Also it now properly reacts to device_may_wakeup().

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index a7a1dce6cf86..8b83414c5819 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -19,6 +19,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/proc_fs.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched/clock.h>
@@ -1804,16 +1805,11 @@ static int fusb302_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	enable_irq_wake(chip->gpio_int_n_irq);
-
-	return ret;
-}
-
-static void fusb302_remove(struct i2c_client *client)
-{
-	struct fusb302_chip *chip = i2c_get_clientdata(client);
+	ret = devm_device_init_wakeup(chip->dev);
+	if (ret)
+		return ret;
 
-	disable_irq_wake(chip->gpio_int_n_irq);
+	return devm_pm_set_wake_irq(chip->dev, chip->gpio_int_n_irq);
 }
 
 static int fusb302_pm_suspend(struct device *dev)
@@ -1870,7 +1866,6 @@ static struct i2c_driver fusb302_driver = {
 		   .of_match_table = of_match_ptr(fusb302_dt_match),
 		   },
 	.probe = fusb302_probe,
-	.remove = fusb302_remove,
 	.id_table = fusb302_i2c_device_id,
 };
 module_i2c_driver(fusb302_driver);

-- 
2.53.0

