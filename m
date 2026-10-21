Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792576699;
	b=Vr51LofXBKcJHVtc0jbLOgM+VxALWKWoEe/ih70j+gDYwwN9JqGRyy2y8qUhwh3H2W5p
	 0N30Y08QghicgQW9SYPy40UH/kFUk9nZnTP+1tYXBjIH+uLYc2deSQu74hJGyyTuBLaFQ
	 op9QbjbTvXHhMxBPOS2eYDccHu4wUyMUJHpYoqkUbu6HyPbSsdC6JQDnRxhqWeZnpbnRr
	 T3ygDucmpuskAz3CkGo309SnzFAPlKLlJ3RLrCXi3MdEcP7P8B//Gaa6GG4vnk1YpstRW
	 pr0Nsef4MGqmdmOLR4QQrMsWVBSERIYWoyHfTb2dyogOhekPnfUu0ijvmKW2LX/P23g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K8u5x/k7uhu0io8bcLigXaRCmRBBkRV/Jd+DLl2yKI0=;
	b=gJMWggUZ2RIDg3ioH2HMYO48HXG/2F55/xcIvT9mEh+kzSvoxevOUf+ZJAnWEGBSRXBm
	 sgtDgXDHFcM28TqpQbiu3FuGdOzab0CLHHSlJJdV+0jdjGsMuwCBId/qu8wfWpHTMwwsd
	 hSACQSSJr3kzKFLfuDOz4e7LdHYwN0MA0LaoR6jLwG4PNY9BQPQ7Lfd+Aj32KQQkBOQtR
	 VFq+ZQXIe6qeg64mqdZbaYEXxufdZrccqFnNC1FQTz8+OyGHPWnOy5JZMA58/SqKvcVJn
	 1f2do8Pf0P+UTGjxqlgNg+Nrf89jNODmZLnShgEZNyFlr1wEHcVM12/SBCZgySOCVNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sU8kgkoB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE1E606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE1E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sU8kgkoB
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df4f540ebso284977f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792576697; cv=none;
        d=google.com; s=arc-20260327;
        b=EN2oQdJ5XvyErvnkRv94XrXXIZq/9INIPRdycFoq+habzZHreMaGcUFFUsV5ZA9C6j
         0Eh29P8azz737qr1nohpZMAow+JFEgFyk2wkmBuAv0NnudKf75t1q5DOQvidKOZfu9sP
         eMcwE8BCK4cmgSlOeHmy9zVO0dTdtCp26JrymueyldRTZri7FqGw33Qyfmc5sz5faF+4
         N5Yk2Rsdd+XCwAXZyvVpeGhJSQRpn2ztYerMYBgjBLdNNj/IUu3i/ik2Sg5nd0xUaNue
         SiEOfqARlQM8k213zN066dYzPZt2vFu4EF+sQ0uHYQjThmKLichKH+FMXFxaYL9788jd
         MONQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K8u5x/k7uhu0io8bcLigXaRCmRBBkRV/Jd+DLl2yKI0=;
        fh=g0M9fHvH+R9EmPAn8g2tI2O5QPy7VljBiMKABAFGYq0=;
        b=sfimRJrO7aKhQO6izP6Hy19InrxaWCfYn4ezYgvzHodZK5mlhudAgoiPIf6XYoZEcK
         EQe/Yjs6GrXwKJSeKvhFTVceA1PCT7Hg09IDkLeOKtDCoPkVZWYQHzIvIpoScOBCFIG5
         Gdh3zY4f+ZQaEFqUIopadmXbHeuhKZhElzfgRtiak8ZopNiTQxNVOT8CbP2WWJT2OjXD
         uPJPq4SCnipKn/tveSZyBrej/vurQxFe65ILUK6HnIrgNeD/n+C2wkIUmjnJGpaFe/G6
         3FL2uvYZaCHPumDMcuLJCJ0NnyaN7z2SepMtKBlp2pmQWdso2+3kN1LvJqhzSwXQ5w+O
         wXqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792576697; x=1793181497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K8u5x/k7uhu0io8bcLigXaRCmRBBkRV/Jd+DLl2yKI0=;
        b=sU8kgkoB9ynNNnJaWAUyj5p0ZC36yApSyKpwXoLYv432THGCufRhJ2eLAxXiLTzjCn
         QwAN3yZ4nfhA/U8ab9UwntdeH96EyjElbkPMUc+ieNBaPRXoi5Ovtu0b2UKcq1cB/xkt
         dY6aE4t9dt91hW9h6pUFfRJmQAr0y592rMAfV1WuxKVqKq6E9WNv3QDlM/sX3plRVIFi
         DJTBHbSzk/h+8ZTT6wagwxtSViwsiTJ9L5ld86MdUhmU07hutHot4rsfIiRpblGd3a2Z
         SIM4FkaE9m3elucNPhbJjYKhMaevyJxL6nDvwS0rrfXI/At/SbCdb+iAKaunwkxxhLCO
         EweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576697; x=1793181497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8u5x/k7uhu0io8bcLigXaRCmRBBkRV/Jd+DLl2yKI0=;
        b=Qwd/quw/LYe82tpaNpdzqI111vObfkpreZLZZwskP1TjexTj8HBVwYDi1peZ1chCpM
         lsfcdkILskaUIQSQy6IKbdPVb+kl6YzHx+hfvZHrJADY2qKT6rrm0KvT2Nr6lRjJBcfR
         TGNTmYy/sVtxfueXg0MiS1senKWBqncImuhKNrHMAfJbfjJI7pDt3rKmvFijvfe+Sz9Y
         WN6aH/g0vV+9paZm0tgBH0odD/czfYL6Ce1YJJ5HDuzs1alfiJwnyLH81aE8gttsVaul
         +TaVYGqu5QbdwBvnCEg5+fb+h3ur3kW0p6HSMLOaOhKrVvw6lUNSiK+D50EEmaLJogi+
         bxnw==
