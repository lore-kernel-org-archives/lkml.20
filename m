Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C413CA483;
	Tue, 13 Oct 2026 10:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.38.64.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887384; cv=none; b=u8E2zRB3Um0uG0Nwq4bzcEDYErAxYTams5j1ADzdur8uOqnWiwYZJPPTKYzw17FihRFJB5CYJlmTptv34GwQHPGwg8Txf4kvRamMzndRk3zE9XvXqFiMo+4FJYQWCJ/Zx21ERzEkgzCTzI4cclZ0EcOvXUG83NFia0cTbQwJ7xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887384; c=relaxed/simple;
	bh=lOsmlMNsutlnstLkUvryk2LGKhdtjs/wg2g1zxNIzas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2NBt4M12TvvWEXijP3Zqf91807jhQxIEQTIYNzSpHMjPykn5BUn/W+HOimoXyNRKWwOu0yAnJU/HNxPwd1mAb+tCWhvetixV15QjQgWp5Gv/xbHjYqnLQ7U5sAFr+FRgPiDjfLVvlrFQCUqpiil7tSp8CHTyZcHwadfLa263Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn; spf=pass smtp.mailfrom=mail.ustc.edu.cn; dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b=Tzu4wZam; arc=none smtp.client-ip=202.38.64.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b="Tzu4wZam"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=Rt8eJlWjokyssMW53V4pypnpZyHVMgXHRx
	TkpNfm9MM=; b=Tzu4wZamJK8jbu3IQbeZcDpfu+BR9ajccQHMqC+OxkDZgIIOfp
	R3g0FpgxhRPjHvJgYrPjXOPXeJaQ8qsLHK9wXpYG6ch1I4rq7yVxCXxNsdeylWWK
	1EPTjNvsSVCu6jgp4RPO8NnooedwxZa9Abw+POtRZfXZPcc9i3hGQySSY=
Received: from 5700g-x8664.ustc.edu.cn (unknown [114.214.192.228])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAXEikHCM5q2w3hAQ--.890S5;
	Tue, 13 Oct 2026 18:29:28 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
Subject: [PATCH 3/3] usb: dwc3: support two connectors sharing one HS data bus
Date: Tue, 13 Oct 2026 18:29:27 +0800
Message-ID: <20261013102927.1141696-4-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgAXEikHCM5q2w3hAQ--.890S5
X-Coremail-Antispam: 1UD129KBjvJXoW3KFW5ZF4kXr48tF4DCr43Awb_yoWktrW8pF
	Wq9w15KrW8XrWrXr4xAa1DZr4aga18Gr17GrW7G3W3Ar1FqrZ5t3W8GrZ8uFWrCFnxGry5
	ua13GrWrCFZrX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUDDGOUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARETB2rNcIlM4gAasu

From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>

On some boards a single DWC3 controller drives two receptacles: the Super
Speed pairs are wired to separate PHYs, while the High Speed data lines are
muxed to whichever connector is in use.  The controller therefore has to
service two independent role-switch inputs and move the shared data path
before it reinitialises the controller for the requested role.

Register one usb_role_switch per connector endpoint described in
"ports"/"mux-state" when "port-select-gpios" is present.  Requests from the
two switches are serialised by a mutex, the oldest connector holding a role
wins, and the level of the port-select GPIO is only changed once the
previous host or gadget instance has been torn down, which is where
__dwc3_set_mode() runs.  A connector only reports its own role while its
data path is the active one, so the connector drivers see a consistent view
of a shared controller.

