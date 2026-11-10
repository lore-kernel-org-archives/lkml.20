Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331093;
	b=b04WPAid2wJvAmSVr4pPGcWduV57jusXG3YC/dI6GqlKPZJyr4mJL2Z+tTxlVNbLfwaS
	 lynzcPionKigF9p1tsfhkKABZbhn6XcBFE1ax5Q4tXohF9QkmA2BLJFJUF/ajxLFjYSy2
	 +JIJGHP8zSUBnsSOETcWbgzyH1yIXMcfb4XM/d+KGfX8T/EO+8ewx2g1W7LzbutGB62nV
	 T7s3pinA+5eNlruMORnZe4pnvd6gTiTRVqFcLg2u1x5eLzmn5gDZwldLNxcbLji8A4Bzc
	 SX8ClNRdMkqmm8PmOkYv/A8kaJPgJgMM/ep40fouZiy6AANvG1RBOo8I9T+hzv3vp8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fobaesnmMKyjTvyeIs4N9hvt2MoGfB+9T3M/lvazKZE=;
	b=hQ3wVkyJOm3nxtGaMxob7+dhPTNSuqSHv9UB1GeSezmSFjALIfd168DxWprYipJcgyBI
	 4X9fwm5sqETh8oOPYuurxoJfRD99/iwmTqFzOlDSQh0G5HOrQugUC7/jfCk3uL9PdWRTj
	 FZtxJEZHNnj3eL8e6vgLwCxFpnfasCeZRAyf6b0Z21rBmyT0cwBKWNCR23mkTnIwAnMxm
	 gv5KUowJbB3D7ryyx3u/KfUQBpMSCwe/1QkWjac9uqaoJZ8352rDY9Rti/neEdSStaS7p
	 UlVll1iPkUVcFZ8IpY7hBTWP5s7Wb21wHUTuoIZCv4l4hu1F5MvsVYWUFeTF/E8PZbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t2MKsMOA;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E859E606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E859E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t2MKsMOA
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eac49ec2f5so146503e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794331091; x=1794935891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fobaesnmMKyjTvyeIs4N9hvt2MoGfB+9T3M/lvazKZE=;
        b=t2MKsMOAy9KtNuW4zAnMxjLYtFFUpd/FGPaFO9CVqQpvAGcOhTfCOQ1dE+g0/JE5W3
         iYxVuhk1uwONz+s60uoo280ERJsZWBul91t9Ec5gvPIqMc8iIGqjpvIxWhNQMYF10oUg
         1+D0PV9XL7j940+aWUmk6k7rA0cgZANCh/Wugit50afRVZZYn/obEXsU15bDfmNiF3p2
         iAq3OK2ZlWZf241ikfzGMtj5j6cuL179ByzkhGXRXgeuvNnAi+HD7tH/iZJlGTpl6nco
         qSR2R7JbMboziAWXOODwmHhkhvjZa2BOMpPv1AJQ5xBdu+VjKqPrioP57rMhC/Saebfu
         e7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331091; x=1794935891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fobaesnmMKyjTvyeIs4N9hvt2MoGfB+9T3M/lvazKZE=;
        b=wPoGj7vHGFxCJZacgiVmLBMbSgDf6iTlyAhp/eOS1sFQu82rkC4VJvhY7raiFMJep0
         4CQ3/97GOV6ql7Yg0C5/KoRUxqoDyUvwwR5zI+HAbcW3FnXbJ+ifmJV+N0NI+Lb7qg3N
         9L9kTWvjD/wLzw7Gm/17pn/DsRoBfDknFLZrM2NKbnkzI7bu9rKlUCadPWCida3pMRnT
         4nG3+I0bX8Xv70dGJWprnXPnf+/20t1tY6s9Qz7+AsdTGBbmPziIxKOqZ6alPiWOPxdn
         fB57Xopusk0QhTm7OFvwCGtyugI7esI9fD/yybmlbVJR13nJWMMO/GLUHiYdZ0Sb0LqX
         92Ag==
X-Forwarded-Encrypted: i=1; AL+hErF8I/zzo2uP7TaBen56iMptbdORxM0CsXBYIwpKYko9NEG8uTya1mlqkjZZ3AKGjhLTv3wRU/nemkL5Ka0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pZ9wsl35pvcEIDLpTBX/v0s6fnARZoj61ZlQoU7KFmBLZSjU0
	E/5KIZmJ6kf7LVASLxBxasTvzABOCkXKFTrcBQfNeKAViJKSbjCNMLjN
