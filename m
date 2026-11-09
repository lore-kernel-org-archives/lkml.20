Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201719;
	b=qOVbVo21MYMd3tqOBLiW1fbXLUjfOftrGuOOQAmki4CrBUxlpZAl8iQ/w7ainT5ngCEb
	 iQEKi/F4kCv23F0WYo+gPSwIagk38AIdJDnBqwF4KZ3rLtDXxa2WLNkLYFD90jVq44tQ7
	 if3oLVH8g5qYrL+hpz7wbNNrqVZlUrvn4Vq/LhTSq/Bnw0z48bXNZftkHXJkpHs3FLquQ
	 4PNqZDQap6ee4ElW2T+/1Wk0o3kUV520V5c5idYK6d/2ohHUxmqPJ1jnINUbq4SS7HJRo
	 2uJoAj95GYpvs+/SLO3OgDz5QyRnDs/h0GdUkuZjftqKN7xflqLUrNYdtxLRT+mbt8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fj5sb2gtvT3FWrqFiToHxiIHAqMkz8L6XNg5kh5KYJA=;
	b=Me+wxBohWALItWCnL7glNzV4ilXMoRh2/7CBYW8jtG9WYAUk7nNTQn7CNlrTkmQ/st32
	 I56q87EH8SrZNTrm4je9y4ua/d/hHYSFIfTPSIZJUH85N8d4HSFGdIUwSXzLBjs7E1G8p
	 eOpGHyVUOuI+F8Ytwh+wzl3i6Wu6TQljygJK0sq2IKH2FaKYH0qr77HNj00lkpfXGpiMw
	 iBGVw/VHD4Ae1yEdlkDIlgd8bRpNcP04zQDm6iUsrmhfDMpBp06WRkhoe4HCYmCuj+Y+6
	 0Akb5y2HU0huybJoje8YsaN8I6LjQaJ+8pvKLyt/lRnAuNOSg7W0DWR8oDBw71BudKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=quora.org;
	spf=pass smtp.mailfrom=quora.org;
	dkim=pass header.d=quora.org header.i=@quora.org header.a=rsa-sha256 header.s=google header.b="TUNZX8D/";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5F1606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC5F1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.a=rsa-sha256 header.s=google header.b=TUNZX8D/
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so893052eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1794201718; x=1794806518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fj5sb2gtvT3FWrqFiToHxiIHAqMkz8L6XNg5kh5KYJA=;
        b=TUNZX8D/h32n6wqaHOBBZQWY1dSDOrUoCh6pas82IAmw8UJtmqAgtTRIx40BSiDMUt
         6ujxVpD5gdeAAkrSQNQXUG2qjmoZHmLJp95rRCaZ9THvb04gvSnMPGpiLmDBW/hEr8Si
         ER3fSDmqIuPNB9zgAs6PRS1TRHZKJS07C5uz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201718; x=1794806518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fj5sb2gtvT3FWrqFiToHxiIHAqMkz8L6XNg5kh5KYJA=;
        b=11drD0+vamPn/fV2RbJqRNCLg7xCdqQ4cM5bLR680bQq6OP5EiHNRpMeZpd5VhjuiW
         aT/4/LedSMd9Yeo2psdic3r5xH/pfVTK3rcLsN2pYKzbp3f3K9NIKKszTQ9X5CS162HI
         zw2CgTaj2fL0x330kBjgHXLM/0ybOrW8AjXvGDQVgJmr/4kdhCI5u39XReS+cy7QsxnN
         0i8nhN0tvKIx1Fa24A3nr9PtLFw+mcVT0yMNGjD33PeJ0yDv5LQzTg834SAks9nfP3PS
         /loFAMHhJcZjunbhRL1CMen4c7eXATzOI1MavO02MeYItvzycMNxwq84CcZb+sAxGWpN
         Uf2A==
