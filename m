Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C28348C6D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895083; cv=none; b=UOlV+1r5ASWm7rB8UcWjMJvykDMs3drefEgXA4oloyXeiuZuwXy2cDGgDm46LCIA10zrO3y7dQiKE66EvpOjOqRrQlURTJrEMiHOQp0yrMeSTOWP2ZLWfoZHYULxV3qzVfpPFdF2ozFHBwL3u4RlE3lcf5a5F/8gpF/e5lwQ2ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895083; c=relaxed/simple;
	bh=iowhCacAK2V4dX8SDv7KjqwhUjEA0e42Z48+3/gEqvI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RKP25OVQJYknv+mKFxpgT3DWNlq3Nlc8rOheiLCaUCW2+wpeE9Ky0ivfS/KeJh3EB8tMBSRhkd1ACOUVMYew9WY02iIDe33OGBvpooqSfJmaTzSe6yvk3LjdrXhOsYeqofkXaSsxgz1KNCaeYog178XflYRqTnMcVHLVgJnV97I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CmrcVk9t; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CmrcVk9t"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a19df2328cso26592105e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791895080; x=1792499880; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZSwHr1dc/2t65+3ouAeLrzr/54Ej8/Nu3EILLvl0ys=;
        b=CmrcVk9tdkAny+U20n2XKrUT2T1Zm6jrDgjARANGTHev/KR59040crOdcPzH2UfkKn
         ebo8J+vv/jvG0Z9ePxNmMDP+7k8nq7GcGQ2qFYZmcAB+xMJrxXewGW9opCOB6Wivujeu
         3qeosbcZWP7dbo0E7Hj/yEPorZTouEkq+Z1DYeKTX/DaI9OBPh3/yZ9gYf0sSRLrEKGP
         MV9hoZs+3gtSZiM+f/seXZZ/qdhQAZm0NnA0jdZWknx+fImBuxL5AACMBG+aBX28TTzx
         H1f2inZHRYilh9j0itfGxbnLBTgsMbv0ZV1ha0FN6GrtjZBnLaUY7T0+DbFASZQ8V/c4
         p1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895080; x=1792499880;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZSwHr1dc/2t65+3ouAeLrzr/54Ej8/Nu3EILLvl0ys=;
        b=1q74C/kG1Hb/NuZ/eomEipK0quPPoR16/q450ISX77L5ZJASJ+Re6X0jS/Luca3oab
         2i0lCdEFNCzQiP7ctRI07+IoccIKUgrYz1BS5SNaG+lW5B9NaBX7yBuWWkgE+d5Zv2uu
         sTf+qpp9zsw7wfcFFio2lZlgId15nHQnnfthnQCIs8hNqVSJpUz/T4Yj6k1UAPGpXCuD
         pPNSX72wlc1bOkQfOL+cEceZvfrWAlOYubCKm9V1c0aKBVjiLDuuo09Sf3j2tpu8UcqC
         fyl8VxqXylCVuAjAIXQrtDxbmuZ7P7TzHJj2/j2IhitKzLuwh2FhEprclTJh20SQ8+m2
         Yh2g==
X-Forwarded-Encrypted: i=1; AKwUvBxmql0xA6Y7pfF3kde8cuJuPm3C40unXsRlQcuIztsydKOkA+BFIDvHnqdADpvwIg/EPVQzyQVjNhYDkqs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJONgVInMm13YxDdSxU6P2YUn/hH7Jfh0uWnSiFvaWUrqFD3VMs
	Yj5ClwA5rIu7eQFgI1Cuigmkuoy1RZJ2L4zky7bIERJ9zE8pY2A8i6YnbsJAeZzn+eycBIdz5R6
	yEPYcVP6/p/fS6Ud5Rg==
