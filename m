Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483993;
	b=I1/RhM/s3NkeOjLLw1/3aZmNO+ah3yfuTqliLBgE519B5swOGphiuhjvVMJZCI9iElgq
	 MZXGUp7E9r4kTVX4Jdj9NwAIb2nLSqib84ytY31BQaDye8f1sgQIESJJiRbg7lERUPXbv
	 2w2vVqcfVgdBLU1msUO3F/8HvjwhKyMM0i1/XHpkbsSkAm9BA+o7XcxHUJKINlxPq5trM
	 lDAdiiIBATTFpJ+ukbcsNi5dY+GcMEndMfKnPfT1F8xRPrdszKFlsjKEJfF52lFc2OUbE
	 E8R4coaVZgGZKq0YyEutGuYG7XiOBFZqCdzO6ckY97PbXJFxM3c19GLtMrwfbJMLZJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=TsTwpzFLaL87CUGnKEpNBjiUo0nCAy+dGY5mjA4Yxa4=;
	b=BYqNUagEj+W4gy0hDbHyrN1lpln2uncI9ZiveGZ2MiEs1L0mFD1DxfQuS2bg8slTALsu
	 7tDx4KNquZD9ngyPwG1I4md40YCobowJa4QDFwMzGl+X4EgdERKBbdPfnY8H351ul2Xl6
	 l4eHBo52mf455S4+W5/CeU2U20eYTkuZh6DpM7yVD/TG2kiZe2n+jaeJNfoowAlGph+uw
	 HQ4QOGNzDOWJwlDMTitTdF+hZovyWmteII9vhJqQiDRu6i98G5Y9ymr1J9Wrh0rO+aA6b
	 Gwlx3fU6zYPZ001Yewza3jjjzQ71jTmZefheny/+q6zmIuR4Y0Wa5qkgEZVm2fq9Byg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VGbBsq55;
	arc=none smtp.remote-ip=209.85.218.69
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC43606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BC43606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VGbBsq55
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c293e604f0eso250294366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792483991; x=1793088791; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsTwpzFLaL87CUGnKEpNBjiUo0nCAy+dGY5mjA4Yxa4=;
        b=VGbBsq55SxMht3O1sFL/JYhDoUB1lktVionTe2hmEWeoz6nsvvNHdD4vuxO4EZ5VBk
         I/ykPxUt/pVq3kzNQgQyy1bcLYXwxSvhJbpvJXriWtSEq2xHTJLOUWDAFm5GFmKXzUKU
         zeQBf+1swtzmV6w5L41uWwYVRDI1Q5mrimf1EfENQOEGIF3TYEXUhcJNQSDB84BT7p2k
         IvJW1mNG6gsgso6x4r/2S8pXx1o+c3sH7wMfMUmWB65O6rwESMhS8iNG6vpMGx81Q/Jw
         oBATHwmSWWFs+gBdvOQg6BKlDe7FapxC+zmaUSwRwJZ3YnenOf/bWAs53FPtNREsDBiO
         CK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483991; x=1793088791;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TsTwpzFLaL87CUGnKEpNBjiUo0nCAy+dGY5mjA4Yxa4=;
        b=MaE1Pj0eLrJP3iIf53OVCD9T2mmMxbx4UUrzJez3dwmIDJaRr6YAM4XC3iBX3rQc7X
         khN7sMH6Ygzjg6//1OcktkKhZW6MIaEWpVvbtIOroBH9MYJ2KTZ6oclD2hThkdq1SHvA
         GSOUzLtJ8cRGmJ5B5CveYn9D80z5EVbHiuQT2JM330dzbJRvR1ixSRTDdgYCHik5ElsA
         cIA1b4I6n48tfIXaCA48CVxSpV8DmaNfSZK9NjOJSOJEqXprOCLquiHbjSgCLb/pqvqr
         42s0XNsMXA/AFf2+VnNmO2SL/SELMCHN10BThaiakMpygD+lsODFEDB1dKnW2Aa8/gOC
         xzvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxt1nF3zRt6Ga3j0BZpCXLWiho0kV5BYXP4ePsuLZJfYmx18qqX+hSXgbY9lHYXGAz127p2ngF6G8dhGWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKw7BVeWPVZxdRnnrx3JF4DcjQ3XOeoDYQlYAHitUwj/G3V56GK
	BrNWc01Kt6eu+VFsKNChbLVu1vIp0bpL51bxu7TvveXyY0IcBNMfoIhkLHUIGNRWHgFJQkckYB1
	DX6moV1syZQj2Y5y1KQ==
X-Received: from edt3.prod.google.com ([2002:a05:6402:4543:b0:6aa:ff76:b1f6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:d803:0:b0:6b1:e474:e0e2 with SMTP id 4fb4d7f45d1cf-6b3a81dea57mr4861388a12.43.1792483991214;
 Tue, 20 Oct 2026 01:13:11 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:13:06 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-3-9503472ba738@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com> <20261019-rust-cfi-fixes-v1-3-9503472ba738@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020081308.1768290-1-aliceryhl@google.com>
Subject: Re: [PATCH 3/3] rust: dma: declare cfi_encoding for dma_data_direction
From: Alice Ryhl <aliceryhl@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 11:34:39PM +0000, Sami Tolvanen wrote:
> bindgen generates bindings::dma_data_direction as an integer by default,
> while C callback tables such as dma_buf_ops declare the parameter as
> enum dma_data_direction. kCFI encodes enum types by name even with
> integer normalization, so the type ids would not match when C calls into
> a Rust callback taking bindings::dma_data_direction.
> 
> Generate dma_data_direction as a newtype with a cfi_encoding, as is done
> for lru_status, and convert DataDirection through the newtype's
> constants.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Perhaps also add:

Cc: stable@vger.kernel.org
Fixes: c2437c43cfb1 ("rust: dma: implement DataDirection")

so this gets tracked alongside patches 1 and 2 for `6.18.y` backports.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
