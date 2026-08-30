Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3554E2E8B67
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788080025; cv=none; b=BfWI/a3QcAmQpngJZS1KMN2mXgq7XK0fmUxgOUdHOonASxceS7zpemhH7Za1TE00fPTaKC5k500VDcsXQi5GyRatE6fsfhq0qcnk8jkq8MFGmTaeWKqx74GzA7vijDbRQMB4Xqux1nnD+ikmBUwoP0pRmD9flePzPeZuUoHV0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788080025; c=relaxed/simple;
	bh=0QLvelCtKRHvSG/o9eUNBmUP9qh+Ju/deNVjrNnksbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CbOdDASu3vlJY2fzusuaAxktW/3WSD4bbAeWoehBZB/ol6Qcq1XdLwzdokbjIepKJN97WazFPrHPoTzil/w6mv+Nm+rK493JnVsyVur/5/sohKrFhMO6eOI7/XsQpzURFQNpjNfayH3OKZk9fHXxNXY1wKUZ3/JofoicV801Qr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPh3D8LH; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPh3D8LH"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15e2dab83eso424133666b.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 01:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788080022; x=1788684822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Xieco16JUGBtqYPcvPXgwiOrcIgYov6XOPWEyUzzGU=;
        b=QPh3D8LHjvo+uqJbWBQ90Owf3QLC0w2b2hgAzSJlhXcChXaaF2P1DdFjRbgZyi8NnG
         woHPY1nziurtqF6r5I+KJ0tK/D7YYzgfhPCxlstNN2t3c1V37cL4UuMVMeGxl9IMRRbI
         3VK3Ju1BAE78jKjIpHrvdpMKXJW1wnDjqn/x6R5Lm5Yp/7YSG7Ukt+8orWZwPJ59iahg
         B1B9X9GGGG87VB021hwhw8zUaX7bcv6kD9o5M/Sb9hfFjAQlhndjHhkIKnENz/KI5yGO
         yKULBJZale9g+HNvwiASvO6mJ47+k0dhJCDdYrdbfxikX2mraq2yualY0PH/wmhDiEkF
         Hljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788080022; x=1788684822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Xieco16JUGBtqYPcvPXgwiOrcIgYov6XOPWEyUzzGU=;
        b=NitwZeEy5MQxb/lkoY+PzybProk//cgeBZKIWEhXZ/UNsKtuGqyINmENvJ/NPqui+m
         sgm7YSlHsTvqf7wz9I4PGUBm11dXsUuMHYgbdi2AW5BoJuM7wmodFNfzsERdOx338k/O
         7OUrw4NWKrgYMfd7vjNtEJNNR0yOD1bLAJKimtqmFloa3zwgrSZZM1bMkh7700l+6Ed8
         oyKG/ufxQqw+ngPuGYDk+ZEY4pA2EEv1PsSOOxUhLO9RdHyGk9jSL1HrDrbCa0JBq76Q
         bDpDNwV5mCfNxI4wAdd5RSXTtlf8GRDDogts7PfcBb33DgtQSZAEhulRv3K/UZM8etcs
         QWcg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+bq2enJkCDbLHCh9lCKXhcBOCYePAVyMb4DMLs6hb9V/V0Oliz1aYKkFd3wpiD/ZdsR3eC0DUG6m26nA=@vger.kernel.org
X-Gm-Message-State: AFuF++n48g3unPLwfbfdxGY2dDLP0yDSR8VzZazOL3jR02t2/tKgUsAF
	/Q/zc3YJdtLZAClykhhWpevIxd+v/+pmOjXx0zajv0zwK7UwO17Xzak3
X-Gm-Gg: AR+sD10VCtjGpmVE6Zhk55b9CElrJyojYfbDFViV+D57CEh9Mgk8/ACaLGdTM7jg6ms
	d7DiZ+RW5O/ivUvG7cok5gZoIre/gjVezZVBApfZA95FEjyzsyBFtqPGnB2ozURcvMa7I3HXtVQ
	rzqUvrx2wiJF7WLwO+f76GUcmyk02HPYigJJB1jde7swumsPeqnq2WU7ZKJnrVWu6wMQVeFf/0X
	fORHQFdDwg6vS/CAr9+SWq64UY/q/LYygKRmqPkBKrW4HT6HbLPk6lsnA0Mm8yPszjusD1iq+6Y
	UqmVJhAFUNMJr1EW4o93ySmVYVYQDYmtCwAfft7abEq8DoFAz4BCQtXCjjQyZSJcA5z22Q1nzeV
	KUV7cCtJqcSVZDMFyrf1lc1LwpJA9FCyBsOMFEuWh/9gkJvZkTLkMf/CkBG8N6I+YI341Z9UPZp
	hczRi0lojZoBXQ7ttf8fi8NSEtztOoPLVtl0gOFr9CD7bPktoYBhhJyL+l1td5BOkEqGhVJ1hsZ
	BrjAPI6lbFJV771GNn9uTJVkdhD
X-Received: by 2002:a17:906:730e:b0:c25:254:292e with SMTP id a640c23a62f3a-c25567a9274mr1216183466b.0.1788080021897;
        Sun, 30 Aug 2026 01:53:41 -0700 (PDT)
Received: from localhost (83-131-188-112.adsl.net.t-com.hr. [83.131.188.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1febf3sm274995866b.52.2026.08.30.01.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 01:53:41 -0700 (PDT)
From: Dmitry Sinyavin <sinyavin@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Dmitry Sinyavin <sinyavin@gmail.com>,
	Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] serial: msm: select PM_OPP
Date: Sun, 30 Aug 2026 10:53:40 +0200
Message-ID: <20260830085340.2542624-1-sinyavin@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 173ebdedcd84 ("serial: msm: Use OPP table for DVFS support")
made the MSM serial driver unconditionally configure the core clock
through the OPP framework during probe.

When CONFIG_PM_OPP is disabled, devm_pm_opp_set_clkname() is a stub that
returns -EOPNOTSUPP, so every MSM serial port fails to probe. Select
PM_OPP to keep minimal configurations functional.

Fixes: 173ebdedcd84 ("serial: msm: Use OPP table for DVFS support")
Signed-off-by: Dmitry Sinyavin <sinyavin@gmail.com>
---
Tested with an ARM multi_v7_defconfig after forcing SERIAL_MSM=y and
PM_OPP=n. olddefconfig selected PM_OPP=y, and msm_serial.o built with
Clang and W=1.

 drivers/tty/serial/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index cf7dba473b20..bf680d22199b 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -904,6 +904,7 @@ config SERIAL_JSM
 config SERIAL_MSM
 	tristate "MSM on-chip serial port support"
 	depends on ARCH_QCOM || COMPILE_TEST
+	select PM_OPP
 	select SERIAL_CORE
 
 config SERIAL_MSM_CONSOLE

base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
-- 
2.53.0
