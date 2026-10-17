Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4893264E7;
	Sat, 17 Oct 2026 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.38.64.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792224823; cv=none; b=mi5laqwC9xXIAp/T/6ekKItUzfahaUaOkWls74czuOkGO/iwitFcuWF0jufxMY25yiDYmjmBuUm9CRWjlenCtso0HmnQ6P6f0rMTaQPE+afAYOV9Mr1N3FzAW/QieOs1YMzYQ+EjumzLgSGJsgpOb+EWMYB0UnbbaUOEeWgFb4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792224823; c=relaxed/simple;
	bh=wmaPv5rroZ62w0ovVbDv3EUTUZ0eTmmbI4UOIRY0G9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8P0JmZlBJwT9xSMBjrT/WBBw4Yig7l20MH8Pt/jyzR0oalJIF2F3aFonnQil4NK82xi8KyC4zeexFo5hvPkwCL2v1wMTIn0/pnC+//HoWOWYDcTSbRHB75UyVZTcFSJoiUo+3vzQ+NEe+ZOLMDPk3f2FH01vGafks+ge9W9G+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn; spf=pass smtp.mailfrom=mail.ustc.edu.cn; dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b=vDC+NQ7C; arc=none smtp.client-ip=202.38.64.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b="vDC+NQ7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=v38KXIzY5OVw+0ADFQ8Cq4L6SpLo5DUj+v
	xodLfzlcc=; b=vDC+NQ7CE2XoNOc3Noq/EngORFfZStha6zJA3nmaKRGgiSVXKZ
	nhtEG9qBvCy0SusxxdZSPVcNa0oWpiZspwIzQStKbr2Z0i833DS0mRk33EPLAfqI
	y8ioWmvcaEfOPAF621aupu+/pVDly8zvqqWAPaugxIKHXrOluEl7gNii0=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.230.12])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBH1EggLtNqndoCAA--.2781S4;
	Sat, 17 Oct 2026 16:13:26 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org
Cc: Felipe Balbi <balbi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] usb: dwc3: support two connectors sharing one HS data bus
Date: Sat, 17 Oct 2026 16:13:20 +0800
Message-ID: <20261017081320.220525-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017081320.220525-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261017081320.220525-1-xiaqinghuan@mail.ustc.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgBH1EggLtNqndoCAA--.2781S4
X-Coremail-Antispam: 1UD129KBjvAXoW3CrWUAry7trWUAFyxCFykXwb_yoW8Gry8Ao
	WftayDXws5KryFgrykCFn7tFyUZ397Kr1UAr1rZrsruF1DW3yrKr9rGF4jqFWfWa1ayF45
	XFZ7Zr4FqFsayr95n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOr7k0a2IF6w4kM7kC6x804xWl14x267AKxVWrJVCq3wAFc2x0
	x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87
	I2jVAFwI0_Jryl82xGYIkIc2x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY
	1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20x
	vEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280
	aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mx
	kF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
	MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
	AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
	43ZEXa7IU5ZNVPUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2rSe1QUgwBUsA

On some boards a single DWC3 controller drives two receptacles: the Super
Speed pairs are wired to separate PHYs, while the High Speed data lines
are muxed to whichever connector is in use.  Such a controller has to
service two independent role-switch inputs, and the shared data path has
to be moved before the controller is reinitialised for the requested role.

Register one usb_role_switch per connector endpoint described in
"ports"/"mux-state" when "port-select-gpios" is present.  Requests from
the two switches are serialised, the oldest pending request wins, and the
port-select GPIO is only changed once the previous host or gadget instance
has been torn down, which is where __dwc3_set_mode() runs.  A connector
only reports its own role while it owns the data path, so the connector
drivers see a consistent view of a shared controller.

The role change keeps the asynchronous semantics of the existing
single-connector role switch: __dwc3_set_mode() is the only place that
programs hardware, and it never aborts half-way, so a failed GPIO write
cannot leave a torn-down role behind.

