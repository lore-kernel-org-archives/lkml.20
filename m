Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588189;
	b=uvsA4FubC7AYL2RZaWWa/0Ouy8RMk9yrI7WaSoF6Wv289137ks5J6m/zgHMvb5OqAGgq
	 l6Y7jlkT++Wto/VMCU1BQj6j0AMXJB6mzObsffyFngoxHZgK51SR1kOQYq/lnspeDGyhl
	 CIyBYRgSvKjSSZE44kQ11KPqM25L2E1rn8/8ILqphS5Hjsrz7cbOHzWCRU5ULJfzIzOBL
	 BIy4ZYB3V9x6XbtwJfvDer7+pUeLmZZxE4bbAi1synMTm1hR7ePZZSdKSr+iSLSBr7vt+
	 LgOq+PRm210z8FPcCn7KlYyL3bRlzj/5IAm/Yua/VTOmbEYaYKrFAQgp2d6ZeSx1rpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588189;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=pkEE+QzVBgT15Zqjrf92OWSogZwDu2RHmoro1Q2SlsA=;
	b=zYw17D3bsJ2PHSAvRwe14zZYQXsuLx1AWXwSI0NYwfU1JPWkHaEcQgnqMyOT6SQl4hz9
	 vuaqcskskt8Tc1Xwtxm4mINhb++X/wygacZwENgHSDlbNlkdgCMzZd2vW1AXz9sKPp+se
	 p4W17eL+HSTI+OgTzSOWvvdx7Q6H9inh3J4th27U34tXzdN6BGd2X10AVCkm+8wXrSDap
	 f15kCvUw/MbIQ8xjbWRNf00eHHQ8li+ex3ZwSBGCUX0ohAb0UJsoCZ96ogLnhd5SfFKuA
	 SdlQNH1AgTrOj4qEfflSdl2lgUfnPEipltG5+qCA5KgwQsrg6U7k8XYuHXWvyAVY5gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=SkK1sHhc;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9DB606BCB3;
	Fri, 13 Nov 2026 16:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9DB606BCB3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=SkK1sHhc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794588180;
	bh=JXwy/eebJOGImzue2Vm26NqH+hFTXYWvFEEQqof62V4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SkK1sHhcrgdeyE5ZD2O3Y/n1U/EX5vSFZA1JYWCQ4s+pIZX+MAQJ6z4s4KSnsHMto
	 WCb4Wij1YUtnCApblfT05yTGS/M+tsrbaVYzfqR+8unqt03ulYbfslUpCFe+6xgybr
	 2ilAMoBZRTtVg1HfEz1rV26XslO9tO4qcHcjZ8ZIVhps83obS0surl7xqehwGutrR1
	 7ohHNKesAMSoW6aMKeM7jJsV7Yi198IWcwNL+lMpt53l0n0K6FwGaNjO9d7tWhTuj7
	 H+oYejvT5nPVtSsQZlnjUfpZtaBFYShSBbgE/YKVcd8dBbkHPx4IfNf9KkpFVazSSU
	 l32ronX4aCXeg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A811E17E0F70;
	Fri, 13 Nov 2026 17:43:00 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 62C86480031; Fri, 13 Nov 2026 17:43:00 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Nov 2026 17:42:39 +0100
Subject: [PATCH 3/8] usb: typec: fusb302: Switch to device managed
 resources
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
Message-Id: <20261113-fusb302-probe-cleanup-v1-3-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6744;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=JXwy/eebJOGImzue2Vm26NqH+hFTXYWvFEEQqof62V4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3PhSATZeH/k/Qp3e8AVMVHi6Pys58c+N8F
 gXZsrpYLIBs4YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9z4UAAoJENju1/PI
 O/qaCHAP/12IogVRMR46ZcPYwnOt5wNn5cSFEem1RkU+ZqCf1riOAc4nLNlgxjSjcyaRtk7H8vE
 0xlP+uJ7UNxr1cFvw+mVGkZw+qePOjgTnEJPHfACQEMrcliCOQ07msYCIZDMydFbMAxaochiTRq
 NqZFa4btLmxiu9BEGCSYXrxPd/Y0tJsEcYEC/RUkSvtuEosCwNMbC/K/9f7dOLUuX3zmd68glvy
 5ZAzL1hhr0VwRmN0/FhjMMlpVVWNkzGCGMGrLl5T5l049b4EAJkrKl+bYPn4i33wiAQ/Iha4XEl
 hWB4Rzl8QlMbELnCzIJ/VictZImRi0lBf/Y9vICRl1OlDpvwC0SGjjoywM/VsL2J1gv3EQdl8/a
 KVUA5NFqgzBj5Zce0tMlYVQLGYYnv8o3dy+iszptqEMp559WrtoAojsrSMZnav4pqMbwWiljigD
 pmyO0xBu98i5TuzfOSnKBbh9gD3znSvDEpPBmsffKrOmQpHMmEFfoDXOAMw0et7DHliSVUVPkzz
 s/b9a6xR5PHcjmFWHNrK3Ay8YputBfmvMGb23GaD8v8+od5dMbqE3GKcdjbNRuKtfkbQrUnykk1
 LbImzsXiJQ5LH3Tq6Tu7te2BtbMDWEAabv3RslvJvu5e+UsfKD7ENE7VbbL42UCFB8Hl5oR6dlj
 40+Rwa1cV4IB+RzeIoBQ3TA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The driver's probe routine is currently mixing registration calls for
