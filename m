Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687358;
	b=PnvP3DGd7F/DV6dLOxf80bN3rLrcxgw5Cu5s+RPG44mSqQ6F0dOgl5Q+82y1FfMhsyhl
	 Vs0QlaPpWb+K16wxeaCZ9q8fHuh31DVaeRPFJJxMgYLuSaTDAbn2BI6SL8CjzfT4IsLQq
	 KS36vFEa5G11JF9TCWbGkzgijglZJsOTa6aNPLNJNMKRrsc1QJ+pbzc2meODrmYeXKzbV
	 aSt7OBXHSpPDfyKfmnzmZqqk8jr2K9Fc4G859SBwY0F9M1zFUjx48UMAUWJS56L5nfagz
	 Dl8qbYxeDYUqccc92Ivm4u+NhnBWBDQVH/iekLwbE0UhldSZ4tvsCoJV2//ycbv70mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jmbJBLbEKgv9jA5Ot3v67VcMUMs8UAriUTIRE7uFg08=;
	b=xGKy/Exg8D+KTOQeK6gvVHbciS8MU/gEBmrUxU8jRtCfFkPL+BvqEymgJMuKwOyBB8A7
	 xoI/C4RUfnAuZ45WRu278k/EPwO2rvB1fCFd6b3ZG2cggweK+P1J5Uwrf2mtoeaPaKEfC
	 FqLS8RP2Mh+9lNKYVKeCNXCuvDha0MNVrFbFSyTIX/AzIjDyYJzGAahxaYsmFUDsiER3s
	 Pysgww5Z3Am4zY5ya1RZvIzbbmaJXtEReM46UQlOqncLVCA4Fh8iaXicol3S3KbOEa8mj
	 vZhGM8Th4PtkttdY4yaYq3qtTRTyAB6JkI85R/C53n/1wm1rM27ZGXk/CyKNXNHnWRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oXcixrpN;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8A0606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B8A0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oXcixrpN
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1996630f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687345; x=1793292145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmbJBLbEKgv9jA5Ot3v67VcMUMs8UAriUTIRE7uFg08=;
        b=oXcixrpNx5kMQgBtfJVgT37oNmSp4Hg5Pmk0KK+rTuBgHPWyIVd58669NL+hApY68G
         CnUtVpTQwsUdr73YWFbpjGNQtQhfbVC7a1M4D3r5whQmfkcrWnK8a3Xdc0noe+LoF809
         0CItgolz5nI9ojMnOECkNbJCfSzYJmWhmsgCu+87u0Z9DUm9mDFkJE6z20Amc9uV45rC
         IPwnrN1rs6i3xOp9SUP0gW+D2VG4TjywvQJ74a2HpkUALiZ/wcAI8/CGvr5m2F/N6VeR
         5equw/ttobD2mp65N7BYTxWppx4R0ejVBvTj5Y9uU4XovHgG6wrZpJXdLR0hcuGtVhj6
         9CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687345; x=1793292145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmbJBLbEKgv9jA5Ot3v67VcMUMs8UAriUTIRE7uFg08=;
        b=xvi+hvRzs7oiRqLT6mYJWM9qop0saOJDRcu8EfZvZTczQJD7LXeq2NPYFXY+a+TT+n
         op6sdMIxRJuByW7iumKZAobbW23gRAg/bvjSO+y8CbeTEYTOt24oHFT4iWBDWpzlYfPg
         pvKuy+1bZKAesPAPLQfw8XTU4RPKp+HFvFWV62Fz+C0DKQ9U0k31RS7p8NRBVks0oPvr
         9+o6bG8kNz3LBxmb5labdgQD+RbFwH7c5Up+fC3PnoyT6/zu0F6eXVq5Pi4T91d3IjIP
         Mt60wwqiDAOqUJa2V9/Sm+KwWv7YbGTTprsucBlfpzFgvLvaFVWW5hWItiOX1J1UewM4
         GdGg==
X-Forwarded-Encrypted: i=1; AKwUvBwxbAUcnM4lpYZqPK299sCMTT5t+/rFW58pyVVHgxD8NE8S7fTifddGpbt0nED6oxiTwq4yMH6ZNHH/bR0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfCaKkgtOb9dvUxMFpACqbbZ4NYUOJ1As1HJIWV619FEJ65pvD
	Ggv4La8Utf7k3jORJjD8GW2TlnQ422Whu9hE/tG1LUsInOktqz3Ft0BK
