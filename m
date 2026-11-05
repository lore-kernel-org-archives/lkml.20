Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910080;
	b=XraK5LoguNER8fvDniDVmK7a5m3DQayuwpB1g3dsP2pUzHo20aVl55r5khAS3tZgqtJn
	 Az9doFJU5E4rw01TZQM1HV3VpZTHWVPuNv5nhsFjFdY6fxFj4Sfg31P4YubgHNGlRYd+N
	 IO9U9c2o3JmDAuZDu7xkqGUGWpFK4IHA22DtO7fTyTSHw2Bh/miQXTh4ejYOSCw4QKUoI
	 6J+OCz5qy9TvbeamyFu6v34WOkqmHBCREgc2Fk1gxUpz+dugK6Wxf/pf1CB6xY8YuBIYA
	 Z3TRCBU7vtlqtJtL0uVO04QiSR8qfTqKxxb3NJLVouAo3EsEiyGICW2KTHAiisN6HzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VhzRY2mKH6ORtaSBser4RPtg8SfuX9F5vDH2pAGGfas=;
	b=HahGuKo1k7Ss43+CnWbnUpzqdZCIv3aaiEBDB3KiCk6unmo+edMWzaEWaXe8u6+JLQ6W
	 4I/Oz4D/89nwU8hC5WNo/8Tbf0kRZcaOKCQlqsQF0nK2uGxDkEbZXMQ6GZQc91EOynl2r
	 DSa/WqSyNTlxNY2ZM1Ub8mU+JaiE7Q+WCq0fneV4X9UlAag/xnVRqsdEZMvRgxvZ+ZiIu
	 kthIv0TF2MGkdI2go5U19UrX54x1JH6v0QcZB5aA37dANRbVvpM/cHtoRn2BlA3qJlpCM
	 d7p0XLGP+g71vpUFdnONWHk9WOHuVzOHkUKR5dShBONrucFaM37QlGzxtTuGBrqk+QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a+jMuRZB;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C44606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C44606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a+jMuRZB
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so17008905e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910078; x=1794514878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhzRY2mKH6ORtaSBser4RPtg8SfuX9F5vDH2pAGGfas=;
        b=a+jMuRZBRCbGXcL/eRtLalk0LyWozWFNdQspyRT2IgtgCeXFRPxWGPeatHxuwD8wMC
         rmxrKFA7Do3hw3TZlP143cxHiRX8/+Cv2OlgVipHjMAcVi5+wjpMZ5Le9mldGYBR2ho6
         9d10FXhD+5+9EWwLtRVccRguHuqSaXigFX1DWP20z+6BLPHxyKbNYIVT2qd3BXkyAYJX
         tsBwy1ZlWYJxgDi1mCTvb2N6h5X8atcoEsA/BfbXP2S5gloZXsOO6iedOU6oefNGs3NZ
         7LZesjYD/fQKfM3H2DyrJxgPbjmGMjHrjh1SRO7jkrE/pJXRhJ8vOAQ03/znZ5VQgbqj
         GpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910078; x=1794514878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhzRY2mKH6ORtaSBser4RPtg8SfuX9F5vDH2pAGGfas=;
        b=YWtH+7kNng6Phhys4mnV3ZnyqbjqTdtemRug9abiyWCiJ0o1p2JXxd5XDstHRhzabF
         7A4i1K3CASQ9v2oG+rqSGRBWBLiYaWhmTiFTY8p3UoSvJT3VcSb91vDPz6Z/Pbuf1GDe
         XFvATi8ykimD4zu+GKfBlEuYeqAypuemvJ4Lt6DnCJPp8EOqO+fWPvT9taW8Ckqkxyqn
         JwWzRSoeUfyijfaoZAEd+EKiKU+N1hSRaSiXQ2ekqtInon1baglE9wz3BVPfW4m0Nqnd
         sPGK3/BbRU/etsLavnUs0YGwIpwyrGsRC+e2BeF2PTggpypBbQnQuyVR/sW3TMGP39S0
         U+ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8DL+kmhcuhXZEapgO/ot/wR1rl85zxfefbnI71W0Umvl++g0LoADYo3koNkQQtQFvAkIeWnSBrC54oyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QZW3bkGZMS4tBuyDt3M4fa+2PgJ82p++OUGupxyPBzLPViAjA
	q3Z13t+2si0LucfcFoUCRdirKmgKmmCvmKEFCgNZ/5oWQ1LCjF6mpeeV
