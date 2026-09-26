Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2C1359A8B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790444003; cv=none; b=gwgAXYvodxPqjCosVLLgu/RZ3uAPmTINhSFsrXXOYqNr0W+8pRn+dPyhMGwjTCxp4uiViGqAsYK0sF6ypNiPsGzVGKxjiMpAqJXboJvFWwyZfi6Ak5hzyEItQVRiahHtUzcTuxV9fSO6B2F/wbjDoHVQtunsGknqHfMJs4qdQOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790444003; c=relaxed/simple;
	bh=5VNrVx4ZKAIvebGxfLNqPgw9xDv0RVGMqeAFRyrl6Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hgpm1DODjFcUEmMDVHDLBSiApV821D8F5cVkkEF14xAorIZmZEYmsCKE+a4mrZIAtWADCSwf+Su34RoGCSvFjWlH7Qex9mVyTuujDk3HavIbQU1R+ZdN7Oqd4/tVtOxx6uOYNhpqg4zPKe4F0S/Co1FjDNEfKvecc+CBE6gM0+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jhsy/Qgw; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jhsy/Qgw"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882c1f261so534985f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790444000; x=1791048800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92J4cdfV5TssQddcjnr52AW40i0MRdcSuU09rnmRkE4=;
        b=Jhsy/QgwQGQH/87yAKPPf1Dh8FY0VJsXzAvksSD+xuAxf50+UP2OMafPnaZdLnCbLS
         Jv7F/GA007tL54mAf9D7S3SJVISyQ6JlysA4NSC6BD0Kni9qEQTggiwlRK9gdB9RWu5D
         0P1FDDQcvwxMkUBOCijg7K1n96E9ZCJ24FM4i85FIt0Yec11SBSt5mE/kcn072m0mmhr
         JbeNXl4GaT2yEf7Ft0OqqX6f/6VVGhR8rQz8iTFxkBQgUae4WH2tzM+UgTnYt3iYroRS
         Dspapxuh3UEVDZdakBCyrjlGLK/QTD5YJ8xQR90vOlYvyHh7sUrfjsNFDEmGIAxQrss9
         3OZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790444000; x=1791048800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=92J4cdfV5TssQddcjnr52AW40i0MRdcSuU09rnmRkE4=;
        b=AvdzEaIx7EttuhP9F0+y9ZQD4Pxq7zXut5rlyHpYU+BVMl+sZEhKbuA6+lYT0Pp0dx
         zd5nOjwB/Qr4rezfgs8UgttIj+XeQr1cIpfbpCSO4vIRCMXEaL4v7HXZgX66zBS7To36
         WAADGl1M9pR/uQc9B2sL3pVtjPwS2JKSFkiFaAv6vFD/UViNwu1jzLi0P0nuOsTuTasy
         Mub/VYy9DygCNTgVBtkNuqcNmjTNZmySFQywaJnFlEb0mndjmlrdD/c7bC0NUyoUpzR1
         1JoLmvKMlSi680XSQgo7/+IdMkBPJzcftF/JjQwsUVuOM3ASQThTJiV8KiFuuxquXIR5
         BOEA==
X-Forwarded-Encrypted: i=1; AKwUvBzdyIbI++c+PUXTvUd4fFQEZdSHA42NdpD0aLBf9X1ukSUWi28DpHuHSk1mbbm4TY52D5Lr8I9WsQom+yA=@vger.kernel.org
X-Gm-Message-State: AFuF++nWxNz2Fqt9Y56AAeUDy9S4JPs8MG2r55dlDqI6TdiHKVCSv/X+
	0uCruqgAVWF9mXaEFF2uY/SfTdSWbX6obXUTnra4bxXeW0YTsHHYk3TT
X-Gm-Gg: AYBFou3IDcXLyr3c1xe6AVsXyagQWB1aG/Qv72ENu7Gw655FrFVd2NiOWPDFwgiW8gE
	jVkioiUwMJjDhfrJUHnrMBerph0LADPSZfJgBlXvTYsnrWwHyYmhFDKuTv9YVXvXPCukHUHt5it
	+D1P+VkNXxjw+8ptCPw5ecsNkVc0/YXDY5UK8CPHjiOV3cdECPUQchqV3OYey0Cd3PB1kU3nRUj
	2zXsS7pw2RBK37NwR+LfNZXOQw3TGvRb8yMn+n+Ey6xJPxM/qNyvFUFBn+IuNpqT4IOY3zBMpbu
	tpwxm4g1G75gq2qIpbUBSkMnmgu101fFD4RR1/6nkqZBA39R6OT4I7ogMp1gbzaXX2RjXp/A6Cw
	uVQ6yJFhXob9j8mudU/BEHGsbB5D6kkIAZwe35lWpWLUkmMv0m7x5IwHAET/gMiH0+8f0ajMZAB
	h8XjllzLBSkYk2i5E70Gkhdp+yy5ieb3WJ09St4bQRVAjaAzAhWJI8EcNdJ2GJ2ZJnU384iCAYb
	Ir6Bj0lgy0PIwx7iXxzodUH5siQQz2BoBJCB1QypF5QdDAcP0KNRuCTZIYb2e1LIMk=
X-Received: by 2002:a05:600c:3148:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-49ffc4fa10bmr34693285e9.7.1790443999742;
        Sat, 26 Sep 2026 10:33:19 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de4de4sm246200495e9.8.2026.09.26.10.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:33:19 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	longman@redhat.com,
	lyude@redhat.com,
	linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] rust: add DropGuard KUnit test configuration
Date: Sat, 26 Sep 2026 20:33:11 +0300
Message-ID: <20260926173315.56772-2-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926173315.56772-1-mohamed.osama189110@gmail.com>
References: <20260926173315.56772-1-mohamed.osama189110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a KUnit configuration option for testing the Rust DropGuard API.

The option follows the existing Rust KUnit test configuration pattern and
defaults to KUNIT_ALL_TESTS.

Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/Kconfig.test | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
index e6a5c7a795f0..011c72f14e2c 100644
--- a/rust/kernel/Kconfig.test
+++ b/rust/kernel/Kconfig.test
@@ -33,6 +33,16 @@ config RUST_KVEC_KUNIT_TEST
 
 	  If unsure, say N.
 
+config RUST_DROP_GUARD_KUNIT_TEST
+	bool "KUnit tests for Rust DropGuard API" if !KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests for the Rust DropGuard API.
+	  These are only for development and testing, not for regular
+	  kernel use cases.
+
+	  If unsure, say N.
+
 config RUST_BITMAP_KUNIT_TEST
 	bool "KUnit tests for Rust bitmap API" if !KUNIT_ALL_TESTS
 	default KUNIT_ALL_TESTS
-- 
2.43.0

