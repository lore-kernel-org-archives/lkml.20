Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9493955DB
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975050; cv=pass; b=dU2u5C7Ma9C/UvlkA71tt8hy0gIokKuHPgqZreQLeGtnct2NmLXWH9ALwg1lGJCCWJtLT+YQ4zhQ2xe3WyrnJ42TBmckMLchNJO7TQq1TGDanOP48IcjfxIlWC3herCN/SEdqdwpc3rDorLMJegM3MmE8i7x1fL3ByLELtTC1I8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975050; c=relaxed/simple;
	bh=0noNUFUEX+eBGmxLyPO+FbW91TOwqpdPnLQHoTufS0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TT4ibyqNZNt1mq9LCrKlL/mxcantOP/xot2aA9TicbLsWijnlAUo465FFpyOcG4OOowfVflf5Zj8jRRWWUaMft0jD4gt6cFcAFKbPO0681THdwAdG/w+FnR1KHVULvdJ0t/KUqPt+JnRo7BzR4y84+slS/AZ2uxeIQpxtqOxP4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8MDju95; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8MDju95"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34ba85727b6so1649eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790975048; cv=none;
        d=google.com; s=arc-20260327;
        b=Cz/ReJpqc9HuFe2fITduXIZqRwzwsMD++Xw1HQqDgl5zXn0SxgQupGmZYP8WztKtE1
         LESWxcroVDyKw5mV08Hlzeo2AixFQ2U2TNPdgeLG31HDwCQSuTimYTwwG+Wa1TxVRtaG
         8DbsLH53k+RwqwrzFeAGyM7nq75sTfeL9Q2p295xTPPK0K0BrvCQJY5RA3Y2+2ZOG8W/
         cANXoWTIp5EEDMpiC6U0ExOnv5YFrm8zff/zYFymaVaEe9SXHOXBAsev2R8PpRU2w3u0
         A/hpQ0QOGqNJ/sgm/4SmBYMwBFC5wm1po4LG9ELHf5XewipkOoOWaYB+1IKICtgEcI3f
         exdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0noNUFUEX+eBGmxLyPO+FbW91TOwqpdPnLQHoTufS0k=;
        fh=63GHkHbzI+qQ0XtQlqZS3N/tZgM7voBlPt8gAbQG8vI=;
        b=FRcwjsjmsj4wT7xYebeH0Li5P3NTJRcHGOHpyKEEzp2XQ24F6YmStxHYPC7uDJq38J
         PkB4mkogCSvTRrj2MiCgxrK71dO40VvSVJ8D7GBe38iVoYH17Wdcq9dbssKv/kiFGZ65
         jYSGEAxYdCM/bqxgArhajyQ7FuHjgtbDN6qLJYroZmZRvmt7ho1yeIcAkFBx6HK+RSp1
         IxBN+K+bEMmx0RQw6QaJIEleOXlmWJMviJTfliyGhvA1q9Lf5ixCRKJ67uKtskxNxghU
         QCSZ4iKsS86d4xLDzB3MBot2PSsPBw5lK0awJdCK5tOO7yffIY8u0krCk3UeL1RL4kme
         Voag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790975048; x=1791579848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0noNUFUEX+eBGmxLyPO+FbW91TOwqpdPnLQHoTufS0k=;
        b=F8MDju95lMzm2RB0DBPjkvKX0/uV5iBYuLMom1OnZeaB+YmTWK5ac1o0tJYNZXnyDC
         DiFp+AL+4iLGL4W/vyUzeWgeJc85aGer5E2CcTITTiA1vRX9nPgg2UQbSW4bEgpKWcTk
         v+M7xSBrWWc2iURBGNv86TSlXgzBHZwpl6cWn57MiSVI5VNZGPR4AXZ5NBqDtzWuxqn8
         BW1gUdrcqVfvad4UbtFAblKhfQd18qvxH8le2tWrSM7K251WN2KXxoRH+55YCUMYvrkc
         UNIyBqREWKK19g5QN7xdXuRI1dDHwBtlXJ5u4+4igdLs/+8ojuZzsALRgE4bd1JTZZC/
         Xnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975048; x=1791579848;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0noNUFUEX+eBGmxLyPO+FbW91TOwqpdPnLQHoTufS0k=;
        b=L+tC+toBpXVKYOW2D0N505F9b5MoR7mY1Loe8MEnbHL9TdWhHEVmzqnMk1FLaa3cNs
         Bg2eJ5aUnE1BfT7jQyw0gzaGL0LyS4fow+AnWIXC4q3s0hNAEvzVKVDzVrIPFpwFLe8+
         hjTCIRzz+fNlGsQLLwMK5Fm5nK0UrdjUYIsVgggeuxlVXxqiaM41lgnqiTBJhQAY4Dqg
         ClfGoAEcJTz3K+jIPUYdEe35gycNNd5875hzJuSbfoJh2HHtM7gcVZApNkkJg9URlzTw
         Z2Pl7tWi6YMln0dzKZSBMoLRNB7ffKB9CIvhEOo26YY3jYdXJywr3qVWBBOvNbC+z6uq
         j24Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/MyMseOrFhbsyoQudkVAh6Ur7MLbDYn1mr6oAvEhaCNBIqIFis8o3eihUDxf7ijeMrBUdwHMspMY3/uM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlIE9JuPah3fzAksOlfw8+b4iQYHpIN7P7q/5xc2dVF/CiCoce
	XxE/1CZfsnk6dQO8GuafeYYO4kHg2MqcNgg21DV3arMyYTtMFqHQEvjZADxFl1b8AQXy6DXFSb6
	WmMLKZ/ZvYDWGqXdwYt/ZSd8GzXA2gKs=
