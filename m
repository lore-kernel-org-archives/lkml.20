Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF4D4E73B2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895995; cv=pass; b=PXQ5xrvyePWswYjLYlWoH0vaQfB7tt5+jbD21we+e9fKd4XYy76x9dyEluJBhFBMtT/zA7Qk7xhGpi73SP5POtGl9cgpu4oS7HNkwQGYqcmBA3mwhqpCX/gl0CJ/cwNE69YGLzxsi6NMx96gsmyCEzImcibR6bd92KnmGUMjbYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895995; c=relaxed/simple;
	bh=UuiRmBadCxfqcfSzZSqby4/2UPwr5QA6sDq3PGs+kpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZF2Jqb3B4EGkvlRlIntsyXyGuoK2MdAhFf9KnQDvrHJMbSkkwtOlQknRSLQ0OroZ/sjTU+VY4zk+mAUvVPzld/u0mfGVMtKTlF+JaYsDcLSIxwJwFpJM7iYF5y6jyyz1RkabTeggNinUi8AVQ+msemKv6XzhyZfGiC4pQBwb/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2Y7Inva; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2Y7Inva"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535aa147d8so211220eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791895993; cv=none;
        d=google.com; s=arc-20260327;
        b=lZtoebXp+2Mah4vfFPJEnYAIL+RfPMib2swept8L0F7pGgIGpBo2CxdK+ty4PecQad
         T7lIbKoPS4bINSe51Yia4y4C9fWPRnNgNkOY/WZIIRAyBtUKqhd3nwtPRcqLdsLo0Hcm
         DokZ4ZJJhg6zpjd6xaROiW3x7ayF6VjOpe4CrnGyE1r/EuFOlPTQel4GWGiy+Cej6/1Y
         dcE3Lr3yCKQb68n0UGjkUEbHkPJDBZ0+uplBV6ZaCyqnl2xFVUpzTDFPc9xZ2Y802KwY
         wJG5JsppVck8wiUyvuXpJ1CkcwwbI0WHXL/trJsHSxOpwRYXzApGv1BkJOr7EqA5E8cU
         bohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hFhU2bYt0krteVUmUhOtq11sG/zJcX159F1mHbOkYZE=;
        fh=f7TF6gELu6IApkONIGdEaQwUknmdIT5LiRZonlDR0a0=;
        b=pl3JpL0Xy0bnPBNwmu4S0l0B51rH+/v3aWPukAdlzZXgQcZn/O3zYaMKFemUOvuiwC
         5CJ9R7V92yZNJ0NMcyEZgZTbyKld4YQ9JK45Mqz6r6nigU5Aq+wMm2sn+087CD2akiFS
         deQqC0o4cUeoCZcDrXH5qbfLC+gvdHI1NXQjR0nFzdvsVMmQ9dg4gt/jpSqAkZE275fU
         UpJoj4IsdKDfP7HzcsycgRHp5OEiXlxGu9FEC1thmcwTYhmEQYlY5Ma/PjCNELkEIySQ
         l2AyH08DV6gqvK7hgMAuXAO0IdlK7XAqkcbg2lN6UTcQc9kamnbkRwM8QHwBzuB7bj5w
         f34g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895993; x=1792500793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFhU2bYt0krteVUmUhOtq11sG/zJcX159F1mHbOkYZE=;
        b=s2Y7Inva6fQGfLVIQZMLYFwDJSoX+mPdVI4FfdG0eb2ia54fUNsny+X2nyB6Qxzei8
         3iHPlJWq40/CURiwkEuyC7GRC+zhUqnhryntMeaJc19s7L/EFfRQNMFuOH/DfTPMYt1o
         QUwUd5VwKJQn6iekspQOHJ+kOeee8XwJ2DzDx4SlKNxz7kcxOlYO8Uim16bvHbBrjCNH
         gGqNhGGHUWUqE6SywQvCkjeL8IEjLvuKBsJ7BBF4Zo/wf4Ytuest/3vqaOMSlpheupTA
         Fu6QTdXlYl2TV+Lh5bwrZ7MhAYP6Sv/KPPdiljo8RHm4YWoE2D2WDPmPeKIVaXjPU/xV
         r+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895993; x=1792500793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFhU2bYt0krteVUmUhOtq11sG/zJcX159F1mHbOkYZE=;
        b=YYMX1hUVEnuka4z5ZS22QFoc7vz6twUUjKSVBwKE8Emo0030xCh85bnozg/if9ZqVl
         u29gcJdr5EIdpoIrixTrLq/LdRzkBgIs4ih3501QRIlIwkLNpIeVdMIiG9Ya/mGjz3Rz
         QD65Z3AE08mrIE/eKrJJ9N4enVSZhUooxjdvwUXmjWrW4dDeNbYZwDk6FdNfhwUO9ShL
         qqb6kIzbbzFEDUevwXPiAxLLBX8/QAwt9P8dBl1nOMPozsGvqza5GiutD0Fh0w+EkGtV
         iC+Uh294zeoCffoWBfQsM5VDzV5R0NJAOBampCvQNNrKb2yjyFOWATwDbFcrjH48YQor
         uXSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTopbT18BRmxga0vTro3sj/i8Vfwav+xFwGWIbWZviZrupWltfz5DaKQdLJLPl5dz31U/8olZgKcW00Ek=@vger.kernel.org
