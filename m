Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919703;
	b=DZfmS1JeQeGAi7qm7ZUmUvvImlX3Zp3h6i+a8547POBKjsUKPir90bh1FvSH0S8xOxXK
	 XH+2+py9/mZQ5fgi1pcWzpMBwTPQpre7PBpp6iLZwqLPZPtXXKu8ct05asRh/dpoT0UVG
	 PwBEOBuUUtHfuU0CSgDZZ1OZY7WimpOvdJI4IU3hzDnnPTciHrLuT/tvzQRcihWUy9l9z
	 oyiTw0ost1z7Q3GQIvZdKh4vWEFJlJaSqgs7RqoFEU2wIXM1I3qEevfDgGTVa6WJub5eh
	 XmZUN7cGn4oAkVeAqZwncfJ//8b2nGQtd4e3vT1fESDRtkc+QP2xr47WPSLzg5nU3ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2SiXGLQeN3KEMpGERiA23styNn8w4+Nkl1zUsSgdBaM=;
	b=QdgYqcXm6Vo71mipDyiKoYHW20JHN/aVdeBOpug2u/irhqtBbCsUJ5gxwwP2dzqHb55l
	 3ThaWTlWcn3sgeEcS7KbL4SQ5Gnl1ngeahMZUH37u+LovNGv9KDm8lkEadYA5lCijNQf8
	 qxkhXOMeLhQQQDLJaYLtZ0IqLsP8L3vdeZCA1iUhUzxlTgWocO3dXopiUwZwDOz1jKuHm
	 Gn8j9EkFBlePTs8mJLZzOC+xmFlw6/9LH2e8iPWRRSvU1+j//rJsq179nvVpCb4t3ROXg
	 tRB4zkjfRcD3lrG/sgDfYYsMotZ5jiGRIbXMPX2ljw5JT0E2C0PSpL55KjSJCRbPLpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b="XR/YNWlP";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BC3606A895
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35BC3606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=XR/YNWlP
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so22471685e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794919700; x=1795524500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2SiXGLQeN3KEMpGERiA23styNn8w4+Nkl1zUsSgdBaM=;
        b=XR/YNWlPn1odi4xRlVpwJ+Tehb6XREdDN1PZFX6j3BCQoFPNqY31Ri2G4ZxXn6fjOY
         c8HTeNBOhARkcclKoODGS+ooufbphk3Q376PM27PQI+D5ayzJs6WSz8ZYAqtk8b9x8dc
         ZXzwnsAiktJPXrD02y9SBQY6Gf5HBqEwUzwbRC82GwkoIKS+CVXpMQzdU5IBbEf0u/UI
         wx5gQctpPpbP3VFKgNIVWotU5Ww5YEF4xuGlYg3+8/Tzl2rdEvfOS2b7n/nP5mYOtvNW
         xQuvKGozL7X+HdsmAcjgmnViCgKZX9d4kdsdjx/M6/lBNKvmbarvl/hx3Jmkg61kvQ2V
         SQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919700; x=1795524500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2SiXGLQeN3KEMpGERiA23styNn8w4+Nkl1zUsSgdBaM=;
        b=r12hwjVppNxUHdlMjItdmYx1gB+Ca6qsrn91mvJ+WCnw91Y7K90eDRmzYfwzlo0qM0
         7Fe9rYp6L4aiicNIEDg7QJ/ZoFOxvOdYxhQ3bdtYZVH5QVSXGTmVEjWDTScxRECZFbf3
         8UYrtyAtE6QrdBbBtYWqdmwLuHmSrHXTglIDFYyruaaUqJ4JXktdanl+wJ0aWSLMzb/S
         pjaI96AH019bqF6Uzulk13AO7BFZAccdMbHWd+e1zv5SOyuCQXSBXz1JRwQa8JNnIxeP
         DKFU0BrbqzLyNNG8OMiPCPhx1kKJb+8AT59GtcUT7hU9Ejl2FcBuEYrfdZkck6RDgz+Q
         Oijw==
