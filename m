Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794666384;
	b=w92FW+8k5fEw2/lG2gRUORy+f2EBwQTXekvE3vWVO5muoD05hDCi0bkan/xT6JZk+DSA
	 qyokn3dgytHKQc/OTcp30rmfm9jCiIQ1WSuu/EBqPS/yiTmI5bV6Bksy14vAkYbi+5WKE
	 yxwPZp39kdgyJU0YvNxxEImU2/hFxP5My3/NzOzY403tfhU+ldMIkxZ8MrRYh006VFUDP
	 kzkIl772DXPh3Uw6dZ4tkBBCzp+dr6lb3gZE8sTXPJfZNtC7iYgZAsFjcB+C+ZHbfW44O
	 05fA4MFmRKIfV+Fr6oBJmYJM9//HYHf1K21GMCDxe13w1856lFQkk8pLvkFIjI6B+Zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666384;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Wjg/hmR2F1mQvKNh7DvhNzVPRNABdhbsmvxGWJAb9g8=;
	b=KRjhaoTDeBcJPstooEmT41+UYdu27/NW3CjKZsZ1Qv2ICNoDKU638g3AhcKe7eXai8Sr
	 G+vE60xF/Xtk7neJh8tAxwK1hAwonCB8aQU6DuCao4+qLpiXIK/2UuL2QikaZx8o060E+
	 lidBvxb0j6tsCIoh7a4g5HsxGpTVcLtuTl1TcKStDP74PZk7JwtWqHqms6kpK/YPdWglU
	 hCiMqmJWJd8phwSNEOtJIK4+3lvojCs08U6hF6E6INhh2AylG26gZhSq2vtAad8V1AdxT
	 eJ82tIL8W28ikPvH6HQcHvXNqZJefq7HzOULLc3m6Fl8I8YngtOauyvaeE2oCzlA/1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XA0zLuT6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE42B606A33E;
	Sat, 14 Nov 2026 14:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XA0zLuT6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794666384;
	b=L/wfocZYPOblzkG2V1BHW0SbINcl3DdBndNjtVIbsFP7+QtyUZBWdViyAIjcNktSWP+W
	 byqElod0sui0AJOZA0pjYdjBgQ5cBUaEWld/p1+eol/rRdRfBurq/lSAZoQ/t70PbFyll
	 5YXZ3kgfLolctvc1xhwaO8I7NFbuje1VM6uBPqAS3Yd5LKoLwQ0hvaxRgze+KgssdApv9
	 v+wFopASA6vqTNwAhkAT96OhJs3+hl3mWKBvEL3YNVl5dNnXG/fdIdz75voSHs9kIGZSn
	 t8ADJgbkBroNcp+li/IRU3x/viPwznAIGXpARhR1MqvAK5q3cmFcDjVZz/H4q3g4iyQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794666384;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Wjg/hmR2F1mQvKNh7DvhNzVPRNABdhbsmvxGWJAb9g8=;
	b=E2PT82NGAdnWAxwHA8EneiFyZaIM0S3o6j6YYLAuhYQ3CsPZA24uPNaqvSBrWF8quxlN
	 rg+it5jT0sFM/mCnYNVQVNtc7KkUmPmZJBfRGLxmIt2Wyl+D8I6925EdZzW2K7anACFQe
	 4q2dszws1NzLw3BzbMs0hWF9lJMx96g2yYHI7aCFRBIoUekdT3XwJi73PFs6no9o3VWGj
	 x4FXXrUVNkrOfGOB3s+dqYhkFHmz32LV5aUoHYPFV9dBcG6yILFj6wGdldf0B4x2e2iYn
	 FBSjwi1/fT/ZqN2X+F/uQkbbc0R19cNSroNrXVew0yZRonRZUJL2gWQEzilEodXmJnQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 03E241F000C6;
	Sat, 14 Nov 2026 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794666384;
	bh=Wjg/hmR2F1mQvKNh7DvhNzVPRNABdhbsmvxGWJAb9g8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XA0zLuT6tf7GC82CZjCVaVQOT9dxN+FR/ZOqWSO+3zv0TwE6IRHbTrU/4FTLG4inp
	 Y4bWjktMTT1TI1V52Es8mUuy7rFpDCkV+Io1/XAxPpHjU+B81X0sd+3Nhr/BhEY5tO
	 LqolbQqK6ywUn6u9cU9XyCgijJ8K6zhFh264BPd3VRcZlDuUrbI42UHqTK2L/+d5vx
	 6qMiJvCQYrdIs3HfoSmLsBVMX8lo0THyq3JunY9OZ4YdfI03L1Y1wjrtZYG8wycxzr
	 Yptj9KNHzBDU0z4JveLh4FaBl4g/umkaoUm/gAYuGYu/zxTUJ6HeCDGq35F/Wx8bxX
	 v1xSvnHEANvrw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8216C49E0F;
	Sat, 14 Nov 2026 14:26:22 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Sat, 14 Nov 2026 06:26:14 -0800
