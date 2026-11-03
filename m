Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745874;
	b=l1/SRioSSoaUztmCt/hepMix05edAaQAv2SKxfU7V/nL/FIPLHgSqkkCH1DRikPvgoMr
	 y3gaAcUTDw7/Iy/beDB6FntlgZQ+9MlmGjBd90SFAAGWjF2sNLtaPY/6SgASMAfCNbng4
	 cVDSKdSJTGX9BYwQQ5KlukF408IZzByJzzeY2dCWNITbc4QeXYre2yrIoc8DOB00lJDsv
	 PHS366YneNohVWZhW1qxdpScQWWcIUTNUPsPPm8Ufy6h3z/NUX+80Mn5cOOiXam8P8Bms
	 kBvJoM3UNwoEIV6rnfjK5C3AtK5OQdE/kGD7kJFYiCqo9Lgm6KEL0FDtWMnKAUjQOow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IYRceEq4zymtuUBFa2addJs8iPYSeOk0DtxlRCNPrSE=;
	b=Hwy9MV4008LUxdcpYfj22CNAu57IXiRsWSqkySICAc7yg5zIFx758Qx4NAVk9tKZ0g3S
	 qrmvC/d6rE/shXgPfj49VQRoca5tsAphCz8JBhLvdn4EM7yOdtlS05VEQjbSiJVi7G2dR
	 6wlaFyZWpqM0v292ubF/dkrjOUaX8U6cEl+cJLj8utWMkUDXet0/qHLCdLS4NNd5UlCTk
	 aU+eoa278b/PPFF3AoW6bmNGqSdXnv30UrWM3GmadQa9KyesqSFVRZ1HSPjmhHCPmmyGt
	 O+uIauz08bNjQS6UbxmCTbJiv5JttZ+WAxKgViHj4r0xO3AoiLGP0ohwXpaKNMX9Srw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cQiTlj4P;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85398606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85398606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cQiTlj4P
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1931ff67a29so445565c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745874; x=1794350674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYRceEq4zymtuUBFa2addJs8iPYSeOk0DtxlRCNPrSE=;
        b=cQiTlj4PUDTrLblnoS21huaGRbPJIjTNLiLTzZQjpVolaFsbcg2nU7tXKwEZJ5sXqr
         xjApO4Na0mwy3fc4JBMzx8pWuGlDBU8hTBJUQryoUqoSGIZFcQW5spo0F9jUm5IJ7cF2
         ZsMc5byH8WUDBc2s2l2pW9ilm+DwX/jkHw7h9vHsHelLlMdfI0zByCrbtJy5DPO4aP4d
         7vOM44br6moCuQPCcQsZaQ3fx5QcgaSB0wdPj4VVspll7ykwyZBjmVtbn7g50RogVrpk
         jN51SnJ8iw8H0q99XQn/Hhd9X/0LR0AutxCMv0YBuRAGRUy9vVUMCt2F7uC6188Rk28v
         JyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745874; x=1794350674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYRceEq4zymtuUBFa2addJs8iPYSeOk0DtxlRCNPrSE=;
        b=hTCninaalUYwZqsBAPDUgyyJB9TOYnEUVGDGHehQhKyVeuFQFjBUCnVm4+QT/NUHvp
         f/2d5BT6wZ3mf9Q7Rjrf9fjJFcOc/edR6CgwfCyqON4GostB/NpipJSjFrqBWkF0TnqQ
         UhQdveknOzy5glTbqXvkEUXc9+UUdB2X9UT0nOKPjBrzsKzCzGzbwtkKWFw7Y3F0zXTv
         q2c+jHRGasLIXfIvsm3k76tBBqI4tJYB/Be2qGuQwvNYN/FfOvmqIZjpLsYyq36YGrGn
         tBHAAFy3ZhubBPlohx1n8MR+33NsCdJmoyrYEr0bqhISWcXT3XE8c7n/EGRqll5Sqcwu
         +E6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxjVaCABAsJSp35rXEc2GtcXetydf7XCfOUmrTWphHL3sebn7bIhley2GDN0Xc0JfJpYfhmgxwUuTJqg8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dtbBwkg8fvt230dYLn3a2IzpgWhzpHAFxHTcxvMPH7ZcD5kur
	hiM2gSm2coVTtLfbEIxPcdBGpJw7J9BkD4R6moytBVWzck4360FSjFotwg+fx0tW7B8=
