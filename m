Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04928492E39
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913875; cv=none; b=MQR5gQ1qDM96bjjc3DVGK4BUirn/nhP6yFCNeGDWfTjqq1f3EP7B0TmY7OC/RCxTqbvQQtfWHapAgyI2cbCgUiu251I3lIA2bfTUxxSfSDXmw/dEYT+q7Eqc5pP1FK8F1zzyzYW5xDFDhVc1HfXf4WpxNddl/8AQDcJ24NWPagA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913875; c=relaxed/simple;
	bh=yZqxjQ8fdgALToubPfisyGu29t7CZxxWw5oRM34RS1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qdzqOzrzNYyLWm02SFWXkqCqIwpNAIqouJwTNFQAo4Zdks3TAe81C2NTepHPRgCvuvu9AYv238IHbp3yRtueK1E5k/8+WjQBe+aovQe/SSwaemtfV3i3C/eyw3hJwiUaQZgh1yD0h4k3SZfSjv0jPkbOM9UQd0c2t0SbYRYNTV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=r+ARNRhf; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pwprrRku; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="r+ARNRhf";
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pwprrRku"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7F8F54E41215
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:51:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 538A660362
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:51:10 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id D20DD11D7183E; Tue, 13 Oct 2026 19:48:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913870; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=MZWIL+2PnnIxORtPMeMG5BPHqe/9YA3Fv4kBuRYMrA0=;
	b=r+ARNRhfxZI9Adgc4FdVo+uNOv1UybO5pG1rjZtYDVXT52O+wxOigsWxPEpLv4nYEe1S2Z
	SA/Ok3rG5K1b0TC0iqXrjXBMXEoXNwRbhTs5o9/X/4pNd8CMrHAH53wuAvt9VV0vNjij+m
	uPY36Qkzokx88JFiWk19YOMb4FlzC1O0qnOL8LdHvmJQxoJd2AtG/LGS4V8WVXnKFz4S+c
	5W1BxY3Y8uzPvys7pmA9UtG7WJAxJ8b3Rp9Mylvh2VIqIpds90AcJCt3dKIAIerGxhjEqh
	ay3CXv4tiKx5Wzu6gadx3QxIsjSo/vZqtSAV4LcvUkmCDtm+C9udMI3wFJ1lgw==
Authentication-Results: mail.galae.net;
	none
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id 2EmzL93uzGof6hAAtaWaaQ
	(envelope-from <herve.codina@bootlin.com>)
	for <herve.codina@bootlin.com>; Mon, 12 Oct 2026 16:29:49 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 114E711D70C1C;
	Mon, 12 Oct 2026 16:29:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791815386; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=MZWIL+2PnnIxORtPMeMG5BPHqe/9YA3Fv4kBuRYMrA0=;
	b=pwprrRkuGlRzuirZZmLKVWh6e4LgDTANTovoi47CK9o+GtjaJVdqrN1cwm/P+QpQDpC08l
	A7oowcQ4AcjWj5Z/FzllTUs3z1Ks9tIAYh4E0K1p31kcQMftZwGUSKArnIKjGP1+fapX4Y
	0XYU3X8A047vaMIq2PBm+Zxe1v2kHzdWDMOjqh+0cSeQdHJpbHJZFNMfFwilumIhvTAyrK
	17Jhb6ihxBQlUhAUyZ5aPuXCI6e3Gam4BR3LYbLNrlACPUX0NHmgfgbZxNvr4OdZBxIaEF
	fcn1jefa21I5RIeJ2lCBnN5NKZVg6XpLpVr5sAi5ucygvrhuihBvoiwTdfUoAg==
From: Herve Codina <herve.codina@bootlin.com>
To: Richard Cheng <icheng@nvidia.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>,
	Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Lizhi Hou <lizhi.hou@amd.com>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v13 07/10] PCI: of: Clear fwnode->dev during root bridge node removal and error path
Date: Mon, 12 Oct 2026 16:28:21 +0200
Message-ID: <20261012142826.159178-8-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012142826.159178-1-herve.codina@bootlin.com>
References: <20261012142826.159178-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: D20DD11D7183E
X-Spamd-Result: default: False [0.32 / 30.00];
	BAYES_HAM(-2.18)[89.08%];
	DATE_IN_PAST(1.00)[27];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,nvidia.com:email,qualcomm.com:email,bootlin.com:mid,bootlin.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	BCC(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[herve.codina@bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[45];
	PREVIOUSLY_DELIVERED(0.00)[herve.codina@bootlin.com];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,lunn.ch,kernel.org,linuxfoundation.org,google.com,opensource.cirrus.com,cirrus.com,linux.intel.com,gmail.com,stgolabs.net,intel.com,zohomail.com,bootlin.com,amd.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com]

During the of_pci_make_host_bridge_node() call, an OF node is created
dynamically and its fwnode device (fwnode->dev) is set to the PCI root
bridge device using the fw_devlink_set_device(&np->fwnode, &bridge->dev)
call.

On removal, of_pci_remove_host_bridge_node() is called and calls
device_remove_of_node() which in turn set to NULL the related
dev->fwnode.

Later in the removal sequence, device_del() is called and runs its
cleanup logic:

    if (dev->fwnode && dev->fwnode->dev == dev)
        fw_devlink_set_device(dev->fwnode, NULL);

Because dev->fwnode has been cleared earlier, fw_devlink_set_device()
is not called and leaves fwnode->dev unchanged. This fwnode device
(fwnode->dev) becomes an dangling pointer.

If any reference to the OF node is held after this removal, the pointer
is still accessible using the OF node (np->fwnode.dev) but points to a
freed area.

The exact same issue is present in the of_pci_make_host_bridge_node()
error path leading to the exact same dangling fwnode->dev.

Avoid this dangling fwnode->dev pointer by clearing it in
of_pci_remove_host_bridge_node() and in of_pci_make_host_bridge_node()
error path.

Fixes: 1f340724419e ("PCI: of: Create device tree PCI host bridge node")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Richard Cheng <icheng@nvidia.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pci/of.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 0f45c5b72458..29b63a9090ae 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -822,6 +822,7 @@ void of_pci_remove_host_bridge_node(struct pci_host_bridge *bridge)
 	if (!np || !of_node_check_flag(np, OF_DYNAMIC))
 		return;
 
+	fw_devlink_set_device(&np->fwnode, NULL);
 	device_remove_of_node(&bridge->bus->dev);
 	device_remove_of_node(&bridge->dev);
 	of_changeset_revert(np->data);
@@ -887,7 +888,7 @@ void of_pci_make_host_bridge_node(struct pci_host_bridge *bridge)
 
 	ret = of_changeset_apply(cset);
 	if (ret)
-		goto out_free_node;
+		goto out_clear_devlink_dev;
 
 	np->data = cset;
 
@@ -909,6 +910,8 @@ void of_pci_make_host_bridge_node(struct pci_host_bridge *bridge)
 out_revert_cset:
 	np->data = NULL;
 	of_changeset_revert(cset);
+out_clear_devlink_dev:
+	fw_devlink_set_device(&np->fwnode, NULL);
 out_free_node:
 	of_node_put(np);
 out_destroy_cset:
-- 
2.55.0

