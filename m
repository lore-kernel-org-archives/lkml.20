Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017943;
	b=HR1Qba/B1dOvKnWi4W7YiXlbu/TM5r+3K74+ZDXT3S17PPfXWzwqSOeXQMYTK+e84Y7i
	 M0SGxNYPuRJKnM6baYHnKFyvPMJVi47KJBVqV2G3pD9Yp27zbkkZjrpZXzOViKP+8NDOi
	 1/6AJMX1Aqh2EfwpjOvESvy7XSs9AoU2t/MRxHgY70vF6YZ9g7tp88a8eVMHC7/sNPPbx
	 6BKQldJxiTktNay4ImFwhs6mNTRl3xXFaB4xig6n59PUq37EyutvL8xSgOqCibp7Rq+9r
	 9sVMLfCN2Iz5YrD5Q/Tm6OYxAWRA2/mM6FKfVzlPZQr09moo9fVUXr/gQkoKdQbqsMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017943;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=u8EmU61Om1MzRF7qd4jvT1svz5chT/cVBi4gSOaMiGc=;
	b=OHGV8def/bNFMYqspRU6ZvA1Rge3ehRfzjaFhcx9qwQR7F/Urnkyi0ff9LTWmT3JiiaL
	 qGrij7aRUfj/Hv57KiCn5EJ+iG9KZ4tUgmljz0rU3vy55vO/I/0/QP5IBpYX5olHNIpHV
	 J+vuJJiWEVPwgj1m+Mq0mybcUDTJRDKV/nP+28mKUbiAi0VhewXbQs/2ggwgbztqIOQ9C
	 qjJHzTDslj5qRzZs34kv7vvGBOszwP1oPS8r2/13EHROaKRalLZlIxY6cnmJ0oTMGhUvQ
	 j6a68BHEwXXybxD0XdAA/pydkL53vn1amWQygygz0s/+C1OwNPDwwqzTB/7X1ejrYdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=d102NTuO;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B66B606A325;
	Mon, 26 Oct 2026 12:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B66B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=d102NTuO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=u8EmU61Om1MzRF7qd4jvT1svz5chT/cVBi
	4gSOaMiGc=; b=d102NTuOKdTJBcDPqz8WT+L4Jfy367Bmf4MdBX31DMSrBq/hFj
	FRmcVnZVibHfHhgp++aC1evIUpstKlrPwg+D2qpS9IJD+eSzEzpL3DxvjJ1MTwv/
	kzemF02LQ7J8TLZlmUb7no8uWCH9u1oRpw3tFbZ6pbzqYRqI8lyCLv4k8=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.11])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCHATZLSN9qClRJAA--.2459S4;
	Mon, 26 Oct 2026 20:32:14 +0800 (CST)
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
Subject: [PATCH v4 2/3] usb: roles: look up role switches attached to a graph endpoint
Date: Mon, 26 Oct 2026 20:32:10 +0800
Message-ID: <20261026123211.243224-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCHATZLSN9qClRJAA--.2459S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4fZFy3ury5AFyktr4Dtwb_yoW5Zr4Upr
	yYkF4Fqr4UJFya9w4fGan8AFyrWw4fGF4UJF4xt3WfC3Zaq3yrJr18Ja4ayr1UCanIg34Y
	vw18A3409asrJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBSb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUx6pBDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREMB2reWNVnoAAMsp

usb_role_switch_get() and fwnode_usb_role_switch_get() look for a switch
on the caller's parent device node or through device_connection.  That
does not work when one controller exposes a role switch per connector
endpoint: the switch is registered against the remote graph endpoint and
the consumer (the connector) has no phandle to it.

Add usb_role_switch_at_endpoint(), which walks the caller's OF graph
endpoints and matches a switch registered on the remote endpoint, and try
it after the existing parent lookup.  There is no behaviour change for
existing users: if nothing is registered against an endpoint the lookup
falls through to the previous paths.

This is needed by DWC3 designs where two Type-C receptacles share one
High Speed data bus.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/usb/roles/class.c | 40 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index edec139..fc739fd 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -157,6 +157,42 @@ usb_role_switch_is_parent(struct fwnode_handle *fwnode)
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
+		if (!IS_ERR_OR_NULL(sw)) {
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
@@ -169,6 +205,8 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
 	struct usb_role_switch *sw;
 
 	sw = usb_role_switch_is_parent(dev_fwnode(dev));
+	if (!sw)
+		sw = usb_role_switch_at_endpoint(dev_fwnode(dev));
 	if (!sw)
 		sw = device_connection_find_match(dev, "usb-role-switch", NULL,
 						  usb_role_switch_match);
@@ -192,6 +230,8 @@ struct usb_role_switch *fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
 	struct usb_role_switch *sw;
 
 	sw = usb_role_switch_is_parent(fwnode);
+	if (!sw)
+		sw = usb_role_switch_at_endpoint(fwnode);
 	if (!sw)
 		sw = fwnode_connection_find_match(fwnode, "usb-role-switch",
 						  NULL, usb_role_switch_match);
-- 
2.53.0