X-Gm-Gg: AYBFou1PGbScO/7cLxvIfq/Ca3Bt3gtkRayuDegXpCl01qrucgy1va0yDHMJXCGRf7K
	rSZqJHqYHNkDjblmRClHo5RurEseXaIsHvKxt8HN0KTW7fdKLow3VdbJpEBCe0iTcKZB4ZWDfKB
	o7Y0yN/mpWDAVr5qYEgx63IRvW+VOBn9qAjNY6xEeeaWdx0BJXtz6pkAY+zUrWPNAbB9GbSvgcM
	VDiaGbhJlQknSn1d9Azy/ckGrjwwCAGXovv7k1X7hFrMAlllIyli5A0ignw1gK6mvFHsx7RP5wN
	Hprit540/3l7VO4MxlZlMKii4gME+LTzlODon4Vdkv0Veh6++iIxO2QK6dIarvCdpozdJwQgy8N
	ivW7rDxjUwxJgMyDgtKzPtfDYCxgg6lbExCjw0I0kisE+PMiKpQ2dVbHB5U5ohPhHLXuN14rRSD
	iGDakSQcptmbQLflAQIvgSmSNSYP5HY281EyRG4X2kkHZukDFs8z1ZhebuupLjKuGljf48pi1i7
	uZP9DtVPeHmE/1ME15bu92YPTGyqa3Vctf5QEg/LH5StEQgnmQgzgxqvxLdgGd7RV5jdsVBHbnF
	9Dl4zBJ3yVywlemYO/U+UFQ6npu6UJr1PG/W5gTnHtaKrT+hJt60HIFTMSGRX6R2uVcs0md0G6r
	xBnxq677pHwg91OrpA5vayezFwoBKnL3lHxjPJu4gU60uYk73dBJZtYA2xvM0sVmZCC5KGsX9XL
	A=
X-Received: by 2002:a05:7022:1e13:b0:149:1feb:6d9d with SMTP id a92af1059eb24-1ac5ac4df09mr17890128c88.19.1793745873408;
        Tue, 03 Nov 2026 14:44:33 -0800 (PST)
Received: from localhost.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2de58sm1719205c88.12.2026.11.03.14.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:44:32 -0800 (PST)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: brgl@kernel.org
Cc: linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: reset lookup flags for each hogged line
Date: Wed,  4 Nov 2026 07:43:39 +0900
Message-ID: <20261103224339.1180-1-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.42.0.windows.2
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

gpiochip_add_hog() initializes lflags once before iterating over the GPIO
specifiers. In the non-OF path, an active-low line sets GPIO_ACTIVE_LOW,
but a later active-high line does not clear it. A single firmware hog
with mixed polarities therefore configures later active-high lines as
active-low, including inverting their initial output value.

Initialize the lookup flags for each line before translating its flags.
The OF helper already overwrites the flags for each specifier; the
non-OF path must also start with a fresh value.

Add a KUnit case using one software-node hog with four alternating line
polarities. Check both the descriptor polarity and raw output level for
a logical high using the existing software GPIO provider. On UML, the
eight existing cases pass before the fix while the new case fails;
all nine cases pass after the fix with the same configuration.

Clang W=1 and private Sparse C=2 builds of both changed files complete
without diagnostics. No physical GPIO hardware was tested.

Codex assisted with the source analysis, fix, regression test and commit
message.

Fixes: 802c51a83e9a ("gpiolib: fix hogs with multiple lines")
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
Target: brgl/linux gpio/for-current at 9e4b35c95fede87bad36f68b7ff1eae94ea6b910.
Tool use: Codex assisted a bounded review of public kernel code, the
minimal fix, test and description. The task requested a reproducible
general functional bug fix, not a fuzzing or security campaign.
Testing: actual before/after UML KUnit and Clang/private Sparse builds.
Physical GPIO hardware was not tested.

 drivers/gpio/gpiolib-kunit.c | 88 ++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.c       |  3 +-
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index f005854e7f..01205acf62 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -862,11 +862,99 @@ static struct kunit_suite gpio_swnode_hog_test_suite = {
 	.init = gpio_swnode_register_drivers,
 };
 