X-Forwarded-Encrypted: i=1; AL+hErEWxpuzIDjP703Aah5IPJv8r2Yt//Cz+ZZRz2qjOBbq9/sQmKW9IT2iyvqPK5bSaf/t9II/BxJq9XZFgTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xRURVwX3zK3QrVzyDsNe0zFfr/yK6h3mS3MeluUECN+Aoq3RR
	eJgggMEXmepz+nWra6zqLrmlC6w0rSPbQJh4IoIzbYxupiLmtOo74Y8B/GXKFI2j55c=
X-Gm-Gg: AYBFou0ZV/ETjmFse1iTIMF06Zen7KuQ5qQmKjA/TLo+G3Uyctdhjf++mGB4bdlbz6q
	ZaV3sIM2m8BcA1qgJbPZaQrqeI26/ky0ZyTPxDqV77ZQ9Y0B0xVvMcakzgGSq5I4NmeMne+b2nc
	4AQvv1oeN35ZZTv9Zkbu62shEWiAeE6JmVb9wRXOidMZqXlitlhKsmzQOIfGr70XEiVjjoAbAx3
	waTfElr0xDjs668VTGPSTYXK8x8pjnH6p5fk5NDe3JjJ9DkBQu7gKCM0+4W6y3kr08AnAM3o7dy
	co+VpG7SGhzR0/A+KK+rBfv2MSFPhBYFGOthq2zvfZZzguCIjsSIvYUeSYLfgt8yKqDfh4LaVgH
	ReUd791nHYU59c292EKATXFxx4x4T/Hx51YooW0wo7bVRTP+wilqQq1GTrRhyS9jjEjzJW35/UH
	PlXEddc0Oyyy284H4euKSxQb/ZmJ/PnSPA6Za0idgdWIVZYAM0otgQvri0HLzKBcVHOVtjOankb
	GpTCwiMtvTUrXeD7WXuGiQp9/BA7qbmU12Vo0fIthApgLsKb7+cLWSgBXpRY3XayqKj1P0Vwt9s
	yz0UymQm7dflRqki4lQL+GMBs7z1woYWp3+GdBo1zCeaJNAxNDN1keAmUwuBzsi98EHg86ZNqeY
	+yAYq8oARe3LUMnqjuEQSqn/WiOpYEtJfBMURIGpx8gBWsUpY4UaBEKcUPyoq++hm4FYEWJt4Uk
	iimEINAfqIwJ4uTPc3EUaswSjmBV2zd6OZX/+Wx0yhOQsnqQM7Uma23oEV6W1Ozkpv
X-Received: by 2002:a05:693c:6009:b0:36a:43d9:f2a5 with SMTP id 5a478bee46e88-372576c22c7mr5669312eec.32.1794201717818;
        Sun, 08 Nov 2026 21:21:57 -0800 (PST)
