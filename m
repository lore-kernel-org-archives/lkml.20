Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E533BFE5A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507209; cv=pass; b=hQHxRpBERyUS5hkyN4/wU0DME0wHt9N/rzIYsYJeP9fYZNsNzWI/764kjgCc1WOziIs/pjj9EOT4e2gEmUATK4sW+PQdu3ohYrLvuttaLdMFPRRAqSNZtNezr7nxae25ZVc/NLHkYZnT6d2ZqAsmnLHtTvI9p4JFv+COF1AZaHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507209; c=relaxed/simple;
	bh=afPt/0KFpvntFZhHSqjYB0IVvdjVfuzsHdAD7Cxurzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFXMdwTTxo3oXpP5KXe7A5ILodiG7JBhj7zg52Qn1ILvhecIHw2S719hNIxEI+VzA7AD4YGBJpPYMivu6iIXpR4QEFzUDjnCkWhLBZaGQD8gFY9AGEtLwmpmrJUkLsBCU76szfyJDuhWr6qowvEWCBnPeGAZTaV1h4GtplfJr4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDZAmMop; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDZAmMop"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-396555b8c7cso103227a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788507207; cv=none;
        d=google.com; s=arc-20260327;
        b=K9tj9u0iKI+yEQATX7Ru1S+y/kX+SHPGbH2Es/CNPlMo8o1DVjcDOZsQ5asibo6Ik5
         ZfKR16Ph7PrXk5wX1wDWon/+Tbg8hH795/N/qywr8U/uX80kJpLGpHAXIfc/JUuqkKAv
         hKTEJhPgyl7XPCkFTQedw2TPS4oW2wMjPcJGFXPwww5lxC27NIhQKkXrNUxW57OCAIrm
         FcaM7TPnMusYiDL5BopBDo/HTHIqFZezD7u3vHFbGVZEGAHLcZaaL63pIIOgOzV6zELt
         93hgKGtsr0S0wIK2cq26c77lJ7WJOThQ06CkcdygEXY/ZuUksrhMKda7pVaFalmkak02
         mPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=afPt/0KFpvntFZhHSqjYB0IVvdjVfuzsHdAD7Cxurzc=;
        fh=UPNbdVo0eZVdGLm68qrgT0OUziDd3wihcYDRIQblvns=;
        b=fzjr/obUoto4TJeuFlTt5ABbaMI0JzxHakbEGCFk1ChJsZ6tp4SrxNQs3orGW4d+h0
         oEVfNmDC/bho/y8muX4fSTY3/2/abr/X47TYH5zYP5FjoPdg0zG8ehgIiAPVJTN4aIac
         7eERdgn9m4xYClbpzgnyVF+lG1sf8XLYbhtfMBss/mz+HxNMzRFpuaNkl/7JDsfQDRbe
         IGvjFQTesuuIWcm7+9Uuz9LpilwATTyjCl6sDXLardGRYJiZ5i+vOLIGOiOyk/4NJ0c6
         GwDMep76tfLwtIUWDatFiSyJxteWvH0F18ZZedLlq2jq3Gf+WrwtYJ09UXxgRR4ePs2c
         0ccw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788507207; x=1789112007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=afPt/0KFpvntFZhHSqjYB0IVvdjVfuzsHdAD7Cxurzc=;
        b=SDZAmMopSCUl4xfnIw8zILP2STvKxsUGUiEh1FQDVGua8xFaZ5UtDafY9uWfM5L5Uk
         g6B22inFWeo3MVdK/nnQOiLkPYd1MoXHgE4TO4o5IbYxGWypXkbVC4XZIQc3OWSYHKAv
         GRzDwY33PQhIE00mpJIBrzl+3C+1jkEVtMyHYPkjfAzkGVJpUyl0a1Nf0V9hwNftjN7A
         m7jxcx0V6P8jmdZSZCbHp8yAgd0xEWGf8Hj4TgcE7sFt5VZHIJOVLaXGHiqXzkOEi7x9
         VfUa4sVnGMkNiVoEM42mQ35bzCl1LSRgAJG0odYSZqHWtGsKx9xb3KagJ6NJkhDb2+6k
         cWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507207; x=1789112007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=afPt/0KFpvntFZhHSqjYB0IVvdjVfuzsHdAD7Cxurzc=;
        b=Hqjsn4jvlwFf1zeb8iysvPuI1kwNjs4cyZFODBagPMhcpUMGV9dbHIvMEYr/wMXxhw
         u7TJfKs9cLO1E/OTSS25JfERl+7TCat3l0XREEU1/XsYrm3dHNkmjraELLUYmDn4FwCn
         s3lCwQTqDFWGKNcCyg79cjFhaKnVYvF3BZLqsabxqKMVtaISbso2oVpNJB+bzGT2scsJ
         lgGJv1idhpHjEUoSgrlr0JZENqQ/GHVXr7xL2qx4Yo1WRjCAdrDdFWB41smDxeCbtMSH
         QiAvJJQ4z8miI36SyAy5ucpDPd8LkG81dDVn2IMv/AkykbJBOL1wsVHbA3SyrLZBN1k1
         LnEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMhmLtubC2N704SrgnZ/1K69jtDxJkAMJDh5sK7NIo93PDCReR7zBLo1sYplSS3iaEEX4KOoici4paQQM=@vger.kernel.org
