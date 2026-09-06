Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62709349CD1
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 22:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788735388; cv=pass; b=QE3ikyJuSxzpvBGeFj3cySOkBfutk16Ds0d45S95iAQg4CRitrGAL6i2NS+3+Wf6CoHo/hUfu1SLricaHLD5ifKwhMP6IXc0FNeRIlpJWCVYTW6/e02DUAdSGDBkTAktgeciPrWeywlbx9LGVv+4LO+1PNJNEyrxeIDOA/6DoQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788735388; c=relaxed/simple;
	bh=paG/hrimgcWf1EkCmYTBW581sxN7ZwP/TIxnC588EzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5jeHvPoSiqmgcvI4L0/xtn+qs5MWJwzlXEj4iHUUCXUrrVEyLTBi7PZCrUczCzSHulfhmOOk7FmMB3pyPMzKdwo8BsSWlHR1qxrTEgzd4GnpD15ixGtHSg6p0eHS/lmDIorrXbaZb3OxdTQaMsEkgzGQDkrpP8owiEcTSaoid4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3RXMjRx; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3RXMjRx"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad861b1so360292a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788735387; cv=none;
        d=google.com; s=arc-20260327;
        b=sdpO9N4yQHmRDt7bcYHYG6HJuQNHfoNDIaqyZMdBxGUJJwxa2NRr4l7QSBv6sQJsuW
         ZAu7mRSDIC7tRfQjeTE+5eOQHOXFYmbA82xeZ9URsJlV7+LmIx6/L9sCoAY80wkxkNtY
         0kIxv9O3x7eexwB82H0+gjjeOvFOqfS61m6JMYKawpSapWG/6DKbahaGsvvAC3n18VEV
         RH3Ryp4AveB2AzMkHjzc+VorXMqvPnb7jOLsL9Jlt2JWlvOqyIMmAabeMXf4of4r4Y5z
         rQXNme+J7uJmwThEsMTQHviVhTQMIghyCeW1ZorJYnQQAooMayKCOCoBv03KvsQz6S0h
         QniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rzuSXReGoSaELiwaXh99aoX1WEKTS8+9Sjq3EwGSwww=;
        fh=/t+CvK0bIQ/xz7cXpDesd/VILHI2dWypLpl3OsljPBQ=;
        b=GRoYwGc096mWPENXDr/pEml6GNWYb1HLh9rJCMpV4fURWzet7ps/PNnqVtnHD4qfFI
         6I1jzCHuoz11iImR+AA0USr8A94fMFE2fInZrQSYENsZCePFTbsMWQR22KsvfGkHA2Ka
         l9lX2vXGiDSHZGooXbpZQHcMsYcq7CWfKNciqQuZG9Eeu0EOqUplbqt4SQyO2Y3nosDu
         pTMHC69FDpcMECcknQwwuL5VUV7C0zeRMG6kHejHyzJ3NYcR9UcrtWlBvqCMBNlIE5nk
         ZzXvNzOLQhSY9ZbaxA3Od0qmtZL4uqXYh74j3jNrvTxKQ7Oy6hR7tpNFin4uvqcLmLGO
         oVcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788735387; x=1789340187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rzuSXReGoSaELiwaXh99aoX1WEKTS8+9Sjq3EwGSwww=;
        b=U3RXMjRxGLzRknlLRkASnLwMd5DDqFtb5pKDXrI5rbEFNTV1a5tp8C7fMKyuC27KQo
         U3sn26+ouJDmw/ezZoPydVwQYZFKW4PW+Cd+XHOSL72hd7U9wlKQy9VBDya+WJ31n9uB
         nO693DxaJbrtFw8I4ygfmKX99/rwMotaD0z2YT2eUaY7PesYt0qsbGp78AVuZZXRFBDX
         eLh3+rXP5evqxp9J89PUDdvYQpd3uuBfZ++moHJ0ZrCgVtFFzB+gu9prtySdk+AGowTE
         AftaTwatmze/EH5SNyMQIXi7b9j+c9osYXqK4ED0UWsuaarFX0qGQMp/sFSyYO38Mt6t
         mgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788735387; x=1789340187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rzuSXReGoSaELiwaXh99aoX1WEKTS8+9Sjq3EwGSwww=;
        b=JCqAdGcqBFTtNbK77Ez9TWerJ5fdnq2g22JjkyIQicuWy1au9LjG/U/aLU5RI9xVbq
         1x1f45L327EgdiVvRp7gepLZmP1ALPWbfewpNc9xNgLSwZW9+8tyuLUnjpx33HOOFRXj
         DuAsSglW6OOF3Pr3cbA+4exhzcJZGUBUgz6/68cP1mSL3JjoNWNa5MvGzGJoKFLGDRV3
         uzYyHng6F6VfpcuR5D54nLcnoXhPOmHU4HCP1LapAXgWBW3JB8AUt/xVIHK99rUeFdAA
         ou1OensoTq1QZcnF0ve1h+CPtG55k+7JDGCo/xjHVxIv75pDBREq7dp6wNYVlOJVjBmB
         VQYQ==
