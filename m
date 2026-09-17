Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1A24A7CBF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686568; cv=none; b=U5QxjSLWCwOH1yvBvPS8APaHLQ5E/31xoKLDFm/WH0DMFeszgM/H6sL7tlxgiM2dyEUk3ST6JBHIuwLAl121YyXQTrAqsNTKvT7kHB5rMRM8fsISt5u3hjRGGIz0VDFYIIUMMy0bnE2TwQeE50OUpYRAqiaf3f+R+e+u9oyIAzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686568; c=relaxed/simple;
	bh=bzi3qTltra6aIkH/Jy2yzrbQPmxGzlr79foFYbz7a8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dak4kelVhQPPnU85e8+IF7Qo8THVtAIKySIQXDbdbz7p/Pp6MipwuNfGlH6tpniv/rinRn0kvUeXKrD7ykT6SOVdBlLbLep3QxmKrRjUjSVjXosnS6ljmzZVf+r24K7cWEEinpB5zer52HkZSBmLFPy9y1KQhl6Tdux+eYK9PaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCDpPbhK; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCDpPbhK"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eefae4so240455ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789686558; x=1790291358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1U17Jog9ZY7djCaBaNRYmrySX0Lr3PE+x+SDEArIf+0=;
        b=KCDpPbhK2r/5qiHBZbPIar2PE7x77ZTdvl3oBru9tlh5ocTudJ4IbXksE29I4QQKW3
         YTkQkb/83bOSkjyRoqZHpxrex4vdzhnXY1c77CIRzIYgEZcKh3WRssocebvMCaVvinur
         lz8LQCmTL/kTkX7SLcW2PdISkNcnBe8fZcUC1NTwaHrBUThzz5s7EMejGgu0fb52o+Ew
         IItA8vd7om26zKylXE7LUt94dffbIDbwFnVqNZK0aSnZQfHakyFBvc+COVqoO7AQLEGB
         gsDhncBRtBkW6IpTGV7bJ8+TXJMzjx5taRtEqw5FmaWJE+ijKTU0pcc73t6mcPjZnd5U
         TNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789686558; x=1790291358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1U17Jog9ZY7djCaBaNRYmrySX0Lr3PE+x+SDEArIf+0=;
        b=WB8e3/BciYGiJ6dL0PrhUVEFklKfXABf1X6FtZHcqvLtRI6gYh0Db6Nqdw9WViUoTj
         DAJlI0XRvm6c5izntDAm3CGW/99DgImQbEczZ7dX0T9P00/kU5HRHNFcRHRFBUHd52z1
         lxt7eednKwJZj9gulZ2LoYW0j22aNnT4QrRVqIfzWZJeyFwdjnVa4ms9zy56TuDP0wUX
         VI1lI1Qfl1MR8WrPhrr4Ox6R3LRfXGIzyBrryRlZMz8He5SRN51IDWN68fNRn7T9FweN
         6TrBKjLdqWZFCquC4XMfufpfbb5u3Wzj6mi9hSkKZp70iHzfmNZXfThqzwhyn+YEme//
         xa7g==
X-Forwarded-Encrypted: i=1; AKwUvBy1KrCMYSJuse0aafV1SNj/WOK21bYTFjn1Pla5fvO2cxJ5hvxtR6P3DJlsji5MFCrMrrbzUn0L5kECwwg=@vger.kernel.org
X-Gm-Message-State: AFuF++nzj24S+nvTiAmIB+MKJ2HsKWvmG5tCmNQQd4/veTeoHVMEQl/E
	ucrA4oTqh86yT19t9nZ57BNVxMLQ/iuHeHJ/5qv9BkUVClU8inzXeXT9
X-Gm-Gg: AYBFou1vdB++eEhwgpT9mxZ+J/zZFALQoms/rwJJ6Rd5iOF7N8LpeZWwjJegRAw//DK
	rmgYjYhy2i+IA8kPrdilhDNci18H7nj1LqvjATd7R4V0P7PV1sNBG9IpOYAm4Ia7e/gx807defb
	Z5C8wKvIqStVXdDQu+j6joe7vB/+2ajTzISMrI82biMDQFXJ6PYmXK3FnrcgLxkYgsqQMpBOJGu
	amb4NggnWjrANknDD5XQzUdUqwgIlQVd6Xzpi5obuz+FM8wkK4Fok/xf41rUlCpq3HeNXxLjTrS
	D+my50WaV+YRGPKijIvm2SNGnoieM5/pr6arxaVrZKS4vkoQoH/9mG1OQLW7q01Y89uUuctH9Vh
	rLMD6AiA/gryqyv0Yp6JPmnSB3OvyvLa2O4TZ8muEtPr7xhRysGUrWaC55Q6HOESvSMdvZgi13P
	luU5oQcgMxbdyrDV7GDCJ1fj207qr7QL3Ndarm6DnuXiexo7bx1/B9p9kxNq9LOnp0s9oK/bwWn
	nUnBLu36yv6LpJSE+BtL/OWCDlhaWMAK3chbw4T2Ma8AdB0K+ZLj9eDH3kTTMIX1vtCq733K/7y
	PWRCtkML+80vEcvhbS5M9FJ4PTvmWGza6SCDBN/akTdDhsdf
X-Received: by 2002:a17:90b:3b8d:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-39e554cb74emr572733a91.6.1789686558386;
        Thu, 17 Sep 2026 16:09:18 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e36116920sm7294763a91.5.2026.09.17.16.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:09:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-rt-devel@lists.linux.dev (open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT)
Subject: [PATCHv2] gpio: mvebu: use raw spinlock for MMIO regmaps
Date: Thu, 17 Sep 2026 16:09:16 -0700
Message-ID: <20260917230916.118382-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mask/unmask handlers run with the generic irqchip's raw spinlock
held and call regmap_read()/regmap_write() on the GPIO regmaps. By
default regmap protects itself with a plain spinlock, which becomes a
sleeping rt_mutex on CONFIG_PREEMPT_RT; taking it while holding the raw
irqchip lock trips might_sleep(), and PROVE_RAW_LOCK_NESTING flags the
same nesting on non-RT builds.

Configure both GPIO regmaps with .use_raw_spinlock = true so the MMIO
accesses stay atomic in hardirq and raw-locked context.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 v2: remove inline comment
 drivers/gpio/gpio-mvebu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 267e6d5bacd0..92ce02441cc9 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -603,6 +603,7 @@ static const struct regmap_config mvebu_gpio_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
+	.use_raw_spinlock = true,
 };
 
 static const struct regmap_config mvebu_gpio_percpu_regmap_config = {
@@ -610,6 +611,7 @@ static const struct regmap_config mvebu_gpio_percpu_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
+	.use_raw_spinlock = true,
 };
 
 static const struct regmap_config mvebu_pwm_regmap_config = {
-- 
2.55.0

