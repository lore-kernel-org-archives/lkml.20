Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793762847;
	b=EAeDR3jQCNMnTUyErhsSsgZP4WRtEXCjCn8W+H8LiQTJ41GruKCPji9mrRbD1IhSglWU
	 vXmFC+3BxVkEfkjtPnywYQ+DygwbWNrsHdUnwVQB1Sxg0SplOzEYVJkS/4BzlCrvRYAV1
	 FRr8N1N1udH2TfojnGtNEVM0Sqsmxpuwc7mxzSnk4MMxVw/mmTH4Pb0OHuLUdkfSEJgFb
	 GvD6z2ht9hVWwBzjasxjvofssSoSAGBmePmUmx5dYRRXbu+yfmpwow7x5uKXeWvfJEsxO
	 sLOpK0dntbylrAXzHmoi8fIivIOugJV4J5ZPSMYZFEhmnhLYcKevZfMkZc7rahtdDaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762847;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=zT/E3nDh+BEq6mkXnLHq+cWNzzfOUBPPupRvDHMEiT4=;
	b=aSZ4m12W/Wsbhs2RrK+x6wfiqfJgt8Cl0zm9dHeo8Tep8oQpcVUNv9NQcCXNzcSyU4Mk
	 +PVsbe14G0znwipsHZZ+ok0e6lqWCjVZscTVTgGIiRLiv1vE7Zu/iKW3a06rTQZ+E7ckF
	 TDFKV4EW0a9Oj0w6T1S+0tZu1CRhTKQ7DZ5wYYlf10y/UDWzRP5X9NLjjBtILW4qwtQdf
	 iRDoGnszSQ5R0aY4r6IJNdK/8VNN8RtE81UWxDZQOusCWlmW3NcdwFkfQEbgH9WFdRiJU
	 4xJ8VsAZnCM8ouZ7sSTp1WtOYROH1MH2bwevxRROjOgUNcJG0ocvgVzxBIwIwxnVnkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=bbR1PlHJ;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD705606D832;
	Wed,  4 Nov 2026 03:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD705606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=bbR1PlHJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=zT/E3nDh+BEq6mkXnLHq+cWNzzfOUBPPup
	RvDHMEiT4=; b=bbR1PlHJgKI11E8MMsb7PhJvZZIOq19OCNS/xa6avssH2NTf2M
	nXlO+H1Llp2uinRmFCAUjACARBwsJscXRsuEbSdXOb3Th9Mm8xHJ90D0TKed/X+s
	PR6UvXX49KvLIKIUNZANs3ZuBgIgiCLy2cYfc2P/5LH/YKtp3EbY008a8=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.194.56])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgD3eT4KpupqijSAAA--.137S5;
	Wed, 04 Nov 2026 11:27:17 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] usb: dwc3: support two connectors sharing one HS data bus
Date: Wed,  4 Nov 2026 11:27:06 +0800
Message-ID: <20261104032706.210042-4-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104032706.210042-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261104032706.210042-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgD3eT4KpupqijSAAA--.137S5
X-Coremail-Antispam: 1UD129KBjvAXoW3ZrW5Zry7ArW3WrykKw1kGrg_yoW8Ary3Go
	WfJ3ykZws5KryFgrykCFn7GFyjva92kr15Ar1rZrsrZF18X3yrK3srGr4jqFWfGF4ayr15
	XayxAr4FgFWSyr95n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUO07k0a2IF6w4kM7kC6x804xWl14x267AKxVWrJVCq3wAFc2x0
	x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87
	I2jVAFwI0_JrWl82xGYIkIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY
	1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20x
	vEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280
	aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43MxkIec
	xEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	gqXdDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREBB2rqNlcjBwAps6

On some boards a single DWC3 controller drives two receptacles: the Super
Speed pairs are wired to separate PHYs, while the High Speed data lines are
muxed to whichever connector is in use.  Such a controller has to service
two independent role-switch inputs, and the shared data path has to be
moved before the controller is reinitialised for the requested role.

Register one usb_role_switch per connector endpoint described by
"port-select-gpios" and the per-endpoint "mux-state" property.  Requests
from the two switches are serialised by the mux lock, the oldest pending
request wins, and the port-select GPIO is only changed once the previous
host or gadget instance has been torn down, which is where
__dwc3_set_mode() runs.  A same-role request that moves the data path to
the other connector reinitialises the controller as well and starts it
from the same SUSPHY state as a role change.