+/* A single non-OF hog may describe lines with different polarities. */
+static const struct software_node gpio_mixed_hog_provider_swnode = {
+	.name = "gpio-mixed-hog-provider",
+};
+
+static const u32 gpio_mixed_hog_gpios[] = {
+	0, GPIO_ACTIVE_LOW,
+	1, GPIO_ACTIVE_HIGH,
+	2, GPIO_ACTIVE_LOW,
+	3, GPIO_ACTIVE_HIGH,
+};
+
+static const struct property_entry gpio_mixed_hog_properties[] = {
+	PROPERTY_ENTRY_U32_ARRAY("gpios", gpio_mixed_hog_gpios),
+	PROPERTY_ENTRY_BOOL("output-high"),
+	PROPERTY_ENTRY_BOOL("gpio-hog"),
+	{ }
+};
+
+static const struct software_node gpio_mixed_hog_swnode =
+	SOFTWARE_NODE("mixed-hog", gpio_mixed_hog_properties,
+		      &gpio_mixed_hog_provider_swnode);
+
+static const struct software_node *const gpio_mixed_hog_swnodes[] = {
+	&gpio_mixed_hog_provider_swnode,
+	&gpio_mixed_hog_swnode,
+	NULL
+};
+
+static void gpio_hog_mixed_polarities(struct kunit *test)
+{
+	struct platform_device_info pdevinfo = {
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = software_node_fwnode(&gpio_mixed_hog_provider_swnode),
+	};
+	struct platform_device *pdev;
+	struct gpio_device *gdev;
+	struct gpio_desc *desc;
+	bool active_low;
+	int ret;
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+
+	gdev = gpio_device_find_by_label(GPIO_CONSUMER_NAME);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gdev);
+
+	ret = kunit_add_action_or_reset(test, gpio_device_put_wrapper, gdev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	for (unsigned int i = 0; i < GPIO_TEST_PROVIDER_NGPIO; i++) {
+		desc = gpio_device_get_desc(gdev, i);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc);
+
+		active_low = gpio_mixed_hog_gpios[i * 2 + 1] == GPIO_ACTIVE_LOW;
+		KUNIT_EXPECT_EQ(test, gpiod_is_active_low(desc), active_low);
+		/* A logical high must drive the inverse level on active-low lines. */
+		KUNIT_EXPECT_EQ(test, gpiod_get_raw_value_cansleep(desc), !active_low);
+	}
+}
+
+static int gpio_mixed_hog_suite_init(struct kunit_suite *suite)
+{
+	return software_node_register_node_group(gpio_mixed_hog_swnodes);
+}
+
+static void gpio_mixed_hog_suite_exit(struct kunit_suite *suite)
+{
+	software_node_unregister_node_group(gpio_mixed_hog_swnodes);
+}
+
+static struct kunit_case gpio_mixed_hog_tests[] = {
+	KUNIT_CASE(gpio_hog_mixed_polarities),
+	{ }
+};
+
+static struct kunit_suite gpio_mixed_hog_test_suite = {
+	.name = "gpio-mixed-hog-polarity",
+	.test_cases = gpio_mixed_hog_tests,
+	.suite_init = gpio_mixed_hog_suite_init,
+	.suite_exit = gpio_mixed_hog_suite_exit,
+	.init = gpio_swnode_register_drivers,
+};
+
 kunit_test_suites(
 	&gpio_swnode_lookup_test_suite,
 	&gpio_swnode_probe_order_test_suite,
 	&gpio_unbind_with_consumers_test_suite,
 	&gpio_swnode_hog_test_suite,
+	&gpio_mixed_hog_test_suite,
 );
 
 MODULE_DESCRIPTION("Test module for the GPIO subsystem");
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f27..db613770dc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -975,7 +975,6 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	 */
 	u32 cells = 2;
 
-	lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
 	dflags = GPIOD_ASIS;
 	name = NULL;
 
@@ -1014,6 +1013,8 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	fwnode_property_read_string(fwnode, "line-name", &name);
 
 	for (unsigned int i = 0; i < num_hogs; i++) {
+		lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
+
 		if (is_of_node(fwnode)) {
 			/*
 			 * OF-nodes need some additional special handling for

base-commit: 9e4b35c95fede87bad36f68b7ff1eae94ea6b910