X-Gm-Gg: AYBFou2/3ZipKg8o6WavEZUam6UupKDCOFtDQwD2m5f/cvioO5nyaUCuNQKdrF+AGnS
	cK7IcSdaSUwZ93fyZl3+mW2caZk3G4dphsn0jr5vip4SmhAcHcGVoL5aSMTILSZq5AEdU2hHXL1
	5DoAmkW8i7t5qvj6Ux+8D2zNfBspm3fjQnVq19O7Fvq2QTn5IeYd+1N7ZGF+hID8FUs0rggUJmV
	wJcBaJ0EphhVE2b8x6wEEgJQeKuEz7Cs2FzKyTsTPZY5dZ4sUMwIdHcCRFGKwxyzuxQ4qRSSK83
	rO4jjgDgkxXcS0F9jBAbtQL3gCn4jQybCTe0auLrJFOtHd5P/c81mDgvm8DbNbrCi/zEB8H57b6
	TzpJG1/wKgqqnb12Gdoxtj6waDiNQ1k7PwPyxRFTL6GkGCygfUJxlfkX60MKytGfpXiAPI/c9zF
	stWAAzR8egyK4xsKCIeZZSgj16rW/A8TeeeC3cIejAOfAbHDcHTLzRUk2Av1sHQuRc5AmvD2SxV
	WJGNNiacy6TlCkYLd1ndv7gFjWzICi1SBJ1A0CZENDVucpZGgQJ4QrA/D1OLT3a0i7M7aMzBlK0
	huKXDflD3xSElDE705UQ21SG3LEfS/DyivEAJD6iZe0LLuqNzT3Z15EnGqnBLs+Uabw+TWzPha6
	FUft8RPTJ22rUaTuTsTp5Ariq5nP0AwhrGmCmCof18yv2w3Y=
X-Received: by 2002:a05:6123:50e:10b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee0d1b1b03mr1450303e0c.4.1794331090720;
        Tue, 10 Nov 2026 09:18:10 -0800 (PST)
Received: from localhost.localdomain (bras-base-sbcypq6202w-grc-36-65-94-163-70.dsl.bell.ca. [65.94.163.70])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm2036676241.5.2026.11.10.09.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:18:10 -0800 (PST)
From: Massi Djaiz <djaizmassi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Massi Djaiz <djaizmassi@gmail.com>
Subject: [PATCH] staging: octeon: Fix return value documentation warnings
Date: Tue, 10 Nov 2026 12:16:18 -0500
Message-ID: <20261110171618.4507-1-djaizmassi@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Running "scripts/kernel-doc -none -Wall drivers/staging/octeon/" reports
that 17 functions in drivers/staging/octeon/ have a missing
description for their return value.

16 of the 17 functions have a return value description formatted as
"Returns [...description]".

1 function, cvm_oct_do_interrupt(), has no return value description.

Documentation/doc-guide/kernel-doc.rst states that if a function has a
return value, it should be described in a section named "Return".
Sections are only recognized if their name is followed by a ":".

- Replace each occurrence of "Returns" with "Return: ".
- Add a return value description to cvm_oct_do_interrupt(),
  which always returns the constant IRQ_HANDLED.

No functional change.

Signed-off-by: Massi Djaiz <djaizmassi@gmail.com>
---
 drivers/staging/octeon/ethernet-mdio.c |  4 ++--
 drivers/staging/octeon/ethernet-mem.c  |  4 ++--
 drivers/staging/octeon/ethernet-rx.c   |  5 +++--
 drivers/staging/octeon/ethernet-tx.c   |  4 ++--
 drivers/staging/octeon/ethernet-util.h |  6 +++---
 drivers/staging/octeon/ethernet.c      | 10 +++++-----
 6 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-mdio.c b/drivers/staging/octeon/ethernet-mdio.c
