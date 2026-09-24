Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A683F54C6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246012; cv=pass; b=RoUEnOKLsr4LhUOJ8ZL5/+dFe+awNu9MKRbe66mLkGnrQhMxd8u0I/D6uFXiIJ7Z20uoAzBepJAlkMcFoV2+iNzBvTgbw4x36+R7emnj7KJh9tTJMRfyNyT9pUiM2Jr4yq9sp475LKASy6egRWGyOvEVtyWMoNTZd13346y9NYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246012; c=relaxed/simple;
	bh=TjBwBAVtLQJ10cPrfbNdj5ZS+FgVnFhStUQ45fL6gTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIaHEMWgXMmv3CTczXDvzilDfEl7XPxBbcnZcrHA/heD+vGz2ynb+ikSnHgFotK0Rw7sTyx/sylfhn6OJAjkoTrCbyyZUmZ2yX3Hc1w5S/h+yWqzZo6qQgULMBU7LMyYgp3DW2IaaTItfNVZSTr8FXnCBiZIa1Pt8iBGL0pPQFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Srq02qpN; arc=pass smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Srq02qpN"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so1345062f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790246008; cv=none;
        d=google.com; s=arc-20260327;
        b=hZzfdrZ4e2n3kXXGsjGFfc/Yp2aeZvu2YQ6xVKYJHBySF8/R4uj0tDUsa+K56CmCwt
         WuuVrykklFmzl7F1B0pc9nM3obXnaq+xuQ4pwiiFgbJUuxQOd0Invu7i39BSJS+DJOEB
         IVeo0TkQFWPG/BPr9sUXt0lUDMuM5+eDsnwH8Yon31ijsagU1hn8gR1a9J4ssKiNpIcD
         S+CFbglwzapyez+nni0WbZxy37LyRlj737UtedWD1WOgkIRLlgD37EU/t8YVjI5GTXAd
         o0YWLaFMZ0shCxK6Y0WdvI1kiF1xkwEB2gRkeOHnv1o7PTZgde9A/CrBZEq2+EOdjl1s
         qQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B2Y2KJCyXfWZMz2HsqnglDrl7rh38AmDRqjeiA7oS9M=;
        fh=k4/ZFMlz83gedjRA3MkipqcBfXbegaEDtMGDf4YBoGw=;
        b=XAmxtDQ5GwXuDpQiwDKSbU/BGszCk9vBAUs05BES5bvtoRGmJYNVZ4XbAq9oIgSTer
         Agfe5adMk9tOMgu+nMWf0X3J5X/vTJTG50ZeuwiM2RavtequNs13KmP+GLgzUTvdSxOE
         tnaj/UCk2XFlfd39F/5jhcRZfrifxDkvn68dqDO+Hk4MSYJ++FI4th+L8+FIyNAWlnKm
         T2mfoGriSuBda5/Y5vHaqBOvUgSLbeW9Da7JX8uMFhWf/zNyv8a8OcUxWxBxi3O++fIP
         frhQia/h2DaQcNujPlb1z2iTOo45gpX9b9OnOUrhXdP2twRnw+8+IZdN1pz+IeMZupQL
         qtrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790246008; x=1790850808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B2Y2KJCyXfWZMz2HsqnglDrl7rh38AmDRqjeiA7oS9M=;
        b=Srq02qpNlN8a178XnoLBNZzvBaSb7c1UuU4vi4BAsYEUvbF0chwKQ6VoUqJhUtbMcn
         wImqVxp3mNwn1CcqISmOEfRg2qJjxVFmUvRNQNvsFGNOmhuLP6XNqU8z4gIeiDsE7bxT
         oAP0CGwY2GCA5NDqTsxHKDjCL53wx19E2G4laYGBjQyPmK+jAUEIEeezwSdWv1j9TRmw
         ZWHLsRLHgvNologue4tARw2iUkwYrAufsNPQCiwteEJXl1Z0Et2yCuqQgKjhT5517No4
         R+eKkGpjMp5KF3vw4xpuY+zCIcdpjiewE97JxenacSzE9+jIWlIq6faA4Oii/DGRbaZk
         WwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246008; x=1790850808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2Y2KJCyXfWZMz2HsqnglDrl7rh38AmDRqjeiA7oS9M=;
        b=kwplJkxXSSBzzAZHggbIMRdKYxkMx97cOJxnemeO5qYu+LQhM5KCxfKjIBYwyNWAqP
         n1wSNMSuCx4GxnOXNDnS5D5jxfXDc/aFvkdoN5sUaxf3mLpVljAQJTzWXck2+F/A1H0j
         T8XMlhUvqi76GgX7M6DIrIzJnn/ly89mi7p+2Fhws71f75oeS8DQPZTRZzKuNeHZHE4w
         qx8e3ZsTvPf2LTjfkm9AwQY5Rp7LCskjjyFDfobniHuOBUFnLF6Z8U/AuhKBPw3Lpf3L
         T/9mP7C2ZO811HJI/wBjHG0qRs96luEJZjOTbJAza8NDB2o/syXk4rzl67oegN+cYyKl
         nQAw==