X-Gm-Gg: AYBFou0aQDqzKbuaRRwHjfhX6PdAMDPykzGU/8kI69Wsq2aH/z1tkie2e8PSRaPbjSj
	Mc5tafVki+BC+WGkSNZ57wMQvJcKZy1ZcO7aAQjc1L0VmeX8f0RxB+FkCCGZdOsMBz5/xbbb9tj
	IQzGrdKmHIFi6c2KkAdV4dgw9fAHsVqeK77sqSRku3HT/KJ4aa7bPcoaZjcwxa0o7EQv0t/cLy6
	tT5cEsCUIe/R/hlqG7HA6fkC6bV8Zph3CgHwB/iDZdUM23zfTKkWoe8CRQcC7Wr0MB6hIZrZm7g
	NSenzBelZXihudzNDcHLekm5lVt7u2fT6F+fmdvPJiLqr8qgF8ndayPEyV57f1cO5jSIWhIeSHZ
	i9VvYLLUrZXf3O27n8wd1/NahLGfmL1LsS3SEfT/S5+XrqSwIfYPkISprcIfg4L21x7D/062SrC
	pq2Avl3l8unmcecwm5Yar2HRcQ+6BR4s68G4Lc2dObWq5mA4V5nayHNnQTXl0wEt5p8psQPzXJ8
	tutJhRCuUbgvnusb1U/WWvGxKrERM7qSxMvsEouPhYx7bilKM3/gzFbdD5Y+MFDU0P4Vpulp9OV
	+zqGTF8uC/lehYA60ktBCzjRNbagGBbctVRpIUOLLRXtK2MS6pI=
X-Received: by 2002:a05:600c:4443:b0:4b6:b2cf:3088 with SMTP id 5b1f17b1804b1-4b6ddcf59abmr4348165e9.14.1793910077589;
        Thu, 05 Nov 2026 12:21:17 -0800 (PST)
Received: from pop-os.. ([87.248.177.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b413312a4fsm71869865e9.1.2026.11.05.12.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:21:17 -0800 (PST)
From: Albu Victor-Marian <albu.victor.m@gmail.com>
To: albu.victor.m@gmail.com,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	parthiban.veerasooran@microchip.com
Subject: [PATCH v2] staging: most: dim2: add missing Return: documentation
Date: Thu,  5 Nov 2026 22:21:10 +0200
Message-ID: <20261105202110.1081296-1-albu.victor.m@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104205108.1041666-1-albu.victor.m@gmail.com>
References: <20261104205108.1041666-1-albu.victor.m@gmail.com>
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
Changes in v2:
	* Simplified the Return: descriptions

	modified:   drivers/staging/most/dim2/dim2.c
---
 drivers/staging/most/dim2/dim2.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 0e2512d166329..34c0eb796c291 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -156,6 +156,8 @@ void dimcb_on_error(u8 error_id, const char *error_message)
  * @hdm_ch: channel specific data
  *
  * Transfer a buffer from pending_list if the channel is ready
+ *
+ * Return: 0 on success, negative on failure.
  */
 static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 {
@@ -211,6 +213,8 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
  * @data: private data
  *
  * Wait for network status and deliver it to mostcore once it is received
+ *
+ * Return: 0 when the thread stops without error.
  */
 static int deliver_netinfo_thread(void *data)
 {
@@ -392,6 +396,9 @@ static irqreturn_t dim2_task_irq(int irq, void *_dev)
  *
  * Acknowledge the interrupt and service each initialized channel,
  * if needed, in task context.
+ *
+ * Return: IRQ_WAKE_THREAD after acknowledging the interrupt and
+ * servicing each initialized channel.
  */
 static irqreturn_t dim2_ahb_isr(int irq, void *_dev)
 {
@@ -442,7 +449,9 @@ static void complete_all_mbos(struct list_head *head)
  * @ccfg: structure that holds the configuration information
  *
  * Receives configuration information from mostcore and initialize
- * the corresponding channel. Return 0 on success, negative on failure.
+ * the corresponding channel.
+ *
+ * Return: 0 on success, negative on failure.
  */
 static int configure_channel(struct most_interface *most_iface, int ch_idx,
 			     struct most_channel_config *ccfg)
@@ -561,7 +570,9 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
  * @mbo: pointer to the buffer object
  *
  * Push the buffer into pending_list and try to transfer one buffer from
- * pending_list. Return 0 on success, negative on failure.
+ * pending_list.
+ *
+ * Return: 0 on success, negative on failure.
  */
 static int enqueue(struct most_interface *most_iface, int ch_idx,
 		   struct mbo *mbo)
@@ -637,7 +648,9 @@ static void request_netinfo(struct most_interface *most_iface, int ch_idx,
  * @ch_idx: corresponding channel ID
  *
  * Destroy a channel and complete all the buffers in both started_list &
- * pending_list. Return 0 on success, negative on failure.
+ * pending_list.
+ *
+ * Return: 0 on success, negative on failure.
  */
 static int poison_channel(struct most_interface *most_iface, int ch_idx)
 {
@@ -710,6 +723,8 @@ static struct {
  *
  * By success stores one of the CLK_{NUMBER}FS in the *val and returns 0,
  * otherwise returns -EINVAL.
+ *
+ * Return: 0 on success, negative on failure.
  */
 static int get_dim2_clk_speed(const char *clock_speed, u8 *val)
 {
@@ -746,7 +761,8 @@ static void dim2_release(struct device *d)
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

