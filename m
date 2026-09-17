Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0CC215F42
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621913; cv=none; b=GhfFTdUtVeIYOT5lD/axLnq1m6/51gtIamfYPNmKTcS+kM9ugOzHDU3tm87wWPq1erfBfGo1JXa4n2IjGw66Q3LPzXIO0LyORm3Wg75GVkahB8/dlYW8oLp9vz1O8qvF8ULlKc6oYvaHtZr5PSdR4YcAT783pXMYFKE2OdbQjqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621913; c=relaxed/simple;
	bh=lb3pRdnJwvfKxjycac9VSWS+N55zVAR+aC6hInMK9DM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Hp8fFR1Hv8MgfCcUkm3Ed2U7qcE8o+UidvVPXLPpKlMuFZ9Gg4sZADDIvQ5J5B+aIys9JHrlFO0mMqlcQoF+Az9wmRJsQXsWDSR8H6Q8jFDHTbhuE96AnQ4kjV+z06vJFeQgyl4G5K73JF5FfxWxN2NcTEF8z9Vf9KCKyrjjyJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jnz2jPNa; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jnz2jPNa"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb92868263so424055a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789621912; x=1790226712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E9NMH99NXee9RAT13HJNCvuiZE1KlOsS2HDmn9ZS64k=;
        b=jnz2jPNa9/nHYRBH0YNVfDnbHNlRh8VPRubTyFNVF97Z7SFNbzSRPMYGQ0fjlIxGCi
         /35POSa9Zn+sxuzvRloxObTUep4LZfiDDu/cEiw9AN3ga3tHPWQ2RzzAenj9/j5Dpr9u
         QRLIB1StWCScvnmfFmtxMVSKdyoeLpP0SRUwPxSPilRdHm+1ajH1FR/8+p/5Y7If/hxg
         nETuVL5MwV3RU5YJadX7zacF0XgHnxpCVJalUSrv2MjD4qXaeLNCJbI4Apg4Ki6C+cWE
         671nj3VTUsek5BdAZ4EN75tYLdySaLcKJIvhNyBZANlnTWQElTpecn1//e8+GgMpSaTI
         MDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789621912; x=1790226712;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E9NMH99NXee9RAT13HJNCvuiZE1KlOsS2HDmn9ZS64k=;
        b=WukpwqXon4/6tgiJaqooXbTEEZcTZTTeaRM9ZIIlcWFf0a2fNS0Iu8JgWdw8AjVyyG
         WyVd9mH2vC06vA8sYNECbJ63hCFjtTqbferfLbfL5YkOapDyZKEouIq0Cb9EU5uzD2Wt
         SPrP/vMwQk3q6W7FF/+6Ndc9sSi3O4yPjlb3rtVlOS1ChYSrPAKivxQrIhgQc/fRoZ7Y
         WwgRcqzn2koOWg7fKL6St8FxbGyNcpKbmxhz59OrYB3lJifVNSlTBMxJUqkkhgCjgTH4
         z0yhkbl6OOUi2Itghp3jcu/RP/L4TBPibmnVdJvrQHmh7I3FyQA7MgOlbm8jrlwJYsEi
         3tYQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8WRjcBsIRcZ3mKdPKF9ajfOIFD4/EvVAscWcFKYtVzOurkv6jMa6WBalRmzAa28Hc9JVrDyiXf8qfkbI=@vger.kernel.org
X-Gm-Message-State: AFuF++lhXdrOKw14Iy+Vzol3xJj7av8lJJ/vww0F1LlHBNMaqxyK+UL6
	n7CSEImVMxXOGgPz8duo9SgZEFtehrgXr/xdKxxKJ4x+jQiXRZG3lMsuaQm8TmQEs03i6f+ReXf
	Urw==
X-Received: from plss20.prod.google.com ([2002:a17:902:c654:b0:2dd:a02b:23e3])
 (user=tweek job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec81:b0:2cf:8131:75e8
 with SMTP id d9443c01a7336-2dd8e400f70mr111211735ad.13.1789621911630; Wed, 16
 Sep 2026 22:11:51 -0700 (PDT)
Date: Thu, 17 Sep 2026 15:11:47 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917051147.98775-1-tweek@google.com>
Subject: [PATCH] rust: macros: allow non-ASCII characters in `authors`
From: "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Module authors may have non-ASCII characters in their names. In C,
`MODULE_AUTHOR` allows arbitrary string literals which are emitted as
raw UTF-8 bytes into the `.modinfo` section, and multiple in-tree
modules use non-ASCII author names.

Originally, the single `author` field permitted arbitrary string literals
including non-ASCII characters. When support for multiple authors was
introduced in commit 38559da6afb2 ("rust: module: introduce `authors`
key"), it reused the `expect_string_array` helper that had originally been
added for module aliases. Because that helper enforced an ASCII check,
`authors` inadvertently became restricted to ASCII-only string literals.
Later, when the macro parsing was rewritten to use `syn` in commit
c578ad703ae9 ("rust: macros: use `syn` to parse `module!` macro"), this
restriction was carried over by using AsciiLitStr in `authors` type.

Change the element type of `authors` in `ModuleInfo` from `AsciiLitStr`
to `LitStr` so that UTF-8 author names are permitted.

Fixes: 38559da6afb2 ("rust: module: introduce `authors` key")
Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
---
 rust/macros/lib.rs    | 2 +-
 rust/macros/module.rs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 24f96feaeb34..ea2e232b61b1 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -129,7 +129,7 @@
 /// # Supported argument types
 ///   - `type`: type which implements the [`Module`] trait (required).
 ///   - `name`: ASCII string literal of the name of the kernel module (req=
uired).
-///   - `authors`: array of ASCII string literals of the authors of the ke=
rnel module.
+///   - `authors`: array of string literals of the authors of the kernel m=
odule.
 ///   - `description`: string literal of the description of the kernel mod=
ule.
 ///   - `license`: ASCII string literal of the license of the kernel modul=
e (required).
 ///   - `alias`: array of ASCII string literals of the alias names of the =
kernel module.
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index bc7027f8dbb2..0a7b9e24c960 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -369,7 +369,7 @@ pub(crate) struct ModuleInfo {
     type_: Type,
     license: AsciiLitStr,
     name: AsciiLitStr,
-    authors: Option<Punctuated<AsciiLitStr, Token![,]>>,
+    authors: Option<Punctuated<LitStr, Token![,]>>,
     description: Option<LitStr>,
     alias: Option<Punctuated<AsciiLitStr, Token![,]>>,
     firmware: Option<Punctuated<AsciiLitStr, Token![,]>>,
--=20
2.55.0.1082.g2b9226bbc0-goog