device managed resources with unmananged ones. This results in issues
such as resource leaks or use-after-free. Fix this up by fully
converting the driver to device managed resources.

Resource acquisition has been reordered a bit, so that the work is
initialized after the TCPM port is registered as the work uses the
TCPM devices.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 112 ++++++++++++++++++++++-----------------
 1 file changed, 62 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 83bd287dadc7..a7a1dce6cf86 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -8,6 +8,7 @@
 #include <drm/bridge/aux-bridge.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
+#include <linux/devm-helpers.h>
 #include <linux/errno.h>
 #include <linux/extcon.h>
 #include <linux/gpio/consumer.h>
@@ -210,20 +211,28 @@ static int fusb302_debug_show(struct seq_file *s, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(fusb302_debug);
 
-static void fusb302_debugfs_init(struct fusb302_chip *chip)
+static void fusb302_debugfs_exit(void *data)
+{
+	struct fusb302_chip *chip = data;
+
+	debugfs_remove(chip->dentry);
+}
+
+static int fusb302_debugfs_init(struct fusb302_chip *chip)
 {
 	char name[NAME_MAX];
+	int ret;
+
+	ret = devm_mutex_init(chip->dev, &chip->logbuffer_lock);
+	if (ret < 0)
+		return ret;
 
-	mutex_init(&chip->logbuffer_lock);
 	snprintf(name, NAME_MAX, "fusb302-%s", dev_name(chip->dev));
 	chip->dentry = debugfs_create_dir(name, usb_debug_root);
 	debugfs_create_file("log", S_IFREG | 0444, chip->dentry, chip,
 			    &fusb302_debug_fops);
-}
 
-static void fusb302_debugfs_exit(struct fusb302_chip *chip)
-{
-	debugfs_remove(chip->dentry);
+	return devm_add_action_or_reset(chip->dev, fusb302_debugfs_exit, chip);
 }
 
 #else
@@ -231,7 +240,6 @@ static void fusb302_debugfs_exit(struct fusb302_chip *chip)
 static void fusb302_log(const struct fusb302_chip *chip,
 			const char *fmt, ...) { }
 static void fusb302_debugfs_init(const struct fusb302_chip *chip) { }
-static void fusb302_debugfs_exit(const struct fusb302_chip *chip) { }
 
 #endif
 
@@ -1686,6 +1694,13 @@ static struct fwnode_handle *fusb302_fwnode_get(struct device *dev)
 	return fwnode;
 }
 
