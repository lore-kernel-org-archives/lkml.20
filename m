Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412933D79E2
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756332; cv=none; b=gqsF3h+ic6U4rUwwXM907quas20KFH7zwJZWcKpDiBI8LZSGVEIN3ppZZJO2zw69HTVR8IhWop5aE2uQXlLy9I1jHHOJ2zXwjlrD9nF4IL2CZq/kkTyTyvMm0X15o7oowxqLeW6+B5IaeAaq4UZCTfRi6jBTRlvFmO2rrJkjkzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756332; c=relaxed/simple;
	bh=qBLB1wTJZ/6KP7t9g/JMwKsYPovFh4gKeKF9tIbo6iw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjP8LjkA0jta5v3Nxuy+RHjQYA2gcCy+j/bfnZruZ5OL3+/YDhPI3DG7uRz79MlkBXOAS+B+5reYmg5yAmMfJx0wG1TJyEZtxErAHbjeY1gsu74Vjs8Qf1zStGdtTT0P1JbdC8YKlorrDA4yLmifpL11Hg4HCTILH1ZY42hIQvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTaWbPjA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTaWbPjA"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482e2904915so569412f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787756327; x=1788361127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ESgYh6ZftCel+XEMzHlNChNKC5IMTGij4jJbzjOOzk=;
        b=FTaWbPjAlKVdDsN2NIQrtxH6soT2/qusQpYDo+xF9gH9UweyNmOweu1SZFn1v/iUmx
         WrmwRWuhjzhg+xYWuT0CPaNZiGV91m1VnNPm5IDTpLGyOsYNysx6ShsejO+7lyW6wiBn
         T6TnKJsY1F98jtJMk5xmiGSFNvLBu0bF0s58da9mGdDmleMBPj9XshVjpcf3m7cSNJVi
         xO2xD+Ngnc45It0neZr0vZ9JuPlEf+dFe5kvFe+GcTpY3jAPFO+FgmI7i3vebrszhl41
         ij84j0DTTDNMHjYhqsptvQ+TPN1QFiw+B90ZaSOp2bojg6bx2WY8DLv7gb/Pazb/KxLc
         u90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787756327; x=1788361127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ESgYh6ZftCel+XEMzHlNChNKC5IMTGij4jJbzjOOzk=;
        b=QRXhnLqokdHJuqxg1d3d3lAW3Ulwjzwbd2y1HSSyfqhWomfDYgsU5u9T18X97q1DhN
         7dp5QbRb2p5t4l0CNJGpteubXVsXD1SdFbfBFt1PPH1VvewbZ/kAG2Mr39ZAoTA6G0Su
         rJzKEdem5j2AxGHiOM7N78I3jFmM+N4Nn/VCfZUICkxvs28R/fP9osIf3/bS+p6yr648
         ZnFzERD9sLblrykTCpiGc4l0v+9XVevWG1HABvRFTsnmcnbTbgQ827H6YBfdrVbhcKmM
         52/Aw/UPu7cuSaX28sv5hayqOF2V4n/NmYvNny/RL+FLU66ufQsmaOmvcoVNEknq20am
         WXUg==
X-Forwarded-Encrypted: i=1; AHgh+RrtExKW2BkxrOTCXuuqHqrFGP0jqNW9h6VaShNN1Rlwal7fJq+YKnIme5FLV8X0jTXdY+LhdsUEPKNilwU=@vger.kernel.org
X-Gm-Message-State: AFuF++kWdHoGGOQIBdo3DwYo06aoL87oDouWMUyqWapxJT/iDTU5TQr6
	mxKiK0aD8gn7d1whNb1pvfXYcUokANeDsJNL+EJoKrsK0dQkbg25mINU
X-Gm-Gg: AR+sD10mwbVO7wR3SoDLRgSNNQMgU0lfDmvUDwqLcqRrxg+6OKAKhoquo14kTlfK43q
	JOAyaETbW63I6OaNWjZiXd5MWtopZuomubCXEUEKbiUJrzCY3ij8RZ0/1TvpsImuqeOPqjIIkNW
	4oSFKG7zsCjG6G24ThQVZvbqnEb6zc65OyDJzFnKMbIysfZaZsW9hrUEeTfII1Ir1FXBt+ulyfz
	lxj3Wp/G3C9NZ1kCboB/xuv4sx7I6qPpPzKO5OJmtQSEnw0WNphSB38KHPl7VwTDXDgUVdVnxrj
	khIWpnMF84peqTyWGyFFFs2PxtMwIgbdFjVfpKpOv8AT4M8w7Vd7wKkTVmH2TyJyT9zN5z5E1j0
	bBid8fPt7pnprq7818Krxgq5Wg0FYgYN6xhETvW5y+RUgJSx/pZIrB4vPT2NdhPAmjJI+u67k9b
	sZwjQiueF6PobsPlruzZb1CBWhxVQqbwtZHSEHZJrRYVTO+K+nXg64nWz2YyrwgKFij/smb4fdr
	+A9X6XWHNIriY9hwpZoCwK4ZbvJAEy/wacgDP8jdQ==
X-Received: by 2002:a05:6000:22c2:b0:482:e658:bb7f with SMTP id ffacd0b85a97d-482e658bdafmr3594386f8f.15.1787756326828;
        Wed, 26 Aug 2026 07:58:46 -0700 (PDT)
Received: from MacBookPro.lan ([2001:861:3dd1:ccb0:7ca4:98b:a443:98d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6917sm2935144f8f.35.2026.08.26.07.58.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 07:58:46 -0700 (PDT)
From: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
To: ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
Subject: [PATCH] rust: zerocopy-derive: Remove the BoolExt trait
Date: Wed, 26 Aug 2026 16:58:32 +0200
Message-ID: <20260826145832.42387-1-elouandacostapeixoto@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FIXME comment was saying that this needed to
be removed once the MSRV >= 1.62.
The current MSRV is 1.85.0 obtained by using:
`scripts/min-tool-version.sh rustc` command.

Signed-off-by: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
---
 rust/zerocopy-derive/util.rs | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/rust/zerocopy-derive/util.rs b/rust/zerocopy-derive/util.rs
index 5c5e9d3bdcb8..47aa9f78bd4a 100644
--- a/rust/zerocopy-derive/util.rs
+++ b/rust/zerocopy-derive/util.rs
@@ -713,22 +713,6 @@ fn only_derive_is_allowed_to_implement_this_trait() {}
 // The `#[allow(unused)]` is necessary because, on sufficiently recent toolchain
 // versions, `b.then_some(...)` resolves to the inherent method rather than to
 // this trait, and so this trait is considered unused.
-//
-// FIXME(#67): Remove this once our MSRV is >= 1.62.
-#[allow(unused)]
-trait BoolExt {
-    fn then_some<T>(self, t: T) -> Option<T>;
-}
-
-impl BoolExt for bool {
-    fn then_some<T>(self, t: T) -> Option<T> {
-        if self {
-            Some(t)
-        } else {
-            None
-        }
-    }
-}
 
 pub(crate) fn const_block(items: impl IntoIterator<Item = Option<TokenStream>>) -> TokenStream {
     let items = items.into_iter().flatten();
-- 
2.55.0

