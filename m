Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8483B27E8;
	Sun,  4 Oct 2026 03:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791085273; cv=none; b=kuzwwH5D3UwtvXwVkyHcE0Wi1oY6t9lP2sC+SxA7khHd5221z3jVOZQeiOgjo4XqY5+DbIQgsS+yL3eAxMxW/hNm7b/GH7CwZsLxKFuMV5LoJhmFah65auhVuZtDUMPhObOdH12mnMJf1wdgVamoDh8CE2C0RDn3mFPf9TGb+Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791085273; c=relaxed/simple;
	bh=VFOZHLNVe7CivKwNQHQ4hk3ShV0xo6IXNZuuHynUDWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W70XI2enH1uk+mvkm8oD3hBCj8MssMa2+IxoJ9qQSIu3w+L5qCKXpYzvX4JHMMSg8F3sLwGfOLwTcuJZeIp4jK2NQq4loRQjdDVfBA9hN0WElhrP64+G6Ch6lTZxzMFGfNqGFvsLw7dAS9Z/r9G+55Rk9G/Snj11f1+zUHC7hAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UY7Rx243; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UY7Rx243"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33968C4AF61;
	Sun,  4 Oct 2026 03:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791085273;
	bh=VFOZHLNVe7CivKwNQHQ4hk3ShV0xo6IXNZuuHynUDWE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UY7Rx243+SsVebEZ6GtYVasVVY+RkH+zriMaCtFu2VAMWS8VNqxr9Pw0MNL76PhKw
	 6V7sddKIIq4FXHV46ZRAHXEnoRY/4JMnzK9lhozkmnUqUGaGtkTkPfF5Lwz1rvTc4d
	 MRFrfhTn4dqAFviYheiGVTChDjs18bpQDQMoBUSZVBlj9R73C1gzGPJfXEjteWtTRc
	 430KUvyY4TDdN5d0h8bTuooPTdTdukTGoGPYJcjdToiLrPSnjqG8jSrTBx8lXb0xd1
	 xjVP3kWj0JyN0nvhul5KTHk3RN3dEVWCBQa3FSyYWeOXEbWUbqD8esTBj3M73YV+Ze
	 O6ccH/npUMavw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19031CA5FEF;
	Sun,  4 Oct 2026 03:41:13 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Sun, 04 Oct 2026 03:41:00 +0000
Subject: [PATCH v2 2/3] usb: typec: tcpci: implement get_current_limit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-max77759-icl-typec-v2-2-866caf9e7d9a@google.com>
References: <20261004-max77759-icl-typec-v2-0-866caf9e7d9a@google.com>
In-Reply-To: <20261004-max77759-icl-typec-v2-0-866caf9e7d9a@google.com>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791085272; l=2824;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=+qaq+7t3Rp2oZzXqAn4cxHrVkhbIPUfQZHvPnSUjXE0=;
 b=TjmKo3s5svN5YNn47GpnnvqpvhPQU+WmXXwgtvL0Sq/NOZc/6QJu5vnoBqHxewItMJTUJAid2
 6Abk/OmrtQ/AI48QThFqBEM3IzJDPb7dN2MOycA7BkuEf+i6LlXGB/4
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com

From: Amit Sunil Dhamne <amitsd@google.com>

Implement a callback for tcpc_dev::get_current_limit. This acts like a
conduit to relay the current limit information from chip level tcpc
drivers.

This does not introduce any functional changes for chip level drivers
that do not implement tcpci_data::get_current_limit.

Assisted-by: LLM
Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 14 ++++++++++++++
 include/linux/usb/tcpci.h      |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 6717ac914c6a..f1bc1ac0a556 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -250,6 +250,19 @@ static int tcpci_get_cc(struct tcpc_dev *tcpc,
 	return 0;
 }
 
+static int tcpci_get_current_limit(struct tcpc_dev *tcpc)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+	int ret;
+
+	if (!tcpci->data->get_current_limit)
+		return 0;
+
+	ret = tcpci->data->get_current_limit(tcpci, tcpci->data);
+
+	return ret < 0 ? 0 : ret;
+}
+
 static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 			      enum typec_cc_polarity polarity)
 {
@@ -861,6 +874,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->tcpc.set_cc = tcpci_set_cc;
 	tcpci->tcpc.apply_rc = tcpci_apply_rc;
 	tcpci->tcpc.get_cc = tcpci_get_cc;
+	tcpci->tcpc.get_current_limit = tcpci_get_current_limit;
 	tcpci->tcpc.set_polarity = tcpci_set_polarity;
 	tcpci->tcpc.set_vconn = tcpci_set_vconn;
 	tcpci->tcpc.start_toggling = tcpci_start_toggling;
diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
index 9b46a6bc762c..580fbdac7ede 100644
--- a/include/linux/usb/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -205,6 +205,11 @@ struct tcpci;
  *		swap following Discover Identity on SOP' occurs.
  *		Return true when the TCPM is allowed to request a Vconn swap
  *		after Discovery Identity on SOP.
+ * @get_current_limit:
+ *		Optional; Called when the port is a sink and CC=Rp-def to obtain
+ *		the current limit. Chip level drivers can implement their own
+ *		detection and return the limit in mA, or 0 when it cannot be
+ *		determined.
  * @set_orientation:
  *		Optional; Enable setting the connector orientation
  *		CONFIG_STANDARD_OUTPUT (0x18) bit0.
@@ -228,6 +233,7 @@ struct tcpci_data {
 					     bool capable);
 	void (*check_contaminant)(struct tcpci *tcpci, struct tcpci_data *data);
 	bool (*attempt_vconn_swap_discovery)(struct tcpci *tcpci, struct tcpci_data *data);
+	int (*get_current_limit)(struct tcpci *tcpci, struct tcpci_data *data);
 };
 
 struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);

-- 
2.56.0.rc1.315.gc6ed9934b7-goog


