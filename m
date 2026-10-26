Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793039202;
	b=i62WqquPyjTYo/6Tcra62zrV+z15u5l4Pxza8DLWZXH6mtgh6vvdVnFLevajyLL2nzHN
	 htIeND06Z3+iiaSzKuQnFOxqxQSPQSAggK93LL7HEtwo7Ih/5GTwdBPcnqAZw8r3BEO2O
	 twIQAQsRb6X4DZOcUGMuyziy10QKzfIeLbEBr1X6k3DwpAq4rVS2qzxLXgbkINEh418It
	 DZxnSiY3npF7npsjGDeQdk4GhCfPKhx9uguNoyADY54igSyrZ+wgsODpf4cjQ0cwBMEAq
	 Cts5dWZ5XFdT0dYvYm2OfGFy4bj37DiJSCSr1HMQU95et5Rsa/iygGuAyc2rD05bcsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nY/Dg58kDlhRREyLtFBek1i7zB95DzfSYinza+ky90U=;
	b=yUsgbcm4dZo0mWHg1ZDz18jTkIsGal7I3DZAqnF/3zay+kKDlM1QvYCkNQe2/n8qcWFa
	 KTCXwBKrpjoL32bYap2YI+Mnvl1bouRyFYrnCtWQGeF27XRAINpjQwd90SZA6vREjkrv6
	 jLfUXmCl4FfRr/MHArF9XktIh27wqn4TVPNTQHsNoVlCrFWv7JI/InwdjYpS1/oUqdC8p
	 qnfboQ9PYSMpQpHqqN8Aecmvvf6H1FctpFJjD4G11SrM8NxI2go/1QuLMyOHfuk3iqzrY
	 /Rgra2iviuVDwN6cim474SEjI77b/q8HS9ctTtCmZdNMQK6Bs92JapOSKVPpJQM/ibw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uci.edu;
	spf=pass smtp.mailfrom=uci.edu;
	dkim=pass header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=MdaQFEyh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E8B606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E8B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=MdaQFEyh
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53665358476so35670211cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793039201; cv=none;
        d=google.com; s=arc-20260327;
        b=Pka7akvx3pDTBwbyrOgUT/Zy12Lr4QcKZoaZ+AX86pAXJnyTQFUPEHaA+TyNldzNOb
         VDW9ywl47j+OUhmpygeh8pB1uCG6DYHvduAXLp14utHoablkXk0dqn/uXwtnKKFzzief
         qq0S3RdOKzjIka/pxwy0n6CeSiHdiur/ug/gTfT9weMXQiBalWASRbOS/nnK/oA0N5X8
         L/guoLS9d0wR/22S/nHS5rWSYwKOUGDJfz2myg06KDMr/B2BHdyUSSc7bPMehfGHNOfP
         Y8igQ1Or9JKAYAJR94F2jMqslLOnDQG7qYkhL17AR12/GsHIVo0+R/oGzv4WHzNPJoz/
         BzNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nY/Dg58kDlhRREyLtFBek1i7zB95DzfSYinza+ky90U=;
        fh=1H+dCNvP/2T3I2QwhOPvFVYFR+u9KKcBD802G0tOLsk=;
        b=mztZH+Bzfwx2TFTtxdRGUS6lrCo6A8Hwus7btvJY3ns3dXaEvrT9pe8DRkCgoj3xoj
         jO5p3zpOJ22PNsu0CSx2mmaQqLf6WuH1FFYjZTJvmVjJOsD2KfQWaBvQsuOK5cuHzunz
         KCCiOPOZzi6hJLrddKqBDffgqfLWjbtvECED6CJBDKeoVjpieHdXLp/EdiNm/JIKXUx4
         T4Fp/ndO67phnlypvZc0wAzAb/xStb/nj6aw6KSI0HytRSbXH5gs4bG7Tpc8zLEahHJT
         7ljrc86cnFygBCyxfnFlMct3o7tGj0SosPbIPDvF2YZdF2GMGZu69cDoxnO/zVzaOg16
         4qqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1793039201; x=1793644001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nY/Dg58kDlhRREyLtFBek1i7zB95DzfSYinza+ky90U=;
        b=MdaQFEyhrHiKlVA5e9cpLrvo1eX3Zu1r3VMlYWlcabdn6ZMaZ2xc/+PQHLz7nLBjDG
         YbVKvD+9Jq+50riuQRBZV48a4ja7NKsD0gki9lRVYvANDpnUFDZACmK/dPgP7ZbcmoOl
         7J9+MZCdG9cd5wm0PckeB2Br7J47WouDNfmHygALN744r9w3g/4B6aJ9iWwE+iP9BThN
         Hxo6pNej6p+f8OXxdhh2/X3UbuHpuGe0dQQG+FKj/pGzHCFIiaIEtT7+KssJk3y/nCY8
         rJZV8xrDhOqMAa32tx7RnHjdul4GSwsCIwmNXQ5BZj/sGeKyfoouSrMcmwNYD3FZX74P
         rPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039201; x=1793644001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nY/Dg58kDlhRREyLtFBek1i7zB95DzfSYinza+ky90U=;
        b=gCWAV7fKziD+aBFh+TqoRBBBNNVgPS9lpkhYIdOO08sw4emrMs+20ZcZm3u1Rt4CL5
         4VWAm07GNM6nt3fVonG0kN82OpEc45hXD8nEdgu9seTCbMYoiYZRao5mXPd9oCg6Y40j
         6ZFr+tc6bU0Tg3lp82TQCMXGZI7xDEGnbxIXoMR+kIeRxfWX6tMMeL1ShUJ3yjGA9HDq
         kEP+Ct4koo1EwnXHnCzIcUBo3MvtrYfVSOpCzf9vsc5xUjEfyx2pEPhmKq4e2ioBEAgn
         nqXcLVL1em+sB5N5idGVhIFVObqoeyu3udwaI01LWbR0SSyv1DAgUFquDSuUWYqBrpLU
         gTzA==