index 211423059e30..569e4aba38bc 100644
--- a/drivers/staging/octeon/ethernet-mdio.c
+++ b/drivers/staging/octeon/ethernet-mdio.c
@@ -49,7 +49,7 @@ const struct ethtool_ops cvm_oct_ethtool_ops = {
  * @rq:     the request
  * @cmd:    the command
  *
- * Returns Zero on success
+ * Return: Zero on success
  */
 int cvm_oct_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
@@ -132,7 +132,7 @@ int cvm_oct_common_stop(struct net_device *dev)
  *
  * @dev:    Device to setup
  *
- * Returns Zero on success, negative on failure
+ * Return: Zero on success, negative on failure
  */
 int cvm_oct_phy_setup_device(struct net_device *dev)
 {
diff --git a/drivers/staging/octeon/ethernet-mem.c b/drivers/staging/octeon/ethernet-mem.c
index 68c3ef984e56..224a7189faf2 100644
--- a/drivers/staging/octeon/ethernet-mem.c
+++ b/drivers/staging/octeon/ethernet-mem.c
@@ -20,7 +20,7 @@
  * @size:     Size of the buffer needed for the pool
  * @elements: Number of buffers to allocate
  *
- * Returns the actual number of buffers allocated.
+ * Return: the actual number of buffers allocated.
  */
 static int cvm_oct_fill_hw_skbuff(int pool, int size, int elements)
 {
@@ -76,7 +76,7 @@ static void cvm_oct_free_hw_skbuff(struct platform_device *pdev,
  * @size:     Size of each buffer in the pool
  * @elements: Number of buffers to allocate
  *
- * Returns the actual number of buffers allocated.
+ * Return: the actual number of buffers allocated.
  */
 static int cvm_oct_fill_hw_memory(struct platform_device *pdev, int pool, int size,
 				  int elements)
diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index 5be43bbf6a1d..5ca30f5b046d 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -41,6 +41,7 @@ static atomic_t oct_rx_ready = ATOMIC_INIT(0);
  *
  * The interrupt occurs whenever the POW has packets in our group.
  *
+ * Return: Always returns %IRQ_HANDLED.
  */
 static irqreturn_t cvm_oct_do_interrupt(int irq, void *napi_id)
 {
@@ -55,7 +56,7 @@ static irqreturn_t cvm_oct_do_interrupt(int irq, void *napi_id)
  * cvm_oct_check_rcv_error - process receive errors
  * @work: Work queue entry pointing to the packet.
  *
- * Returns Non-zero if the packet can be dropped, zero otherwise.
+ * Return: Non-zero if the packet can be dropped, zero otherwise.
  */
 static inline int cvm_oct_check_rcv_error(struct cvmx_wqe *work)
 {
@@ -404,7 +405,7 @@ static int cvm_oct_poll(struct oct_rx_group *rx_group, int budget)
  * @napi: The NAPI instance.
  * @budget: Maximum number of packets to receive.
  *
- * Returns the number of packets processed.
+ * Return: the number of packets processed.
  */
 static int cvm_oct_napi_poll(struct napi_struct *napi, int budget)
 {
diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 5e536827f87a..44534b94aec2 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -122,7 +122,7 @@ static void cvm_oct_free_tx_skbs(struct net_device *dev)
  * @skb:    Packet to send
  * @dev:    Device info structure
  *
- * Returns Always returns NETDEV_TX_OK
+ * Return: Always returns NETDEV_TX_OK
  */
 netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 {
@@ -500,7 +500,7 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
  * cvm_oct_xmit_pow - transmit a packet to the POW
  * @skb:    Packet to send
  * @dev:    Device info structure
- * Returns Always returns zero
+ * Return: Always returns zero
  */
 netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 {
diff --git a/drivers/staging/octeon/ethernet-util.h b/drivers/staging/octeon/ethernet-util.h
index 2af83a12ca78..510e04030c74 100644
--- a/drivers/staging/octeon/ethernet-util.h
+++ b/drivers/staging/octeon/ethernet-util.h
@@ -9,7 +9,7 @@
  * cvm_oct_get_buffer_ptr - convert packet data address to pointer
  * @packet_ptr: Packet data hardware address
  *
- * Returns Packet buffer pointer
+ * Return: Packet buffer pointer
  */
 static inline void *cvm_oct_get_buffer_ptr(union cvmx_buf_ptr packet_ptr)
 {
@@ -21,7 +21,7 @@ static inline void *cvm_oct_get_buffer_ptr(union cvmx_buf_ptr packet_ptr)
  * INTERFACE - convert IPD port to logical interface
  * @ipd_port: Port to check
  *
- * Returns Logical interface
+ * Return: Logical interface
  */
 static inline int INTERFACE(int ipd_port)
 {
@@ -39,7 +39,7 @@ static inline int INTERFACE(int ipd_port)
  * INDEX - convert IPD/PKO port number to the port's interface index
  * @ipd_port: Port to check
  *
- * Returns Index into interface port list
+ * Return: Index into interface port list
  */
 static inline int INDEX(int ipd_port)
 {
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..463302cf5a61 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -183,7 +183,7 @@ static void cvm_oct_configure_common_hw(struct platform_device *pdev)
  *
  * @work_queue_entry: Work queue entry to free
  *
- * Returns Zero on success, Negative on failure.
+ * Return: Zero on success, Negative on failure.
  */
 int cvm_oct_free_work(void *work_queue_entry)
 {
@@ -211,7 +211,7 @@ EXPORT_SYMBOL(cvm_oct_free_work);
  * cvm_oct_common_get_stats - get the low level ethernet statistics
  * @dev:    Device to get the statistics from
  *
- * Returns Pointer to the statistics
+ * Return: Pointer to the statistics
  */
 static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 {
@@ -247,7 +247,7 @@ static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
  * @dev:     Device to change
  * @new_mtu: The new MTU
  *
- * Returns Zero on success
+ * Return: Zero on success
  */
 static int cvm_oct_common_change_mtu(struct net_device *dev, int new_mtu)
 {
@@ -401,7 +401,7 @@ static int cvm_oct_set_mac_filter(struct net_device *dev)
  * @dev:    The device in question.
  * @addr:   Socket address.
  *
- * Returns Zero on success
+ * Return: Zero on success
  */
 static int cvm_oct_common_set_mac_address(struct net_device *dev, void *addr)
 {
@@ -416,7 +416,7 @@ static int cvm_oct_common_set_mac_address(struct net_device *dev, void *addr)
  * cvm_oct_common_init - per network device initialization
  * @dev:    Device to initialize
  *
- * Returns Zero on success
+ * Return: Zero on success
  */
 int cvm_oct_common_init(struct net_device *dev)
 {
-- 
2.43.0

