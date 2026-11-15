Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755350;
	b=274OuTbT5zeR9J7tR7+A5HbjGiFz8rrGejAon6mNn730ZtXfhwaJ0o8xnlgvO/9OiCiX
	 hfLHElLol0SyhhKNVEa87qZjkaDaN6F7cnBCD6wwvcWQNId4yyo2vWZaJi92f+TgDsx0L
	 3JLOi9oxbfAttao7AJrIB/IkP4H0TAXWGuhdaonRz3SJtya8Z8V0J0zOODIDN+EifZ5wK
	 UWv3zlkb+ihHSCvKbCKUpC7dtmveTjS1eDz09V/223xF0bpRveiwpz7zg/VGpowmVrSKG
	 uX8QgY9NtBaTTlNP3HzZQvj/9FqFoWZMIiDL/EaPDVdzTMZhuS4pVVEphE/O1CBMtkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Xq7qc4BRfu5FJGRN78qOqsOjPTIEKnXdGiz34GlzHCY=;
	b=bWTN+oGSktP8x0+P5u4o+mcqOaZBowrxxrVsWzO8bO18NslYBem5tQ6Usgg/l1qXHYBk
	 7O64/tZrkKvC6gOP1a4b1axAT7gsY7hTRZCOV4mlgq4F47vqscYenSHuEjNGJppEQMUBu
	 XQbeNRjSS84y3OWtmyKvKm/BkAq4mChAZQWlrxokpiLbL52z+HuEQue0QGbzIToxiq59l
	 hc4BZLNMMA0HgU8hiKeHkv/BSyjoJNXDcAM/lZ4DczXghln9MG07qRvbAIcPw2vBxMlRl
	 vnOUWM+UYIdoOPMsnDFhPiWUOhHbbY/AF39jbasR7Udu2S7HUDqYzZe5oU9XGq4aFXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rCxSEUxa;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E289A606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E289A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rCxSEUxa
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so19484455e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794755348; x=1795360148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xq7qc4BRfu5FJGRN78qOqsOjPTIEKnXdGiz34GlzHCY=;
        b=rCxSEUxavVoPw8oHQzwRacIkVgUNBvJQUSqMxPRJSGadPZx+kvjG97Tq8oMhiUdQh7
         oDHwczu5d0A4jGiPN3y6Hs1F9V/svsg6VMBvWIZKTsmeJdMZUdMZK7yTO5Ki2DsXH8xM
         17535pnAFg99xAYjTAsQcch1Blj+CJL6WBUH77Vv8P/D4UJEO0ZwiaV54U8t0T5GpcbH
         2qm9Mr4N0EDIxPiMmEkU1cXzLlwGkV0JGWefB9apLM1DFkoZTTK64ren5W8XCgtkXli0
         sABfA8KbDe1gE+sDwhTIzMNJjmt7ISexoRKDBcU3EhUjBz/wZAPHtMh0qtOaLj4KFoKz
         njQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794755348; x=1795360148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xq7qc4BRfu5FJGRN78qOqsOjPTIEKnXdGiz34GlzHCY=;
        b=F+PtG0YEyMCuKGCkS1sNnk0PyCL+x6M2Wc3m92lVM9T/daOLODUREtwyO0ZJb0FnOk
         UIHi56wsOEaSmlmDradlcwrxpEQtXTUsQZZz7pghcIChYOftynylVeDvVEGdgUWVEO2i
         BK83GVaonP9ZrvMIrlschhMQ0s/QiZfc62GUDLoxwtMKdDYXrbGi+mWbqJBp9/zfG0VV
         xSSX23J3oxKPqB1o5XPAoOUejMnh881h1jCXK+aodVV4ED8hqsGZre5KdFGL53NNDgFf
         Y9nS/JoLhZNs4SA0cEZ5x42uuLqzGO+YTXKv334xmMQBe+u+UW2z9LClvNZOjaiabmDW
         SLSQ==
X-Forwarded-Encrypted: i=1; AL+hErEyYKSy/T+EWJVapXAKMeaR/iY8mksar+rNS2QmreFaIyiJSwNEjx2IklKo4tnJ4TjoF6xpJZAb/Ns1qdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2SOfhibAJ+k4FWfUS8sWk2pJrlqj2VYpfZ6FU0MH7XBrstEpi
	5lE21VWjVbbpwFIf4SZFsD8QFlKhxP7+LMgQ8VpZ0CLvkh2JGBgllADD
