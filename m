Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452890;
	b=zPlzEBr3c5aZFSmDV/eTQWKEtBFG/AWMGxfe5iGm8hdmrk1AOe3ovLPE/9TU2gdJz4Uo
	 r7nQpmAInCH25DeMYgGmVgZnPCD45LFqYaDf2rOrr9K+mHVxMBRTXyfQQQr+q2HAgPYFV
	 SfGMm4Z//6XDFZ7GL2ZkRE1tgSFmxWRqQbAI8Z3I180vWMwOkvwMmO5cH5fh4QGnzltQN
	 kJM+jqIrDAoi39ZMiTL6ak2ZiVSTTg1RgzUAOTv4V/g8+s8K6dWZPB4fdNSLwHoQ9qLmF
	 Swx5gZ0aXD3SqzkN8+hSmluyC913F8kiwKdbRPtg62nKIzVAXMJh4I3QmuysdInChzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=hXRBmypsfSbOoyyjwjH80x+T5tVVukih5UNKVVGaJDg=;
	b=odmKXouFJU/EBE1ksaC6J3btchr47tlMEtwSonVVXRsjGzuibFQt+3+QcZWHgJ3eD6Am
	 u3ZaRBIVdob5miTN+COpgN/oElPYEauAZEgj2auZspM5EDewQ1gAAUxXcowa2/CVsChAj
	 aWJV2DFWoO2eoioUWwqNOCKX7KB9445ZebfyyosqOmGuYiRZ27m48mg/ApNR0FD01ylaP
	 QEbmY/DjwyZkcUE9Dytd5NkoekWRutqbCEqP+TOMFUqheidCzcb0FYlY1UAiCQBdsYcfH
	 punhMAB+jPGq0M40QQVYIUb89ljvQYMg7MS1+nuazgUstJmzP+ptsYXg9Gl9GMkGp7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I4xQTTO+;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F1B606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8F1B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I4xQTTO+
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1665200f4c2so3747753c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792452889; x=1793057689; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXRBmypsfSbOoyyjwjH80x+T5tVVukih5UNKVVGaJDg=;
        b=I4xQTTO+ipoDQptdVEVI96EQ9yhDdfzpc/kVpUvIAGDe86tih6dugo+/28mjuKU1Fh
         D2HZ6UJnKk+awUBrL5HsXrxjEdkL2e3LXWabFpJlf5xdcxsMU8l0IsqH+Jd0pvr3HK1Q
         tRIwT0EV2+LZrjPznJwaP4PFaytfVf99S4ELf1zr1rjXmEzCP8zu5+OB82OKFwmg/iJy
         Hp8ghWALQMrxcPkxrMhDGfb7O0cvjkIkDLxpmGCTEkxwaWAKJ+/TMB7wBMxdGl2bCuxX
         GL1yt4Gr4sRi1r8QrrUs38vQmnniOME4KLgUsWHxiXhpAkU8kNEz5boFXKzW9Cbin08w
         hi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452889; x=1793057689;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXRBmypsfSbOoyyjwjH80x+T5tVVukih5UNKVVGaJDg=;
        b=nEaizwZC0Dq3vFmFg1s4awBDytU6q0BO5nAX7BWEcczWhT+/6hOn+27wz02TUGtHWj
         T0Jd5Q+AKEgEfoKQ+wQ6zejRIEjm+MRL/vmkDJKuWKV1zvB9ZAb1qy0uU8V4nv4M48OI
         9RATs9JJWzTVvk8II6PC6ktM9rrL4xlASIxmDGhc2ErlXQmY8Vx3ZsowXzY6ftuzelfF
         uc4v86zaFu2xifUFbrQangGqWdjh9WwBN5+hFX9Z9tSrhl1yMPHkRhO+TWIxp8lK1p1q
         WcPKzGpjOVzbKx2Yd6K821qeM1LoI65A4rVtNillAMZivsAI0DNiRj2Bfln/rgWpyEKx
         ZVxw==
X-Forwarded-Encrypted: i=1; AKwUvBxbQA+LJrh96FkvOzbFNoAsOVQbvyRlCiPjFscYcxk1XmEXuhERD4vEvdzhtT5c3zONQcuMgKSBVQFol6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwCeFFDjf60INMs8xHf+AQJpliuTReKwiToxHPjWGyvRJ0nC2l
	XOyILLrJ/hjvw9MDRoHOHnqLWrfSN6K7/00c9toS/jR/n4j5LtsZEGQ7y1GHisg0+NnmhrXMESd
	kntvnf/G1g+h/Bbi5rsY0SB+s1VPS5w==
X-Received: from dlbur21-n2.prod.google.com ([2002:a05:7022:ea55:20b0:184:b43a:63ac])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:241b:b0:16d:dd5c:4261 with SMTP id a92af1059eb24-18514449a5emr10311455c88.46.1792452888497;
 Mon, 19 Oct 2026 16:34:48 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:34:36 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA2p1moC/x3LMQqAMAxA0atIZgOmglivIg5qU81SpVERSu9uc
 Xx8fgLlKKwwVAkiP6JyhAKqK1j3OWyM4orBNKajhizGWy9cvaCXlxUX19u+teQ8OSjTGfkP5Rm nnD9WpKuuYAAAAA==
X-Change-Id: 20261019-rust-cfi-fixes-bd898391df1d
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=352; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=hXRBmypsfSbOoyyjwjH80x+T5tVVukih5UNKVVGaJDg=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnXVop2PJE5k9Su8bg1QKXcrvTT0qTrs5695d7DtDXpp
 9qpAFb2jlIWBjEuBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjARQUtGhtMdGSfnX824833a
 6TMc/aHvprb5+IgybNz9dFXQy6tbMgMZfrMc/VxyLsN9rd1/i/K8vQrWs3uc1y0sF3A9pc7U9zL ChBcA
X-Mailer: b4 0.14.3
Message-ID: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
Subject: [PATCH 0/3] rust: Fix CFI type mismatches
From: Sami Tolvanen <samitolvanen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="utf-8"

This series fixes a few CONFIG_CFI indirect call type mismatches that
I've run into while working on Tyr. If we're going to run into a lot
of these in future, perhaps we need a better solution than addressing
them one at a time?

Sami

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261019-rust-cfi-fixes-bd898391df1d

