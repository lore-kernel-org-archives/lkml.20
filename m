Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960312;
	b=1+DHwGDOwgr063zpIkPnLynQfzEyLd+YiupQXtAs26FAaPUMYxXgIqTsizWE7YUEovsa
	 smkR8OKRSU6iyeOJvZ1MOLx66XioufSQBQYQJ/O0s1RXbST7ydHVxCwadO8ZmmnvH67qV
	 v2mC9ExzGD5XKDLI92XPmzP/nm7vtr2mM2RZ6WM0hqt1ZOa1zNSnx9W5gajyiozDxxkH1
	 HzwtBrWW7blDKW51hIKfFzCLWIwFSwG4URou8IgXER/JXaraQwbOZBTU/VnYWVvdHUge6
	 qFeSzjUjgXKV6CsNyMgq8w8ACgXbF9qcJJ2tb/bM1gPYwJU2BkCCZpylkiDw62vdGsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YXP7LYt248mnXrTdbFg3MpHjAHmc9wRJcoYVHySeVa4=;
	b=awlJiMn1gQQMFhVHoXoFgDo2uCxWvwIZjFpmIjcq73omPX1+sZVVg86TBgSkFnWVfwL3
	 amI41kkN6c9AwY/8wcoF2WLAUd2Zg386iqLVqvNpSVqBoJn8I0iR+elYp0pAvowZvCQqb
	 YMuHLSQbUh0SBf8VMN6u7qVt/eoK3rdIeiXlwDl7+6PYdIqX1eIgUxZB7bwhtKZZotWEq
	 Afb3QIql7fjhKCrFVrt7oo6qTZBYuMWzowBPcTU/8HHWzyrEldW/Xm1YHyypCc1KQPI6D
	 z2Rymt9ibBa1m8ggBJFYHSZ9/fZscNMHdYrBSwt9G4NGQaRVO+ixzmaGd/5+uWumVEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tDQgcr11;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E987B606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E987B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tDQgcr11
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c247f6687dcso348159866b.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792960310; x=1793565110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXP7LYt248mnXrTdbFg3MpHjAHmc9wRJcoYVHySeVa4=;
        b=tDQgcr118rJw0XFge3yEWlp0H2YCXfjjA95Ktm315yipkuno16IvEOf1CmYiIp2X+G
         RRnu9wGgtFhYJ6ugkk0PpvaEaIavkBstmTnu+/n3fM8LDE6e86+wCcsu4A9U04kl7kr1
         BNkjNcN31gAOzxZ156hy6v4XsWCe1SnoptS5lXrAnT5PbTqFWqCXQHcQexs1Fb5M6SwU
         eVCBU/nPkQriDTE6M3qZaYe6oHFLVY0Q2jTKR3EWx8ZQmZv3ag/hnoO55iNEQWLgRZpP
         9HK6i33ABc0Aj0Sb2vGhAjtjl3slmkMi1zsdrAOrrbDRMiB3w9d8e/DXK1he1W21TxcE
         IttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960310; x=1793565110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXP7LYt248mnXrTdbFg3MpHjAHmc9wRJcoYVHySeVa4=;
        b=FMdta7pgEqIwYp8VKDo+OdHazbgQR+MXswEHMtD7M7TkhKI9OQcFzWj+lx3PICjbE8
         4AToIZQbOSbBMlr/bgSp0n/UXuIRjJ3d1uLkPshjwbdKIbgn2f7rlOAMu9FutuSpN8jF
         kOks6o14Kq785jMb1RaPIrgpFKKfjmUImFektyIoI8MCF2YJx6s4QiBFuSjZ4kbWKfcX
         x7tQailIoMAdVpAM/W9eUZXS1H0B+23Bk6d2mj6+0qXEmALIOfUgEtrAbOoBO+LvaVum
         F2zXV/KFvDiBp3w9XKkgetiJ59gOkZLycuM1elp3oAgKqN7qNzhV2wVOqmkGkbxwlzP6
         siKw==
X-Gm-Message-State: AFq9FYKXKBcOvwZwfPpCImGkaOgRGJ1uRYGnq0/A/JK4oziCU+/pYder
	XaHs28efg8NxHo7ZNFwFW2RUk370mDBasQhTxiWv+7TrqQBVXYYm+L5Za/Q0opLNCG0=
