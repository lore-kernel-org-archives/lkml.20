Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC3B3BD63C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788726553; cv=none; b=TPrnS7Y8GtdbrD5Mk71mDQ5sJtGCAZJIypBSHg5SCLjUcpvtT3OgOtR6x12Ed6LCpyBveVBXomRir7pdz9ha4x5x+bYuo+IcaciMG1mEAA8OsJrfReYalb8iu3LnF40ggdL60p9tK+hSD8/sjwpKg/3MwSpsXA1S18FxfazBesM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788726553; c=relaxed/simple;
	bh=WNS1zRdSURpkdSXiB7VzYO5YC62mc5b+ZtjBUfeDwSs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NR4gjR3k0DuQgttPvoDqL6Ul/1zMXy2ssld4kyFlUAhpmlz9LIpR4X/lf/BxDX62pXR0/HlCyadx82G4bCeh2iffLn3dMfa8r3elUEkTddS2qfzguVxBTGzPdnNWQryIfD8kBasbI4qmv+pkJU4ejQ+PSG9wJxWVjS2Ds2E2T2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RJqkKu8j; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RJqkKu8j"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb835525b10so3507775a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788726552; x=1789331352; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7prt9MlqcUNMzUdkt0ytNZsIrDLRTQGTGe/hvHFR8Fs=;
        b=RJqkKu8j3I1f0S/Q88dM05quU/MhJoxM95W58yGbcelR0e/8BylEmbQYUQbF2OPDEG
         xlzw+yPjLx0Lj0sYAPQKo8UFQK2bTWoHiLV8J8FGGf2KnKd6c0E670JitrXxymSrv86I
         w8H2ci3BbMAIdtyGsFCesTcp6RipUK5sSeTwHaVvEZAJvBJgxF7uF9U6qSY2/6OQ7asF
         coFXn59tnpMBbQdhlnDOictd4JhXyH96S8uwLOHlDnZXYxRt2CoYsa/9Wq5Seog0c5cE
         96l6SZWGqE/+o5vSRANk7DkwJKxcC0qjRH/XB7wEUh6Ef/DLfuQfQBNtNAIjKJTRGkfI
         6ODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788726552; x=1789331352;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7prt9MlqcUNMzUdkt0ytNZsIrDLRTQGTGe/hvHFR8Fs=;
        b=rrTEeX2ZGtJmdyEX73gYwFhyTTVx+9JCFLQnc3c8BJ6SX+9H+PZVWIQ92HefVRj1+i
         VNxE5lXWR6JAAAL28nEw89M2ydYGyNdNa9trFbJctmyoM+ZCM8DD8W+9Iqa1eeeC1vDJ
         hGO4DACYysJhI6UkF1HiysKYFTLQxpVaMZ4BdXYEWnOQF0rQOireGtW46+msjT++LWZz
         XGQE2c2AHveXlIBIuttOM04yOf58dlMY/+o7XUH4iXaGxl5i4z9D1oNdwKDEa14s6NrL
         0VxDBerW0J0Rp7DITB0bPO6gm3ieplXIIQ87prDN+gPWi1sLYln/cePzWDh+OH7+0gq4
         NcZQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+XW4gGM1gINrY+y0vz94wPEy4F4cLoRPa6Sc0b0hJdPZoxy4tYEcBkvPTqvsp3wJHSjWV9NALEUp9dEo=@vger.kernel.org
X-Gm-Message-State: AFuF++lFkYZ+F+lBQS3EX7kcxeb1d9eduxnzcUzz0mL27xf3haOXZq3q
	aJmBaI6whFERbaoO7ioqfg3906CpiHtuRVHE38bSscW9nITqpImpgTgR+S8eIf2AWdZWwyUSVAb
	uhuWD9piHijmDMZSIsOXDEXLkuCGc3Q==
X-Received: from dynm18.prod.google.com ([2002:a05:7300:2a92:b0:336:3540:43fb])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6e04:b0:3c6:61b9:917c with SMTP id adf61e73a8af0-3da39cfee0dmr30467270637.11.1788726551480;
 Sun, 06 Sep 2026 13:29:11 -0700 (PDT)
Date: Sun,  6 Sep 2026 20:27:46 +0000
In-Reply-To: <20260906202747.4041389-1-samagazaryan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260906202747.4041389-3-samagazaryan@google.com>
Subject: [PATCH v4 2/3] i3c: master: add i3c_for_each_dev helper
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vitor Soares <vitor.soares@toradex.com>

Introduce i3c_for_each_dev(), an i3c device iterator for use by i3cdev.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
---
 drivers/i3c/internals.h |  2 ++
 drivers/i3c/master.c    | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index cbc00c862104..3c53a5108b81 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -79,4 +79,6 @@ static inline struct i3c_master_controller *i3c_bus_to_i3c_master(struct i3c_bus
 	return container_of(i3cbus, struct i3c_master_controller, bus);
 }
 
+int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *));
+
 #endif /* I3C_INTERNAL_H */
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index e8a9f8c3041e..dd5071ca9195 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -4011,6 +4011,18 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 }
 EXPORT_SYMBOL_GPL(i3c_dev_free_ibi_locked);
 
+int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *))
+{
+	int res;
+
+	mutex_lock(&i3c_core_lock);
+	res = bus_for_each_dev(&i3c_bus_type, NULL, data, fn);
+	mutex_unlock(&i3c_core_lock);
+
+	return res;
+}
+EXPORT_SYMBOL_GPL(i3c_for_each_dev);
+
 static int __init i3c_init(void)
 {
 	int res;
-- 
2.55.0.979.g7e5102b832-goog