X-Gm-Message-State: AFq9FYKa5cZeWeVc0ZLi/XM2aHhqeRvQILcagJByIcKaVdUEAogHK8GP
	XHl8J+FtcQOKfd5XjW2VW+N38EMrPDd0lIUDEqALk6Jr0exWvd/15Pg8Vt7IvBczXAA7lGQq1eV
	u5aQHgo+1aDwJcrlartBuKwN5LYvKFtwgkFHOcrI=
X-Gm-Gg: AYBFou2kjsgmGfkuayBOlpDwBCzq0mFfiUrcYTuJC8w4dkgWHpmKJGnN/rKnBFJN0hJ
	ER1Dj2cQq638tl13daKM6qCPj5xHhTs5HI6gF+OzowbACdMjkQZlodifgaSBZVBgDvB/rU9Jal2
	xLfmD1nt5nxBULHvfyiPo53j3tUKeKMDUQpPwQU61j5tex0zZ+foKJvDu+1d0uWlRte3++cMbRf
	+lAvUS1kBLhU7StFejF7MDelJEkPoGeXQKIS/6vleFfU3lwbasFBtiqH546fmeQ3mS+uocHbm/S
	L7gm8J8suKsFjuSp/NJWJnHsrj/J0NwGEsaCpg4uDVxy2dEc+0dkXd32AngvhuCKu6xqye9W3rB
	nd4juN1CSPrYkWVH4CQq1jEYCt84h1X5oan4o4NeitV5zOxcpGWrk6uvpzmJGSjSI+FJiOlO07B
	TQSjOnbKc2WTvrkkdKQ+uU22KU8vw9QjCvCWySBs9bPYJw+Zpwtog=
X-Received: by 2002:a05:7301:4d0b:b0:33e:6714:3945 with SMTP id
 5a478bee46e88-3537e0129e3mr26810675eec.2.1791895992551; Tue, 13 Oct 2026
 05:53:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
In-Reply-To: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 14:53:00 +0200
X-Gm-Features: AclHuK-P5U2ev9hpzeyozzfAgREhL2ZTBvoLRgkZb9RpskE9yERenkCCWIyQj54
Message-ID: <CANiq72mA6pTmPJUk8g7y3Z=wetFMXdzHLiPEPChpY4OTg3OHiw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Add Greybus Sotfsvc and UART Node drivers
To: Ayush Singh <ayush@beagleboard.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Markus Probst <markus.probst@posteo.de>, greybus-dev@lists.linaro.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 2:01=E2=80=AFPM Ayush Singh <ayush@beagleboard.org>=
 wrote:
>
> - I am not sure if Rust abstractions should have a seperate entry in
>   MAINTAINERS with me as the maintainer, or if they should just be added
>   to the respective subsystem entries.

This is up to the subsystem maintainers where the respective
abstractions may belong to. Some subsystems prefer to get a
co-maintainers for the entire subsystem (e.g. because they want help
with maintenance; see "M:" entries with "(RUST)"), others prefer to
have a sub-entry (sub-subsystem) where you would maintain the Rust
side (see e.g. entries' titles with "[RUST]"), others prefer to own
the Rust code, etc.

Then another question is how the patches should flow: some maintainers
may prefer to get a PR from you, others may prefer to take the patches
directly after you review them, etc.

I have some notes at:

  https://rust-for-linux.com/rust-kernel-policy#how-is-rust-introduced-in-a=
-subsystem

I hope that helps!

Cheers,
Miguel
