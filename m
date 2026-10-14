Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88137569F39
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999279; cv=none; b=Y+f+Piii8V84DWad7np2hyG84GkVhky5HOKqYOz5c9AnwsVpAJsRSVClP1VytBt5Qm7Nq4vJAjr/e9EGEGgAoM9ZoNBGIoUpT0gr+rhZ1GWmrKXrROKYvpjQX56lBneY8MA50pXty0MxcH5ACPtTx2Ke3s9rrq2KPKWblJGpqN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999279; c=relaxed/simple;
	bh=bzbUmYbwUXLekuDAfrcWEFz0OZjDqt5QElM4sqlrgZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LmmzRAEshnvLHRtpNgFwdXtUuH6mSFk1+8kEY+nzKiprMDS+G5/HhmGQtTHb+0nYbEDlAnwSYvXXF3Ajq76N44BRFV5cZk8X6OVQcbuh9uj78+izQ4367DDoKrwExm3Mnj2yThNuOqMVRa/EMFKhRdWQb3dBOQyaL1647GDuw1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGJpulDq; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGJpulDq"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c315a445752so671265566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999270; x=1792604070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gvT/8PSXK7W+KJQiA60Ooue5nDlDpUxFEkNrlgsoAs=;
        b=FGJpulDqU51HY4RBXPJ7MnbycibmlIvCg3oT6EzpYZF4eHc8MQ8mf1TGVKYEi4Zp/E
         Y00DjvV4qrAwpynVCaewNc+cOJqW1pVjtvPNP7Vbe2ljdspkuy/h5i9YVbWTglcI3en6
         0YLOocIvtLHseEz525FJcfesUzGuVqKUYbouyq/hQsJ+DFkFptKNP+nwYfZ2+SkMG8XG
         tY2CS0YWm+nmZi8mdRGI4wCik0Be1//Gy9ybQMCm+tMRHe7kUj8V2Jh98P8cMlMdxRZA
         XEzVQvE1028w4MpBaRTEgHQKEtFau7xQgYJ1r38ApimuV8caxqEFtaedG+2yCvzo//qD
         YyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999270; x=1792604070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6gvT/8PSXK7W+KJQiA60Ooue5nDlDpUxFEkNrlgsoAs=;
        b=J1hjx9hmRO8r0MtaPhkYiHlgJtcd+vPLMVZEhj5AP7k8chLM9A8YKjmwVPgS+tybRO
         CelyhJ+5y7lyCZFGP3Bj47XeP6PjIh1F/YQTXhA2uN62p7OmTXDHi4dC5m9LPQDu6Sks
         msTMmqItt4v5wFG0BTBSuP1vt7TJNlTNCR85ZrhlMQCfMIH9ZcADx/Vh+4i9L6GvlFAq
         CjUhkT38h56kUxDlZOhgtN6Z8CxznP2usdfpV4LnoaQ+uecNsO7dYVgh5145Kf6jTa9Y
         ULyDDU+XQdaS+QR/G0UEhTGGTjVnTvujqAj6T1cwMn3rp6vdXzQW1BJj2NkJiwXa5XdV
         ZuvA==
X-Forwarded-Encrypted: i=1; AKwUvByfOFXCwCvhWGty75SFguI9reyjsooDWTyB75Vop0za4b05DYTp6wVPX00FsMzanH5RKkyra2Y7ZmVZoqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWy1lvj4arFNm7bS5n024lPzy5ZPwJ1wa2miQ3jyIp6V2qdECo
	cEsKw75gAvk2oH4mINIWhUtp3U2BoBkYnbvKDzsQ34KUx135n6En+hpm
