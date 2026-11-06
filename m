Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965346;
	b=XYF3iA2o1VaaaE4KmLy4MqUml6GNeiOwB2EswGs3SU87BREgGn3JmvSPjXVmN4/7BDL7
	 IwKAMikjbXMeA7itNJNuUf6QDysS7XIzGgboNshBRc1ZnU69i342ezuQR36ZxKhxI8YdK
	 YI5XALJKyQD8fgiyXtnWNmGc8JRzSjOyN957ZdZsrQ1ueF+mRq7YkKWrygGAeE0KyZVkB
	 PjYd9OPGGP0RZgDod4m6HDKz1ONl5Q62/hQ+DlC2eqasnRU88T3KdVpdKBF1bUz/xcNlD
	 9jIbThS/keR0dW6Mz7bkUeBBAFQtKdMd3nKtq+Su6LMxAYpt6r6rstySVhzDcf//AMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965346;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=EzmTMwr8yqruvj/vgnGIEkJVe6M9uLFP63MnhAvtE/A=;
	b=06DASOeTyvdNU7yXNJpCSO3fVqbnqIyoUKHBGveSCmtLb6og4v9KldFSBItkwuT4h4Ta
	 K3Ml9m4TiRQ/T+p3avsqxpg8tH+zXJsGChgg81yp5hvkgCOzCAk9ReYAq315UqmHdHBmf
	 gj5Q1cnYDd91e0zKcfOHRPmiVgPKEf9Etx7r6C3azXQOf9ko7essyl+wBa+zn64A6f9k0
	 gTRDEGwoX/Ox3FWKx2srGd2dSkkdO5QCz0v3UkfAk/VMhgdS6wkCbM1HK1iwIk4vI95qc
	 uXIfy7O0A+DpIyCJBCtBL6sAM0ytcdm93rfMF1IQ2UC4NXtFwrOI8ObcRI3kURVokNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=t5SdXL2J;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3714606C7CF;
	Fri,  6 Nov 2026 11:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3714606C7CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=t5SdXL2J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=EzmTMwr8yqruvj/vgnGIEkJVe6M9uLFP63
	MnhAvtE/A=; b=t5SdXL2JGPAxooaugfA5EKWt56/UU1RYqlj8M0wZxy9Y2roAnu
	gyLglA848pYTYJobK/D7z7FVRHxHo2iQ+ggbcmGlaUSn2yPkLgl7TEsP8SHnRVj2
	0rNVN/G3lMGjLkPyKktOwNYzDG1JzsIwGR38ZTNkZySlTNdG1HeWJ68r0=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.184.75])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBn2S0Qve1q3DyPAA--.869S4;
	Fri, 06 Nov 2026 19:42:15 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/3] usb: roles: look up role switches attached to a graph endpoint
Date: Fri,  6 Nov 2026 19:42:07 +0800
Message-ID: <20261106114208.987284-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106114208.987284-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261106114208.987284-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgBn2S0Qve1q3DyPAA--.869S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4fZFy3ur1DCryDZr1kXwb_yoW5KF1xpr
	yakF1Fvr4DJFya9w4fGa1DAFWrWr4fGFWUJF4xt3WfC3Zaq3yrJr48ta43Ar15CanIgw1Y
	v348A3409a4DA3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBqb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_GFv_Wryl42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUnLYFJUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2rs2VhhrAA3sp

usb_role_switch_get() and fwnode_usb_role_switch_get() look for a switch
on the caller's parent device node or through device_connection.  That does
not work when one controller exposes a role switch per connector endpoint:
the switch is registered against the remote graph endpoint and the
consumer, the connector, has no phandle to it.

Add usb_role_switch_at_endpoint(), which walks the caller's OF graph
endpoints and matches a switch registered on the remote endpoint, and try
it after the existing parent lookup.  A switch that is described by the
graph but not registered yet comes back as -EPROBE_DEFER, as the rest of
the role-switch API does, so the caller retries instead of concluding that
the connector has no role switch at all.  There is no behaviour change for
existing users: if nothing is registered against an endpoint the lookup
falls through to the previous paths.

This is needed by DWC3 designs where two Type-C receptacles share one High
Speed data bus.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/usb/roles/class.c | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index edec139b68..ee186d542a 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -157,6 +157,47 @@ usb_role_switch_is_parent(struct fwnode_handle *fwnode)
 	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
 }
 
+/*
+ * Look up a role switch registered against the remote endpoint of one of the
+ * caller's OF graph endpoints.  This is how a connector endpoint that shares a
+ * USB data bus with another connector (for example two Type-C receptacles on a
+ * single DWC3 controller, selected by a GPIO mux) finds its own role switch.
+ */
+static struct usb_role_switch *
+usb_role_switch_at_endpoint(struct fwnode_handle *fwnode)
+{
+	struct fwnode_handle *ep, *remote, *parent;
+	struct usb_role_switch *sw;
+	bool available;
+
+	fwnode_graph_for_each_endpoint(fwnode, ep) {
+		parent = fwnode_graph_get_remote_port_parent(ep);
+		if (!parent)
+			continue;
+		available = fwnode_device_is_available(parent);
+		fwnode_handle_put(parent);
+		if (!available)
+			continue;
+
+		remote = fwnode_graph_get_remote_endpoint(ep);
+		if (!remote)
+			continue;
+		sw = usb_role_switch_match(remote, "usb-role-switch", NULL);
+		fwnode_handle_put(remote);
+		/*
+		 * ERR_PTR(-EPROBE_DEFER) means the switch is described by the graph
+		 * but not registered yet: pass it up so the caller defers instead of
+		 * concluding that this connector has no role switch at all.
+		 */
+		if (sw) {
+			fwnode_handle_put(ep);
+			return sw;
+		}
+	}
+
+	return NULL;
+}
+
 /**
  * usb_role_switch_get - Find USB role switch linked with the caller
  * @dev: The caller device
@@ -169,6 +210,8 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
 	struct usb_role_switch *sw;
 
 	sw = usb_role_switch_is_parent(dev_fwnode(dev));
+	if (!sw)
+		sw = usb_role_switch_at_endpoint(dev_fwnode(dev));
 	if (!sw)
 		sw = device_connection_find_match(dev, "usb-role-switch", NULL,
 						  usb_role_switch_match);
@@ -192,6 +235,8 @@ struct usb_role_switch *fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
 	struct usb_role_switch *sw;
 
 	sw = usb_role_switch_is_parent(fwnode);
+	if (!sw)
+		sw = usb_role_switch_at_endpoint(fwnode);
 	if (!sw)
 		sw = fwnode_connection_find_match(fwnode, "usb-role-switch",
 						  NULL, usb_role_switch_match);

