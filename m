Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710E22F8E98
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781818; cv=pass; b=ZnZaeXKuex15jLDbjVo1Cfxm2bGHtUY9O6aOdOKa4Wfo94wshYQ5+bMhERsnS/TBhGTHwEqK/mWdyVZDWnZdc2IsS12/CR12VxXwo57poUyVRk26Sc/jTiernwLG6CrbUQ7FQXZeRtu/g3SvpaydQO9+357YYlwqtWWIvSqqOyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781818; c=relaxed/simple;
	bh=Jsd3T2hjnvl243+w6J1SRDGT60HX/0ppGEwueKKSe/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VfBH0j3p4E2slvveP/QKd61CLb9jH9opwAX3lvH9/+g8vPdv/IVanEcMvlqi3TIZseZD2Lr2vVZdzipyr/kdu8VL6jw4M2hqtbCxW5/N8KfhGXzX9Ff6XJe+VSclj0AE/3VjNdxqWiOBsQ+WiYB6uD9uNmJHwrZebCkuToAsB5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMQxCCKD; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMQxCCKD"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33c30fcf33fso194720eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791781816; cv=none;
        d=google.com; s=arc-20260327;
        b=SHfWNOCoGONwd7EVCmDVPmENvp3T+LnxAy5BsJexti4cQGFCoiekStCN+MSStq+T8t
         40hzz0CyF9CppfkDKUAvtph4FmCXulyPyXrGLzYQHStkr23DVGDIjfx9I5Q6I0sGRGSw
         gG1zGGJ+N2DXDogl+DGq/xj7rGiUcOc5o1uCusj1vzZa8Y0ar4xmAFvo46Lllcp/tow4
         IaH3YkBmt5lWfSlogpRZhZiHvxNlA8rblVkVTUS1SCUMVAT2492l/9SMw5IUJkBgpwSi
         vkqeErlLWCBZNXBa1nlgxF3WEDNz4j1Cz33kyGEvxSiO243ePEMiTJ5wHwlWc9YMTu+y
         7Lsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X8MIw/22Vrj04Q0rO0vVGzttNISASYLhkJUm2E7UKC0=;
        fh=811JCuCFBI3fAEjz6GIzW9xFHXIA1kedEMEZbKURpFI=;
        b=SXl6R+MJLTm+N9IuxU7KO/X69SmWyPlbShUKWMsweFMeZhRFJGeUYfjCV4+piDD7ll
         PWA5Cl1PuGYzstcbGZmChsps0/g0Xp0FzRet5w8+8tru065RdAtBw/o6WdUiLQBo1hND
         DKMCSSKhyQTV3KOuOhGmwTmJHxe7z89Qr0sr/IPwv+c9zluF0eTPoTjxjztcRiPUCT4w
         HTKq0R+C9bkjkeAp2tWjGOwDpUB99M0XZU+RYN7l/07y36Vn3iKM40Gp6USIKfsHKvLa
         mDP7x25/lXjW69G+5CBjqvlTY+5gx/IOsjLdNev5rYyp1cpPlddVyLkUbjJE02+KYuRd
         9n8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781816; x=1792386616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X8MIw/22Vrj04Q0rO0vVGzttNISASYLhkJUm2E7UKC0=;
        b=hMQxCCKDDGw+AnLPylMR7C+k/E6QpJrWxSycxdgcD9+MEko7f+CnkxAhHjgC2HFA2o
         tHf91GUaeihmMDixe90QrYrn0Z8dqBGWsusurRGnRMvrhIPVuCdZ9VfxtyPOCzh6bGCP
         QsVZ+HJiMXgPCTrScE46C5gw1vLUgTiLkyirix4ovVSDQTasvZ+tzwvM6+ZSMlYvL0lQ
         QLapyi0h+p8lNqdXWefV21qwPvHZOYV716/WjZNCFiV2sIayNu4ZgxvrKHtZ7FNQ6AGB
         85w8eCmfrmfSLaGLDtEA7B8V1wLv4LNEQB40GG0Z9xnTfsEiuIHA2jpkRhCbT764cfOY
         jq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781816; x=1792386616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8MIw/22Vrj04Q0rO0vVGzttNISASYLhkJUm2E7UKC0=;
        b=krMctrsD+kSMavXGVKG5X+IPKQaMlap9s+71LiGbh9hkSKDWI1oLPKViAbcf9EZYPk
         7AcQ+BI04Mvv2FplPKQMigowc7owyuBcAUbJaofZNBEvvfFGPHpXZzrdBJuZL589Hop/
         DY26p2W7YnMGGuNbJymcvX32DAmpDB8ddFGr6I8uVNn+xTzXnZqhlpYC6iPWqqDeebxq
         SUjgKG+O/Uw+25NePdMdlkN1NVGps/L7TCaxTuxI48ct8jyn+aimA8lBA0nXK1SBOc+f
         yYLk/5DLvLQiCWmiQlsFjwX/Cmzqz2Jm1gNdO7nbUtVMWpNrMFBr9JI/JIiFM00SXPSZ
         nEpw==