X-Forwarded-Encrypted: i=1; AKwUvByEDDdQ3UEkG90ESzCCyuetC9w6ORGVPGqs+dOokvXGzCy9xF4QJhJcjrxng4DSok3yGdEIiUD9XhVfKUU=@vger.kernel.org
X-Gm-Message-State: AFuF++ntuS5OI0VjXoxhOeR8qPt3larBSLy9rCRuJ8RF+rvdXNnorCY9
	QK3YxXP4zgwnFupMtXnYe94dGQq1YtuARaKJlxVgGMT4o/EeW6M6xAk02f3IjwYy8Vm2VJ/ZVXu
	cUMIHRJquYRfCODkXecEkpCxdtYrWof6qxbwwBCXB
X-Gm-Gg: AYBFou3Wnm1sOUjxImE/OsCMQYqUXojinDJmj+EoXG+Tqgr6X6Ib07KLefQp2xUYMHz
	9l1uffVz9fcCAZKtbqTLd7ikXrfUuklnJZVLRDyc9rkScZWMt4UQQqWltqZ6FNwcqLZj8C6ktc8
	CSbGBEPgHzcqqOQLHNUMAIMLJo+A4QytxJzC/orkhbhzydlfO7bUAtUFGhW6QEuVY+stflQePjo
	JSHi8kV+WQCvQ3/w2AkEnCfnS5YVtNAIjmnCp8K/WGNjepoAZurhgvdQhSZxW7jJrkJJN4xHulN
	wtNmWqKr1QSGCgPf4vH8DmJfwRI0Ih6BhJEYcvc9XMmmFH5xfCZFKppbM5sGBduzHOLi1KM4ZNA
	83OEowtsF740YQchzgIEf6V0egngP9WKLMTTzRABBBIY7oD5vLLeg
X-Received: by 2002:a05:6000:4a0a:b0:487:1084:10f7 with SMTP id
 ffacd0b85a97d-488716a5f1amr3158902f8f.28.1790246007990; Thu, 24 Sep 2026
 03:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-gpu_info_intobytes-v1-1-bb2173f91e11@collabora.com>
In-Reply-To: <20260923-b4-gpu_info_intobytes-v1-1-bb2173f91e11@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 24 Sep 2026 12:33:15 +0200
X-Gm-Features: AclHuK804AwDAE6HGEoAUsZfzHXQ3A-22uNDOLxivpJVZwrsF_RPFfFu1xUpH0s
Message-ID: <CAH5fLgg9xCmiN=MdNpxCLOO5zByVxrPNxhqCeiEQNpb-U2AooQ@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: safely write GpuInfo to userspace
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 2:21=E2=80=AFAM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Tyr creates the struct drm_panthor_gpu_info from the Panthor UAPI
> bindings. It initializes this struct by querying the gpu and then writes
> the struct into userspace memory faithfully byte-by-byte.
>
> Currently, the struct drm_panthor_gpu_info does not have any implicit
> padding, but if implicit padding were added in the future Rust does not
> guarantee that it would be initialized. Then when Tyr writes the struct
> back to userspace it could expose uninitialized kernel memory.
>
> Tyr implements the unsafe trait AsBytes for GpuInfo whereby the developer
> guarantees that struct drm_panthor_gpu_info does not include implicit
> padding, pointers, or interior mutability. This allows Tyr to safely copy
> the struct into userspace memory. However, relying on the unsafe trait
> AsBytes is fragile because if the Panthor UAPI changes, the SAFETY
> guarantees may no longer be accurate.
>
> Instead, use the macros provided by the zerocopy crate to safely derive
> the traits IntoBytes and Immutable for struct drm_panthor_gpu_info. This
> will cause a compile error if the Panthor UAPI changes in a way that the
> traits IntoBytes or Immutable can no longer be implemented.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

I checked it myself and per-type declarations are indeed needed. We
can't use most_traits for everything yet.

> diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
> index 8402b0c93545..65d913181eec 100644
> --- a/rust/bindgen_parameters
> +++ b/rust/bindgen_parameters
> @@ -71,3 +71,7 @@
>  # Structs should implement `Zeroable` when all of their fields do.
>  --with-derive-custom-struct .*=3DMaybeZeroable
>  --with-derive-custom-union .*=3DMaybeZeroable
> +
> +# `drm_panthor_gpu_info` is copied byte-for-byte to userspace.
> +--with-derive-custom-struct '^drm_panthor_gpu_info$'=3DIntoBytes
> +--with-derive-custom-struct '^drm_panthor_gpu_info$'=3DImmutable

For this case, I think we should just do:

--with-derive-custom-struct
'^drm_panthor_gpu_info$'=3Dzerocopy_derive::most_traits

That will automatically give us these two traits.

Alice