A connector reads back the role it requested, not the role currently on the
bus: hiding a pending request behind the active port would leave the
connector driver unable to release it, and the stale request would keep
winning the arbitration after unplug.  The data-path selection and the mode
request it implies are decided under one lock, and the glue layer is
notified with dwc3_pre_set_role() before dwc3_set_mode(), outside
spinlocks, as the single-connector path does.

A failed port-select write is logged and counted per connector; it cannot
leave a torn-down role behind, because __dwc3_set_mode() is the only place
that programs hardware and it never aborts half-way.

While the two-connector mux owns role selection, the debugfs "mode" write
used to force a specific role is refused instead of racing with it.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/usb/dwc3/core.c    |  47 ++++++-
 drivers/usb/dwc3/core.h    |  39 ++++++
 drivers/usb/dwc3/debugfs.c |   4 +
 drivers/usb/dwc3/drd.c     | 254 ++++++++++++++++++++++++++++++++++++-
 4 files changed, 342 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c..da609a011d 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -21,6 +21,7 @@
 #include <linux/io.h>
 #include <linux/list.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/dma-mapping.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -165,7 +166,10 @@ EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
 static void __dwc3_set_mode(struct work_struct *work)
 {
 	struct dwc3 *dwc = work_to_dwc(work);
+	struct dwc3_role_mux *mux = dwc->role_mux;
 	unsigned long flags;
+	bool port_switch;
+	int mux_port = 0;
 	int ret;
 	u32 reg;
 	u32 desired_dr_role;
@@ -174,6 +178,8 @@ static void __dwc3_set_mode(struct work_struct *work)
 	mutex_lock(&dwc->mutex);
 	spin_lock_irqsave(&dwc->lock, flags);
 	desired_dr_role = dwc->desired_dr_role;
+	if (mux)
+		mux_port = mux->desired_port;
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	pm_runtime_get_sync(dwc->dev);
@@ -184,7 +190,14 @@ static void __dwc3_set_mode(struct work_struct *work)
 	if (!desired_dr_role)
 		goto out;
 
-	if (desired_dr_role == dwc->current_dr_role)
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
@@ -233,8 +246,40 @@ static void __dwc3_set_mode(struct work_struct *work)
 		dwc3_writel(dwc, DWC3_GCTL, reg);
 	}
 
+	/*
+	 * The previous host or gadget instance has been torn down above, so the
+	 * shared High Speed data path can now be moved to the requesting
+	 * connector.  A failure here must not abort the mode change half-way:
+	 * the controller would be left with a torn-down role and a stale
+	 * current_dr_role, which the next request would tear down a second time.
+	 */
+	if (port_switch) {
+		ret = gpiod_direction_output(mux->select, mux_port);
+		if (ret)
+			dev_err_ratelimited(dwc->dev,
+					    "failed to select USB port %d: %d\n",
+					    mux_port, ret);
+
+		spin_lock_irqsave(&dwc->lock, flags);
+		if (ret)
+			mux->ports[mux_port].errors++;
+		else
+			mux->active_port = mux_port;
+		spin_unlock_irqrestore(&dwc->lock, flags);
+	}
+
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
index f3dabb37f8..eae321e2d7 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1008,6 +1008,43 @@ struct dwc3_glue_ops {
 	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
 };
 
