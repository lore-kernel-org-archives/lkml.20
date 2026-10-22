Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792680353;
	b=VUh6QAaygT6MeNtTysUdtjP5g4us1QL0vKuFiE49mXQczNqwDHRjkzbXicqxThGur/Qk
	 mQIe90jw6SXYaB5ohPUyz+1egv9Yu2uQQwftMnpHYCvKYHSIHXylEq4V9Nz/TIq1EQOxp
	 jTqHevrmv8Kwrp3pDigUBE0QinOWq4otfSy0s/Rvg2YURHDa5RVO9T20i52AxbOowBnPP
	 c4eATgW0WCtviy2MDIXJdQCtA96zO1Y6dXU9Tw5QpgZpODiG8dTYq/MN7Ql5YyvVlODSJ
	 gT6zk98di3PU0DJy7IHw+2Vt5MYglL2enfHTOFzPe5GAyHpOEq9ZXBzawN2gwpKjmiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O7MNmmannnTHpNepj6tElIKAllzu+hiojkNaJAVo5So=;
	b=jWQUtMswo+xf7fRRv3d9K5JBhyuoxngMvrScIsebtAqAf4uVfc6McUhGMRDyTrVDerCu
	 TNDEx7oU0/lXlEKiPzVqoGdBBfGaSGue6vx/HIf6o82tX1oklzpo6vvAvgG6kMoBjoXZr
	 OSs6Z1EOckD+1QM9Pu0o90rOU2DAF7J9GCmyGGGgPU1ZxQkRjFD7aARRuMqT2cAhIfBtA
	 A4BxvEZW5gaOf77ozIPlgViIyd4DmSSDg0hrMJeZ82BnfEb0sBMLEPnLEP4y8bPG4DyKQ
	 8mh4sg6euynC7PWMz1cfDL/aESjpra3w0G+ob+kiZRalQd7Qwh59ZKMqkcwYePPrcIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r4wRlYH1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB5C606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB5C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r4wRlYH1
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3550dd02c9cso189303eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792680352; cv=none;
        d=google.com; s=arc-20260327;
        b=su/bSJZu4eQUYrGJepPB7ZucsEyJsfJR1eDqdF9aUys4DFsHtDn1sWrVrv18QCt4Xm
         AP1kA90mW5bNTcCHifwKtGUR5bvEyiStLjma6tA7ssrhAu91zQBuHvx1Ospy2/QTFhcX
         W7dsU0qLQbh0ENYCjOpOpbIZ5847p6vzgievgkh2lr9SckKSY1Z49vYZQ4MjtizA2qie
         xXp5w0kxtG6G/sZkujFNTMymOXr9PjkjCvOXaV2isBSccwy8TD0bW2sR8I4D4WRsNs/T
         7oWm+89IPF75OaHyhVH9N3HnwsQZh2aU/osblpLf3AmpdS2Rvep3oRIl6JCNa9kH5Ew7
         M14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7MNmmannnTHpNepj6tElIKAllzu+hiojkNaJAVo5So=;
        fh=9Z/Zq9fHQeHTdKlg9mMQd+WgFBhRI4TGDi0lH3KE5BY=;
        b=V66CqXFNU0nevmspBT/StUawftmo3Uif7UblRo/AQhAm0l8b2TZX5a5ZQfv45+7mD0
         ejia4TAq7Sly701LdM1p8SI/RFK+wCuO+fGu4HG7USQEjuHemN5PdO9AXGkMNr9+1Lsp
         5i0Oi12LuEWX6lbocIDzMHeiEJeLsVDQ0VSqlxDc8JUvQy+xgY9l+dFmhii/9PSEhj8o
         4HVcIlTxhafa+rDEBlyYqEQWIe/Ewu+Y6G7Ykaq93fGjnOe1qWrBUBYC/ZeVGuTKdxjS
         m34O88+FYzAK/deqWSUxQd/VUPR/zX4hmez2N19BxBqntftoS76bFRpjmd3pqzkBiCYg
         dioA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680352; x=1793285152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O7MNmmannnTHpNepj6tElIKAllzu+hiojkNaJAVo5So=;
        b=r4wRlYH1jON8AvwU167ICle32qfyo0r3cKuuVZAlkfyydgEodCKRlWUfTUCOfyRtrv
         mdL9z6oLfA6vJrwiG64+WoBtXs6CNQwnA5Yryd8yI6gn5zTkFJS8CFrN7J078tokjdKQ
         Mr9D8zGWT5vCh6SqfTVbYeeEWH+PAjcCO2chgojmIr06oIgzklRYmhGwnVR5vAl889MO
         6YC9CS0uo9j2AhI70vjk+y0CfgHC3ITI5cJeQT9JE2XL3OeLcrmCENsxsgK0XB6N1r9t
         OijP9/5FnKvqj5cXEUiymJos1KU/Aoig+vy6hJHswIJAyR9ar0R68i5kapWHddIRyAtu
         qx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680352; x=1793285152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7MNmmannnTHpNepj6tElIKAllzu+hiojkNaJAVo5So=;
        b=0WhVLRcaAMbEH0kI105UYe6CD/XVA6hbVr+gTFV0i91PL/3kUgaRAJ2bUvzw6/PH3R
         i8eF09kjY1gJqv/Cj+3xFtOAygqg3pHLklc+dQvLUP9YHEjpEAt2Mx7di+FhMqv83hgX
         sU919e2Jsj/Bm4rYYl23MLIS+e7U6NqrhcfG4ksSbcG6yIm9jmaI8fMcFGo7Wc55LIb5
         rZ6BeSYxUrWsnB0NgoLXKHj1He7dyDlHlhvgnPizlj+eaffWoYhfOhVDJHmr52MsPNCb
         8gMXY+XNJXZaoXwu83lbDSky8kVBREt4sEGg11PoSW+bXAWflOQCP6ftrLz7xQ+eUv0a
         t1Vw==