X-Forwarded-Encrypted: i=1; AL+hErFfYNn2PYOPhoLFCoJVOS9RAcP2onlD8w3H1oOy9GFG8li5V7cQKUB5GmTlC5zLUo7A1NPBS2KIYw2jR1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Wbi7w/5bcVXx0LaaE3J2eldq2WDV5bBlaQdybWEvj4NO25ovL
	JHodRWogWpDsf9y3JbvnRbBIGaVxuw1xeNRNeWGDvqNUtqisk+Bgxi5xJOz+mlKszX4=
X-Gm-Gg: AYBFou14ubq+aoyZszrDylgJ1gMP+7tVhUsbEmN/9vkrnox/lpwikWtC+6SG72sBx7U
	Stxd6Rfy44eBA2c+Und3S3waBmmpqppiI+q1BtxVGn5YQ/hNhK+nDOMXUzAjYSrr0hwZQX1iJD8
	2cOmXD9bP0Wa0RBl9WHdo6ON6a7ls+hTC6EgfhzxpqXDrkPc0xcC0sYzvy7cvCn0mvYd/OkrJJ4
	Kwd4VfWGOssdKYaTGuwm6Axsy4INTV1gvOMVSfP/UYFcwhwbKmksuofvxnCJs02ARdPnWhN0M9f
	upZ2o14CgAFHzjUdfpjQV8ZitFx5O+ATf+r2xZEzzJhgwLUtS3JCNwguob16v3SSU0beFNN5MXG
	s9JNZ5sNtGG27TtOZUdXko7RgkcciKF1TAnZ4Zyt1aQq10MxIOnwUMypofogBLVyL1o0QgOXt+I
	yUW7nUaJvDx43jaKzltGFmGlW6XV0mBVWYPFhf0bmHliLZOcF1zXZRmvwS47dIV0DqZRJnTIHvC
	yjvZbOKJfi1j+uvxkVCC+YiNHMNCpLKAMZOEEYhFaPMY9ErsiM5BXcKRuqYn8kdgea4NKbhUYsy
	nByLeJs1lbwC1NI/fym/7Y1h5ZLJp39r/qm3aYLUVFQcYZoeIloWZpeWdDYR9WkkRD6mnGM2Yxk
	mEksVPOCkrTxA1D4WxHQU4YHpM47lDqc=
X-Received: by 2002:a05:600c:3487:b0:4a4:f48e:78fa with SMTP id 5b1f17b1804b1-4bb55a4ea9dmr295043135e9.12.1794919700241;
        Tue, 17 Nov 2026 04:48:20 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5f350d51sm124029135e9.4.2026.11.17.04.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:48:19 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Nov 2026 16:48:09 +0400
Subject: [PATCH v3 3/3] usb: gadget: udc: Decide on connecting in one place
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
Message-Id: <20261117-udc-connect-v3-3-9413b491d213@flipper.net>
References: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
In-Reply-To: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=16025; i=alchark@flipper.net;
 h=from:subject:message-id; bh=CnL664T+gCBhRtyxe1MGp9ADeZAmN8v5sEm4nKb2e4Y=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWT98eV+Weha7l41s8Rh276l17bsWK92r4tf+NmfU8Z5z
 EESX3VVOiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqk4sYGc6nT3pn5qZnZjbntrK6+cWm75Nee65z7Crrl9jx1iEo4ibDf6dg0aC
 /f9u+L9CNsZHTtTikav7wYGDn09SjZWozQzR7uAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The UDC core connects or disconnects the gadget on bind and unbind, on
VBUS events, in usb_gadget_{de,}activate() and through soft_connect,
each by its own rules. gadget->connected means both "the pullup is on"
and "turn it on once possible", so the paths misread each other's state.
soft_connect also starts and stops the UDC behind the gadget driver's
back, and its "connect" overrides VBUS and deactivation.

Allow the gadget to connect only while a driver is bound, VBUS is
present, the driver hasn't deactivated it and userspace hasn't
disconnected it, and re-evaluate that in one helper whenever any of
these changes. Let gadget->connected track only the pullup, as UDC
drivers already assume, and clear it at unbind even if the pullup
refuses to switch off, so that the next driver starts clean. That
supersedes the clearing on UDC start from the previous patch.