X-Received: from wmog7.prod.google.com ([2002:a05:600c:3107:b0:4a1:8dc9:744a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5391:b0:4a1:ac66:6ac8 with SMTP id 5b1f17b1804b1-4a1ac6671c7mr37454675e9.4.1791895080202;
 Tue, 13 Oct 2026 05:38:00 -0700 (PDT)
Date: Tue, 13 Oct 2026 12:37:55 +0000
In-Reply-To: <20261013-binder-consolidate-txn-prints-v2-0-cf78927dab23@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013-binder-consolidate-txn-prints-v2-0-cf78927dab23@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2789; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=iowhCacAK2V4dX8SDv7KjqwhUjEA0e42Z48+3/gEqvI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqziYj8TJIYQl2pxY+fbHRHM0GIVONcWTpaNLAp
 ppJ0dnfFQWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCas4mIwAKCRAEWL7uWMY5
 RvQHEACNoXZiEwD2Kzq8rxiL9RhRrtgJKWsHnP0zVEgZvASV18KUExmJkt6+wW9wfLPKOYtKpgo
 CHfunQQgHhiGYsavklxyV9zkEiNdh5sJS7L/lOe44LTFWgQftZhbx3Rficar6wlbHXF88xckOO5
 55udFeSaHyS1oPK9Kukd5qiMYEZJVpOPcuPHhdAwRYyzYk7qyf10CWr8g8pidzrITMMM1UQrV6B
 C1+ACuLBKp+bpvUICNVLvxYrWKwne9MNJQwIVsIET+4W9AIwjxSb/dbDU/FKvBdeHtVA5PFOEjy
 bM9eIqhd4Ib5q1h4SFetgYO35IxXtvI72Se2H3qvhPXVmd/x2kR+5ogupjsHuesneeAepBVyfpQ
 eyRzoftnzKBGuaaw7Uco8Llk9UXh8stICrtXnREaJWhlRO9nrhLhsXRlejw6qYn/haydtzDSixL
 d5LnSEkPDjHhBVioiVqPzP3vlYpwqGkheoE6McTOzmHD6lhK5XEBZkpXk3qHIjA6cs9q9A2nwLI
 c6Nt3k3hlgUffBC7jz5y5zMCVivL0xWqzVHi9y23eYT393M46T9uh7RjmkJQlFG/+xamfVHe9VD
 xYue1Sa0vh42EG8yyYANlDeHmjtwvAnj4N2ex4v/Sa9Q4aV6mb9oOEd8aw6u5PTxCgTbWG/7nsK nuY03LNCpmMekiw==
X-Mailer: b4 0.14.3
Message-ID: <20261013-binder-consolidate-txn-prints-v2-2-cf78927dab23@google.com>
Subject: [PATCH v2 2/3] rust_binder: store Option<Error> in TransactionInfo
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Store Option<Error> instead of a raw i32 errno in TransactionInfo so
that the Error value can be used directly when formatting transaction
failures without having to reconstruct it from the integer errno.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/thread.rs      | 6 +++---
 drivers/android/binder/transaction.rs | 8 ++++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index e5ae3b0e56c5..5bb7ae2f7920 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1333,8 +1333,8 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             if err.reply != BR_TRANSACTION_COMPLETE {
                 info.reply = err.reply;
                 info.error_line = Some(err.line);
-                if let Some(source) = &err.source {
-                    info.errno = source.to_errno();
+                if let Some(source) = err.source {
+                    info.errno = Some(source);
 
                     {
                         let mut inner = self.inner.lock();
@@ -1476,7 +1476,7 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
             orig.from
                 .deliver_reply(Err(BR_FAILED_REPLY), &orig, Some(ee));
             info.reply = BR_FAILED_REPLY;
-            info.errno = param;
+            info.errno = err.source;
             info.error_line = Some(err.line);
             err.reply = BR_TRANSACTION_COMPLETE;
             err
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index e627522141b8..d934c6821b15 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -136,7 +136,11 @@ fn new(info: &TransactionInfo, ctx: &crate::Context) -> Self {
             offsets_size: info.offsets_size,
             return_error_line: if failed { info.error_line } else { None },
             return_error: if failed { info.reply } else { 0 },
-            return_error_param: if failed { info.errno } else { 0 },
+            return_error_param: if failed {
+                info.errno.map_or(0, |e| e.to_errno())
+            } else {
+                0
+            },
             context_name,
         }
     }
@@ -254,7 +258,7 @@ pub(crate) struct TransactionInfo {
     pub(crate) offsets_size: usize,
     pub(crate) buffers_size: usize,
     pub(crate) target_handle: u32,
-    pub(crate) errno: i32,
+    pub(crate) errno: Option<Error>,
     pub(crate) reply: u32,
     pub(crate) error_line: Option<ErrorLocation>,
     pub(crate) oneway_spam_suspect: bool,

-- 
2.56.0.385.gd3acb90ef8-goog

