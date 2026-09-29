Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0404EFFBA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698972; cv=pass; b=B4LgXAZZ7E2NC9gNbKCrNI73ZpPlE2lC0rBEmUudXSXfJVpzM4wquH27FRJz0vyfa1ctRvbqd+DDOX8H4qhqxn++GORFsf4WLCrZEFxzXN2qM3o1cNBdcJG32zi20GDkX/vZpDSwFUIam9K2Lik6dSvIkkJSVlIxwLpVEv/x/A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698972; c=relaxed/simple;
	bh=EUIv/v9If5sMrJ7ZxRvlVjCML+V2/1G7/EZAFvUebhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZoxrlD+MVypIBM85ZNhWxPb25Um/ghs9oya2PVdhJYjNxTLVjFaDkAQnCr3D9DvNhLtuCaS/1cYRgCwuDLGoubbkFJQgJojFKd+hsa4mEmBqJCOtUVr3wiZLSbBmK2O8XmvbYdjc/QF59vmRIXNVKoFFSb67ldex7LeDiU/aqo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqnmLP0O; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqnmLP0O"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b482f7b79so98019eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790698971; cv=none;
        d=google.com; s=arc-20260327;
        b=eTvse5Kh1LdBGeL/kqLwZFWlY88R+sxLCX7HMdTJnEertNxmENMM5fOYpAnVrkqez2
         naJO3kqlc504ahKcEzLL4ZYCJUCvYcgtns/uVZsnjFUt/zz2PnIxrvwsKJDcq7W1VsxP
         WskGswGdiXngMGnG4Od57NI+zv3+bNRbNaNPEfpNLxecUhhhW33zUGu03IaeJyAsFhvK
         nqDx8p1wiCOh2l1uHZ12+15QaB46xr0aPB2tIuYV71aRjPJmeYPNw0NRX0WFh2qgtP2a
         rufyS08S4VCzM9TuJGXxY6JTYv1WYfopAfgBU5wMOJ4gC6Uxm1slhVNFzfI4Q/E2CspZ
         U7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aeqA9IgsbpJKecOhElEeP5QFRXfeP7pkj4jRPnaVoXE=;
        fh=94apbjcpxiI3H2BXDTluIxQr4x1GEjH3N/F0MHAxNis=;
        b=VMp3a9DGTX6jmF/BByGRWMAqyEXkCHDUamcoeUdPQK48m5X3VS/TnFrWc1z2MIFzKw
         81xFNNZRrbl9s/Mt/3+3grlj9aLG6NcSS7G7ast5HTgM23nIGBS6jXZvt0L8lrHBjMEG
         CnTOi83/yesLU5kkdp7QtmkI9ftBoxQ6YAEUoHYYWXEp3nikzV9eesr6JqNEBzcext4E
         i4A1rfQT72PsDrsh6xkIXqhkfysJ44KYRqZ04b6oce7F6nQeWtiqgGpCr/AcW6mWPbJi
         XLMiRQXt9F8Unm3EnQo8ktd6cwdMXikUKQK/hNaledjx4ZZCkyT3RqKfyaLeQQSDTOvp
         G6ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790698971; x=1791303771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aeqA9IgsbpJKecOhElEeP5QFRXfeP7pkj4jRPnaVoXE=;
        b=YqnmLP0Oyf2iEMQAuB1FYESTQLGud9gQFsFRwPdTeKxbl28hgZ3pUkAMYsu5xb/Vxd
         cNb37XkHl6kqZ7sr/ey6sZ8mEGQfJaIuawhIsmtoBJNyy58eqGSUdSklX5rxeBb26vlO
         GZi1cbNv9TIqCd4fDYSeYGzV2J1vEau332vskxFI+ypkOebLghTwNIUr/8y9+8viPLQW
         5uUESiEvHPmjpaX9Ixj9w8VsGMG1yPnzIuFSD0+eyIDQ3/q9kwAE55QR04PHg33c89Rt
         xHJkvR6mNL/tqw4AwaxV9ULtKKcB4MVHmL5y3pnVFBZ9L7qroDDGhXLBRQ++1b8QSRst
         zP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698971; x=1791303771;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeqA9IgsbpJKecOhElEeP5QFRXfeP7pkj4jRPnaVoXE=;
        b=RX/kz7jC4pCLI98sN+kzFEujvRFiqtk5Gni6nKCyyuJeYbWW3GHhJF6NUt56gI+7dH
         DQRrvccCltMnsMvZ0xrjWNU9b9V7ux6K4somazzsedk+zAy+M/Q1mw55SqrO9f4O3gsM
         lpfkZGP7iv81QOerEtcqo0F4AciqPX9RbwphqNPf70OC4jdzJz/pvWl4bB3J9aU2+Ip9
         vutjXvFGNw0Mgv0Zt7NEsUBowF6BLxDGvdwbR16f60wxsJwKSVC0sIeAV1UJDN+Sp/I5
         Zm1+nYUI4suOPsFizljD3IKCeG+/SiSrOqtVs9fDkAWT7wLQegER2584e3atd6/pAf+B
         1rng==
