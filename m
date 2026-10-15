Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80062560ACB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085079; cv=pass; b=ESWmdCWhxc4C72MTZHyeZIl4jd4+7Ms5uQgBcbdaOIqStYB4aC5DDpY/rAaWqViOCrwq42Mh6Hur+Ft0AJ4ui8X6gAXz6oFn61y7Sy/Z0gwUYrGFeqgL9XU1ESCjrlXYnrz0iTM/DEjRp2XU023f1db138/wIOrI8Mbai12lZVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085079; c=relaxed/simple;
	bh=J4fwNwwk2Wo4wS0yMEdtE2pEvdPmB5DNJ5kAr2QyFH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pj7ZfLHwx+lNnYN4QokwpOQPkjdw/P6Kglok/22I7iR6jQgMmNwG0a3jJzD4S4fgfVbPsmGjurDueg8Az/fAxTbRydIPHl1rzxY6j62ctZpLzsQxUauO++FblAQ8qTlxyIQO2fTlvFr/9/O89w6I1AJvuI5lpUE/eavL/DNjeiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5AdAOgt; arc=pass smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5AdAOgt"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4f75027bcd3so284832b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792085069; cv=none;
        d=google.com; s=arc-20260327;
        b=E+kTToyCWWmYjoI2g4FM7Pzg7QZOjE2pm3pc79ifKOuqOiK5Mmjp7auEFsmef0hj2W
         CSSZa5YhGtIW2nXH22t6e1CETIHYQixs0wK0WblvqIrQWngTo6txHN8nfO9QAKECRXTv
         2h0N+3qcTMJfWEQIdCeKkr9xsH/FlprpTcFjPjf6Ge7ew0qy9Ws6jxdH/jKm7xFg6cY1
         yrWa8hF/kouo7MoSVy7Ab2eXLCfDvrA8EG/i4uRmZypwpV/1oA8qHnKMFrhy/U0XJs99
         v4RiQAAX5Hsb0kRT0BbS0yhtuabahEmjyORGQ3xFaWZBtfdZ8wAZBadHoIihtcR0fNtN
         mkZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P1mu4SGh6E5z5qH2iwI9S7XC1+VTXuGAxqDRPc273fU=;
        fh=rYQKbmcAFSh2G4i/uBNjRRInsMsNIg6GeEoaBUJl69M=;
        b=VHpo3bjzm+19mDMCdcngi1QB38jym+WCDBeOxhMNSn32uAjsmvtKvDCevSgCq/kPF8
         7Wmp1k0IIzTb4ma5/aUJngPQeAYN/jU2u7PBnePCGOan0HfhwPh1NEw393OYQQFjoc/D
         Z5Bvehzt7zKMEDQ76/ugKuNiqkeHM25BY5Ki9bGqpUGElyqyUMRxg2nqc9Ua++YwxUm7
         7KuXVRU+2fKEFSUEdRZEVntcCveeT/X1nXXhzp1AhC1cLqWQKV/h76A9bWRMhQjwhQxQ
         wtRz/8SaxJx/vBTyhG6GEnrpJwJUttnpvpUINV7Th/NNUX5J+dEd4SgAIS9TrU5YM2P2
         gDEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792085069; x=1792689869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P1mu4SGh6E5z5qH2iwI9S7XC1+VTXuGAxqDRPc273fU=;
        b=b5AdAOgtRBfM7/x5i8Ex8ADfURDmnZW4AqO3Osc7DjSdONosMZulpGc1Gkjf8cyYNs
         zGQhr6qXEN0/GbjovPiEYry4k60XqAvKkLaH0mGq4+kV7voLsRWlyBJGyx36NxX8JgVH
         jKa6ydYft0Xmz9HcoG5FcE2eZ0pUzqtjMzuY+kHf4iYAHYcbtfCLxVpkxJv+YM4JlRcm
         kNcXsvn965VsZiG6z+NRk6/TkOytRpGgWrZqBh95N4x4WCq34wLESoJk0C0ENfkVQrPh
         jcWo+ExrZVBFvMzVbbX6Zwjnm6c5vCOk6K1ng6kqLxStN2lJaGMEKIJ/rZ7Ka/HfSKTT
         NswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085069; x=1792689869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1mu4SGh6E5z5qH2iwI9S7XC1+VTXuGAxqDRPc273fU=;
        b=c0ZySdFI3VF2pRC9ZOmq4C7m51QohiyacGCtP4s0WPdlZ1B0OHWPWLbtI8gc7GzFx9
         TBBijg4yFMji9U/owS3Pb6FcKlaVOEmc/KuUIrxATVEhrjKg/cReZy03dGVeE0tcbHI2
         CbvvdHWCFhm0Oo6veqBfywdXX2EuVfn6B2/iWlAT03q3PGHPZ2sbcsYD1yAN2l2khig6
         FAxjqahl+y86VPkVYgfHNV9WCHLIly0tfo8yljJQ7B8eGN6JCVslgm/ZVV6mO9H5w7zb
         ArCUExBV9/qsZ1FFppKYYQezTMGhjTXGIlExjuy7/nbGJzZkTx7RBVyN4DdKYotyxDbQ
         EnRA==
