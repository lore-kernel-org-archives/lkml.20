Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825475;
	b=r5O85aZwPzA0s1ZF6MXYG3qFEsAZg5HwlEzDoHZHZmyVnNn2iminb3lUjebcbXCsYTsY
	 Oxv2y5EA8WMdhDDmse71mG2xzBGllpzk1yawi741/vhWh3fmLRIer3EP14w4m9Rek6q/g
	 83azroWhoR2YG2OSQZsVmyes27Qxyi29NgZ+rq7xL0WjWsopUhyaw92Z6KOHhO64Zpajo
	 leTPUnIOtqGjbuGYnBn2ZKS8nOhGyH3QX4dE7WnNLNIvDlcjJK3APPesC/LMA6g+REIMG
	 KkJ0HuDMYaqFOgIEQUYenZnDE73bgOgPecYTAXorlAB1Ttna1c2wuqKrTzCVOWZHW5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZcuOQZa8CoqUQadF07jVeaxK5x/sHuN3v5tWYCwYq74=;
	b=rIX/jeXa9/a5r738buK8iDBguR69LPg/qaDk9aZV9i2QjrjtFLq29h6HMO9TDXgoegsA
	 uxN2dYdGyY0MfWqCPSh9YGRwk95EXB94wlhFuGQUz8YVKrYoBnXfH1KUUohH0H0ztPPo2
	 mNRAHmzNlwmmvSvUFEFeguNKKw7A/bpOc7AMZSNukQ5bwE9bzEEw7P/cBa8Cwv0vpkc09
	 I+cl6kevkAXieHheHUIf5L/nSPNlH82gA5la6nKWnQTrjBTcXgl2R+pBi8S9XFm9gcOmL
	 oa/5F3Yk4wfz9Fq/M93Kk9Rf4Oy/oB4dHa75ViHcRMZitoigmaFJWhBgylaVvSZUDRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SSsn7P90;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18236078013
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B18236078013
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SSsn7P90
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so12629345e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793825473; x=1794430273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZcuOQZa8CoqUQadF07jVeaxK5x/sHuN3v5tWYCwYq74=;
        b=SSsn7P90dR5f2ydusgbmgYVNZkXrDNlPm4mNB1yIHi5pEHOOTuOaFP+ENyxF+wZXH8
         RSAqv7h+MuAlWSgHTkrutPIbkQD07msDxvOHGFFqyzSpiXRwlxf+ZYjv3amHCK9BJfmF
         1lTlMxm+X98lhq9s1uBWpF1Z6cq1eTVJcJTOXhx8DN4gAqszAYY1cxGIrbFRVGfuf+gL
         9e+RckryyUl0RSw3gtF+oMO9IGwc6DPit7peTWgFRvvLTtQcwgSuQ4PYVD7aXpb70Kdm
         XnofyJRNkALuYmdMO40p1ms8ignfUvtektdnlTqciXItA1Rq4mcd1bItc6knJChGTEXQ
         xMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825473; x=1794430273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZcuOQZa8CoqUQadF07jVeaxK5x/sHuN3v5tWYCwYq74=;
        b=2c4lB5HathOs8P1Xrl4RM16z8ZJMoT8cmMjw02rf9cB3LWwqt6FfLyrpP0at3U7wME
         B4vLAVLg+85fJA239yuAlKB+N2Lmor5ORB8HDn1K8/FQRH2ENfIZhpsAQizTNk6eafai
         V/qe9oPRGKwJ49CRsBb3qYlDYOp60soEoAoagQtXHXbu86x9lWFw2sOxb0tKX49NsG5B
         BV+OB6KKhrlFkljbTUNYyr3RDdgOsoqeddqQ7pIMs34fYd/yVtze2t5L9XZmh2qzSaCA
         WWC9zxp76cPbdgPXn9KmeO9PFOJY1FxbeiaFkfUy8FKLsXi18HDuTusZL2ZHWDCn0Zxs
         ++Xw==
X-Forwarded-Encrypted: i=1; AKwUvBw8AXOpmvdMwWHmqwfdN7mV8B3FvI/gUvIqUJOLu6a383yZtEhx0V03u7SlCbXOsxMOtsfcQphcL/JTRKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l1lZyJT5Igs0G4ZdLmXy/gixyJiguztTo5k/l82koDmXsfrK/
	yGjQSiVz/K1faElc6sznMAtPTdmJxGtXmc9pRhKybc9bSxnBX6c1+F4ZUSynN9UbcOo=
X-Gm-Gg: AYBFou0om5NlQm4+lK9/UgPdZLRRVOsjzgEnEMdr3gYQmVUvBEby5zgKL1IMnuiaJzO
	7MvNJG4C2nku6rRZu8aEVQCNUkhSto666683GunFCKUryyB0OHH9NnjjobMZWUt/qUdGthGygNX
	lZeWJQ28P7Hv7Fm3WrEnN2G0XvKujqtRTP3sx+7qzAutAq0KierzZn81fDZiIZIDEVMzcF70ZTZ
	W5AbeoWrrWeywepxU0AagVn22fZUeXG1i4uD1elSKP9apgHfbI+5zIszVPa9xAhFmjBMtb01JPa
	441zLyHvWCQ2fhQRkXc1qwblpJalANu8y/9bIZv7JJWNyUMcsVXt6pD9MSFxf2nCd8KiA9uUjOA
	KUwlmI1ENpKDQ9WfkSDHi81I6E8NG9xWOL8Jl4liMJtwKgu4zEANQrMW8VbmVjRY2uM1HL8qjzZ
	aCgc8KRpy4Rof/TAnqJZrZ88gwu+8+95huzDuY7ZeVP6hc2xTe8SXvbMaGX8K+qrvnUM5Go1Vpp
	/1jCoiVLEm12BbfPoEI8x5208RGWrp+U+vW5pkZ7V9ZWRg4eDpVQnHce24EOSlprFoQoCM0VBJq
	3ghBKlb9tOLNTn1AM6iih9RvKytQQQ==