Subject: [PATCH net-next v6 2/4] net: qrtr: Assign unique node id for MHI
 endpoints
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
Message-Id: <20261114-qrtr-multi-ep-v6-2-2eb9885659e2@oss.qualcomm.com>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3283;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=/mk4KdzpVcWWvNuNI4IR+JOBKyEh5ixXNDCmghcPA1w=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq+G+Lh1Yq2gHtGGj+kgVuJakXYCcwOfivdyhI6
 PSJIar0jdGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavhviwAKCRBVnxHm/pHO
 9VUAB/9IzaGbMTpsXnd2PGz8c3gcqZy+Z+jxOiamRn/UjfTo06hrOYU1fkCp+YemMD12Oe2ymlA
 2hpgWJ6qfcSNmWm7QP212nafX4Lc5oyHEMB7W3Ir6lJqtSzNsCDe+BGVjgmmN6015Yhe4sYrTkg
 gHsZDn75WBS6NAYOqbskC0/QzAz0w9/j2xoaih8eNdwDGxEwUHHcrMfXrhXonk2nGK62Ao1EyMD
 7fB+4+NX4XCtn/0mzlP90JAz5snM/9h0ivmzv5+o6LBgFslxqA+ML64Ru7BZtwrdgR6A7NGhA8O
 4uc76PuzAFjH5V44iL5Qqc/CDtgAdqHEnyjkaL5CGZU0G1HE
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Content-Transfer-Encoding: 7bit

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Now that the QRTR driver allows using the unique node id for each device,
which is different from the node id received from the remote node, compute
a unique node id using a new API, qrtr_host_node_id().

This API takes the 'index' parameter and adds it to QRTR_NODE_HOST_BASE.
The index comes from an allocator, so the host assigned ids are unique
among themselves. The base is chosen just above the 16-bit range a v2
header can express, so an endpoint using v2 can never claim an id in the
host range. An endpoint using v1 can claim any 32-bit id, so a collision
is possible, but unlikely as the firmware assigned node ids are either
smaller than this base or in the range of 0x08e5ff85. Such a collision is
caught when the id is added to the node lookup table.

Finally, call the new API from MHI endpoint driver by passing the MHI
controller index as the parameter. The MHI controller index is unique for
each controller, thereby for each MHI endpoint device.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 MAINTAINERS        |  1 +
 include/net/qrtr.h | 27 +++++++++++++++++++++++++++
 net/qrtr/mhi.c     |  4 +++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cf311e6c4be..dfec5181c6e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23139,6 +23139,7 @@ QUALCOMM IPC ROUTER (QRTR) DRIVER
 M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	include/net/qrtr.h
 F:	include/trace/events/qrtr.h
 F:	include/uapi/linux/qrtr.h
 F:	net/qrtr/
diff --git a/include/net/qrtr.h b/include/net/qrtr.h
new file mode 100644
index 000000000000..e2a8d93564b5
--- /dev/null
+++ b/include/net/qrtr.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _NET_QRTR_H
+#define _NET_QRTR_H
+
+#include <linux/types.h>
+
+/*
+ * Base for the node ids the host assigns to endpoints. It sits just above the
+ * 16-bit range a v2 header can express, so a v2 endpoint can never claim an id
+ * in it. A v1 endpoint can claim any 32-bit id, so a collision is possible,
+ * but unlikely as the firmware assigned node ids are either smaller than this
+ * base or in the range of 0x08e5ff85. A collision is caught when the id is
+ * added to the node lookup table.
+ */
+#define QRTR_NODE_HOST_BASE 0x10000u
+
+/*
+ * Compute host node id from a per-device index. The index must be unique among
+ * the host assigned endpoints.
+ */
+static inline unsigned int qrtr_host_node_id(unsigned int index)
+{
+	return QRTR_NODE_HOST_BASE + index;
+}
+
+#endif /* _NET_QRTR_H */
diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 1040c3c8cfd6..e9377f818b4d 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -6,6 +6,7 @@
 #include <linux/mhi.h>
 #include <linux/module.h>
 #include <linux/skbuff.h>
+#include <net/qrtr.h>
 #include <net/sock.h>
 
 #include "qrtr.h"
@@ -127,7 +128,8 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	if (rc)
 		return rc;
 
-	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
+	rc = qrtr_endpoint_register(&qdev->ep,
+				    qrtr_host_node_id(mhi_dev->mhi_cntrl->index));
 	if (rc)
 		goto err_unprepare;
 

-- 
2.43.0


