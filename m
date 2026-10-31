Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793458934;
	b=x2/VLqtvpjYyDUQ/USR8fCeIimhDdbNNTRwKdV6Yv637vNrrdb+CeS3vINkm6w+Z5VvQ
	 mFZGIA1L8QhgoFVI9tXTuwc5UwdhC4SlFZDa4EmFucIBv4mALF9OuQNokk7q/vpoCSlha
	 AbC7s+mFKU05k9xSpgxC/fBh4wcEuGHTI8TAoHpxskBuolaT4R6vEAzoZwOIMtWfD47cz
	 XxzGlo6mytYXCww2QG17gF5GCIgC60nrGpu25OXX87Jio5NRUeMec1D4a74mFLgvyKNmm
	 ZvrjD5w2BF3E+sNx9o/JIHaLT6Ir4qcbzJ2RDA4+DVQNj8FwqgCfgh/5Z9lmMHfcetQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793458934;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=JUxJjhEtvP7WeJ6Jsj90/IFWoULfK5gQeeG2k1Wfx34=;
	b=1jyz4MtmSsOeYCL6DnYg8+HY+kGrVzEntJgpKFf8a+bh3dWxJ9yqWZYaoVaoR8TMwz6e
	 dzzfdQqN2VZVIOZpg05q5dIffYT4eLfgeOo8zPw68noedcQfhG3xjpQRwZ9Imv9SrLAv1
	 t/7O9H2QGWwUiunIh1jpz7cMfNQq9sxTD4jp7rY1ZHq6NHRjwnlzaR0uNgwSMKPz2Jq9s
	 Kk892H4/yZ7AvTSfrh2XKAVmQK5gVikspW+jvjUvXulMtWY2CjnxkvujvsgRbwb8cPp+9
	 j2H+j1kCNkOdrE1/RUP6lnHOgmDGbX6dqr2sT6LMczhAW5t1lfFzYuKRDqP4pAw8fpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=EglOeDb9;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389CB606A31D;
	Sat, 31 Oct 2026 15:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 389CB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=EglOeDb9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=JUxJjhEtvP7WeJ6Jsj90/IFWoULfK5gQee
	G2k1Wfx34=; b=EglOeDb9IiGdW1/3qWOdt4P9Lu6YiQuv6eYjOvd5N07tfj24tp
	8HGIVpZG5AJC9Sr+5XoqTjOmwoJYraLEK5MtFIlOtnm6IOvatNXd+Db23/8c2eUt
	HK5rMo6M8gCJ7h/lPxqcpC1wosYC0x87PIFK40yxejhHWT93D88WVJh44=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3uDziAuZqpyJvAA--.1475S4;
	Sat, 31 Oct 2026 23:01:58 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] usb: dwc3: fix the two-connector shared HS bus role handling
Date: Sat, 31 Oct 2026 23:01:54 +0800
Message-ID: <20261031150154.1106455-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031150154.1106455-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261031150154.1106455-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgA3uDziAuZqpyJvAA--.1475S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Zr48JF18JryrJFW3uF13XFb_yoWkAF4UpF
	WjgrsxK3ykXrZagws7Aa1UX3yFkan7Jry7JrW3Gw1xCr45WrWktFy8Gr9xuFyjkFn3JryY
	9r47GrWkCFsrW3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4
	AK67AK6ryrMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
	0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07b4
	VysUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARERB2rk8FYreQA0sI

