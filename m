Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487ED423160
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084559; cv=pass; b=CGHHvgg2x5qaYZoNdl3MIr48B9HiiSKBrusINcCswPorPGirN4BMOckAA4I4leh0e2ZALwb3ck2XxsJiWb/C2oTux1cwzwHJC6G/h9MRJ/kKKPPOCuBAg7u76MGp48IgLuPW3K1ZpgcyLV+KjllzuQpehZsbpId3000k4ILGAu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084559; c=relaxed/simple;
	bh=RWbJJQvfWAeHPWGm2VIAzQ4UpyfGNL/jTGHu/y+875c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evVXJ16mAdjrN1LwNMQp2Hvx+xUVQo8L59zDnxNmsY/j+5BtLSevk5XDbB0d3b953OysRb+QjMb+xvpfmZ43QwqrDnXREv9y5jY045JzoKsJI2nEsA7/nhgXGml88M9JaPCg4wsNJcL0K0aWdljV/P40qJBOg3wVColxCh/wm+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PVKFefBl; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PVKFefBl"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso42302345e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790084555; cv=none;
        d=google.com; s=arc-20260327;
        b=mRd9PBvzyHJ8a10NoqfFnDEnWKnwr4p+qj7uI0yBH0nRbvD7jd0LUMgEy3CKhp2ZMT
         72vWn1yUd5OGCgOy/vZ6341LGTZFoSNYyAdLefSqhOUFhG9IR8iEs2+BS0lYDP1pMGo2
         WKJK2AFcHjFY1h7YMsn0SE7cSvSSzL0MPfKsiO6R0h/xx+sfEJFK0gZVAQ+U+QCPfy39
         LHOlyBMiBJcN4waEfHNKv6eE9GcW1sbJnxyhHdc0A6F3hdftwseY10yS7VOJmKgmdTGq
         xh/nh+7KDDC8jXqDX3rp8A6DJTukJfv4mvlVvVbdB70EwX8jDcWKRwJV/zDjfToa9wQf
         Uo5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RWbJJQvfWAeHPWGm2VIAzQ4UpyfGNL/jTGHu/y+875c=;
        fh=pn/NmBfjAjqKlZv8A39GDHsQb9lZTxTl+EB8myy8M30=;
        b=j8kPlAfZgl5FsUUAYJc3q8d5noNRVLnrFeWBbHrJgRFuCFqhrOE3Tq3NTLP1hpNdZ4
         tR8MXy/BfX9r31FU7LohC43BopwDmXoCpln3twrayBCY5ms1Uddo3sF5slk6g77zzXIq
         luU3o82fy0EhzJsK5VbynILhB9FIaVzg4Q/5JG6aQwy74cn421KcJGBcYQMvXcC+LwUP
         xQKUJAhlHjgwkXUXyAsAMLKWm+M2sYzdWfoJoXH42zAsqfRnE7Nf9EOyfFCJ3+4ireTn
         tLr6uaBdDjDnrXTS2JFTSI/7+QsENWk9QVhLVP+OrkcXxknCmYRcpYuE/wTrao2+NaZW
         gIkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790084555; x=1790689355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWbJJQvfWAeHPWGm2VIAzQ4UpyfGNL/jTGHu/y+875c=;
        b=PVKFefBlcFOCDKy1n0QN5lHjLSrft4fKCdSbgxb57Na/UU483SjKnCQj+x1SoySmrX
         d0TGW7wrANuRhC2Lst8Unmhk2M5iJvBJsHpJAp257cp6Xq1AwScABAaQIC9nGyB1n0aR
         JW3upfYBQ+7zT3+qwM7Jy3LOiMx4PbGPxt6v9tkscTS83kQUyqtsv76ADdC5Fkwp/gUZ
         pNHnSn0eKwflk/y5274BmEMeaj9dE9qNWLZ0Z6/Vel2sKDEBxs0qMmQLGEfvoKVtjv98
         1f0bZZpwVaGUYP0fxJmlWJSlC2bPV1fhUKBBicwjqHE68jHW1scrva2Pdd76SHH7M0tf
         ZH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790084555; x=1790689355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWbJJQvfWAeHPWGm2VIAzQ4UpyfGNL/jTGHu/y+875c=;
        b=OlHI7rgad1hIFppsmnIDnskO/xKMs6VzTuaiDBPTAyujTAeir/t6e+FvgIt+f3psMg
         6iR8Q25SfsN97rUAFhl4SR7lcVa/G10cDONAILPu5vUnGg37/XAal32ThG7SN8PnoORA
         ZQdBBLax2J934LMMijqgLgkxOK6PXhkiE7SFJFhBGKgygJX3nJTWVbCIDP/N/o7Yf1m4
         CXb/l+gPEyJAht7ItHv7dZB26m3RVXUF3SIWWSolJbLK3XEmK4E3dBcv+XChkaE4RvWI
         pg61l5ClllU6xjiuZWOIta9fHlsV566Yzavh9Ul03C6cDtTWeU5sx6OGTeUq4lqQpR7t
         PyJg==
