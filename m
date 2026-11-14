Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794666385;
	b=vTo+FcVM4eVLId27OgjxwmWgHD531h0g46PWxX5qHeAwuxzjQVzXjhefCauYqqRqtun2
	 gW64884a0OjJCyn4N8fNUVJhS/XoQW0n9ipnniQJlWyoEVRfU6OeLRlw2BEsOrOuML6Wk
	 L1GlamKSpbOnxt8KPMjmHO83b4TifB0pvJcSMaSQo7LJ7FEv3QBnoIe+tc0grpv39u7un
	 2DT+/xlwfK4DGRkC4WYbWrugZqdxWyavSk/pq08isUjyetmDgffOJBR40IRD16QVQlCD4
	 UMteBXUEjeTlUqz5NVSKuZYIceWCpDQfgF+9FHSKBiWeRCMoreIOEqxJy5UHz2k3hug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666385;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JfRW0SPoALVVWDl2xAXTfh37dfRQmby6sb8WYvVZUog=;
	b=clXSuXNYlOUy0yDpugxD6AsVqsFBhM+Lh4DrVOhGONm3yy3wcyMpaanFjE9h3zYQi85F
	 wsIffKbh9PGYZtfq+8kr2iAdejV7jNTK4/JLlzDAqtfAUg1vKmTWMwKJ2hwhrl8WbTDi4
	 Dab9S7vH0bC5xtO20+tknrgVNZeWI1Cxk2Iv6pO0MWipGGSOYMqLwQLfU7mGyOIita5Lz
	 NcOkwvDyn3crTSyoctM5lXeIJfGVG2y1n3nUPP6JTlRsdsdGCNbgtyfJqWSchqP33QSp1
	 +mErg3WcIVRVJeUQUIofM/wwluq8KeWdPp8gTR42PjBKIwizH7B8mm2uc/aQpx1o7YQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QJg6C5DX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15293606A896;
	Sat, 14 Nov 2026 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QJg6C5DX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794666384;
	b=SjBZiA5OVJaEmitBNwOgiVIdSyNWBgZRskEOygIiZs54LxH2MdYCKlcPmbBD3++ebjs1
	 RJExqcEEvrWM44odAOOucsPGKaPcS+MWsbb0JyXLmrUZ2IGBswcAyEawT9f+zAynRdjCg
	 hdzC++nDySGu9kbynDq8t47lBxGToDLeyMszXAWMG1anvEoYllBz0wzywrWkC7yfNeLVF
	 Z+Q9qfOVXP7EreNqqtxbPUVPj7N8sIgnJoeLEzvZVXPttcZ7s4jkpF/x6sqT8/6/mU75d
	 VbtuTPhPIYw7rdR7uCASuYPLGSDVNkKhyEyqD4OHnnpudQt7tfUYLhPQ+6D81WNxOwg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794666384;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JfRW0SPoALVVWDl2xAXTfh37dfRQmby6sb8WYvVZUog=;
	b=zZGIGPobJEnEJ+9X4bcHAIyWSmkSvkqar7FIwrG7GhFThy/jzN6xqgCPvno9+KlHxj5w
	 si4GBFFfjpanvFs/sLBTUcfetcORzdrKPXpyQcwBHeWbZSj08sBrGh5VuP2x6a+kOA9sc
	 CHhOjBPblzfp1ByeBo7d1tHRvn/IVsiIMXfnzYZlSWlo983/kC30U/NJjCq3eK96WzUxW
	 5Anx3OaYveUYhCEhKGPFJpTPiOHa6M0POFDMOU0fKKYooLmIRwDJBqyWdfg+ueJvrmJ1J
	 sbj+lFnPstCzOzvQQcKT8Dz3w0QWkiHE+IUxrFk+DpPB6fziJcQF65VIxcr3kdzy8Hg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B0691F000C7;
	Sat, 14 Nov 2026 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794666384;
	bh=JfRW0SPoALVVWDl2xAXTfh37dfRQmby6sb8WYvVZUog=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QJg6C5DX2mCqZ3Aw6oD/qUmkFRKukwTm090M6yHRRPau9DpFjw7IPGkqz0kMzIVVU
	 2JYB+35kXfUKAzZpoz3smm3S6Cjq/eBxLai+J27bccNlvBn5oOreFmUkxaAEyXvSgm
	 4Rq7H4i+Z7IKNaSkXetbpQkymvrUq5SzFfLTRh8wQaOk+Z1WdjYAyu1IaO1fHa9H0V
	 dtyWfNBMwYv5v9AzEZja9t31Rb56fNDuLx8aGxWBBO/ke3QjDnGogNkAvyK7pIW7qF
	 L45ihg4kU1Fjv2mVmSaac1HzAOSFQ/hoGhibmb9XAGXS7+Chp6md1KrMfPITpTLcTJ
	 iYTxpxYB86VXQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 979CF49E13;
	Sat, 14 Nov 2026 14:26:22 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Sat, 14 Nov 2026 06:26:15 -0800
