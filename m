Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793918452;
	b=qYvdiTb+u8SLoJAgrfC69m+eCIloid/KcoEzGxsus0CesJMkE9U9zTTSuRGlsAjkzIL5
	 gEuyofwD0oyF/2DjZrZzR46FerCuiHjOOkQu4GpB1xu5oPg6rlGfJQ9SFX+pi5cIVQ2qY
	 yNdhTvKGnI+pM+4A5OLmfypsD40ucHuiSvJV4IWOI6CeAXDyJGlo3qRFWDHNYjWBEAjIn
	 U5n5SRu8aNSjEBkgx6eTNbCGCcWRZ/z3bANDfXZj+zG4xVE7gOKW54bVGN7eYyVQMn63W
	 IBy6xCLa5Mmtw/8PuRm8kF2+paQOCgDtJZs/0IpAahbDuAN5z3zwqxIjxwgr2g0AXHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
	b=vIVSkG0Q47oDlLi4/04z6IOvbGmVLkPCYlJqaJA4aY0j9WcA9JZtwK8e3zAAkVGsT2e7
	 1yvZoBxeU4IsV9HnhQpsdlPQvBVZZ/qQI/QMDcFKkJgbH6XSLKW6v2I2MsN+gK/YIMm0F
	 Y/6JmizbxOJ4prmRv3ywV/Ltq5q+yYdZCZEJ7umh9jq0UNLHvH80+2AMxYJYoxchgDHwB
	 y1ywj3naUuOVZYmQ35N3g2YJhydWOVMG/e1e5MYwm6jk59QxuSxTAsuUiL5J73c1f3l/v
	 B5VTJ1+oVT3hyxdymi3bvj0bpeBTtb1wbWRSC4rF8aqLzwAmXsuvapuGHZzUM99oWkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RgLRNkQL;
	arc=fail smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAC7606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDAC7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RgLRNkQL
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491aaed7565so40699f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:40:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793918450; cv=none;
        d=google.com; s=arc-20260327;
        b=BrlTVpwPwNJaOCtK5XDRHu33m7RjYBWU/tIra/T2qOGsDzi2arnGR3ik1rcvSy4Erv
         vaa3eO8sF8ELNfG1nLsc7rGCssZ1h0xwPNf0PIiIqQ1J/NEfy+sGX+FKouF9354uT3V4
         A3sCA+h9fYg3nd/Qr7dkdBg690ytEV49JJFi4RpFBbrYRf9VkWg/mjHftjrT4iif2ZKe
         tlrlPK5OprvkIyAKDWiip7vDmlV0MpKS1gskl54eynOVAnv/RZnrgLzmCK1OWDVHsYuB
         I0AbPLAf+fBwZkzMOudr25OqY+aOznQpVrKeluv6uKNWPZ4Hs6a7lUdxyUPvXnyU8LcJ
         uVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
        fh=e4u7ndCXRbCFR5JSjUBsveNAk/FhzQJDVjnCA4azSOg=;
        b=IkDRqPcaB48ZnlkC4tu+W3y3Ba9cSllMKFJ8z48qHB3jGfkuCa6HJmnEG5wuGrESnv
         Nn7X9YBVov9juG6CTIlDijglOsYS+ty/lRJWOP+ceDn101p/JmIw257jXM3QJ605muL+
         COOR4OB0xbrQ7XH3aVJPp4apbxxMiN22bALP/5x/YD9ehcR+ylB5sN5kwCgGAfonbmS8
         bSt9fYiTfnWkqbj2rBTS7PVFwWJR/pzq0pzdnbWl6BpskJWcsIVNt+kj7nPF5T8fe3/l
         h3kIqidXLoOeuYrGCrv3mQKoLTbZ1u8R8lhyALcgqaUjw7BIrZrUqAIqkKvz8VGmv58T
         RMCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793918450; x=1794523250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
        b=RgLRNkQLo0+/Ugi8UZpgCB1l8VFl7ffRroxPbtHZ4YNEaKqjtzdw7GXwpZ1DXMUZDd
         FRDGAJf01FCLY2PbU1tVMy/K3opwjWIfrABgQrTz/H2e2O3L+5KxKMH8RUCCXT1VWgqT
         fUE9YKkZE25MM7dhJkEVEvn/hvChYgKruV+t4R5688c/h7bue49V3bjhP3vk5/VKhqYr
         OG0Uo42RD11B7RfTJN7AkVa6Jh/9MB74t+PGjKFy3Y/CSzhdMvL81tSxt3YnMscfprrM
         EdfMixRG/B6d76i+GAjV2xzW9bHlMrNTFMx/HBn4rH17iBxMGSeQBhzc7bhHA/NL3rfV
         oEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793918450; x=1794523250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asv4QJYvubkejzKdluXiY+GI6RaigE/KTwLx8Jj692M=;
        b=tSjT3aMPw0W28H4jiIAjR39DUpyFJBv0AIglOI4r4wLvyyHe9iZTCmcMY+bEzAck50
         S7ztO2ztuK6u5VtsFausBLa7UA5smUHXwiyxYQmnLR6FWR5sC4V4W38MJ95F/3k6ng7K
         S63s3NB49S/mgLVux33uQJ1WPqge50NMvjnWml7OzLxKhEp863TUvXGv8eMoLGtTVkKZ
         uxGEjOJqG64hpkSOOMg5EybuZEx3q7fgFjaiMNMjlh1E/MwYVmxKGsaEl90LGYmZVgji
         LBWo95LP9EZXteEuFkHTFuBI7wUkktH0p+bwmZzQ/A27325qUhNCTGWu/Fl/NmnWqh4S
         Wh5w==