X-Gm-Gg: AYBFou0gDFG8KZ/KLCdZU7pFdOB90qQBEtlXtVF3zamF71Hb/ea7sO/KgJEBK5XMCMh
	Fi/cVRSTIC0jOsodtZhaQm+Me9NbdFdKPzknr2z3R6PgSB6ckCHExMgi0mPPCNkPybZSSF6S/ET
	geKg8u7uSin8esaRg8s4EES0KYqu4F/40YojQUCuh2R8R6clm6Ac+pjB8k2JR0k+9AT1dQYuk9c
	14Ig8wPorbucXLhx4yqn2+/02kP9H3T97nk8fWzvnvMVMIv7+mplK/SM85oLD3tkFXd0cv3kVDd
	g5Nsc3GxeV2mOtaEebbO/U5NaFUbD4gn6xpNp1e+42QhVhl8ZRBed4pOWce3GdofvLhKiYukRaV
	L3kRPjSZqZIqOHmYc0yoINPlFweaSc3cY0tfqsx6/UT3Z9/TersfE7FE3yKATuINKP563RrB2Xg
	XWcsQW3FSXVm1iBz6V39aMeE/+V1a+cSDvBMn4ZNKh4Bi8JS4s8G4=
X-Received: by 2002:a05:7300:4f1c:b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34f1501d239mr5973962eec.1.1790975047903; Fri, 02 Oct 2026
 14:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828122444.475-1-nils.lehnen@proton.me> <CANiq72kzouWAJbbhpKQXYit=VnF-9z=iLspk6mgSQU6m4-Us5g@mail.gmail.com>
In-Reply-To: <CANiq72kzouWAJbbhpKQXYit=VnF-9z=iLspk6mgSQU6m4-Us5g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 23:03:54 +0200
X-Gm-Features: AclHuK_dXuGnJOPYodrtO7InoqnggBz8eivzSKeWlZZf0S62XMBs_UI8KNZJzwU
Message-ID: <CANiq72k=u195jL_Ki08pc44DfmL2y+CMv249gSE6Ocp_RZLmsg@mail.gmail.com>
Subject: Re: [PATCH] rust: of: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Nils Lehnen <nils.lehnen@proton.me>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, 
	Moritz Zielke <moritz.zielke@gmail.com>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 9:45=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Looks fine, thanks!
>
> Rob, Saravana: it would be nice to get this done, please let me know
> if you prefer me to pick it up. Thanks!

Pinging about this -- happy to pick it up.

Thanks!

Cheers,
Miguel
