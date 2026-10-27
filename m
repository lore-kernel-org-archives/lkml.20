Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118464;
	b=cAoXm2gZReoHpsHIBtb6b5WOwpUDUYZ1eikkIAl1jlg6jS7FrY9G3MR13vsYfM41+kv6
	 UYaFiOPEP61EKbF4deVJZlLhH9M79KSYO4ktFR6kaGgga7Oa/bBQK5G/KNVnF+EIrUrjn
	 oHRbEKq6AjJYhM0otv3iGA40OJdyCgYbGpqsDNu2Wmwtrmj175NM56uV5XH4+dj1EkHLd
	 3CVBpMW50TGpu/EFMgEM0i6V/bEFL5+OHg5OpsL4CYiI13De/eHshHUfrNiCba3jx5mW5
	 O1mKFepvu99zDhk+q1Upn67ZsuQw/hiN7uNt+2gvGO7yq/f69uTKCPx4lxivwDzT0/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118464;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Lines:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=TO8Scs4BR5rTvjGQ0QMTjiAXMrLi+aG6pzzql/KwiUg=;
	b=jXx+Za52FsP8jaV+LMMnPvz9MpjlXZkmszvGJldaGbfwyKy/saBES+qkp/GofOXgAVZU
	 nJ1p60PJixL3NVkJkic/K+oMGSOVhUmhnoGlnYHvYMi5YGcK97xmAFmMPPIBwGUsPujcd
	 W97upn3lsXuHltIjFY8fUVHZ0+eXO5edJzUSivQv7QneqzP5PTJST6XZSUcpZgUNdrRlX
	 PIir5OZwB9QMdtqWRwmMz7pM7MydXIlQrPMMkCUDzYMr45m9nuHaF6Cqjp2VdtA6IwEo0
	 +1qZ5/FjH/Q1/sGW36VJ3CSuGzY78yKV7lmnDuZi8WEDa+yKR72zUeTTxnXnjOPVL2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QyfsWMNH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2812606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QyfsWMNH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98CD1F031E1;
	Tue, 27 Oct 2026 16:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793118463;
	bh=TO8Scs4BR5rTvjGQ0QMTjiAXMrLi+aG6pzzql/KwiUg=;
	h=From:To:Cc:Subject:Date;
	b=QyfsWMNHXDyJS2LXf9RN3S3HnJ6eZBvBPr0DZpGWXT7YfkZVHflRp5pBLqyIsfM9S
	 qasZog8+Kpddirhnw8sUQvS2YkYIZII7TPwabX2F8nNVIWm6DY4buAIwHL2JFcjq4q
	 25ao15S+Knl00d/gW1ZSEML8zqtMnFi0Pr3kJe4A=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alexander.usyskin@intel.com
Cc: linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] mei: lb: read the MTU once
Date: Tue, 27 Oct 2026 17:27:40 +0100
Message-ID: <2026102739-boil-startup-145b@gregkh>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=kPpMGYsl9yCUkj23RKw7MdwHXvWZZYnGA4/QZR2WJCs=; b=owGbwMvMwCRo6H6F97bub03G02pJDFkPLvx51KvRd7zNc1+xw6rUqwsN/B+1BUbZTJ+ydo0PS /C7CVt/d8SyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBErugwLFh0o+zq+Sq2RhMn lpOtkhluZace8zEsOMniwGQ9PaRljnKPiu1bbdmAO0dnAgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Josef Bacik <josef@toxicpanda.com>

mei_cldev_mtu() returns 0 if the client is not connected. A link reset
disconnects all clients at any time, from the reset work.

mei_lb_push_payload_v2() asks for the MTU to allocate the request buffer
and asks again for every chunk. If the reset comes in between,

	chunk_size = min(payload_size - sent_data, 0 - sizeof(*req));

makes the chunk the whole rest of the payload, and the memcpy() behind it
writes over the end of the buffer. If the reset comes before the first
call, kzalloc(0) returns ZERO_SIZE_PTR, which passes the NULL check and is
dereferenced. An MTU not bigger than the request header has the same
effect as 0.

Read the MTU once and refuse one which leaves no room for payload. If the
client has gone, sending the chunk fails.

Fixes: 773a43b8627f ("mei: lb: add late binding version 2")
Cc: stable <stable@kernel.org>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/misc/mei/mei_lb.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/mei/mei_lb.c b/drivers/misc/mei/mei_lb.c
index 9fa69acf28d5..ffaf5be3b605 100644
--- a/drivers/misc/mei/mei_lb.c
+++ b/drivers/misc/mei/mei_lb.c
@@ -312,16 +312,24 @@ static int mei_lb_push_payload_v2(struct device *dev, struct mei_cl_device *clde
 	size_t chunk_size;
 	size_t req_size;
 	ssize_t bytes;
+	size_t mtu;
 	int ret;
 
-	struct mei_lb2_req *req __free(kfree) = kzalloc(mei_cldev_mtu(cldev), GFP_KERNEL);
+	/* The MTU turns into 0 when a link reset disconnects the client */
+	mtu = mei_cldev_mtu(cldev);
+	if (mtu <= sizeof(struct mei_lb2_req)) {
+		dev_err(dev, "MTU is too small: %zu\n", mtu);
+		return -EMSGSIZE;
+	}
+
+	struct mei_lb2_req *req __free(kfree) = kzalloc(mtu, GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
 
 	first_chunk = MEI_LB2_FLAG_FST_CHUNK;
 	last_chunk = 0;
 	do {
-		chunk_size = min(payload_size - sent_data, mei_cldev_mtu(cldev) - sizeof(*req));
+		chunk_size = min(payload_size - sent_data, mtu - sizeof(*req));
 
 		req_size = struct_size(req, payload, chunk_size);
 		if (sent_data + chunk_size == payload_size)
-- 
2.56.0