X-Forwarded-Encrypted: i=1; AKwUvBxXVffh3IQsmACV6h5oQwetbCAd3WxES6G42sEkBzxF4k5IXoMMB7KSTdjl2Gt5PB0BwoIy63hdOgBjxew=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjFvmRfFoTX+rc+GcLjDM15F3Lz4Ce2NUqwsWo9zoCi1EUlIJG
	BnRWh1hZMwdJST8xwM5Ka1Ijb5ARMHZWwS42qqihG/OSIHJJcVU4b2ZgOYt/tNORIERjeDFXuRy
	3JcfuozRNsZZqAIny7wGwHkbNTW1RfpY=
X-Gm-Gg: AYBFou0JgaZYBYDtWoEKvhY369meWLHD8fa3mOHq8EuuryDaetfC/0CkbQ+wkmDNcM/
	evDBUzkhYg1COLp0qm5KjM/VUkm3jPUD6Rit30owiv47kpBep9WLulLGOcFFjlVrQIQn1i7XC5Z
	hHEvuJvtiBeuboQQG10M01Uedj0hvbVR3uunPSwUrIu4X+Q+uMki2lMRksU3qsPedLRkBH6d1Hb
	fs+2z3PvjljdyrhpohkFJUSThQ4klknKU4XO4E9TZfUmkqSjz2St2uR9PgQF/O0IyctkUCWrFPF
	/ZljsFUvSn9gKTmvLtAvRkv6Dsa2W9qzbshYtrRfTaHOhrPrlIrsNfCwjQztGBDryeuDI65TY05
	ZzXwTuTtXbe8PLaDUSfDAu8Z3Dyxjdi+1sGzg+xKoHfrYBBE/yK/031pVe8IuANp21ujdGipJ8o
	HZyZ7FOAMl60WQyIaH4bBpTav4xnQaFGXZwjGly8hMNWWMhEFiU68=
X-Received: by 2002:a05:6808:6c82:b0:4f5:c569:b9dc with SMTP id
 5614622812f47-50c322d0685mr28531634b6e.0.1792085069043; Thu, 15 Oct 2026
 10:24:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <atDkPrlfMSiLi5XW@sirena.org.uk>
In-Reply-To: <atDkPrlfMSiLi5XW@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 19:24:15 +0200
X-Gm-Features: AclHuK9yTozceFfwI9aW5oCtwI9a085rmXQ-p7Wc724AAxuqKioAl_EVMlXu5UE
Message-ID: <CANiq72m8pHqc7ssFX1FyQkSgm+rpdgzn7mw8D8WRpHCbXAa4uA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Alice Ryhl <aliceryhl@google.com>, 
	Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 4:33=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Today's linux-next merge of the char-misc tree got a conflict in:
>
>   rust/kernel/miscdevice.rs
>
> between commit:
>
>   a4082121eeb5c ("rust: miscdevice: use `#[optional]` attribute of `#[vta=
ble]` macro")
>
> from the rust tree and commit:
>
>   ba9d2c7ea7f8f ("rust: miscdevice: add registration data to MiscDevice")
>
> from the char-misc tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, thanks Mark.

Cheers,
Miguel