X-Forwarded-Encrypted: i=1; AKwUvBwNPb3fdrjg9CuPmC6YOi7iivJz30YcbOMvuZ9+Q7AcmK7swAarCHPSuJyBICr4/gwWxYaFYOGrUCQYfYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lWBPoetg01KmGLuAQ79GYTvTalEUMd8LRHYmgSg3caGEgH/aEC
	DbUsZNwJx5UClMKI/0wmGGI2RZcrbBHbHKFTNSWwEl7iALiOlKX5ecip3W+a3+YEeDGxtDaggT3
	9SPy7ft3DXdKgwn+C5oajfBqnU22h5XTI7moZtrrZ
X-Gm-Gg: AYBFou0GxrT4ZxcyvWrqEE08fwj6j2Lnrr3/QmgQbz/VvcI9T0INd+T6uHKsQkkn83J
	uMsWynTuzIDc3SGbweK+oX4msvlfDWm7pZz2M1rLNggT12gozI0PoK1U9HmDu7fEAhy45+Tj3Y5
	VMXzRjx4QfxI1Smq/wPo03Rr+hRAYQVjc/wSSPb+UL4/CvSBRm5UWN95dXGQDr1NshEZLvMNVVW
	4IxeBBxMQ6uz16K2geedpPhGI88aIfhkxo8ZfRu+3pSuhLJh0fKtAGrRqccVhrIvtO1W5D660+5
	SP55dA+EHmJrRU2HSLjyORI1x2mUcZqOLVVQE5SqRS4kHH+R71fLfzpHcKBhODUZOa2pnIzjU6/
	8ztXqQcHIQ0Jvjg/a/Gv0PBeyvdcFSIb3ztJ0Gd2VWeSpdB7tbuHW
X-Received: by 2002:a05:600c:3585:b0:49c:cee0:f383 with SMTP id
 5b1f17b1804b1-49fc5734ef6mr255037765e9.16.1790084554891; Tue, 22 Sep 2026
 06:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918100016.100988-1-sagartaunk@proton.me> <KZuCCqRjSSbylbLLVhoUD9-xyBpzD9jUB4vGC16N0_hIra8SNxFeh9lEJ6FIMYMgKqf41J_swYT_HVx3w13k0cSrYYkBljOF56suy3gpgAU=@proton.me>
 <164304b3-3324-45f1-8766-536767e7b9d7@redhat.com>
In-Reply-To: <164304b3-3324-45f1-8766-536767e7b9d7@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 22 Sep 2026 15:42:22 +0200
X-Gm-Features: AclHuK_p5XqAJq4ss3l1aLkxA8gLh1Up43oHI9_Jc3xmArdkhL0aeV3XgEseFCc
Message-ID: <CAH5fLgjBC7o4wt0WPH6xEkQEkOvsjj0ymLq2xAGXoMwN-fZyBQ@mail.gmail.com>
Subject: Re: [PATCH net v3] rust: net: netlink: validate attribute length
 before casting to `c_int`
To: Paolo Abeni <pabeni@redhat.com>
Cc: Sagar Taunk <sagartaunk@proton.me>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Matthew Maurer <mmaurer@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:36=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 9/22/26 04:31, Sagar Taunk wrote:
> > Hello, are there any updates for this?
> >
> > Also, I wanted to ask is it fine if I keep fixing stuff pointed out by =
sashiko for now ? (I.e pre-existing issues pointed out by it in other's pat=
ches or should I ask the original authors of it first ?)
> Does not apply cleanly to net. Since a repost is needed, you must
> also avoid empty lines in the tag area (i.e. after the fixes tag).
>
> WRT sashiko-reported issues, beyond be aware of false-positives,
> generally speaking net-next is the preferred target tree (i.e. no
> or very limited impact, very old issue, etc...) with no fixes tag.
>
> Focusing on high stakes changes would be appreciated.

From my perspective there's no issue in landing this through net-next
instead of net, as it's not urgent.

Alice