While the two-connector mux owns role selection, the debugfs "mode" write
used to force a specific role is refused instead of racing with it.

Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/usb/dwc3/core.c    |  30 ++++++-
 drivers/usb/dwc3/core.h    |  22 +++++
 drivers/usb/dwc3/debugfs.c |   4 +
 drivers/usb/dwc3/drd.c     | 177 ++++++++++++++++++++++++++++++++++++-
 4 files changed, 231 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c..76e9e5d180 100644
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
@@ -166,6 +167,9 @@ static void __dwc3_set_mode(struct work_struct *work)
 {
 	struct dwc3 *dwc = work_to_dwc(work);
 	unsigned long flags;
+	struct dwc3_role_mux *mux = dwc->role_mux;
+	enum usb_role mux_role = USB_ROLE_NONE;
+	int mux_port = 0;
 	int ret;
 	u32 reg;
 	u32 desired_dr_role;
@@ -174,8 +178,15 @@ static void __dwc3_set_mode(struct work_struct *work)
 	mutex_lock(&dwc->mutex);
 	spin_lock_irqsave(&dwc->lock, flags);
 	desired_dr_role = dwc->desired_dr_role;
+	if (mux) {
+		mux_port = mux->desired_port;
+		mux_role = mux->desired_role;
+	}
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	if (mux && READ_ONCE(mux->error))
+		goto out;
+
 	pm_runtime_get_sync(dwc->dev);
 
 	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_OTG)
@@ -184,7 +195,8 @@ static void __dwc3_set_mode(struct work_struct *work)
 	if (!desired_dr_role)
 		goto out;
 
-	if (desired_dr_role == dwc->current_dr_role)
+	if (desired_dr_role == dwc->current_dr_role &&
+	    (!mux || mux_port == mux->active_port))
 		goto out;
 
 	if (desired_dr_role == DWC3_GCTL_PRTCAP_OTG && dwc->edev)
@@ -233,6 +245,22 @@ static void __dwc3_set_mode(struct work_struct *work)
 		dwc3_writel(dwc, DWC3_GCTL, reg);
 	}
 
+	/*
+	 * The previous host/gadget has been torn down above, so it is safe to
+	 * move the shared HS data path to the requesting connector.
+	 */
+	if (mux && mux_port != mux->active_port) {
+		ret = gpiod_direction_output(mux->select, mux_port);
+		if (ret) {
+			WRITE_ONCE(mux->error, ret);
+			goto out;
+		}
+
+		spin_lock_irqsave(&dwc->lock, flags);
+		mux->active_port = mux_port;
+		spin_unlock_irqrestore(&dwc->lock, flags);
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 
 	dwc3_set_prtcap(dwc, desired_dr_role, false);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f3dabb37f8..ffd07092da 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1008,6 +1008,26 @@ struct dwc3_glue_ops {
 	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
 };
 
+struct dwc3_role_port {
+	struct dwc3 *dwc;
+	struct usb_role_switch *sw;
+	struct fwnode_handle *fwnode;
+	enum usb_role role;
+	int state;
+};
+
+struct dwc3_role_mux {
+	struct gpio_desc *select;
+	/* Serialize requests from the two connector role switches. */
+	struct mutex lock;
+	struct dwc3_role_port ports[2];
+	enum usb_role desired_role;
+	int desired_port;
+	int active_port;
+	int error;
+	bool stopping;
+};
+
 /**
  * struct dwc3 - representation of our controller
  * @drd_work: workqueue used for role swapping
@@ -1064,6 +1084,7 @@ struct dwc3_glue_ops {
  *		- USBPHY_INTERFACE_MODE_UTMI
  *		- USBPHY_INTERFACE_MODE_UTMIW
  * @role_sw: usb_role_switch handle
+ * @role_mux: optional shared data-port mux and per-connector role switches
  * @role_switch_default_mode: default operation mode of controller while
  *			usb role is USB_ROLE_NONE.
  * @usb_psy: pointer to power supply interface.
@@ -1265,6 +1286,7 @@ struct dwc3 {
 	struct notifier_block	edev_nb;
 	enum usb_phy_interface	hsphy_mode;
 	struct usb_role_switch	*role_sw;
+	struct dwc3_role_mux	*role_mux;
 	enum usb_dr_mode	role_switch_default_mode;
 
 	struct power_supply	*usb_psy;
diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 65d909e4b7..e8616dea6b 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -438,6 +438,10 @@ static ssize_t dwc3_mode_write(struct file *file,
 	u32			mode = 0;
 	char			buf[32];
 
+	/* The connector providers own both role and data-path selection. */
+	if (dwc->role_mux)
+		return -EBUSY;
+
 	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
 		return -EFAULT;
 
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index f3e37d3836..4bf0497e90 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/extcon.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -501,10 +502,178 @@ static enum usb_role dwc3_usb_role_switch_get(struct usb_role_switch *sw)
 	return role;
 }
 
