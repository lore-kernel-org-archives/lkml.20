Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792527408;
	b=HosO5MMbWbHWfUp0PknTdusT+syW2TC2rBZtsEXG9BAGClsAEgyXaeWk7++PtHe0QIev
	 bHWZc0adBpWoYmM4NlmtMFU7L5YSogf3zd20NbnV6wzXXcDcR2chsOm6HjH6ZQvRFrZgW
	 pmklX8HIazsei6CYTZet82Fq+OI3xcEed/w9nWDWALpI4sij4QK3EAMdDV5JbbN8J29Yl
	 eacttHGTlbwzaHqztTIthOsICP++w0ec401dOT+PdvW+5rgRkvWzoOoPF1xTUXzSr3g9A
	 2uJOYgAVtAoOGxSXIRMhq6pQ/w04BbHXAHl2IeSHDsYRtRaOf+csOCzkfNq2V4Ufj9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0h9M3TYjYg/Zu0GFYIpY3pxrKT9v+m/rFawThlx/TC8=;
	b=hRWgLpYLt0h4lH9/6LjpuGd6RIn/E0TglR6e4serM99jm6TU/fZyNHMS4pWqIJeDDQuH
	 cZq4cp0XOFXVyT+3kjE0rXdxPK1T/OZjvBRwTzJ3oG6xSGFgMznUnUreQu6QOxQnSipe3
	 FmX+2PiaTqVkCthz/Le779flzJsHSYceOEUpwMk+jQX3xMQIS6zwGYdKQoAuMrM/B9Z08
	 G3IVvtSVFz6MgTB4W8aWAwfBheLEP9BkLqKKLFDSVHgzyEsCHuqpb3oEqQnBRw3+UhfoW
	 +Lie7VQ1wCVBQFoaIlV3Q22H7CM5RoPw29q/+cSfXXc737j/up8DW31HXZ6FxodOaWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Rro8dZY6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAD9606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DAD9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Rro8dZY6
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1d2ec9aadso2855e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792527406; cv=none;
        d=google.com; s=arc-20260327;
        b=ILteeaKdV6muSWVdOz4zSAKkgUjO/XZ1DPyy+JPrELH+34CGSdU9Mb6c2XJrd6JzHg
         Jky+uwiHk0sdV+D6wRztxFs+5S8XosIBodL9HIFfcqWCbSMfwIr6zU3IH1qYlZ14Y2eB
         SHf9idHiZ81zpOSj4enm3YCR1w/TOC+wk2xhzhwotMfHMou0feyGDxR7/WNF/aEaV2vI
         9IPDy9JgIbSGmteZLQDavgjlkIxtJ/adC+HGsViTti1HdZLMCX0MhUONs9HhreE9h9sK
         7PJjXOWOsYwqdNYuZFQMti8t6iw1Pf+0Plae6XUzNuWwZpU/gUhNHV46iBjKznmXHbWW
         my1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0h9M3TYjYg/Zu0GFYIpY3pxrKT9v+m/rFawThlx/TC8=;
        fh=zas275Ri7msuKMJ9BnLymeYnF5VQBTTc/uT2wXISThE=;
        b=BbdzP9/lH4l8im9SKUNflW+WBa423dRk09mR+pINrKO6dzeLQKLHUrNIXrhoAWQA0V
         K2OjLpO+AeN0R0ePPTOWHymR1dwRKEx3ktr0LEJXXLv1f0x133RgFBnbXwLLAoKrcwYj
         65fd028AQOhY9t6Qeqb9XA6bQPvKKfVH7DjbwShoKFAiv2Ktpbo3b52RXY3l7eVpS5qc
         zVaQf3HyvkSHj8cZqzlPqGaw9AhbO6ugkJvEZXYVdpGbCIipq+r5AUucUIW/QDQy67i7
         TjbAU/zArsmwPdm6KJFv+XefAkL9jeCSvYbJbiaeTqI1UxfE4T5CA4M87Zp9e/evPRn/
         j0nQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792527406; x=1793132206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0h9M3TYjYg/Zu0GFYIpY3pxrKT9v+m/rFawThlx/TC8=;
        b=Rro8dZY6yl4AHc9wo5Vrysgk0rLLxepPlokWbH7DrBnLl6SRbHNoIpkulMS/zFx7By
         7cUJqZl00HgcjU9wPtT+KSCBuJKGhzsR1j5ZSRYKDALp0WbhQb9/HFhn7ly32KT05JY0
         tb/2IhrCHwfBNGd2eFvtPEh4fDDv/Hs9fL1prF410NMVNWshdLZfHyqG5Rfn9LWFboTZ
         g8C5Xg+XFUJh3e5ZQAWX6zV+f/A4B4iZk6ygUpCf2ZifapmvtmqckX44jGxW8T8H7H8G
         zqmqXhYmZO7nIaxnuk6u5YPZA0kE//bfkR8csgK3A60yNWn0lGE55iq6lZVT1Mapf3xN
         aZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792527406; x=1793132206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0h9M3TYjYg/Zu0GFYIpY3pxrKT9v+m/rFawThlx/TC8=;
        b=1kCyxNgEHVYHcJObM0XB7SL+03UoJ3Vl+BqfN0y/4YyNvOP74/rY6jtefXrJtLArW+
         2wtBJvEFszE5lv8V8pHpSnV6eCYHd3x4+IJFjmZLldkF7hB11aJmBZVqx77uN93grekA
         OaRqVHxdZIt1NTA7Fftqo8Vabo47Fcx1F1bK7xmqsAC0ynjVbZ8SVraj6JYX73OjAOOR
         uqu4nAB720nmZx7ppPUdL2Xa/4XmkNGbRAu4ff7hYNqQnGmCqiSOsvDky1fvXrl7rLew
         jEBEA2F4Q4g7r84Lm1AH4SqCrC9eghd4t7JCyRjULSswjWRKzGwL+pBVR/ULTqjpqgBa
         CjWA==
