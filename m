Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935CF48EC69
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788993843; cv=pass; b=MyPuxYIMKTQR2L9rMOLByfq1r16gEW9uyOCVgvKrSSIizTulC7gIhfFWEYDzj13V/Wds89x8c8DNQoaxmgrwKszfUzUrDUKi4zGYbE03Fee3Rloq8zjITi01yr+AcqKPWxpI3YQ9+4/3QTs4O8IJ1ArkYw1SOmOPefU+qySBehI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788993843; c=relaxed/simple;
	bh=Dr43X1ahte5L2uxAcXX7bum12Dy+2lPWXBmGNV5wrKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VMy4mCY0DcaobQVn+WGze/c/A8pXNZ7DiJmP8/5u3CGtA4Bm7eDno5ocVqm4kaNBpx7RZsSFtQzzireQ79rmxdoTEYEyxKS470YTkyrzSAn1DO/21u8ji8Bc+GM9pyRWW8FVenqFw3t+bvmnyg4D4BlmNVlLJTaDv3un33zaay0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dl0haaP2; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dl0haaP2"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d791ac0d6so41214a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:43:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788993826; cv=none;
        d=google.com; s=arc-20260327;
        b=kOUO+jGXgqF7Aq9nEcUc/VF93+dz2esAZTGsbog5oXM7oH2O5qwVRSeYGvLfwnTUW9
         MXD+qjEj9qOdb7nngi7gQX1X2cACWC4ZNdYRLgP5qRHEu3+cWOMMkT9vQupmBpCLPVeu
         8U6MGEeZOy0CkxMTRy6MmeYW0z4bf8mapx5ZOtp/Jf4pZLokl9UhbseaQwr1i8NAgDL8
         BRynDXAh2O4iFA/LGVeYNeizAqCdDCYIj/29K3uT6bcqkNxCpRMT+78056hXLle6Id1l
         SKPfRh26J8Xn3zOnBTbEjQ5YcIGXHxaZVP1kaXu3o9+a5HKk50ajEF3f5cSPd0EbMtor
         dOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dr43X1ahte5L2uxAcXX7bum12Dy+2lPWXBmGNV5wrKI=;
        fh=WmnU/wq40QIZvCU/3JqCVmfrvN03z6duDuPI+I9Lelc=;
        b=ad2c6PLwpuEvOb3qdFH96HujZbTSY6qzkAdY1imLfJWqhgwBH9S2dnBzJcNfCUtzJB
         ednMgUUv8alFKydF6zkKYSbU7wOWXonXFEEvGsDQK9N+bOGTT0LUFC3K80f+27uWQi4I
         69qXxyBM8PnKcQxretEZ3oOCdhzlM3Rz6q4887/tMOyfM9Wa3HnSQIF0zFoMIRlN0r8A
         huJLzSsSj/wYQbLqukPXK6c7y3LAb07jfnMTprCGJufjEcwc8FJixbEN5bM0MFuxtfVL
         uoIvhF1DFxgnAeF1EWDR5eVC7hFWsAw/ElTF4IYiP42G7iqwbMDj+AqMPtQs4VH5QhM9
         45Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788993826; x=1789598626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dr43X1ahte5L2uxAcXX7bum12Dy+2lPWXBmGNV5wrKI=;
        b=Dl0haaP2Sh5sDJzrcdE9F7R9ya9UVTGuVZ2/1Ay8ymSpmK0NJblDWlFbWvIycPIYSm
         oqsuJ6c26g7Gd1tZXyow5ymEzOey68Kzqsu8f4CVDZI6GuGRNNJcDttxf5LsqIxU9hsL
         OAiB0z4TZ+TB2aPjD45eaiG2TQ2oREzFakTguSbsAxGLYHTOherjoGcfyXBZdzWJr4e/
         jszKNgkLLpxW7vpw2VdEC8p8VwJRsyZ3tGZ3OhwGHBanK5ffNCencvdoP5V8o2lBuDY5
         MI89bYOUpl6Od15ZD8J1mUoG7Vmuefv7jbHq5KrnDl1vvhFMkXBzmEDcMAQURgD4a1u8
         94mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788993826; x=1789598626;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dr43X1ahte5L2uxAcXX7bum12Dy+2lPWXBmGNV5wrKI=;
        b=HG0IO6kdUyrZIXQwAUzKkdzw9WMIWFY58AKiskJcRd31Bsfy2ZD1YH7O7IrSaCGxK7
         mSuIQ2hRyduMl0YXdSc7nMAsdmlOJvf7go+x3eXiX5gDfmk7k6cPts13DRYJNVGwWn55
         txhqZUo3hYGtnwg5XnAp9vxqQ7CCJUhhs0v0KPHHGErwdQCPC4SSa9cAbSv3bScbydj4
         eYAV1HudK+/Zl5sZ2OI4kfTWIfln4L2oAEdkUePiQ3q8pUHJYwp8LVS99SYZzwqHQpNc
         tfnTrGpTeAY5pMfVaRWWKlyOfZX6SBmyPWFrlO2S7diIGhCPs5e9l88XerQDZ1vyXfbB
         czQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmlrIYsXRtHCzNoOwGqV3lw+cwbGSzx6Xehn4Ioswes6OkAdLW4S6DPep2q1i7hLDD/nQ8Teb+H/1Qg60=@vger.kernel.org
