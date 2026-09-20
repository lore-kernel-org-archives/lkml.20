Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C62235C681
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893427; cv=none; b=bqcStIm/kEuqXkrWqcoHzg9sPmXR13A+shi7H5R/aqnjVugQ3PyvFu/opUzowQOWFD12Q7Irr779WURh1Rm/HkvDNClVBOaoLHuiBoavzOxdDJ5CEPB+XRXh85nyc1fKqViZnTQdVb8wwTcgp/EsPsDJUgiyMva+YqGpUOqKI0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893427; c=relaxed/simple;
	bh=VPd00f1P4Erfu42xxT4CpXYqT8BI5IIkq8HQw8leDYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXUgMie2Ulia8kpMY12mJzTqAEYpWwvAnkIAMawIA8hNs5Ibjk+9jJKnbbPuKsKJQwXxKhT8ViHEgBwkG1btWv9Hq3/LSEgVPH4mAoyqChBRb5MQ4N/JaPZbaCjTfNfMuYDdtWuMMCyhX8pgDaIbH7MOXxr8U3+TFS1CjH7zkJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=uZcTNK56; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NCTXEZP8; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="uZcTNK56";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NCTXEZP8"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id F2D941D00105;
	Sun, 20 Sep 2026 04:37:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sun, 20 Sep 2026 04:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789893424; x=
	1789979824; bh=b0vHxAf16SZ9iQ6duuWb3PMrm64p7qgPMngjBg8SUyI=; b=u
	ZcTNK56mjXj9ReyhiCoP/LYehaTWmkCq3WCj4FzZ/5Zm6/EeVBUwY4b9ZRaPZK7r
	15nFZiMtDqNvuuvviNrSrcJDTdOvJsMkNp8KWC8NPy8JBAZAWEAQfMVBwbunq/UX
	kQccMDrpPjP+EzGM6ZKOXiRi1WBL061z75ghXVDZhm6KNJnO0fo97kcJlv8hdZ3b
	PeNc2Pg98NuiOd9pwB4BMFQkVxU+uy+6YEj4MttAjNP3VpUBNbJWrVG1dRlv/31j
	GJSB1rBK5KMEjfQisxm5sP8R6N+1RMHh4Ya1xQ/CM3fwlHAtjRlwGeq4eeHQTA7i
	BZY/q1rrA7xvkuM+bOMBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789893424; x=1789979824; bh=b
	0vHxAf16SZ9iQ6duuWb3PMrm64p7qgPMngjBg8SUyI=; b=NCTXEZP8zPHDj1W7+
	znJmWOSPCtpmcvOnPp+BT/fsguXy+lS1gKxxB7RXSBqz4swnws6WIn/8VHAeeAB1
	ZEZAU29jVUgVmx3sLLKuBlM40Zf+37frrBWPJ/xfPDZoHqxI1AAfksgiXO5kiuYS
	gHuB9avPzUdunW47e/AAcb287ecGlDObx3yOyNSp5HE7u47DlCO/n6BI3qlV2mfv
	4xm/wLvA1M58oR1+EePAaU2SrbwrgvdvnQBqFXt1Pz/I1tJ8EI746osqvqgUwg8n
	e+Ix1tREuylW2X+H8eijvTLtaI60/k1fZD4HgwXtc1cpHQDSKWLTkBMuDdyHcS8P
	yK5Qw==
X-ME-Sender: <xms:MJuvas-3ziUl5aqIaJA4_O1i1LcLd7eGEUPMbP5UJhIeo1hr0u5QLw>
    <xme:MJuvaiqG1u5L60BUwNF16Tg6IvX4sVM5e55Ewj2Gi6rTQFf0JA9v4v3LaQc0nwwsb
    Ypx5LC6q9h0t4fjfxx6-NUcqQdq2XgzbwxyX-J_HI54oVygexscEPO1>