+/* Per-connector state of the optional shared-HS-data-bus mux. */
+struct dwc3_role_port {
+	struct dwc3		*dwc;
+	struct usb_role_switch	*sw;
+	struct fwnode_handle	*fwnode;
+	enum usb_role		role;
+	unsigned int		state;
+	/* request order, see dwc3_role_mux.seq */
+	u64			seq;
+	/* data-path switch failures, for diagnostics only */
+	unsigned int		errors;
+};
+
+/**
+ * struct dwc3_role_mux - optional data-path mux between two connectors
+ * @select: GPIO selecting which connector drives the shared HS data lines
+ * @lock: serialises role requests coming from both connectors
+ * @ports: per-connector state, indexed by the endpoint's "mux-state"
+ * @desired_port: index of the connector that currently wins
+ * @active_port: index of the connector currently driving the data lines
+ * @seq: monotonic request counter used to order pending requests
+ *
+ * Two connectors can share the High Speed data lines of one controller while
+ * keeping their Super Speed lanes separate.  Each connector then needs its own
+ * role-switch input, and the shared data path has to be moved before the
+ * controller is reinitialised for the requested role.
+ */
+struct dwc3_role_mux {
+	struct gpio_desc	*select;
+	/* serialises role requests coming from both connectors */
+	struct mutex		lock;
+	struct dwc3_role_port	ports[2];
+	int			desired_port;
+	int			active_port;
+	u64			seq;
+};
+
 /**
  * struct dwc3 - representation of our controller
  * @drd_work: workqueue used for role swapping
@@ -1064,6 +1101,7 @@ struct dwc3_glue_ops {
  *		- USBPHY_INTERFACE_MODE_UTMI
  *		- USBPHY_INTERFACE_MODE_UTMIW
  * @role_sw: usb_role_switch handle
+ * @role_mux: optional shared data-path mux plus per-connector role switches
  * @role_switch_default_mode: default operation mode of controller while
  *			usb role is USB_ROLE_NONE.
  * @usb_psy: pointer to power supply interface.
@@ -1265,6 +1303,7 @@ struct dwc3 {
 	struct notifier_block	edev_nb;
 	enum usb_phy_interface	hsphy_mode;
 	struct usb_role_switch	*role_sw;
+	struct dwc3_role_mux	*role_mux;
 	enum usb_dr_mode	role_switch_default_mode;
 
 	struct power_supply	*usb_psy;
diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 65d909e4b7..0d42f10988 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -438,6 +438,10 @@ static ssize_t dwc3_mode_write(struct file *file,
 	u32			mode = 0;
 	char			buf[32];
 
+	/* The connector providers own both the role and the data-path selection. */
+	if (dwc->role_mux)
+		return -EBUSY;
+
 	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
 		return -EFAULT;
 
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index f3e37d3836..53106bed3e 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/extcon.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -501,10 +502,254 @@ static enum usb_role dwc3_usb_role_switch_get(struct usb_role_switch *sw)
 	return role;
 }
 