Subject: [PATCH net-next v6 3/4] wifi: ath11k: Connect to the QMI server
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
Message-Id: <20261114-qrtr-multi-ep-v6-3-2eb9885659e2@oss.qualcomm.com>
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
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4200;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=8jdd/IxbkpdXzxb0pbbCtVyl0Xl30Xp8Q0D9LtdyvhY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq+G+MdCpglDqJ7ksgVMyS/6Ga5RlvpyEy3ouzP
 eUKqKgGJVmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavhvjAAKCRBVnxHm/pHO
 9cTTB/0SpxQBMe/ggVXE3x/9nzHMBhrZLaTxGW717zBXUS9mRNRA/b1Slp0iuCPt9WtDOKgOsQP
 f1AIqY8cIDRn1A6T0FEVy9C0pAbS82q1BYbjg3hxwy1CmPbz5reoXyjveFDyObj0skwypLw9Cwh
 j1bLfQ4VRO7VX9vJqVJogApZI1u6RfXFbsT9zeIQUceVzumrj9dtr4rzChYW6r+wZ+8uL0A8Vdh
 CHvXtWYxRekJzsZBvQ6QcK3NtXeEDDENtbhBr6gyH0ZVt4fJOKK4GeSKYS6bCq3cTu7zy3lOqkc
 IChwFISFVJD9kiw87rLwwS8KB3818BLFALXk1u9tUm9khXEY
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Content-Transfer-Encoding: 7bit

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

When two identical ath11k PCIe devices are connected to the same host, both
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

Reviewed-by: Simon Horman <horms@kernel.org>
Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/hif.h |  9 +++++++++
 drivers/net/wireless/ath/ath11k/pci.c |  9 +++++++++
 drivers/net/wireless/ath/ath11k/qmi.c | 11 +++++++++++
 3 files changed, 29 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hif.h b/drivers/net/wireless/ath/ath11k/hif.h
index 017fed1b4bd1..f432fa4890be 100644
--- a/drivers/net/wireless/ath/ath11k/hif.h
+++ b/drivers/net/wireless/ath/ath11k/hif.h
@@ -32,6 +32,7 @@ struct ath11k_hif_ops {
 	void (*ce_irq_disable)(struct ath11k_base *ab);
 	void (*get_ce_msi_idx)(struct ath11k_base *ab, u32 ce_id, u32 *msi_idx);
 	void (*coredump_download)(struct ath11k_base *ab);
+	unsigned int (*get_qrtr_node_id)(struct ath11k_base *ab);
 };
 
 static inline void ath11k_hif_ce_irq_enable(struct ath11k_base *ab)
@@ -159,4 +160,12 @@ static inline void ath11k_hif_coredump_download(struct ath11k_base *ab)
 		ab->hif.ops->coredump_download(ab);
 }
 
+static inline unsigned int ath11k_hif_get_qrtr_node_id(struct ath11k_base *ab)
+{
+	if (!ab->hif.ops->get_qrtr_node_id)
+		return 0;
+
+	return ab->hif.ops->get_qrtr_node_id(ab);
+}
+
 #endif /* _HIF_H_ */
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index a163168f3617..d40c057e130c 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -10,6 +10,7 @@
 #include <linux/of.h>
 #include <linux/time.h>
 #include <linux/vmalloc.h>
+#include <net/qrtr.h>
 
 #include "pci.h"
 #include "core.h"
@@ -900,6 +901,13 @@ static int ath11k_pci_start(struct ath11k_base *ab)
 	return 0;
 }
 
+static unsigned int ath11k_pci_get_qrtr_node_id(struct ath11k_base *ab)
+{
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+
+	return qrtr_host_node_id(ab_pci->mhi_ctrl->index);
+}
+
 static const struct ath11k_hif_ops ath11k_pci_hif_ops = {
 	.start = ath11k_pci_start,
 	.stop = ath11k_pcic_stop,
@@ -921,6 +929,7 @@ static const struct ath11k_hif_ops ath11k_pci_hif_ops = {
 #ifdef CONFIG_DEV_COREDUMP
 	.coredump_download = ath11k_pci_coredump_download,
 #endif
+	.get_qrtr_node_id = ath11k_pci_get_qrtr_node_id,
 };
 
 static void ath11k_pci_read_hw_version(struct ath11k_base *ab, u32 *major, u32 *minor)
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7dc07339b957..09c23ddffb38 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3170,8 +3170,19 @@ static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 	struct ath11k_qmi *qmi = container_of(qmi_hdl, struct ath11k_qmi, handle);
 	struct ath11k_base *ab = qmi->ab;
 	struct sockaddr_qrtr *sq = &qmi->sq;
+	unsigned int node_id;
 	int ret;
 
+	/*
+	 * Identical devices advertise the same QMI services, so connect only
+	 * to the QMI server on this device's node. A node id of 0 means the
+	 * transport has not assigned a unique node id, so accept the server
+	 * unfiltered.
+	 */
+	node_id = ath11k_hif_get_qrtr_node_id(ab);
+	if (node_id && service->node != node_id)
+		return -EINVAL;
+
 	sq->sq_family = AF_QIPCRTR;
 	sq->sq_node = service->node;
 	sq->sq_port = service->port;

-- 
2.43.0