A controller whose High Speed data lines are shared by two connectors
selects one of them with port-select-gpios and gives each connector its
own role switch.  The first version of that code deadlocks on the first
role change and mislays several pieces of state; fix it in place.

  - dwc3_mux_role_set() called dwc3_set_mode() while holding dwc->lock,
    and dwc3_set_mode() takes dwc->lock itself.  Deciding the request and
    issuing it are now paired by mux->lock, and dwc->lock is only held
    while the individual fields are updated.

  - the same function never notified the glue layer.  Call
    dwc3_pre_set_role() with the effective role, outside spinlocks,
    before dwc3_set_mode(), like the single-connector path does.

  - dwc3_mux_role_get() returned USB_ROLE_NONE for a connector that did
    not own the data path, hiding its pending request.  Connector drivers
    therefore never sent the set_role(USB_ROLE_NONE) that clears it, and
    the stale request kept winning dwc3_role_mux_pick() after the
    connector was unplugged.  Report the role the connector requested.

  - a same-role request that moves the data path to the other connector
    reinitialises the controller, but dwc3_set_prtcap() only clears
    SUSPHY when PRTCAP changes.  Clear it explicitly for that case.

  - the endpoint fwnode references were taken before dwc->role_mux was
    assigned, so the error paths leaked them: dwc3_role_mux_exit() is a
    no-op while dwc->role_mux is NULL.  Publish the mux first.

  - the role switches were registered before the initial mode request was
    issued, so a connector driver probing in that window could have its
    request silently overwritten.  Register and request the initial mode
    under mux->lock, and tear down in the reverse order on failure.

  - the sticky mux->error value was reported to whichever connector called
    set() next, after that call had already committed its own request.
    Drop it; a data-path switch failure is logged and counted per
    connector instead.

While at it, usb_role_switch_at_endpoint() swallowed the -EPROBE_DEFER
returned for a graph endpoint whose switch is not registered yet, turning
it into "this connector has no role switch".  Pass it up.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/usb/dwc3/core.c   | 36 ++++++++++++++++------
 drivers/usb/dwc3/core.h   |  4 +--
 drivers/usb/dwc3/drd.c    | 65 ++++++++++++++++++++++++++++++---------
 drivers/usb/roles/class.c |  7 ++++-
 4 files changed, 85 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 6607e65e84..da609a011d 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -168,6 +168,7 @@ static void __dwc3_set_mode(struct work_struct *work)
 	struct dwc3 *dwc = work_to_dwc(work);
 	struct dwc3_role_mux *mux = dwc->role_mux;
 	unsigned long flags;
+	bool port_switch;
 	int mux_port = 0;
 	int ret;
 	u32 reg;
@@ -189,8 +190,14 @@ static void __dwc3_set_mode(struct work_struct *work)
 	if (!desired_dr_role)
 		goto out;
 
-	if (desired_dr_role == dwc->current_dr_role &&
-	    (!mux || mux_port == mux->active_port))
+	/*
+	 * Moving the shared data path to the other connector is a mode switch even
+	 * when the role does not change: the running host or gadget instance has to
+	 * be torn down while its own data lines are still selected.
+	 */
+	port_switch = mux && mux_port != mux->active_port;
+
+	if (desired_dr_role == dwc->current_dr_role && !port_switch)
 		goto out;
 
 	if (desired_dr_role == DWC3_GCTL_PRTCAP_OTG && dwc->edev)
@@ -246,22 +253,33 @@ static void __dwc3_set_mode(struct work_struct *work)
 	 * the controller would be left with a torn-down role and a stale
 	 * current_dr_role, which the next request would tear down a second time.
 	 */