X-Gm-Gg: AYBFou3bIL7BlB3Bsl2m8KWcrqB9xDHG8kJM3wZprOhj1frV/xeZyF7f+0kF0WRXjka
	NhMpsE2omIifrOCPYh1DTWM0mqQ8jVNRyQPd5Y+edM6ybxwqPM1+g469J2H0h5TX8a07lybfakZ
	It04dV/G57/vw16RSz7Z6U53Sntq84nQvukHOzKPT9Ljf1I36VKJEKLifM6AWHz72+hK3t4cwJM
	32H4GGZedrtySOws7rsn6++7zZ0UOWB6ATP1KmFIZLLQqWLhQPzuE3/CMcCPhe5zru+P0lMfkEK
	YpAwQSqPQA7IicSHKIX8i3bIqbuvInlGCVE2p8okLVVwtRTk5ZN9bIUFjmCVieKqI/2nFO2qUCv
	eCAW7K2eUGyax+U4WOUT5xRuV688212Jkknv3UGUxzBscK+xj+YEk44sLSzD8ttUc4PYguxTguw
	UOHjeq/1Tw6RemdSNmTMud/YH8iz1FVMNsflLlONJzc2cAHmtF5nB/Le0ZxiCI1u0NjzVptMtd+
	UvSjDFGZsWAng5lLzIQppPSTHx+rVSAWVFA2f7vyrynWOIfcSayjG3E57BkfY67mSoD7nV9w9E5
	UIMd8HP0g2P2gglD7vfDQrJknjD6js3Nzz/3xQbsrNSWIJuQSz2HYS91l8eofavBVlqY9OFWLsL
	DIjB5qZrdgFlOVFoVqDSaat0fkiFGW1CzmudSF+2anoY/bpgZ9L4xNYqlFgn4KgZcaC9uAQQfEG
	wbCAZBrxVnGEXKbHiZi4ckzEiYlUZdN4HcGvS+FNYziz53eOILCPjlVjwzPw7ZFjAeRtEB8GSGF
	AIixcj0JzbQCw==
X-Received: by 2002:a05:600c:34d6:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb5599801dmr172843665e9.0.1794755348206;
        Sun, 15 Nov 2026 07:09:08 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm150114515e9.3.2026.11.15.07.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:09:07 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] Input: axp20x-pek - support the AXP313A power key
Date: Sun, 15 Nov 2026 16:09:03 +0100
Message-ID: <20261115150903.16855-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The AXP313A MFD cell is registered as "axp313a-pek", which this driver
doesn't match, so the power key doesn't work on boards with this PMIC.

Match it as well. The AXP313A has no AXP20X_PEK_KEY register, so hide
the startup and shutdown attributes on PMICs without timing tables.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/input/misc/axp20x-pek.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index c34e002258ee..d7e696dd7c09 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -85,6 +85,9 @@ static const struct axp20x_info axp221_info = {
 	.shutdown_mask = AXP20X_PEK_SHUTDOWN_MASK,
 };
 
+/* The AXP313A has no AXP20X_PEK_KEY register, so no timing controls. */
+static const struct axp20x_info axp313a_info = { };
+
 static ssize_t axp20x_show_attr(struct device *dev,
 				const struct axp20x_time *time,
 				unsigned int mask, char *buf)
@@ -193,7 +196,26 @@ static struct attribute *axp20x_attrs[] = {
 	&dev_attr_shutdown.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(axp20x);
+
+static umode_t axp20x_attr_is_visible(struct kobject *kobj,
+				      struct attribute *attr, int n)
+{
+	struct axp20x_pek *axp20x_pek = dev_get_drvdata(kobj_to_dev(kobj));
+
+	if (attr == &dev_attr_startup.attr && !axp20x_pek->info->startup_time)
+		return 0;
+
+	if (attr == &dev_attr_shutdown.attr && !axp20x_pek->info->shutdown_time)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group axp20x_group = {
+	.attrs = axp20x_attrs,
+	.is_visible = axp20x_attr_is_visible,
+};
+__ATTRIBUTE_GROUPS(axp20x);
 
 static irqreturn_t axp20x_pek_irq(int irq, void *pwr)
 {
@@ -392,6 +414,10 @@ static const struct platform_device_id axp_pek_id_match[] = {
 		.name = "axp221-pek",
 		.driver_data = (kernel_ulong_t)&axp221_info,
 	},
+	{
+		.name = "axp313a-pek",
+		.driver_data = (kernel_ulong_t)&axp313a_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, axp_pek_id_match);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

