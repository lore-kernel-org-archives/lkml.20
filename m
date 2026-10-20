Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485237;
	b=hlH83Nn3fJoRyKVUJjf3vc7Lhzq3X1jtRAPp8VLlKqWJwm1nXKzrFqgMUSTclAIjdW7q
	 OlAUGZMMZ67RxPmI3vTOrki3vSaMZI5950hrzIHlWwpo5DMk9VsM1wD+kE18+r5lyvjy7
	 s7snpY9w2ovis7HWQ/rNqr1LVS0RzV3SJwsGWy7dnDmU+D5yTwpr4ioR9cBxRKihLbV3M
	 Niq0xSCo6xXT6kSHLoqc8MDcG1ITmk/muAasacSQnTc+Pnwfb17YDEglaz2uZDtKHoklg
	 WFoenmNqi9hIU9pScXKpJfIgcRmmQdC9+qmWNE1+KHvrRlQeLNrH82aqm4jPB4lrVFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iTKxLK7MUSiAzkn1IgcQvxPJWtCNPLN0//THVXyyz5c=;
	b=uaFJ16srgBdxW8He2DItLK2aetWTE5mDSOiVIG9Zm73UgDPN2ED5bwEYamNLJ1DZkVKa
	 MbQR3+DuImlKFNRSPBGsTvTAdEBK/Ybt+G4UcFjDO56aeA7uD5DxVbVvQsIxMM26JiXLz
	 eqp4fr+Z3hH7pQGd6pma7VVNRStNfIBvf6i65nC1cuJl+PF5asm1qc6CbaxqktD8EMgud
	 cicQuGj4y51ycHfCshctYZa8Z9KscQrPDj29eWODWV+N71lAZDJgnb76hx2nkchRZZKUq
	 QRUJm08XyxI6wcnAaoh5o7cIZMxg40nu0Z1kJOccb/OVxM2nGPJqfvJYxiW+pmBY2Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=N0HCy1of;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E418C606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E418C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=N0HCy1of
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a16db51147so14026275e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792485235; x=1793090035; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTKxLK7MUSiAzkn1IgcQvxPJWtCNPLN0//THVXyyz5c=;
        b=N0HCy1ofPHQT50aRQpXEeE2FKKnFo9xNtMXDh40rrBUAHu+F8qSw+d1kKQDEsC1mMD
         WU4D7itliauJYaxJhNPs63ybtyJGEAMgrSUw7a8S4Sjlc3V2pF3OwImM6pbJji2kURwT
         mDQzk8n42Or5WTcHyP9Cf07akuDQN3bMLROlI2MA7tknmNQP+xXY/3/TtZIiofZZaWzi
         uIH8/hjLp+ftjcTFyIgSm1u+VZrXZqSsduvfEY+eFzysRK3enNttd7CzNkQzAb0uR/7h
         PqNSm38kksSc4C0TXzAIWx4Wu8uXUz0Qh2FxPT0+R7hGx0U+T6PrKm2dA2QhRA0gdZhH
         J6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485235; x=1793090035;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTKxLK7MUSiAzkn1IgcQvxPJWtCNPLN0//THVXyyz5c=;
        b=JzUOGBkOp9OJzyakAVVHhN3Q/HLF4keHHi2i2hhMhc1zo8JTnzKWN+20Ws31DOxduQ
         NI4Pihfxomh3lNa4FPuJ6QtS8xPgkSVX99meKTVAelmE8nb+lFQTG+aRhlHezKbAhUGp
         rhlIz5wN2FARBHOmqrfth5FhP5KNUh1i0oxT8xDEJqMkFBkG5+chNo9b7ozxCd4EDQcU
         3NWZTGJqOOdXbPGkRJ7BHxxTRi5Ik15m6T4q3VBNV807UZRnGxy4enxjGt5+3VzkE3IG
         BfKQSU7Qx9HeM+ptGFtURQY839fmaOnlHrZ/U8qilSOufVo9KDKPax7iurZkm3nkwcBg
         rPoQ==
X-Forwarded-Encrypted: i=1; AKwUvBy283s/QAml15OcZKgpUowjIQGT9vWgx0O9trq8JtV0T9RoGfcxw9zixM6TbqAhNkK3XHu1nziQVqbOvcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoocQ90CWgwiidRzlKFxfoAmYL8G9dHM1MZ1yi2D7rcNjc5k/j
	+9BNprW1FTPWxYtR0yCHPc+ddV4PgtL/Gwxn5wcmpqY4ZKWT/PBECphQ64B8XCd/FIsrXhCOW00
	n4gIgz2w8zwkHafrHmA==
X-Received: from wmbb17.prod.google.com ([2002:a05:600c:5891:b0:4a1:e474:4216])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e11:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a1d75f24b4mr207613465e9.9.1792485235001;
 Tue, 20 Oct 2026 01:33:55 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:33:53 +0000
In-Reply-To: <atarvxFKYYuHhXGQ@um790>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261016-b4-dev_query_fixes-v3-0-f8071cda3515@collabora.com>
 <20261016-b4-dev_query_fixes-v3-2-f8071cda3515@collabora.com>
 <atXOd-EeFkdA-trn@google.com> <atarvxFKYYuHhXGQ@um790>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020083353.1821078-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 2/2] drm/tyr: allow userspace buffers to be mismatched
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Mon, Oct 19, 2026 at 04:46:07PM -0700, Deborah Brouwer wrote:
> On Mon, Oct 19, 2026 at 08:01:59AM +0000, Alice Ryhl wrote:
> > > +    transmute::AsBytes,
> > 
> > Usie the trait from zerocopy instead.
> 
> If this other series making zerocopy available to Tyr gets merged,
> then I could rebase this series on it and switch over to IntoBytes:
> 
> https://lore.kernel.org/rust-for-linux/20261019-b4-gpu_info_intobytes-v4-0-0bc04df46549@collabora.com/T/#m9a9a24e0cf1ae10451e3fc84955873b405d0da0b

Rebasing this series on top of that one makes sense to me (you can also
already send v4 based on it and note the dependency in the cover letter).
Note that set_uobj will need T: IntoBytes + Immutable and can call
writer.write_slice_partial(src_obj.as_bytes(), 0)? unless write_truncated()
is also updated to use zerocopy.

> > > +    let mut writer = UserSlice::new(UserPtr::from_addr(usr_dst as usize), size).writer();
> > 
> > On 32-bit this will truncate upper bits. I guess that probably matches
> > what Panthor does. Is it what we want?
> 
> Yes, that's what Panthor does; it uses the "u64_to_user_ptr()" macro to do
> this deliberately.
> 
> Since UserPtr only accepts a usize argument, I have to cast in Tyr,
> but instead, what do you think if I added another method to UserPtr
> to accept a u64 address and cast it to usize just like in the C macro.
> Something like:
> 
>     /// Create a `UserPtr` from a u64 userspace address.
>     ///
>     /// Deliberately truncate upper bits for 32-bit systems.
>     #[doc(alias = "u64_to_user_ptr")]
>     #[inline]
>     pub fn from_u64(addr: u64) -> Self {
>         Self::from_addr(addr as usize)
>     }

Adding UserPtr::from_u64() like that sounds good to me! That keeps UserSlice
construction infallible (matching u64_to_user_ptr(), including when the slice
length is 0), and we can also use it to replace the existing `as usize` casts
in drivers/android/binder/thread.rs.

Alice
