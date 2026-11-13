Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601439;
	b=rks8fPvxFK4sxn9s0GDib8DEs6gYvGH3CuOSdSDyoal3lk51AEpionmFwyogSfTrXXl3
	 Oh015jskkOnN682u0ov/WyctrVrWOATcrYlEhvKTCBwmxYWzQ02jsLEIY19geQ9cEtYLR
	 Ayiw444wSras0zglopZjQm5Ktdr/9czynsBLmFq/Pj8HHiY5HD0FUQIMZPL6F4JXpPOsv
	 JS1j5t+GKu5X5AOSg/TNjK1t9/k2w6w4P3EDUgyTCDwWfQs4NMnoOOJ8SrqjkdwoUqElC
	 bSNRDbRzs2GehYuxQ0Wrx6E6/xBY4JhYdzD3AT0x6HpTIFDB+D0htcIOEOhFDMt+iMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4jvEUnUJrd74/uF8JXphTJ/RHPybs0qTVGP2JvV6cQ4=;
	b=IDjQhKnDssr6MrODB6euHWOlhdrWqA7KK1WkDJt3xFBw8UJ17KFtXgZVYd/DlU+H++F6
	 R+EHwKE/XenySnVxDmzJ2NaABKz13dk+uL1ltSxNlDBz2o3KBd8Ps18jOBaIzJxjXnE6b
	 7fLdCE0+hWN4sf9sps28TmoP90h9IeliVE0cggkdGnDK6PMFIUL4GAwxV3NcifHtMZ0QR
	 edh+xYyHGxVee4UclTg7LvHuYzgjEZYGmh9AD9dwoMP/oJ1SAHpF/1KJLjVqlSqsnoX4Y
	 mSMbGeyH528rO9oEF6hdVUeWlSplFV2/eC+9oELTX65U0WFqPCOHeyXxTSZNvovnQDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Yga/QSqb";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48D5606A885
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D48D5606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yga/QSqb
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491971ac844so1577585f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601437; x=1795206237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jvEUnUJrd74/uF8JXphTJ/RHPybs0qTVGP2JvV6cQ4=;
        b=Yga/QSqbbsvIGtL60aI1kAe5OPZjPUAJxR18Z0gEJRPCeu7mHEpaqlir2hvikPClmJ
         VQ9aDqcjqM1tnBxEJ3nhAbq3m30/Qx4voX2Hg45lE7g2RqvnsWT5ZLk6UPC3+GEp+41X
         p3yM2sLV23WedO2RYYSoV3BE+pWZmHRVlvYz9Y6J8JE4bKuwPCObU2vss8dHVqnqrJOc
         UqRp6XH+jUjNgZBRvEEcK0qK5vZSgxbbk6/J7P/7HjViG+XiW5b2yyI3IIb4oUkCQ2QM
         B6w/EMth+rNtWJqIPtxw13cTDw0fPGmC/bOm9/sSiofCFI9IYQinQy4bkQsbtMsZDVG5
         pa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601437; x=1795206237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jvEUnUJrd74/uF8JXphTJ/RHPybs0qTVGP2JvV6cQ4=;
        b=0sXbA355kdLxSwCJsuv8jybsXDBwvASIttf4cwW1xfZDz5YQXSXkR2Y9mnjUsRvMod
         YjBk9m4BlTr0Hn4Grzcnz4QFJNrPu0cex3j8mr8sJ9YjhkjLw5Nq2umhv9VYj56atFwl
         V+d6/EGtNi1KE5CdBydBRyqcURbCJhla7E2SvtKRauwUJQciVb/81cV0Eold1aFPMHH1
         qxL+NOjUZPx20fhd+1qQwLXxxJuINdBPcwZ4u14vc7G2xZnMIzI+zw3yzrjKJSmOUZTW
         OAE+lyyZkokBA6QFsrOuJ8btDEZYbpeqExATkA35RdUZR/9UJF2UWB3ODRa+d4m0KB8f
         H0SQ==
X-Forwarded-Encrypted: i=1; AL+hErF6KHtJF343EZFe4HP42opvlONzbV5H2BE0pNe+PjtDTjwQtzcHuh9vo0fgTpYLeL/+ykrFHOMmdB8XefA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kxTu7jEK23xTABNn+6snMWkeH1nL7JpKqJJf3EkrWFc1VgMNA
	91OLr+RNnf2cb8aqqfT/hfj3TO9bxok3fr21tta7ZDCGHN0Oj5Reyjo8
