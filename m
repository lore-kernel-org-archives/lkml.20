Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862417;
	b=fOad1foav0LxeWzibs7TMqjE1qYwbYcnpNxLvPSbF4xWaoWes3E1cd3rGSg8PsrZ991W
	 gkVbKk8xNiB53n6nSk/smy7DTNKrmTC1OuQVltKymRC6eBHJu7jcKCL9UepFkByUp+ohh
	 +KdwlvmZvU/dZSJBvhQeG7ECG1QqR5vlOg2O0dBIOMY4IX0gWRMoO96A1UGw7N82BytE6
	 mRQTebABWVrd8zoW/NngGwxD1nHmxbTsoElkao83dH2y0XHFu8g5Bwv1eMxvQNL+OZpUG
	 0qm7zSwp2OdXvF/HDDZ63zyG3l/cOTgmT6qjl+SrSL5OlrRt178hwtdmm0HNWI8hsiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Kj+W82NANvfKgUyKf6IsWAM4Mpg0yQ4fSrxz7u58oqs=;
	b=LR8HaXhy+k912/ET6xzXqXAqPvhNTEaWwbXU/kpXT00GaeQOS5PQUpHREx1jC0CDaSyl
	 as3ZBuoViRmy0Jh6pfjUxpXeTCtcuuOG1SJgbsoeOPLhNm13ftYyit5/OGHrSVJkiFN/m
	 wf370qPv3CeccDEgSgIpxBQQyBkpytZ/0I6j+yavDmH2qz7kl4V7n1YeTDbOX3odNT85/
	 duDi029vqOmcPzxqNEjYhqsA99NeJknHUBOg9PV0wfqGYJCFBRQSA7ffsfmGPAUqTsrB+
	 sEdRSQwxuIRL42PxL1lH43jqzGTDHWppi7ZqNQA2d1gTQm7ivTs1NxifSilbI/abEuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xW/z8CSs";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B5C606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B5C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xW/z8CSs
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3079811c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862416; x=1795467216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kj+W82NANvfKgUyKf6IsWAM4Mpg0yQ4fSrxz7u58oqs=;
        b=xW/z8CSs/dQ+KxWFVc7iuaSL2cI3AXnL72PhWAygJfADarjfqHeHIhtR95mBzNFUfZ
         qkDDLRNkpcnZz04fr0Hbv+fAI8tXoiBsNcIaDdfywCdYZ4AuumbQmERMYcGDKvnIao/L
         kDb56Q/OJM9ZOdfHIou7VYP47gE06GfSku13Ytho9A9+wjbXvA//nVczilMNdS3ge3dS
         IZUynst+XsGZxHuVHRkWXVQt20kHbNw5df1tKEZXGV7AXU3lrvdDQvtirfPpqcQBdTjI
         Oi6qGqWBfnhTApD8t2aadBkSwDk7jRGZNfRAGmdQPhT6+uIrDDGjFILeesvXPlbZRBB/
         ZB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862416; x=1795467216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kj+W82NANvfKgUyKf6IsWAM4Mpg0yQ4fSrxz7u58oqs=;
        b=tK6CkuuIbFoltAZ2X3ZMBvqSjWqamu3KKtRoDFmzCHrbKl4K8MpkTg6/utD5tG/saf
         +UIXe3Nrw7etIZoZatcGIiFhFt6qXYHqMSz1SrYAGIygpMj8E8HTuIbBIz7EAJXcPqH0
         wQuscKKAGiOnDxouh95hw9ptXplr51uIImhwiFNxemqOrZlF2sPgt9XBDMYz/ri+1Gr7
         GwGs/d/vUJbHpvrSFVurODp4XQkiuU8uiS/4+coWVOn8PqgmFKXLUHPJo9D5yJ4jF4Lc
         RS+pjvOcfnvaLjUL2BnoscHe8kmxp+tlNnynBxYXc4zYEBN6MewnfK5ICjvlU4IDVZX/
         glBw==
X-Forwarded-Encrypted: i=1; AL+hErEsVLSXyPxGxKwGdHdFHj1ENIUzG+/pu8wtPbKTuLGVswpkQWmz3CfkmkeFbEzcS0owmcqgr8vUiREhatI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4n95hrYFJc9T1E16UJ5CaTNyeMaL/n9VtFYBr5579rMdqOmgM
	9HKRdfUSBADulWhmr7oeVAc1o6QmK4bvGvnuhxrTfRu5ENAYDABb/xd6
