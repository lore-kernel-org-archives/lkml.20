Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927343;
	b=GHbittMSt8xSGDX19yAq7cuS5Fy++f1ZeqPpHWjGVNr4yPcLVmHl2vaymta8ovbT1bh2
	 iQjiqcXvKh/Z0vXU4RZWqHcAv/ZIJVBlqHzL/RfUpJOzklI3xPvUuGzrpnSwCQ+Kkf91Q
	 kPXlFdVjONoKlD5PCI+TQFNz9Vq02IGm0EqZHsTF3OzJlTz2ugaSu7aED7FarhGQvcrIX
	 JQJmCasiSpOvY/inXzO+MrIB9EDMicqqw0hApDCqRAtqS4iES+1OAA4q2IOLxFBkb0vYY
	 1HlT6h367mvllRdIOnePZA7UUJVhRy/LQZGoWCBEIHS91dMPD6qVQf2ixM6LFx7L37Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9xGhqAumENcBNtzDfruylYbHUoXUw8SL2Wwg6sFFVmM=;
	b=TC5MVGlit2hD4Xxfv8Wm2MdaV/GeTABspqK/mQnaGEsOH7iMRJzcBbfb6dREXUjO1Uv6
	 EX+0VZezGwFOpviLd6rztedqA6KvOxQZNcDLyX5G9QTS6Ji5+APNMM4y4xleVsgE8nDys
	 8r1b5UmjWbwUHCgIi3FVi+01ldGL8FiEaWXG1d6u+8Q96JLpg+pw60FdmivxfNvfC51k+
	 9y0z4wRrgfwqocRkuEYa8jS5z/x8+ffZ4iFkD5CljWdCyNVRzaeFV+SfGtc15+Xs1XkWJ
	 2T7zBz2WUGp+XRSwsUpnUf6KfKMY2ttDYzyDc6PXYZDnys+GNlVZy8OzsYun1V3cEMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stani.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yl9PcNYX;
	arc=none smtp.remote-ip=74.125.224.70
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D6A606A8B0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D6A606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yl9PcNYX
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67be4f2f42eso8465870d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794927342; x=1795532142; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xGhqAumENcBNtzDfruylYbHUoXUw8SL2Wwg6sFFVmM=;
        b=Yl9PcNYXflBqIPtfKg2D4kLjvUfhx6aDhhmmzb2FGXFL7CMxrm2BNsjdBwAvRctpUd
         6vaHXtCuMVlsv/NtTZM00x5Ey4M0LBVuJmFeOfkvElq5O97m2UjFP0FFIPNv5YB/x1Mb
         SQdYXlFE9TRbM5e6cgUrSVVHO8xHbnpU7nX1dVS7yqBU+gXk0ujgizErg9GrmnenIwrT
         YJXqsuAIx7OZ7ctYVWTVDLqKpBnrPYwLeK+lkAF1Wd+o1HQIE4Jv6ZYhnBgMkj6ZRunQ
         YQZkKNniK0J5Mze9zj4H4LiLjaREoppNf107GbU9XoJ9L9GJPCNu8z88Y2eyp63DaSdZ
         IohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927342; x=1795532142;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xGhqAumENcBNtzDfruylYbHUoXUw8SL2Wwg6sFFVmM=;
        b=sIUONUAipNuM5hbKwGy+XUYAOqujq8o4M3/UdoTzEwxKu6ebnsdURq/6IpDCm8q/8a
         N3hEXiV+Lh5ftlnmX9ABWWmGoQbK0QmYpx+E7fiV3NRnP+7idtu+AbBo4pD6VEEDAsLe
         48JsHaujMpa3YeZE0FdBxbRuegVIQ6+94y6R/DWM2ws9OOQRPpyioaG4G54UtbVz33Kr
         l0d2eAPQxkTInOtIbCOIuLE8A3xGkJEl7n/Q/H60F0felFXqw9Rrdoaz75Z6+rxBAPl7
         EdfaTEHIgu/ZDag0JIkTN291w1K6ckqqJqhi6z1db9aXb5bveFLj7X+lsWOGHW8Gshtq
         nToQ==