While the two-connector mux owns role selection, the debugfs "mode" write
used to force a specific role is refused instead of racing with it.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/usb/dwc3/core.c    |  29 +++++-
 drivers/usb/dwc3/core.h    |  38 +++++++
 drivers/usb/dwc3/debugfs.c |   4 +
 drivers/usb/dwc3/drd.c     | 199 ++++++++++++++++++++++++++++++++++++-
 4 files changed, 268 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36..6607e65e8 100644
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
@@ -165,7 +166,9 @@ EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
 static void __dwc3_set_mode(struct work_struct *work)
 {
 	struct dwc3 *dwc = work_to_dwc(work);
+	struct dwc3_role_mux *mux = dwc->role_mux;
 	unsigned long flags;
+	int mux_port = 0;
 	int ret;
 	u32 reg;
 	u32 desired_dr_role;
@@ -174,6 +177,8 @@ static void __dwc3_set_mode(struct work_struct *work)
 	mutex_lock(&dwc->mutex);
 	spin_lock_irqsave(&dwc->lock, flags);
 	desired_dr_role = dwc->desired_dr_role;
+	if (mux)
+		mux_port = mux->desired_port;
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	pm_runtime_get_sync(dwc->dev);
@@ -184,7 +189,8 @@ static void __dwc3_set_mode(struct work_struct *work)
 	if (!desired_dr_role)
 		goto out;
 
-	if (desired_dr_role == dwc->current_dr_role)
+	if (desired_dr_role == dwc->current_dr_role &&
+	    (!mux || mux_port == mux->active_port))
 		goto out;
 
 	if (desired_dr_role == DWC3_GCTL_PRTCAP_OTG && dwc->edev)
@@ -233,6 +239,27 @@ static void __dwc3_set_mode(struct work_struct *work)
 		dwc3_writel(dwc, DWC3_GCTL, reg);
 	}
 
