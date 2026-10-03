Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A26355F47
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791046695; cv=none; b=U4ZnRYx4j3piICJOfQBdB0CSQFg7jwY2xPkRkVV1dp5Y+vObZWd/Hbu7rJzCCGOMXqnnFE/5fgiZ7XzVXqmcwubbgLbFkrdMvpSY5XvMKP/m2FVAGZ4W38FNMCbcH58ooqdQUSjgTHOrHcsatp6XsWXd1yDuBrKbTYBAwI6jnTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791046695; c=relaxed/simple;
	bh=tV68AEZfVUl2ePwMevpcFNFrGswYi8vmfdu1EZiJ9iU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/JsSS7TFLpQV+kAd1eLwmjXkXgQvG37UTYxWz2BgEWieXow6JyfyXtc8fSBpNgDfRlGEschco9QJVBEbnfRJhpUJHjQyeQLwaxNASE2zC8fIzKfAJ5t9iGCTf1ssBE1tp0d8W5c1Yw6zTfpGhRQ15tar1CwR1sj0S1jgFEdfOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcSIiaBZ; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcSIiaBZ"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a6f8525bfbso241198a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791046693; x=1791651493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MLMhydZ/wyB/4hMugvVsF4Xnk66VRKTgxqNM58pVWT4=;
        b=EcSIiaBZNQkOV5Q3S24HkwzJ55DoYFv5VXWOPk5GJv9BcRYW41F3TnwXkGPEYJZ1/i
         HjJTNec5SaNr6xVqSF0xpf8BtnWtKCXLH79aXCahzUTBCV61Nlmklm6Ps+yku3WamTnq
         SIXH/pgxwmcf5USpYreYTE+h3isy1XBC7WbLKHTgBYyezIG2P8pAUO6+ZHvOSC/CnNgO
         iJtZ3cPH6sS8k1Pwd3MQ+knN8rDxyoiGoDKppK6Pklc2/gsRrGrLH6lLdiyaaXIo+SOL
         iZIfLEoWIt4E28bXbykWcS7baEQUFHPP6+EhMinh2C+4k+v/AQnAPXOT1k9chewddYID
         t6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791046693; x=1791651493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLMhydZ/wyB/4hMugvVsF4Xnk66VRKTgxqNM58pVWT4=;
        b=1L9Eu5ht0/eklRLu+02PSVruRxQUY141xivAFBykfTpHs8ctkolZhtFsF3XsJJETXl
         miheM/CnAPAa9jbfxtg9/C3CdjbiHKseffuT4tUs1fG2Fdr31jUt0P7ktE9AbKLA+dr8
         muNn8xBoNVKwcjrhIVe8KbYN8su6GvYiuiDtiXZQRBiXChfuPbcQzTm8wVbcXS6cWRip
         FZXoAXrzYtjEkGyzz819mNT5QPGGWLh+39/42exVdTKcv6ezqgzbnDnbyic+bSd456oA
         WKzRCxfI7sWI9rGlqptukCPL1cVnf4+DgiN3TqVI4y1nSLTl9+TLY5XXWIMOkckfn2yR
         XD1g==
X-Gm-Message-State: AFq9FYJTnQndvqYrWKlF1KWE4+6bXpVPvc0YqGsIhdQu3eODf+S4eXJS
	GsP8ThUYwqWtUvu6TsWVMDyr2QdOVaXC9XuTx/Eu1y408O1WDjsSDyyl
X-Gm-Gg: AYBFou0hibSYvc/Nl4f/Wr1aO/5GoJCD+YMEmIq+itCYfwGxIIbDz2SA13X5v1yYCyi
	JHlLbmjTcah1cLpwxU6cwMKf2OUebARVVudq96vOfvOVWTX9V2TFgw2kCki1s1X7KtoIdhlqVuJ
	s7CjHUuj4LMZd16l0+ci4hR/E0TbNSkIJiJS4CJFa07tJBSi6K7dah5j0LpsdpbFEpuzOM/Cmr/
	dbC7BAEsk4iP30CUjlsb2qknrn0iR49E/tVRyTU5Eu1u0G9kx5xnFqMUyz6R2MjSTQDYQzmy7Ko
	yvlzWc2UJuyBjUf1X+FbVqCHK9mY3B4m4A6Msg7qGHsXtZP6WNVKhkrx4WmohjgQmlq4hcsUR/1
	3DE7dgwWkpTGvj1okUwPiryCrZSgcYJsNEVnKaA8hfn7n0OotyUcmWWNm1rbTAx8wEE4qy2hbaP
	tHOebFuYXLxKFVrqxOjPsjQZhrZjdCprhM7yv75hq2KajDa97s6lkLO6oKfAaJ35t+2zG244Vcx
	egEzX7t+DXznRDFnQ==
X-Received: by 2002:a17:90b:4ac1:b0:3a0:22bd:6ef6 with SMTP id 98e67ed59e1d1-3a6ce64fb77mr3278447a91.2.1791046692966;
        Sat, 03 Oct 2026 09:58:12 -0700 (PDT)
Received: from localhost (madb688426.ap.nuro.jp. [219.104.132.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d7cd47csm3574222a91.17.2026.10.03.09.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:58:12 -0700 (PDT)
Message-ID: <6ac13424.00feb36c.a9616.9685@mx.google.com>
X-Google-Original-Message-ID: <20261003165810.zgrm3r4jr76mkmq2@DESKTOP-1P5QNTF.>
Date: Sun, 4 Oct 2026 01:58:10 +0900
From: Kohei Ito <koheiito.dev@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-gpio@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Subject: Re: [PATCH 3/3] sample: rust: Add GPIO consumer sample driver
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-3-24d192f93760@gmail.com>
 <CAMRc=Meei7Z1f1n0M_Hy1LdxG=NVhkFeEiT3=p5QVpw6BTv3EA@mail.gmail.com>
 <6aa662d7.0ca013b1.1575e3.0a60@mx.google.com>
 <DLENO35F39LL.2YNA66D9FCXYH@nvidia.com>
 <CAMRc=McV2YKgbmnknLZTSGoSa_9eCHDiOLzuPPyPHHnj=vRuvw@mail.gmail.com>
 <6ab12d24.a3d4836d.3b68e.d0f8@mx.google.com>
 <CAMRc=MfZckBMT-4PEDxr-PjRbUPO4FY3OZw8ks3w+uoEyixbAQ@mail.gmail.com>
 <DLLVT33ESJA5.1XE4J08AEZNMX@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DLLVT33ESJA5.1XE4J08AEZNMX@nvidia.com>

Hi Bartosz, Alexandre,

Thank you for your advice.

> >> The best approach I think is a combination of a Rust consumer driver and
> >> a C kunit module dedicated to testing the consumer driver. This is
> >> almost the same as `drivers/gpio/gpiolib-kunit.c`, except that instead
> >> of directly exercising the GPIO consumer APIs, the module I'm suggesting
> >> exercises them indirectly, through the Rust consumer driver.
> >>
> >
> > Can't you just call a C function registering the platform device from unsafe
> > rust?
> 
> You should be able to. It's a but laborious, but better than not having
> tests at all, and acceptable as a temporary solution IMHO.
> 
> Of course an even better solution would be to provide a safe abstraction
> for registering platform devices. :) I don't know exactly how much work
> that would be, but there is already a `platform` module, so supposedly
> we wouldn't be starting from absolute scratch.

Sure. I'll explore the Rust kunit approach by directly calling C
functions to register `platform_device` and `software_node` from unsafe
Rust. I'll also drop the sample driver. I'll let you know if I face
problems.

Best regards,
Kohei Ito
