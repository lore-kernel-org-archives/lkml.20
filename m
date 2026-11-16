Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858626;
	b=G6p0VcqnnOF3NTdz/IaxolxXSpYINUWUP/OTCVQuHijuKW14PnNAli7XbVAp11ky/OVQ
	 lLCLube5FLpAT1W1GyPpVtM3YrVMgL6y48iiiDWyCovShY1HjdlvGPOINLlZrp2T8nVa2
	 vkz+IONNQs1HT65rTzb3OJ24N2OfhQUwWhcOX2BuvmTjRFrbKrBBXY3oA/vs984Y3LxVw
	 rpzLgrv07YSqxF+H+58cHmfNJW2+FMs444ZoVoS+vop2lRfXCkMrlzUa/pLgnoUkvzq05
	 21kGIvXILppTtIQE7D4lOfniifVcZFzKSpfc6vlxTHdV7OKKq+YqCxPIgXTbmTDg4fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tcLO68CSt/fn/aruBlJyttBvDc08aJeTjSqJH/iM54g=;
	b=zYTs9/7mu2mL4hosYP7IsdeA1lzxxGcWUUiAvd8x32e5VdmERi8Dhsh3yI/onjkJfZMD
	 B2MxA6e3Eg+HqWOWnfvjUwnW9EN98mntiS3X84EokKaaoOvw2I2vwJmh8fX9DJ22fA01V
	 1Xow+OjWKkmPC8IFTM/b2Q0fGSScqgxc5bGIkXZk7qFExLdrpZtp5XYTzDV7G0eDsOs/I
	 I2PWFWofETx3lFpS93T8vQvTdIBhIK2HtAa26SumKmOIKYoV4lvKi44hjvKR46+SFDyT2
	 KRwR02IjkyTU3KVmGTuP2wkz2hWwLy3cXQdnsVmhN+HCZm/8VHrUu6Ftszwy9Ts99Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iO1wfEH7;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B631C606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B631C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iO1wfEH7
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab4354db11so39842591fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794858624; x=1795463424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcLO68CSt/fn/aruBlJyttBvDc08aJeTjSqJH/iM54g=;
        b=iO1wfEH77BdvTe03f2vR6SIZsaqxqrzv/hspvJcji784qZYr4ktfe4ZXCJwRCuqQ7x
         tr7FxVtKa5mtseRn2IsWjGjfdLyk66TwELHGvmCiSAlfa/cDRNy04NklFAloasnXdvE1
         71Xyn2JmmZ2yM7X+KgdCKY8+/0m/pQloM6siSYjOj+qgQ19n1aKUg6/vZ4RbLG1UcVKT
         tQoVYkn11FysKnWgYJrBtiRkMrnyrVKtokOYoHAtkVHzrdMNQgRjzNfgEJg89vctqcGG
         UlVkWBPabtLgacvTwJreKg0lwW9ZSaCnB9KKkLqs6k9+KfNkfkLg8d/lfHb1cTxphdWQ
         UgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858624; x=1795463424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcLO68CSt/fn/aruBlJyttBvDc08aJeTjSqJH/iM54g=;
        b=jAW4oHyohzlka2rGLyTbS2AQyantTbv5b2yHvV+eEHZxd2tZp422+k6hZOYOW6aRxC
         FLBbs+ovXzM2sU2U4D7AvgziORJhXL3MVJjrfMBnH15TYjUPSxIMgr0RC2X6Qgv8kWZ/
         cv4nrWnafIs9iIk1RSxaVEmIQu1uHgBe91cy/WNJ6iKzALiQh3G7TTHiNHphPVhgXJCE
         rC6DPZJkPvkloEgETTXl4eWiz3OoxxuL5nYfoDNoi9E98G2QwKkE2rU2giR2uIa5rHZY
         5+zSCwP84detuoJusA44LevSTbB6/L10QtjcrMvLfeHvzlmcjwKddjlQQ54ohczKZ9e3
         SQ2w==
