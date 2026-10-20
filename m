Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483973;
	b=UMc9yMxvbQoghkkkSCwFzgYVrk7Bgc9G/lcNTQe7nbgqwrq6Lqb2czMuC2P5nsn2yrFM
	 WXBhq8CKt5PhrbhdpjQJoKCs5cEDf479A99LlRNuJa7DO/dbrkT54a5ynLM/fOGclYwko
	 9b7sOlb+lSfjPcVMLS9s0L6rwEcEuVn7mKbTeUqDJCqpYbmDYLjvAZOCKGemMT/67kskb
	 xLY9aYLaBFrMyBlfIepayfUM4cvBFKKypVBCCUTBXCQa9cOjR/vkDE3pSrYuzTzp8aOwO
	 gB1pteLhyVFykX0l1FL0T6aeOSsY5Xc3+JFJQRJXNW2BH++aHSpzx2mWkdd//7Px8TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=f63bQLBXHYlw5Kr7m+qCxUpgsrgXJgF6I45Lwx8IJPk=;
	b=MncGMHizTnR5E/BDGUH0xy7MmbSVtyeUJCnJaYhLu9euAPOPGI9RCAIwEYj2aIIY2I1c
	 lvA1XjsCWG0vYb10QBehuzFjx+7gmmxqfd0Q4X3ILyoBVfX3jWSU3f7c4sLp9zlHlgDUj
	 ovHSg0ibFOg4CZyuBDXzse+s+m+cDIb9J3IpxF+KBGUoPJxWUzXqmLDdfEhVavSQxE7J1
	 GJXTj3K4ph3DPVsRFP7x7Fzvzt9J3eRoy/lzK20itSTDKUSBhqpKEoQiNDAH4SSSHTpRQ
	 +TYjBch8Bv2depa0oq2FQGgCfzFdZ7gxznJgjm7zqcXmyiwz+P/ZxUnNYH7jlxzw7Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rrTwGjbF;
	arc=none smtp.remote-ip=209.85.208.69
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC2B606A326
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AC2B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rrTwGjbF
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b3dc91781fso1948327a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792483971; x=1793088771; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f63bQLBXHYlw5Kr7m+qCxUpgsrgXJgF6I45Lwx8IJPk=;
        b=rrTwGjbFVWyooJGQGAZZGGonlGWceeg9vV86YY+V0lUM+g61C13sJEpiFljrQQN/7/
         5Ii8iEqbPz9mqbFBzwGfhip9QTOZaxCryBytxgpJ9dWrrJIXbi2O7QKEM201o6EWcG4i
         +aSP4QKX27n/ET7txmrxZ6Op2SKJ0aCD6WLnag9RKTU6pPVQEdBcsPJDnC8EeOCsCqKP
         3aO2Wvx5k9r+SDosgGq3mcRjI3fklSsJtg9iTYLjI4DaG2QQYXiAfJVe9QdyiC7P5iZ/
         Ww+nQ3fd9mgIJegXxSeO8HkLIjS9f57vzfRSqD3nEDQ6ABydzIn2iRCcNU1V6nWrEjSS
         E/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483971; x=1793088771;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f63bQLBXHYlw5Kr7m+qCxUpgsrgXJgF6I45Lwx8IJPk=;
        b=Ah2z9lLK489EtCMeXIt/zgGJaZKp+aaLBc9EBrzh+ZwzF03FbIXdMubO6/qLtYSpIb
         357eDwjU3MnjvoxwSmfkIYPsxGfGHmLWuou+HtMxEBY2zChD6XmH1CIOFXdYxsRJa4ba
         K86v3CVP49316fzdKSDYBoS9YBHkyvgAge39Owb8XJaNYrx2snqWV8CrhTjQTzetVrE9
         Eyxf5yvAY3ZZ/Nbsj53fBYRfjE4TtzcAjncrTzA2STYj0TGfax4NgawspAgEpuGAUQ0u
         83WR1Uj0931ZqJqRlb2aa9FUUqAZ1w8KYZ7wxtHlidXKz0hiGi2lIsKLFFcV9Uoai9Dh
         rGbw==
X-Forwarded-Encrypted: i=1; AKwUvByq+NrIQ+OUw3ZqO26dtA2BHNk7AtevjX+rkeTvGy1HTIfciaUi2iTJY4mBdT0zT39Vioem1lZpgqcGhnc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN/FIYs8CY9neYuzPwZmYv4VP93TkTqs4iH/VR+fOPUlE5VKf9
	NmDvOhYsPWETDYpvg2F+xc+oWDSKJfNECRlX5Pv5u+1T9yHOAr9F1S5eX8sx7yQWlSeaOlX5uzD
	SHQx2DJGodFC2VtvTQQ==
X-Received: from edwg15.prod.google.com ([2002:a05:6402:114f:b0:6ac:c84f:3304])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:51d4:b0:6b1:b9da:2047 with SMTP id 4fb4d7f45d1cf-6b3a816fac9mr6710522a12.16.1792483971098;
 Tue, 20 Oct 2026 01:12:51 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:12:47 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com> <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020081248.1761160-1-aliceryhl@google.com>
Subject: Re: [PATCH 2/3] rust: hrtimer: declare cfi_encoding for hrtimer_restart
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

On Mon, Oct 19, 2026 at 11:34:38PM +0000, Sami Tolvanen wrote:
> The hrtimer callbacks return bindings::hrtimer_restart, which bindgen
> generates as c_uint. C calls them through hrtimer->function, which
> returns enum hrtimer_restart. kCFI encodes enum types by name even with
> integer normalization, so the type ids never match and every call fails
> the CFI check.
> 
> Generate hrtimer_restart as a newtype with a cfi_encoding, as is done
> for lru_status, and adapt HrTimerRestart to the newtype.
> 
> Fixes: 8a8afe9349fb ("rust: hrtimer: introduce hrtimer support")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Missing

	Cc: stable@vger.kernel.org

otherwise LGTM:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
