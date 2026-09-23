Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E054413780
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151054; cv=pass; b=bSuGvcwNCTYp/h6P5Ytnsm7Ik9l0r/ihEf/zs2XO1UOTzHu28E81k11xlkUIwEo9mQh0cbhhb9heIBa/DnR/fAykgHrX1bZcHxM+D01qzScpKDQW9upxkYgL9G9hIWxhR+X8uLjpqsFAqBKdxqta00+7DB4u8O27z7H1SfbC2gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151054; c=relaxed/simple;
	bh=52slL8Hr8rgjB8Ot10IDBs/l6D+Y4XBWl6hOA13KGyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oH3Nvkf6EUcYzhI0Sf/hcXP03mK8AUiVs0jjYqelS71w9bzvUz1HrBrLBIzn9BV/V96K1zBRzqpjJYhSgmg67Q3KU4yd5lRx2K8izDbP8NEHehF8KZJz1e03FkelAE22SRRCfZJUT68J6aMX3z+sbj1qoiRIidbmLSg00BquR7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wY/o/MUz; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wY/o/MUz"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so350964f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790151051; cv=none;
        d=google.com; s=arc-20260327;
        b=CFRV7nbb2ri+3lZXXKTp5LFqBaLIwkstqOxJlaxAMOSR4qUmG17LbX66nVdNcAs0oV
         ZaWmll8D9l032Lt97zDwgI+Jy+Z0+nZKVOgpAsRBqGo/3a+DBzmGynAypV2X1p1TkKh2
         arZoK1AzDs3F+Dq4rKK+h8aKs0FM5pDqL2hCBuqM06fPJ6pWjjhGcPHX0cOTGE3mlJ+l
         S43ZkVtQGmR1SORmwxnyl0hskkbb8hbt3FvIkG2MXSkDCIkA8RKlbxHSV8D8V9vMKVck
         UaVHg7fWpRV0PhpxJzmvcIYahJYD93ugIp9RyJzzQlBUOTtjzh/QD0zK7jtk1ogIpQ4f
         uyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=52slL8Hr8rgjB8Ot10IDBs/l6D+Y4XBWl6hOA13KGyw=;
        fh=8d2mJI/JFxMZGF1sJs/8uOi4Jd9RnOw5lMcOiR5fdYw=;
        b=PfaCNALfCpGSUljWrZguJ9mudQnbMguJpVO9RlK62PHfxFMSQ+4FEDIaz75KaGeg9Y
         kC+TYItE0yFuawwOz1/hVmSrKx6jfW3gEQR2oqciqLUaH0yu04nQta8uTZ7MhGT7CJ9F
         5ZIbEZYlqbfPkmK0bREFlGazfxpIGIDbPL8cfYfz71w6h95mhGCn4ZlCeffe8Igr9fTA
         z3p9ZYjC1u9xdildhpJYroj/kpcNrbsGQCSW2dNJd/IO6IV9niOZnqAu7dQk+sZE/A+9
         uG1n8r4uWS/L+Jy0sVPISo3rQbE9rx6uVy/e6SyiKirzC5DHBZWhsVZXyU05BPgB9MMs
         nMUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790151051; x=1790755851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=52slL8Hr8rgjB8Ot10IDBs/l6D+Y4XBWl6hOA13KGyw=;
        b=wY/o/MUzRro1mx8juemsMVZ1BEL6U+icyGCjN7xSMOm54HlxJNGNa+TOAIrk87sCoI
         ViczLvNuFplCnJ4vDl8S+Xw/MakDAAjiLsJlNB/ds6WVVzovL7YDWZrgqSRamgT0PkuQ
         f0nVFq4dNaePhkh+bKHrv9QftOEtNdCSHny6BvyAZAF4NC8aQCjdqNM+P6TmU9kJMneI
         IvzNI7ZJI/JZ99IE6Kj7O81/GL6WDkNoiOJOlzwZ4xx6uyQEkjlc4j31UyJti3fi4DRm
         rN2j3FbvjXSLABu6hAm5vEnRhOsym89SMTyuX860Jc1Ivn+YSOxfFTttDCOS9bYLCAJb
         1PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151051; x=1790755851;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52slL8Hr8rgjB8Ot10IDBs/l6D+Y4XBWl6hOA13KGyw=;
        b=oBwHHnBu33YhTNXWRl184QTNGqVIE5eFg7Uh2ABMshh6BIIH8vbXMXWCK2zFBtQK8b
         q36pDY8oIIpb4pTmDPs95pMm1PnFy/bR3fff7BaJfVAYxaIPcllnhrTjNu3ldbQXpqYL
         +rnCNDeZ6ChCZunRNJHh0pku86D1qaMuhJ/sn/6eI2YRHDJCDVUh2WA2EXXPWEiLgiGW
         lMBxuBYnJszypKRarQJ8MN3TYCGLUu5KSC73Rr84i0xJykm72T6FUSQ3mxMEyH3FecFQ
         mOhLpHpLky/hcyRjqJfLHmrdz9Su9PLMlS46boAZNpXh0RpL8p/m9AXs2B0FPe7L0+ea
         TQ9Q==