+static int dwc3_mux_role_set(struct usb_role_switch *sw, enum usb_role role)
+{
+	struct dwc3_role_port *port = usb_role_switch_get_drvdata(sw);
+	struct dwc3 *dwc = port->dwc;
+	struct dwc3_role_mux *mux = dwc->role_mux;
+	enum usb_role selected_role;
+	unsigned long flags;
+	int selected, ret;
+	u32 mode;
+
+	if (role < USB_ROLE_NONE || role > USB_ROLE_DEVICE)
+		return -EINVAL;
+
+	mutex_lock(&mux->lock);
+	if (mux->stopping) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+	if (READ_ONCE(mux->error)) {
+		ret = READ_ONCE(mux->error);
+		goto out;
+	}
+
+	port->role = role;
+	if (mux->ports[0].role != USB_ROLE_NONE)
+		selected = 0;
+	else if (mux->ports[1].role != USB_ROLE_NONE)
+		selected = 1;
+	else
+		selected = mux->desired_port;
+	selected_role = mux->ports[selected].role;
+	if (selected == mux->desired_port && selected_role == mux->desired_role) {
+		ret = 0;
+		goto out;
+	}
+
+	if (selected_role == USB_ROLE_HOST ||
+	    (selected_role == USB_ROLE_NONE &&
+	     dwc->role_switch_default_mode == USB_DR_MODE_HOST))
+		mode = DWC3_GCTL_PRTCAP_HOST;
+	else
+		mode = DWC3_GCTL_PRTCAP_DEVICE;
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	mux->desired_port = selected;
+	mux->desired_role = selected_role;
+	dwc->desired_dr_role = mode;
+	spin_unlock_irqrestore(&dwc->lock, flags);
+	queue_work(system_freezable_wq, &dwc->drd_work);
+	flush_work(&dwc->drd_work);
+	ret = READ_ONCE(mux->error);
+out:
+	mutex_unlock(&mux->lock);
+	return ret;
+}
+
+static enum usb_role dwc3_mux_role_get(struct usb_role_switch *sw)
+{
+	struct dwc3_role_port *port = usb_role_switch_get_drvdata(sw);
+	struct dwc3_role_mux *mux = port->dwc->role_mux;
+	unsigned long flags;
+	enum usb_role role = USB_ROLE_NONE;
+
+	mutex_lock(&mux->lock);
+	spin_lock_irqsave(&port->dwc->lock, flags);
+	if (!READ_ONCE(mux->error) && mux->active_port == port->state)
+		role = port->role;
+	spin_unlock_irqrestore(&port->dwc->lock, flags);
+	mutex_unlock(&mux->lock);
+	return role;
+}
+
+static void dwc3_role_mux_unregister(struct dwc3 *dwc)
+{
+	struct dwc3_role_mux *mux = dwc->role_mux;
+	unsigned int i;
+
+	if (!mux)
+		return;
+
+	mutex_lock(&mux->lock);
+	mux->stopping = true;
+	mutex_unlock(&mux->lock);
+	for (i = 0; i < ARRAY_SIZE(mux->ports); i++) {
+		usb_role_switch_unregister(mux->ports[i].sw);
+		mux->ports[i].sw = NULL;
+		fwnode_handle_put(mux->ports[i].fwnode);
+		mux->ports[i].fwnode = NULL;
+	}
+}
+
+/* Returns one when the optional two-connector mux is configured. */
+static int dwc3_setup_role_mux(struct dwc3 *dwc, u32 mode)
+{
+	struct usb_role_switch_desc desc = {};
+	struct fwnode_handle *ep;
+	struct dwc3_role_mux *mux;
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
+	ret = gpiod_get_value_cansleep(select);
+	if (ret < 0)
+		return ret;
+
+	mux = devm_kzalloc(dwc->dev, sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return -ENOMEM;
+	mux->select = select;
+	mux->desired_port = ret;
+	mux->active_port = -1;
+	mutex_init(&mux->lock);
+	dwc->role_mux = mux;
+
+	fwnode_graph_for_each_endpoint(dev_fwnode(dwc->dev), ep) {
+		if (!fwnode_property_present(ep, "usb-role-switch"))
+			continue;
+		ret = fwnode_property_read_u32(ep, "mux-state", &state);
+		if (ret || state >= ARRAY_SIZE(mux->ports)) {
+			ret = -EINVAL;
+			goto put_ep;
+		}
+		if (mux->ports[state].fwnode) {
+			ret = -EINVAL;
+			goto put_ep;
+		}
+		mux->ports[state].fwnode = fwnode_handle_get(ep);
+		mux->ports[state].state = state;
+		mux->ports[state].dwc = dwc;
+	}
+	for (i = 0; i < ARRAY_SIZE(mux->ports); i++) {
+		if (!mux->ports[i].fwnode) {
+			ret = -EINVAL;
+			goto err;
+		}
+	}
+
+	/* All state is initialized before either role provider becomes visible. */
+	dwc3_set_mode(dwc, mode);
+	for (i = 0; i < ARRAY_SIZE(mux->ports); i++) {
+		snprintf(name, sizeof(name), "%s-port%d", dev_name(dwc->dev), i);
+		desc.name = name;
+		desc.fwnode = mux->ports[i].fwnode;
+		desc.set = dwc3_mux_role_set;
+		desc.get = dwc3_mux_role_get;
+		desc.driver_data = &mux->ports[i];
+		mux->ports[i].sw = usb_role_switch_register(dwc->dev, &desc);
+		if (IS_ERR(mux->ports[i].sw)) {
+			ret = PTR_ERR(mux->ports[i].sw);
+			goto err;
+		}
+	}
+	return 1;
+
+put_ep:
+	fwnode_handle_put(ep);
+err:
+	dwc3_drd_exit(dwc);
+	return ret;
+}
+
 static int dwc3_setup_role_switch(struct dwc3 *dwc)
 {
 	struct usb_role_switch_desc dwc3_role_switch = {NULL};
 	u32 mode;
+	int ret;
 
 	dwc->role_switch_default_mode = usb_get_role_switch_default_mode(dwc->dev);
 	if (dwc->role_switch_default_mode == USB_DR_MODE_HOST) {
@@ -513,6 +682,10 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 		dwc->role_switch_default_mode = USB_DR_MODE_PERIPHERAL;
 		mode = DWC3_GCTL_PRTCAP_DEVICE;
 	}
+	ret = dwc3_setup_role_mux(dwc, mode);
+	if (ret)
+		return ret < 0 ? ret : 0;
+
 	dwc3_set_mode(dwc, mode);
 
 	dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
@@ -526,7 +699,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 
 	if (dwc->dev->of_node) {
 		/* populate connector entry */
-		int ret = devm_of_platform_populate(dwc->dev);
+		ret = devm_of_platform_populate(dwc->dev);
 
 		if (ret) {
 			usb_role_switch_unregister(dwc->role_sw);
@@ -541,6 +714,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 #else
 #define ROLE_SWITCH 0
 #define dwc3_setup_role_switch(x) 0
+static inline void dwc3_role_mux_unregister(struct dwc3 *dwc) {}
 #endif
 
 int dwc3_drd_init(struct dwc3 *dwc)
@@ -597,6 +771,7 @@ void dwc3_drd_exit(struct dwc3 *dwc)
 {
 	unsigned long flags;
 
+	dwc3_role_mux_unregister(dwc);
 	if (dwc->role_sw)
 		usb_role_switch_unregister(dwc->role_sw);
 