X-Forwarded-Encrypted: i=1; AKwUvByibtsyfsPlCO6qd2Dm1C4crNUvI+BT9Fg3dAfRFcKQsM0TMc7qx51UKndAztJl603fJXqCCnaBLxC3zu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvDoY7+Hm45VwlHmy4oMMxtp3y6+mdZS49BLiat6OI3x8RRw0s
	e3wg5tovCwm8fguUJ5B0QWv76wMfxHA75nbjUC0Mx9Rc1ZdSxYbLZdkPSYeC69MWzbhvrA8hHaH
	euaffOBDNAd2mabALOeM7bp0ZjHxsdLt+sfw3+nfaHQ==
X-Gm-Gg: AYBFou3oB/EO0gsxvApdiw/OLj2qwm7QK1jbZal4LiB/LwcXEmZq3VJFVjVj0MdxZhi
	fxE8+YcWZirTxCxqoXvaBxE6qi7XHl884cHF0yp8QHPdtx4JhYAXWP6OBZSbQnCrOWpw7F4BUvR
	2VvssEKMvKr19Q7Btj+Xt4H4f2AS9zM3ljQEtqyIC+jiGWfLuK7dh1Fmc2Zsdh2sc1yX3ebTmit
	PKSy0nfnwRzzngI9qZHtF7KuTT92sCYQ4O4TKF1n/5rreu4Gk0semr8SxCdhdncUOgYq95hWzTk
	ygCgoXZA+gb1vHg286TBzp/gVSMeqINeqe/etk55/t3b7qUn9LUn6DhtRmoBVhioTa+rwtYRXf9
	wk3jz6BOhqoYkab1vYZhbSKdgeCrzgalgZFidL4Fq9wC9/8SjSb2SUeKgxNkYsch2ttSH
X-Received: by 2002:a05:622a:5d3:b0:536:2fd8:a4d8 with SMTP id
 d75a77b69052e-5383b4afebbmr117637481cf.15.1793039200775; Mon, 26 Oct 2026
 11:26:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-b4-configfs_kzalloc-v1-1-17c1ba6db062@debian.org> <87cxt5dg1x.fsf@kernel.org>
In-Reply-To: <87cxt5dg1x.fsf@kernel.org>
From: Priya Bala Govindasamy <pgovind2@uci.edu>
Date: Mon, 26 Oct 2026 11:26:29 -0700
X-Gm-Features: AclHuK-HM7aWQnakYxF5bvOichqFt63lfe2rUOIlRJ_L7_Z_ycOyZaPy5TNVqAs
Message-ID: <CAPPBnEZz_oGkK8PQ=U3Tv67oDp+OaH0qzdv_m7u_fB7fePvYMg@mail.gmail.com>
Subject: Re: [PATCH] configfs: zero the write buffer on allocation
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:35=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Breno Leitao <leitao@debian.org> writes:
>
> > fill_write_buffer() allocates the per-open buffer page with kmalloc()
> > and initializes only the bytes copied from userspace plus the
> > terminating NUL. fill_read_buffer() reuses that page if it is already
> > allocated.
> >
> > After a write, a read on the same file descriptor therefore passes
> > ->show() a page that still holds stale heap data. A ->show() that
> > returns only what it wrote never notices, but one that returns a length
> > covering bytes it did not write leaks that data to userspace.
> >
> > The Rust bindings are exposed more directly: ->show() receives the page
> > as an &mut [u8; PAGE_SIZE], so a driver can read the uninitialized
> > bytes.
> >
> > fill_read_buffer() already allocates the same page with kzalloc(). Do
> > the same here, so the page is initialized whichever path allocates it.
> > The cost is zeroing one page the first time a file is written.
> >
> > Link: https://urldefense.com/v3/__https://lore.kernel.org/r/cover.17909=
81219.git.pgovind2@uci.edu__;!!CzAuKJ42GuquVTTmVmPViYEvSg!MzBh-OGC90bot_58m=
ikAXuNn-ZOko4X3HdO1al7Y_kCFHVAaLPKpyhKVLgRpDkWqziXPzvRGlJPkvD9e-ZWTkA$
> > Suggested-by: Andreas Hindborg <a.hindborg@kernel.org>
> > Signed-off-by: Breno Leitao <leitao@debian.org>
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>
>
> Best regards,
> Andreas Hindborg
>
>

I tested this patch on v7.3-rc5 against the PoC I provided earlier [1]
and it works correctly.
Without the patch, the PoC shows that the first 8 bytes observed by
`show()` were:
  [78, 0, fb, 4f, 83, 88, ff, ff]
With the patch applied, the same bytes were:
  [78, 0, 0, 0, 0, 0, 0, 0]
so the reference is no longer created from uninitialized memory. I did
not see any new warnings in dmesg.

Tested-by: Priya Bala Govindasamy <pgovind2@uci.edu>

[1] https://lore.kernel.org/all/cover.1790981219.git.pgovind2@uci.edu/
