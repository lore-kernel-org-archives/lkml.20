Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089C03C1D65
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691263; cv=none; b=aTANeD/QBCVJgupLiurbsrznHkkuY8PMuj0uEiDscR9622nj1Hdo5cZ0j+D+R4ve+z11ajBP7AZxsRF4VnmgSL/HpKtn9a5TP+uHLRhgVdEBbb/nD9kMJeOW7A33hFzd3o+ex5asyznN2eU1FA15rOKGejN9azp57ULfXQs4UPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691263; c=relaxed/simple;
	bh=q/uIYLcPSFObDJjtPbKhA7rAxxJvoJzI8r/TGrW80ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ufo3ycp/H3PBJeFbFD0az1jfjlf+aJUs5Tkfj8gKeFdxhN7LH5Ljw0hyl/nsZoghQa5CpII+SE3F79iGykCLERbiTg6W9B7FDOb9+AOEgQXK9jO2QMAtufTahkhzs04IPi5sYy45TQsIwbX0/dKnj1hqM1et59y4+ffdRFW+xcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsVBT9WA; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsVBT9WA"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bcb929cceso294770eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790691261; x=1791296061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSqpMHsSCgHMp6sYSZJ0Zph1nPml/+XmXvdv8QAUIRw=;
        b=MsVBT9WAH8t4wQlT/U6XZOodgCq8wmOmCO8oy+PPJpB9RoKEOcylYA9AE6QymERjUs
         ukgmcL5O9yqfZZ8SRVMuHKheUwFRQ6Y2OrTYDGFjgid2Dh3FllzefVFNVF+XTa/IaLoj
         eitonEByDhLgI3d4/lzpjC3gWTSzNlbhAp3E+3hellwzNALmxaC+oKpFtsM/C3jXR5yd
         RmQAFxvCbNysxQKSuALOvWYsAzmfacwuuXj/6WhqvrQ3L+VjEPNUsSbDf3rsFEEDRpN5
         9Pov22kVb+7MoGlsQXsj2370h3NJZuICZYQvfZHOBNd5OtjqVqGgU/DSlTDoKi9DA0ae
         Scgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691261; x=1791296061;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSqpMHsSCgHMp6sYSZJ0Zph1nPml/+XmXvdv8QAUIRw=;
        b=YMV7jEB29VQxBAgd1AcFQmmT6gAwAA5T+cBU5v8k+McM+9BQAt6OCeFDP/NcRzN9a5
         5SJXDoUkhwVtwr4ua5x+GeQuCxNsREpoCwUZXEJPxOXdpCiMJaLR5dtipGYy1RaaJiBR
         051HYkset6T91Mi0xs7J5UrrCQeKLaFLSoChFTWa/kUJqxNUReL9HCzPU8Qg6U6ZMi7Z
         6Snb15giLKXgeyA8sQIxSgu5mOEOonQB4uJKKmifjbB0j08+MwiM59rZTLVVL3uoT0yr
         GOxXfgHbJFrHRtgPrKgRqYUjdXwi3mfxTzna5TzT3Lxr9QX7fxEBxXQcz8ENzD3GqaaT
         J0DQ==
X-Forwarded-Encrypted: i=1; AKwUvByBpUJ3lUiFCN+Ps7XD+jqNirgxxyLpBp6S/av798oc+2uPaHhi0rk6OLJm03fGMr33UPnKw9unTjnZgRg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNEWvdkkW8VUW8REjq5jW1IAqZJReUHLMPAMAQhIThzHpDpdkS
	l30PBbfPBPcwBRpFd5DZgn8zfw/US3Lq7R+G89AxOgbp14llCcZZs7w=
X-Gm-Gg: AYBFou0s/uMSDpMOecKTLfLO+GTLkwsuwYdPqTSnav/57KPpJdxPA8RrC9+y9cY3APX
	U2xLunv5I6u7QBsCc1/60/HgVls8yCMdXTYiu2e/yTF2vsNcYwkaRxDOtnOaafTDP19BRkew8xL
	w/HtpGCRHKDhD6JHis6XyaY0+xmgreP34jWmie5O/cr7W6BQfBFC8BMbofD9ThCW4Y8AakptCng
	kEt1IJgM1gr9Xdl/kl89laqfKO/egsRDvAlKT0dNRRLf9u/b+cb+hckuZshLbrOuxgdZ63EdO3p
	ggw2FF+bs3XUKEuM+f+zpB4eeAww7N0miAbXCe8wyRBJu8zyY0yUMyq7rn0+k0PpkQPGk1vXYTB
	TVSOZtLlRcHVIFfl55a1U/jyT8d+at3lindkb1aQ5Qv50TuD02zd66q3fSJP20YanNPPwjWaDlV
	/fYHZa4Kh4+dEaMcmYZw5+4u0j7Xh4h0QM+nTG1OYSHyp2bsJ4UH4jP/1MYs77011hEoQM27/GQ
	IOcn/jxzLcqtDyIONUs5pE4CWN/SUtZ9mZZlK7fx+voQfndGA==
