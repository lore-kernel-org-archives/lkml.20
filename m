Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267307;
	b=1KU1Fr4K08+6+OL9z/lKOM+i/OO250tmqm6JBsCaAKd0OfN6rUIs0KNfBb2WohYi/YKm
	 0zWkT9JB8jgAX3hN0Ar1P4OdCiOxdYl0svIDCFWEo0Ov7KxUd7C29iBM34FvJRJ6dcgZ1
	 nawauBHmRnSoiiqUuE0Vs0PV8VTeM76PdfxTyB7PDxA/XWsBsP/lWJvf/vkBD4TrDO6AW
	 QZ08n5JQwkgIWHd2SC2bU5SpPkCxPsMR2ELBBaOWQVlT1u8oZt5yq5zAdICY1IvxxHCl8
	 s3/GJTsx/AANFwfqh20ZIV3Suf2HJqOaob7WopslluMHmw2e24b7pAh/c27X/NPVMGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=FGbueYQO3ZHl/HehdiAMR3NdzwozdadRj7RvSHj/9W8=;
	b=kYlcXJbcmqgIiaQ+LD590ggrghqAuhDo2w6rj9D2j4jo/woA3mFJFc9gS14JCI2SeBoo
	 kal5XA9DN5q5ry7rrbWQqXlsz+3KQoJpp62m6EEmlRAmvv3lAR9FTRNF0PWCVPBvvPfoL
	 aXiN6PA41QqVG74R2ue6hKt8dvsh0DNf9xTeoJQ+HayBCuRvmxJgm+Y8si+GKM8F/dWCy
	 pbFsqZqBt3oUSqF24xw3HcMcJGfPYUS/RU5tRds0IbvTbNufwwSA1KCR+QM9IV7FP2/4v
	 htjPOqp4fAqePffbAspEavlPG1ta1sObV7cNFGde5yrVhl9tS078IgN8tawJ5Z7hHlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="F2mz/Op9";
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2243606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2243606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F2mz/Op9
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48b00febba3so1231458f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793267305; x=1793872105; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGbueYQO3ZHl/HehdiAMR3NdzwozdadRj7RvSHj/9W8=;
        b=F2mz/Op9BfW71oImSpDkMRFAN3aPWMxH7P4CDZWVg2SMGv07c1UNKMhBNsuKb90e6L
         9rFF8ySezG5ia0PjfPUd2suvDmhl0XPBF34cPBPK2dyG+aDW23lpguMVM18WxSGz9QVZ
         zia0FflQtfSCsN7yvrOWG2o/wXgj7VL8aIrj/V4RLim9tKejJ9bX2u20X2oqKxkTmWJM
         nRzKVrbl59tuiDgPVYUNDGWBmS8TZGiEVE1bqZ/IlNerMs8aDcweFwK1zMzYNBDMBMg3
         LZJDAZgZSOikYKT3Fbt5mNdjuSIAeJGBJ0KflEAyPex/hzs+89cWCojk3qlfN0TX5LOw
         hHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267305; x=1793872105;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGbueYQO3ZHl/HehdiAMR3NdzwozdadRj7RvSHj/9W8=;
        b=BQI8pDWb5MKm3bNqTgkymkHY2ziQWhlC3zz0Pzjj27LXL+UD3ha9/kkvcQ8iGomB3W
         kC5Mn8U0yv0PUn7aVfayrh/EaeV5a+a5lnaW925EXjf5QxEXQhTaUBmhmYQj+ABBuzab
         55IoRA56LoWHIWj8hMh7jZ5iGROCgB8t8NzjHB9m9ryLNrkM7FNT2e+EoJ9CGFKfq+Po
         rL87OYd/ghpN9oaMgOUKQno8N3oTKMlGpL63u7+BgLNPyZONnSCXi/itWX4Vm8xEGqD+
         yh0Le3t52/LoievxMEJaaSNWsCjgH6wJpDJYSjry/xx7vmwecryFpJtgTcJs1X3hbLAL
         RadA==
X-Forwarded-Encrypted: i=1; AKwUvBy5b63oSxhzPCmXbN3Sh8TMuLKhh+DqQaNSHqGVlZ44+FMQSijx0IFI6SjZreVUT7Txxv3N+lZm+Qw+pwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVfYjVoYfpK6fLM55rIs5hDwCBf6l1SAY5tbW98GRQm1lk0Xvn
	5AiDw+X9zhgKvaFKHNUl3cDKzkuczKBXSoDaLf/iJJO4bnruvj2CHXPtOqZOJCku7LZ05jT/zKg
	b4U4GeBSK5fmfNnrMuA==
X-Received: from wrvs3.prod.google.com ([2002:a5d:4ec3:0:b0:48d:eee6:b19f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25ee:b0:48e:5fd8:5822 with SMTP id ffacd0b85a97d-48e5fd85ac5mr9739933f8f.18.1793267305063;
 Thu, 29 Oct 2026 02:48:25 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:48:23 +0000
In-Reply-To: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
Message-ID: <auMWZyxtC1d_BUgN@google.com>
Subject: Re: [PATCH RFC] drm/msm: move VM_BIND op validation to Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"

On Mon, Oct 26, 2026 at 12:40:02PM +0100, Konrad Dybcio wrote:
> +#[no_mangle]

If you use the #[export] macro instead, then it has the same effect
as #[no_mangle], but it verifies at build-time that the signature
matches what's in the header file.

See for comparison:
drivers/gpu/drm/drm_panic_helper_qr.rs

Alice
