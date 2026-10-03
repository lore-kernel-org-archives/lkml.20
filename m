Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7552841B8E6
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023094; cv=pass; b=h+5I9vuxmimYl1XRs2mtfSsWKIHUllWs+UbPlVTIrRbHb4QZWY+2rOnwsKL+Wu90HOlutf8Ujvm/n0/dSrEEGWCTROiKAm+bnjdUkUSN7J2cz9tGA/RWblSKgtcNTfN9t8FQrrOohA57v/7KFYCad0ZWUbx/C9Ig8Chg4x7Wvw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023094; c=relaxed/simple;
	bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Benu3bXrdkelFqfBNvuTJTFbxJnco9hVAGB6+tH1e75pzHGSYiKGDA5BDwDxP/5uBqfNwP2M3Fa8HUKkNHKdxaXLahaHppaTWtRO9x8CHryYMzgtj34CmtkRpGilQ5thtjKal+wUR2LtGixy+JeRz0wbZy+Y/efQX08HUup06SE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mE86Z1l1; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mE86Z1l1"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3510f8aef9eso29649eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791023089; cv=none;
        d=google.com; s=arc-20260327;
        b=MAqXNHYpf3oGmx0fBQa7pJo0aaMKUs4wyX5LlWCglim0Edh2F/1L/eA1bffFF8U0wT
         V1254/P59pjegZUKOZmrR0jZN201Uw59OTYWGO4aJmdV4pHO0hD41/LVUvDV2o1rxmvL
         bgu5lQL5GwyExRS9/vO5PvdMXdF6kYW3tqNcQP+bkx3IYNTh15XZiymNpKwMdKyjjFH5
         0jVrmAyxpDED1jrtJjgh0yXo4HRet8rkmZaJTtLekFjSpT6NV9fcTIxpET148eMz8SoT
         tPhrPThpq3nufMrtysGhMQS0SeBkscjryjna4HtZrvKwIW+8/sv1HhJgR5sqpjljqd12
         umVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
        fh=p2Rg4BkY0Dj8opQ4k0ytuOmhFI96YmEYZElAP/H2a4w=;
        b=maryW6TeSYX86E860S8n93gXljNDs7brstztkCei72wOjmYidfc1oQOuYKBZcI6roa
         DmdfWP3Gqd9blo079BA8mE1Phsxbk6d8u0kRmD97wX6YFcE2MudaBX783NG62XCN4XDt
         oNWKoT8jsj382BzN7jgpsTu6jWf0kzMwJtfdiHaSDz+uTGxQev7VdW+KfOuQAoujBT8R
         NVGZw2SzIHDzHuhJINXXKNrzVqZkOkVZhf0bcmoDHz7c3dGo7k4NGlh4ujzrDqxKhzLA
         Kf2wIMLH4iq/3oUo5dOjQxZqp6CV57ab82snx5sqwAZE9nXMxq9J59+VW/40o/IaLjKf
         eI0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791023089; x=1791627889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
        b=mE86Z1l1vdqQUIiYkieSEOBn9IBYP94La4QemnvpX3dnYKhpExdwYWce98bJS0Sy5l
         VVaxeAMtF4F65CqLlrjdrA3xPnedrITkfbsR1qSChG1vmRwhhAn0WJPKOPI6Sg5LIGs/
         DOwGLDB4x3igy7c9jLiyROyZL1kHC5oVQ5ZK1YdJaoFzwOjl16EGmPU6hCTLfGcNzL+S
         izjHeNgmCki7qRVMCj7lOntvx/OKpldpmvxHb6UOLbEFHmeNOVK7RLNt3WxKr+0r564p
         hP3Ll64Tmuu0w8MWdTl45zaOmwc1WkksQGlu45Nm7DWvu0fLZ0xnXhIhB0Gg74AfW18V
         ldMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023089; x=1791627889;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
        b=J70FLCb7yBik2lIogWpA1I577gkZpZ6RaJOQmpvhr6FrIJVxXIgSsNOxpvV31j+ge/
         dA5TccRCdGhHL8No+ZiJMZIyZ2JVvGjcMDj0eWCfIc1gdA8Rnyq3vV2jAHVUEzYmk2+A
         HQQlZPNt0Dp//uLROVX1DKO40W46MCNt/lzT+yRciBSrDlt5rFuZhYxy7ow1bdZGN9oH
         QuMnfweDpmwBWa9upwMLXum5H/YcZgx5Pw7rXKvMw2xz3iNAnJLQDaT4cbWCq2h7viHo
         MMEpGN/3kAjtvO/Ay6Qtmd78LAGViljQIzGuM5g7UK93DkYHkNerX1Tkx39L/NRsMpW4
         V8Cg==