X-Gm-Gg: AYBFou3aJI1jUYlsFhjI4Qz4b/r1p+bxNuCI8rFSw7TM7eZ2fY1/TH5+jxM7v5SZFdn
	ILmplcvRk1uJDb1WD86U8h69TlMWKxlI0qDXD1xcQygddCUuzReEbe+K8+rDGYzDz02BI4PWaC6
	c3WSyEyC3V7F+E0PCzW2zHTH+zf9OOyez++UMnfig3X4U4ZdW6tpvG0LVkRjNtNuD4i5a+8xCly
	s84iV8c0qGvdx8y3jCDXKiIQs5cT7pngkZf9pWmPuEs/vTcnAcTEzMNxWfqa3N0sJ5FAAjOC0eg
	2NNwnbYE1SX+fKbSy9daMgcSPltht8IInjliQCnbCXnn5HmBlu8SvX51yDD52x3e71cbkJX4D4v
	Br1gm8vwEbEbrc0jAK3eUxwwzP2OunCpvnE2qEy6/7AzY0u/N37VTuhnOE5S2xDHFXVxz/qwV8E
	UbD1IBAVM2W0opieRdUmiIFYTOqYRJPvcvn1GpF/N+bEhhZcfE1m9gZlrIXAITOzzXf3bofY5Cj
	qIDTZ7NqOCV3YRKL+A4ulYODTx91qv/sn6oR+lcn0Eznt96437MaqzmWt5WjW4gaudRbrJ7gNWS
	YK1LFCvWaFmqoYoLp3HdSxSwoLz0hnEyFGpskCz4MLHmUp0CiYUv/dX9zvsZgEosychlLgkQwYE
	=
X-Received: by 2002:a05:6000:178e:b0:48d:f488:f32a with SMTP id ffacd0b85a97d-49c73a0550fmr8478003f8f.56.1794601437163;
        Fri, 13 Nov 2026 12:23:57 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8e794sm7424563f8f.59.2026.11.13.12.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:23:56 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Fri, 13 Nov 2026 21:23:24 +0100
Subject: [PATCH v3 2/5] landlock: Add KUnit test for
 landlock_get_fs_access_mask()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-b4-landlock-refer-nonfs-layer-v3-2-02d7e42bcdfd@gmail.com>
References: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
In-Reply-To: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

This checks that landlock_upgrade_handled_layer_config() and
landlock_get_fs_access_mask() together result in the right handled
access rights being reported by landlock_get_fs_access_mask():
LANDLOCK_ACCESS_FS_REFER is only implicit if any of the other
filesystem access rights are handled.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 security/landlock/domain.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/security/landlock/domain.c b/security/landlock/domain.c
index 4c0b1f0e1db5..71756c68d08e 100644
--- a/security/landlock/domain.c
+++ b/security/landlock/domain.c
@@ -753,6 +753,49 @@ static void test_landlock_get_deny_masks(struct kunit *const test)
 					&layers1));
 }
 
+static void test_get_fs_access_mask(struct kunit *const test)
+{
+	static const struct {
+		struct layer_config config;
+		access_mask_t expected_fs;
+	} layers[] = {
+		{
+			.config.handled.net = LANDLOCK_ACCESS_NET_BIND_TCP,
+			.expected_fs = 0,
+		},
+		{
+			.config.handled.scope = LANDLOCK_SCOPE_SIGNAL,
+			.expected_fs = 0,
+		},
+		{
+			.config.handled.fs = LANDLOCK_ACCESS_FS_EXECUTE,
+			.expected_fs = LANDLOCK_ACCESS_FS_EXECUTE |
+				       LANDLOCK_ACCESS_FS_REFER,
+		},
+		{
+			.config.handled.fs = LANDLOCK_ACCESS_FS_REFER,
+			.expected_fs = LANDLOCK_ACCESS_FS_REFER,
+		},
+	};
+	struct landlock_domain *domain;
+	size_t i;
+
+	domain = kunit_kzalloc(test,
+			       struct_size(domain, layers, ARRAY_SIZE(layers)),
+			       GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, domain);
+	domain->num_layers = ARRAY_SIZE(layers);
+
+	for (i = 0; i < ARRAY_SIZE(layers); i++)
+		domain->layers[i] =
+			landlock_upgrade_handled_layer_config(layers[i].config);
+
+	for (i = 0; i < ARRAY_SIZE(layers); i++)
+		KUNIT_EXPECT_EQ_MSG(test, layers[i].expected_fs,
+				    landlock_get_fs_access_mask(domain, i),
+				    "layer %zu", i);
+}
+
 #endif /* CONFIG_SECURITY_LANDLOCK_KUNIT_TEST */
 
 #ifdef CONFIG_SECURITY_LANDLOCK_KUNIT_TEST
@@ -761,6 +804,7 @@ static struct kunit_case test_cases[] = {
 	/* clang-format off */
 	KUNIT_CASE(test_get_layer_deny_mask),
 	KUNIT_CASE(test_landlock_get_deny_masks),
+	KUNIT_CASE(test_get_fs_access_mask),
 	{}
 	/* clang-format on */
 };

-- 
2.56.1