X-Gm-Message-State: AFuF++kOPf5bP7n0tkjsBoclDdynjxikpKLTgpyrmBlBbIY2Zr3dhPCu
	JK7sdwwmL/v6cSCZrzn9m0CRkiYeWd4LlDcqLl7YmfcshyqnSlThTxhSmvh94iuK2Rrry95hciU
	59Fi6PAHERxtvEE9yyun/YmBN2TxF8eo=
X-Gm-Gg: AYBFou0wQwcsJ7162bAbp/940vaKUYuBnDxtGLo8ClbF44n2+4H9zNKWDTCm59MMMKq
	418/KCXON2TvO7zSEmhoIjAyfILoIjzv7RdrLir6AehDSndwf0k2tKmRYixd2OSTEvLvhl32WdD
	IcY0Y6+XUlubPZwygVXIdzG0t8/FfzNvW1ZD//ZbY+5HmpS2DbaVEbN9FXA9d7DVgQQcM118sIW
	/JRYNT8AVJYvka1i/+c9p+sRaKodBKcCegv6e6f++yKAI/oZQ02MtxsXvzNc+vytMNdQTyKfsOJ
	9RJKAraX/YloR776FL2wTENBOnThDf/sSkfP9FUlXhUpLVDS2XrLkCuVxSxxj+wWaI3+I5TDj00
	wQ3Loq0B79RnCczwlkJ2aSGl87dURp1HJ7M5LOQxtuLUhV1FQAoc9BBioEm9q
X-Received: by 2002:a17:90b:4b86:b0:38e:76f8:fcbb with SMTP id
 98e67ed59e1d1-39b26252efemr4118157a91.4.1788507206622; Fri, 04 Sep 2026
 00:33:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-loongarch-disable-rust-with-kasan-v1-1-1813d3c4baad@kernel.org>
 <CANiq72=-6CGi5d=sxd82mp347skPGxK_xH+UNt_dUUD_rKdFiw@mail.gmail.com> <CAAhV-H6QzYUmoErGUFecF1jptYekkuy-+iZtDXvY82wbr7+V4Q@mail.gmail.com>
In-Reply-To: <CAAhV-H6QzYUmoErGUFecF1jptYekkuy-+iZtDXvY82wbr7+V4Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 09:33:14 +0200
X-Gm-Features: AcwNN1XWy7WQ5apZIMaAZwbTUURDXMelE7BtsLngCp1nI7dZlSv2a0vAJ741AE0
Message-ID: <CANiq72nHb=bD9mtFTJk7cWgxpp0Uh2K7W4GB1ygtNEF4d3zKag@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Do not select HAVE_RUST when KASAN is enabled
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	WANG Rui <wangrui@loongson.cn>, Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 8:51=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> I queued for loongarch-fixes, thanks.

Great, thanks, please feel free to add my Acked-by:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
