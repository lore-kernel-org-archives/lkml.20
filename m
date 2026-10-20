Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792523381;
	b=5PCntKgdwZprhOUWTHkAp77Wd6ib+EtSjM9S8mIrXkSZ81FlZJpku32tWpjF1c9CvigT
	 PJ3NDfZbFGJF2qWDJuoxW/YLuJriFUa7UQN7/w0tyACjxrvuifFRWcf6qay/RjOxjw/Jp
	 HPL02iJvCubnJh0bsyyS49kS/nkkTRBOxv7+NaGs6r1+reZmMnN/4a7xcBbLftGjT3d0M
	 ++UPKhWnc5SRwvCXcz13boi4f9Q5BfDE+xv9+7CR/GASEo6ttbxDYxoSAoqAi+L3QGESw
	 cFZ9TE5d526GFLLaKUGryPUAwNdhZ4kAZi7Mn/ztBFNWRNr3eqpFX6MVGia5mh+8+yQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
	b=oXq5RoEecaW/zhElC2XFOeiHYg7frZR0+oSw8inlDSm4tx2RKjLZruKfFgRsNvYo3ohN
	 +tPuyrJNxFev4bjWIBMDrYzHmikv4easRpTy9wfhD+86JRtxq/6vzwv+84tI51oDuXRck
	 LidJBuA3B4raDtDyqhL+ApMa3VKqWKOQDk4wffRfUrEzdll8ruz2HZimZ26evaw23jMDM
	 /5tZ5wNr5hfg8FNB1WbxtrVDFaOMJ/o9qOY3+B7Y8tgyu3RX1CSJL02AEFo4mTicUN9BS
	 n10AiRiczWEYlLk3zeuZ/hV633rsI8bzN8W0fvQBmz2tTOjUlGoBJSr1IybfNvF141w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IygMgcs6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDF2606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACDF2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IygMgcs6
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35ca5244753so425671eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792523380; cv=none;
        d=google.com; s=arc-20260327;
        b=dsrh1Bg6MRRfKyceqmmwXgpJOdv9ArxVOlw9obXsm2GorRMWBHhX5yZBxyxwDQ3xOB
         9cQ+Z1+urXAvM/SoJ5tUobYhxOUKVR6uQl4Z4Sp1mQ2wo8w3fozx+3p5jNh9pGvZ61ML
         DEt3Dm3PB7QpxKGvGWDKuDrslR5dVw5yeXzQPXzVuefMATUiQQSmtNzOV1bzsELrtoAp
         wd4NF1DSCZEtJK7bzZo16MSIE64zCwbwDWesdc+5qZdIxc8muEz3a4NlZuFQBarTFIan
         LXAOIlR2sWotqWMQ1iEjQc+Y2EyhbkyX/4X5NjzG3v6SHV0DDrQ5TYnklKcl087NmIPe
         SO4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        fh=a3zPagHxiuEq+nRKFprcvkg4xFTigTWmN/vZOIPlNXk=;
        b=Oc0J4dm3TE9KyWHvwI72qMDMwMFXteZZ1C2cDPM7BJpENbtEuCe7ejHKYR6KmXi1Ya
         CtD2DTC7HwHGBQC6V5CdFhEQ/XAQp8xExxj/QRUU86oGYtHWAFJLId+ap21hai3tY0zK
         XFErjbf+FRZks6wgdHst4w9lncM2Nl3V95Zs9xly/V2HMBtn6uyJzqb0mWpIw8z7S2/I
         Rfa+EsMkJ+H7qUGaocA5wYrcGp+F7LadopsOnynFs4uNkEgC40eVXYelW5VFlX7YdM88
         GS05zvimnQhtKxihqWpn0dfzkOFi42eiwrh0km3xixue2FWyNuBW7dTCBK50sL/9q7UT
         Cl+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523380; x=1793128180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        b=IygMgcs6Wkd11h28ba3ojzsoJTpJa94odgDpgzrul6leMm134UWAt/R1EWFLQ7KrD7
         cBSCFOQ7MVWcZDDh+NFWLTMz20zU5V4OtYha/Dt/ndOifBmQqWKbEPWCSAUmQUCztPrU
         lV/rb5aZyojz0KbkWV7UxioMmIVCAOfmPB183Z6/VcaAHY/R7bG+jTfqiIfMVDC+L9J7
         Ru+qT/CBDKbmkkQdRKoQq1VXCffrvFzcO+E4IgTEus+geEGk8m379SuKk4YQ5MAzXfhX
         dJhCDvgLPUuAjgpRnNwG6zwIfkaC4zt+/JtE4MTaMLMyHELdf2YxSGLFrPDVCiXvHLUX
         iOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523380; x=1793128180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        b=vnfUPNJ3OurwCDqT+3d4POLQz9pKS/3T5kC0p3tvver0wud8oYz0clH8x8oeJ3tdj5
         SrG75+bMlerke/2F5fPj8srwPCR5gSNtaT9TnuNYrjDKZguuE+1/oPZN1Hym1XbXvzDh
         FGVKoEbFRw8gCFIfyg4MCiNr88ptkrc0vkRpPy5Xq2x3VCIT291K5ansfa0944pJYu4H
         znUIHlZH/5zEbgX94/gZIgYvJ5Gx4JDNESmvvB9KzbgeL/aRcFvYT0+aV1kIbbbBoanY
         0rp56PxkaD1Cyj0PRa795M6mqTxLj7cMMyU6AeLo6KlNOS3pjfSAabbg3KrqAE9Yl5QU
         V1Kg==
