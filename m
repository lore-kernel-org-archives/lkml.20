Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955720;
	b=iL9FtDXJFTuycCWQa5CKp8WfhJ2a85jHuMjwLzQPpN92xrY5Pd8tdizUscdYvyHpJd2Y
	 F4tubN1DA5dewKvlBjQvaffyjadLKoT8irwx5tneFxqbKMnLBRAXm8F2NUK5/iKlWSUVg
	 noO8rjNe3/mpeEZsJcqQ02UvG8kwJ82eczBje1V5/+0AU9tAWa1ooHcle0aadjyge/ndM
	 G3/HbWXZD/n6ahOm2KnDlPvBxhCAwhPWbezq+8EGb6KGBynHBHzNtmFcLVRTTIIM8es/+
	 BdPiqq7C1/wRJKVgBff+Q+mntDi3JVAHHtaImz1Rd86Jq72CocIrmKfUyhIZXbA77fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZNcBLqWAyNJp/9Ob/qdifA0LjCwb6pxRLzUpAFt2R8M=;
	b=QlTZMzs8lqKLAtOZnhQXT6T7Liagp3GupbDs2fddsl5fYZ7DG/GfDH1xhNyBxT9c6dA9
	 XfoavVz9AsfiFV4Ft9eAQyxHzMAWV5g7nF77RtylJEu9za6b1cuSR00qrMDyHvxxC5EZt
	 1lCZrbY+om5bXkiY8WAeHk7v7rw+LidzzvCM6A2W+iTt9MOVE+dBl1OZQ+qyVSY6k+vO+
	 el3rXJMZ77ki2/59EGgX71anjsT5C0QWfnqm60YyoN66q1j5MEwOLWIQHoTwG8pK3QQ07
	 WXNhKBaYIDhw0UVJYp05lUmPKLSfSM92ibsZ+eoSz3xUEyjkJgfOGop2J+F51WmSXcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N8pkrUGe;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7A2606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B7A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N8pkrUGe
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso239037e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955718; x=1793560518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZNcBLqWAyNJp/9Ob/qdifA0LjCwb6pxRLzUpAFt2R8M=;
        b=N8pkrUGeiYT1k6wkM0LXvk4AZeGpUoGdqHa1tEHKmz3I4f9HVTKjxpXzABIy7d4GKH
         84yIdL0EjaYBfs77J72pVKB67AJZA6co2SkII8zjgkdDOU1+EmsCJlu9goMqzSEiXW1T
         kMTgND8A7f+LkkcRIFuTbapGjkj8D7Z2dl8w1A6+F8kwacoBVdMg7gcClyDxfDg/F3vK
         2/HwaRK5dApqNop9RjeCrWLy+MJ1dTyoJTsW2ZtSmYF+UvZMFVmbql9P90OZ/x5WbKX9
         RINxIm2Bca1geYUTpJEGVTY5IqxipKrBYJmnlerWKWDrossJ29skAlc5uPJrNDjuulXo
         55/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955718; x=1793560518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZNcBLqWAyNJp/9Ob/qdifA0LjCwb6pxRLzUpAFt2R8M=;
        b=EwWujBeQAB0NajgeBLRmIpXj2Sv0MzPV3XJ33Exu3lAfxOaSI1aakB3CHTGP8pZyMK
         BHP3MijNYIY5uAg9E++5cmOjPFxdVj2aNnGtAO/D3G5rGo+SYXt/mefnwSfxrf0k90tU
         0p2MrOPm4MjR9aJ7AELIYKw/HRDo8motKckj4/w3iPIbPOEwpqw9Qrb9FX8UjPXnJrj3
         iejVl90sT7lHo2zyUgKvODLD0b+lVPffx4yisKLV9haZUfi8TfUsHA40ALmVF+2Vd9b7
         AUnKhFUjLlpW708JrEwu+dZVsoJoHEtaiZAVwAmTBSlxwZQnOAy6XMf2PcjtkEJiKQ5i
         dnHw==
X-Forwarded-Encrypted: i=1; AKwUvByRxTYKZ5xmQd5GkOt7r/85LynJluPqJKFfmccHdSFguYqkCuo/nmEnbefVk89suoNukpq5XBtA3tUud3A=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/GQcW3YLCzSdXbynG4YXPbRTwfDHv20Qa/l3ItT26XjRsMop1
	dspRSWjngPuWt9OCK0yjUaJvz1dlFfiilNcXrUSyVXhm0yxPRNg3/lSU
