Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C5C39FCC8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536047; cv=none; b=Dlvs8oiJBt8Tx3OfTBZwO3eqgxJpk0h1kCe0ILRvpjTwP4gl+Kp6wVfrllW0KhA7Xq/kNO3WXRQoOoBg/xtf5S5vA7b19xFcicSnP5eGA1q3fJmooz9bpMWmOHthSbPMk7i+oZMB3hLocoX4JXQVXyie8V8Xfp5sglk8nUQFG1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536047; c=relaxed/simple;
	bh=2FtE8DQedmfSEt+ExqfAsX53GFxT4/LHQnzs7NaN+GM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cGwmi3ib2UOdCmb+pgmPHkrm6EYj9ias7/eU237PvxLnIC87KDcdQoerINevSArN/MQWLSU09/ixt0NIz1A4wwv4oAaQ08qZkzkYOUjPXChgMX8VWpT0IjeRAibaSbfhdH/7ITc1D7krJEIS0UevHd0osNiBMHx2opxePdYHgPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBT3UM1a; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBT3UM1a"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47de0093c42so986604f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788536043; x=1789140843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cDrNkNZOsYIEv5m23OY025bR9+PFxupCgVct6AM3Fmc=;
        b=mBT3UM1aAjS6LsRwzU0VNGHJTdSjqpB4mvAwW7ISuqEE39qAXpZg9Kt3AVxqhEoLGw
         Cr3HR6I+kXMPLPr+PBBjTr+o7QI3ems4F0ZfxsVDqCSgY4/vcvUrVJc2OHcPtQn37EKg
         Y1NPUiPaNEaQc/cWD2tzWVuFO+gYAnsk0kGh4PUtT1iyT1Z1DFB2jFUZuxz3oDoVIvka
         HLU9JURZBXh3TX24Uw4ImuYFEUbLwm+34zp5tfxHXoZ2BwISns6rFBmv0p1YZmBWZz4c
         7IPbKlivQms3FKfrbQl0dxd45dLM0O4v83F787I1r96HtRsWvkOE5mjTFN0oEG1gmwNd
         tnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536043; x=1789140843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cDrNkNZOsYIEv5m23OY025bR9+PFxupCgVct6AM3Fmc=;
        b=l1WwSQPQ8SnLpXBYp6Z9+yTmPo147y3dJt8+yrEbjektrJA4XSyNHonjWud80oIqX4
         zpK09Lax4bxtqbBouG3fmtD6n/KotQEcJe533aQg4jCBVYq8ZUSx3DALeF+Azoh7R7nm
         7LHvTbhprjFDJJAHNVn1JuBo/D5xRZGdP/wJ+1NPTD+PbuAu9qoEh73/01DJdjIm6TtH
         P9EJpP22Zi0YE71wTfU0JITs0augzR5wtlsOQfFNm8z/UBGiYkY7bBu1/5SGi4snCdzd
         8KpKDGZnX3IPRTc42tQoKQmSiM6Za/7PEr7ffURPRhc0Vj/5zXxjjsYtMkEqtQBhYumU
         x6GA==
X-Forwarded-Encrypted: i=1; AKwUvBxtL38f33AbTZMl4bJKG0TWsz1g6ax6CdXo6MdaxwUE0ETWlpOWg0kJh5oS8O8M3WwgNkE/XlUSIfj4ASo=@vger.kernel.org
X-Gm-Message-State: AFuF++kXMkMGz9oqmKj6ojByjjjuKwJxwNU1wsMkhFZllqz1RvlQqSya
	MzMnqE8UJZRmLQ5P2ejWNh3inPu6/0ikP+xKfwESRI1MHZktSrbIPHLn
X-Gm-Gg: AYBFou0FqwJ99+OZ8xi9nn0109FEleEEBVUFZueL3Nym8XP/m7cm5oIZXQuIU0eLALn
	nttjGFqU/P2CkgT59cx5D1QAs6EovRXUvLD2pI0izoJGPJZfLcO4OoDS9xEFOHN8RSt8GitDiyD
	oF9Oy/II6o0DsA9Ge4y2CG6MgMJYlSXsR5trG8f3IqD5zVOEd29sV/nAx0C9LjvHo+B0em6QwOg
	zfm3qBU8aB5xKixkFy3ngyHPiio+t7uWHXFa/+MI5aNsbn9CBApiZSILpxHDFYh0BVw7PyewQKo
	GK37Vz3nPKCe2TaMzItWogRXUP8eJ6zOLAlqzrdSifQijFQae4wei2ojn3YS+jzbYW/xfpA4u0U
	K/KGkcq8e8al1RihdZYcrz0GTg0jPsO8BocfNpgdx/nC3uETimO9hKlIuyKXwoz5+uPZ39tHBqU
	v07p1WFSB9dnn1ivt4VZvacqM7B8Gbf6HPkh+m5M0LtHsMe8pwQvzm7O7nCvpuuw==
