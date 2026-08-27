Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E001047CA94
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842772; cv=pass; b=U5YkO6uH1iit4t6TFPXwJ3DyXH4VRYkoPgRlOD5nF20igFE0px9UGdYMvEouJ9cU842No66jBcBGB4zPB0kRPCoW7oj5ZXwH87obnFeKnkJfi0o4B2aWtu2lV5sFqc3o3txcePai++BTvj8r7qXju3VbYua7fCOA5cFQj9XGwdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842772; c=relaxed/simple;
	bh=41WewWIErbX3yd9Z3vKfnXfsdNWRVLs4FM/DXBSS53c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h41YAcgn9YOcIPZTLnvJR79oGiYaAXlv9CgavCzSRTCJEkeA1t8oTwfU622wCNPsjNnjph8+rD1TR59ERvAaAW2CQKXW0xzkXWC/VlqCWvEKIwvh7WmeZYxWQjCiCC1En0JKckhzdZDqIGE4bsy3VDAbKDogso9taCfXkGON4FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMdgmt1W; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMdgmt1W"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d590f4c291so4350215ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842770; cv=none;
        d=google.com; s=arc-20260327;
        b=QjjE7KD9fEyrUYGOttpSs2VtvzhTq3WExCm8kBrHErtqbRc+o1Dci9BIc7YVaiYKY4
         e3PiH+jeIjNqukIRwE8I8ccz3Xc/D+wt/dc22sB7iv/OMvxt10R/KsCZIVT0w8CFfMOu
         LataQmU/EWq6IgoKHpZIGuQuuET+BM/Db+djDJ6UO4KGWINC05snwQYlDytbIepckpJO
         g5dvZE8utTDh0I6f/Fm+pp0csbzA7ZsnIqPWkS1P0puk3aXC3VB1f7XtzURICsyHxoba
         Un98ldCVtBdeWz5e3DPOAom7Ua2WkAAOZ/B/LQpscjtQKC3OqWHvZIvzaqSCVGX4ubP7
         NNGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3caV8jGIKYECCoF6AjoMVnw7A/xTQryGhAY1zu/DQLg=;
        fh=lSFQK9+dxePzdzxSZKk+EsVokSlZkGHERef3Wad57Z8=;
        b=ZCXyX4sy6M3yEixSlr/4n3iAPdIsTT+1Y5tvyiWOuNAZ4CCCd2qIzDpJq51m7If1p7
         j7esa7/X5QOpNnnT6TuY0jyF+6bYMGQAvcnWaP9CBqQ1Qf2Pp8mdpsoqmY73BHuPN/fj
         Vjkmm/mWqLvG6E8t4GrkLGVNVcXoUx59Mi35nspycK6jLQwMXgkmXfYUZeyUVtjALP38
         6LgiE4rr5t9kTy7lI85e9WlQZyEDUgS8jS4AItamTmVPjHgWr/zJKBWC89qQPst9WpHo
         QjLUn3dDnZjuMyKvgb7JwXsNJTwT7MMZ8qiwA6eS8PXUny9WiwBlqCXZmkd1iMWgEffM
         z9KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842770; x=1788447570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3caV8jGIKYECCoF6AjoMVnw7A/xTQryGhAY1zu/DQLg=;
        b=QMdgmt1Wt/TKna15326h1CQJqqJV9kNggWJ+6lruH2vsyUr3pyLDAXl1c406Xb4TSp
         e0Xfvl1P2YgarMjFpi4zKv3MZYJHxJ2eZPxjpwHYjwrhbv7I035qamC3uI+a9coeOCqF
         voyjznUmKCH+ijuX8JbDR0EeKIC88y4aNojx/eUQ5VKhsGtddpASqNP6vsHrJ8z47LTs
         P7TNEw3YkA9YbveCPvwh1/8nD2NGrPqwuU/UEWmpOaqeqjE9Z6w6XKRVV3Sxn7xwcl1h
         9pSYjBDsPPuR2QnXPMxiO3jziFPicio449EOuxntLVg+U4O1Oj92UNVKgtSx50uSxOMS
         qchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842770; x=1788447570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3caV8jGIKYECCoF6AjoMVnw7A/xTQryGhAY1zu/DQLg=;
        b=fkJ12FDqAD9dV1R+uYhrTx9Lt5PUz8ww3jKESFUvAPDe9IPadM7RpWWsmKSyAcP4xy
         gRo3/jxZi/GibMEEBZO4I2xgg0rEt0Ph+gFLXqSxDiLq8en7Tt4x6a5hqABrDEQZBdwB
         W00x7aICjy7z9L+r8bLKEhBTSuxxVtyigoa8Tuu1wzN50y54ll2Lo7fmWe2h3wDxomTy
         strlMbs+swAIu4Q63JCK44DcvUWZeTuw5GOH8EushqUNil2BCluWCteEtBFqs8PWOe1e
         UuB1krfDc34E28m0IWCIRQ/3F78btvb8ii8WPU+tN0xRX0rPguvN9CdaIbT54jxTOcPN
         Qr/g==
