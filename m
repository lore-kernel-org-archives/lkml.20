Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C001C352001
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788617550; cv=pass; b=dd/ZPjEtpprVBByc5m9z85w+s20EgaXLe3ZpMkhXEb9liqt4gLpWrSJNTQn70npARvkWWTcBNzOVf444+lxwgcFdHaQdZ6QLnRrglyUQ0rAnDKFnwwhKYIX+23wEfRJW9fKbA2n0+cyeZfAb2vH4AVCY2612CvNFG+QFTrkSb0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788617550; c=relaxed/simple;
	bh=EFnYeSVdKVXMd6TO/Y43d+8KL3G7f3KpGkTiTDfCLDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsOe3DUXGoXk8YKP1QIi1/61ln4MIdTAN/ngslyAXZFIRIXPxhk425g8t/nGQpvcH6VCpiomVsqGCuYfAOSfo/Kc1bF3ZtA55913IxQXfD48tJ0ovYNfoMrYfVzRLDxWU3xxnOOc9Mmku997TQT+yM7EhJAVs6kWLNnozSPdzJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5Vxm4Ik; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5Vxm4Ik"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso80705a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788617548; cv=none;
        d=google.com; s=arc-20260327;
        b=S1ODrrsjWMhfBzAnMkXTcCMnwk7qyNHl+3PtEn+0jJ5lJdyzbv07RcvNfts4fXlNGL
         8I0q/HhYyk1b5TVG7wTdoPmaH7SmYF8AID6TuH99bl7AMsa4hze3GCzJqGtfvbxnXx0W
         uRRNdjYmvMb8G4E4Nwl7TeEQl1oflpj3PvT3jdpzYECfMJkxd3hB1behS96D4TnSQYT+
         vT+zT5UeARl75chk4/UCSVYjwjWcBgf7IuT28K0UdiMlUPip8kQZPGr9JdFsUAN/YR3T
         2k69+WreMvcj+QfIAGebIf7OhMVvF8sMnjzAnLnnoyCysG4ywbBj1bVkyQKL23vgjE9X
         aptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CgPxNoeOKOJ/enPgDZxD2BJ0wdJ0wbTm11Fisl0xW2E=;
        fh=D25a8QnQRw5PKhO5LjwT5lWx2RGHsFUx/5Pi6mSZvA0=;
        b=jr++xETuw9DYJMREyOXoamT26aDBhKoxdhO10s58EZm+XvcJtRWOQcqyN67+2u+qZg
         LETE6gJR4ciIXsWhEQOu4XUHaoZwcl7tNV90xswGJO9GMwdjV0Ho/kFSCrrmxM56PTqC
         7bEDCnA2Fd/15QKNkUv62Ym/c39xZFVp2bgsiuM13NmL33WDJgWh8nB5/baDlxyyDssg
         ezOryPQhLyFCTkDvlkbmEgH+jyF/CZBE989g0tniwkgHCfWF8Kjz3j/Byb/G/fwSFab+
         vKFokWIHahsDVr72KBOukJa37A15+salLwUUzmIcljKsq/wFaK2chxYYVBsuUDOL8z6O
         WNSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788617548; x=1789222348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CgPxNoeOKOJ/enPgDZxD2BJ0wdJ0wbTm11Fisl0xW2E=;
        b=l5Vxm4IkO9uXIUrqAJnvXIdiw7nos12djVac3GoFNTs6SGkgygGMA6ECPSBFhSDh8k
         dkODv3NwVZJQe4y18YVTGvZW+oQxUvx/Ds++imzKLo7Ki78GNPxGWXnR2DH56QMjtJb1
         O1HEXCaJOhGI19ooUYCU/jwbCWUreVO8SJRr114GijrJXXRmOmri1INwcUC1YQAmYy//
         Qdj0KgKhPpQVTnBUDU3f8B4ks5EPTH0j6/fqNmtSrZwznM2dM6/kdPTZdla6U8Fm4aL4
         kLgGf3rQXSXXIN15t7gOjJz/KbipH5pbQQ8BG30fZcUc+6CVj4qSw8aLcLGIoCdo4wb2
         ca9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788617548; x=1789222348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgPxNoeOKOJ/enPgDZxD2BJ0wdJ0wbTm11Fisl0xW2E=;
        b=VaKsni1WO62Aam9GIe549QfCcfO03SF3+0wCANr+dZwwzeRxRuYWeJrYHZRuhYTp7F
         TKouafnfpeWyX474XlO0Yaz+q7XFEDwyemcGaUfUu+EP3X4AscNNrrtyXFBBEHaNpMmN
         TUQWPg59DUpSR2sm6yw7yOxqnSMcHgkXehh95MnLM1t9UxEafpURnPindWeEJqJGVZwO
         YL3N6Xm0s/t9uJ9u/qrUK+1/jttufuPKCDbjLqatoVY59/mCG7jG/A+pSs5mVrAYvrJ8
         maSvHZSN/nYzDyTsjg5p9+8wsAQqvUhYwIlAtw5FzKwcFiqRYzZX8xX3y5T08wFRMNPG
         iKNQ==