X-Forwarded-Encrypted: i=1; AL+hErHO8qHkHillpPofZqNHUIhgYmM7xyBOr2Wa5Ci1EYIvOFyXxUDiqbH1UL43koJKQ62iA+7I9FRrqXEBDMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0rGNVXCnhbisitdZ5d7bKbJmcoibnOx9Wq0cMO6QsCa7e2qag
	wb/D5Xh1eHb9/+xcPIqr7WVL0hRcFoa7ADprIcdLg6za1kpgCQSmkQwT8AKSikXhlEwfcmC5//i
	1PQ==
X-Received: from ywbi9-n2.prod.google.com ([2002:a05:690c:e209:20b0:8ab:3506:f904])
 (user=stani job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690e:43c3:b0:67b:f19f:9690
 with SMTP id 956f58d0204a3-67d8971eb9dmr3968944d50.115.1794927342132; Tue, 17
 Nov 2026 06:55:42 -0800 (PST)
Date: Tue, 17 Nov 2026 14:55:10 +0000
In-Reply-To: <20261117145522.1910636-1-stani@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117145522.1910636-1-stani@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117145522.1910636-5-stani@google.com>
Subject: [PATCH iwl-next 04/15] idpf: psp: add psp offload initialization
From: Stan Iliev <stani@google.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Decotigny <decot@google.com>, Madhu Chittim <madhu.chittim@intel.com>, 
	Emil Tantilov <emil.s.tantilov@intel.com>, Sridhar Samudrala <sridhar.samudrala@intel.com>, 
	Brian Vazquez <brianvv@google.com>, Li Li <boolli@google.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Daniel Zahka <daniel.zahka@gmail.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add the PSP offload initialization:
- Introduce VIRTCHNL2_CAP_CRYPTO (bit 26 of the other capabilities)
  and request it in VIRTCHNL2_OP_GET_CAPS if CONFIG_INET_PSP is
  enabled.
- Add struct idpf_adapter_psp to struct idpf_adapter.
- Implement idpf_psp_init(), called from idpf_vc_core_init() on each
  core init, including after a hard reset, and idpf_psp_free(), called
  from idpf_remove(). PSP is enabled if VIRTCHNL2_CAP_CRYPTO was
  granted, see idpf_is_psp_ena(). A failure disables PSP instead of
  failing the core init.
- Add the PSP device ops with idpf_psp_set_config(), and
  idpf_psp_register()/idpf_psp_unregister(). The PSP device is
  registered in a later patch, once all mandatory PSP device ops and the
  datapath are implemented.
- Build idpf_psp.c only with CONFIG_INET_PSP, with static inline stubs
  in idpf_psp.h otherwise.

Signed-off-by: Stan Iliev <stani@google.com>
---
 drivers/net/ethernet/intel/idpf/Makefile      |   2 +
 drivers/net/ethernet/intel/idpf/idpf.h        |  15 +++
 drivers/net/ethernet/intel/idpf/idpf_lib.c    |   1 +
 drivers/net/ethernet/intel/idpf/idpf_main.c   |   2 +
 drivers/net/ethernet/intel/idpf/idpf_psp.c    | 115 ++++++++++++++++++
 drivers/net/ethernet/intel/idpf/idpf_psp.h    |  24 ++++
 .../net/ethernet/intel/idpf/idpf_psp_def.h    |  21 ++++
 .../net/ethernet/intel/idpf/idpf_virtchnl.c   |   7 ++
 include/linux/net/intel/virtchnl2.h           |   1 +
 9 files changed, 188 insertions(+)
 create mode 100644 drivers/net/ethernet/intel/idpf/idpf_psp.c
 create mode 100644 drivers/net/ethernet/intel/idpf/idpf_psp.h
 create mode 100644 drivers/net/ethernet/intel/idpf/idpf_psp_def.h

diff --git a/drivers/net/ethernet/intel/idpf/Makefile b/drivers/net/ethernet/intel/idpf/Makefile
index 81b27a406747..3162ea913417 100644
--- a/drivers/net/ethernet/intel/idpf/Makefile
+++ b/drivers/net/ethernet/intel/idpf/Makefile
@@ -21,5 +21,7 @@ idpf-$(CONFIG_IDPF_SINGLEQ)	+= idpf_singleq_txrx.o
 idpf-$(CONFIG_PTP_1588_CLOCK)	+= idpf_ptp.o
 idpf-$(CONFIG_PTP_1588_CLOCK)	+= idpf_virtchnl_ptp.o
 
+idpf-$(CONFIG_INET_PSP)		+= idpf_psp.o
+
 idpf-y				+= xdp.o
 idpf-y				+= xsk.o
diff --git a/drivers/net/ethernet/intel/idpf/idpf.h b/drivers/net/ethernet/intel/idpf/idpf.h
index 77729921b0a3..fe16fd99a41d 100644
--- a/drivers/net/ethernet/intel/idpf/idpf.h
+++ b/drivers/net/ethernet/intel/idpf/idpf.h
@@ -28,6 +28,7 @@ struct idpf_rss_data;
 #include <linux/net/intel/virtchnl2.h>
 
 #include "idpf_txrx.h"
+#include "idpf_psp_def.h"
 
 #define GETMAXVAL(num_bits)		GENMASK((num_bits) - 1, 0)
 
@@ -625,6 +626,7 @@ struct idpf_rdma_irq {
  * @req_vec_chunks: Requested vector chunk data
  * @mb_vector: Mailbox vector data
  * @irq_mb_handler: Handler for hard interrupt for mailbox
+ * @psp: PSP offload state, see idpf_psp_init()
  * @tx_timeout_count: Number of TX timeouts that have occurred
  * @avail_queues: Device given queue limits
  * @vports: Array to store vports created by the driver
@@ -683,6 +685,7 @@ struct idpf_adapter {
 	struct idpf_q_vector mb_vector;
 	irqreturn_t (*irq_mb_handler)(int irq, void *data);
 
+	struct idpf_adapter_psp psp;
 	u32 tx_timeout_count;
 	struct idpf_avail_queue_info avail_queues;
 	struct idpf_vport **vports;
@@ -761,6 +764,18 @@ static inline bool idpf_is_rdma_cap_ena(struct idpf_adapter *adapter)
 	return idpf_is_cap_ena(adapter, IDPF_OTHER_CAPS, VIRTCHNL2_CAP_RDMA);
 }
 
+/**
+ * idpf_is_psp_ena - Determine if PSP offload is enabled
+ * @adapter: private data struct
+ *
+ * Return: true if PSP offload was negotiated in the last core init, see
+ * idpf_psp_init(), false otherwise
+ */
+static inline bool idpf_is_psp_ena(const struct idpf_adapter *adapter)
+{
+	return IS_ENABLED(CONFIG_INET_PSP) && READ_ONCE(adapter->psp.enabled);
+}
+
 #define IDPF_CAP_RSS (\
 	VIRTCHNL2_FLOW_IPV4_TCP		|\
 	VIRTCHNL2_FLOW_IPV4_UDP		|\
diff --git a/drivers/net/ethernet/intel/idpf/idpf_lib.c b/drivers/net/ethernet/intel/idpf/idpf_lib.c
index e03661503e5f..1385209519b2 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_lib.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_lib.c
@@ -6,6 +6,7 @@
 #include "idpf_ptp.h"
 #include "xdp.h"
 #include "xsk.h"
+#include "idpf_psp.h"
 
 static const struct net_device_ops idpf_netdev_ops;
 
diff --git a/drivers/net/ethernet/intel/idpf/idpf_main.c b/drivers/net/ethernet/intel/idpf/idpf_main.c
index 566d5804c8c1..2fab58f4b02b 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_main.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_main.c
@@ -5,6 +5,7 @@
 #include "idpf_devids.h"
 #include "idpf_devlink.h"
 #include "idpf_lan_vf_regs.h"
+#include "idpf_psp.h"
 #include "idpf_virtchnl.h"
 
 #define DRV_SUMMARY	"Intel(R) Infrastructure Data Path Function Linux Driver"
@@ -180,6 +181,7 @@ static void idpf_remove(struct pci_dev *pdev)
 	}
 	kfree(adapter->vport_config);
 	adapter->vport_config = NULL;
+	idpf_psp_free(adapter);
 	kfree(adapter->netdevs);
 	adapter->netdevs = NULL;
 
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp.c b/drivers/net/ethernet/intel/idpf/idpf_psp.c
new file mode 100644
index 000000000000..c1297ec59163
--- /dev/null
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <net/psp.h>
+
+#include "idpf_psp.h"
+
+/**
+ * idpf_psp_init - Initialize PSP offload
+ * @adapter: private data struct
+ *
+ * Called on each core init, including after a hard reset: PSP offload is
+ * negotiated again, the CP may grant different capabilities. PSP offload uses
+ * the virtchnl2 crypto offload API: if VIRTCHNL2_CAP_CRYPTO was not granted or
+ * the negotiation fails, PSP stays disabled for the adapter instead of failing
+ * the core init, see idpf_is_psp_ena().
+ */
+void idpf_psp_init(struct idpf_adapter *adapter)
+{
+	struct idpf_adapter_psp *psp = &adapter->psp;
+	struct device *dev = &adapter->pdev->dev;
+
+	WRITE_ONCE(psp->enabled, false);
+
+	if (!idpf_is_cap_ena(adapter, IDPF_OTHER_CAPS, VIRTCHNL2_CAP_CRYPTO)) {
+		dev_notice(dev, "PSP disabled, crypto capability not granted\n");
+		return;
+	}
+
+	WRITE_ONCE(psp->enabled, true);
+}
+
+/**
+ * idpf_psp_free - Release the PSP offload resources
+ * @adapter: private data struct
+ *
+ * Called on remove, after idpf_vc_core_deinit().
+ */
+void idpf_psp_free(struct idpf_adapter *adapter)
+{
+	idpf_psp_unregister(adapter);
+}
+
+/**
+ * idpf_psp_set_config - Set the PSP device configuration
+ * @psd: PSP device
+ * @conf: new configuration
+ * @extack: netlink extended ack for error reporting
+ *
+ * The configuration is applied by the PSP core.
+ *
+ * Return: 0.
+ */
+static int idpf_psp_set_config(struct psp_dev *psd, struct psp_dev_config *conf,
+			       struct netlink_ext_ack *extack)
+{
+	return 0;
+}
+
+/* PSP device operations, see idpf_psp_register() */
+static struct psp_dev_ops idpf_psp_ops = {
+	.set_config	= idpf_psp_set_config,
+};
+
+/**
+ * idpf_psp_register - Register the PSP device
+ * @adapter: private data struct
+ *
+ * Register the PSP device of the first netdev if PSP offload was negotiated
+ * and the netdev is registered.
+ */
+void idpf_psp_register(struct idpf_adapter *adapter)
+{
+	struct device *dev = &adapter->pdev->dev;
+	struct psp_dev *psd;
+
+	if (!idpf_is_psp_ena(adapter) || adapter->psp.psp_dev)
+		return;
+
+	if (!adapter->netdevs || !adapter->netdevs[0] ||
+	    !test_bit(IDPF_VPORT_REG_NETDEV, adapter->vport_config[0]->flags))
+		return;
+
+	/* The driver only allocates and inserts PSP version 0 keys */
+	adapter->psp.caps.versions = BIT(PSP_VERSION_HDR0_AES_GCM_128);
+
+	psd = psp_dev_create(adapter->netdevs[0], &idpf_psp_ops,
+			     &adapter->psp.caps, NULL);
+	if (IS_ERR(psd)) {
+		dev_err(dev, "PSP failed to register: %pe\n", psd);
+		return;
+	}
+
+	adapter->psp.psp_dev = psd;
+	dev_info(dev, "PSP Netlink device registered successfully: id=%u\n",
+		 psd->id);
+}
+
+/**
+ * idpf_psp_unregister - Unregister the PSP device
+ * @adapter: private data struct
+ *
+ * The PSP core deletes the TX keys of all the associations, see
+ * idpf_psp_tx_key_del(). Called before the netdev of the PSP device is
+ * unregistered.
+ */
+void idpf_psp_unregister(struct idpf_adapter *adapter)
+{
+	struct psp_dev *psd = adapter->psp.psp_dev;
+
+	if (!psd)
+		return;
+
+	psp_dev_unregister(psd);
+	adapter->psp.psp_dev = NULL;
+}
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp.h b/drivers/net/ethernet/intel/idpf/idpf_psp.h
new file mode 100644
index 000000000000..0f89dcc3b398
--- /dev/null
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _IDPF_PSP_H_
+#define _IDPF_PSP_H_
+
+#include "idpf.h"
+
+#if IS_ENABLED(CONFIG_INET_PSP)
+
+void idpf_psp_init(struct idpf_adapter *adapter);
+void idpf_psp_free(struct idpf_adapter *adapter);
+void idpf_psp_register(struct idpf_adapter *adapter);
+void idpf_psp_unregister(struct idpf_adapter *adapter);
+
+#else /* !CONFIG_INET_PSP */
+
+static inline void idpf_psp_init(struct idpf_adapter *adapter) { }
+static inline void idpf_psp_free(struct idpf_adapter *adapter) { }
+static inline void idpf_psp_register(struct idpf_adapter *adapter) { }
+static inline void idpf_psp_unregister(struct idpf_adapter *adapter) { }
+
+#endif /* CONFIG_INET_PSP */
+
+#endif /* !_IDPF_PSP_H_ */
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_def.h b/drivers/net/ethernet/intel/idpf/idpf_psp_def.h
new file mode 100644
index 000000000000..2edb114784c1
--- /dev/null
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_def.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _IDPF_PSP_DEF_H_
+#define _IDPF_PSP_DEF_H_
+
+#include <net/psp.h>
+
+/**
+ * struct idpf_adapter_psp - PSP offload state of an adapter
+ * @enabled: PSP was negotiated with the CP in the last core init, see
+ *	     idpf_is_psp_ena()
+ * @psp_dev: the PSP device, see idpf_psp_register()
+ * @caps: capabilities of @psp_dev
+ */
+struct idpf_adapter_psp {
+	bool enabled;
+	struct psp_dev *psp_dev;
+	struct psp_dev_caps caps;
+};
+
+#endif /* !_IDPF_PSP_DEF_H_ */
diff --git a/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c b/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
index fedac4716b08..3f669683c8c0 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
@@ -9,6 +9,7 @@
 #include "idpf.h"
 #include "idpf_virtchnl.h"
 #include "idpf_ptp.h"
+#include "idpf_psp.h"
 
 /**
  * idpf_vid_to_vport - Translate vport id to vport pointer
@@ -584,6 +585,10 @@ static int idpf_send_get_caps_msg(struct idpf_adapter *adapter)
 			    VIRTCHNL2_CAP_PTP			|
 			    VIRTCHNL2_CAP_EDT);
 
+	/* PSP offload uses the virtchnl2 crypto offload API */
+	if (IS_ENABLED(CONFIG_INET_PSP))
+		caps.other_caps |= cpu_to_le64(VIRTCHNL2_CAP_CRYPTO);
+
 	err = idpf_send_mb_msg_stack(adapter, &xn_params, &caps);
 	if (err)
 		return err;
@@ -3179,6 +3184,8 @@ int idpf_vc_core_init(struct idpf_adapter *adapter)
 		goto intr_rel;
 	}
 
+	idpf_psp_init(adapter);
+
 	err = idpf_ptp_init(adapter);
 	if (err)
 		pci_err(adapter->pdev, "PTP init failed, err=%pe\n",
diff --git a/include/linux/net/intel/virtchnl2.h b/include/linux/net/intel/virtchnl2.h
index 39fea65c075c..ec1a742b6557 100644
--- a/include/linux/net/intel/virtchnl2.h
+++ b/include/linux/net/intel/virtchnl2.h
@@ -221,6 +221,7 @@ enum virtchnl2_cap_other {
 	/* Other capability 20 is reserved */
 	VIRTCHNL2_CAP_FLOW_STEER		= BIT_ULL(21),
 	VIRTCHNL2_CAP_LAN_MEMORY_REGIONS	= BIT_ULL(22),
+	VIRTCHNL2_CAP_CRYPTO			= BIT_ULL(26),
 
 	/* this must be the last capability */
 	VIRTCHNL2_CAP_OEM			= BIT_ULL(63),
-- 
2.56.0.679.gc527c65306-goog

