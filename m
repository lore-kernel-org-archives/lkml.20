Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F7238236E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788688181; cv=pass; b=tVkl7cKrVyk+fd3r7mgglvjDNZewWOl277iDUmdm6P3eobJyg78neVIiiQYLK/sStQ/n+qfzQOudUdVx2MJyeXOuFgTuRyWkGkM18iit4nrc+wpg+bX+jIk4SJDX5mFO7mT1U0muXFp2+vAlWngG0YE5H/PiBsiZ03pcHr4L+tU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788688181; c=relaxed/simple;
	bh=uFo1S3usMCbLdEWy9LjKCdoBjHBFRVmushfAGQzmLtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUMD3PZc3Up6aZ27EC8zzwqcXgbIeM87nsStykjsFo28pYwsiM6ozUzq1slFACicJb08ikV2DMwKTNfvZIFpWxhcNO/MaRqEG5JMw+mcbd5pCpHpgQYw7PpXW2uQshS7Bz60U/PfeKGh71W2QFItxl+cWA17ceaxUFgpWIgnrA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7u/dEdE; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7u/dEdE"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso122432a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 02:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788688179; cv=none;
        d=google.com; s=arc-20260327;
        b=nPrWyirI1SX+9RAbRbz3Eg4QuP996WmlnUb7IXqPhhzAcQicmsFPkz5PphrYzx9hT8
         mWw3bPRImOJlm5hCeAxWcJnRyKtv1MM/+Ng7oZ9CJQQvxuu2vFxAAo0+K1vf/9Ocm/vx
         Z4Foqkm0bkuBLPXOx2GiE1hwvcnRyPF7M1n6FYCW6HEyvQHbh4j6K6fGw2Q7phsJXL2f
         Ur1O/88gSyEonFY2785fIM4fuJxGkLayq+lvtc+y6eRILAck856YN9B+W1dFKLp7XTgH
         IebFfxu4f/AMxh1gFbYU6d8PtK6mF32J844bKZKCtaU0pRszGOQvUk+7hDinhB3YyDRh
         rvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uFo1S3usMCbLdEWy9LjKCdoBjHBFRVmushfAGQzmLtQ=;
        fh=qzL61BLT9QpnRaZL1eqRK3Sl+E5gbtf80Ej0WGCJthc=;
        b=fSR/Tqsdma+saHXWzCaIBf+V1ACou245gl4jXaJGiUib03iQ006soAw7xuprlkoDXx
         JWHFnp+MP02cnj11Z5EJ1R332OgldvD3VqKV6NlQ/q2H7e2aJ/YLzMGpqHlB7MXJM+HU
         f++C9to44k1zzjqzQXwb+xgmmgO0dEtvKivtMkonTq4iPKxfrIA9BjmO47y0u6sarsZJ
         +yw8qgIrHI+cdey+S607C+sJ0r4u66QZGofr5m3TdIb3ImFdSG3L7T3anZ/iA87QyTIZ
         Od/AN/Kuk29/bxsoBVaCyzYsmL3oR0Ids9FTO4EshEXEBJp6KKSBl2c4Gry9etdCYeO/
         +Zcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788688179; x=1789292979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uFo1S3usMCbLdEWy9LjKCdoBjHBFRVmushfAGQzmLtQ=;
        b=p7u/dEdEUWtYxwBHACDb0DUPEiPf6Ws3Nae4hmhP/OwHgLd94oQKd4soQaRc3avfhz
         BHP0ilsivwepnwbrcFHwHVN6BxR7XJBqw79A/Fmlrf1k7gsk+dKiNuCrRqZnwSTRSUTX
         Z9u8aYpymZCACxrpSY/8QQZ31fUwiuSYiGLArjB1PwPcNDx2gFunNqnmkohnALi9RTgu
         +sGGZOru/AtNAjNc7VWrcLrqYNBUMrNMYTSXEFx24Q1vAl8r/zuEaF6hTVAHGpIKyjvE
         wGR4F2jL8fNx3ElMJ6KeKH4uNvVyZJF3FeC5Xb62Y/wNtECnwrKw/5yxpbyTdaBn2A6L
         Gpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788688179; x=1789292979;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFo1S3usMCbLdEWy9LjKCdoBjHBFRVmushfAGQzmLtQ=;
        b=lzxb7ltGXl2XVeex5eq9ZF0ZpXOivcrDMu8DzsMGjhqkZAplvb+53nNsa5ruPFzkgh
         q5Oh/g1QfDUcWVV0ECFvQozIW7d2pbXqtGfgS4ThAoxsvT89mFEM5T2y5MvZ1H/ZofdV
         z0kCOKQ7MT23xh5hYmy+b0ZuMjCy0kOBYWj2LI8rXn6ntnFmpeUqPYYQm2cLs+AfPoC5
         HnnoaDOqgTmgEjt8hiTqP2Fad9PWDl4LPtUdm5lWTXCIDq1yNVVdU1gtBiVSlW8VOICU
         3QPCQ2mvQiiQZCi7NkXqlsHRDcfSfZl4qxzHLptSS9jk8sn7YCHgVXEobSQWFtf/MRAV
         Uvuw==