X-Forwarded-Encrypted: i=1; AL+hErF4FJBUl3mmyXNxRK4AyR5Hl2D3+g5Tw/yTbzxNOCGU/umU2MsSe3tIW9iDPoZsugi0ZF5UV0vXACTiet8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NHM/dltcu7hVgH5Juk2twnZWkGf1E442lKoyFyvYr0KH6Od5L
	eYISLxRntQeTEtFOK9bw8i0o6CokplE3UgjLTfxVLx3NhvtSixcLNFgENLTfBUq9ZD0=
X-Gm-Gg: AYBFou15QP0ex4X/xJ0/a9mPILFtz99Fk+bniFMqj59ZnfttWpkqJCYnxOb5M9wHv3q
	MyxKqHcQn/OYSYCLbxNOrKpHGzMS0pYa6TT6tVXgf2c92sESAns+cA9SzJCb0mjtzmmM4CLnt7R
	Q9eb7vRWABpfUPZ+TW2rOSJw3qUQzpLcz9f0kwsT4zJFsxttAngj4tPVnEG+jWX+qTZs5ADMV7I
	Hh0r6c5nuTpvHqZ3vIoojnnqoPARjSpv8TdP34oBvUBONPQ07lg1bL6iR1DYfhKwhigg0MJnN3A
	b+EJ/fxrQ7xYQTjSJn+NXxPBaY/Gvh0D8NeWbLt1pK5SHB6j0pcTkgXY9TDCz9nvIvpbHzW/UWN
	wwwIAgPIN48/pqo0lDFaqwcQ7Vs5Bh63Q+mjGbIMMXW09ireiCiOPisGbzIZWXQ6bJLh0F+vUke
	TQi4wachpdb4h2HxFgpLju7PW7MuBPl5vFVK+YSK7qGHk1ZhLbYggR/rDW44O7+0ptYQ0o6G8Lb
	yVUndfD8evWQ0DxCFdRSEOKm6kzfp1BPPIH3M5+oP6lYc6pFiSdl+hE9xO0mjSAg9WDQn2bvx2P
	vE13c9FNDoGn/TbLBpNj1RvBu1uAB7LJc+5ZV/I=
X-Received: by 2002:a05:651c:1445:b0:3aa:fa3e:21bd with SMTP id 38308e7fff4ca-3ae2b4bc383mr36582541fa.12.1794858623655;
        Mon, 16 Nov 2026 11:50:23 -0800 (PST)
Received: from IuseArchBTW ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d1ff0sm35700701fa.32.2026.11.16.11.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:50:23 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rust: sync: atomic: Update safety requirements for `AtomicAdd`
Date: Mon, 16 Nov 2026 21:50:08 +0200
Message-ID: <20261116195011.24156-1-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The `# Safety` comment on `AtomicAdd` contained an unresolved TODO and a
broken sentence ("...to must yield...") without properly defining
`wrapping_add`. Remove the TODO, fix the phrasing, and define it as
wrapping two's-complement addition (`v.wrapping_add(delta)`), which
accurately reflects the behavior of the underlying integer primitives
since `AtomicImpl` itself has no `wrapping_add` method.

Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
---
 rust/kernel/sync/atomic.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 6d27898add42..5f6491fafd34 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -127,10 +127,11 @@ pub unsafe trait AtomicType: Sized + Copy {
 ///
 /// # Safety
 ///
-// TODO: Properly defines `wrapping_add` in the following comment.
-/// `wrapping_add` any value of type `Self::Repr::Delta` obtained by [`Self::rhs_into_delta()`] to
-/// any value of type `Self::Repr` obtained through transmuting a value of type `Self` to must
-/// yield a value with a bit pattern also valid for `Self`.
+/// Given a value `v` of type `Self::Repr` obtained by transmuting a value of type [`Self`], and
+/// a value `delta` of type `<Self::Repr as AtomicImpl>::Delta` obtained by
+/// [`Self::rhs_into_delta()`], the wrapping two's-complement addition of `delta` to `v` (that is,
+/// `v.wrapping_add(delta)` on primitive integer types) must yield a value with a bit pattern also
+/// valid for [`Self`].
 pub unsafe trait AtomicAdd<Rhs = Self>: AtomicType {
     /// Converts `Rhs` into the `Delta` type of the atomic implementation.
     fn rhs_into_delta(rhs: Rhs) -> <Self::Repr as AtomicImpl>::Delta;
-- 
2.56.1