X-Forwarded-Encrypted: i=1; AKwUvBwrFlV/OGqt+IOLYb3G/MzvemGIlsqmgJrZGguIVikGXB335gFKhR/zgpEgM++Lszc8QDUFdjSbtJKLFr8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOUnAQwgZ3YwAbD7yCeQLCGsVgUTaxAPEaFWMVKP0whWQqxFfr
	hezMKs+v3nGW7SyJb5L3dMl5ku1kKcRl1QSF+oWzshDW7AXsrjT3m1c2XqBZbJW1C1r2N8ZVd91
	hryEMW9te0c1f3zwPqrn6Iwz99gkgdNU=
X-Gm-Gg: AYBFou3GmgcE8jqQROpbiaXj7Ad+Z9rfkqXfmUI6/T8xmk1+yoRRiZXMGH3kUz/Le6H
	43QIhddsWEESCGoLGrhZ/Wqi0Hvq8lfDJBJce2e3pp1o6cU+mqo60ZM/o/X4Llg6Awpy/2HwrbM
	onGgvnCFDzfBvfs1VslWzh44YDpGCx/YpQSJajD5QgiMPOTRcnFMm14khy8eTWhnKLGXnYDnZmO
	6DtKOUH5C3SAqpYzhNYIvQAC724tNF3EUqEBYjdyZenqxHzf+UgWyHoJPt9n9Ho/T7cfRNyW+pz
	qQDz3sdPFxBCfhTTKFoZz5eyLjDBpOLFIG/KGkdpGcUO1IX6o21MQbbfRshNSh6frIKXGnySKqP
	fa/KOdw2aLmOkOnSMuzHSUOgGSpOg6Nt+FRsMH5TWc/Cv+GIyvW8X5TqCqT8EMD7BbPuGjOkyZZ
	jtKuoyzbg80BTdV6i5vSOsmlB9V4ldT3SnpIQbbJVKFANDaHzf3zh6
X-Received: by 2002:a05:7300:f3c8:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3537dc8e9c0mr19543281eec.0.1791781816392; Sun, 11 Oct 2026
 22:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-pr-ratelimited-v6-0-f14accd4ea3b@google.com>
In-Reply-To: <20261007-pr-ratelimited-v6-0-f14accd4ea3b@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 07:10:03 +0200
X-Gm-Features: AclHuK-Bo9taeBjxP17FN4p4L1pLyEmLZ22aTNxXFsCT_jeXK5HxzXpnPIQBRGw
Message-ID: <CANiq72=+wYHy-DhWNAxek2jXmbmW7_wh2EH1SLT7yqJxygokkg@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Rate limited printing for Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 4:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> To avoid DoS on the kernel log, the Rust Binder driver is being switched
> to rate limited printing. But before we can do that, we must first
> implement rate limited printing for Rust. Thus, do that.
>
> However, it turns out that before we can implement rate limited
> printing, we must first implement the ability declare a raw_spinlock_t
> in a global variable. Thus, do that too.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-next` -- thanks everyone!

    [ Used the "kernel vertical" imports style. - Miguel ]

    [ Removed unused link reference definitions. On the `static`, allowed
      the `non_upper_case_globals` lint so that `kernel` users (and users
      providing their own name) do not warn. Reworded title for typo.
        - Miguel ]

Cheers,
Miguel