X-Gm-Gg: AYBFou1TK7Se0awnugdIMgfqvVD1LjcLjrlYSXtGrxxFnmFM/8LrFiJuulzDrWiWhcM
	1OqK+byP5zrM2Y5esLWIXAXCe0QWy12YdSy5k/9YC4lKiKGg6YOqm0wAcKxtWUnBO1AVJElqBe6
	q0LaxOijPcpn721rkScISNKtmtIGL4s6vs53zx5ZqglpKqtgx53QIjYAA1x/yO29rNmo699vImi
	NKK2Xjvnh7irUarkJ73j2t5lhTIZe9wCqKbWa39sWB4jcuyj+IxMhkCk+9+sQoNzlpQVRRqXB5L
	lWrm2cwnNbryPueXMrTmSBLqe81V65HJCOyGBfdjeIaZo6jDUv/Um2dve+PorbC5rBtJ3tSd6Bt
	M25kC+VdjBAXQoiNyqUd6yaBXDafoJ5Ha08ixV9NYCyph9aw8i5BQqEoKi23L1g5XezuURj3rtU
	F1KPB4W4OzDit19XN3PIOCtg9k/gcgH+N1aveN3Y0zbbKnMiWGpS6mfbQ11Nn7MBKz56pyuhfBO
	3A/mvaxwQ/UsD7Ec6hYd1GIAYtDQuWkwXPMEHnbKu4SInLUJ4C9I3BRtrciAyRw05XEvkJkHhtA
	UG0baoRWW9VO3wV7GdxmSnY+bD+Zj6Lpt9kFq6M+rKpfGVUf/qJYtreML+6fbnUILMnEOjHb+Xz
	B6GWvgw+cVM9eWtueykEDAkzE+2EJ3MZOIN/UoueMP2TXCod4+QHwIQMShFbLYNvhjLh72VzlSd
	N/riFNFaJRYwCEwD9Ok30TSibI5dZV++lbZuiQqqXvhg==
X-Received: by 2002:a05:7023:a42:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b5030a3490mr10088341c88.10.1794862415822;
        Mon, 16 Nov 2026 12:53:35 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b524049e0asm15293497c88.4.2026.11.16.12.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:35 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 1/6] iio: proximity: sx_common: fix raw reads while the trigger is in use
Date: Tue, 17 Nov 2026 02:23:09 +0530
Message-ID: <20261116205320.26070-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116205320.26070-1-kapoorarnav43@gmail.com>
References: <20261116205320.26070-1-kapoorarnav43@gmail.com>
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

sx_common_read_proximity() only reinitialises the completion after
waiting on it, so a complete() that arrives when no read is waiting is
consumed by the next read, which then returns old data without waiting
for a conversion that includes the channel it just enabled. This
happens in two ways:

- The device trigger has no validate_device(), so another IIO device
  can use it. While it does, set_trigger_state() keeps the CONVDONE
  interrupt enabled and the IRQ thread calls complete() for every
  conversion.
- A read interrupted by a signal reinitialises the completion and
  returns, but a CONVDONE interrupt already raised can still complete
  it once the mutex is dropped.

Also, when it is done, the read disables the CONVDONE interrupt
unconditionally, which stops the trigger for the other device.

Reinitialise the completion before enabling the interrupt, and leave
the interrupt enabled when the trigger is, as set_trigger_state()
already does for pending raw reads.

The interrupted-wait case was reported by the Sashiko AI reviewer on an
unrelated sx9324 patch.

Fixes: 72ad02b15d63 ("iio: Add SEMTECH SX9310/9311 sensor driver")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx_common.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/proximity/sx_common.c b/drivers/iio/proximity/sx_common.c
index 4d4937395d9a..66d06435da05 100644
--- a/drivers/iio/proximity/sx_common.c
+++ b/drivers/iio/proximity/sx_common.c
@@ -167,6 +167,15 @@ static int sx_common_put_event_channel(struct sx_common_data *data, int channel)
 				     data->chan_event & ~BIT(channel));
 }
 
+/* The trigger needs the CONVDONE interrupt too, leave it on while in use. */
+static int sx_common_put_convdone_irq(struct sx_common_data *data)
+{
+	if (data->trigger_enabled)
+		return 0;
+
+	return sx_common_disable_irq(data, SX_COMMON_CONVDONE_IRQ);
+}
+
 /**
  * sx_common_read_proximity() - Read raw proximity value.
  * @data:	Internal data
@@ -188,18 +197,22 @@ int sx_common_read_proximity(struct sx_common_data *data,
 	if (ret)
 		goto out;
 
+	/*
+	 * Forget conversions that completed before this read, e.g. while the
+	 * trigger was in use, so that we wait for a fresh one.
+	 */
+	reinit_completion(&data->completion);
+
 	ret = sx_common_enable_irq(data, SX_COMMON_CONVDONE_IRQ);
 	if (ret)
 		goto out_put_channel;
 
 	mutex_unlock(&data->mutex);
 
-	if (data->client->irq) {
+	if (data->client->irq)
 		ret = wait_for_completion_interruptible(&data->completion);
-		reinit_completion(&data->completion);
-	} else {
+	else
 		ret = data->chip_info->ops.wait_for_sample(data);
-	}
 
 	mutex_lock(&data->mutex);
 
@@ -212,7 +225,7 @@ int sx_common_read_proximity(struct sx_common_data *data,
 
 	*val = sign_extend32(be16_to_cpu(rawval), chan->scan_type.realbits - 1);
 
-	ret = sx_common_disable_irq(data, SX_COMMON_CONVDONE_IRQ);
+	ret = sx_common_put_convdone_irq(data);
 	if (ret)
 		goto out_put_channel;
 
@@ -225,7 +238,7 @@ int sx_common_read_proximity(struct sx_common_data *data,
 	return IIO_VAL_INT;
 
 out_disable_irq:
-	sx_common_disable_irq(data, SX_COMMON_CONVDONE_IRQ);
+	sx_common_put_convdone_irq(data);
 out_put_channel:
 	sx_common_put_read_channel(data, chan->channel);
 out:
-- 
2.53.0