-	if (mux && mux_port != mux->active_port) {
+	if (port_switch) {
 		ret = gpiod_direction_output(mux->select, mux_port);
-		if (ret) {
-			WRITE_ONCE(mux->error, ret);
+		if (ret)
 			dev_err_ratelimited(dwc->dev,
 					    "failed to select USB port %d: %d\n",
 					    mux_port, ret);
-		} else {
-			spin_lock_irqsave(&dwc->lock, flags);
+
+		spin_lock_irqsave(&dwc->lock, flags);
+		if (ret)
+			mux->ports[mux_port].errors++;
+		else
 			mux->active_port = mux_port;
-			spin_unlock_irqrestore(&dwc->lock, flags);
-		}
+		spin_unlock_irqrestore(&dwc->lock, flags);
 	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 
+	/*
+	 * dwc3_set_prtcap() only clears GUSB3PIPECTL.SUSPENDENABLE and
+	 * GUSB2PHYCFG.SUSPHY when PRTCAP actually changes, but a same-role port
+	 * switch reinitialises the controller too and must start from the same
+	 * state: the instance created below would otherwise inherit the SUSPHY
+	 * setting of the one torn down above.
+	 */
+	if (port_switch)
+		dwc3_enable_susphy(dwc, false);
+
 	dwc3_set_prtcap(dwc, desired_dr_role, false);
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1238376749..eae321e2d7 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1017,6 +1017,8 @@ struct dwc3_role_port {
 	unsigned int		state;
 	/* request order, see dwc3_role_mux.seq */
 	u64			seq;
+	/* data-path switch failures, for diagnostics only */
+	unsigned int		errors;
 };
 
 /**
@@ -1027,7 +1029,6 @@ struct dwc3_role_port {
  * @desired_port: index of the connector that currently wins
  * @active_port: index of the connector currently driving the data lines
  * @seq: monotonic request counter used to order pending requests
- * @error: sticky data-path switch error, reported to the role-switch users
  *
  * Two connectors can share the High Speed data lines of one controller while
  * keeping their Super Speed lanes separate.  Each connector then needs its own
@@ -1042,7 +1043,6 @@ struct dwc3_role_mux {
 	int			desired_port;
 	int			active_port;
 	u64			seq;
-	int			error;
 };
 
 /**
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 20821d6505..53106bed3e 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -543,7 +543,7 @@ static int dwc3_mux_role_set(struct usb_role_switch *sw, enum usb_role role)
 	struct dwc3_role_mux *mux = dwc->role_mux;
 	unsigned long flags;
 	enum usb_role selected_role;
-	int selected, ret;
+	int selected;
 
 	if (role > USB_ROLE_DEVICE)
 		return -EINVAL;
@@ -566,35 +566,52 @@ static int dwc3_mux_role_set(struct usb_role_switch *sw, enum usb_role role)
 	selected = dwc3_role_mux_pick(mux);
 	mux->desired_port = selected;
 	selected_role = mux->ports[selected].role;
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
 	/*
+	 * Notify the glue layer before touching the controller, in the same order
+	 * as the single-connector path.  It may sleep (the Qualcomm glue calls
+	 * pm_runtime_resume_and_get()), so it runs outside of dwc->lock -
+	 * dwc3_set_mode() takes that lock itself and a recursive take deadlocks
+	 * the controller on the very first role change.
+	 *
+	 * Pairing with the selection above is provided by mux->lock: a second
+	 * connector blocks in mutex_lock() until this request has been issued.
+	 *
 	 * Same asynchronous semantics as the single-connector role switch: the
 	 * data path and the controller are reprogrammed from __dwc3_set_mode().
-	 * dwc3_set_mode() only queues that work, so the mux lock may be held.
 	 */
+	dwc3_pre_set_role(dwc, selected_role);
 	dwc3_set_mode(dwc, dwc3_role_mux_mode(dwc, selected_role));
-	ret = mux->error;
-	mux->error = 0;
-	spin_unlock_irqrestore(&dwc->lock, flags);
+
 	mutex_unlock(&mux->lock);
 
-	return ret;
+	/*
+	 * A data-path switch failure is reported through the console and counted
+	 * per connector; it is not returned here.  This call has already updated
+	 * the request state, so a stale error from another connector must not be
+	 * reported as the result of this (successful) request.
+	 */
+	return 0;
 }
 
 static enum usb_role dwc3_mux_role_get(struct usb_role_switch *sw)
 {
 	struct dwc3_role_port *port = usb_role_switch_get_drvdata(sw);
 	struct dwc3 *dwc = port->dwc;
-	struct dwc3_role_mux *mux = dwc->role_mux;
 	unsigned long flags;
-	enum usb_role role = USB_ROLE_NONE;
+	enum usb_role role;
 
 	/*
-	 * A connector only reports its own role while it owns the shared data
-	 * path, so the connector drivers never fight over the controller.
+	 * Report the role this connector itself requested, whether or not it owns
+	 * the shared data path right now.  Hiding a pending request behind
+	 * active_port makes connector drivers read back USB_ROLE_NONE, so they
+	 * never send the set_role(USB_ROLE_NONE) that would release it; the stale
+	 * request then keeps winning dwc3_role_mux_pick() after the connector has
+	 * been unplugged and starves the other one.
 	 */
 	spin_lock_irqsave(&dwc->lock, flags);
-	if (mux->active_port == port->state)
-		role = port->role;
+	role = port->role;
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	return role;
@@ -647,6 +664,14 @@ static int dwc3_role_mux_init(struct dwc3 *dwc, u32 mode)
 	mux->active_port = -1;
 	mutex_init(&mux->lock);
 
+	/*
+	 * Publish the mux before the first endpoint reference is taken:
+	 * dwc3_role_mux_exit() is a no-op while dwc->role_mux is NULL, so every
+	 * error path below would otherwise leak the fwnode references already
+	 * acquired.
+	 */
+	dwc->role_mux = mux;
+
 	fwnode_graph_for_each_endpoint(dev_fwnode(dwc->dev), ep) {
 		if (!fwnode_property_present(ep, "usb-role-switch"))
 			continue;
@@ -673,7 +698,14 @@ static int dwc3_role_mux_init(struct dwc3 *dwc, u32 mode)
 		}
 	}
 
-	dwc->role_mux = mux;
+	/*
+	 * Registering the switches makes them reachable from the connector
+	 * drivers, so the initial mode request has to be issued inside the same
+	 * critical section: a set() arriving in between would be silently
+	 * overwritten by it while port->role keeps the requested value.
+	 * dwc3_mux_role_set() serialises on the same lock.
+	 */
+	mutex_lock(&mux->lock);
 
 	for (i = 0; i < ARRAY_SIZE(mux->ports); i++) {
 		snprintf(name, sizeof(name), "%s-port%u", dev_name(dwc->dev), i);
@@ -686,6 +718,7 @@ static int dwc3_role_mux_init(struct dwc3 *dwc, u32 mode)
 		if (IS_ERR(mux->ports[i].sw)) {
 			ret = PTR_ERR(mux->ports[i].sw);
 			mux->ports[i].sw = NULL;
+			mutex_unlock(&mux->lock);
 			goto err;
 		}
 	}
@@ -697,13 +730,15 @@ static int dwc3_role_mux_init(struct dwc3 *dwc, u32 mode)
 	 */
 	dwc3_set_mode(dwc, mode);
 
+	mutex_unlock(&mux->lock);
+
 	return 1;
 
 err:
-	dwc3_role_mux_exit(dwc);
-	dwc->role_mux = NULL;
 	/* A mode request queued before the failure must not run on freed state. */
 	cancel_work_sync(&dwc->drd_work);
+	dwc3_role_mux_exit(dwc);
+	dwc->role_mux = NULL;
 	return ret;
 err_put_ep:
 	fwnode_handle_put(ep);
diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index fc739fd61f..ee186d542a 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -184,7 +184,12 @@ usb_role_switch_at_endpoint(struct fwnode_handle *fwnode)
 			continue;
 		sw = usb_role_switch_match(remote, "usb-role-switch", NULL);
 		fwnode_handle_put(remote);
-		if (!IS_ERR_OR_NULL(sw)) {
+		/*
+		 * ERR_PTR(-EPROBE_DEFER) means the switch is described by the graph
+		 * but not registered yet: pass it up so the caller defers instead of
+		 * concluding that this connector has no role switch at all.
+		 */
+		if (sw) {
 			fwnode_handle_put(ep);
 			return sw;
 		}
base-commit: fd69bd54e328c407b1853378b25d15803d3453fa
-- 
2.53.0