X-Forwarded-Encrypted: i=1; AKwUvBxhq8SHrZA8F59sKjCE/KrYyKk/GQJkdCCzP3DOBwSJaCBBNIDQqjXK+neuw9A8VkGudaNFDynJtgZC8lw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBNm3ro/DR4X/lt3dVnTWD7i5ODN0Bi1VjateO98g4r0NDXASB
	hJ9DNTHWqfLZbpVLVR5qDKgEewn3NMgfjv3sOtP7D1tnT0vAQs1mITP9e4EuMXn6AMKiYX32bho
	z5PNdq8eunItcDYik6xkrvu6plbZN+qTaBNjZjrRT
X-Gm-Gg: AYBFou1WOdy3/odUeGzC3NPYEilFSrF9EHmJh6c5MGg8XaETCVZPMFTgldrnZo2yrQa
	lnyZ2tIKlWyfisN/7CmIZd0eXNWff4zPmsZB+68k3rvWlE2l3AJ0dPD0OVyfQ5ueBxa3VYBLiUB
	AGiPKjKoErbuRpYINkDNWlsz54M3ndj1fGWOJ8zDp+NAaSmDCA1p+z7Uipz/gL2cZ3omKJRExla
	NghLm9AY4tbpCbVjM6oPQQWvR4iBbgO2GzIrzrRWPgnuxR07b1fXp3bvIlabCUQcQHU9eDVEARB
	H87ljXUj/Krr2LB1GWv8srBlbUKrN7DIbC8q1zhT7zjgqfAaN6GdlzBN4wwfCVV9GjstbjVk4Fn
	y2SmDT9vwSw==
X-Received: by 2002:a05:600c:a402:b0:4a0:1ca4:2741 with SMTP id
 5b1f17b1804b1-4a1f598682bmr1067665e9.9.1792527406013; Tue, 20 Oct 2026
 13:16:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-rust-shmem-fixes-v1-1-3f7f6de5b5e7@google.com> <DM9O11JY63Q2.1U3PB5GL0JYOQ@garyguo.net>
In-Reply-To: <DM9O11JY63Q2.1U3PB5GL0JYOQ@garyguo.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 20 Oct 2026 13:16:08 -0700
X-Gm-Features: AclHuK-3k8j6k-bTltQ8cEj3qPss7TOR1d3Ms0fv42pBRizgtolJ9QhEZUGBs_k
Message-ID: <CABCJKuf=7aVKfC14cXymn-BBfvA--3cfWjpTnBY0orkic5NzRQ@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: gem: shmem: do not leak pages when sg_table() fails
To: Gary Guo <gary@garyguo.net>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 5:31=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Mon Oct 19, 2026 at 9:21 PM BST, Sami Tolvanen via B4 Relay wrote:
> > From: Sami Tolvanen <samitolvanen@google.com>
> >
> > `SGTableMap::new()` takes a pages reference and maps the table before
> > `Devres::new()` allocates. If the allocation fails, dropping the map
> > frees the table but keeps the reference, and the next `sg_table()`
> > takes another one. `drm_gem_shmem_release()` puts only one, so the
> > pages leak.
>
> Sorry, could you explain it in more detail?
>
> Creating a SGTableMap and dropping it doesn't restore the state? If so, i=
t
> sounds like an API design issue.

Correct, SGTableMap::new() increments pages_use_count, but
__drm_gem_shmem_free_sgt_locked() doesn't decrement it in
SGTableMap::drop(). The count is only decremented when the object is
freed, in drm_gem_shmem_release(). This works unless Devres::new()
fails here and sg_table() is called again. I'm not sure if there's
some background that led to this design, but I do agree that it
probably could be more intuitive.

Sami