X-Forwarded-Encrypted: i=1; AHgh+RqJfKx7Fc5tYXeJba5/CSKK/3ybuDxsOrlCZUWcFMn9eJZA0QT3VG91eVTI8kqabQhnlvbV77TmdF/b0/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kwqXxHWYtvbJtTBSW269VZxXsJZUfBelAu8QBeYnr7s4dmBdox
	hN4Ux3h1YK8sXwrUn7gS/g7uBPHfg1PZdWJPtzZiBs/AoEpem4Mfdj52OwR6j2TQ2CNBAMfzCDU
	Aqy5wwTF7HK4wLWL92cbn10hQI8zfEMA=
X-Gm-Gg: AR+sD104X01Qoe0wJ/fMWgZnYN5He85ccR0gHq8wB2Qaak84WlvRJQXGrsZHVuUMWDU
	Y167ojjXd7F+4ygsyPNl7VT/nhVrkuNscw6PyncU4/8b/VEVwUsMEjb0v6l//vXTUbzZz8AOAAI
	dcZ1ygruRXdg7b+Cayul7mW+0TQZU/6d7zUynTGLoJug8NED+xK7vVKv/owgfHFnvXr+aeIKwZ5
	w5K9j7+M1RVdRLrL/QyZGcOG4POeeYoIYlAnIvenX2r3KR/gq/CSU2BEOW6rHfB7ftZx5+uvME8
	J7rFXLCBA8MxdPjkqDN1835daezxu0LHIHOxm6jvlaSLNv2TmTB/cEzf4HCbCHvB+KDlo+9u80o
	d6n9ywl5ExEEF7/cKFb34vtxGP/hyukWYoqixgxc7VXzoKnPs3aMGEGbi5uJC
X-Received: by 2002:a17:903:3504:b0:2cf:9e90:8be with SMTP id
 d9443c01a7336-2d71e4f74abmr88346095ad.4.1787842769819; Thu, 27 Aug 2026
 07:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826163004.3365-1-mike@fireburn.co.uk> <20260826163004.3365-3-mike@fireburn.co.uk>
In-Reply-To: <20260826163004.3365-3-mike@fireburn.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 27 Aug 2026 16:59:15 +0200
X-Gm-Features: AcwNN1W0d-V13zh5elWYWY1xq_Ye1PYxNifjQKCjt0be_UdVKV0D_eRNv-EoeZc
Message-ID: <CANiq72nTu0JMOQ2ovkCnrHVr3sFE648f0e1My9nesqmKz1Gpig@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: crypto: add synchronous RSA akcipher support
To: Mike Lothian <mike@fireburn.co.uk>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Asahi Lina <lina+kernel@asahilina.net>, Burak Emir <bqe@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <ynorov@nvidia.com>, 
	David Gow <david@davidgow.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 6:30=E2=80=AFPM Mike Lothian <mike@fireburn.co.uk> =
wrote:
>
> +__rust_helper void rust_helper_aes_enckey_zero(struct aes_enckey *key)
> +{
> +       memzero_explicit(key, sizeof(*key));
> +}

Hmm... why does this one need to be a Rust helper? i.e. why doesn't it
call the other helper from Rust?

(Same for the other calls I notice here in the context of the patch to
`memzero_explicit`.)

i.e. helpers are meant to be as minimal as possible -- just forwarders
to the same functions unless there is a good reason not to.

And then you can have a safe function abstracting the call and use
that from the different places you may need in Rust (e.g. from
`Secret` and `Aes128`).

Thanks!

Cheers,
Miguel