X-Received: by 2002:a05:600c:1c0f:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4ac1709a7bdmr399320245e9.12.1793825472951;
        Wed, 04 Nov 2026 12:51:12 -0800 (PST)
Received: from pop-os.. ([87.248.177.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572caf48bsm11214565e9.11.2026.11.04.12.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:51:12 -0800 (PST)
From: Albu Victor-Marian <albu.victor.m@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Albu Victor-Marian <albu.victor.m@gmail.com>
Subject: [PATCH] staging: most: dim2: add missing Return: documentation
Date: Wed,  4 Nov 2026 22:51:08 +0200
Message-ID: <20261104205108.1041666-1-albu.victor.m@gmail.com>
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

Add missing Return: descriptions to functions in dim2.c. 

Signed-off-by: Albu Victor-Marian <albu.victor.m@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 0e2512d166329..7ed38d5d93f05 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -156,6 +156,10 @@ void dimcb_on_error(u8 error_id, const char *error_message)
  * @hdm_ch: channel specific data
  *
  * Transfer a buffer from pending_list if the channel is ready
+ *
+ * Return: 0 on success, -EINVAL if hdm_ch is not initialized, -EAGAIN if hdm_ch pending_list is
+ * empty, dim_channel is not ready or there is not enough DBR space, -EFAULT if first MBO bus
+ * address is 0 or dim_channel fails to start
  */
 static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 {
@@ -211,6 +215,8 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
  * @data: private data
  *
  * Wait for network status and deliver it to mostcore once it is received
+ *
+ * Return: 0 when the thread stops without error.
  */
 static int deliver_netinfo_thread(void *data)
 {
@@ -392,6 +398,9 @@ static irqreturn_t dim2_task_irq(int irq, void *_dev)
  *
  * Acknowledge the interrupt and service each initialized channel,
  * if needed, in task context.
+ *
+ * Return: IRQ_WAKE_THREAD after acknowledging the interrupt and servicing each
+ * initialized channel.
  */
 static irqreturn_t dim2_ahb_isr(int irq, void *_dev)
 {
@@ -442,7 +451,11 @@ static void complete_all_mbos(struct list_head *head)
  * @ccfg: structure that holds the configuration information
  *
  * Receives configuration information from mostcore and initialize
- * the corresponding channel. Return 0 on success, negative on failure.
+ * the corresponding channel.
+ *
+ * Return: 0 on success, -EINVAL if ch_idx is negative or bigger than or equal to DMA_CHANNELS, the
+ * buffer size of ccfg is too small, sub-buffer size of ccfg is invalid or bad channel type, -EPERM
+ * if hdm_ch is initialized or -ENODEV if init_ctrl_async returns any error value.
  */
 static int configure_channel(struct most_interface *most_iface, int ch_idx,
 			     struct most_channel_config *ccfg)
@@ -561,7 +574,10 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
  * @mbo: pointer to the buffer object
  *
  * Push the buffer into pending_list and try to transfer one buffer from
- * pending_list. Return 0 on success, negative on failure.
+ * pending_list.
+ *
+ * Return: 0 on success, -EINVAL if ch_idx is negative or bigger than or equal to DMA_CHANNELS,
+ * -EPERM if hdm_ch is not initialized or -EFAULT if MBO bus address is 0.
  */
 static int enqueue(struct most_interface *most_iface, int ch_idx,
 		   struct mbo *mbo)
@@ -637,7 +653,10 @@ static void request_netinfo(struct most_interface *most_iface, int ch_idx,
  * @ch_idx: corresponding channel ID
  *
  * Destroy a channel and complete all the buffers in both started_list &
- * pending_list. Return 0 on success, negative on failure.
+ * pending_list.
+ *
+ * Return: 0 on success, -EINVAL if ch_idx is negative or bigger than or equal to DMA_CHANNELS,
+ * -EPERM if hdm_ch is not initialized or -EFAULT if HAL failed to close channel.
  */
 static int poison_channel(struct most_interface *most_iface, int ch_idx)
 {
@@ -710,6 +729,8 @@ static struct {
  *
  * By success stores one of the CLK_{NUMBER}FS in the *val and returns 0,
  * otherwise returns -EINVAL.
+ *
+ * Return: 0 on success, -EINVAL if the string in clock_speed does not match any in clk_mt.
  */
 static int get_dim2_clk_speed(const char *clock_speed, u8 *val)
 {
@@ -746,7 +767,8 @@ static void dim2_release(struct device *d)
  * @pdev: platform device structure
  *
  * Register the dim2 interface with mostcore and initialize it.
- * Return 0 on success, negative on failure.
+ *
+ * Return: 0 on success, negative on failure.
  */
 static int dim2_probe(struct platform_device *pdev)
 {
-- 
2.43.0

