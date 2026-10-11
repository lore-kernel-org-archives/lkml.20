Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A998846C4B7
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791759456; cv=none; b=GtY5B061KkJo0Ow0+Jx2zknpyGiWY8vIj3rFCxtkkZMXUs+eYmNwMDlFabz6TINdoATxLQ8PN8SzGumQlu40ZfDc5fzetA16ZQ8lbfuo9gLaIAFtQS032Wc8x1rZcD0E02i75fa2eCHOgSKcpgKvV0+PRmnEy0x+0LdPy3At7k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791759456; c=relaxed/simple;
	bh=iuxXe+oO0FU8wOMUzOslFucRKCsLGWXMFpgraSNUqnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AGC2XuOZvAYO75tEqHBXeIQHWLMN7SvhQZLSBGFWl4cXoRyrGnftJ1OrlXid/lCqgJarALuhTxbYJxehQK2XR9zuuu4M3V/wHVElfFxMb4z4XROpm3E/NkBI0SW0JpTfLGfOCuTsEb5t0i9SYEB9O6vcADdDGbIa6opnVCvxZWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVyge9ZD; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVyge9ZD"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e56c287b3so114685185a.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791759454; x=1792364254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HbFzXeXg8l+saP+bOvTWuOKTTgvyyirsYJqRDQW8/E=;
        b=fVyge9ZDApF9GouUn5W04JyJ/G4IDU1Fi+0Xma1yQGbIUttccfmJZdCPXgtaEwjSso
         XEUOmhEcINJnDfI3F5J1CyO0ryTY3sfD7l25gZCdN5YLTGtbo1y0zpqCDW9ltBR+nMH4
         iDHNAn2jOOaG9YDytIxH9S/yS5xTEddUDqkYvganIMcXK7c/Ffym0r5nnD3TZCUFIri9
         17MQLFSF7eBJWufTBK6Zn15FGsj+UJw7LFQJZ7R+Ve0lAxsyYNs6C/Usn+FK55ewFSsq
         Uh13Jh4EyMXJObRpf8RLPNYW806FHs+48sTZCaG0juYWQg2uI2AK6s0ozzbkpQxzLWWb
         /7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791759454; x=1792364254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6HbFzXeXg8l+saP+bOvTWuOKTTgvyyirsYJqRDQW8/E=;
        b=z7ZfKAQ/Ktbg13zPQN2wLx6inRmVYec1f7bBisRDYE/bhE3GiY7L5vHr6hMwqca+PN
         jh6MyheEf6Gw8UJopQCboKRBGZ36UXZi0SBFTC6KRXwM/2nSykwwFNFFQF77t+ZyfOlk
         q+9u4r/HXWxHzPZDkD4jkMf8kdEi0/jQC4YLei4495glb7jNE2alI0CMPaNL1hmGFy/V
         7jbVVbAmsuayWZgwgQuz8sXVflbNVfvF5nVsHBX0ir7Nu53JAYCoELHEhK8H082ALNLy
         O74PR3vQrfg04/SYiiohQIN9buuph1LZkIK4RGmTNg8z23WVeyab7sYET4CUzA3COK/h
         XxLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxisvR4nBEuNfhGWVSoaDaPzcfWqTidquZ+Jc9LfyuB0y0ARoMJrdvuQodj3GMuWJpJ4s7DMvZiSML+XqA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4eGpvzSGQ+26UczkATfHe0/tq7U9Oql/ee3hdrpkQX1Cge2bD
	H4uQz/0ofn7XyIzyRgOri+34SKhvQ41vY/C/rUWtdewBBHC2DNlYH10=
X-Gm-Gg: AYBFou2SjVtbw6KB+DcxQTSkDgpWr/emsWZoSFYH7RMA0su3YWcWTiBK4avfiaotDHL
	CIsJxP2EA4sRpGim79uE5OdzagLuB+6C8dWoSG688rMg6hArHIZViwu4VkGcX8GLxi7lHlyoMr5
	hNwq4/eJsR8dOSiuGJhNMrgHdpTeExr/asbvdhbXFKtu60AXimx523uZa7APHLO8akpPoj6xKZU
	/tLWdx4++cisGI/4msB462pN9TE01SwNw7KrapwWf/63yVwtymDO3Rxq72N2RDDnavpkCGEWwPL
	UQ/x9rBfs3TN9R5nP7XRpZbpnqPuPQMrKCKPEPBpl6WkywoMIgahws/EIHxMufOKitHIUpiS02k
	XnzmzHicQ6poJLZk3njfsIXmSd5T7vdYEJCSXucQz6P5BboBbiYYjygPNODv3QddOdmvuwmmlfN
	GuYWFUnZ7AUCViYH//W8vjpMT0eOe6SgqjObialQ1XTO4PsZ6wcfidvVfC8HKCeGYGmGpNy/3Oy
	TjpJTn/krulT/Tye9HG6gBhnLJKZ3+UgHXVy8n/YjpPdNZHSWnYqokxZdqtLXQxCxk7iVwSy+Cj
	AGgLs2QyGfo/VGaAPbV04cpNOnD89h91DphiJJE=
