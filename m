Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202620;
	b=owqyHEe2LilNBHUXdQbrRcM/DSGkvIwDT+yaTOLQnWrgmEK3KCaE+LFgB6MRg9O1h/s6
	 E3RbWt14D6XR/HH0iSiE8yUQnRN5mbcChKgj1ithbNtzutKjMyYReeld/4aTK95X+FmCi
	 Cy/LWkdDOyKdWSKyYa8yu4iShCr/SK7PMT1+SXVPxVowpEMEDaqFSaPHSC/5pXuUBtmsL
	 zc9JG9tWwh8kRTDe/5XXEpAODUnTkK7NnIcGffMOvDzrxjbFcv/OQTD2+B2KITgKAudQp
	 JURphIykfweAwg46YuaermazMvFj9O2mRiFoT143rlSENXlA+Hz+tJQllZqHkP3qUlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wj4LX9xOsHpuGRygOr/nDK8i03h77TPrsXBsHHo2CzE=;
	b=p5A/5zNrzBMas+Di4XZAFPWgAXJIP8ExGC5yipiwHZbuN0komvVXv3SextldFJoiJ8o1
	 sVMraPbfQSnoVtPXB7R53BrUK/r26gBtSwpWDvCinpjAADgnNaROKh5v0GYjRosRTWM+U
	 Tcx8Uolw2m6qL+Qg3TxgHJ/9dEXxQE4EUWCJXr/7Zdh8y8Grci/wdHY9nbvdMqfxeOPYE
	 EA6JexQ74OAn96oTWvPREc3HF4S+dDcXtz/DF6GWMf0PCAb5xWDnckzu0neh8CRvW47Li
	 yUliN/ZiLqVqNEZiymS557T3PH1YShxdYrOidq/r3MbPMgnuyJ/PymP5khCRGBq5VUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L3gP8nyH;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA46F606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA46F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L3gP8nyH
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso1374828e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202618; x=1793807418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wj4LX9xOsHpuGRygOr/nDK8i03h77TPrsXBsHHo2CzE=;
        b=L3gP8nyHEpt7c0+mIxQ4RE0XFyRCO1UWhX6RArQV5e67OLxg471Fdc/XET1Yu1ILQT
         Q6iKZ1OgUaRmQtlh4i2mKr7l/f2l602LAkSGYOvjK9vDRVLOmbqZLS3xOij4o2srjPFq
         PU/wglL8p4fQxbbWhbxRERoDprueyz0T4yBdcAgG7VUDSie4QeGTlyqISmaB3bUix0eJ
         4yE7ohInOuyfj8YnxkW4OaOd7FaZiI/tl/oLRnw2uLfNbrHYfSsEaphe5v+017JWijzi
         TNtEUKG2nCH39y44cB5F5TZ/M2K8TvBGllYGJVjWSUxD9D8GsPoDOUMAVX8JYgpKiP9g
         V7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202618; x=1793807418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wj4LX9xOsHpuGRygOr/nDK8i03h77TPrsXBsHHo2CzE=;
        b=GnUqZLpANA1C0AqA4aGsmLYnlqZAxOVPIgRkkh40pcoCDzHx4xza/6muWwJuBhtVA5
         PD6LAnEJYucLu0+eGe8Nq6mlshVO3eJUWiJ1LrQgFnEfJ6j2wlyxld3NduMfuQXc8otl
         ZJy5mh9xkrX6bSMktQa1fWa6RzNaMenU+P+dMxsNgfgRwpy2/2fDbIwYsAHPEyUtC22r
         TupNJmDP4k6DznTNqJ07V8ydY135smCAIabRQTFeaHIR91ESzxc8Me/zx/GfMFV4MWt0
         k3x46UxhUuDySSoG54w71fN5s+iu4VVM0u9XC4EahT+9w/oX/xmRxtLLeqdzlI14JGCp
         27yw==
X-Forwarded-Encrypted: i=1; AKwUvBwZ3rksA5RVSaAGQ+ylgBTutMS4vJ7Tdmx3Don2zt7tXu6VSFZVy+vlKWIFC3EMIrsPonv0EsoTTXAbYEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPJhgdfxwGDZRM1RN6vky+AiiaINi4GHsdgotUDy1dZH9x4rCZ
	CgyWz5vzvPzbWjeGSKZVjcb0OjfNxaCsy2TqmlbCnsxcm70SYL/kjeOD
X-Gm-Gg: AYBFou1O0Vx3WoFm/jOROilXaKFGFHrlLwg6uzM7o4ML/YBrTdM+IpMGB9j4bj8Ifx0
	bf02/6AAYkykg57sFDndivviCJlamiIlxERdvGrGqnAxKf2NTtDjYCHn166kGp6fFic8yw0gdD3
	UUfk+icuq5cNz0uIKN6fbzsI0II01Uv5Tik0LbOAmySFh1qoNlDfjAmkM+iRs5ziyESHvlk0/JC
	qVYu66bcGbvagX6Io9WDhvuMaishlXQeYgkqc8mALgRvyBEuE6izNprNbweDnFEJkrsvrwJyp5R
	qULu1UdsrX6GMN242b/YgxbrtAJuZvwJF6UVa4FdArehUrknKCK2I86Hin6cHftZyD/Nh/svdmF
	gIAUzOjn829+l7YZeqKs/kgY689JVhTFDhu4cuPMI1/Zxiuc47IBa4qTtP47OBlrbkct3yQ5nwO
	VjaQXI7limKgR0/ubAr7QmQzLtQDgDi4Px54B1o33eaqjxSoF+O1x/k9UUb1EaZjxcd+cBNMruY
	K+KgwWHqwyA+mHsWKd72cFiHSunllLndFLsdJIzsZuMCZsTUB8zJXpN/bCmj0h0U0dkVpoUp4TO
	eOYegcOupGGjy4vxzgiP/IWkZ0vPh/WOOl4G1A==
X-Received: by 2002:a05:6512:a83:b0:5bf:b93d:a85b with SMTP id 2adb3069b0e04-5bfcad893eamr1077228e87.25.1793202618007;
        Wed, 28 Oct 2026 08:50:18 -0700 (PDT)
Received: from archlinux ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca5c6ffasm694002e87.80.2026.10.28.08.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:50:17 -0700 (PDT)
From: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
Subject: [PATCH] rust: macros: document emit_base in ModInfoBuilder
Date: Wed, 28 Oct 2026 17:50:05 +0200
Message-ID: <20261028155005.174417-1-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the emit_base method within the ModInfoBuilder
struct. Explain its role in formatting metadata strings, handling the
differentiation between built-in and loadable modules, and managing
linker sections and conditional compilation.

Signed-off-by: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
---
 rust/macros/module.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 0a7b9e24c..6f361013f 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -49,6 +49,16 @@ fn new(module: &'a str) -> Self {
         }
     }
 
+    /// Emits a single metadata entry into the module information table.
+    ///
+    /// This method formats a `field=content\0` byte string and places it into the
+    /// `.modinfo` linker section. For built-in modules (`builtin == true`), the string
+    /// is prefixed with the module name (`module.field=content\0`) to avoid naming
+    /// collisions in the final monolithic kernel binary.
+    ///
+    /// It automatically generates a unique static identifier using an internal counter
+    /// and applies appropriate conditional compilation attributes (`#[cfg(MODULE)]` or
+    /// `#[cfg(not(MODULE))]`) based on the target type.
     fn emit_base(&mut self, field: &str, content: &str, builtin: bool, param: bool) {
         let string = if builtin {
             // Built-in modules prefix their modinfo strings by `module.`.
-- 
2.56.0