X-Forwarded-Encrypted: i=1; AKwUvBw5FN6LAK+u3PdZht6b4wgTUgH13uwWHRAWPDdMSwl7O/jdnRVmea5aKRHJo7gnXxJYSiaTXLeP63aSeq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJj1fqItSm0y1occuo2i+Y3T6clvYs7E8i+FCw2rhR6y523AAtP
	4wRwKQ5zRPiBcxHIQIO65BMPZ2I372e7eMEiV29yl6X1wZuLtwnQ+t9gi5WnEECdp0bfKpCrRKt
	nm25SOnudzDgm5Lja/KSBPQ9Y6VxPCRg=
X-Gm-Gg: AYBFou1JCo8ryoXZsFqgIBb3V9Yf1U42uqp3zPdDaaEUZoxAgDxCsE8+gX/BJ0hNeyj
	Kfv0DTBWucApz5RiSLdnD/1sJzkokjlt0g8R1z7myHo9Nd4VVslZgeEBwAHf01lS0aWgjF6ISsn
	RoB8ZxaI82roHtsorHLGTMFdBFXtlOOIfJExhsW/J3qpmYbXzQ1JxFFXP6g6ws2spUPIEmHAYO4
	+cFyBPMeWBn7ElpcyD4G85A96w009LSDLHiCbX7o8nUgeks6SWdRtx8YGsIOj8rEx4GJpTMGQ2I
	t2+/2mCOOj31rI8ME/0mESO6efQONRyY6/NYmUVRV9INb+tdyWGvlEAEIo2OiYECEtf1TQCQcW/
	uiuxCKkG9Uix6Q2tC1H5sxOQgsp0a1mekqmJA9QNuWY/BG/bts3k2K8i0y0zG9whLJyVjcBxAmT
	c/30hH4821CKCg9/Dh3gidzQTGmdjONeI8QQth44wqlGJAF6z+U3ISOuTOQxgwF25CMpiAwB2oL
	ZXdUiXQe2HR8Vqa3aYbD/0uMsg/gaPeKFai
X-Received: by 2002:a05:693c:811a:b0:368:8792:720 with SMTP id
 5a478bee46e88-36887a14b77mr6320743eec.1.1792680352107; Thu, 22 Oct 2026
 07:45:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
In-Reply-To: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Oct 2026 16:45:38 +0200
X-Gm-Features: AclHuK8EKOtLgMJPZNE8Rsgx4kNwJ7cv5GEy9zBG17C1iZxOPqBR29S9pWwIt5Y
Message-ID: <CANiq72mEp=Vyj9-TcG6_X5_q+8guGQvJFbgmEwQdORn53-V=JA@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: Fix CFI type mismatches
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:34=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> This series fixes a few CONFIG_CFI indirect call type mismatches that
> I've run into while working on Tyr. If we're going to run into a lot
> of these in future, perhaps we need a better solution than addressing
> them one at a time?

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
