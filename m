Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483965;
	b=HLwlMY1Qosz4C6bnEW7hdjeK2mTagu9NN7NZtN5s1d14eeXiL64yJ2ohiwRokVH3cXXi
	 xcF0B24wlQ78dQtwIP7C20YdYD/2VzeLkT/OxLFrBulMPcGfRCkTeWN+/KpQFBvAQKpuM
	 brXhAQXFeucI5Qjw6oLbClrD17rF421a8Fs6MNLU6pC3NMDH2Md069d7JJu53tT2d0Lab
	 wO5rULJBA2scQrGLPY9HEk44COaGWF/HWkou6RUL+A6TWuXiMIYpvFJum78bEmq0DOqiM
	 zAOmu7QiXkv6o5+ULJR8g6xXGjIW0cIeF/mCK4z3aTYL3mlg4xrnb6vIoh9tjpBm09Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=k2rmoy9HDSiKDp3Ez25S7rh7RAY7znXw3hMbNjmmj3M=;
	b=wlXmVCSkU04yRn711dACFq00O29jbXyXE+yjml1qx4t+ptoP8Pv2ZO4i619VeA2U7hZO
	 gHWWAWFKsdgt+/oJm1GbbFAMKtGHC2ftI/0xYJwoP0uHCAFv2B3JEPIbuojy+cI+OQzB8
	 c6e+JYXp3w10MSwL3Cuu5gyvIoxHRa99dB4SoMY3dmOX1WKYT3eiMzttj5H1ebpuxD0gm
	 rJmqRFicgfQWEKQhTdO5TZwQyHXgk1IwM4/Idihj99sQFgywnNyoxykBYyStHSJq9wBkX
	 k5600LCnIdPFnhEPpvjCa4/OwyCHWkO3og69fERy1Cp2bBRhR07BMl9ZLzK9kHIV/Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RGzZ7oSS;
	arc=none smtp.remote-ip=209.85.208.71
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8F8606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A8F8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RGzZ7oSS
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6acb986a43bso3553931a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792483964; x=1793088764; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2rmoy9HDSiKDp3Ez25S7rh7RAY7znXw3hMbNjmmj3M=;
        b=RGzZ7oSSNK2nPZb9mwHS2fWAkbtPPR2lZWBxvgqLWCeAcuBxbAOa6V3RPZIO2qXBq1
         DkGx+5OGLyx+T0hlQtccRzVgXM0sQeTWbKKxodCoy+Vr05bl4iBj1gFDov6hxK9bzpUs
         jOf8Wu+ErEhfpJXn4F9Qn1gT0aPRBVb2eCI27iKr/tMmBvowqiVvMfRBfq1bauvQm1hw
         I8tfOT/YEl9vd+d5JLQ1Q9jZ8XpcVokNx1IK+qg6OvYE2hfvuoU/iL++7FYGbPIPEEjk
         3P4TiEz1anPqwPMR7efQyOZoKQ+ulFRXF5cQq5auQPK/ynCCYl+UZbQqQMhIeIL8QrMz
         FpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483964; x=1793088764;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k2rmoy9HDSiKDp3Ez25S7rh7RAY7znXw3hMbNjmmj3M=;
        b=L+L15NUhRtHeO4tDdPJtf4g7DCo05KN3fdvR3PPTrcn4/tFDWYsSmJ7ErbVDNgnA+C
         girMrAM1udRJ8AyPt/1Bu0qU3r/CUZg9NT9JSek8JaJcMqyya0kM4jTSTwaFcu7kwPNT
         usfJj1MXt+Vt28h2LXq15UYv846+0f3nfGG/2creKCfpkueKwxGjE06x95IsQBJvo1EU
         e9v+wGpTy1v7QxnrOvmKwbrOz9YB+eYguPThbef2PNkyZrdsxvCNrmjKuP2WsnYlx2nt
         X6TM7NxiN4r29u1PKiZHK/CiwUcfOV6ymgECuFRgX6jL5Uv5/Rf82g8aRoF39rmo9r90
         yL7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwy9YUk1x2qQhrqp+m6SGA+ggpWPm2zx/JYP0c6YjkVSup0QAu+QikCiexfW+0IpVOUbL0VxbMZYfoF2Mk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/VAdA9n81VBDWg0P4m+AnaCc3Y0wPAf743QunR/45SN0KDl8i
	c7W1osTQzexM1GPgjIl81QLrez7sXLtFsrnwQK/AxdXy/d5DMTKTSOeuEE9iYSqpnyqeqSWPJqq
	YNI0cHLcW7Dey6n9Gog==
X-Received: from eduf17.prod.google.com ([2002:a05:6402:51:b0:6ac:c627:c778])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4344:b0:6b1:8818:1090 with SMTP id 4fb4d7f45d1cf-6b3a815d5admr6666189a12.22.1792483963442;
 Tue, 20 Oct 2026 01:12:43 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:12:34 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-1-9503472ba738@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com> <20261019-rust-cfi-fixes-v1-1-9503472ba738@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020081236.1760816-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/3] rust: irq: declare cfi_encoding for irqreturn
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
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 11:34:37PM +0000, Sami Tolvanen wrote:
> The IRQ callbacks return c_uint. C calls them through irq_handler_t,
> which returns enum irqreturn. kCFI encodes enum types by name even with
> integer normalization, so the type ids never match and every call fails
> the CFI check.
> 
> Generate irqreturn as a newtype with a cfi_encoding, as is done for
> lru_status, and return bindings::irqreturn_t from the callbacks.
> 
> Fixes: 0851d34a8cc3 ("rust: irq: add support for non-threaded IRQs and handlers")
> Fixes: 135d40523244 ("rust: irq: add support for threaded IRQs and handlers")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Missing

	Cc: stable@vger.kernel.org

otherwise LGTM:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
