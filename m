Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988002;
	b=U6RADcysTkPfgE3Dceqm0rNU2Ozls7R2Gu35LzqIybQ/aKBIm3+ytfrhB+/5Gj/YJqWF
	 hU9aIcxZR4oip29naHYDl4IsLarEfpY12oxBcYbMxnAReqN0grjnGvkKAE/oTUKXS4jOd
	 a6nhH0Pa5fYhdoTQMMiLMWWGThlcPIXFE6ti9+04hNr6IAZ6PKQvPNGmfDuiEEjA2qAur
	 n0ESpxnTXQfYGHbZ6AyL5wn3XnWOJaYOGeB1f232H0IuECtvHO3dedEHxRqfgOYGOKs2r
	 Q4XBTEPv+ippP2BPtg5O0Q21EgCB1JO0GMDV+hXhy7LDc+5rc7pizqrrw2SBK13qUqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l+HBRH6Z2Sf6XQfzze6i5pft1TRrO4lvAq6O629kQwQ=;
	b=sCdv9oe6/GOExxr3NI0bfpYC6YATRmlbtddcBHMN+jW7W4mFR4yjSWYoWPcDYHzMUVtw
	 9fGr7fQ7QC4FzdUPyVDtjR3gt2SAS8oZce539yrSgLQZhurGFkclFtr6nQv3y1RXJv/aG
	 Gm8VYgOviWO8nkFdCAdNtHHc/pN2ZaeABJhjxo/wfkVTZNHHIl4iUNBCsgvvWlBbYqjf4
	 1/O/YqEmwqSc7kFHgaTHB1kf4s5rSp6mHOylMkQ9JV7O8/MLJoUnyPb8bGeAr4T+qUuDK
	 RSyJZ72vyPexxx/U00vknF4SEt6vrVoZ/ax6rC6/lGY2T6KGBjy54YfEiGZYV6ERBGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=V7S9TpIs;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA63B606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA63B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=V7S9TpIs
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4697404c2bso119486666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793988000; x=1794592800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+HBRH6Z2Sf6XQfzze6i5pft1TRrO4lvAq6O629kQwQ=;
        b=V7S9TpIsPqXzUq3A6UkoBW71N9DZiWaA8wWWRo/cn+Ii+OaUl8iK3Fo/acjd4NRnkw
         xN76KbFxJpVXKLKrZX0eNxswogzOAtyhaV9Daq50KUI1qQ6bPVdWvyns8biF6v3u/LuV
         Sm8CRXLFqPAO7lbcQBhioPIgQBHvWkYe6MoAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988000; x=1794592800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+HBRH6Z2Sf6XQfzze6i5pft1TRrO4lvAq6O629kQwQ=;
        b=mwzcA4IjXlSr+v5XOEMFbrVgIdy43UqI8B85Qt57Ps1cyXFu3NywxbcZKhPYjYoH/X
         qxkwCfu93Cu4FVKtLATUFeu3YEw8+TUJrxDdZlgi2hi/ygcbiL4AEMdkZK4jcE3RM3yc
         5YJoZo1Ri4aIXlhRpU9ZL+JHN6nwii+Sssb6uVbrVX+mfeISnYAdXL+/4tYLc1ocnHou
         NEVj6bh0bGSUU0ZpRO3eL4MrwMCfBr2MZYiSXGZTYEID3epLzsMMfSRk8YyOFkcCc4j/
         QWmJJfjlyDuKNj27XKrrub24svdE6iZSR7LJ2sC1JE5Id7QflaJ0Vz6P5SHS8Y1/kNez
         oODQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSWd24Vl7ewDxOaD7mbXqr1t3knSDjMtVtm/ypfOQ/6omDnP5QxD2KwnGix5yCE8/bhgtm6ZezTPga+YY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RzJ+t6fJUJvsvI8FOEHqUYbF7c6cnU0PwLIiVaTZKrB0gk3sF
	/lwUHIe/e5PDDBd+P++csxj84aXqK3pThjYCZbcYEBuhyuGmMYUyTxKxQP1DnEy0vIH7lG/4FAN
	fb/6V8waO
X-Gm-Gg: AYBFou3Q3sPF7XFi9C6r3U4m8uKH6anAPQ2lTqyKEIz9KAeW3vbICN5kX8tpB85rFFA
	nWaLGaPD74FNR9cCKOi4Ztgf9ExneQ273iZvEN5O/Izpjk0gWo4Hy+FhZINVPgX/TlR7wNrzcB6
	HrX+zmV2+6benUkMrBqwwsnbrQc3XzjZ6ImDxE1QyDSZpXeQtWN5DM4ThmPvnWHes5bLTuy7Tmw
	49+Q/AocI6rjYsI2+VbfGUsLHiCnP5ftEpHZ8d06iVFxWXI9ELjk9KmKv18we0JbluzhiJFLoo0
	FlAIjI6sSRYWjyeCcSN3gx5oRiyoRCClqcst6ZYkyoSHDbgzp9bT8D7A2ciWe5EBf1Xra/RCMvE
	QVp7njHEyxkzGdXBH7yl8NkuWxW9Eg1+g7u3sNtuxqeD5iwucg2sPHc2xSUfK6lDI5RBHoEEpxT
	APUN1cu85inkeWZ62rAKdy3tKEwVi0Ou2PmlkEKVhg6qxFbG5tP+TBmLjMVn1eyNovbrbUVxDKr
	bxZ5JUiqE+lxYUaTIBRH9ErnqhorD9eUZ+jl+fLfHakAbubbIier0xWGw7NXgqdmH4b62QcNZAk
	Fr+hwg+uEtkD99o7WLMX7c75wpXJ8q1hJidf39I+0uUnwuWZ541ww7mafZatymBcoqk=
X-Received: by 2002:a17:907:6d06:b0:c2e:4e08:19ab with SMTP id a640c23a62f3a-c4d34a62a56mr258677066b.16.1793988000064;
        Fri, 06 Nov 2026 10:00:00 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356c5b76sm97041166b.68.2026.11.06.09.59.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:59:58 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so6358885e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:59:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwtuyJGfIlvdKA9MbV3DfvySae0vur4lAiQvDSce2KKqATUsvoyvGa3I+chNjSrn2GKlbeZhJ6JpxbpEgU=@vger.kernel.org
X-Received: by 2002:a05:600c:8b28:b0:4a1:9663:7633 with SMTP id
 5b1f17b1804b1-4b6dd54b16dmr53499975e9.11.1793987997939; Fri, 06 Nov 2026
 09:59:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com> <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
In-Reply-To: <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 09:59:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com>
X-Gm-Features: AclHuK8dSVweZwLxaeldnIMbndWhz_-q2OKzaAPnRAmMzhlMe2QAncAFrE9VlH0
Message-ID: <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Rong Xu <xur@google.com>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Snehasish Kumar <snehasishk@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 6, 2026 at 9:43=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> Just one thing: I think we should also have this flag for Rust so Rust
> and c are consistent.

Please see the commit message, which says:

> RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes because
> SampleProfileUseProfi remains false by default in the LLVM backend and
> is only enabled by the Clang driver.

Is that incorrect?

-Doug
