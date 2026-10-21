Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572743;
	b=eZA5K1YoWMBLPywglokggks6FeQ89JvCfvC1Sxbw4llVdBfXyh2r48GjyhqREn1c/mbB
	 KVY36jzyVR22uFkgNoTJnjWeAQ/PvNFm7jkxInMADYUQfc7gXOKIaArRlzrfvYrgzQFYl
	 P6ny1NrihhqFhiv+y2eLOdLKufuf/yAvK5QOPJjRNea5IQtsj3ulT2ipFPjuDV0gnzS3z
	 sGNUUUG7LxaajDblWBEGSJBjr+urOkJnAkOoy6m2hhtOMdjlaDUG1iq2KxVffdrZmtv2H
	 xaBfzTJRbit9c9pEqiCCz+vWkjnbgk4EQHwuUcVsDTWwdhBlJVznnP9QYYBcTKWNbwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=eyNTpdWYX99+7C9MN8TAB1uHP728SkaAnyZyPKz7OOE=;
	b=rps5M5WI17P5D2VNCSuXPXn1EhDMtQ/GLuGLmWwMmYF8tqxNSVr86SCdxn8lGWnil0tx
	 Rkilr5YZTiK//YEAR2Pf7a06eSffwq1CTQ0TNyXcLSQRHxitWOFggy65PHt/1EBs/I4vf
	 3JCtTb4F2na9zHjalSt4sA/x5UlG7c2TdDny24i8I/EQ1/a87SK7E9rq4rTshWstwvk3w
	 Y7YT+QOehUNiplbmJbop57RLyfw9LtFid3sGGOuyNkex6r1BTUOAkNBA1KfytNV/GQo7K
	 3puMOkYVcq/ZmtucxKPZ+hpnwFhzGjJaSRf8PAGc9cN9eEAs97QuFvquYlNmXKWUzXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="gjYlK/t8";
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277F5606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 277F5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gjYlK/t8
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1fa972b4fso2643495e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792572741; x=1793177541; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eyNTpdWYX99+7C9MN8TAB1uHP728SkaAnyZyPKz7OOE=;
        b=gjYlK/t8BzcU91ZEKKH3sdAF3s7/Cim5LxYiDhwe509nUWPFJeEJ0rRC7exYrOyBd1
         vH0uX5zzcixcB4TiDUm4p1gMYdruxZnuYRSwYqtjuG6+Qt87rStpP53S2GdFgxo5CmX0
         CF1gDy1uWATmc//FkPTMxlUz0076t77p3rUqNxlrOh6CaarVDIk9aPOushPhqlR5Cddi
         8q1W/sEHV4qqD+a2DCBtVxItZ5t2EiecRu0f88zWCY5hbgclO3wXNw3gFMUyuMwRxH5p
         jBu00ai76q+gRZ9mwwv03FVU3s75MQjOK5LUO+zfWyYi1Qxo68xN/K/30CdlHNnAiB2K
         Dn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572741; x=1793177541;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eyNTpdWYX99+7C9MN8TAB1uHP728SkaAnyZyPKz7OOE=;
        b=vg62OCc1TMI++8UtYROQNKxqu5K6I/pP1sVSc2DE8ylC7X/MVk0hah6LYlmLLHmQbs
         m8JixyF4hACBXzZuloTrqbq4u9T35Z/KwgfhoP4exkCGv7Suox3OLcv6f9LO/UkiKD/z
         wZhTSeO96ucHv0ELNz2DHUSxYQR9LQKSccXmA1qdvceUVhGl4oDsQdbMh70Y2I/gpTHx
         1SBQoO2U1Hzv0nX+2BtZJYosN8Qtj6PUUryjUB4qQVaOsqkJb/UcIDGYwNb5JHbr42h8
         yibLV1wfRAN66+e2KV1V3LIxkTHsCSUwJr+nmvlZ4fdojruaKaUvmD/Ul9m8/cR99UAR
         mPHA==
X-Forwarded-Encrypted: i=1; AKwUvByKqIISn2JB+vjty6NEBb81IpmrLXL0QqiGr5+cHqaJADVJ3myD4JEJj4DG7t2GIRVu2HNYOiYDE5BjZHM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeon+9wW2BSeMnZnnzUdcD+dpdUQPj+bKqTy2r1MII+K5r2jqn
	jyYaQKrL3tCc3DIi8Ht0kwHJn5u/WX9zVJW/toocCCP6k2aQg0zlBGDLqKI/S73lKYJco3ogW+/
	0/5O7qBaSExUc39WHbQ==
X-Received: from wmro19.prod.google.com ([2002:a05:600c:3793:b0:4a1:e34c:d989])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a1fdd483a6mr24969595e9.24.1792572741168;
 Wed, 21 Oct 2026 01:52:21 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:52:18 +0000
In-Reply-To: <20261020-b4-dev_query_fixes-v4-3-df66b4c98bc6@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com> <20261020-b4-dev_query_fixes-v4-3-df66b4c98bc6@collabora.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021085219.426333-2-aliceryhl@google.com>
Subject: Re: [PATCH v4 3/3] drm/tyr: allow userspace buffers to be mismatched
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

On Tue, Oct 20, 2026 at 05:06:47PM -0700, Deborah Brouwer wrote:
> Allow userspace to provide a buffer that is smaller or larger than the
> object that the kernel expects to write into it.
> 
> Set a minimum buffer size to match those in PANTHOR_UOBJ_MIN_SIZE. If
> userspace provides at least the minimum buffer size, then simply write
> until the buffer is full.
> 
> If userspace provides a larger buffer than necessary, then zero out the
> remaining buffer.
> 
> This ensures UAPI compatibility with Panthor.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