X-Gm-Gg: AYBFou1EzNiBah4pdWaQPGAFLwmqBQK6lirhjw7YJo1Wq3WAEij5+zdlD0p9PQxmBNP
	MYOfJtyzQ7SqRAodZm998Um5TzoOXpU35CM7cg4Q+7pL0buGWSrmisNICop9rx7RaPGiRFJzkZf
	h8YpXLTP963RHsDK5azHg51Wd0wIMzEEVmKgVxMm3aG/R2pT8dPvCQXYCvbmXbMGpVh8IlFQN5B
	XNfAaEOyPJ4Zt2kS7kWj1G27QtEZNP0x3c2WsqY2VpanLq1F7me0TDGnlrNL/5m9SYJ9YIFTIUu
	vECiDOxaPFAeQRNhiUKBbtPPr3en0pKlPVZxa8JrYA38UpaLAK+kpryMvq3Wh7PB05twXdVd+eG
	/JzlEowSUH+4bQtlpbheAW9DQRtBxBnBmpa7qGKEmVZn3TRLmSOGHowpaQRdJqS3H0vAhO4lTDF
	mWUI9n0s1d0eiQ2FihkZ/hxvyxeHNc+OJyc5m+fIW3TSm0K1xrPHRbxzjP7lSy48pHLoN9GnrfN
	RR6UGvHKXxbPlwqcuclSAb1WmbeW42OEmmm/XxrnceDlt6ByJr80s7+y8DU7dxhufzxtF4/nK7P
	MhAjcWlJNUK24Jx85UoqgiljPCYxsuZ3vyRMFjFPh2UpnTxI5Hswhnsc8hNJNr28zGiVht180bS
	j3Yg3KOkLpzqL587hAEX98ONTT7xge6xZbt6KvMqQIbs6
X-Received: by 2002:a17:907:3ccc:b0:c40:6ed9:b962 with SMTP id a640c23a62f3a-c46bdc2a4b5mr626000166b.26.1792960310068;
        Sun, 25 Oct 2026 13:31:50 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd52435asm237098966b.36.2026.10.25.13.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:31:49 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] extcon: rtk-type-c, ptn5150: fix connector fwnode_handle leaks
Date: Sun, 25 Oct 2026 22:31:46 +0200
Message-ID: <20261025203146.455051-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
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

In extcon_rtk_type_c_init(), device_get_named_child_node(dev, "connector")
acquires a reference to the connector fwnode_handle that is never released
on any return path.

Similarly, in ptn5150_i2c_probe(), device_get_named_child_node(dev,
"connector") acquires a reference to connector that is passed to
fwnode_typec_switch_get() and fwnode_usb_role_switch_get() and then leaked
when the function returns.

Mark both variables with __free(fwnode_handle) so the references are
automatically released on scope exit.

Fixes: 8a590d7371f0 ("extcon: add Realtek DHC RTD SoC Type-C driver")
Fixes: 842546c56345 ("extcon: ptn5150: Add Type-C orientation switch support")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/extcon/extcon-ptn5150.c    |  2 +-
 drivers/extcon/extcon-rtk-type-c.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
index eca1b140a..b5e1a3f3d 100644
--- a/drivers/extcon/extcon-ptn5150.c
+++ b/drivers/extcon/extcon-ptn5150.c
@@ -256,7 +256,7 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
 	struct device_node *np = i2c->dev.of_node;
-	struct fwnode_handle *connector;
+	struct fwnode_handle *connector __free(fwnode_handle) = NULL;
 	struct ptn5150_info *info;
 	int ret;
 
diff --git a/drivers/extcon/extcon-rtk-type-c.c b/drivers/extcon/extcon-rtk-type-c.c
index 82b60b927..4b1fc084f 100644
--- a/drivers/extcon/extcon-rtk-type-c.c
+++ b/drivers/extcon/extcon-rtk-type-c.c
@@ -1236,20 +1236,20 @@ static int extcon_rtk_type_c_init(struct type_c_data *type_c)
 	schedule_delayed_work(&type_c->delayed_work, msecs_to_jiffies(0));
 
 	if (!type_c->port) {
+		struct fwnode_handle *fwnode __free(fwnode_handle) =
+			device_get_named_child_node(dev, "connector");
 		struct typec_capability typec_cap = { };
-		struct fwnode_handle *fwnode;
 		const char *buf;
 		int ret;
 
+		if (!fwnode)
+			return -EINVAL;
+
 		typec_cap.revision = USB_TYPEC_REV_1_0;
 		typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
 		typec_cap.driver_data = type_c;
 		typec_cap.ops = &type_c_port_ops;
 
-		fwnode = device_get_named_child_node(dev, "connector");
-		if (!fwnode)
-			return -EINVAL;
-
 		ret = fwnode_property_read_string(fwnode, "power-role", &buf);
 		if (ret) {
 			dev_err(dev, "power-role not found: %d\n", ret);
-- 
2.56.0
