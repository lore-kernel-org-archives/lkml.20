Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA26D448D03
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761766; cv=none; b=qGm5T/RTIfH9DoF2WVGfGp3HZzICK5S6RhKcLC7d9PngkNNW4haaKzDNi/0FdQEsQ1dcYxmd4zWGe/0t9maxw00ClTv3RrtSn8atlUfDEZ4aD39gkN5NoVjaE7W3JLPOBJ26rLV9YYWf3Khs3u87tm5vOA8NEYbQhB5fK9YLKJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761766; c=relaxed/simple;
	bh=kaKGfr6FnlUUXMw7q4gsuwa41L12YQBpbpijnRDMLnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGjec5JNWCpJML68unOoQAXWN//3K2bn99cKXGXHcVjC+PCn0fYbIXH1TdXq8TzWYsV31ocRRZdH7zEFL8cpwnca5/n+FAl/W/K1tR6hm0QJECV6nZNJQxEAwHnJlGk5PPsN/3wn+e41GcZ6JUCuBgDkPk4KRwpn23Q2+XvfJ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=Ff0HWLBV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="Ff0HWLBV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49557167508so9211365e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761761; x=1788366561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4y5RuZrNPnm2kHL6KGCg8G4oIv2nEgMkNhrs6LFEUZE=;
        b=Ff0HWLBVFW+NeRh6lgXkr5MZ7OQQit5pQm5c7Fikcrys9Vfb/ZKYCZw06CiA6wJFio
         /Ep3RNeh8TGySIlsuJVBmB+2x9fL+Zctf7FnBEKUr17UVeC3K+VWHZXWx11Si8wxIIpn
         UJphPcEaj3953XAyCeAfTQtgbcJ/7DlAKR5z1KNLcxTuqFFQ3D/8g7woBb8O+l5YpNfB
         vga0QcHK0WhZ03RdaNwLTHVlkOlbBQdxzfgNSYScsyXIzuJYiofOTjb4vUeUcZo8KC/X
         a5t0i38E4TlTRNcviz4bTbexXt2hdvRYUYcTJRnP+Xadvn3Aa7TIOVkdGwPBUKrJQWgx
         Q3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761761; x=1788366561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4y5RuZrNPnm2kHL6KGCg8G4oIv2nEgMkNhrs6LFEUZE=;
        b=NgkZ98+jdzFzC/gqYR/7QzTCmA7atl5okTNtBbEmjy659FiVz1vtd2dD+BG3+tBBL4
         8ZaLBkL9EmVazlE88T2zuahkFleGhcf1XFtdLUKQ+j65gS2Rsr9cHxADzp8bDgPNCHK/
         dEIv2szrlfvDQbR/LL2Ql17sliDIp+OWTr6JTaji5SqGIQm9BTlmY6cTMm9rDGet5VLP
         zLyNGzkQy9SKfegqNDakfb0smipzCGwj+nXpXFDoNy2V9FP70pAcEUCqym6Lbp5Cr5D+
         LJ8dA2S2CtGKmUhyXQ5O8mfL2iBQRC4dKAXptSRBxJSteaLmtyadkjROMncjW4nS5/hx
         DOXA==
X-Forwarded-Encrypted: i=1; AHgh+RoFShXwSMuH3Fsz5bR4fZuBTzQTiEDbeZcS0rCHRuT01S6ojbh/HEyqG4SRYx+GeBsn/MYb8+JoYvS/GWQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kNhoVfMRWAcl1+r/aebI0vzhB8fSknBR/7KjGaJ09YSPzgph0D
	LervdcPbA4IzK1AldBcvIpqe76lvJ7SPq4zEUbMZJoD710RhB3nTzFmHToSaSzMcVw==
X-Gm-Gg: AR+sD12/GJznucKfDvQjkE+LsVxYd9iXShaJ8y+FpD4uKUkvHmo23BgSQOpT811Zvhx
	unuVdA85hYpv1cFUjOCZPuc9AEhP5GBHqBy8IjGsz4AQlIPPpMIg3Jw2KtSgN1/FAeVGuxCCuXE
	d8J5ydSrz0taLmXBSbde+dsLHeArUBDujts8lBmCo132aLa8oTtUcWDafJe0+pphOFA5Z3ojynb
	wWk5lIroZT7PjMdYxg0WnloGnhI6F3bJHrDq2eX2U/NhlWedF1ZZCJ0rSnnQwXPG315maMlBRKV
	/WAmaGdbgj19NLKsGiv9yb/+lgsnG6UOrMbCMgkmWgr+yBNEfYEUEb0PFMsCrJIUmFrLpoTGgvk
	hmsxA9kd8xrOsXBmUA5klfPd4i5WqC3TdPmD7gBPoi141cqEXgSh57p1QG8g6D8srDeKvSPRTZb
	44aWptPswtNb0fvOMVz1oOafjxXq0t02dWTeZk6Sh8vNdYL/CT7q3ccRYCQuwjZEWHtQ4qnvFNS
	cAqprRYGTQKB98t4dM+V/YBVHFinvHIKWW+
X-Received: by 2002:a05:600c:1382:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-499dc70b76dmr68755785e9.7.1787761760744;
        Wed, 26 Aug 2026 09:29:20 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:29:19 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Mirko Adzic <adzicmirko97@gmail.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Daniel del Castillo <delcastillodelarosadaniel@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] rust: error: expose EPROTO
Date: Wed, 26 Aug 2026 17:28:42 +0100
Message-ID: <20260826162851.2497-9-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826162851.2497-1-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the named protocol-error constant so Rust protocol drivers
can return the same specific errno as their C counterparts without
constructing it from a raw integer.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index a56ba6309594..9492471c2677 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -64,6 +64,7 @@ macro_rules! declare_err {
     declare_err!(EPIPE, "Broken pipe.");
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
+    declare_err!(EPROTO, "Protocol error.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
     declare_err!(EMSGSIZE, "Message too long.");
     declare_err!(ETIMEDOUT, "Connection timed out.");
