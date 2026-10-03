Received: from mail-pj2-f37.google.com (mail-pj2-f37.google.com [74.125.227.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E4423D291
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791046254; cv=none; b=TZC/F82pLQTQ7BjNpgxjkglR/kEVzBVDViuOmFjQc2Prc8YEyRT7HVXGZttH7U9Hbq8v9vVmJD2xpCOugk5q6W9RGLdEcrpEEl5hGgJJMNNdxIQ0l0DqnWXa8I6fFd49bB7HEvY07NSNM0jFl17lgYYe68GHAcqaprjelHmYJCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791046254; c=relaxed/simple;
	bh=rgmi8cN+SpzR1LZvYNcsfQI3YjDiUwkUJG5FRv+tXy8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZaeBb0whch8Sk2cS5CmQ85XAUi0T9rS/OOxvD+wz2AbrYWuKyV4zKFPNxRkbRJdhQxfnetbbN0WP5Wl1p6ObehDsZH/DIl921n8FPSwAz5WQbcrEcHaxGFwA1NueAxV1LNAvhznslOUz32gnHuZLw740fJiMPj1ellGFeJpR5SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgw5qt2x; arc=none smtp.client-ip=74.125.227.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgw5qt2x"
Received: by mail-pj2-f37.google.com with SMTP id d9443c01a7336-2e300fa474aso1926015ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791046252; x=1791651052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o5nZhr5o/UkV60cwhqj+G+eK5fQZjsPv6PrbldXN5Gw=;
        b=jgw5qt2xQtANLaCSCmRTBi2JHZLY5CA9UEC0EUZ296TrPmMkmXoJNDMn/hlQITYX3W
         p3J0haqnVACBZngYnRd3ZjNJ3l1x8tTt71yB5L5DdvOlYDfdx0832kiO2o/qc1fvE1FH
         aALBLxk1vGfl+4byTAiqsLbdqXizqH1L45pbF1gbI2hxr71yooL/gPz6x/wTz0P2jJ2G
         ZW0hdEbtCJYyYy7j812Wka5gNOkP3clwR2iYdnnN+HqPy2q2jermruXXfD/a6hZT/EJM
         cTs1ANU9y3hH4EyqPyXVb/RU512RIVz3Df80Dt3pfSfJY4MkUncP1ati19IKuR3HtOBC
         wy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791046252; x=1791651052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5nZhr5o/UkV60cwhqj+G+eK5fQZjsPv6PrbldXN5Gw=;
        b=cchCqYCiRsVvjaWzOGmPnCVoRFeyfaKoU4ak19UaEdcdI/NhR+u3kVqQN5zmKMdIsd
         eSr5WYMD9D844I5/sgEa6OryiTIyIsk1lytmQxofnnSYwIaCvdG0VSHmvPIc7JcjfpqB
         E4586s7FPO0hPxdwFMv5XPijba7fzSrp9rjFq0PtbzvSuOGcg/IghNTpYwl/+7/05nO1
         Pv0450tVjeVHKdBQPMHRrMC9zKM1UdPPejgF2czhnt5GN/iqpaLI1ySrbuZD/g4Wd4KR
         Gz/GDEzzbtmVUrW1XYwoCrfcu6SSsUlFoPfh9mdFgZHAQ3ZyC/AiO7fESoe568T+zYus
         NyaQ==
X-Forwarded-Encrypted: i=1; AKwUvBziUkZafg6+tWJVqkfq+BwymA5k2L6p7rJhM7NCLlV3ikJSSJwfFQWhTcF9mhcEdouSYNkIcTm+/PTz1wk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7DHl7fSrVozdnUG62iQsWs4halewgx6InbFEP3HrwkAZRjqVO
	d7Bk3Z4jwd7tWW3dK1pTyqJezXXrqXdjrjNde9zNvUYJ+nSlWz1dfBMq
X-Gm-Gg: AYBFou3NHqkabRkgzIMmeI7rAi/celTesx677YSs2k1X6qDPfx8mhFaAi/8nWL0flg5
	8Ss0nfPSWBKeHiGI3TXcgO1iLZiiqbSKzCRFSK250uWZ4dc2RT2+C8ZtLAsCXBhJFuQREWzuJTL
	FbHYbKmUFeNvHWnrkWUB81hB+9CQwHoUbSqCJISjuvcepFeovfxj/csYy7Z+S6WGrZy58iFR36d
	qpMxAIMCJ1WBCjJJkB3c1tGOKANzmtghh7XOnDZe+Wqx9x7P8ikbQRu36vpkdqUIgGBPWX2YKqL
	sck1o9CYYltgsaR/RKZEf2NXisEAVS4sMukFgEPTB3lx/9S0pOWnYSGoVLttRi7ysWxdBJcrKaf
	0ypJW3oUaSdl/ZBXnxJ/I4aTfx02I4oO3xM15ym5f43QXXNB4EO3TQcNRphnyvFXBmNCDhr0VVj
	7pB2A+rEI4h45MjbYx+qj85LKakP9GzAJG+gZZgdSTcQI3eTcovXvxCu4u8wDhmcshWKNqf/vqd
	ivd63d9l7pMXwjNrA==
X-Received: by 2002:a17:902:cec4:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2e49b60bfa4mr53807145ad.27.1791046252208;
        Sat, 03 Oct 2026 09:50:52 -0700 (PDT)
Received: from localhost (madb688426.ap.nuro.jp. [219.104.132.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6d65bbsm18157495ad.54.2026.10.03.09.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:50:51 -0700 (PDT)
Message-ID: <6ac1326b.0a67d0c9.2deb66.efb7@mx.google.com>
X-Google-Original-Message-ID: <20261003165049.6hj23qszaetwiqu5@DESKTOP-1P5QNTF.>
Date: Sun, 4 Oct 2026 01:50:49 +0900
From: Kohei Ito <koheiito.dev@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/3] rust: gpio: add GPIO module with common definitions
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-1-24d192f93760@gmail.com>
 <CAD++jL=pZG1ddc+v3ebeTKe-ZTKOTh-L0uXshaZWqOqyuqAYxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jL=pZG1ddc+v3ebeTKe-ZTKOTh-L0uXshaZWqOqyuqAYxQ@mail.gmail.com>

Hi Linus,

thank you for your comments.

> > Add the top-level GPIO module with minimal common definitions. This
> > module is the basis for future Rust GPIO extensions.
> 
> Describe what you want to enable by this patch.
> 
> - Enabling in-kernel Rust code to use things from the
>   GPIO subsystem? (It looks like so.)
> 
> - Writing GPIO drivers in rust? (It seems like not.)

This patch is the first step to enable in-kernel Rust code to use things
from the GPIO subsystem. I'll clarify this in the commit message. The
patch series does not add Rust GPIO provider APIs or Rust GPIO provider
drivers, but it is intended to be the basis for them.

> > +/// Describes the raw GPIO level, i.e. the value of its physical line without regard for its
> > +/// ACTIVE_LOW status.
> > +#[derive(Clone, Copy, PartialEq, Eq)]
> > +pub enum PhysicalLineLevel {
> 
> No thanks.
> 
> We want to hide the actual physical line level inside the
> gpiolib (encapsulation).
> 
> We should not expose the physical line level at all
> unless there is a consumer in the kernel that absolutely
> needs this, and there is none.

Sure. I have no need to use the physical line level right now, so I'll
remove it and the related definitions.

Best regards,
Kohei Ito