X-Received: by 2002:a05:7300:80c9:b0:334:8fb7:1dfd with SMTP id 5a478bee46e88-342700c75e6mr17555271eec.8.1790691244787;
        Tue, 29 Sep 2026 07:14:04 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341459234a1sm34733297eec.24.2026.09.29.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:14:03 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Yury Norov <yury.norov@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 2/3] rust: kunit: allow same test name with different #[cfg(...)]
Date: Tue, 29 Sep 2026 11:07:42 -0300
Message-ID: <0f710a749bec162c3cf96f83d8425e7ad48e78e6.1790599486.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790599486.git.nico.antinori.7@gmail.com>
References: <cover.1790599486.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sometimes it is necessary to test the same code paths under different
configurations. The `#[cfg(...)]` macro can be used to check if specific
configurations are enabled and run tests accordingly.

Currently, defining multiple tests with the same name under different
`#[cfg(...)]` attributes results in a compilation error. This patch
removes that restriction, allowing identical test names across different
configurations.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/kunit.rs | 22 ++++++++++++++++++++++
 rust/macros/kunit.rs | 20 +++++++++++++++-----
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 5fa4d994e0f7..5ff988ab76a4 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -347,6 +347,28 @@ fn rust_test_kunit_in_kunit_test() {
         assert!(in_kunit_test());
     }

+    // Tests with cfg have the same name on purpose because we are implicitly testing that
+    // tests with the same name but different configs do not throw a compilation error
+    #[test]
+    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "y")]
+    fn rust_test_kunit_run_only_active_cfg() {
+        assert!(in_kunit_test());
+    }
+
+    #[test]
+    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "n")]
+    fn rust_test_kunit_run_only_active_cfg() {
+        // This test should never run because of the `cfg`.
+        assert!(false)
+    }
+
+    #[test]
+    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "INVALID_VALUE")]
+    fn rust_test_kunit_run_only_active_cfg() {
+        // This test should never run because of the `cfg`.
+        assert!(false)
+    }
+
     #[test]
     #[should_panic]
     fn rust_test_kunit_panic_in_kunit_test() {
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index f1d0210e6a49..18cfa463c8db 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -45,6 +45,8 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke

     let mut processed_items = Vec::new();
     let mut test_cases = Vec::new();
+    let mut test_cases_cfgs = Vec::new();
+    let mut test_case_number: u32 = 1;

     // Generate the test KUnit test suite and a test case for each `#[test]`.
     //
@@ -135,7 +137,7 @@ macro_rules! assert_eq {
         // Add back the test item.
         processed_items.push(Item::Fn(f));

-        let kunit_wrapper_fn_name = format_ident!("kunit_rust_wrapper_{test}");
+        let kunit_wrapper_fn_name = format_ident!("kunit_rust_wrapper_{test}_{test_case_number}");
         let test_cstr = LitCStr::new(
             &CString::new(test_str.as_str()).expect("identifier cannot contain NUL"),
             test.span(),
@@ -172,15 +174,23 @@ macro_rules! assert_eq {
             case.attr.rust_should_panic = #should_panic;
             case
         }));
+        test_cases_cfgs.push(cfg_attrs);
+        test_case_number += 1;
     }

-    let num_tests_plus_1 = test_cases.len() + 1;
+    // This dummy array is used to calculate the exact number of tests cases that are active
+    // depending on their #[cfg(...)] attribute.
+    processed_items.push(parse_quote!(
+        const TEST_CASES_COUNT: &[()] = &[#(#(#test_cases_cfgs)* (),)* ()];
+    ));
+
     processed_items.push(parse_quote! {
-        static mut TEST_CASES: [::kernel::bindings::kunit_case; #num_tests_plus_1] = [
-            #(#test_cases,)*
-            ::pin_init::zeroed(),
+        static mut TEST_CASES: [::kernel::bindings::kunit_case; TEST_CASES_COUNT.len()] = [
+            #(#(#test_cases_cfgs)* { #test_cases },)*
+            ::pin_init::zeroed()
         ];
     });
+
     processed_items.push(parse_quote! {
         ::kernel::kunit_unsafe_test_suite!(#test_suite, TEST_CASES);
     });
--
2.47.3

