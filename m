Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830831;
	b=bjsVY/a7i4UdwPt8YvP+NEvTg3Z4BW2TwZSj7NtsEQOfTbjOevCozSXgJlnCk4tBj0pR
	 YEFXok9OHYdxTxxDkU+JDWnjUozp0GNb18tyNvfwouwOQV6VKvXPZ5+FFoj4nWQyrnJn3
	 pV+Zn2sSzsk7i4Wj1jrMkykG29wX+aDaUlmkt/tPJZKkKe+Pil+pagixAAN6kt+VbAums
	 Uc9K7VItfhqqMXLfz19blsYudXVl8SWRYFXbpP9uRyw4HBfLt/e4CJ3x+YhmOHofQefoK
	 aysmnI2+g4f0xRulZl/a17lnBHDwGgT82bKzUpKYuOdHRbcmFzg/gQVv6fad0RbeXDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l4qL3Nr489Ax8dG/w5h0GcdBFAkKeAr2j0Ix9Ut6gVs=;
	b=dgmbclf5w16RuFJgefDa0VYmpnDpAHDvxEIIVv4wT2Btdxm00Slls8GPKlO3kUNyP1Ii
	 eLDeNzgTNrSYeBAY2pygo8sskcvuTW5/nUafJpvYs+pfXoQRHA5VY1B/yJ1Om3rQFnikP
	 ZOFY6a7kQZfH4NsuL3WPw9x1HdwQIjTQhK/4JwTVZVCChzBniQb+X+zOuLlnl7XLZ2zb8
	 c94xjEVoii4f1NawyJrSU51lM7/XFrB+brulKtRI6q5JQHqqboICQLyWyH0zBDN+0H0oV
	 LMiotMQDfrQCizk010nIe5iBRjs3Xr8Ct0D5pDnr9BqEpxTbDeaOWMxeQaBz+bfUeAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yVVOOfOX;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F85606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F85606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yVVOOfOX
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae58d17cd9so2372735c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830830; x=1795435630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4qL3Nr489Ax8dG/w5h0GcdBFAkKeAr2j0Ix9Ut6gVs=;
        b=yVVOOfOXn6/6KBO6iQk+6xV7teurn/1736Z6hWOzJOQG+SNL7XFOjV9r1tH5dV5q1P
         8oJjDbzC/HNxnhyQIAGm7NyvYW+dn9Pmk5SJsHx6yDE0k9t5yuLN2GXWBQPyWVMwG07m
         sSCjjbfEu6djukqxBsnwE6oX20IRdQTZ6AxZaSNNDFq12s3ujmjnZNV12iHlTleoMcsY
         8HBz9IopT9VXAO01oEDTH6I8fWss1axdfPX0wtfo5jDO85sgIjGhGUpDeXP3JWmRr8LW
         0SN6Q4TKrx23p4FyLvBeizPTzwNYuC/DoLR+5+8u6KNhIkoiBzBLXgKYCLrdXmjXX3g+
         Ya4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830830; x=1795435630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4qL3Nr489Ax8dG/w5h0GcdBFAkKeAr2j0Ix9Ut6gVs=;
        b=0nn8itq85nZdCFp9FI3GMQoy5ZdtmSxGFCC/xMvBjSG2v+XRaaLhqwQpJi+wUtpK5f
         3+SZvdC/BOUONPZ/MYfJfG2O3Tatiti+rXvWmIu+stgDtP0DKRh58EuRXjr6FnGdtj2y
         ko0Pbm9E+FgVFfFgI9zE0/PfT9NfHfdjDkVBBDmuA2Z/GdZqSPBRJuCJg3bq41knuHiJ
         mZEXqxcZq6dHQgp4g70ElDSecaP1RTm9CV93oS/YtqV6hBEOO3wtOgs3wkkT1o3QoWeP
         7v6FaghCkYdOzpeuU9qn5x2HrQ9cB1Oeol1NluOuWX8mmEA0mV4E58Nc0uPuYp8JTr+u
         ufUA==
X-Forwarded-Encrypted: i=1; AL+hErG0m8ZBSYQPzrCQDdn9HldOxJQP4TtdsXt6wEvk1NgluRCmc2T3Qrbb9Liw4OZGv8+7MTc/SZcMaEM0otY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/Wto+7Po9rjMs6Y++cEpr047LW5RXE2RwK4XK/xS7GBTSFozS
	nvveAD3qwQQ2DQ1mZj7Bmb7k2ajwR42JhByiXI8QOR9bOdKtyd9mfCDa
X-Gm-Gg: AYBFou0GUN9IRNmyulxi4ityMV93xFPu9kwVN2n5HB0tqImy9r2N07BU4XnptqZVOXT
	Rc2FnEeGHXJLEmwC8ZEy/DoLTwl4LQExe0/tQxGeGTJs8YeCsl8IF3KyAgHq9uOAhHysn8acppI
	kCK6VaDT0Og85KSjwMcP39B7SPqKxnv+Wtywm1Q0UOLle2dSepiV5PszWFy5vHlXS1FAed7CmFB
	bHRQxneyhODwn8hNslYesqGsCqSus2pK96MOi3rVwBEj06t+Io2YW2O6aP+W89aHzHV4YSe57JQ
	lDghZ3P6dQDhoC1ffRmUj4sE6Vg5EVmd9fpXGH7dAwyhj18Mu7CQHg9/ZELlwM0L0bZwMdPTj3C
	n6D4y5l+QJtrLBSx7X3jS1E3Fp+tyRJ0soqVdgeBKU9y8LosWwnXbbseci7DjHvWnGqLtfdG9KT
	HJ6COH7cuylBOqZ7n1IklZzsqik6uKQ9bqG3utDpw7ENsqi4chelu3SXCd9wNHf/S1QiLAEqy2G
	SVEM6bWOhDTxI74eca4UiTm9foYf+UNfIsw1R7WlJEi010nR+N56C0QP2WO9WfNLYwSLYzFYN5u
	61v1U4rZgiN1YgJkHpVpLamp23Q8YnRClhH5jYDt2bpHwAYfWuKy0rY6q+k1GIgYOesorUgxOps
	=
X-Received: by 2002:a05:701b:2402:b0:1ab:faad:cba with SMTP id a92af1059eb24-1b5030eb09amr8706030c88.34.1794830830054;
        Mon, 16 Nov 2026 04:07:10 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm32146157c88.11.2026.11.16.04.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:07:09 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH 1/3] media: atomisp: Remove unused any_virq_signal()
Date: Mon, 16 Nov 2026 12:06:56 +0000
Message-ID: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
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

any_virq_signal() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c      | 8 --------
 .../atomisp/pci/hive_isp_css_include/host/irq_public.h    | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index 61dea3863..f1b01f5f9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -215,14 +215,6 @@ void irq_raise(
 	return;
 }
 
-bool any_virq_signal(void)
-{
-	unsigned int irq_status = irq_reg_load(IRQ0_ID,
-					       _HRT_IRQ_CONTROLLER_STATUS_REG_IDX);
-
-	return (irq_status != 0);
-}
-
 void cnd_virq_enable_channel(
     const enum virq_id				irq_ID,
     const bool					en)
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
index 901e10f87..d7ff06219 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
@@ -107,7 +107,6 @@ void irq_raise(
 
  \return any(VIRQ.channel[irq_ID] != 0)
  */
-bool any_virq_signal(void);
 
 /*! Enable an IRQ channel of the virtual super IRQ
 
-- 
2.43.0