X-Forwarded-Encrypted: i=1; AKwUvByNRHW8P98Q5X1cjKvb70x3emLLR1wumGtErYP2CUvryC+1kntmtIBvPNHpT3LY3bF/Q5PWh9m5Fq7WqSY=@vger.kernel.org
X-Gm-Message-State: AFuF++nb3B6DVKl5989URTqZot7KG5F6P7YAGX5Fnqc2mGQjmoH40E/r
	wnZK4eFVCaU8L5fl9XtZQpAFaNEVVmMBsq03zewhlhF34kJ6T6Bugy7/Q+/SeLbQ0Enf5rrAPrt
	rmfXpegR4ZbgjboWw0EYJHvzFo37MgpI=
X-Gm-Gg: AYBFou2qq8xrDWVzFEG2Ya6ktwlzqpCaqTbOg24qSERVMVduWyQtROxOiA+Oy9qIHTY
	wBYykt3pUnpbiFCilrfr82dKYm1Q/9dl0ukEgZP8c9EZ5oTpcHx2riLml1wWNwbKjp4JkzME3tZ
	S4Eh5SZhp7+07r0KskibKi5qhDiIKs5D5x/ziaILrY4+c3cbTiaShg+0KwrNP8fFcJHg7HdgvcX
	jTDIaoIXPbiOJo+MsJiztcw2WQ0HPuzk+2VF+0bIsC4e6YDcgxzYDN4lMY+ytmRWtSBJD6Xg9mk
	rShCjEMDz8lRgFb0E9mq9qjfNi/ZV49GJ/w6L3uHQ+rpRfjbrJTD80x1DsGQspzuo6P2KmYj7HP
	PIOsc+yOH/oRr0dqEwcpM/jjINuYSfSCFj0vt1SGji6KWu2h+d2YJrod0Q+AT
X-Received: by 2002:a17:90b:4b0d:b0:38e:c140:2a0b with SMTP id
 98e67ed59e1d1-39b3d78fb3bmr5583794a91.3.1788617548109; Sat, 05 Sep 2026
 07:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-feature-rust-num-seal-integer-v1-1-83096115ad64@younes.io>
In-Reply-To: <20260905-feature-rust-num-seal-integer-v1-1-83096115ad64@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 16:12:13 +0200
X-Gm-Features: AcwNN1VugqNSp_8Ein0XE1Abe5QXhVthwvEHazcMbqXG-h6bVCGPCS19YnQwxxw
Message-ID: <CANiq72mMtbyBE9Lb0PUT-mj5pzOzauND8_j0Hc0mOGuMnHWB9Q@mail.gmail.com>
Subject: Re: [PATCH] rust: num: seal Integer
To: git@younes.io
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 4:17=E2=80=AFAM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> Integer is currently safe and externally implementable, so an
> implementation can violate those assumptions and make safe Bounded
> operations reach undefined behavior.

Ideally, we would give a brief indication of how that can happen (like
saying "e.g. by writing ...") or sometimes even with an example if it
is short enough :)

> Fixes: 01e345e82ec3 ("rust: num: add Bounded integer wrapping type")
> Closes: https://lore.kernel.org/rust-for-linux/CANiq72mOfR33s4y+Ueivd5NrC=
5yre+Pcp57ZOBz0msw9A4AP1Q@mail.gmail.com/

Reported-by: usually precedes the Closes tag, e.g.

  Reported-by: Miguel Ojeda <ojeda@kernel.org>
  Closes: https://lore.kernel.org/rust-for-linux/CANiq72mOfR33s4y+Ueivd5NrC=
5yre+Pcp57ZOBz0msw9A4AP1Q@mail.gmail.com/

(But it is fine, i.e. no need to send a new version just for that)

Thanks for doing this! If Alexandre is happy with it, I will take it.

Cheers,
Miguel