+	/*
+	 * The previous host or gadget instance has been torn down above, so the
+	 * shared High Speed data path can now be moved to the requesting
+	 * connector.  A failure here must not abort the mode change half-way:
+	 * the controller would be left with a torn-down role and a stale
+	 * current_dr_role, which the next request would tear down a second time.
+	 */
+	if (mux && mux_port != mux->active_port) {
+		ret = gpiod_direction_output(mux->select, mux_port);
+		if (ret) {
+			WRITE_ONCE(mux->error, ret);
+			dev_err_ratelimited(dwc->dev,
+					    "failed to select USB port %d: %d\n",
+					    mux_port, ret);
+		} else {
+			spin_lock_irqsave(&dwc->lock, flags);
+			mux->active_port = mux_port;
+			spin_unlock_irqrestore(&dwc->lock, flags);
+		}
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 
 	dwc3_set_prtcap(dwc, desired_dr_role, false);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f3dabb37f..6312c1ed6 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1008,6 +1008,42 @@ struct dwc3_glue_ops {
 	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
 };
 
+/* Per-connector state of the optional shared-HS-data-bus mux. */
+struct dwc3_role_port {
+	struct dwc3		*dwc;
+	struct usb_role_switch	*sw;
+	struct fwnode_handle	*fwnode;
+	enum usb_role		role;
+	unsigned long		stamp;
+	unsigned int		state;
+};
+
+/**
+ * struct dwc3_role_mux - optional data-path mux between two connectors
+ * @select: GPIO selecting which connector drives the shared HS data lines
+ * @lock: serialises role requests coming from both connectors
+ * @ports: per-connector state, indexed by the endpoint's "mux-state"
+ * @desired_role: role requested by the connector that currently wins
+ * @desired_port: index of that connector
+ * @active_port: index of the connector currently driving the data lines
+ * @error: sticky data-path switch error, reported to the role-switch users
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
+	enum usb_role		desired_role;
+	int			desired_port;
+	int			active_port;
+	int			error;
+};
+
 /**
  * struct dwc3 - representation of our controller
  * @drd_work: workqueue used for role swapping
@@ -1064,6 +1100,7 @@ struct dwc3_glue_ops {
  *		- USBPHY_INTERFACE_MODE_UTMI
  *		- USBPHY_INTERFACE_MODE_UTMIW
  * @role_sw: usb_role_switch handle
+ * @role_mux: optional shared data-path mux plus per-connector role switches
  * @role_switch_default_mode: default operation mode of controller while
  *			usb role is USB_ROLE_NONE.
  * @usb_psy: pointer to power supply interface.
@@ -1265,6 +1302,7 @@ struct dwc3 {
 	struct notifier_block	edev_nb;
 	enum usb_phy_interface	hsphy_mode;
 	struct usb_role_switch	*role_sw;
+	struct dwc3_role_mux	*role_mux;
 	enum usb_dr_mode	role_switch_default_mode;
 
 	struct power_supply	*usb_psy;
diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 65d909e4b..0d42f1098 100644
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
index f3e37d383..491047796 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/extcon.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -501,10 +502,199 @@ static enum usb_role dwc3_usb_role_switch_get(struct usb_role_switch *sw)
 	return role;
 }
 
+/*
+ * Index of the connector that should own the shared data path: the oldest
+ * pending request wins, and the last selection is kept when neither connector
+ * requests a role.
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
+		    time_before(mux->ports[i].stamp, mux->ports[sel].stamp))
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
+	mutex_lock(&mux->lock);
+	spin_lock_irqsave(&dwc->lock, flags);
+	if (role != port->role && role != USB_ROLE_NONE)
+		port->stamp = jiffies;
+	port->role = role;
+	selected = dwc3_role_mux_pick(mux);
+	mux->desired_port = selected;
+	selected_role = mux->ports[selected].role;
+	mux->desired_role = selected_role;
+	spin_unlock_irqrestore(&dwc->lock, flags);
+	mutex_unlock(&mux->lock);
+
+	/*
+	 * Same asynchronous semantics as the single-connector role switch: the
+	 * data path and the controller are reprogrammed from __dwc3_set_mode().
+	 */
+	dwc3_set_mode(dwc, dwc3_role_mux_mode(dwc, selected_role));
+
+	return 0;
+}
+
+static enum usb_role dwc3_mux_role_get(struct usb_role_switch *sw)
+{
+	struct dwc3_role_port *port = usb_role_switch_get_drvdata(sw);
+	struct dwc3 *dwc = port->dwc;
+	struct dwc3_role_mux *mux = dwc->role_mux;
+	unsigned long flags;
+	enum usb_role role = USB_ROLE_NONE;
+
+	/*
+	 * A connector only reports its own role while it owns the shared data
+	 * path, so the connector drivers never fight over the controller.
+	 */
+	spin_lock_irqsave(&dwc->lock, flags);
+	if (mux->active_port == port->state)
+		role = port->role;
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
+	dwc->role_mux = mux;
+	dwc3_set_mode(dwc, mode);
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
+			goto err;
+		}
+	}
+
+	return 1;
+
+err:
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
@@ -513,6 +703,11 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
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
@@ -526,7 +721,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 
 	if (dwc->dev->of_node) {
 		/* populate connector entry */
-		int ret = devm_of_platform_populate(dwc->dev);
+		ret = devm_of_platform_populate(dwc->dev);
 
 		if (ret) {
 			usb_role_switch_unregister(dwc->role_sw);
@@ -541,6 +736,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 #else
 #define ROLE_SWITCH 0
 #define dwc3_setup_role_switch(x) 0
+static inline void dwc3_role_mux_exit(struct dwc3 *dwc) {}
 #endif
 
 int dwc3_drd_init(struct dwc3 *dwc)
@@ -597,6 +793,7 @@ void dwc3_drd_exit(struct dwc3 *dwc)
 {
 	unsigned long flags;
 
+	dwc3_role_mux_exit(dwc);
 	if (dwc->role_sw)
 		usb_role_switch_unregister(dwc->role_sw);
 
-- 
2.53.0

