Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794666384;
	b=QT9JuK70jJzKtAHkOHsGCkOyxwjuaDXpTL22x7RmbW6kCCSQOG0euIZO12foZRwxqCt+
	 hj1n69FCWvNWOFUaVYAgO/ctJKfk6GiGzZYMj+eVW+hOZJyO/UYlVNQ9QBPyBJkP76d1b
	 xyhWXyh73UfLrzn4VVij6n4M7jR1uniFVQypUif8lsYZsOwpS85VBpG0YTh+oYke7Rolq
	 aFs3xeKAIhp23maZLuIP+1fI36NcZ1wK04izZgb1QCSbjx80j1WNrvl6KcuPHAOzj0QHD
	 xY5aNWU4zNVq8bkR8Z6NSJ+WT7RNHZ5sg1n2pRUN/jRu7i1JB72Fav1mvAewseRl0vA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666384;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lXC/bDKgvZAq8xaE8sidEO6SzUhZpkifQG9ccrdjriU=;
	b=jiz+u4qnChK88E4TLPQK9RpO0uWD6eD4sCDet7RSgAkln02oIEV5BrE9Ml+jV+8+8W62
	 QlXpWpeEfMzAdBjdSmb4APvXAEzao5ltMkgP8GNB4LjOx109FtE9hzaxR9zSthXhmulL0
	 Ef+V2S+8gh5x97Kq+DL1WZYA8rh83nrQdd16RwHyntjPZWEqa6u9DwGCCYLNHd0tWGc+r
	 T9HPGVYF3d0RAyOBAVPmsRPwNbzpvoDI5lIZUSia23TFlQEd5bZIq7dfxBAMQvOQReP+N
	 7poe/6AidTlV0tfaLOfJ17ShaNG7jTEe8m6EhYblZ//SJzaTsAcJCuJ3Ar7CvsXYsxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHRxNUks;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE314606A882;
	Sat, 14 Nov 2026 14:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHRxNUks
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794666384;
	b=bKUmRC9BuaXEOU4mHtMXCNigYN4oaZ+yM0TQuQb07WKDnqkpjDBdNeWqNpQM57iewv0A
	 55sPMWIeyNbeKRJjprh+I6EkfaM8/sAlvDqeHqw5aQOxiLPcuHeJ6CWc3R1lrBQYqk52X
	 LjKNMUHyvws6iQwVWsYBRpmX1GHZEaTsgvaF4AOSzZBz7H4Zrkj30/DmHyzqGfsbxaY3f
	 2mZFWhtPG9n2uWKfC/bIYysLH+tFFCsTmpfWGQNuddbFCX7Psv4LIQwzS3Q/X4JMuDsHz
	 IbVZm1a5VkLqF03SWMuTtxB82xu8cpStItqZebyDeYZESU527bmeFMUsCGUg/Bv6htA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794666384;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lXC/bDKgvZAq8xaE8sidEO6SzUhZpkifQG9ccrdjriU=;
	b=LykzfaiGYDhuuUHxRiBnyJxbDVdwA4kBJcCpfe00Bc1i4wYHo/t4cXioA1IWqzJoWFxx
	 +vPqHk1Y2J4BGjqF+lVPeHqF4KEFHMDKPiFBaR0QABI4zxLIQc4jC5CTgNUrNn2y2Ih2t
	 7zKdjM0tY8un+/X5zoIoq7pw4fd/rcuR1KNtUbAkRpAO5eIb/uxPaALLlgAxYUtQ3FIaW
	 a0cskCpoxRVIImfEoPkFKVUmpMuv+8/NnBOTfyLBvQDP0PZPy+QCsAAj03pWPFxxqFSBI
	 xHnO61Ww2tfKdR4i1aqHjZ586qnHEDrGdlfADYq0HwFkBloxjRp9M1kHZJFCMEaKNEQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A3551F000C8;
	Sat, 14 Nov 2026 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794666384;
	bh=lXC/bDKgvZAq8xaE8sidEO6SzUhZpkifQG9ccrdjriU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mHRxNUksdm/jXtujd9DW0LXIWzBJU2+y8hkOXPHAlmPy6D1jjHpz4wSCPVPv9d/IX
	 7UHJyx/naqCVyBY6dRlIoL6q3LwpcggVNossVkwy2GpgKM0+yl4K/1tPjgXSlt+yvm
	 bD5Iek4PZ/8YtdZ+kI5EGNh0Bq77pJfLauP8vAUyL9eO4aa8Ni97Uc3bfh6iIh7vn7
	 r2alIyleTSsv6/B4H+cgkpwcftuHSdjuERjUFecOHwBLO8AkNJpSaikDoN44dGGUNw
	 zq0R/SoqmweaZpHCfgU0C/KoWsQxwk2lF2N+hiNgeJ3T02XWuavG1vov044rEZ6hs2
	 wCJcDR1DySyAg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AF8BD49E17;
	Sat, 14 Nov 2026 14:26:22 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Sat, 14 Nov 2026 06:26:16 -0800
