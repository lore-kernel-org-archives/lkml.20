Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D2341A4FB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376439; cv=none; b=mFNIJHkJ/qMcVGZJnBT8ODMm+MelrGKJiRJHSrGwF3lXdjTOSSGRBScXJ5/oRA//a1SzgS4p1nqe4sR9dPcY+Rr70FvGgr+Sn7zHPapS/gBWG/EtIBKWJs/ayglREC4li5V2yHoTTWukcaJTV+5ufAp4HdxWhw2X1DEvMFHHTA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376439; c=relaxed/simple;
	bh=fd4IwnttAj8+fxTWq2c8ZtjFO80h/q8D0v0Pef6pMwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYv1XCTLT7Y8OVPCw/UarnuGnpHtXuTuuO99dwva9jB1e/dkTMkOYwvkYtPzM8ko4TKEK/v5gSd11CeyKcLxbe2VRmG/pnd/Edv65HMQ3PIrGrv85pS7grIQ1YhKmcAm+m3/7ey7wH79UOYli3GcyymleozAzQOvjSdRK4i0YTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVynkl2Z; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVynkl2Z"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso741676f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376427; x=1789981227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaMjbnfDAPZVK+O4yC2H4PKXkZqx8bBFkgVpIjfU32g=;
        b=WVynkl2Zq7N8/va0ac9dIVoEfryijXIX6UhMCF8GnLH7lpf99tkgApeEv8kVOd90Jw
         dgBs2RHK7ryNuA4ysWEMUWMSfx26DGORzrgXm+qsqFFLAUccwnxmGkWubQefUE+fVH1l
         TTZr2x2u3Y8RP+Jdq8EHuQqtVMeDj/WJRjUpBlzBjfvLaett2/qmuG10zKDX7WmjAb59
         M2vP/dqGetPNFWj0BPr8MBWy69XQQTaRPDoFHn/cgQhihs9WSK8ASKp9J8v1zp0tNxuy
         Rs1mTczMwQ6HGhru/A5zX0V1cOKEcrWShmVyeQTp2szBFM9AfZJXPcYvza5WWgVNIQEx
         /a5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376427; x=1789981227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaMjbnfDAPZVK+O4yC2H4PKXkZqx8bBFkgVpIjfU32g=;
        b=tTRcd+ehTXyfOxPnFearAGadyDV4E2FdkagNVNoTqGECukxSYol7zpj68DhSr1Txc2
         1koLyrfZXNPcyJb2FG7BpVQNfpFWHXcRcHNL2JUEOIexM+hqhgxoHR+0pb4udszOqkDx
         xrMwv4Ura2PmwFywbGCDxTMJ8m8ZHZ/SYkB+OZs/DKgNPfiSe8bIpYx7biMahWyZWZJ8
         2kNz6r3eeIjMLb98YukEYG1N9g3Jj13vNaMH0E0s9cHkDFmjq6mKVnv4lg0SWJL4uFt6
         wrtLvwCB1OUQgnJCTT1ruBK3ai2e0L7fP3gVNXhrtKlGva9YXTBhx8IOG1ClGf/gdZPW
         2XbQ==
X-Forwarded-Encrypted: i=1; AKwUvBygamN0W+mg0LRsZcE6Jp47KgJ90MK6sHg1Ylh+bf0+BAJZo5I74YKGCsezp3673maZnjtKOr7JGe0qkTE=@vger.kernel.org
X-Gm-Message-State: AFuF++moX3g3Zng2DUZxQsAgC7eJxd9dbt98wIwvU4ZnaBKOl83AJfFA
	M3gYem4SGTEB5a+RgL208PQuXnZdncsZ6kzxUWGQuNsr1afRepY6I4jM
X-Gm-Gg: AYBFou2ywRLE2ZgOUCH2YS81CuzhCnV62R8HJTtCln8LsZqqd710cJUmRBwueg66ppq
	aaSbQQFhqj4rUgpWJ5KamunnOhV5sc44+rHHEckCa/UaGhIlZjR1hytc6hL1h1/BuYYBgGrpN3U
	6xVKhkgB/DS8g8JaUD3R5hMcfSDrEnEQmCzK2sfV1XadVNofuqakmu7owYfm8bD73z5gNNq+j3B
	TvaCainrm6KHPhxKfSqIVLskBw8n42VXQ3UtcGE+nFyteGo/RPzW7boHWTINCY5Oner4eTlYrcT
	JybXeFjL8IQ8IjKxVmLJdD34pWu2Xol+BTZJAwYXRhZrelQAZjtF178CxAcNa7G4mTSGtQuLpIk
	Oo+8BjiYlAu8Kmg4++E5VvyRQgZe3EA+Pj6c/YWPkdY1uvVL1CPUvioriDdHFMreuYehH9RJ2EK
	p49rQ4Cpm3qCNPIhmmlJKLl2oUJC0DWxeAj79lWViy2MKacFya+iP+i8jBcxXv6gzHX70l4fbBF
	qxM0ch8X1uV