X-Gm-Gg: AYBFou3UwVda5JUipFIvPLIwUjT8519nc+xDvWuz6S/c8V2rbzsTgBl21EgCzoqtCiT
	x7xhF07aaxKkEoJqn+nRKTymXBK4Xtg8k2aHb2Om4T+ZL8rV9rXCvIE4tUQdJnfjjMyX/7VsgqT
	at1KuQiOVU53Yj5CFh2bYm5LCQ/0bbsjpsNCskxKjbDTTxFu9i8Ev1a+Xh8UhXTkAp/D17o9ks1
	uU4rv+pK9d+Of4ic60wEmi3XWkiQK7VswOoP9nR39T27zKkd2d9IisqT/1HqSYEIwtpn45oYfZE
	xrnq4Qt85PLfjrqUf/l8zUIMAQcpotlRaP/cp+sZTfDELCqb50VQBZRaLggjBe05RW74Ay9CSl3
	A7onCkWTKr1j+LzecPJbkJuofLXL71sahvKE9/cp5NNDSbvf16tjyPPcpafSW0aWcAFp3SNxyrd
	LKO6Wo2t+KfX69SPLBQ7QPC3Yb5d3VfYMk6YQ69xmoKMC1k+9c73qsDgQ8RId9IrGnQXOfZJcIF
	ciNyjGMURiTq/kbCw==
X-Received: by 2002:a17:907:9618:b0:c24:4128:c19f with SMTP id a640c23a62f3a-c31a9d0a1efmr1616131266b.11.1791999270168;
        Wed, 14 Oct 2026 10:34:30 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:29 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:10 +0200
Subject: [PATCH v3 11/11] hwmon: chipcap2: synchronize ready IRQ state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-11-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999252; l=2220;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=bzbUmYbwUXLekuDAfrcWEFz0OZjDqt5QElM4sqlrgZg=;
 b=KkffEK19xqZ2pzHaKCnCPVcs6OWCp0j204MpTFkltOAHtXtyvNJchFYvrC2L9QQ+HdUo2lzKU
 W/q+NODjKriApMMkpuXCIcIQwITwb2yRBaMdP79LjRsiRFS4Sr2WtaT
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

The ready IRQ handler can race with reinit_completion() in the enable
path. In particular, a handler from an earlier operation can complete
the completion after it is reset for a new operation.

Use irq_lock to serialize access to the completion and process_irqs.
Disable IRQ processing and synchronize any running handler before resetting
the completion for a new operation.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Cc: stable@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Assisted-by: opencode:claude-opus-5
---
 drivers/hwmon/chipcap2.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index b3b725cc7224..00f62a33d463 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -123,6 +123,16 @@ static int cc2_enable(struct cc2_data *data)
 {
 	int ret;
 
+	if (data->irq_ready > 0) {
+		scoped_guard(mutex, &data->irq_lock)
+			data->process_irqs = false;
+
+		synchronize_irq(data->irq_ready);
+
+		scoped_guard(mutex, &data->irq_lock)
+			reinit_completion(&data->complete);
+	}
+
 	/* exclusive regulator, check in case a disable failed */
 	if (data->regulator_enabled) {
 		scoped_guard(mutex, &data->irq_lock)
@@ -130,9 +140,6 @@ static int cc2_enable(struct cc2_data *data)
 		return 0;
 	}
 
-	/* clear any pending completion */
-	try_wait_for_completion(&data->complete);
-
 	ret = regulator_enable(data->regulator);
 	if (ret < 0)
 		return ret;
@@ -162,6 +169,9 @@ static void cc2_disable(struct cc2_data *data)
 	scoped_guard(mutex, &data->irq_lock)
 		data->process_irqs = false;
 
+	if (data->irq_ready > 0)
+		synchronize_irq(data->irq_ready);
+
 	/* exclusive regulator, check in case an enable failed */
 	if (!data->regulator_enabled)
 		return;
@@ -510,8 +520,10 @@ static irqreturn_t cc2_ready_interrupt(int irq, void *data)
 {
 	struct cc2_data *cc2 = data;
 
-	if (cc2->process_irqs)
-		complete(&cc2->complete);
+	scoped_guard(mutex, &cc2->irq_lock) {
+		if (cc2->process_irqs)
+			complete(&cc2->complete);
+	}
 
 	return IRQ_HANDLED;
 }

-- 
2.43.0