X-ME-Received: <xmr:MJuvaplZX3KGR9roQEMSTOaGFXt3eA2PiHYfrA42m4nn0rKpH0V7hoO2ZB0P0o_ZDXyj-xeoPijHaQIzUL6yXKDF2FjVn7fE5hrroKcWCNPd4Q>
X-ME-Proxy-Cause: dmFkZTGDk/LFpyNUjatZXtdF1Ol4AzGXx/XJJ00P2lEzdhwaC2OHMWKjSTTwzDV54eA+X9
    hZWqO2Pt/aL/IC2w3tQSr/WTF4eOkuQx9cqr/0YQjP0U9qRxKTeqqjpjHmtjKI87XBl9+k
    lkd5l3xFN7T6QNoFdRqVZKYZ1HWzIwBUYfdAsZeZatUOA0ZPe1QtaXNtpb/kZMyNG2cCW0
    AkYYFkNOpR9jWdo4iKO92TpJWkC9Ldvc/R2dYRYBWP9D0fI6R6CxUwbd23p5Y6XPLXkugf
    TZapV8K2F20wWYZVer0gd5Qw3eZniou/ncwHg8BB5HxRPprNSXyj1Vu1JJpcJt8AGbY0CG
    GkYmwH9AZ9PD2mUnLC/dSkNMesIAhf/Fob6F6zeBshOS7vR3yo3IcBt/zk5NHfyuGx1axl
    QqQWDjct/oXAReqsT8YK8Ged6Bi5epOAIN77E6OVHkXKl9KAC1rcuhBK2XjauswzDn5SBb
    D3PQCu4pzLDGfIqsW0eBZRuk7v0Ge4SLMDL0O7lUuiVuWMN0gxaTxiAqwegmdgt8s+u0Zp
    njpa2fWffH4X+SDF+0Rf8HxztQEsC+iPiLEKqaTvGCJ1ygHHphPHRVVEyN2pD4XpAhlqzn
    AKd6bZF3M5s03aF/wJZWOPOVaYLd6HmIRlt8tdd+k9rTbby5hH9DcjbWE2Cg
X-ME-Proxy: <xmx:MJuvapKHvEHIgFuPc79EigvIduxokmwm3nxVrm74ZeHHBAS_LI4svQ>
    <xmx:MJuvauyXP9F_D47ynLBNvC6tQMTdRJSy3zCyZ9IWqun24QkAJb4bAQ>
    <xmx:MJuvahuv86EYWH9sWr5zcWnK9RMIRadVC6jtAn_lBDJ42ub2adVIag>
    <xmx:MJuvatvYde-ce1YYK5xyl5gtbEiM50OIKsb-XN7vEVJFBtqfAmyInA>
    <xmx:MJuvaiSoaeSZen4t4OemD-3ei6e17OLaliucy0oBHXH6eDn-gvqMTbt->
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 04:37:03 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] firewire: core: fulfill kerneldoc for address handler
Date: Sun, 20 Sep 2026 17:36:55 +0900
Message-ID: <20260920083659.191855-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920083659.191855-1-o-takashi@sakamocchi.jp>
References: <20260920083659.191855-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The callback for the address handler is now invoked in process context.

Update the kerneldoc for the address handler accordingly.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c |  8 +++-----
 include/linux/firewire.h            | 22 +++++++++++++++-------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index a2a8d755ad0a..bdd2437c6f7f 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -637,16 +637,14 @@ static int put_address_handler(struct fw_address_handler *handler)
  *
  * When a request is received that falls within the specified address range, the specified callback
  * is invoked.  The parameters passed to the callback give the details of the particular request.
- * The callback is invoked in the workqueue context in most cases. However, if the request is
- * initiated by the local node, the callback is invoked in the initiator's context.
- *
- * To be called in process context.
- * Return value:  0 on success, non-zero otherwise.
  *
  * The start offset of the handler's address region is determined by
  * fw_core_add_address_handler() and is returned in handler->offset.
  *
  * Address allocations are exclusive, except for the FCP registers.
+ *
+ * Context: Process context.
+ * Returns: 0 on success, non-zero otherwise.
  */
 int fw_core_add_address_handler(struct fw_address_handler *handler,
 				const struct fw_address_region *region)
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index 2b065f03565d..4bca5af6793d 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -298,17 +298,25 @@ union fw_transaction_callback {
 	fw_transaction_callback_with_tstamp_t with_tstamp;
 };
 
-/*
- * This callback handles an inbound request subaction. If the request subaction is initiated from
- * the local node (e.g. by unit driver), the execution context depends on the initiator and is
- * unspecified. Otherwise, it runs in workqueue context.
+/**
+ * typedef fw_address_callback_t - Function to handle the request of the asynchronous transaction.
+ * @card: the card instance which receives the request
+ * @request: the request instance.
+ * @tcode: the transaction code
+ * @destination: the destination node ID
+ * @source: the source node ID
+ * @generation: the bus generation in which the request was sent
+ * @offset: the destination offset in source node.
+ * @data: the request content if available.
+ * @length: the length of data.
+ * @callback_data: the data registered with this function.
  *
- * The callback should not initiate outbound request subactions directly.
- * Otherwise there is a danger of recursion of inbound and outbound
- * transactions from and to the local node.
+ * This callback handles an inbound request subaction.
  *
  * The callback is responsible that fw_send_response() is called on the @request, except for FCP
  * registers for which the core takes care of that.
+ *
+ * Context: Process context.
  */
 typedef void (*fw_address_callback_t)(struct fw_card *card,
 				      struct fw_request *request,
-- 
2.53.0