X-Received: by 2002:adf:e18d:0:b0:486:f955:895e with SMTP id ffacd0b85a97d-48702a9a5b5mr1446542f8f.7.1789376425972;
        Mon, 14 Sep 2026 02:00:25 -0700 (PDT)
Received: from anthony.local ([2a06:c701:9cc4:c200:33d8:8ea2:e077:ebe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm25245851f8f.9.2026.09.14.02.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:00:25 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com,
	holofermes@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	amit.barzilai22@gmail.com
Subject: [PATCH v6 5/6] drm/ssd130x: Implement ssd130x_write_cmd() on top of ssd130x_write_cmds()
Date: Mon, 14 Sep 2026 11:59:30 +0300
Message-ID: <20260914085931.66857-6-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914085931.66857-1-amit.barzilai22@gmail.com>
References: <20260914085931.66857-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ssd130x_write_cmd() and ssd130x_write_cmds() each carried their own
regmap_write() loop over SSD13XX_COMMAND, differing only in how the caller
supplies the bytes.

Turn ssd130x_write_cmd() into a thin variadic wrapper that collects its
arguments into a small stack buffer and defers to ssd130x_write_cmds(), and
move the protocol comment onto the latter, which is where the loop now
lives.

No functional change: the bytes sent and the bus transactions used to send
them are identical for every chip on both the I2C and SPI transports.

Assisted-by: LLM
Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 65 +++++++++++++++----------------
 1 file changed, 31 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 1d834be6243b..fd13250ef56a 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -258,41 +258,12 @@ static int ssd130x_write_data(struct ssd130x_device *ssd130x, const u8 *values,
 }
 
 /*
- * Helper to write command (SSD13XX_COMMAND). The fist variadic argument
- * is the command to write and the following are the command options.
+ * Helper to write a command (SSD13XX_COMMAND) from a buffer. The first byte
+ * is the command opcode and the following ones are its parameters.
  *
- * Note that the ssd13xx protocol requires each command and option to be
- * written as a SSD13XX_COMMAND device register value. That is why a call
- * to regmap_write(..., SSD13XX_COMMAND, ...) is done for each argument.
- */
-static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
-			     /* u8 cmd, u8 option, ... */...)
-{
-	va_list ap;
-	u8 value;
-	int ret;
-
-	va_start(ap, count);
-
-	do {
-		value = va_arg(ap, int);
-		ret = regmap_write(ssd130x->regmap, SSD13XX_COMMAND, value);
-		if (ret)
-			goto out_end;
-	} while (--count);
-
-out_end:
-	va_end(ap);
-
-	return ret;
-}
-
-/*
- * Write a command byte sequence from a buffer.
- *
- * Like ssd130x_write_cmd() but takes a pre-built byte array instead of
- * variadic arguments, handy when the command is already in an array or
- * when the caller wants to use sizeof() for the length.
+ * Note that the ssd13xx protocol requires the opcode and each parameter to
+ * be written as a SSD13XX_COMMAND device register value. That is why a call
+ * to regmap_write(..., SSD13XX_COMMAND, ...) is done for each byte.
  */
 static int ssd130x_write_cmds(struct ssd130x_device *ssd130x, const u8 *cmd,
 			      size_t len)
@@ -309,6 +280,32 @@ static int ssd130x_write_cmds(struct ssd130x_device *ssd130x, const u8 *cmd,
 	return 0;
 }
 
+/*
+ * Variadic wrapper around ssd130x_write_cmds(). The first variadic argument
+ * is the command opcode and the following are its parameters.
+ *
+ * The arguments are gathered into a fixed size buffer, so at most 8 bytes
+ * can be sent per call, i.e. an opcode and seven parameters. That covers
+ * every command this driver sends through it. Commands taking more parameters,
+ * such as the grey scale tables, must use ssd130x_write_cmds() instead.
+ */
+static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
+			     /* u8 cmd, u8 param, ... */...)
+{
+	u8 buf[8];
+	va_list ap;
+
+	if (drm_WARN_ON(&ssd130x->drm, count > sizeof(buf)))
+		return -EINVAL;
+
+	va_start(ap, count);
+	for (int i = 0; i < count; i++)
+		buf[i] = va_arg(ap, int);
+	va_end(ap);
+
+	return ssd130x_write_cmds(ssd130x, buf, count);
+}
+
 /*
  * Run a packed command sequence.  The format is a flat byte array where each
  * entry starts with a length byte followed by that many command bytes.  A
-- 
2.55.0