X-Gm-Gg: AYBFou246Bme59/+FVcxp3d/XLsL6jrbYaUP/wX+zDJ8ngj7OnJpq9oD4EJQ0Q9YN3n
	HCvGqGHkgzVrx5sKb2t7fchqAxqAk11a+zhSXsAdicU7d+TMimtN26cT8es8F3zkCBG5FX/3bf9
	kJsZtqg6cY/YeYsiqjbtWKxVrvzTEDDgDFRGgrATKs0Fl/0HvegcpNWKi6rpBjqgWl0SX2dqXGE
	dFaM8/IedKFI5W0bI18VnrJ2NmoIwJ297hZ99B45fzd735zc/MNinZ+5PMR7f5qbNmbK2NqcA15
	0UXRkOyxoOLuZVyCOowVCyvzHB/OYPxEDZycAj58wIaAYdIyCp0fr9r2KCYmCrWCI4y/pCS7/BY
	NR2mXcgzNOMn4P1mvyMDw+/6Ng8Uv/LQTREW0FIwyMK/qOAujlAcD89JS/xblWyjpA7HRfOt0Iu
	zZPj265oJfUQjYTM5Ah4wrSTwjaqBbOUu4LiPam/Joc5s6wKwhrdTSA5l8/6rkxcO66q6ge4Jhr
	rRi52N+zd6U7OpwIWX4NwlORjlzGkW2+bGnQrGhD3AvlX2xi07dx2qcXmmC1n2ETw2G6kTl/ARw
	uwVpTA==
X-Received: by 2002:a05:6000:2001:b0:48b:1c:d6e1 with SMTP id ffacd0b85a97d-48e264dd0e4mr12439317f8f.43.1792687344535;
        Thu, 22 Oct 2026 09:42:24 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584c3b0sm15040175f8f.57.2026.10.22.09.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:42:24 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Joonhoe Kim <26rote@gmail.com>,
	Daniel J Blueman <daniel@quora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [RFC PATCH 2/4] soc: qcom: pmic_glink: Report wakeup events on behalf of clients
Date: Thu, 22 Oct 2026 19:41:49 +0300
Message-ID: <20261022164151.592-3-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261022164151.592-1-tvlad744@gmail.com>
References: <20261022164151.592-1-tvlad744@gmail.com>
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

The GLINK interrupt is requested with IRQF_NO_SUSPEND, but it is not a
wakeup interrupt: most PMIC GLINK messages, battery status updates for
one, must not wake up the system. A notification that arrives during
system sleep is now held back until the system has resumed, so the
client sees it too late to report it as a wakeup event.

Decide in pmic_glink, when the notification arrives: it is a wakeup
event if the client's device may wake up the system and the client's
wakeup filter, if the client has set one, accepts it. The client
driver picks the default with device_init_wakeup() or
device_set_wakeup_capable(), and user space can change it through
power/wakeup, like for any other device. Report a hard wakeup event,
so that it also brings the system out of suspend-to-idle.

While a wakeup notification is held back, keep the wakeup source of
the client's device active, so that autosleep, or a suspend started
through /sys/power/wakeup_count, does not put the system back to sleep
before the client has seen it. Release it right before the callback
rather than after it, as the client may keep the same wakeup source
active from there.

Responses are not wakeup events, the client is waiting for them.

Keep the device passed to devm_pmic_glink_client_alloc() in the client
for this, and document the function. No in-tree client enables wakeup
on its device yet, so nothing changes for them.

Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
I used an AI assistant (Claude) for the analysis and to draft this
patch and its description; I reviewed the result. The testing is
described in the cover letter.

 drivers/soc/qcom/pmic_glink.c       | 104 ++++++++++++++++++++++++++--
 include/linux/soc/qcom/pmic_glink.h |   2 +
 2 files changed, 100 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 748b335be6ef..c629df8009e6 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -9,12 +9,14 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeup.h>
 #include <linux/rpmsg.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/pdr.h>
 #include <linux/soc/qcom/pmic_glink.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
+#include <linux/suspend.h>
 #include <linux/workqueue.h>
 
 #define PMIC_GLINK_SEND_TIMEOUT (5 * HZ)