X-Forwarded-Encrypted: i=1; AKwUvBxgZulisiYa47+SDCuMw+HimoEAnx+zAJseU3GXUBR/tWji4cT2hvzKTa9jP/cBgkVk2xs3D+29LG5gUMc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAyFIw883T5tAOpBUJTiPzZRZH+mMmuC3pDwDaadMNK3fwMy9I
	Oc7VwyJtZ0r94oaKKUPZaGf362CXFoZb+a067iJIs32Eg9xEGKp0eyXXKOyWltizagCvJ3niI2M
	MWetzXmfodqd50TKU6Rvspp4NjTvHeOomRutXV4Ln
X-Gm-Gg: AYBFou3xOMlH3Oh275MxNuxT++cTicbOQlE7mUfpUrVX4R793IEXtWvABmISujeIUO2
	SnzQtWt2LYNLnCtolN8iVtI1kkFTOIGaghzApBD6qQz1mp+A7W2cqC4sUuV7griaToIDU7RpfdV
	WPUPy81fwyBOvi8gLaNWUdmCObkF7MfKDa7+Yednyh81LWcoCH4/hK4NbEkV/GJV56Ovg09CH84
	9NNDLPLoXo4/fB401OiYYTvFgl4aiP0xtLN3U7VzWzhj3EpK8WB0Ouha9m1yAchkkyXhrlC91lQ
	uzaE+ed9XnQxDrbnj72bV3QImtAaqumowU3vaWnMJI6YmJpYNKfpZDwgrKK1HivoWYPKXRvMw+Q
	CYajNW0f8paNu6O3UxIb1THbPHoTELW9j2ZIyMvEdp+qXAR3z63CRs8iEPC6ur+ZhFzvWcHrIgd
	Zo12WfaxxW511VmXCZnitXpkC9WKHuqK5mLA87BrQLuw6q
X-Received: by 2002:a05:6000:2408:b0:48d:fbf4:895e with SMTP id
 ffacd0b85a97d-48e264a2f90mr3189902f8f.11.1792576696607; Wed, 21 Oct 2026
 02:58:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <2026101318-stingy-crescent-b47e@gregkh> <20261021033257.1359428-1-cmllamas@google.com>
 <CANiq72nHP4qiHE1=y2nhF5en2r9XAR40AnTUNWMK3uPmGuENWw@mail.gmail.com>
 <atiKAh5e4BjYgHSu@google.com> <CANiq72=rN04D4EEL=cR_BvZpeTh3SGEdQ4YpFQLF8+u3rvyzjw@mail.gmail.com>
In-Reply-To: <CANiq72=rN04D4EEL=cR_BvZpeTh3SGEdQ4YpFQLF8+u3rvyzjw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 21 Oct 2026 11:58:03 +0200
X-Gm-Features: AclHuK-LiJpS1IrS1VEnRgOcXIRnC-bThS0_zTbTA57_6N7DRMBinWmsvVfdUzo
Message-ID: <CAH5fLgiVaZLAuih0uRMfY_9UpQ3ARC2Oj77JEgnKYG1N0gnZCQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: add state_hashed and transactions_hashed files
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:49=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Oct 21, 2026 at 11:46=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > The version that open codes it is probably what we will cherry-pick to
> > Android's kernel branches for now, but we can definitely look into how
> > to best support non-0x prefixes in a better way.
>
> I meant later to clean this up, not here, i.e. no need to delay this of c=
ourse.

If you're ok with landing this as-is and fixing it in a follow-up,
then let's do that.
