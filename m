Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA0C455168
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150963; cv=pass; b=pLSeB46Quku7/wxo7jeKCiKe4cJ9MbyZ1vaoXqyvjh7AuYiDp2IySguXvpM0KBkiAYkAgLAxbUUg6h+I3Bkhdcq2NuZj03BMoR4s0Nx+PJPhXswt/ETBnat4TLZB2b+bXsR3A2yFNcb41RYZiwS8G3/7EKgx3GF+FmuQ72rj+mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150963; c=relaxed/simple;
	bh=dpP91akbaFzZC6rOdZLmE8fjblFHqBWnDu8zdizP00A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkfjQFC0WPL7b7DeiovrgHfBc29tUey17UtgX5tz+m74M/Iaz8WxGLPlBlA+h+tGLnEBimjsoyD1xjW9MqXUdAPc2+7oklf6LMj5hg127Nm12ubQWf3Wi/mRXK24kseL6EV6MsQuQG8I3G6rLvaQn740p1755LH2yfq/LNXlVO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DutcuQVC; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DutcuQVC"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so502550f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790150959; cv=none;
        d=google.com; s=arc-20260327;
        b=Oxx0/xjn5zOvy1wX9HocBjn3FB0VT5Bg1ypFWgMOifIsuZu3iJAqlk8FFT1fRmRACT
         fvXGZXQvhqMhBXX9zXRayr5uv7Ri/0oHEaeQKyZBJ1KjAVqHSIeogJVzKETAAVaUfLme
         rduuu6WTG9ZdZ+OQEvbPZHYAmNNhPQoCkded5VMec0S2VdMkduAdO48PQiXCbAF/ARDY
         JkUsWL9+GNGrMY1Z/iyCJ67Ud0nBEJ4AaVEJvjZ+GoguJh/uGLKf310bGrWQolYE1VRG
         qX4PRCXPVlcliNRy7xW/+6NMk2dMVdc+MdQ0ssDXzuoCMz/ot8PTD/54EJ+A4gKPR507
         vxZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dpP91akbaFzZC6rOdZLmE8fjblFHqBWnDu8zdizP00A=;
        fh=hAeKZ2LCPCu5llfos604KDCQJZEisMOzJaKbdXYNOd8=;
        b=QbbW6YdpK9KMujYNgRElJMSKem+cOD9KNPwDNd/p/wMWAlSjqVe+bXKx9/2pccHGaK
         7UuUrfX8NhmwK/cU/aPWzoPFxSGlcWMgo5p5LHMv2g6KHVOJenFHrZMpwSZmznYQ6Lpw
         qj528ETBB8CdGsUipWArMf6Y71mbYfpsWgCYyWN98AN3SOlJV3BePJQgtewT1SylJw7e
         LtAUaC1jEjAnOUYChRUBGJGI1C5ItuuN5zXtyPLHXozMgAE7zoJ2SYFpT9KfFuDWaeJh
         VlMMAmyMtktU4lPqBLqOL3ZuB4gMm+FJ7KdXv+/Ae1bqMVvkGGgvCkAieKxL7mxHy1X9
         NuUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790150959; x=1790755759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dpP91akbaFzZC6rOdZLmE8fjblFHqBWnDu8zdizP00A=;
        b=DutcuQVC/HAYeb+HTdhsoWnZc6MI4nLZzEAsHaQM4jgtTA0H+KZfMkn+d//5qIDp6p
         O7YqcHu14pTs6yWkaks9hNRnoFJSrno/LjB1h54g11UgaNxkCe0Lt6xhmageRX4TuLHz
         /qJY+LhC6TBoGiRKvLQbY0bEnIsFjzTZD4x0j9p7aPaCfUNcu5fB5bdN8wuzQCw2NHe2
         5S5+ckq4zszgtSr1UA87QXPRi6MsQtsZK3DM7V1/gKh5jh/ewq9G0CJoDVpd9wmacL3W
         0e+hofqiV+9fDhK62u2rjMugsGultpU0FM1DKqJnkz4C/5oxJj0L4NNmBLTkO4m4SjOj
         /jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150959; x=1790755759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dpP91akbaFzZC6rOdZLmE8fjblFHqBWnDu8zdizP00A=;
        b=k5L2rSjxJAkmOTE4UiFvjzedvFqaug1LGZFB/fMrhen3BRe1EwEn5/XTO79npMz/7V
         TeQHWNP2IkbuDlKkefHToI7A/UAPmuIJVfUHlIpJIAZQ7Uwh8SGO3HcfSg5Hd8wTJPuf
         FeP8QAv/jk9lsh6Naip4wbIRHIzL9d1+u20qCcpkSxOXql4IUZcCjqB6iGiRzbXWP4Lr
         31rmtMQgP35wS5jJcaFnzs3IbYloAhBr/apBMyBLTK6tm2tWaOTEJwbLqe+wIKzSZ5sN
         1WooINLRyDL2iP+bMjjVTXh27lFsWXWa2Sx6NEBlADHQ7qyWgP9Q7U7EVA6Fygb8pfcd
         vOeA==