@@ -70,11 +72,15 @@ struct pmic_glink_client {
 	struct list_head node;
 
 	struct pmic_glink *pg;
+	struct device *dev;
 	unsigned int id;
 
 	void (*cb)(const void *data, size_t len, void *priv);
 	void (*pdr_notify)(void *priv, int state);
+	bool (*wakeup_filter)(const void *data, size_t len, void *priv);
 	void *priv;
+
+	bool stay_awake;
 };
 
 struct pmic_glink_deferred_msg {
@@ -83,6 +89,16 @@ struct pmic_glink_deferred_msg {
 	u8 data[] __counted_by(len);
 };
 
+static void pmic_glink_client_relax(struct pmic_glink_client *client)
+{
+	lockdep_assert_held(&client->pg->client_lock);
+
+	if (client->stay_awake) {
+		client->stay_awake = false;
+		pm_relax(client->dev);
+	}
+}
+
 static void _devm_pmic_glink_release_client(struct device *dev, void *res)
 {
 	struct pmic_glink_client *client = (struct pmic_glink_client *)res;
@@ -91,9 +107,26 @@ static void _devm_pmic_glink_release_client(struct device *dev, void *res)
 
 	spin_lock_irqsave(&pg->client_lock, flags);
 	list_del(&client->node);
+	pmic_glink_client_relax(client);
 	spin_unlock_irqrestore(&pg->client_lock, flags);
 }
 
+/**
+ * devm_pmic_glink_client_alloc() - allocate a client of the PMIC GLINK service
+ * @dev:	client device, a child of the pmic_glink device
+ * @id:		owner of the messages for the client
+ * @cb:		called, in atomic context, with each message for the client
+ * @pdr:	called, in atomic context, with the state of the remote service
+ * @priv:	passed to @cb, @pdr and the wakeup filter
+ *
+ * A notification for a client whose @dev may wake up the system, see
+ * device_may_wakeup(), is a wakeup event, unless the wakeup filter of the
+ * client rejects it. Notifications that arrive during system sleep reach @cb
+ * once the system has resumed.
+ *
+ * Return: the client, to be registered with pmic_glink_client_register(), or
+ * an ERR_PTR() on failure.
+ */
 struct pmic_glink_client *devm_pmic_glink_client_alloc(struct device *dev,
 						       unsigned int id,
 						       void (*cb)(const void *, size_t, void *),
@@ -108,6 +141,7 @@ struct pmic_glink_client *devm_pmic_glink_client_alloc(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	client->pg = pg;
+	client->dev = dev;
 	client->id = id;
 	client->cb = cb;
 	client->pdr_notify = pdr;
@@ -120,6 +154,22 @@ struct pmic_glink_client *devm_pmic_glink_client_alloc(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_pmic_glink_client_alloc);
 
+/**
+ * pmic_glink_client_set_wakeup_filter() - select the wakeup notifications
+ * @client:	client from devm_pmic_glink_client_alloc(), not registered yet
+ * @filter:	called, in atomic context, with each notification for the client
+ *		while its device may wake up the system; returns true to wake
+ *		the system up
+ *
+ * Without a filter, every notification for the client is a wakeup event.
+ */
+void pmic_glink_client_set_wakeup_filter(struct pmic_glink_client *client,
+					 bool (*filter)(const void *, size_t, void *))
+{
+	client->wakeup_filter = filter;
+}
+EXPORT_SYMBOL_GPL(pmic_glink_client_set_wakeup_filter);
+
 void pmic_glink_client_register(struct pmic_glink_client *client)
 {
 	struct pmic_glink *pg = client->pg;
@@ -166,6 +216,15 @@ int pmic_glink_send(struct pmic_glink_client *client, void *data, size_t len)
 }
 EXPORT_SYMBOL_GPL(pmic_glink_send);
 
+static bool pmic_glink_is_wakeup_event(struct pmic_glink_client *client,
+				       const void *data, size_t len)
+{
+	if (!device_may_wakeup(client->dev))
+		return false;
+
+	return !client->wakeup_filter || client->wakeup_filter(data, len, client->priv);
+}
+
 static void pmic_glink_dispatch(struct pmic_glink *pg, const void *data, size_t len)
 {
 	const struct pmic_glink_hdr *hdr = data;
@@ -174,8 +233,12 @@ static void pmic_glink_dispatch(struct pmic_glink *pg, const void *data, size_t
 
 	spin_lock_irqsave(&pg->client_lock, flags);
 	list_for_each_entry(client, &pg->clients, node) {
-		if (client->id == le32_to_cpu(hdr->owner))
-			client->cb(data, len, client->priv);
+		if (client->id != le32_to_cpu(hdr->owner))
+			continue;
+
+		/* From here on, the client keeps the system awake if it needs to */
+		pmic_glink_client_relax(client);
+		client->cb(data, len, client->priv);
 	}
 	spin_unlock_irqrestore(&pg->client_lock, flags);
 }
@@ -235,8 +298,11 @@ static void pmic_glink_drop_deferred(struct pmic_glink *pg)
 static int pmic_glink_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 				     int len, void *priv, u32 addr)
 {
+	struct pmic_glink_client *client;
 	struct pmic_glink_hdr *hdr;
 	struct pmic_glink *pg = dev_get_drvdata(&rpdev->dev);
+	bool notification, deferred;
+	unsigned long flags;
 
 	if (len < sizeof(*hdr)) {
 		dev_warn(pg->dev, "ignoring truncated message\n");
@@ -246,11 +312,30 @@ static int pmic_glink_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	hdr = data;
 
 	/* The sender of a request is waiting for the response */
-	if (le32_to_cpu(hdr->type) != PMIC_GLINK_REQ_RESP &&
-	    pmic_glink_defer(pg, data, len))
-		return 0;
+	notification = le32_to_cpu(hdr->type) != PMIC_GLINK_REQ_RESP;
+
+	/* Defer under client_lock, to set stay_awake before it is delivered */
+	spin_lock_irqsave(&pg->client_lock, flags);
+	deferred = notification && pmic_glink_defer(pg, data, len);
+	list_for_each_entry(client, &pg->clients, node) {
+		if (client->id != le32_to_cpu(hdr->owner))
+			continue;
+
+		if (deferred) {
+			if (pmic_glink_is_wakeup_event(client, data, len)) {
+				pm_stay_awake(client->dev);
+				pm_system_wakeup();
+				client->stay_awake = true;
+			}
+			continue;
+		}
+
+		if (notification && pmic_glink_is_wakeup_event(client, data, len))
+			pm_wakeup_hard_event(client->dev);
 
-	pmic_glink_dispatch(pg, data, len);
+		client->cb(data, len, client->priv);
+	}
+	spin_unlock_irqrestore(&pg->client_lock, flags);
 
 	return 0;
 }
@@ -330,6 +415,7 @@ static void pmic_glink_deliver_work(struct work_struct *work)
 {
 	struct pmic_glink *pg = container_of(work, struct pmic_glink, deliver_work);
 	struct pmic_glink_deferred_msg *msg;
+	struct pmic_glink_client *client;
 	unsigned int dropped;
 	unsigned long flags;
 
@@ -354,6 +440,12 @@ static void pmic_glink_deliver_work(struct work_struct *work)
 		kfree(msg);
 	}
 
+	/* Release the clients whose notifications were dropped */
+	spin_lock_irqsave(&pg->client_lock, flags);
+	list_for_each_entry(client, &pg->clients, node)
+		pmic_glink_client_relax(client);
+	spin_unlock_irqrestore(&pg->client_lock, flags);
+
 	pmic_glink_state_notify_clients(pg);
 
 	if (dropped)
diff --git a/include/linux/soc/qcom/pmic_glink.h b/include/linux/soc/qcom/pmic_glink.h
index 7cddf1027752..786d2f35a9a9 100644
--- a/include/linux/soc/qcom/pmic_glink.h
+++ b/include/linux/soc/qcom/pmic_glink.h
@@ -28,6 +28,8 @@ struct pmic_glink_client *devm_pmic_glink_client_alloc(struct device *dev,
 						       void (*cb)(const void *, size_t, void *),
 						       void (*pdr)(void *, int),
 						       void *priv);
+void pmic_glink_client_set_wakeup_filter(struct pmic_glink_client *client,
+					 bool (*filter)(const void *, size_t, void *));
 void pmic_glink_client_register(struct pmic_glink_client *client);
 
 #endif
-- 
2.43.0