Subject: [PATCH net-next v6 4/4] wifi: ath12k: Connect to the QMI server
 belonging to the device owned by this driver
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
Message-Id: <20261114-qrtr-multi-ep-v6-4-2eb9885659e2@oss.qualcomm.com>
References: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
In-Reply-To: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, Eric Dumazet <edumazet@kernel.org>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Chris Lew <christopher.lew@oss.qualcomm.com>, 
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
 Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, 
 Juha-Matti Tilli <juha-matti.tilli@iki.fi>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4724;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=mhErcsLQdS5uRROGeaSOA51h7VNX0VQpNNW/OtbOflM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq+G+Mud4Zdlum8LTiIrzL8pGCJY7NjWrJYUqc/
 Is4d+4a8CCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavhvjAAKCRBVnxHm/pHO
 9fzaCACLjl47gJVABQBE9GJwNrphR4ZV5S0CL7iZMh67+h/cH8PJFXzQ2r4TNSR67LQsV+hhTn8
 qE0d1M8Ypp0/FJ6iWX1Dm6JbWxPuwARbyAjfe8QrPeLztnpYZFUT52mlRgVfucBeJdHn0TM8reQ
 1uqeJszwCcwGrXH+JSdgXtLoIe51n0MjqINUhxbrtCmdiUMiUhTnhpnFYNKT6V2m+GoJCYJmi3I
 l+T+Dqba+ypeaY/4HVjyYiAKyNNP5iLWkNdChkfK5hdm6AR/LsrooXrVbsyEVW6TgoarCqRM5VZ
 nbuSp4SmQhjOC3gjQ0fr3jtHo6KNh+3hkK8eygtn82D23SsS
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Content-Transfer-Encoding: 7bit

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

When two identical ath12k PCIe devices are connected to the same host, both
advertise the WLFW service with the same service and instance id. The QMI
lookup reports both servers to each device, so a device may connect to the
firmware running on the other device.

But now, QRTR provides each MHI endpoint a unique node id which is
different from the node id announced by the device. So use the same id to
pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
the node id derived from the MHI controller index and zero for transports
that do not assign one. In the new_server callback, reject any service
whose node id does not match. A node id of zero disables the check, so
transports that do not assign one keep their current behavior.

Tested-on: 2x WCN7850 hw2.0 WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1

Reviewed-by: Simon Horman <horms@kernel.org>
Tested-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Tested-by: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hif.h |  9 +++++++++
 drivers/net/wireless/ath/ath12k/pci.c |  9 +++++++++
 drivers/net/wireless/ath/ath12k/qmi.c | 12 ++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hif.h b/drivers/net/wireless/ath/ath12k/hif.h
index aecdb0c5f285..c2cfe9a75493 100644
--- a/drivers/net/wireless/ath/ath12k/hif.h
+++ b/drivers/net/wireless/ath/ath12k/hif.h
@@ -31,6 +31,7 @@ struct ath12k_hif_ops {
 	void (*ce_irq_disable)(struct ath12k_base *ab);
 	void (*get_ce_msi_idx)(struct ath12k_base *ab, u32 ce_id, u32 *msi_idx);
 	void (*coredump_download)(struct ath12k_base *ab);
+	unsigned int (*get_qrtr_node_id)(struct ath12k_base *ab);
 };
 
 static inline int ath12k_hif_map_service_to_pipe(struct ath12k_base *ab, u16 service_id,
@@ -153,4 +154,12 @@ static inline void ath12k_hif_coredump_download(struct ath12k_base *ab)
 	if (ab->hif.ops->coredump_download)
 		ab->hif.ops->coredump_download(ab);
 }
+
+static inline unsigned int ath12k_hif_get_qrtr_node_id(struct ath12k_base *ab)
+{
+	if (!ab->hif.ops->get_qrtr_node_id)
+		return 0;
+
+	return ab->hif.ops->get_qrtr_node_id(ab);
+}
 #endif /* ATH12K_HIF_H */
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 12bbb75570f1..e56f2f9d721e 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -10,6 +10,7 @@
 #include <linux/pci.h>
 #include <linux/time.h>
 #include <linux/vmalloc.h>
+#include <net/qrtr.h>
 
 #include "pci.h"
 #include "core.h"
@@ -1493,6 +1494,13 @@ void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend)
 	ath12k_pci_sw_reset(ab_pci->ab, false);
 }
 
+static unsigned int ath12k_pci_get_qrtr_node_id(struct ath12k_base *ab)
+{
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
+
+	return qrtr_host_node_id(ab_pci->mhi_ctrl->index);
+}
+
 static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
 	.start = ath12k_pci_start,
 	.stop = ath12k_pci_stop,
@@ -1513,6 +1521,7 @@ static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
 #ifdef CONFIG_ATH12K_COREDUMP
 	.coredump_download = ath12k_pci_coredump_download,
 #endif
+	.get_qrtr_node_id = ath12k_pci_get_qrtr_node_id,
 };
 
 static enum ath12k_device_family
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d..86ec7f2431e2 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -9,6 +9,7 @@
 #include "qmi.h"
 #include "core.h"
 #include "debug.h"
+#include "hif.h"
 #include <linux/of.h>
 #include <linux/firmware.h>
 #include <linux/of_address.h>
@@ -3992,8 +3993,19 @@ static int ath12k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 	struct ath12k_qmi *qmi = container_of(qmi_hdl, struct ath12k_qmi, handle);
 	struct ath12k_base *ab = qmi->ab;
 	struct sockaddr_qrtr *sq = &qmi->sq;
+	unsigned int node_id;
 	int ret;
 
+	/*
+	 * Identical devices advertise the same QMI services, so connect only
+	 * to the QMI server on this device's node. A node id of 0 means the
+	 * transport has not assigned a unique node id, so accept the server
+	 * unfiltered.
+	 */
+	node_id = ath12k_hif_get_qrtr_node_id(ab);
+	if (node_id && service->node != node_id)
+		return -EINVAL;
+
 	sq->sq_family = AF_QIPCRTR;
 	sq->sq_node = service->node;
 	sq->sq_port = service->port;

-- 
2.43.0