X-Forwarded-Encrypted: i=1; AKwUvBymCg+JX2xId9a5tNsY1WaKAjFWFExjWUO6n2VfKCb/l+wkVrQigLCow0OGlLjGWE4J1FK9ELUorYITyzw=@vger.kernel.org
X-Gm-Message-State: AFuF++kN/0zOoM15I022qNSI7SYo67ek8VAXznld/8aanyVsgsTut/xq
	DyJsJcelXJky8ysoIHhfPo4U6VkuOYeNDFV3Pq0bNeBnfQq0g5P1eaEoMWYjhF42d5l4MbsSPAL
	SSOmkRq8jhFCtAehvopDWGf/EX6nj7NZUt3opdA6f
X-Gm-Gg: AYBFou1Df1cfxvZM6h7ulQFRA+4nXqDZZRNTNzUGQN34YMYuL7fKQ29vnzzGajJQLDM
	MCl36672FpI9h6sgXgdz2NWMV2Fd2HnQ2BzWZw74yCMv62WvLivAFkrB7JLQ+IT1vppEMDcIFLm
	cdtAjYCn0kf6dVU0eXvRaGzXtPIuEOVJaJiCGgVynSubhk9BRUlK3S91bPHl8KaNZEA8HaiwxsQ
	FsGYY+Kgnzy7U1ntuoJsBGXph75fsvQLwbMKqSp8MET7H3NgPROVA+PMHFyktQgyHTgS2n/1rRQ
	PwY3/TvBQRRRy6nbQIQvJdM5805jmftId0Rnox3XmdlyyK7Hwuu/Q3wC0fqcVy/brK3ZOwRUA3l
	/ZqyhrOEUGxrIkidK0YhFBM8PRIAvM0mftMgzcc/QwQ==
X-Received: by 2002:a05:6000:26d0:b0:487:360:4fd1 with SMTP id
 ffacd0b85a97d-48867060af3mr3013286f8f.5.1790151050299; Wed, 23 Sep 2026
 01:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-b4-add-list-for-tyr-v1-1-cd74ff2c1f8a@collabora.com>
In-Reply-To: <20260910-b4-add-list-for-tyr-v1-1-cd74ff2c1f8a@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 23 Sep 2026 10:10:38 +0200
X-Gm-Features: AclHuK83N6NgEdKtHsRmRTgf29F0Bv9EGKeqa04ZEKo4C3bnWfWqYur52dyGeok
Message-ID: <CAH5fLgjerphsjv75W-dS+GOg+XgX15KchR1oFv3wCS-23MLreg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add rust-for-linux list for Tyr
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 1:20=E2=80=AFAM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Tyr is a Rust DRM driver and Tyr patches are reviewed on the
> rust-for-linux mailing list. Add the list to the Tyr MAINTAINERS entry so
> that scripts/get_maintainer.pl and b4 prep --auto-to-cc include it.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Merged into drm-rust-next. Thanks!