X-Forwarded-Encrypted: i=1; AKwUvBxYE2tPaCVGVlJTzQQWTifYo8KLNXxWSrBqLX4RVeQ+oDBEhSU6i4fuNnytaFGq35ZQIn5OcF2U45Yxob4=@vger.kernel.org
X-Gm-Message-State: AFuF++lt8odzYv+42l6NBpsz5TKR6Mw6NpzUOQzLlH4NW7VjfW/0IBdr
	OZDrSJVzceSoBJeBO3QRa81PlaCwq4fLpEegfenvWTuSIj+i/BGLpUkWwEiEX+9cltUBiR5jdIe
	55Ee2VMFSXdOlrFWAjHd7lV2JLqxY0ak=
X-Gm-Gg: AYBFou1hK4V2+WeWIUj44gjGdQC9upaDZoh0QsQQRkaagPBuqL726rkI7dNu/EPRpJA
	u/HpznkWEtH0yNndtKBe6pzzNPyVxawsxKHrzrxYmPF5h+oIsuzyK2XSMV6YdGZGKQOZDKEoLrX
	ODwpoVsoh2cHDjqKuOm3rJz2jCeFActrHDJLZwdEXqOw+s9UPdHGyxw0IL/pphwhyA3t0aUn/jd
	Rskhsn9c+gwK1Ue2w4yTaF3gMXO2LyIk6k6BRo1u3AE0QXg5BKfZ6yyX6YW9t5ugi1Z0NJxI7kK
	YuVsm4jPdJCbqU0zeZVEB9wCQH9WPWTfLwf9aA6qMsJKb2DeVAlYeEKwEBMxX663fWtTbZxgxuT
	BxqErzWdZU0AiU0S+Bl7P3RI27zAafPkYMeAJp8CYYejeEm9gxH9Ns8Mh4NZ3ukL7B+2ZIa0=
X-Received: by 2002:a17:90b:578b:b0:39b:3510:4af7 with SMTP id
 98e67ed59e1d1-39b3d5ccb8fmr10221355a91.1.1788688178890; Sun, 06 Sep 2026
 02:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906071635.160615-1-sagartaunk@proton.me> <20260906071635.160615-2-sagartaunk@proton.me>
In-Reply-To: <20260906071635.160615-2-sagartaunk@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 11:49:25 +0200
X-Gm-Features: AcwNN1VXiJDpw7Yx5y7AHks6u9YshI7REEbxh0m-sHpFxLllVsN403pcWq9oNiw
Message-ID: <CANiq72kUVbdGGbMnWTQp6kAoq8pbddRVUOPzT=0RjWFf5dtQ4w@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: net: netlink: Migrate to zerocopy's `IntoBytes`
To: Sagar Taunk <sagartaunk@proton.me>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 9:17=E2=80=AFAM Sagar Taunk <sagartaunk@proton.me> w=
rote:
>
> Signed-Off-By : Sagar Taunk <sagartaunk@proton.me>
> Signed-off-by: Sagar Taunk <sagartaunk@proton.me>

It seems you wrote the first one by hand? There are two typos there.

Thanks!

Cheers,
Miguel