X-Forwarded-Encrypted: i=1; AKwUvBxME+pYrTA3lJhcY9v5pguAQ5Hofa7Ofv7Yj5c68w/QT+NzRAi0fT4YxgscHimb3IREVodNqLvmQj1ddCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAPNrDcl1+psx4jsx/D8a+Fw60mFszY1CC4z9fJLuOWMuFgV4M
	KOTQAtNcN4KjVwoI6gB/uZiKuj/4R+0VpTEgz7XYHs98Aosolphx9MmvcirBfMpoRv2669BqJnN
	oY/IevVhlelODP23YLcaI/ZWvBquWta8=
X-Gm-Gg: AYBFou2MEupSquTXeeGBcDsr3srRmAM0Yu6ZUyX9gNTZkjk27jGq4C/leXjQNLJUFcq
	gknKcvNsIkXcNyY7ruQAGol4HoPERC7DkcT3HXlO3By/5THMFOIre2laG1/5cym9EvuhTKk1bvN
	uwB/J/al3MFVWK1jTLHH+dZROvCd8TXurus9DR3YXTgad+jbgXOI+pLHiWu5vP5jw2iYFMPQpJr
	X0FbwuAxtrT/RJedKBrMrDUHuorQ8rKWxX7tcp74D9u4SotgwwJyTRgqEkI4hKvufWFpkZ93/Mk
	teLmTb/9+z9o3YVa4GjEEXeiczVdPcIIeYhcIw1YMB58o6a9ZK9h27pO8Yc939KYznfvYTeaqoH
	tbmVmCWc0DwxxkWcK4Wvu3EShmsF59siEPO0o/wiuo6sZ/NbDZjuG/U6zA1MC0tjzODlBY67L4h
	p7M732oTFeQ0kOcqsI4ZLvAGJmhOoZ3oCB+yRC9aYO62kgeoK11eY=
X-Received: by 2002:a05:693c:4092:b0:34b:7c9c:9a69 with SMTP id
 5a478bee46e88-34b7c9c9c19mr3727503eec.0.1790698970688; Tue, 29 Sep 2026
 09:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790599486.git.nico.antinori.7@gmail.com> <DLRXDBH5LB8G.24QDEEJWMGJG7@gmail.com>
In-Reply-To: <DLRXDBH5LB8G.24QDEEJWMGJG7@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 18:22:37 +0200
X-Gm-Features: AclHuK_Wo_2TR6t3qQINXg6vuhw5smx_hDmbOB227r8MxbF1Jg4nL8yAzsAQFa0
Message-ID: <CANiq72mzKkiDM7iBuDfO2u26roEaGGfYXQx4W0+33JHwE2p+jg@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 6:02=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> For some reason, GMail is not letting me send the first patch of the
> series as it marks it as spam. I'll check what happens and send a PATCH
> RESEND of the series or reply this series with thah patch (I already
> tried that and failed).
>
> Apologies for the inconvenience.

I would suggest trying the `b4` web submission endpoint in that case:

  https://b4.docs.kernel.org/en/latest/contributor/send.html

I hope that helps.

Cheers,
Miguel