Reduce soft_connect to a disconnect request that is forgotten at unbind
like the deactivation, and leave the controller alone: the attribute is
documented to control the pullup. Keep the request if the pullup fails
to follow, so that the next update retries it, and warn about such
failures, as nothing else tells the user.

Treat a UDC without a pullup control as having nothing to switch.
Binding one has most likely failed with -EOPNOTSUPP since
commit 0ea39e030a80 ("usb: gadget: udc: Handle gadget_connect failure
during bind operation"), but I have no affected hardware to confirm it.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/gadget/udc/core.c | 217 ++++++++++++++++++++++--------------------
 include/linux/usb/gadget.h    |   4 +-
 2 files changed, 117 insertions(+), 104 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 449b303c2f81..496083045a99 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -38,14 +38,19 @@ static const struct bus_type gadget_bus_type;
  * @vbus: for udcs who care about vbus status, this value is real vbus status;
  * for udcs who do not care about vbus status, this value is always true
  * @started: the UDC's started state. True if the UDC had started.
- * @allow_connect: Indicates whether UDC is allowed to be pulled up.
- * Set/cleared by gadget_(un)bind_driver() after gadget driver is bound or
- * unbound.
+ * @bound: True while a gadget driver is bound and the UDC is started for it.
+ * @soft_disconnected: True if userspace has disconnected the gadget through
+ * the soft_connect attribute. Forgotten when the gadget driver unbinds.
+ * @allow_connect: True if the gadget may connect to the host: a gadget driver
+ * is bound, VBUS is present, the driver hasn't deactivated the gadget, and
+ * userspace hasn't disconnected it. Only usb_udc_update_allow_connect() sets
+ * it, and usb_udc_update_connection_locked() connects or disconnects the
+ * gadget to match.
  * @vbus_work: work routine to handle VBUS status change notifications.
- * @connect_lock: protects udc->started, gadget->connect,
- * gadget->allow_connect and gadget->deactivate. The routines
+ * @connect_lock: protects udc->started, udc->bound, udc->soft_disconnected,
+ * udc->allow_connect, gadget->connected and gadget->deactivated. The routines
  * usb_gadget_connect_locked(), usb_gadget_disconnect_locked(),
- * usb_udc_connect_control_locked(), usb_gadget_udc_start_locked() and
+ * usb_udc_update_connection_locked(), usb_gadget_udc_start_locked() and
  * usb_gadget_udc_stop_locked() are called with this lock held.
  *
  * This represents the internal data structure which is used by the UDC-class
@@ -59,6 +64,8 @@ struct usb_udc {
 	struct list_head		list;
 	bool				vbus;
 	bool				started;
+	bool				bound;
+	bool				soft_disconnected;
 	bool				allow_connect;
 	struct work_struct		vbus_work;
 	struct mutex			connect_lock;
@@ -710,28 +717,24 @@ static int usb_gadget_connect_locked(struct usb_gadget *gadget)
 {
 	int ret = 0;
 
-	if (!gadget->ops->pullup) {
-		ret = -EOPNOTSUPP;
-		goto out;
-	}
-
-	if (gadget->connected)
+	/*
+	 * If the gadget may not connect yet, usb_udc_update_connection_locked()
+	 * will connect it once it may.
+	 */
+	if (gadget->connected || !gadget->udc->allow_connect)
 		goto out;
 
-	if (gadget->deactivated || !gadget->udc->allow_connect || !gadget->udc->started) {
-		/*
-		 * If the gadget isn't usable (because it is deactivated,
-		 * unbound, or not yet started), we only save the new state.
-		 * The gadget will be connected automatically when it is
-		 * activated/bound/started.
-		 */
-		gadget->connected = true;
+	if (!gadget->ops->pullup) {
+		ret = -EOPNOTSUPP;
 		goto out;
 	}
 
 	ret = gadget->ops->pullup(gadget, 1);
 	if (!ret)
 		gadget->connected = 1;
+	else if (ret != -EOPNOTSUPP)
+		dev_warn(&gadget->udc->dev, "failed to enable the pullup: %d\n",
+			 ret);
 
 out:
 	trace_usb_gadget_connect(gadget, ret);
@@ -747,6 +750,10 @@ static int usb_gadget_connect_locked(struct usb_gadget *gadget)
  * enumerating this gadget when the pullup is active and a VBUS session
  * is active (the link is powered).
  *
+ * Does nothing while the gadget may not connect: no gadget driver is bound,
+ * VBUS is absent, the gadget is deactivated or userspace has disconnected it.
+ * The UDC core connects the gadget by itself once all of that changes.
+ *
  * Returns zero on success, else negative errno.
  */
 int usb_gadget_connect(struct usb_gadget *gadget)
@@ -766,26 +773,20 @@ static int usb_gadget_disconnect_locked(struct usb_gadget *gadget)
 {
 	int ret = 0;
 
-	if (!gadget->ops->pullup) {
-		ret = -EOPNOTSUPP;
-		goto out;
-	}
-
 	if (!gadget->connected)
 		goto out;
 
-	if (gadget->deactivated || !gadget->udc->started) {
-		/*
-		 * If gadget is deactivated we only save new state.
-		 * Gadget will stay disconnected after activation.
-		 */
-		gadget->connected = false;
+	if (!gadget->ops->pullup) {
+		ret = -EOPNOTSUPP;
 		goto out;
 	}
 
 	ret = gadget->ops->pullup(gadget, 0);
 	if (!ret)
 		gadget->connected = 0;
+	else if (ret != -EOPNOTSUPP)
+		dev_warn(&gadget->udc->dev, "failed to disable the pullup: %d\n",
+			 ret);
 
 	mutex_lock(&udc_lock);
 	if (gadget->udc->driver)
@@ -809,6 +810,10 @@ static int usb_gadget_disconnect_locked(struct usb_gadget *gadget)
  * Following a successful disconnect, invoke the ->disconnect() callback
  * for the current gadget driver so that UDC drivers don't need to.
  *
+ * The gadget stays disconnected until usb_gadget_connect() is called or the
+ * UDC core connects it again on the next change of VBUS, binding, activation
+ * or soft_connect.
+ *
  * Returns zero on success, else negative errno.
  */
 int usb_gadget_disconnect(struct usb_gadget *gadget)
@@ -823,6 +828,34 @@ int usb_gadget_disconnect(struct usb_gadget *gadget)
 }
 EXPORT_SYMBOL_GPL(usb_gadget_disconnect);
 
+static void usb_udc_update_allow_connect(struct usb_udc *udc)
+	__must_hold(&udc->connect_lock)
+{
+	udc->allow_connect = udc->bound && udc->vbus &&
+			     !udc->gadget->deactivated &&
+			     !udc->soft_disconnected;
+}
+
+/*
+ * Decide whether the gadget may connect and connect or disconnect it to match.
+ * Call this after changing any of the state that
+ * usb_udc_update_allow_connect() checks.
+ */
+static int usb_udc_update_connection_locked(struct usb_udc *udc)
+	__must_hold(&udc->connect_lock)
+{
+	usb_udc_update_allow_connect(udc);
+
+	/* Without a pullup control there is nothing to switch */
+	if (!udc->gadget->ops->pullup)
+		return 0;
+
+	if (udc->allow_connect)
+		return usb_gadget_connect_locked(udc->gadget);
+
+	return usb_gadget_disconnect_locked(udc->gadget);
+}
+
 /**
  * usb_gadget_deactivate - deactivate function which is not ready to work
  * @gadget: the peripheral being deactivated
@@ -845,18 +878,13 @@ int usb_gadget_deactivate(struct usb_gadget *gadget)
 	if (gadget->deactivated)
 		goto unlock;
 
-	if (gadget->connected) {
-		ret = usb_gadget_disconnect_locked(gadget);
-		if (ret)
-			goto unlock;
-
-		/*
-		 * If gadget was being connected before deactivation, we want
-		 * to reconnect it in usb_gadget_activate().
-		 */
-		gadget->connected = true;
-	}
 	gadget->deactivated = true;
+	ret = usb_udc_update_connection_locked(gadget->udc);
+	if (ret) {
+		/* Still connected, so stay active */
+		gadget->deactivated = false;
+		usb_udc_update_allow_connect(gadget->udc);
+	}
 
 unlock:
 	mutex_unlock(&gadget->udc->connect_lock);
@@ -871,7 +899,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_deactivate);
  * @gadget: the peripheral being activated
  *
  * This routine activates gadget which was previously deactivated with
- * usb_gadget_deactivate() call. It calls usb_gadget_connect() if needed.
+ * usb_gadget_deactivate() call, and connects it if it may connect.
  *
  * This routine may sleep; it must not be called in interrupt context.
  *
@@ -886,15 +914,7 @@ int usb_gadget_activate(struct usb_gadget *gadget)
 		goto unlock;
 
 	gadget->deactivated = false;
-
-	/*
-	 * If gadget has been connected before deactivation, or became connected
-	 * while it was being deactivated, we call usb_gadget_connect().
-	 */
-	if (gadget->connected) {
-		gadget->connected = false;
-		ret = usb_gadget_connect_locked(gadget);
-	}
+	ret = usb_udc_update_connection_locked(gadget->udc);
 
 unlock:
 	mutex_unlock(&gadget->udc->connect_lock);
@@ -1147,21 +1167,12 @@ EXPORT_SYMBOL_GPL(usb_gadget_set_state);
 
 /* ------------------------------------------------------------------------- */
 
-/* Acquire connect_lock before calling this function. */
-static int usb_udc_connect_control_locked(struct usb_udc *udc) __must_hold(&udc->connect_lock)
-{
-	if (udc->vbus)
-		return usb_gadget_connect_locked(udc->gadget);
-	else
-		return usb_gadget_disconnect_locked(udc->gadget);
-}
-
 static void vbus_event_work(struct work_struct *work)
 {
 	struct usb_udc *udc = container_of(work, struct usb_udc, vbus_work);
 
 	mutex_lock(&udc->connect_lock);
-	usb_udc_connect_control_locked(udc);
+	usb_udc_update_connection_locked(udc);
 	mutex_unlock(&udc->connect_lock);
 }
 
@@ -1175,12 +1186,12 @@ static void vbus_event_work(struct work_struct *work)
  * according to vbus status.
  *
  * This function can be invoked from interrupt context by irq handlers of
- * the gadget drivers, however, usb_udc_connect_control() has to run in
- * non-atomic context due to the following:
+ * the gadget drivers, however, usb_udc_update_connection_locked() has to run
+ * in non-atomic context due to the following:
  * a. Some of the gadget driver implementations expect the ->pullup
  * callback to be invoked in non-atomic context.
  * b. usb_gadget_disconnect() acquires udc_lock which is a mutex.
- * Hence offload invocation of usb_udc_connect_control() to workqueue.
+ * Hence offload invocation of usb_udc_update_connection_locked() to workqueue.
  */
 void usb_udc_vbus_handler(struct usb_gadget *gadget, bool status)
 {
@@ -1236,16 +1247,8 @@ static inline int usb_gadget_udc_start_locked(struct usb_udc *udc)
 	}
 
 	ret = udc->gadget->ops->udc_start(udc->gadget, udc->driver);
-	if (!ret) {
+	if (!ret)
 		udc->started = true;
-		/*
-		 * The pullup is never enabled while the UDC is stopped, so any
-		 * connection recorded meanwhile was only a request. Forget it,
-		 * so that the next usb_gadget_connect_locked() enables the
-		 * pullup rather than returning early.
-		 */
-		udc->gadget->connected = false;
-	}
 
 	return ret;
 }
@@ -1679,8 +1682,8 @@ static int gadget_bind_driver(struct device *dev)
 		goto err_start;
 	}
 	usb_gadget_enable_async_callbacks(udc);
-	udc->allow_connect = true;
-	ret = usb_udc_connect_control_locked(udc);
+	udc->bound = true;
+	ret = usb_udc_update_connection_locked(udc);
 	if (ret)
 		goto err_connect_control;
 
@@ -1690,7 +1693,8 @@ static int gadget_bind_driver(struct device *dev)
 	return 0;
 
  err_connect_control:
-	udc->allow_connect = false;
+	udc->bound = false;
+	usb_udc_update_allow_connect(udc);
 	usb_gadget_disable_async_callbacks(udc);
 	if (gadget->irq)
 		synchronize_irq(gadget->irq);
@@ -1726,21 +1730,31 @@ static void gadget_unbind_driver(struct device *dev)
 
 	dev_dbg(&udc->dev, "unbinding gadget driver [%s]\n", driver->function);
 
-	udc->allow_connect = false;
-	cancel_work_sync(&udc->vbus_work);
 	mutex_lock(&udc->connect_lock);
-	usb_gadget_disconnect_locked(gadget);
+	udc->bound = false;
+	usb_udc_update_connection_locked(udc);
+	/*
+	 * The UDC stops below even if the pullup refused to switch off (some
+	 * UDCs refuse without VBUS), so treat the gadget as disconnected from
+	 * now on. Neither a late VBUS event nor the next driver's bind should
+	 * act on a connection that ends with this driver.
+	 */
+	gadget->connected = false;
 	usb_gadget_disable_async_callbacks(udc);
 	if (gadget->irq)
 		synchronize_irq(gadget->irq);
 	mutex_unlock(&udc->connect_lock);
 
+	/* A VBUS event can no longer connect the gadget, so just wait it out */
+	cancel_work_sync(&udc->vbus_work);
+
 	udc->driver->unbind(gadget);
 
 	mutex_lock(&udc->connect_lock);
 	usb_gadget_udc_stop_locked(udc);
 	/* The next gadget driver decides on its own deactivation */
 	gadget->deactivated = false;
+	udc->soft_disconnected = false;
 	mutex_unlock(&udc->connect_lock);
 
 	mutex_lock(&udc_lock);
@@ -1820,35 +1834,34 @@ static ssize_t soft_connect_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t n)
 {
 	struct usb_udc		*udc = container_of(dev, struct usb_udc, dev);
-	ssize_t			ret;
-
-	device_lock(&udc->gadget->dev);
-	if (!udc->driver) {
-		dev_err(dev, "soft-connect without a gadget driver\n");
-		ret = -EOPNOTSUPP;
-		goto out;
-	}
+	bool			disconnect;
 
 	if (sysfs_streq(buf, "connect")) {
-		mutex_lock(&udc->connect_lock);
-		usb_gadget_udc_start_locked(udc);
-		usb_gadget_connect_locked(udc->gadget);
-		mutex_unlock(&udc->connect_lock);
+		disconnect = false;
 	} else if (sysfs_streq(buf, "disconnect")) {
-		mutex_lock(&udc->connect_lock);
-		usb_gadget_disconnect_locked(udc->gadget);
-		usb_gadget_udc_stop_locked(udc);
-		mutex_unlock(&udc->connect_lock);
+		disconnect = true;
 	} else {
 		dev_err(dev, "unsupported command '%s'\n", buf);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
-	ret = n;
-out:
-	device_unlock(&udc->gadget->dev);
-	return ret;
+	guard(mutex)(&udc->connect_lock);
+
+	if (!udc->bound) {
+		dev_err(dev, "soft-connect without a gadget driver\n");
+		return -EOPNOTSUPP;
+	}
+
+	/*
+	 * "connect" only lifts the disconnect, it doesn't override VBUS etc.
+	 * The request stands even if the pullup fails to follow it, which
+	 * usb_gadget_{dis,}connect_locked() warn about, and the next update
+	 * retries it.
+	 */
+	udc->soft_disconnected = disconnect;
+	usb_udc_update_connection_locked(udc);
+
+	return n;
 }
 static DEVICE_ATTR_WO(soft_connect);
 
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 8285b19a25e0..53ace954d189 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -412,8 +412,8 @@ struct usb_gadget_ops {
  *	u_ether.c to improve performance.
  * @is_selfpowered: if the gadget is self-powered.
  * @deactivated: True if gadget is deactivated - in deactivated state it cannot
- *	be connected.
- * @connected: True if gadget is connected.
+ *	be connected. Cleared when the gadget driver unbinds.
+ * @connected: True if the gadget's pullup is enabled.
  * @lpm_capable: If the gadget max_speed is FULL or HIGH, this flag
  *	indicates that it supports LPM as per the LPM ECN & errata.
  * @wakeup_capable: True if gadget is capable of sending remote wakeup.

-- 
2.56.0

