Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F1B4B4869
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899939; cv=none; b=m/NKE9atai/Hynn4pmb5EmDk5vh++GWmjhM6EVpVLd8xbUS4kXGuHCESqBESzD7zP4XGoxw2FSGRSPNxvanwlKxHSYAA36PxZNM30MetwMV5331iWtBKoDWVft2GgIeG8+R4VCzlbc9LRjlk9izQYepDiUsDouV3iWpKWjQ9jEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899939; c=relaxed/simple;
	bh=arNrw+iPsal8AZsnLzzOB1CyT7mCNMqIyMK/IIGqaGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ssxMQslhEsDTN8uH7F0YOHYjdrfbseGUOGDcB5KxqabIefHchXFVakgh+Fq1pz25mAwF1SJ55299MCB4F807igzx7i7kp8vgpm+FnotiZku5FMsT39Sl0hqAuNPFTMQm2emuhWEh2izIgXTq86psUTtelPXslMV+m8iLppGHYcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBEpBbWW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBEpBbWW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so6517335e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788899935; x=1789504735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lPuDw+ORGOHKBcreKD51QJa/ZGL09ksPm4bGJzobvM=;
        b=iBEpBbWW/oblC+2+wo9HQoR1q4Vynzwb1C9ei/1IIK1x7DoWx50Ji/et/3Z462RyTt
         Ce6Lhlfq1Ia8Nr6/z06jzWu9+QnIjhc7UXreBOutNL22Sf1OLh/YFIoqkZKXKkqNoL5b
         TQpZSO4XT3ppS5Sx1Rji1p8LgnJoRX5gpUH54IVUPxltgqKuaeG5Sn+/wG5gcX4cKZIi
         txnSYtNKAP4TkSskjwVESeH3RqQzSQV3cXiUEBRpjGlxLbQQAldhqzAC7lflyjjMtTbR
         BTPUxfi/SGx92o1dTjBL3CKpkIYYdP6QVwXdsyDCOYH8EEQLElkGH238d6+GyBGbf6XX
         sKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788899935; x=1789504735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lPuDw+ORGOHKBcreKD51QJa/ZGL09ksPm4bGJzobvM=;
        b=q61CAo4l1axTJOXjoGjQbvv2BFWHGKcQF1NvklUPJhka9cNMH85s6PEaDF9vFIcgnd
         UT7RiZaHcJnDt2P4U+eeYWbzVwp8UeXmZM/L3v4oThfe+7k9EGHHpmUqTHTkmwmWsS0k
         t/6nw8zvfqwuEOe4ZAzPy93wzjyHyxr92CVbKVLCXfQY51er8TsmAHIFrt7mJFfVV3Jl
         887SO78+lzFnHEP4xQHv+g2QIxieOnM3FAmfnKXsndOs0939t4S+NhyK5qW9piwX4a5s
         ZRqNYFfehb+6GlJknaG1ld78Wn681PRy/NF4r/R2UbEvekf1heMlXQqub1KENDlgdH9X
         fVhA==
X-Gm-Message-State: AFuF++lP7kCWHk8ZBmLHX9HpNmv101IZCT2JKcPwDLFHs5Z3UF3We+6p
	HRG8X4wTQPDZTFcXE6EnKClKwkFqKS3Ht8I1wraIiVECrT7S1/7wjEin
X-Gm-Gg: AYBFou0pJdWrz5FbirIav+JbEuiNBKK6cfs6Ln4+IjVIC31tgRpCrfYQywKNbqDozRb
	pH0ZQt5aWXe+fG4DCGMOzt0kKApgCK4mFCqlyWdW6jrc3hL8ZtZSsTiDuYvXl+locEWgQDEi7mP
	AUahchsyqcn67g4B7QwVkjSGOg1rPv7ST/RyppaAdnCdS8AVfurc9Z5NW2Mtp6QPTaE9r+CQBQv
	vMcfVrt4H29Jl4DeJfYo0sK1PylnNpLP2+v9vlVk5Tfy5KMdAy9b8D8uxo3txnBGO9a1LdjX1Oz
	pL/BxK++YdSeUFjT+onUIwKBfUY0d6C3a+JPDDmZSx9wcs5uFGd0qypt62A+kDXNad62rdw6Nkh
	dKaF6FiiLVKyRKXxuFhIb1HU+cnU+4Yt1bIU3xJ+83d6yrjpFRfMoijW7/r2DlqTXr62KesWmEJ
	DmxK6DCmodlwR9AHn1jtITtcm9JXr7m/RZBt2CIrPKqCEHaICLh1Wta5iAKC5GLMT7jBmNXy2km
	yV255FmdJlPxl8dNmFiL/xy2Oy3cxmLx/leLzOCOqrbM1gmzStZPmPwIU3jg35JwFro
X-Received: by 2002:a05:600c:b8d:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49d1754e950mr101462935e9.4.1788899934457;
        Tue, 08 Sep 2026 13:38:54 -0700 (PDT)
Received: from moosama76.. ([156.193.105.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20dae82csm3943805e9.3.2026.09.08.13.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:38:54 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	Mohamed Osama <mohamed.osama189110@gmail.com>
Subject: [PATCH] rust: print: document safety of printing functions
Date: Tue,  8 Sep 2026 23:38:50 +0300
Message-ID: <20260908203850.952156-1-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/print.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 0d62beeedca5..def6ef5a1dec 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -29,7 +29,8 @@
     use fmt::Write;
     // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
-    // SAFETY: TODO.
+    // SAFETY: `ptr` is provided by the `%pA` formatting path and points to the
+    // `fmt::Arguments` passed to `_printk`.
     let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
     w.pos().cast()
 }
@@ -109,7 +110,8 @@ pub unsafe fn call_printk(
 ) {
     // `_printk` does not seem to fail in any path.
     #[cfg(CONFIG_PRINTK)]
-    // SAFETY: TODO.
+    // SAFETY: `format_string` is one of the fixed format strings, `module_name` is
+    // null-terminated, and the `%pA` argument is a pointer to the valid `args`.
     unsafe {
         bindings::_printk(
             format_string.as_ptr(),
-- 
2.43.0