X-Gm-Message-State: AFuF++n3J3akgbG/Ed2WhXHCj6DZTTOltaPeshzN+wrwCtDhnZtGHRas
	inOXT+Ahtp2k11ZvkJUPssBJbVxn3m7v3fTqPFQZGt4YnEsuaK50RznzLoGk+eQC1vowdfiBNIe
	lxqdeqteEDGOfhYw9PYZmOy2ohzn3fR8=
X-Gm-Gg: AYBFou3Niekq1SOH9H0boedW3Tr60HBoLmUc3w452K9faBH1LtqTY4IuHflT3IeVo9m
	zYV91wNHZAw/qGOX6iUFTz/6vrMeadWhU30ThK9xVFCb03lhlWGElfdrUGEwoOht+OJTmS99NNj
	h6sADwa5navYM8/cl5SRclNI+AaA6mkxEal6eE6MueDxXpRqo+O+EU34rGHsHoahL1n6QqHDzb5
	WTnXQCRBFnKhDozz5U+Ut1TRtMhMG6qXsTm6FsHnw5+FPW3kCnpd5CQmwa+Lf97+DiGWEs9XWCm
	zunbu+2oIGyB73mFZU94Uz9nxg55fGn45qXOTA7UScKnsv/3InfXdXLMLBoSmpxwsUWIqKFVEdP
	PKC4GdYSusK+xJ0lz1+BGkxnXoU46gEUsbUZJSEiOcF0y22T8ApZMV4oMjK2Zom7B2vuZQKM4Xu
	MrTuisAQza7/kYyBVW4JOqkYVJx2gHHJq6o7ilce5mH+PV6xs1CCg=
X-Received: by 2002:a17:90b:4b0d:b0:38e:c140:2a0b with SMTP id
 98e67ed59e1d1-39b3d78fb3bmr30315158a91.3.1788993826465; Wed, 09 Sep 2026
 15:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828024335.946-1-nils.lehnen@proton.me> <CANiq72mn2vvCL2VP8yJxmzXM4n+jfV4R7arUcj4UXSi04y5sfQ@mail.gmail.com>
 <CAHC9VhSuuNmdRQ5puaxWh5ez3Dz9LhtAmZU40SUGgEAL8Sn9-w@mail.gmail.com>
In-Reply-To: <CAHC9VhSuuNmdRQ5puaxWh5ez3Dz9LhtAmZU40SUGgEAL8Sn9-w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Sep 2026 00:43:33 +0200
X-Gm-Features: AcwNN1Uyn8Ra7gcy_xftoK-U-ANDYC946VFJHbtC8gYw4KcE6ReujmH5Kp4eAgY
Message-ID: <CANiq72m0yYRj75RQBRprcHTrqfd7=m_OnZAAQfZdO9T3dfUQdw@mail.gmail.com>
Subject: Re: [PATCH] rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Paul Moore <paul@paul-moore.com>
Cc: Nils Lehnen <nils.lehnen@proton.me>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, 
	Atharv Dubey <atharvd440@gmail.com>, Ke Sun <sunke@kylinos.cn>, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 11:51=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> Looks fine to me, I'm assuming the Rust folks would prefer to take this p=
atch?

Up to you! If usually patches go through your tree, then that is fine;
otherwise, I am happy to take it of course (ideally with an Acked-by).

Thanks!

Cheers,
Miguel