X-Gm-Gg: AYBFou1ZT58ckrpqqOYY9b/cLuR7zdceeT2n7a/AAYqT/hs+OXbhD9WTTV+FteoKt1S
	O8p8f8OMu4h0tIK4l5DSTEBP/4TuXT49AbDHDlN4itpG9EBKdWp3fON8kOy58RCanSMM1eefFK9
	cm0Xou1hyUeY34SIFZaLvu4NKoN8ccwS0sgcZl3vBXmFCt9DUIPh9gS8g9/8zoJ2hknLamfmsmr
	uFPUiAykEMOqO2MCQ0klphdmEMxKFe0Xvasvj7ddy7r6RAWL06m6n8t8+caq+rwnSMwbWi/sir8
	X4FvUJpszVJ0/tZU4XZ3XE7J51N5+93uR21fKCchN8mtY+WFfR4dDFm/lcxGcAo4A5J3tbU00pe
	oiJiLByn3yfv1FE8qzzOZGyebDOe81c3ZZn7N0pmbL6odMCXJkyGM+oWDe+IgcMV6oII+bh5wBT
	NjBJOwo6KtEf0DD0cqQd5hhvqVfz9Z5Is4308BdCiQ5rgY9nidxE1XgCqC7WQA9hcHuAKwsHaYR
	8huQTcR6C0Nt7MEWf0kA3rycNRbWX1rdBrBBQOJs/dKOBdEzRIiP6pUSSOcS6gQF6TD0GUjUiUP
	z3vrCFyuYKxKRCnfPDNkulJhVgxlzgbpGsJ6ex1AyJ1TAcYsfCAaQeFKS6Z2njjV/Qfd7DrK+qx
	JwO1N1R4=
X-Received: by 2002:a05:6512:3e04:b0:5bf:a467:32ab with SMTP id 2adb3069b0e04-5bfb71d1366mr1553389e87.29.1792955717490;
        Sun, 25 Oct 2026 12:15:17 -0700 (PDT)
Received: from yantra.. (nekmmqusumz5xuyc5yb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:b52c:35a:762:9323])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a75a79sm1147287e87.39.2026.10.25.12.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:15:17 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v3] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Sun, 25 Oct 2026 21:15:10 +0200
Message-ID: <20261025191510.22261-1-zoone.rupert@gmail.com>
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

Since commit 5b63d0ae94cc ("compiler-context-analysis: Remove Sparse
support"), __acquires() and __releases() only feed context analysis.
Their argument is parsed before the function body, where only dev is in
scope, so with analysis enabled for this file the build fails:

  error: use of undeclared identifier 'adc'

These helpers take and drop the lock for the ADC_TM driver, which only
sees their declarations in the header. Naming the lock there would
mean exposing struct adc5_chip, and with no annotation at all the
analysis flags the unbalanced locking. Mark both __context_unsafe().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

v3: drop Fixes tag (Jonathan), trailer cleanup (Andy)
v2: __context_unsafe() explained in commit message (Andy)
    https://lore.kernel.org/linux-iio/20261021052435.112686-1-zoone.rupert@gmail.com/
v1: https://lore.kernel.org/linux-iio/20261003214516.128573-1-zoone.rupert@gmail.com/

Found by building with CONTEXT_ANALYSIS_qcom-spmi-adc5-gen3.o=y, which the
driver does not set today. Enabling it comes later, with the IIO core
annotations. Build tested only, no hardware here. Patch and commit
message drafted with an LLM coding assistant.

 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index c68c6c5f6aca..6a3cabedf4e8 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -663,7 +663,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 }
 
 void adc5_gen3_mutex_lock(struct device *dev)
-	__acquires(&adc->lock)
+	__context_unsafe(/* returns with adc->lock held */)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);
@@ -673,7 +673,7 @@ void adc5_gen3_mutex_lock(struct device *dev)
 EXPORT_SYMBOL_NS_GPL(adc5_gen3_mutex_lock, "QCOM_SPMI_ADC5_GEN3");
 
 void adc5_gen3_mutex_unlock(struct device *dev)
-	__releases(&adc->lock)
+	__context_unsafe(/* releases adc->lock */)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);

base-commit: c9dbe2a47f635465c9985b7af74d2ae310e98125
-- 
2.43.0