X-Forwarded-Encrypted: i=1; AKwUvBxKtLUg3mnjiccnAlqi18G+pJUmm8bAMFhmSr44ibtXaAs4f8f/M50/ZRDyvp7vq2Taov7UkfTcCF4+8MM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIciozZQfSTp8igtQjP8fyGihEyol6OBO7Czj9ewBaUX0/ldctJ
	ojAYTeNb0lAwIBdp09HqqR0KQ+jdJMz/GUc0gwMOEQoqeGtU9PHWrfqg2GZOW1ADaaUULDVIbDb
	v0NWamAJtM6CK8FZL//JKdhhATFC9qD8=
X-Gm-Gg: AYBFou1+27xiP8flmobAKtyOoaIlll6LGaZHzStYGVFx5bDNixB8PhGg5eCQ5HWwRly
	knj2Ttiff35iQPSOse951sbvVAGD4g6VWFD7YSzmNrDVQHZDVq0SWJwseKg4Y2glVAyhihlYcOJ
	KqYZNsPl9kZqJTQPZ7gcyQuyNUTL0U/kYsLM6seZXukJ0Ha5IZYDEnU7t/wChSlxg71CS0mG9hn
	U52dZhjQIi4Wt8kAdYehCr5rmqpxo1Aq7uduMkeDZghLN7tTzsCr7Jb58HrZcJGaGHGBdj4JnpR
	2IyJZewf1MhtimnD+nGRnagoCOxcxoOylyind8oOclssE1EaQO234Z0LjTGrZs3ujX0SJuO/Dcn
	tYG+nMZVXOLZEiD4aVhP+SHivOR1J+aT0dt2HDBAPX+AbQL35LO2hHxUNDZPDAXjtUIshh/efjR
	MHAxXJhZzlzB6QrJhsXBzXSO2u5n6CeVLtbMUK/v3QwdXgzvLlYVWfBn7rYmLKcA==
X-Received: by 2002:a05:7300:54c3:b0:34b:47b2:677e with SMTP id
 5a478bee46e88-34f14ff2bb8mr10351658eec.1.1791023089391; Sat, 03 Oct 2026
 03:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003093827.77857-1-kmehltretter@gmail.com> <20261003093827.77857-3-kmehltretter@gmail.com>
In-Reply-To: <20261003093827.77857-3-kmehltretter@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 3 Oct 2026 12:24:35 +0200
X-Gm-Features: AclHuK-MLIrX0vJiZQYXgDSKkkdNcg8lXBGZYj63LJj9lWkFu6OJmgqYprkqXmo
Message-ID: <CANiq72kGay03jqFOfFcJOjr9Poy+yc2u0=Ep_9LQ+KMy=1JtRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 11:38=E2=80=AFAM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> Tested on v7.3-rc1 with clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2

Great to see more arch support! Just to confirm, are there any
toolchain requirements to be aware of?

If yes, then we should add them to Kconfig, `scripts/min-tool-version.sh` e=
tc.

If not, then please test with the minimum versions too! :)

Thanks!

Cheers,
Miguel
