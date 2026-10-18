Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F1B4314AC
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792338868; cv=none; b=prgRtyQWZqKF9ZCcNidwptjWB3YUxfgiu6LBPNZ2UiJWyJXJadB8H7Sw+r9x7Ll952QIHxQWdsFs0SJsHI0UnAqjimQ00WboVHZxYWidjUgerkOz7AM0WGbMHA/C4450vI7mkI2TXrl91hQhFZ2o7gk4WZDSwHsy6J2wj2fLO4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792338868; c=relaxed/simple;
	bh=Npwl5Y4BXmuE1JUaZbnqNFF0MT50x/Td5idKQKTMGV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G2cHHx6Qvb/XU6PxZQpiEvqX+5p4uI3kzvpoFAp/2VO5Y8zY0iQ0q2VCaTa7r7hVuE5GgDg8o0adK7a/UP1/V1aELNZjsYfQQA94qX9cqU+pkIYVN87nQmfAfRv/ICijI6AolgAl2B/fhLZpvt+sJMCVWLK+TypG9ql5jb/k4Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJzQuluI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJzQuluI"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df54150dfso920372f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792338865; x=1792943665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0f6IrbN8Z9V/G/koB8npxGiR7EDYYZa+mjR6E8dRjX8=;
        b=aJzQuluI+7mGAvh2MNDqVnSBpZRAboWk1jLYuZVyIC5MtU1rtJEqxWrLnln0xHyg0V
         nzdCl1kJc6ENvjVNu+r0ru84BbGBEtulEnzVV7pIsNkxkNTLYLDHgmn/adTM8Wxci4bQ
         aXmRxPZCcs2BkKbNk9iMnJYcHNiVr2E8+oi8RFvs7PoMSiVd+G1JzhV71SpfKv2KHOiA
         rqZvBFeNaHWwlzuJ5/a094I9Y26kiCJJNE4/NJQ5yaNWFgnf/tf5fG1p02AehRH2A9ec
         232kJLLDiZeBE1/RPYwvwroYa9Hn0mPAFpGLbIQ8LqCuR364qIJdZKc/MhG5QFgwNPmw
         3Qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792338865; x=1792943665;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0f6IrbN8Z9V/G/koB8npxGiR7EDYYZa+mjR6E8dRjX8=;
        b=P6Yx0ohSIyVlZpuKOKzVRZh07BYOnkIjeRcZpyrssPV34h+w+KtzKneJh2rwEgiLUq
         eEHICrxfSkJ7H9U2agI5QQYJ7A1bOKZJZ2zzdwUZYcE5vZVPCB9nmoShN7cewOVse22J
         tsvIM7YgurTeiohKQdZBpxBO4EWnI5x5etEnKkMCVYUdghLpkwTNqc/qM5IdZVXpBSWD
         UJ28gaz4pM7n1ebVwoT1LLNf4XqX+cCRsvIz/rqbmck1OfDplwi5TPXmg9coaINahmYy
         pWs0ipjS04k8Deb3/HHBNjai4Q4flH5LMeDH4mps/VdW+kf66wCQsBtoZqvZXmh7b24K
         R2rw==
X-Forwarded-Encrypted: i=1; AKwUvBxfSf0dWryTtgWFHG1rFj/7qVoI0YRt69umSp6SadfiWeN0mb1F7bvekgCtLf6YVzm6n0OUFYaQvtl1Q1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCGs1ct8bNWB+g7MkwaTX0k7B0/ZhetKHIRO6uTshwYwn7FlZf
	aGC9L4Z6exP9JlcKgZSnmc5ljkOi39vjilaoLZbG0MdBNSjtGqVnwLZ0
X-Gm-Gg: AYBFou3gQwl4qpkUhDcj+7WZQUAWh2MwhH6G8DEvWlHIvIqHwuHUSQevT9j3YT9BZOt
	dHBsS3JpS86VmYNaiLaQvjY0kxqziR266cy1w5DkqePCFUypcu2koCfAdpgy27q4Ky5mWPNgQfs
	8iuzhXKGldw3XLQw8YR6Jo7cbNxqV1TX+M1Z8ZBGKAr5PHV31OIP/FmapU1rY3n/wTKLHCpjcuv
	K51n52X+d3Wx9cFjwCL2StURxfNbTUyymtrbglqBG4sBhRMHd9TwiTy19S1krYvjp4lYeAf6PVs
	aMgGim/SR7NScbOih9t/k5rClhRIWNkv8spt/fGZQ7YcAyCzZe43HqF0P8eoqGu6jVlGhornYth
	KRLiNQrOXbc7DImNjvK7JYIPCeZYwXT+Mb+xvt6Zxdu1GxRh4vqfOhEngdnYzI2IouawJYBJMj8
	7A/GK2ii/CmdMrJ8aH5GLi2MMmSwaN9wTArinDvtfi/G1pzwDUKpRs1HfGXzpMxcQk1QhKNlT2D
	/RXgag3dUO8cudxLOtmgMo77xleAZOmXnqhIM9rzFRhlB+/y9zcJnnPQ2Em9BdU8nz+VHb4siWi
	0y2m/rTyPB8=
X-Received: by 2002:a05:600c:620d:b0:4a1:946c:953d with SMTP id 5b1f17b1804b1-4a1d76254eemr133559565e9.27.1792338865269;
        Sun, 18 Oct 2026 08:54:25 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm118044645e9.5.2026.10.18.08.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:54:25 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: icc-bwmon: drop the bandwidth vote across system suspend
Date: Sun, 18 Oct 2026 15:54:24 +0000
Message-ID: <20261018155424.1299645-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

icc-bwmon has no PM ops: the interconnect vote derived from the last
sample stays in place while the system is suspended. On X1E80100 the CPU
bwmon was left voting 800 MB/s peak on the DDR path during s2idle, which
keeps DDR out of its low power modes (the qcom_stats "ddr" counter never
advances).

Disable the monitor, drop the OPP vote on suspend and restart monitoring
on resume. With this change DDR reaches its low power mode for >99% of
s2idle on a Microsoft Surface Pro 11 (X1E80100).

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Ramón Jesús Miranda <ramonjesusmiranda@gmail.com>
---
diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -815,6 +815,35 @@
 	free_irq(bwmon->irq, bwmon);
 }
 
+/*
+ * The bandwidth vote of the last sample stays in place across system
+ * suspend and keeps DDR out of its low power modes. Drop it while
+ * suspended and restart monitoring on resume.
+ */
+static int bwmon_suspend(struct device *dev)
+{
+	struct icc_bwmon *bwmon = dev_get_drvdata(dev);
+
+	disable_irq(bwmon->irq);
+	bwmon_disable(bwmon);
+	dev_pm_opp_set_opp(dev, NULL);
+	bwmon->current_kbps = 0;
+
+	return 0;
+}
+
+static int bwmon_resume(struct device *dev)
+{
+	struct icc_bwmon *bwmon = dev_get_drvdata(dev);
+
+	bwmon_start(bwmon);
+	enable_irq(bwmon->irq);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(bwmon_pm_ops, bwmon_suspend, bwmon_resume);
+
 static const struct icc_bwmon_data msm8998_bwmon_data = {
 	.sample_ms = 4,
 	.count_unit_kb = 1024,
@@ -879,6 +907,7 @@
 	.driver = {
 		.name = "qcom-bwmon",
 		.of_match_table = bwmon_of_match,
+		.pm = pm_sleep_ptr(&bwmon_pm_ops),
 	},
 };
 module_platform_driver(bwmon_driver);
