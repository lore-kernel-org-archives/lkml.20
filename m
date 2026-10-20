Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483279;
	b=YDEjvr00hPmxtQUKBzjJwMYynoJgAPQzDwXkgXU/cTokKZYsCFMP+pH9Hafz6iSIqyVh
	 sB8/OS6ndrrt8CSz1jAKBghjFhxBYwlqIMQ7n0LTIsjuofE8M4DPoQAws33SaAJrRR5q1
	 i/acFrQbuuq6kVxZmrjC4DcEFehSZpwnMrZhr4z3kYkWR+3/eZ8YMT7J2r2eg28GjyyyU
	 kQGaIHcyRaTishlfgTASogmuCu6uWckakztTaEhQeU+DHD2nvtSf8Pol/k5ZEWq5CO34m
	 2J+mG2kcK1/Ab1JfiOMPFTPDVbaoAijr+k36yLjrFwB2p+CZ2wpWlMsIxH1v+6taGjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=xQxfbDvKliDHyezjEs6HEpfyze+JfozKdYi4BuTrbb0=;
	b=imO8sJXp/YtchNkMDzzKXY9fzmlFNiN9taGBs8LJX0VOUTZCnljR9Zx74DYSmOPKU1T2
	 fLeEuuS0T8y4cj6zmLiw9YLitkO4GCvHMKaY/DnlZT3Z3VBgMxj0X255gJTDpTBCFzUJm
	 mb9xKttY2O47L0MrD1zjpEy50sGkDS/ME/C3qd54nB6dkIlDk1C5CYDygccTPabi/u2nQ
	 QF7lN99AfD8M++wC0dskf7o+1W1LITO0wgCZn9pNbYzaN7xBfvhDEY5bsLG3kZ9jtnqS7
	 3SJ+t60CHcp/K4ErB4jalltNrHdGCujp8o+K9ngm2Xy69YpJuWa1Gi3IjCxs8Z8uxEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WTb8grPc;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6E7606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD6E7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WTb8grPc
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1e3efca9aso22721315e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792483277; x=1793088077; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQxfbDvKliDHyezjEs6HEpfyze+JfozKdYi4BuTrbb0=;
        b=WTb8grPc35e42wWKA9MKD3/DIYj8JnY/7EY0N5HqKTIFAYWyPxgvklvIwQrjvJOc9k
         X35itbA0AjxRRATtvRJRE/WRCazdtdsjzU7+GW6l+hDmDj0BT3LRW8kclnIAXKZKL/PH
         blRauWDLTCkzK4CrGteYfi1gdSEQnHmE77USmWhsTa0yrZ1fe726wOP8zDx2RVth76a2
         Se6PlKYC7HSD9rqxbakclIvCMSynPesmOthAuml/VeFwMG13uHV9KjecXiZOpam6l51l
         uBj2o/kBprPF3aSh9veRgDOPnwiATu4/r1NL3IdbUWSn5+NHqNE2nleWuDg0+xHxsWQN
         usJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483277; x=1793088077;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQxfbDvKliDHyezjEs6HEpfyze+JfozKdYi4BuTrbb0=;
        b=za+BGODyvMYnY5RSkYVlmYdGm53p4/UYFDbsLr2vJG/xYEYer0S5uwyGxk7JFxG2Fs
         QMw8jooeREN+MbPAK/xhDAqGom0Hjz7LdDtvYPBSBYbnlonVHJTg9Tgx3rUPu7YrTlrN
         xx1kx862qLrMsulOb7k+BPJUIX4bNEjNtpLzFRjrQn3OpjetHwc4XoxclppWjuO2m6hF
         zMatkHEFkP76fyW2j/he9F/cvaPDKS+HJZOsx2D09POY8++/816C00CfzIsA20JczZAP
         WYn5Hs/Hq9wMlIc2BOsFGfwayuuH26RmNePttkh2tE8+XUSq+gRiCPXa96W9tC60leLU
         5e3A==
X-Forwarded-Encrypted: i=1; AKwUvBwuN/fFzogD1aFOViJAIR6h+H4TYW1BwWDuGgpQz3BkUsMmw3cU7HsFoFsiecdHSKHFtOgWQX41WGDfz1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCf6bCYF0rOQdwoVIIE2cWXRnXijI74hTQOp8tfLy+YQYbtRi3
	B0TfmiEafnpoNMPgfhJDatHbQEi7Zw5v7l80jW1rtUbcac77LMBaogB8Ozry94Q7NhqyUaD9NRB
	wfLnd54GVsEWydRcG7g==
X-Received: from wmlv13.prod.google.com ([2002:a05:600c:214d:b0:4a1:93c6:a7ad])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:82c5:b0:4a1:e575:33dd with SMTP id 5b1f17b1804b1-4a1e57533efmr134049685e9.18.1792483269703;
 Tue, 20 Oct 2026 01:01:09 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:01:08 +0000
In-Reply-To: <20261019-b4-gpu_info_intobytes-v4-2-0bc04df46549@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-b4-gpu_info_intobytes-v4-0-0bc04df46549@collabora.com> <20261019-b4-gpu_info_intobytes-v4-2-0bc04df46549@collabora.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020080108.1742496-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 2/2] drm/tyr: safely write GpuInfo to userspace
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 04:26:00PM -0700, Deborah Brouwer wrote:
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index e1b04a0c5159..4808bcbcc3b9 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -28,6 +27,8 @@
>      }, //
>  };
>  
> +use zerocopy_derive::Immutable;
> +
>  /// Struct containing information that can be queried by userspace. This is read from
>  /// the GPU's registers.
>  ///
> @@ -35,7 +36,7 @@
>  ///
>  /// - The layout of this struct is identical to the C `struct drm_panthor_gpu_info`.
>  #[repr(transparent)]
> -#[derive(Clone, Copy)]
> +#[derive(Clone, Copy, IntoBytes, Immutable)]
>  pub(crate) struct GpuInfo(pub(crate) uapi::drm_panthor_gpu_info);

Two tiny optional nits since you'll need a v5 for patch 1:

* `use zerocopy_derive::Immutable;` can be placed above `use crate::{`
  with the external crate imports.
* Now that `unsafe impl AsBytes for GpuInfo {}` is removed, nothing
  relies on `GpuInfo`'s `# Invariants` doc section anymore, so that
  comment block can be dropped too.

Otherwise this looks good to me. Feel free to keep my R-b on v5 with or
without those tweaks:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