+static void fusb302_fwnode_put(void *data)
+{
+	struct fusb302_chip *chip = data;
+
+	fwnode_handle_put(chip->tcpc_dev.fwnode);
+}
+
 static int fusb302_probe(struct i2c_client *client)
 {
 	struct fusb302_chip *chip;
@@ -1706,7 +1721,10 @@ static int fusb302_probe(struct i2c_client *client)
 
 	chip->i2c_client = client;
 	chip->dev = &client->dev;
-	mutex_init(&chip->lock);
+
+	ret = devm_mutex_init(dev, &chip->lock);
+	if (ret < 0)
+		return ret;
 
 	/*
 	 * Devicetree platforms should get extcon via phandle (not yet
@@ -1725,67 +1743,68 @@ static int fusb302_probe(struct i2c_client *client)
 	if (IS_ERR(chip->vbus))
 		return PTR_ERR(chip->vbus);
 
-	chip->wq = create_singlethread_workqueue(dev_name(chip->dev));
+	chip->wq = devm_alloc_ordered_workqueue(dev, dev_name(dev), 0);
 	if (!chip->wq)
 		return -ENOMEM;
 
 	spin_lock_init(&chip->irq_lock);
-	INIT_WORK(&chip->irq_work, fusb302_irq_work);
-	INIT_DELAYED_WORK(&chip->bc_lvl_handler, fusb302_bc_lvl_handler_work);
 	init_tcpc_dev(&chip->tcpc_dev);
-	fusb302_debugfs_init(chip);
+
+	ret = fusb302_debugfs_init(chip);
+	if (ret < 0)
+		return ret;
 
 	if (client->irq) {
 		chip->gpio_int_n_irq = client->irq;
 	} else {
 		ret = init_gpio(chip);
 		if (ret < 0)
-			goto destroy_workqueue;
+			return ret;
 	}
 
 	chip->tcpc_dev.fwnode = fusb302_fwnode_get(dev);
 	if (IS_ERR(chip->tcpc_dev.fwnode)) {
 		ret = PTR_ERR(chip->tcpc_dev.fwnode);
-		goto destroy_workqueue;
+		return ret;
 	}
 
+	ret = devm_add_action_or_reset(dev, fusb302_fwnode_put, chip);
+	if (ret < 0)
+		return ret;
+
 	bridge_dev = devm_drm_dp_hpd_bridge_alloc(chip->dev, to_of_node(chip->tcpc_dev.fwnode));
-	if (IS_ERR(bridge_dev)) {
-		ret = dev_err_probe(chip->dev, PTR_ERR(bridge_dev),
-				    "failed to alloc bridge\n");
-		goto fwnode_put;
-	}
+	if (IS_ERR(bridge_dev))
+		return dev_err_probe(chip->dev, PTR_ERR(bridge_dev),
+				     "failed to alloc bridge\n");
 
-	chip->tcpm_port = tcpm_register_port(&client->dev, &chip->tcpc_dev);
-	if (IS_ERR(chip->tcpm_port)) {
-		ret = dev_err_probe(dev, PTR_ERR(chip->tcpm_port),
+	chip->tcpm_port = devm_tcpm_register_port(&client->dev, &chip->tcpc_dev);
+	if (IS_ERR(chip->tcpm_port))
+		return dev_err_probe(dev, PTR_ERR(chip->tcpm_port),
 				    "cannot register tcpm port\n");
-		goto fwnode_put;
-	}
 
-	ret = devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
-	if (ret)
-		goto tcpm_unregister_port;
+	ret = devm_delayed_work_autocancel(dev, &chip->bc_lvl_handler,
+					   fusb302_bc_lvl_handler_work);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_work_autocancel(dev, &chip->irq_work, fusb302_irq_work);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_request_threaded_irq(dev, chip->gpio_int_n_irq, NULL,
+					fusb302_irq_intn,
+					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
+					"fsc_interrupt_int_n", chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to request IRQ");
 
-	ret = request_threaded_irq(chip->gpio_int_n_irq, NULL, fusb302_irq_intn,
-				   IRQF_ONESHOT | IRQF_TRIGGER_LOW,
-				   "fsc_interrupt_int_n", chip);
-	if (ret < 0) {
-		dev_err(dev, "cannot request IRQ for GPIO Int_N, ret=%d", ret);
-		goto tcpm_unregister_port;
-	}
-	enable_irq_wake(chip->gpio_int_n_irq);
 	i2c_set_clientdata(client, chip);
 
-	return 0;
+	ret = devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
+	if (ret)
+		return ret;
 
-tcpm_unregister_port:
-	tcpm_unregister_port(chip->tcpm_port);
-fwnode_put:
-	fwnode_handle_put(chip->tcpc_dev.fwnode);
-destroy_workqueue:
-	fusb302_debugfs_exit(chip);
-	destroy_workqueue(chip->wq);
+	enable_irq_wake(chip->gpio_int_n_irq);
 
 	return ret;
 }
@@ -1795,13 +1814,6 @@ static void fusb302_remove(struct i2c_client *client)
 	struct fusb302_chip *chip = i2c_get_clientdata(client);
 
 	disable_irq_wake(chip->gpio_int_n_irq);
-	free_irq(chip->gpio_int_n_irq, chip);
-	cancel_work_sync(&chip->irq_work);
-	cancel_delayed_work_sync(&chip->bc_lvl_handler);
-	tcpm_unregister_port(chip->tcpm_port);
-	fwnode_handle_put(chip->tcpc_dev.fwnode);
-	destroy_workqueue(chip->wq);
-	fusb302_debugfs_exit(chip);
 }
 
 static int fusb302_pm_suspend(struct device *dev)

-- 
2.53.0