+/*
+ * Index of the connector that should own the shared data path: the oldest
+ * pending request wins, and the last selection is kept when neither connector
+ * requests a role.  Requests are ordered by a monotonic counter rather than by
+ * a timestamp, so a wrapped counter cannot be mistaken for an old request.
+ */
+static int dwc3_role_mux_pick(struct dwc3_role_mux *mux)
+{
+	int sel = mux->desired_port;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mux->ports); i++) {
+		if (mux->ports[i].role == USB_ROLE_NONE)
+			continue;
+		if (mux->ports[sel].role == USB_ROLE_NONE ||
+		    mux->ports[i].seq < mux->ports[sel].seq)
+			sel = i;
+	}
+
+	return sel;
+}
+
+static u32 dwc3_role_mux_mode(struct dwc3 *dwc, enum usb_role role)
+{
+	if (role == USB_ROLE_HOST)
+		return DWC3_GCTL_PRTCAP_HOST;
+	if (role == USB_ROLE_DEVICE)
+		return DWC3_GCTL_PRTCAP_DEVICE;
+	if (dwc->role_switch_default_mode == USB_DR_MODE_HOST)
+		return DWC3_GCTL_PRTCAP_HOST;
+
+	return DWC3_GCTL_PRTCAP_DEVICE;
+}
+
+static int dwc3_mux_role_set(struct usb_role_switch *sw, enum usb_role role)
+{
+	struct dwc3_role_port *port = usb_role_switch_get_drvdata(sw);
+	struct dwc3 *dwc = port->dwc;
+	struct dwc3_role_mux *mux = dwc->role_mux;
+	unsigned long flags;
+	enum usb_role selected_role;
+	int selected;
+
+	if (role > USB_ROLE_DEVICE)
+		return -EINVAL;
+
+	/*
+	 * The request order and the mode request it implies are decided under one
+	 * lock, so a second connector cannot change desired_port between the
+	 * selection and the dwc3_set_mode() call that consumes it.
+	 */
+	mutex_lock(&mux->lock);
+	spin_lock_irqsave(&dwc->lock, flags);
+	/*
+	 * A role change between two non-NONE roles of the same connector must not
+	 * give that connector a new request ticket: it would otherwise steal the
+	 * data path from the connector that asked first.
+	 */
+	if (port->role == USB_ROLE_NONE && role != USB_ROLE_NONE)
+		port->seq = ++mux->seq;
+	port->role = role;
+	selected = dwc3_role_mux_pick(mux);
+	mux->desired_port = selected;
+	selected_role = mux->ports[selected].role;
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	/*
+	 * Notify the glue layer before touching the controller, in the same order
+	 * as the single-connector path.  It may sleep (the Qualcomm glue calls
+	 * pm_runtime_resume_and_get()), so it runs outside of dwc->lock -
+	 * dwc3_set_mode() takes that lock itself and a recursive take deadlocks
+	 * the controller on the very first role change.
+	 *
+	 * Pairing with the selection above is provided by mux->lock: a second
+	 * connector blocks in mutex_lock() until this request has been issued.
+	 *
+	 * Same asynchronous semantics as the single-connector role switch: the
+	 * data path and the controller are reprogrammed from __dwc3_set_mode().
+	 */
+	dwc3_pre_set_role(dwc, selected_role);
+	dwc3_set_mode(dwc, dwc3_role_mux_mode(dwc, selected_role));
+
+	mutex_unlock(&mux->lock);
+
+	/*
+	 * A data-path switch failure is reported through the console and counted
+	 * per connector; it is not returned here.  This call has already updated
+	 * the request state, so a stale error from another connector must not be
+	 * reported as the result of this (successful) request.
+	 */
+	return 0;
+}
+
+static enum usb_role dwc3_mux_role_get(struct usb_role_switch *sw)
+{
+	struct dwc3_role_port *port = usb_role_switch_get_drvdata(sw);
+	struct dwc3 *dwc = port->dwc;
+	unsigned long flags;
+	enum usb_role role;
+
+	/*
+	 * Report the role this connector itself requested, whether or not it owns
+	 * the shared data path right now.  Hiding a pending request behind
+	 * active_port makes connector drivers read back USB_ROLE_NONE, so they
+	 * never send the set_role(USB_ROLE_NONE) that would release it; the stale
+	 * request then keeps winning dwc3_role_mux_pick() after the connector has
+	 * been unplugged and starves the other one.
+	 */
+	spin_lock_irqsave(&dwc->lock, flags);
+	role = port->role;
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	return role;
+}
+
+static void dwc3_role_mux_exit(struct dwc3 *dwc)
+{
+	struct dwc3_role_mux *mux = dwc->role_mux;
+	unsigned int i;
+
+	if (!mux)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(mux->ports); i++) {
+		if (mux->ports[i].sw)
+			usb_role_switch_unregister(mux->ports[i].sw);
+		mux->ports[i].sw = NULL;
+		fwnode_handle_put(mux->ports[i].fwnode);
+		mux->ports[i].fwnode = NULL;
+	}
+}
+
+/* Returns 1 when the optional two-connector mux has been set up. */
+static int dwc3_role_mux_init(struct dwc3 *dwc, u32 mode)
+{
+	struct usb_role_switch_desc desc = {};
+	struct dwc3_role_mux *mux;
+	struct fwnode_handle *ep;
+	struct gpio_desc *select;
+	char name[64];
+	u32 state;
+	int ret, i;
+
+	select = devm_gpiod_get_optional(dwc->dev, "port-select", GPIOD_ASIS);
+	if (IS_ERR(select))
+		return PTR_ERR(select);
+	if (!select)
+		return 0;
+
+	mux = devm_kzalloc(dwc->dev, sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return -ENOMEM;
+
+	ret = gpiod_get_value_cansleep(select);
+	if (ret < 0)
+		return ret;
+
+	mux->select = select;
+	mux->desired_port = ret;
+	mux->active_port = -1;
+	mutex_init(&mux->lock);
+
+	/*
+	 * Publish the mux before the first endpoint reference is taken:
+	 * dwc3_role_mux_exit() is a no-op while dwc->role_mux is NULL, so every
+	 * error path below would otherwise leak the fwnode references already
+	 * acquired.
+	 */
+	dwc->role_mux = mux;
+
+	fwnode_graph_for_each_endpoint(dev_fwnode(dwc->dev), ep) {
+		if (!fwnode_property_present(ep, "usb-role-switch"))
+			continue;
+
+		ret = fwnode_property_read_u32(ep, "mux-state", &state);
+		if (ret || state >= ARRAY_SIZE(mux->ports)) {
+			ret = -EINVAL;
+			goto err_put_ep;
+		}
+		if (mux->ports[state].fwnode) {
+			ret = -EINVAL;
+			goto err_put_ep;
+		}
+
+		mux->ports[state].fwnode = fwnode_handle_get(ep);
+		mux->ports[state].state = state;
+		mux->ports[state].dwc = dwc;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(mux->ports); i++) {
+		if (!mux->ports[i].fwnode) {
+			ret = -EINVAL;
+			goto err;
+		}
+	}
+
+	/*
+	 * Registering the switches makes them reachable from the connector
+	 * drivers, so the initial mode request has to be issued inside the same
+	 * critical section: a set() arriving in between would be silently
+	 * overwritten by it while port->role keeps the requested value.
+	 * dwc3_mux_role_set() serialises on the same lock.
+	 */
+	mutex_lock(&mux->lock);
+
+	for (i = 0; i < ARRAY_SIZE(mux->ports); i++) {
+		snprintf(name, sizeof(name), "%s-port%u", dev_name(dwc->dev), i);
+		desc.name = name;
+		desc.fwnode = mux->ports[i].fwnode;
+		desc.set = dwc3_mux_role_set;
+		desc.get = dwc3_mux_role_get;
+		desc.driver_data = &mux->ports[i];
+		mux->ports[i].sw = usb_role_switch_register(dwc->dev, &desc);
+		if (IS_ERR(mux->ports[i].sw)) {
+			ret = PTR_ERR(mux->ports[i].sw);
+			mux->ports[i].sw = NULL;
+			mutex_unlock(&mux->lock);
+			goto err;
+		}
+	}
+
+	/*
+	 * The controller is only started in its default role once both switches
+	 * are registered: before that a connector driver cannot request a role,
+	 * so nothing can race with this initial mode request.
+	 */
+	dwc3_set_mode(dwc, mode);
+
+	mutex_unlock(&mux->lock);
+
+	return 1;
+
+err:
+	/* A mode request queued before the failure must not run on freed state. */
+	cancel_work_sync(&dwc->drd_work);
+	dwc3_role_mux_exit(dwc);
+	dwc->role_mux = NULL;
+	return ret;
+err_put_ep:
+	fwnode_handle_put(ep);
+	goto err;
+}
+
 static int dwc3_setup_role_switch(struct dwc3 *dwc)
 {
 	struct usb_role_switch_desc dwc3_role_switch = {NULL};
 	u32 mode;
+	int ret;
 
 	dwc->role_switch_default_mode = usb_get_role_switch_default_mode(dwc->dev);
 	if (dwc->role_switch_default_mode == USB_DR_MODE_HOST) {
@@ -513,6 +758,11 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 		dwc->role_switch_default_mode = USB_DR_MODE_PERIPHERAL;
 		mode = DWC3_GCTL_PRTCAP_DEVICE;
 	}
+
+	ret = dwc3_role_mux_init(dwc, mode);
+	if (ret)
+		return ret < 0 ? ret : 0;
+
 	dwc3_set_mode(dwc, mode);
 
 	dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
@@ -526,7 +776,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 
 	if (dwc->dev->of_node) {
 		/* populate connector entry */
-		int ret = devm_of_platform_populate(dwc->dev);
+		ret = devm_of_platform_populate(dwc->dev);
 
 		if (ret) {
 			usb_role_switch_unregister(dwc->role_sw);
@@ -541,6 +791,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 #else
 #define ROLE_SWITCH 0
 #define dwc3_setup_role_switch(x) 0
+static inline void dwc3_role_mux_exit(struct dwc3 *dwc) {}
 #endif
 
 int dwc3_drd_init(struct dwc3 *dwc)
@@ -597,6 +848,7 @@ void dwc3_drd_exit(struct dwc3 *dwc)
 {
 	unsigned long flags;
 
+	dwc3_role_mux_exit(dwc);
 	if (dwc->role_sw)
 		usb_role_switch_unregister(dwc->role_sw);
 