X-Received: by 2002:a05:6000:4812:b0:485:8c16:5ee6 with SMTP id ffacd0b85a97d-4858c16606amr4195449f8f.32.1788536043347;
        Fri, 04 Sep 2026 08:34:03 -0700 (PDT)
Received: from jack-pc ([88.97.221.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm7350559f8f.24.2026.09.04.08.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:34:00 -0700 (PDT)
From: Jack Whitehorn <jackwh.whitehorn@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jack Whitehorn <jackwh.whitehorn@gmail.com>
Subject: [PATCH] rust: rewrite fmt! macro to use syn
Date: Fri,  4 Sep 2026 16:32:28 +0100
Message-ID: <20260904153226.40210-3-jackwh.whitehorn@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rewrites the fmt! macro to use `syn` for parsing, also adds support for
trailing commas in fmt! and related macros.

I've checked that a range of rust modules (android binder, nova core,
samples) still compile and tested the behaviour is still correct using
a modified rust_print module.

Signed-off-by: Jack Whitehorn <jackwh.whitehorn@gmail.com>
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1227
Link: https://github.com/Rust-for-Linux/linux/issues/1172
---
 rust/macros/fmt.rs | 161 ++++++++++++++++++++++++---------------------
 rust/macros/lib.rs |   4 +-
 2 files changed, 90 insertions(+), 75 deletions(-)

diff --git a/rust/macros/fmt.rs b/rust/macros/fmt.rs
index ce6c7249305a..994a2924e6fb 100644
--- a/rust/macros/fmt.rs
+++ b/rust/macros/fmt.rs
@@ -1,96 +1,109 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use std::collections::BTreeSet;
+use std::collections::HashMap;
 
-use proc_macro2::{Ident, TokenStream, TokenTree};
+use proc_macro2::{Ident, TokenStream};
 use quote::quote_spanned;
+use syn::{
+    ext::IdentExt,
+    parse::{Parse, ParseStream},
+    parse_quote, Expr, LitStr, Result, Token,
+};
 
-/// Please see [`crate::fmt`] for documentation.
-pub(crate) fn fmt(input: TokenStream) -> TokenStream {
-    let mut input = input.into_iter();
-
-    let first_opt = input.next();
-    let first_owned_str;
-    let mut names = BTreeSet::new();
-    let first_span = {
-        let Some((mut first_str, first_span)) = (match first_opt.as_ref() {
-            Some(TokenTree::Literal(first_lit)) => {
-                first_owned_str = first_lit.to_string();
-                Some(first_owned_str.as_str()).and_then(|first| {
-                    let first = first.strip_prefix('"')?;
-                    let first = first.strip_suffix('"')?;
-                    Some((first, first_lit.span()))
-                })
-            }
-            _ => None,
-        }) else {
-            return first_opt.into_iter().chain(input).collect();
+pub(crate) struct FormatArgs {
+    format_string: LitStr,
+    positional_args: Vec<Expr>,
+    named_args: HashMap<Ident, Expr>,
+}
+
+impl Parse for FormatArgs {
+    fn parse(input: ParseStream<'_>) -> Result<Self> {
+        let format_string: LitStr = input.parse()?;
+
+        let mut args = FormatArgs {
+            format_string,
+            positional_args: Vec::new(),
+            named_args: HashMap::new(),
         };
 
-        // Parse `identifier`s from the format string.
-        //
-        // See https://doc.rust-lang.org/std/fmt/index.html#syntax.
-        while let Some((_, rest)) = first_str.split_once('{') {
-            first_str = rest;
-            if let Some(rest) = first_str.strip_prefix('{') {
-                first_str = rest;
-                continue;
+        if input.is_empty() {
+            return Ok(args);
+        }
+        input.parse::<Token![,]>()?;
+
+        while !input.is_empty() && !input.peek2(Token![=]) {
+            args.positional_args.push(input.parse()?);
+            if input.is_empty() {
+                return Ok(args);
             }
-            if let Some((name, rest)) = first_str.split_once('}') {
-                first_str = rest;
-                let name = name.split_once(':').map_or(name, |(name, _)| name);
-                if !name.is_empty() && !name.chars().all(|c| c.is_ascii_digit()) {
-                    names.insert(name);
-                }
+            input.parse::<Token![,]>()?;
+        }
+
+        while !input.is_empty() {
+            let name: Ident = input.call(Ident::parse_any)?;
+            input.parse::<Token![=]>()?;
+            let value: Expr = input.parse()?;
+            args.named_args.insert(name, value);
+
+            if input.is_empty() {
+                return Ok(args);
             }
+            input.parse::<Token![,]>()?;
         }
-        first_span
-    };
 
-    let adapter = quote_spanned!(first_span => ::kernel::fmt::Adapter);
+        return Ok(args);
+    }
+}
 
-    let mut args = TokenStream::from_iter(first_opt);
+/// Please see [`crate::fmt`] for documentation.
+pub(crate) fn fmt(args: FormatArgs) -> Result<TokenStream> {
+    let FormatArgs {
+        format_string,
+        positional_args,
+        mut named_args,
+    } = args;
+
+    let span = format_string.span();
+
+    // Add inline parameters as named arguments, so they are adapted appropriately
+    // Input: fmt!("{name}")
+    // Output: fmt!("{name}", name = ::kernel::fmt::Adapter(&(name)))
     {
-        let mut flush = |args: &mut TokenStream, current: &mut TokenStream| {
-            let current = std::mem::take(current);
-            if !current.is_empty() {
-                let (lhs, rhs) = (|| {
-                    let mut current = current.into_iter();
-                    let mut acc = TokenStream::new();
-                    while let Some(tt) = current.next() {
-                        // Split on `=` only once to handle cases like `a = b = c`.
-                        if matches!(&tt, TokenTree::Punct(p) if p.as_char() == '=') {
-                            names.remove(acc.to_string().as_str());
-                            // Include the `=` itself to keep the handling below uniform.
-                            acc.extend([tt]);
-                            return (Some(acc), current.collect::<TokenStream>());
-                        }
-                        acc.extend([tt]);
-                    }
-                    (None, acc)
-                })();
-                args.extend(quote_spanned!(first_span => #lhs #adapter(&(#rhs))));
+        let format_string = format_string.value();
+        let mut format_string = format_string.as_str();
+        while let Some((_, rest)) = format_string.split_once('{') {
+            format_string = rest;
+
+            if let Some(rest) = format_string.strip_prefix('{') {
+                format_string = rest;
+                continue;
             }
-        };
 
-        let mut current = TokenStream::new();
-        for tt in input {
-            match &tt {
-                TokenTree::Punct(p) if p.as_char() == ',' => {
-                    flush(&mut args, &mut current);
-                    &mut args
+            if let Some((name, rest)) = format_string.split_once('}') {
+                format_string = rest;
+                let name = name.split_once(':').map_or(name, |(name, _)| name);
+                if !name.is_empty() && !name.chars().all(|c| c.is_ascii_digit()) {
+                    let ident = Ident::new(name, span);
+                    let expr = parse_quote!(#ident);
+                    named_args.entry(ident).or_insert(expr);
                 }
-                _ => &mut current,
             }
-            .extend([tt]);
         }
-        flush(&mut args, &mut current);
     }
 
-    for name in names {
-        let name = Ident::new(name, first_span);
-        args.extend(quote_spanned!(first_span => , #name = #adapter(&#name)));
-    }
+    // Wrap positional and named arguments with `kernel::fmt::Adapter`
+    let adapter = quote_spanned!(span => ::kernel::fmt::Adapter);
+    let positional_args = positional_args
+        .into_iter()
+        .map(|value| quote_spanned!(span => #adapter(&(#value))));
+    let named_args = named_args
+        .into_iter()
+        .map(|(name, value)| quote_spanned!(span => #name = #adapter(&(#value))));
+
+    let args = [quote_spanned!(span => #format_string)]
+        .into_iter()
+        .chain(positional_args)
+        .chain(named_args);
 
-    quote_spanned!(first_span => ::core::format_args!(#args))
+    Ok(quote_spanned!(span => ::core::format_args!(#(#args),*)))
 }
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 24f96feaeb34..730607775a70 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -277,7 +277,9 @@ pub fn export(attr: TokenStream, input: TokenStream) -> TokenStream {
 /// [`pr_info!`]: ../kernel/macro.pr_info.html
 #[proc_macro]
 pub fn fmt(input: TokenStream) -> TokenStream {
-    fmt::fmt(input.into()).into()
+    fmt::fmt(parse_macro_input!(input))
+        .unwrap_or_else(|e| e.into_compile_error())
+        .into()
 }
 
 /// Concatenate two identifiers.
-- 
2.55.0

