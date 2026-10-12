Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFE745FFC7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791844864; cv=none; b=jFbbLWcr0/mHpyDEzTHLVY+mLwq4kVCeOF0KUw0NEN8OFthwgYRs+1W4xYDkWhjK3rRGbqDrDI3FZwt4f7I3LUGKCt4eC7PTYhXtb2LRw8Vhg45i4MVFpEUApjFvQWMkOnhCLmc4gDNCLnKW5+HBqOs3FbIDBwFTmk6muR/dVKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791844864; c=relaxed/simple;
	bh=qxontQZzrTk9qBhbXlFgxD/XPImDShMGjHOsGhmy3JY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=RPi0zF2zkl0gZJZjQw6X/DI7xjfDK/U7VR+Lrm8mwW2k5b2fbAQv2eWS3V2VwnzBKQDyST2wOSs4/1XahHnfX8JxhYVfLlkPzGN1PHcTs3EpmPY4ez+8SszBVYlhli2OlqzcUpXQMTzBW1aoIS4p9ZTmmxtsymoCCFnO3hSO7g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hm7vf0dX; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hm7vf0dX"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1175775eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791844862; x=1792449662; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qxontQZzrTk9qBhbXlFgxD/XPImDShMGjHOsGhmy3JY=;
        b=Hm7vf0dX4HPXPZHB6Nc6LF5UuGYxfKNsgySktc/F21KDSqrDXGBDCxs8wPDiIrFNgQ
         RRUDmmj5cXyrCC5oSHgJ2tuxL+4mcgmyWp40tibRZa88Rk9B7c3iT4yEnzkGMgQx1Ni2
         mMGbTbaneKi3OQOslAuaelqP4CUUPwH9FRfjlT13EcfbQSmkyTBGEoxYvpJ6hEvY67x3
         ShpoBd/Q3qLZcVD7n36sNeuvi17PZBV0vyM02ofz9sdhxAaVDLbQtcgHyD/cjN419Xyi
         sm6UPYTrlQ4R17Ci/FJfPcKkkaVrKK351cwqJiOwBe0JqTaiHNMMWD16iZ4pWKJutzGD
         Nj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791844862; x=1792449662;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qxontQZzrTk9qBhbXlFgxD/XPImDShMGjHOsGhmy3JY=;
        b=BXDIhJ3fjKyIX2PVV2tqxj+1XGlWewBPMiHYIKz4XadZEscjSczrnx3VVI0YE5OUFe
         BCqXycPvoEysHoAxKCq2DmMVFDPm5fz822Nhetnj7ZlSnuQRNjkBNig8XwIrxO/3eKtG
         bzIchdtwpUaTtWBDWHmdTrvZxNjaVzPD7sh8AMXhe1CK7P2Rv46YyJe6rBtEi6hID+dh
         LOjnAMmPMHomEGrFS+XLDD+vqGsEOfkWdXzXsbn9OQ9FTA8qtxiLGAytLjubvoeGOhbs
         r5ihA8uuUJ7oK0OgsDhCqJAurRq729ZSht8C54MO4pCYmsGfLrFCoWt75bS9PfDjS3sK
         e5YA==
X-Forwarded-Encrypted: i=1; AKwUvBxsvw3do9HAewNjCaOKoN+9hW3McOUlV3E+mHVRBTf54PhDSjczJCpLbILIS16TaRKeQx9IFNqSuuC97QM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ03R7lwchsHmrh/tBL+5WRvaHot934Ob/nUbeFeLI5b0WwLkha
	dB84x8gvigG20KDaD/8BFPPGlB1haYGFh2pDqjB4ptvqkgj1rSaAyrU=
X-Gm-Gg: AYBFou1rey8QTLFB5tmotXZ3eX8kZUQq1h+XxUW5wvTdwN7JJ2isPiGgef/h/2u0Ux1
	6tQut4QKZ+WOQltcrwkIr3yDHkDO5vZtN6vr6J5fy0X0H45ecRleVIVo3PQzgB9qv27CmBSL4QJ
	F9pnR43g0JYFKfGiR2duBLTmSpWYLMIHftzKdADmDPhCRlgcZo5ZKRL1748jTc7PJPrZr3EhsTv
	dLDTFn30U6yYpA0b3aBpHTXF5Rna/sDRgd4g6A1PuoJ06cROgKAjot0mO44UedoqRRMUgfZlkIQ
	N+KkOYEBXxIMTyGW+sP6jtRYtB7I5txR9N+YVdBoHZXjHQOpMh5WqsuWSlbgPTEApj76MAxuucN
	HfvnOtZwx4ZGXLBk9bWq8CCpINVOfFTqqp781HHp/uprZhdYRfMB42X8X5LxtmLISyFDzDXmVyI
	EonZTH96slDdDncSrjfwHjVEb33R0qcF0oWNWspCM7CDF5L8OgGK5mLMMzmSHnpMISbBCpdRVOE
	61UHqlekS6TVqj0dCjxH57yO4OYCVIYjg==
X-Received: by 2002:a05:7300:7aa2:b0:351:a9b1:73c with SMTP id 5a478bee46e88-3537deccaffmr15649614eec.2.1791844861473;
        Mon, 12 Oct 2026 15:41:01 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm44925838eec.14.2026.10.12.15.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 15:41:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 19:40:56 -0300
Message-Id: <DM37ZN988OJH.3URFWJTSYD4SN@gmail.com>
To: "spidermana" <xuyiwen14@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: drm: ioctl: wrap `Device::from_raw` in an
 `unsafe` block
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: aerc 0.20.0
References: <20261007211751.2428111-1-xuyiwen14@gmail.com>
In-Reply-To: <20261007211751.2428111-1-xuyiwen14@gmail.com>

Hello! some nits about the patch body

On Wed Oct 7, 2026 at 6:17 PM -03, spidermana wrote:
> `declare_drm_ioctls!` generates an `unsafe extern "C" fn` per ioctl. Insi=
de
> it, four unsafe operations are performed, while the call to `Device::from=
_raw()` relies on the enclosing
> `unsafe fn` body instead.
>
> Both forms are legal, but the kernel builds all Rust code with `-Dunsafe_=
op_in_unsafe_fn`, which asks for the explicit block.
> The lint does not fire here because the macro is defined in the `kernel` =
crate and expanded in the
> driver crates, and rustc suppresses lints for code coming from another cr=
ate's macro.
>
> The patch is to wrap the call in an unsafe block, keeping the existing SA=
FETY comment. No functional change.

The lines in the message are usually wrapped at column 75 [1]. One thing
I do is writing it in vim and if I see that the paragraph exceeds the
limit, I put the cursor over it and type in normal mode gqip. This
auto-wrapps it.

>
> Signed-off-by: spidermana <xuyiwen14@gmail.com>

Normally, a full legal name is used for signing patches [2].

If you are going to re-send the patch and nothing changes, you can use
[PATCH RESEND] tag.

Hope that helps!

Regards,
Nicol=C3=A1s

[1] https://docs.kernel.org/process/submitting-patches.html#the-canonical-p=
atch-format
[2] https://docs.kernel.org/process/submitting-patches.html#sign-your-work-=
the-developer-s-certificate-of-origin
