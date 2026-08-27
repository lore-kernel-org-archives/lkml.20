Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7AA2D8376
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823170; cv=none; b=dKXAVjFdrYGU/hjFwVk6m4SMV+Ohg3+7uu+V/o6UAAffi1i898HuFoTe4dOsj25gQ/LBt/cMrFuwz5pTjH8baR9o1uh0HalJy4uVOmEuTQjwMqo20Y66CNqmzV8nyEcmBqb22tFZTFojQZzYO9V1liM7LmAmMryWKnU4+ks5U7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823170; c=relaxed/simple;
	bh=FN4dXpCMRANBXlU7RQqsFXeCvaEgNoe7ceT6uG7LLRg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PxZ8nx174rzW/hxopVgoUCkk7bSDIQjtjsp/9jBOSw2d4+R+JgWLKVfPLhy32bcoKlYVEus8KWKBEvKLbbUsI53+2nXp0p2qzRkyU6bOQb2cCnxNeDg1yK0a3B48Nzve2iu3IlwuiFQBm4RYSNNE8O+ZXYssodLVIXNTvhZDrPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fynvk5iV; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fynvk5iV"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f726186c4so1136828f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787823151; x=1788427951; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOVo/FTydc/3lTq5xwei4nbCv9MVREwBkwBRQhpC8zc=;
        b=Fynvk5iV3yJ6rZ/tuFqgqc/W2leATLGK+XgSUNdMTG+z/Ts8P893R9HwMD+qj74RWz
         zZbY6wKcBcd0VF2JDyCEdZDtIBbQSNgPbPj3zbI7GwZGR/zs0PKchIF9ipNp1VbIvSEA
         33QZ8JBQ0rsF8RwNnBXT4AsotBho+QmFHR3k+bbLxQBQfKZHZW3e/IpasF6qVxqxqPxF
         zjp8Y7Oqk3bL2vIWefj8v5B7FlmD78Mchbi3+nBmzjWGXTqOhoUN0umzsLW9Mz+rs6Yu
         Q08abVHGlRyoyMWZkozXQaV0/qW4fkuY+mRxDhErAiG0CbB7t8WxOQ1mmIZlFWqjqn40
         kHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787823151; x=1788427951;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOVo/FTydc/3lTq5xwei4nbCv9MVREwBkwBRQhpC8zc=;
        b=VAYrASBjpLwjE3zXqKe7iNG9CJXl01XflAPYFwaJ9pos9fBB5PIoan5d2hLuvg8p7k
         10uZtof06X8g1j+I4RnrocOIxvkQXjUey9y6UrUNSPF1jTAhMcY+Yk2dtkYOLOEpPjZk
         /9W/EMWYEno0rp0/tYriKAM2xLy//K+lpoDgtUBvnmWjZg2FH1JQqrtM3Dk0p3ZEUOkr
         PyoOt/HWEdtiTj8dK+23cp03ZqPFrUdfFLtE6yhiWz0HHIoEt1PR9h3qO1vHDSMCDG2C
         AkS/85Xfe3rIecXcvSgW1hJ+y5d1vzhaKU5n9GBzx5sLlXFC0LeHZwc+ewyCKiLusKoL
         tMXQ==
X-Forwarded-Encrypted: i=1; AHgh+RopkQ+hEdxjCNJVQ901tYLvj1WcONRHv46tqjq/PCejyKcQmKPAfKTjwHiLZEBrtJQWnJYsDHMVqAx299A=@vger.kernel.org
X-Gm-Message-State: AFuF++lA+XPM9edmKW8+Dl0CgWfZFYFrsZ6j2OtM2aRIZ81jtd0rt3py
	ZVX2zQlshkeMxYToVaLLs/jSOyUupIo60LE/8mv1RlZRg/HImLLE/I7AZM9fwmo+2VmQLLtknHv
	Lp8Q+rXA1HFfJUUDySA==
X-Received: from wrck21.prod.google.com ([2002:a5d:5255:0:b0:47f:6d55:abcd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:41fd:b0:47f:95e8:2ebf with SMTP id ffacd0b85a97d-482e26f8466mr17865060f8f.12.1787823150366;
 Thu, 27 Aug 2026 02:32:30 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:32:27 +0000
In-Reply-To: <20260827-chid-v8-3-bc74c77d0214@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260827-chid-v8-0-bc74c77d0214@nvidia.com> <20260827-chid-v8-3-bc74c77d0214@nvidia.com>
Message-ID: <apAEK9CUZICDTL1i@google.com>
Subject: Re: [PATCH v8 03/12] rust: num: add cv! macro to create values from
 constant expressions
From: Alice Ryhl <aliceryhl@google.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 27, 2026 at 04:28:31PM +0900, Eliot Courtney wrote:
> Currently, using NonZero/Bounded constants is quite verbose. It's
> unfortunate because it disincentivizes using it in interface boundaries.
> Introduce a macro to make it nicer to use. The macro `cv!` (for constant
> value) takes a const integer expression and widens it to i128 (at build
> time only) before passing it as a const generic value to a new trait
> function `FromConst::from_const`. The trait is implemented by NonZero,
> Bounded, and Alignment and lets values of each be constructed from
> constants without a verbose turbofish syntax. For example,
> `const { NonZero::new(1).unwrap() }` can be written as `cv!(1)`.
> 
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

This doesn't work in const context, so I don't think this is a great
strategy.

I would want to use it for cases like this:

drivers/android/binder/netlink.rs
        const BINDER_CMD_REPORT: u8 = kernel::uapi::BINDER_CMD_REPORT as u8;
        const BINDER_A_REPORT_ERROR: c_int = kernel::uapi::BINDER_A_REPORT_ERROR as c_int;
        const BINDER_A_REPORT_CONTEXT: c_int = kernel::uapi::BINDER_A_REPORT_CONTEXT as c_int;
        const BINDER_A_REPORT_FROM_PID: c_int = kernel::uapi::BINDER_A_REPORT_FROM_PID as c_int;
        const BINDER_A_REPORT_FROM_TID: c_int = kernel::uapi::BINDER_A_REPORT_FROM_TID as c_int;
        const BINDER_A_REPORT_TO_PID: c_int = kernel::uapi::BINDER_A_REPORT_TO_PID as c_int;
        const BINDER_A_REPORT_TO_TID: c_int = kernel::uapi::BINDER_A_REPORT_TO_TID as c_int;
        const BINDER_A_REPORT_IS_REPLY: c_int = kernel::uapi::BINDER_A_REPORT_IS_REPLY as c_int;
        const BINDER_A_REPORT_FLAGS: c_int = kernel::uapi::BINDER_A_REPORT_FLAGS as c_int;
        const BINDER_A_REPORT_CODE: c_int = kernel::uapi::BINDER_A_REPORT_CODE as c_int;
        const BINDER_A_REPORT_DATA_SIZE: c_int = kernel::uapi::BINDER_A_REPORT_DATA_SIZE as c_int;

Alice