X-Forwarded-Encrypted: i=1; AKwUvBxacQjaK6BYm7NNgQpNB53NoDSmQ3ftyS5rNOlXXBht6nWQ+ZSkS0t1F1wW5A2TZ7TbUuEIz+yv+qcu7io=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPutFd2o5/u3+FkjB8o9hT993oRoTDnASt56YneWtjB8qP3NLR
	mQdEAQOy3j0satdU6Ndw4DtmEag+rOEsuF11YRlKBVnyhq2Xto2M2JvbA7/u7uAv7lCzmbMeusQ
	u1rcufiUoKSK80SWd6ZL+JFWTWXpHHkY=
X-Gm-Gg: AYBFou2dODQ+AsYhWA5gxCay4nAiD9jBI1d9+sCVsSxQ1oIg3ki+L3gFy0V5Je5X3OA
	VP5ixNxOn+IWUjG337XoMkQ+cRDgsHp/jy9HUS6xjF/V+hlWaUUD2G8obf/8TP7By/v+AiW/iCc
	Xx7KgZ4EoVEay1t8eQ6vvRgdylVmNLSeV27j8eXb60ItZSMskdlTG4kOygq07J6qQ96bkr+prch
	Gwae/JD8v62uElnCF6My6auLMc0jzRH5JEWSBQ4LQKKDmaG1t9Xryxg9q65Ij/FHuLvqyhDJVc8
	7ymuWvbUoPRRReLhLISjIbdVYGLdTRW/Wc51bhHO2dzCeKROxLfkXztcMxczr3Eh5SRW0g7vJT/
	jQxhrCfGahvyKhXeogdIt2yvZYxDVWVyHipkiWUWL8YpZxySyHGWLHshgKfQX7XBweYx7zfpd/w
	a1MRijQPut1LUOX0liMWmzNiwO3FMyxZoWfg0v5PBovba5WTi6MGs=
X-Received: by 2002:a05:701b:4510:20b0:16b:4f52:a08 with SMTP id
 a92af1059eb24-18507ce1c04mr25464534c88.0.1792523379507; Tue, 20 Oct 2026
 12:09:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
 <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
 <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com> <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
In-Reply-To: <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 21:09:24 +0200
X-Gm-Features: AclHuK__St0uTCw1avvWmNXKKyd1psXINLsd-c9PUmbMZ1zOmfz4IJPwzKvtrCE
Message-ID: <CANiq72mcCErQoK6wmtOcAZ+SOgRNZO2fPoZ1dac1Now6txy=MQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 8:22=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> If you think there's a low risk of conflict, I'll take it.

Hard to predict everything... but conflicts are generally fine anyway.

Thanks!

Cheers,
Miguel
