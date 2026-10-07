Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBA63AAF60
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383623; cv=none; b=t2e5hhkbQrh+nUVgna6NO6cZUC6a9nETiGN5n6FiqdILG/DbbuHiBdCeTcRApoFeM0sCpQ+ZO4nXZWQVi+JCcoipjRoXkQwXukuINkyZGweH6ngMxhntzNXm8XYJqN+warF2NuWzYmlY7IwjRYjgiYBMHJM7Ol2CjYtC1f9O1zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383623; c=relaxed/simple;
	bh=EwUjmYnuQ//X9EKW/t4Q/ebxEsVXNeEj57No9Cid7CE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EWvJJ95PtjYDkHjc1j/NCUzwqrKLwYcW6x/IsQcAIsho0EK1nuwmKlSAks45mbshBJrTJ6qtAHcZIwByStnkwny9uP34xY7jGxB8219jdE8DRfltSfAb+OcaR9HO+n+LuIRBBOynnm1EmrVpMbOPAb50JoVLY2Pp1iQ45Hq+6AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EBU9mCDa; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EBU9mCDa"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6aaa3fa0bd5so5091576a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791383612; x=1791988412; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1MtxSCOR9kb8gOaLIm1mLFwbvU9p/enJ5fxVP9x/Ls=;
        b=EBU9mCDanFlVT2RLQurlgBw0biT3os3UI3m4c1SNTI69LXR9hdeH59oYo+iFQSIrF1
         B9iN5wsPRfiJeRFjlhoPiVohHFMYq7+ME5330/qXasGlnZ9NqS4dRz3HALddlHCFe30s
         xpH8Yc+XRcglz35yB8eJL3WtJlcwW3HUe08LMT3GqjYMMqW4/nLzEFEeAceZBJKfvRpC
         6p14b8LTnDhVSZ+2lX3wPdU4ta3NCHDEyM58QIITQ4CpYEZXf8/BBDrb869pJ6BwpHeK
         071Soo6ojoExOAYoX5mEzW3fPOtno4lQHKwGz3SIATxYEdspBIkjNwkpRmgqXDzSYb4f
         Tpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383612; x=1791988412;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t1MtxSCOR9kb8gOaLIm1mLFwbvU9p/enJ5fxVP9x/Ls=;
        b=gsmruHHuk5l4iRRPGpF1x79qmgC6NKiW403GZlM1PD8ZRiC+KAzn0L4yY0xnhpFgcn
         paCLeq08D2NMeDZ+NIRrYRFFJLVBFQ+86xT3bVULy2oabARpkNaxRKbthJz5fUdQj7gP
         P6JuYfzQwi9ZFF6qPyIeVdM2W8kMTQoLzVNzeN7owiDRmB42kJsTi/fKmt6Z0oWdEzV9
         64wRYOuaRo0/MrydMHF3wtmVbN456exoG9ppGDBSOOqgUvAFz4XidAFa03QEnlTZ3/8S
         RXrDNFUkPmEt4+txQEVNwsJWdDmqvk1Ydmlt11KYW8noC7OYx/uIq3JkmGTk0LAJxICx
         ZB8A==
X-Forwarded-Encrypted: i=1; AKwUvBywESIe5C3Jw09H3gbC7oWud/a+mlc96EdSPERDmf+gabPKFQdExRYpIwcleZXnYkhhYQnOMimUzmSDTvk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqX8y0cV6aZWdQvyR9QurYscyRsD6jkqurhzAzzFLAcNiZhuYu
	Yumk/bSesk7QrHOcIuG9rwrRb4EtbpK0zz1tuatkLT+KgRnZxSz/rWu0joY8mRrmHDDrclhfAXB
	w9v+tp02TKdBrbPGr6A==
X-Received: from edbbo27.prod.google.com ([2002:a05:6402:b3b:b0:6aa:eb31:a6ae])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2809:b0:6a9:a5d6:622d with SMTP id 4fb4d7f45d1cf-6aff37566fcmr2349429a12.3.1791383611997;
 Wed, 07 Oct 2026 07:33:31 -0700 (PDT)
Date: Wed, 07 Oct 2026 14:33:26 +0000
In-Reply-To: <20261007-binder-consolidate-txn-prints-v1-0-c1032ed3221f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261007-binder-consolidate-txn-prints-v1-0-c1032ed3221f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=947; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=EwUjmYnuQ//X9EKW/t4Q/ebxEsVXNeEj57No9Cid7CE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqxlg4N2C2J3dmbvISPAFSJz/jL6SjVqAecKYLU
 TdskIXwkYCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCasZYOAAKCRAEWL7uWMY5
 RnyBD/4972kT97XeAaE7W9GdyJ2qeOoQpORPdwfAfx8YxW8xpxgk9kApIm+ObR1X42vpHQaRvEQ
 nYwDZDHdRV6qQlVS/yKWAP8O5GVlOnr28D0HM5GX4TJqgtOWbPzsDgt3DUFYhbvZESPuCdt/Ymx
 Fqv6IpH2/Y3x09SM0EcgGljmCHyYFR/O6gztpRoco+vHXL7pJtXPHwNX8BNX7S6O7T4G2+hJ3Jr
 DvJAvFdSZPMuzYpv2xs95+dxuu8hbmv4PnAkMt33LX4PMLTgTZMip8Xe2DVaqo+beHKO1yNAgZV
 aSsugBA/UO23GubN5aVrpeRVO2fyM09zT1IPa9xGu1eW+qZ4gu4LFHDWsahlJHfnEvfiwpvC5DY
 wguT8axjOrPtfBLM0HXUA1mxISIRXsWB17GRd3vTPhB0/DHhsWTUEe/wShHOf55GdEbqxFKzn+j
 nEEuCGJMDnFHHfUFpCzKpS4gqvB6vhXqBltloc8uq2tx5064CmVsg2uKE08Pje82G178wh1QgRJ
 phjexcCSpnlRttIE26t33u4zlnhT2t7PqI/+tK7nF+iP7XZ8BjMgz0LzrvwhYSrHvIWC/1Duabq
 GYjC2FvOeArc3pk+jMqI4SaWxirtWCdx6xsSR3ZqjlqGkmQ28GfqvDOLI04aS53QbWyGPYt7cAU WyUDXOmpQ+8765Q==
X-Mailer: b4 0.14.3
Message-ID: <20261007-binder-consolidate-txn-prints-v1-1-c1032ed3221f@google.com>
Subject: [PATCH 1/3] rust: error: implement ZeroableOption for Error
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Rust Binder wants to store an Option<Error> in TransactionInfo, which
derives Zeroable. Implement ZeroableOption for Error so that
Option<Error> implements Zeroable.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/error.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index e52793f77196..81f32dc8715b 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -199,8 +199,12 @@ macro_rules! declare_err {
 ///
 /// The value is a valid `errno` (i.e. `>= -MAX_ERRNO && < 0`).
 #[derive(Clone, Copy, PartialEq, Eq)]
+#[repr(transparent)]
 pub struct Error(NonZeroI32);
 
+// SAFETY: All zeros is equivalent to `None` according to the option layout optimization guarantee.
+unsafe impl pin_init::ZeroableOption for Error {}
+
 impl Error {
     /// Creates an [`Error`] from a kernel error code.
     ///

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

