Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EE944781C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501021; cv=none; b=p/hv4pLPbyFDINaA6YzcCZH3JdCZ8pgpNIYQC67sWiE5DHBxpStOj+zlNVZih6sDvZmaxzfQj0K/ZN1Dv9gL4KjBp3PIF8Be2n3GnNtGsHgv555+DJ+jrYVcIMiBzFn11vBn5utM/3uoFjdHZQ/Sle7rh+Aoqr8sYnNgeyIoES8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501021; c=relaxed/simple;
	bh=24j+YAsmr+yo0vlk5j9pKXxuyHWMHhXkvtbL6pgYsME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ggESit/jysmFdqPbsJRvpiygbcVkMqk42fuIJbgzp7KS43FrIIJydzYbNZsS3YI2cq/yOW52NpG3lXDHzjS6IPs3q6jA47tYj1gZ6AyZwSruVTBcTSNsFVTZn5Gd71GoomVotnzde0ACHbNNZFNpIArpUWdOVgHNhish35zb2N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGTuht7n; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGTuht7n"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b79so53726241.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789501018; x=1790105818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LWo+a1PwIvdyKSwMXLqscBhiuoyZo6YO0MGeXgp2PlQ=;
        b=NGTuht7nzQlyq3G1b5BiPnEotYatPty4AzXlq/xQY/FhjW8tMCFXDRzQNCsfXJ7Hqf
         BV+LWZTYNvxMIiw3P37WK2MWcREzgpgSmGuBYv/TvMFkp+ExZQ2XcrEf4bllNZzou+mr
         Kj4cGBtl2RXbN54vFYutxmLpCnUewOOAe0f9OVwQgKxJ7blmRdeJRbtkBv0Ur6ZQ6Nxo
         bBLKCXAP7I7afZ4yl2KcLlrZ04VwdTCFFNfbMMVDqT6nOR4182ECn6n3LHuUH4cc1Cti
         TPj3ioRA8jKfr0eIapjDGqJFGGC8KbxUmY6l9agO3Gvxy7MdQtp4UCWRZpktEC1BNXSl
         Rapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501018; x=1790105818;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWo+a1PwIvdyKSwMXLqscBhiuoyZo6YO0MGeXgp2PlQ=;
        b=wUkn1/hYmVxP8gBcjdcfaDpJcDluaqgkGxix02sYTAjGM7mUwTuhowJjE92kJ1rNF/
         XqVLPe9eWIk/gJVHdcbxJ27TWtS/1IP+Zqz3TrkHAVRFzjlpt9UZtZEP2Axmi/4ldFhL
         NZUI5fAJYrehN+zVrattmrzymwNyUGYjW91aFMqkyNGddaUbu2Ako7N5vVr8IY7EwAlC
         YgLpfJQeBFz4gPOp1oix6GRKDV8bVKhOb0LjLhX3gjapzG/i1/onVURvp+/lzD0ot/Ce
         Tro3tLXu3tDQeJZGWnglvsCQtsVjU3rv6LLtP77oP7ms0vA7nFQeAf918QWMPaFo6pde
         PmSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKaCkK67e0hyfhsGTYlvn4EeoBV6xZ+Sb0iTwgGm8A/CSLuRfeBAuX8Kvo10lLPcFVdxnRNhe1tPd5H/w=@vger.kernel.org
X-Gm-Message-State: AFuF++m7Hk5CSnQlb9K0NJEgipM/meZw4uJG8ue/bWy3D8EwtiSxnokI
	DI4W6FqVtvmBH1hse4euw3NCISnyvBlMPO05PD0VpyGa2wXmFZ03TdI=
X-Gm-Gg: AYBFou13dj5lw0TxkKIkT0KwYjhPd6q27I4nb8LJ9SsXhb4KBeZET0Vy4emZGaLX8HE
	LEnfSFBVke/vgF7OgIVX+JgTcpqJHvbfStFciHf6rmtag/4ojKJDY35LngrULCjtLLjIcC6bGcc
	toi69fZAgYg0vWONOQRzbbAMiY0hIe5AsO9AVXhpuFJyGYRLOPu6pcAJgIxoYKiIhyrqMlzNvkp
	qdB6B0imgU2LTBvnC9PIocAz+jy36Uxx7rRWwGGWa/ccVZi3bkEQ/W5nLIIzH+VwM5yVnjgJ9Gh
	z+SZa1leNtT0Z+coDlzivrkyu8qR3ag/gfAH9YooXsvZDK1Ezn43YyH456cFtXUxugCracCEp3s
	4r9wR4P8yTPHDxcjXVilezbnRb5D8QrZbE4Oy0jZ03U54rzSbz6txhHYx2lZU91ziWlngal78PG
	fsxsymdnjx6mXBmgq220pESBLdy8SNd40FTdL4EPPeLZqUTqyO9Biy8v0+LYpnu2S7MTxb53JpL
	3bjSZfu7zt4VdksHkVfTFOPJ6dy3BwB+ZrRXC7Xdk/0eIZqQQ==