X-Forwarded-Encrypted: i=1; AKwUvByEPMa2uWXCkl4+kdypz/MMMoSjCmU+ZcW6oMsPTC1Y96jJUapkE8YEgs9tfcFK01ReeqJ0zkDRgtJ90Ks=@vger.kernel.org
X-Gm-Message-State: AFuF++k48MQN6lbJ+wL55sNfb+46d4pmiILYFdyRRltUIVOIystGNx1T
	9zBrt3+D9AbXTE8RSfPAaR9KTeCLajspU8ertz2flm0Ebp7BxXuGDqsBkuHzSO0oMaUl/DR4VPe
	xqK5mMxTyenR1a766pem6EZF+ux0YBTI=
X-Gm-Gg: AYBFou3w2B2XkAKWq/9u+63j03EerPMiXNg5DeJqeI1su7s1u6bhDEqovTmFEONm1Jd
	Reu5bDZHAHWv+blV4IpJQs8MO1hWhqCTRAowGH09SqjEC3Lqd5f8Y/8CU2mm6MmJqgiCJTN2qsY
	FQ11jC58fAaqfETTzU1pPlBGLSZHBV+wNGDujMdhnOCBww7rBVWJ3rHutBf5oh8L4/k5s1tkMyI
	LrE90M7EUhiaTjgENJ2SuU6vJaXOZ3bTWQr/R0v8x0lJzerl2ZT7+9Vx91BF7NRQQXEQCVTSq5S
	4GupzME1Bjw32Co2MGBKh9TgGPhkM9yY/fkDPUmXGTlQdTPi2gBrGstJW6VallrW5WEirfXYc4k
	fFJfXuNmudKL/xYOH91bTzQrCeUAodEq8qgOfHdfFbXL9hKARaBDLfsMvPOUM
X-Received: by 2002:a17:90b:3907:b0:398:bada:832b with SMTP id
 98e67ed59e1d1-39b3d8a3d1cmr12034422a91.6.1788735386695; Sun, 06 Sep 2026
 15:56:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906215822.1201022-1-jhubbard@nvidia.com> <CANiq72noJ-4Sx6Lj32yGWTm_pzmMkH1Ue37W1y2anzpmN9mMeA@mail.gmail.com>
In-Reply-To: <CANiq72noJ-4Sx6Lj32yGWTm_pzmMkH1Ue37W1y2anzpmN9mMeA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Sep 2026 00:56:14 +0200
X-Gm-Features: AcwNN1USv6HajX3FrU4EvG2yFuiOdSdQ1dukhQR4-hacY4j-0RzaxKBUNfPWA2A
Message-ID: <CANiq72mOMgLi-8BBhFDLTzKqWrBNu0n_5D46jnwU0kwJgZ=j6w@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `clippy::as_underscore` in the generated bindings
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 12:48=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Thanks! Looks good to me.
>
> We have been getting 0.73.0 and 0.73.1 fixed for a correctness issue I
> noticed and I didn't see these yet -- I definitely recommend avoiding
> those versions for kernel builds.

And by "we" I mean mostly Emilio (Cc'd :).

By the way, what do you mean by:

  The minimum supported bindgen is 0.71.1, and 0.72 does not emit the
  cast, so upstream CI may not see these warnings yet.

? i.e. what is the "upstream CI"? I am not sure which one is the base
commit either, so perhaps this is about some CI in DRM or similar? In
any case, I think I will remove that bit from the message since I am
not sure what it is meant to add, but if I am missing something,
please let me know!

Cheers,
Miguel