X-Received: by 2002:a05:620a:6487:b0:93e:4c1b:a06d with SMTP id af79cd13be357-93ebd1bac2bmr1499673885a.20.1791759453640;
        Sun, 11 Oct 2026 15:57:33 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98cd599sm723647985a.39.2026.10.11.15.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:57:31 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 2/2] rtc: renesas-rtca3: Join interrupt handlers before unregistering the RTC
Date: Sun, 11 Oct 2026 18:57:25 -0400
Message-ID: <20261011225657.rtca3-irq-ordering.2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011225657.rtca3-irq-ordering.0@gmail.com>
References: <20261011225657.rtca3-irq-ordering.0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Masking AIE and PIE in remove does not wait for an interrupt handler
that has already entered. Managed RTC unregistration follows remove,
so such a handler can still report an alarm after the RTC operations
have been cleared.

Save the periodic IRQ number and disable both Linux IRQs synchronously
in remove. Wait for RTC operations under ops_lock before masking the
sources, and reject subsequent alarm setup and enable requests. This
prevents a concurrent alarm setup from re-enabling AIE or PIE after
removal masks them.

Drop the private spinlock before disabling the IRQs so that a handler
waiting for it can finish. Neither handler takes ops_lock. The managed
IRQ actions still release the IRQ resources during devres unwind.

This issue was found by source review.

Assisted-by: LLM
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.

One existing FIELD_GET comparison warning also occurs when compiling
the unmodified driver with the same flags. No new compiler warnings.

 drivers/rtc/rtc-renesas-rtca3.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index c304ed60edc6..9b177a131c27 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -121,6 +121,8 @@ struct rtca3_ppb_per_cycle {
  * @lock: device lock
  * @ppb: ppb per cycle for each the available adjustment modes
  * @wakeup_irq: wakeup IRQ
+ * @period_irq: periodic IRQ
+ * @stopping: removal has started, protected by lock
  */
 struct rtca3_priv {
 	void __iomem *base;
@@ -131,6 +133,8 @@ struct rtca3_priv {
 	spinlock_t lock;
 	struct rtca3_ppb_per_cycle ppb;
 	int wakeup_irq;
+	int period_irq;
+	bool stopping;
 };
 
 static void rtca3_byte_update_bits(struct rtca3_priv *priv, u8 off, u8 mask, u8 val)
@@ -351,6 +355,9 @@ static int rtca3_alarm_irq_enable(struct device *dev, unsigned int enabled)
 
 	guard(spinlock_irqsave)(&priv->lock);
 
+	if (priv->stopping)
+		return -ENODEV;
+
 	return rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE, enabled);
 }
 
@@ -392,6 +399,9 @@ static int rtca3_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 	int ret;
 
 	scoped_guard(spinlock_irqsave, &priv->lock) {
+		if (priv->stopping)
+			return -ENODEV;
+
 		tmp = readb(priv->base + RTCA3_RCR2);
 		if (!(tmp & RTCA3_RCR2_START))
 			return -EPERM;
@@ -684,6 +694,7 @@ static int rtca3_request_irqs(struct platform_device *pdev, struct rtca3_priv *p
 	ret = devm_request_irq(dev, irq, rtca3_periodic_handler, 0, "rtca3-period", priv);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to request period IRQ!\n");
+	priv->period_irq = irq;
 
 	/*
 	 * Driver doesn't implement carry handler. Just get the IRQ here
@@ -786,13 +797,18 @@ static void rtca3_remove(struct platform_device *pdev)
 {
 	struct rtca3_priv *priv = platform_get_drvdata(pdev);
 
-	guard(spinlock_irqsave)(&priv->lock);
+	/* Wait for RTC operations, including an alarm setup, to finish first. */
+	guard(mutex)(&priv->rtc_dev->ops_lock);
 
-	/*
-	 * Disable alarm, periodic interrupts. The RTC device cannot
-	 * power up the system.
-	 */
-	rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		priv->stopping = true;
+		/* Disable alarm and periodic interrupt sources. */
+		rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
+	}
+
+	/* Neither handler takes ops_lock. Do not hold priv->lock while waiting. */
+	disable_irq(priv->wakeup_irq);
+	disable_irq(priv->period_irq);
 }
 
 static int rtca3_suspend(struct device *dev)