X-Received: by 2002:a05:6102:3708:b0:79f:3c2b:2f6d with SMTP id ada2fe7eead31-79f3c2b30f0mr4964130137.3.1789501018508;
        Tue, 15 Sep 2026 12:36:58 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79fb1148f57sm691450137.4.2026.09.15.12.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:36:58 -0700 (PDT)
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
Subject: [PATCH RFC 2/3] rust: kunit: allow same test name with different #[cfg(...)]
Date: Tue, 15 Sep 2026 16:33:53 -0300
Message-ID: <47c9315829c60be605a528b74795219561cd889f.1789500084.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789500084.git.nico.antinori.7@gmail.com>
References: <cover.1789500084.git.nico.antinori.7@gmail.com>
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
`#[cfg(...)]` attributes results in a compilation error. This patch removes
that restriction, allowing identical test names across different
configurations. Additionally, it appends the active configuration to the
test name, ensuring the runner clearly indicates which test executed and
which was skipped.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/kunit.rs | 15 ++++++++++++
 rust/macros/kunit.rs | 57 +++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 65a1040ee2b0..613c8d2aea78 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -348,6 +348,21 @@ fn rust_test_kunit_in_kunit_test() {
         assert!(in_kunit_test());
     }

+    // Both tests with cfg have the same name on purpose because we are implicitly testing that
+    // tests with the same name but different configs do not throw a compilation error
+    #[test]
+    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "y")]
+    fn rust_test_kunit_parse_cfg_in_kunit_test() {
+        assert!(in_kunit_test());
+    }
+
+    #[test]
+    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "n")]
+    fn rust_test_kunit_parse_cfg_in_kunit_test() {
+        // This test should never run because of the `cfg`.
+        assert!(false)
+    }
+
     #[test]
     #[should_panic]
     fn rust_test_kunit_panic_in_kunit_test() {
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index 2c6405cebc0a..605d925cd8f0 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -6,14 +6,19 @@

 use std::ffi::CString;

-use proc_macro2::TokenStream;
+use proc_macro2::{
+    TokenStream,
+    TokenTree, //
+};
 use quote::{
     format_ident,
     quote,
     ToTokens, //
 };
 use syn::{
+    parse::ParseStream,
     parse_quote,
+    Attribute,
     Error,
     Ident,
     Item,
@@ -22,6 +27,46 @@
     Result, //
 };

+fn get_cfg_string(attr: &Attribute) -> Result<String> {
+    let mut result = String::from("_cfg");
+    attr.parse_args_with(|input: ParseStream<'_>| {
+        while !input.is_empty() {
+            build_cfg_string(input.parse()?, &mut result)?;
+        }
+        Ok(result)
+    })
+}
+
+fn build_cfg_string(tt: TokenTree, result: &mut String) -> Result<()> {
+    match tt {
+        TokenTree::Ident(ident) => {
+            result.push('_');
+            result.push_str(&ident.to_string().to_lowercase());
+        }
+        TokenTree::Punct(ref punct) => match punct.as_char() {
+            '=' => {
+                result.push_str("_equals");
+            }
+            _ => {
+                return Err(Error::new_spanned(
+                    punct,
+                    "only \"=\" is allowed to check configurations",
+                ))
+            }
+        },
+        TokenTree::Literal(lit) => {
+            result.push('_');
+            result.push_str(&lit.to_string().trim_matches('"').to_string());
+        }
+        TokenTree::Group(group) => {
+            for group_tt in group.stream() {
+                build_cfg_string(group_tt, result)?;
+            }
+        }
+    }
+    Ok(())
+}
+
 pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<TokenStream> {
     if test_suite.to_string().len() > 255 {
         return Err(Error::new_spanned(
@@ -106,6 +151,12 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
             .cloned()
             .collect();

+        let cfg_attrs_str = cfg_attrs
+            .iter()
+            .map(get_cfg_string)
+            .collect::<Result<Vec<String>>>()?
+            .join("__");
+
         let should_panic = f
             .attrs
             .iter()
@@ -113,7 +164,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke

         // Before the test, override usual `assert!` and `assert_eq!` macros with ones that call
         // KUnit instead.
-        let test_str = test.to_string();
+        let test_str = format!("{test}{cfg_attrs_str}");
         let path = CString::new(crate::helpers::file()).expect("file path cannot contain NUL");
         processed_items.push(parse_quote! {
             #[allow(unused)]
@@ -135,7 +186,7 @@ macro_rules! assert_eq {
         // Add back the test item.
         processed_items.push(Item::Fn(f));

-        let kunit_wrapper_fn_name = format_ident!("kunit_rust_wrapper_{test}");
+        let kunit_wrapper_fn_name = format_ident!("kunit_rust_wrapper_{test}{cfg_attrs_str}");
         let test_cstr = LitCStr::new(
             &CString::new(test_str.as_str()).expect("identifier cannot contain NUL"),
             test.span(),
--
2.47.3

