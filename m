Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572742;
	b=epshDvd+qm5wRhxRxxyrcTvRuGCCQ+s2JI122G3/FDS63R/yRxWG8fNLDBftoUgGNS1K
	 5J1tcXkNNlp3BeLJ54tbaOD9gZ3XBVe5mhboFRN6OGzIRA5TQ47vDAL8cXDcYzJJzcL+u
	 6EbuZOZFGfoUpjpn8aLNaKc5BZgrPnIaPLkFNcPAnhDSOpatnozTy/PBlkFvWWlde8gPg
	 U/DW26yAuUukB08YMkJ1Wt7XNs5RDHe1z914kdrSWWWmYypDhRZorJJ9RKU6aDPAZKC95
	 hzzgkYJxywwHgJm8Aav89e5kF7RncyQ33fYdUd6brqiFeKmev/TRDBD4EnHnLVfQojQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=SEtvLlHPZX8KBMC3GTWr7jAy6Jfm2stXMKr2M6fDZ54=;
	b=CKGz3fp3B2cr7j9USoOp57iJyUJX8gplhGtJopnOouXiLWYgUAg9JRYlwAlruwHKgBZ0
	 mXKh3my52FtgVEj2lEBa36InPgreCC4fJTvp3yYqpXCR/lJwPuGqD2D200QFw+7yO76R6
	 Ahjh6xdxlOFhXbYMghQSZrgKBKE7cM8TeoQi5ejj9CumCV2VawUN1WYb1Jm19Q2fpT3lC
	 CIZkJE6ba1fW0a34xFuerGX44eU11LQnopNKPGbG2olUjzVkQcvujZqI55AJiZAuRodj/
	 TIIhyaDKyg//uXJXHZZHdX+7UXEVgpTq+fH0Ext+2aEZuikJiyAeA/Eqff0pgCUhY+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FWwDBVJU;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64B3606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D64B3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FWwDBVJU
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c4445512dso415119f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792572740; x=1793177540; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEtvLlHPZX8KBMC3GTWr7jAy6Jfm2stXMKr2M6fDZ54=;
        b=FWwDBVJUl2FEvu3LhQKSqJTnAYB2q3PHqxkB9rV7TxtBa8U7l6gxC0CV7V8qbZIkFX
         PTdSKevf9CTdlR5ZNt+S8nXtK7enwipsUlYTKrWY/YeLSIQsMh451uX7quI/Shc38NJ9
         bCfRZ24pODfuDdBaXsg5OpbjMBIZz1PBH1zvrkYnqCdBG/wbuFGdD8eD/+hF66UzP+5u
         OqXLvdKnjQtIXsLAcPMCG7uOeSSNPQCbBtBfgSv5lQK5WpwspIgg3a3xsQIywtsmhy33
         9jT5Ys1E5a992oYT6oGpSaOpH231OMfsJt56wViHcwjhE5ml05QGys/id5E44AaPRgAO
         9l3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572740; x=1793177540;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEtvLlHPZX8KBMC3GTWr7jAy6Jfm2stXMKr2M6fDZ54=;
        b=FlY2eRupJsFWjTIWQd0bnwqhClpaEZ/s16adSBGAiPRiDz8YcRFnSs0QTEORWJC8VP
         gSA8HSt0Z4ZgTSsbrhb1wAmx5WRVO32iBJSQuTHQJqCYyok4CTFr8lTzUw3L/c8pQRnC
         gxArg/9JOIlMagd9QkhxTnh2KFleoubrLRwXpiFguNL+x9DRf61svmYFiQtAa3Sn3O6j
         iGDh+FOZB5msgDKAkZU9jfZ4IRqkzpL5ScywSoCRBnOXCoE8eofMn0TH7B/6x/FZ5IGH
         +L1X94UnO3pF3VVWqFH9dzkr7mM5vUFdLtTL0W/0zFfspdNyJnsBAXhv0DCCn6K3iqet
         GBYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDzDUVsERRbgl8AGa/RI37rCimMugbfxT7FkPsiwAV7lunAC0hm05oChGAMGJ78uKPrDj5ueW+CQCNTJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwBLIaPH3i93bxFrm6QC0GBhBr9mNluvWc/VSjXkrpOeuTufVA
	Bc2ZLkFHvzeDwZMYs07LJZvvm9wD6K98jKYS3s6y1Ix1sPpW8J9QcMkETAAHmiwyM0KT+5H496p
	XaIq3TSCtKhqGCwMe9w==
X-Received: from wrqr9.prod.google.com ([2002:a5d:4989:0:b0:48d:faa3:7b10])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2283:b0:48e:fdd:41d9 with SMTP id ffacd0b85a97d-48e264958f2mr3332623f8f.31.1792572739863;
 Wed, 21 Oct 2026 01:52:19 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:52:17 +0000
In-Reply-To: <20261020-b4-dev_query_fixes-v4-2-df66b4c98bc6@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com> <20261020-b4-dev_query_fixes-v4-2-df66b4c98bc6@collabora.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021085219.426333-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 2/3] rust: uaccess: add method to get UserPtr from u64
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
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026 at 05:06:46PM -0700, Deborah Brouwer wrote:
> Currently a UserPtr can be created from a usize integer representing a
> userspace address. To create a UserPtr from a u64 integer, the u64 must
> be cast to usize. On 32-bit systems, this cast will discard the upper 32
> bits of the address.
> 
> Provide a new method to create a UserPtr from a u64 integer. This avoids
> the caller having to cast before creating a UserPtr and also clarifies
> that the truncation is intended. This is equivalent to the C-side
> macro u64_to_user_ptr() that provides typechecking and casting to a __user
> pointer.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