X-Forwarded-Encrypted: i=1; AKwUvByNtdUCpp0zSNamhPrBjiK9M8FqIoDenpHqmW/X7s2BOlDoJuZVcNzWQeRfP2mUimg33sv8iR185upuf1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lBgo9VunVo1d17AhHJRFe3yTz0Cj5uG1mFFjNLsWZ3AjezQXXq
	7H7bK1WjM7BR5b9rmLWOUlAlgIBL9fOAGdFlx7JFF9+YUAQxw7ixpt5FzyfvmS7+M3rRmJc3/PG
	Tz2ZjCPYtPQanEtVV4xrirTB1/0d/dnPUsGb7SN8c
X-Gm-Gg: AYBFou2oLWcLC1gdVCD8JDwtjzfiSPfyYyOzXsDfHBi4G/U5Qk1+25Pe93+NA/nWmrc
	6eghJ6E12xkZ9yZDyLV20Ojy0DQFuxCmSJ+NeAJKmPufxZItVm+EkLfIees/zLww52aHe+62/Pp
	xq0fQdhbsPoUrk4ANnkF9wL9o5A0ArraEHDzdUfibkzw3TZb9WRVndB4gv9tW9V/rEes02ZdQ7Y
	B2D09cR7PwSmPel/wbgwsw0czJw82KvyrNWPa2VLO72GEmqBRviCrzdDHNBhfWr11f5G1UdA5Y/
	h1ZybOhq7upx3Puy7rLP5eWGBRZx/JIasskC4tPUD87O/kbozRUqiD5FMOEEzdo9Tz4JImuZ8x4
	rWoTfA8fWPowDo867IPyM
X-Received: by 2002:a5d:6f06:0:b0:487:6ef:86b8 with SMTP id
 ffacd0b85a97d-4886709e09emr2505954f8f.49.1790150958679; Wed, 23 Sep 2026
 01:09:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918100016.100988-1-sagartaunk@proton.me> <KZuCCqRjSSbylbLLVhoUD9-xyBpzD9jUB4vGC16N0_hIra8SNxFeh9lEJ6FIMYMgKqf41J_swYT_HVx3w13k0cSrYYkBljOF56suy3gpgAU=@proton.me>
 <164304b3-3324-45f1-8766-536767e7b9d7@redhat.com> <CAH5fLgjBC7o4wt0WPH6xEkQEkOvsjj0ymLq2xAGXoMwN-fZyBQ@mail.gmail.com>
 <_OvWoTp4DaMWPlCDpP6QCis3vmI9jsT_GeJVq8e-7S_FvY5zurx-iRSvWy-rPwHnRGVixK2i7E_QybBBgX4YZVrXfsFbm6IwjmHpBvkoBuM=@proton.me>
In-Reply-To: <_OvWoTp4DaMWPlCDpP6QCis3vmI9jsT_GeJVq8e-7S_FvY5zurx-iRSvWy-rPwHnRGVixK2i7E_QybBBgX4YZVrXfsFbm6IwjmHpBvkoBuM=@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 23 Sep 2026 10:09:06 +0200
X-Gm-Features: AclHuK9QTi04eiS47c4EvijGQ9s3_RK43h6MRQ9Dlx9YnzrxaDKzZpju_IdOlPg
Message-ID: <CAH5fLgjr5p1XMNGwOzigTW+CxvQpfoH8no46RneTCLinem_WTw@mail.gmail.com>
Subject: Re: [PATCH net v3] rust: net: netlink: validate attribute length
 before casting to `c_int`
To: Sagar Taunk <sagartaunk@proton.me>
Cc: Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Matthew Maurer <mmaurer@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 10:07=E2=80=AFAM Sagar Taunk <sagartaunk@proton.me>=
 wrote:
>
> Should I resend it after rebasing it or would this be fine as is ?

Please resend targeting 'net-next' instead of 'net' and resend with a
rebase. Thanks!

Also, please read the guidelines on top-posting:
https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interle=
aved-replies-in-email-discussions

> -------- Original Message --------
> On Tuesday, 09/22/26 at 19:12 Alice Ryhl <aliceryhl@google.com> wrote:
> On Tue, Sep 22, 2026 at 3:36=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> w=
rote:
> >
> > On 9/22/26 04:31, Sagar Taunk wrote:
> > > Hello, are there any updates for this?
> > >
> > > Also, I wanted to ask is it fine if I keep fixing stuff pointed out b=
y sashiko for now ? (I.e pre-existing issues pointed out by it in other's p=
atches or should I ask the original authors of it first ?)
> > Does not apply cleanly to net. Since a repost is needed, you must
> > also avoid empty lines in the tag area (i.e. after the fixes tag).
> >
> > WRT sashiko-reported issues, beyond be aware of false-positives,
> > generally speaking net-next is the preferred target tree (i.e. no
> > or very limited impact, very old issue, etc...) with no fixes tag.
> >
> > Focusing on high stakes changes would be appreciated.
>
> From my perspective there's no issue in landing this through net-next
> instead of net, as it's not urgent.
>
> Alice
>
