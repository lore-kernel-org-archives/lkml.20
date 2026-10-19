Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5C34848BF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396925; cv=none; b=bHMV3tWzFNUtH8PDvNntyF3nfOEZhRuQwYBWua0uz2uaYozu2WO2/G3AOLbTnIsnhttJNahPhp9JlAFfxILkxdjmFH5nklmFZtuC/b2mHNiNRrDLB4L9NCSmTbZ2qg4BSuoHpqbP0cpzpTMlZm5rL6+XNVg7o9jpoGA56Glki6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396925; c=relaxed/simple;
	bh=NlaG1q+ONGQJbaGNkUUh9mATkYcGFJVJQJg6b3/oBZk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MedV7GSA/xQsQQbU10BsarJfd4DSG0+jEStwrqCKFJydtqk1axuYg6NPz8aeh2SEj2njQuJoEqUPxtcQ63q6X3v+/DJLR8IKvPYHVP2z8Ka1kwI+dVG+AIVvB3xRaMKrA0WSK+7wvf09X4+dQidyv54SqK9pZiYxrmDR2gBpLJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hxmg3v7i; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hxmg3v7i"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1e489f97fso8096425e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792396921; x=1793001721; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0t3iuUoGIZRca4fYcmBoqCEhSRJmAHTnYpYvfOnYow=;
        b=Hxmg3v7iSQQ1mreaWN+mNDovW3eqXKEyFrVVnCI0lFOVEruTiG6zM/jDaeE9CyUZy/
         uSLSAPjMbp5Rs8A47VNOU/LPHL60ngCIfiVk1BH64u9KYedu/9dhkHmjfI9cTeCrqD0j
         yOtCzxKO1gcGhRkq0N3HcRbmLM9MxtLwXNT7XsUIJmFdcyS335rnWJ5OjfgMKK5T85Yx
         25QlFxrJaQpgfpWSYVdVbHAOUvZZoILrxLCNsEzq3iOLd2tLfAdPdhm5IKeEHa0EeAAO
         sv7IMafKpH2XtA/M3TD9d1u3ThwUqMNC3I330pKeqIcE4jrDuJrfHEvHObh+SCsPhwNU
         DqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396921; x=1793001721;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0t3iuUoGIZRca4fYcmBoqCEhSRJmAHTnYpYvfOnYow=;
        b=AXxGbD+wVlMjQ4nBq7RvAafE7RGPQ2jdknPig16j3A/VYLGFWByXImyyg97RJVIM6T
         hHk9JS89kvto0RKriCF4y+Cn9cI+TT7XIiOvjCSMoTzn2dH5ikJRGFknk1O5fb4/MbmH
         6ZN7SLQIaF2zabh/mpuqyOEcnnRG7oSuuv13amdhzEEYbsd3wiKyxdWcIVt0z1V8lQiA
         SjXDy4M6fj0l2WtdjxL/5bYg/yVJDcqYzfSMZqnpR7x2CJP7ZHal8Zw5mlCcBS32X2+9
         RT0goPa5XsSooZHF3wS9CXEX4Fdu4cY6F7VUtCZalXQjpFaACgUDKVXDt5WHu/T6j1F3
         VT3Q==
X-Forwarded-Encrypted: i=1; AKwUvByfNKKOnyiK4c6xPvZ9AjOFxHyTCvHG3ujNE94MaoLz6wgMUnkVowRmjILM3E7uoFH0m536MTxQHYG1jfc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOUfrbEexvNV/ttuJ2ZOscJ16qmtf3sqv8WgxKbKoSfMCdGui/
	Nybu1/HBMnERi84NL9lqR1HImHIENSEG3wBErwcBobdHFoGvXn7FRwcGH6AZZkXqKOVXsHCc22m
	BE7hBuqjcpZHCKIX/KQ==
X-Received: from wmjk23.prod.google.com ([2002:a7b:c317:0:b0:4a1:c221:789b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b22:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a1d7615cb9mr143326165e9.17.1792396921174;
 Mon, 19 Oct 2026 01:02:01 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:01:59 +0000
In-Reply-To: <20261016-b4-dev_query_fixes-v3-2-f8071cda3515@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016-b4-dev_query_fixes-v3-0-f8071cda3515@collabora.com> <20261016-b4-dev_query_fixes-v3-2-f8071cda3515@collabora.com>
Message-ID: <atXOd-EeFkdA-trn@google.com>
Subject: Re: [PATCH v3 2/2] drm/tyr: allow userspace buffers to be mismatched
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Fri, Oct 16, 2026 at 01:44:21PM -0700, Deborah Brouwer wrote:
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
> ---
>  drivers/gpu/drm/tyr/file.rs | 47 +++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 39 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
> index 9f60a90d4948..a153aa453ed1 100644
> --- a/drivers/gpu/drm/tyr/file.rs
> +++ b/drivers/gpu/drm/tyr/file.rs
> @@ -1,11 +1,18 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
>  
> +use core::mem::{
> +    offset_of,
> +    size_of_val, //
> +};

size_of_val is present in kernel::prelude::* and does not need explicit
import.

> +    transmute::AsBytes,

Use the trait from zerocopy instead.

> +    let mut writer = UserSlice::new(UserPtr::from_addr(usr_dst as usize), size).writer();

On 32-bit this will truncate upper bits. I guess that probably matches
what Panthor does. Is it what we want?

Alice