X-Forwarded-Encrypted: i=1; AKwUvBxK9gXIgxksVqWC9KaNnYMYvy24h6wsKAwKx5GbXsFzdSHk7bgq0W0XtudHW2ehqWzM9o7Ujd0jyx0a5uQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zeAoACCVTi6G+xPwah5fxwrvZtw5TrJGHQYVslUlnFs0kbTu1
	kx5/Qzd6AdSIdA8khQUFtbuQxQvccSu1W8hoqIDqgMK447ODyZBVV6VzvZ2B+c+9jXsUKnca7PZ
	GCTr4IYIANcVUcbOnEhJVzPfBXggL4RvFL8RJrz5l
X-Gm-Gg: AYBFou1Ezi4K3FtGXtSJdFVMxk+HQUdo7BybZwYZhs5wS565+7cx+x9eOF+dSeH438n
	7pFhjQm4s+/yswHCtWllVG68tk8fqN+Wk/4O/zpzkL7+GMdcJtw2SwVhuKnyb0bkxST//MmCnBx
	pMafcHaXugISV8rBhHyVTmNnXdO4G96qtQ0gHzLlpvOU3VAqS8Z6yAKMmcQW0c4E86Zvcet6TR3
	/gydFVd6nw7XNPMbRsO0Wh/t9KeymEBo3N5pFfg1U1WhUY1CIgAzzZGrz7i5mRU30zO3lTjkK77
	pwX3aLYF0BOUJ4C8vv1JANK+vZbzjvdp49MmA25FOR03z+ye31m6w4Okj49Y2oMo+Owef4N715o
	kiMtbYGm+0XA+O8nATRmU10aiXqdWvqSJzCwYfPojBc7pN1gCHWZvPAZkWDZp7B9Los2wDWgVjh
	odBpJ0I0kFLB/6fbQPD9l69gjZQCiw5pW83cc6HfhxwQDaXdu8tLuql6pbV9e+0/o5oV7wyLV1X
	YjPeFmLdjePifLZwm6lFiOCF4UFYkeOINjVH7GK9CxAnJaNhwU38eAJLQ==
X-Received: by 2002:a05:6000:2892:b0:48e:d27:bef2 with SMTP id
 ffacd0b85a97d-49276a6e26fmr1759258f8f.21.1793918449566; Thu, 05 Nov 2026
 14:40:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com> <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Nov 2026 14:40:38 -0800
X-Gm-Features: AclHuK8nvrGQbL7-Xvq-JpHEYtxPKFX5Sm9KyXUfS9U3lydEUDZDAqeaU6dAk_8
Message-ID: <CAKwvOdkNvYz7mSmfQzWuFd7FZEUyZkH0L2tfPSbouE0J2w=b1g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>
Cc: Rong Xu <xur@google.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > The issue you mentioned regarding excessive time in applyFlowInference
> > comes from Profi.
> >
> > The AutoFDO implementation used in the kernel is FS-AFDO (which uses
> > FS discriminators). There are known issues when using Profi with
> > FS-AFDO; enabling Profi actually degrades performance compared to
> > original profile propagation. When we tested and worked on AutoFDO for
> > the kernel, we did not enable Profi.
> >
> > While I haven't looked into this specific bug yet and am unsure if it
> > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > to disable Profi for now.
>
> Interesting. I can suggest that to the team digging into it and see if
> it solves the problem. My AI agent says it will though. It claims that
> the default flipped recently and "-fno-sample-profile-use-profi" will

I wonder who flipped the default? Perhaps they're not aware of _all_
of the existing users of AutoFDO, such as the Linux kernel.

> restore the old (tested) behavior.
>
> Should I send a patch adding that flag?

--=20
Thanks,
~Nick Desaulniers