Received: from aegis ([216.247.15.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372669d2826sm10638817eec.29.2026.11.08.21.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:21:57 -0800 (PST)
From: Daniel J Blueman <daniel@quora.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] PM: clk: Fix false-positive recursive PM clock mutex locking
Date: Mon,  9 Nov 2026 13:10:05 +0800
Message-ID: <20261109051007.371843-1-daniel@quora.org>
X-Mailer: git-send-email 2.55.0
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

pm_clk_suspend() and pm_clk_resume() hold psd->clock_mutex across
clk_prepare() and clk_unprepare() for sleeping clocks, with every instance
sharing one lockdep class. If a PM clock is provided by a device that also
uses PM clocks, clk_prepare() resumes the provider, which takes its own
clock mutex, triggering a lockdep report.

This shows up on the Qualcomm X1 with the LPASS WSA/RX/TX macros and the
varargs macro providing the "fsgen" clock:

  WARNING: possible recursive locking detected
  ...
   pm_clk_resume
   va_macro_runtime_resume [snd_soc_lpass_va_macro]
   ...
   clk_prepare
   pm_clk_resume
   wsa_macro_runtime_resume [snd_soc_lpass_wsa_macro]

Lock ordering is always consumer -> provider, so this is false-positive,
resulting in lockdep being turned off.

Fix this by giving each pm_clk_create()/devm_pm_clk_create() call site its
own lock class.

Scenario analysis and patch development was assisted by Claude Opus 5.5
under my instruction; detection and validation was performed on my Lenovo
Slim 7x with a X1E80100.

Fixes: eb667d0fbdd3 ("ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM")
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/base/power/clock_ops.c | 23 ++++++++++++++++-------
 include/linux/pm_clock.h       | 19 +++++++++++++++++--
 2 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 3b8ba27802a8..94f2aa090ce1 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -398,17 +398,26 @@ void pm_clk_init(struct device *dev)
 EXPORT_SYMBOL_GPL(pm_clk_init);
 
 /**
- * pm_clk_create - Create and initialize a device's list of PM clocks.
+ * __pm_clk_create - Create and initialize a device's list of PM clocks.
  * @dev: Device to create and initialize the list of PM clocks for.
+ * @key: Lockdep class key for the clock mutex.
  *
  * Allocate a struct pm_subsys_data object, initialize its lock and clock_list
  * members and make the @dev's power.subsys_data field point to it.
  */
-int pm_clk_create(struct device *dev)
+int __pm_clk_create(struct device *dev, struct lock_class_key *key)
 {
-	return dev_pm_get_subsys_data(dev);
+	int ret;
+
+	ret = dev_pm_get_subsys_data(dev);
+	if (ret)
+		return ret;
+
+	lockdep_set_class_and_name(&dev_to_psd(dev)->clock_mutex, key,
+				   "&psd->clock_mutex");
+	return 0;
 }
-EXPORT_SYMBOL_GPL(pm_clk_create);
+EXPORT_SYMBOL_GPL(__pm_clk_create);
 
 /**
  * pm_clk_destroy - Destroy a device's list of power management clocks.
@@ -451,17 +460,17 @@ static void pm_clk_destroy_action(void *data)
 	pm_clk_destroy(data);
 }
 
-int devm_pm_clk_create(struct device *dev)
+int __devm_pm_clk_create(struct device *dev, struct lock_class_key *key)
 {
 	int ret;
 
-	ret = pm_clk_create(dev);
+	ret = __pm_clk_create(dev, key);
 	if (ret)
 		return ret;
 
 	return devm_add_action_or_reset(dev, pm_clk_destroy_action, dev);
 }
-EXPORT_SYMBOL_GPL(devm_pm_clk_create);
+EXPORT_SYMBOL_GPL(__devm_pm_clk_create);
 
 /**
  * pm_clk_suspend - Disable clocks in a device's PM clock list.
diff --git a/include/linux/pm_clock.h b/include/linux/pm_clock.h
index c3b46fa358d3..d54681547f58 100644
--- a/include/linux/pm_clock.h
+++ b/include/linux/pm_clock.h
@@ -37,7 +37,7 @@ static inline bool pm_clk_no_clocks(struct device *dev)
 }
 
 extern void pm_clk_init(struct device *dev);
-extern int pm_clk_create(struct device *dev);
+extern int __pm_clk_create(struct device *dev, struct lock_class_key *key);
 extern void pm_clk_destroy(struct device *dev);
 extern int pm_clk_add(struct device *dev, const char *con_id);
 extern int pm_clk_add_clk(struct device *dev, struct clk *clk);
@@ -45,7 +45,22 @@ extern int of_pm_clk_add_clks(struct device *dev);
 extern void pm_clk_remove_clk(struct device *dev, struct clk *clk);
 extern int pm_clk_suspend(struct device *dev);
 extern int pm_clk_resume(struct device *dev);
-extern int devm_pm_clk_create(struct device *dev);
+extern int __devm_pm_clk_create(struct device *dev, struct lock_class_key *key);
+
+/* Per-call-site lockdep class, as clock mutexes of different devices nest */
+#define pm_clk_create(dev)						\
+({									\
+	static struct lock_class_key __key;				\
+									\
+	__pm_clk_create(dev, &__key);					\
+})
+
+#define devm_pm_clk_create(dev)						\
+({									\
+	static struct lock_class_key __key;				\
+									\
+	__devm_pm_clk_create(dev, &__key);				\
+})
 #else
 static inline bool pm_clk_no_clocks(struct device *dev)
 {
-- 
2.55.0

