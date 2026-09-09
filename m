Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25568453A5D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990715; cv=pass; b=nzHczpmmr5WCqtSLWus9NmkVLIWN8D4aFeiHgUUGKsbAcsx893u0BSpbAMeDO7frV4I3hmKEbh20Cyb1wDtdlklYn9djWyiqnv08ng4Y0hTgnjBYMLC+L74ipeniAJR73xtoXi21yYy8K23muTiQnQPRKNF6qsDCLv52p4h/bjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990715; c=relaxed/simple;
	bh=YPRgAxyATeU3F76UKlCXE03VGs6euypcGZFO8EUXhFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lldxVPFPBCCpO9t+AyQ484Rulu8c4fNVdIC1otHxERjOgbLIxHsydPrqG2zNzxlS+5hX5HRykux3qmAwBWg0eZ/2CNiNTCwYenWf0kMI+0+oJtsoHqzRsFwj9mx1Iki2I6L7RQ3UKOBxYBO+3IMrjxMkDUuHUzZVOKN1Hw5U1yM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=XB5puUEf; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="XB5puUEf"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a9a4dc8afeso261054a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788990709; cv=none;
        d=google.com; s=arc-20260327;
        b=QAca6dzW+TfGmSROKcoDF7wRiVSBwiUDEIu1/XlfL5owy6MA+2QiImpqzOu2SMZzYT
         VaBWmskVjYgZhUw3DJb72GiKOSt5ow8ZfGzfI844hGGzFYmeKOlrIx636bRCho1znMT6
         tplt6gKYcgwlTLeHyCZqgIcN92WBqEZbeVLYb4pXd6toTPLO3gD2Fx8KeZBYu+uE804c
         sP16PuKRIS0S6Et/34GqEQ518isql9vHH4upMFeVggH4rzhK33hqRgPyd6cacBx4ulMn
         VSd37hrqOrutcN2jM1Hcgh9pZFBwpMrKR9UFssJawEeP7YI4pq49r68H3vpbWjbtlnII
         05xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1P2SF1aoVUknBY0oCkVNz36viHEfihtK8+hDmw1Wi+c=;
        fh=0nniOCgrRdlRYVApf9/70UpSCGL/+inamnEjnPtCUh8=;
        b=ao6EMYiEUzClnm+zWpZdIxJ7tjbzHu04lvRLrFWhB/QMG29bXucIt2uZLr15q4kHSm
         LGtG+MxEKT8DA8v/K9FM37kBhDDDgOyA+ZQU01lKAaXtM4UTWVldNMX5pQany2Mw1F0J
         qRzwrm6kE+Zginuoba9nr8Dfja6E2WALU+2XI4x7LVQ2nFQjwUs6yvn1XP3jl5yL2EVh
         x79qf/lLnYanWWJ7K3PjPjMbfCMw5MlhXOeQ9Pr3+4ivXm4ibG1dz0UAZber0HxBhrwF
         /kqMlaaUgdFhWBq9y/ssX8BJ1JlpUTOEX5xn+aeL0XW8Qf+Fti6WIoVTP5Mw/aT7P/4U
         SOQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788990709; x=1789595509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1P2SF1aoVUknBY0oCkVNz36viHEfihtK8+hDmw1Wi+c=;
        b=XB5puUEfiB2thfXXFieC2VJ5imNQr7nCDybRev6Z2hfdslc0KmSekPKGiURZTG9EIp
         pR3EtVxlZUDRaqJgSKMWT2dzGaMP0+DnIF2o0/eep+8ijHNS2/3v8XRlPHbiYTuANEzh
         xLv6x5nxHX4m8gfTs72hQ2DYS4ge+dEAKqt5NK5+BTYUI+0LIb0lyTiWcvKAjFL+qX85
         tUlA/AqbVDGq67jyyVd5FplmxKP3llhNqBEORrGWnqhKgLfim5bX4ZLLKUYbbs1Ey6Zq
         dXArGnJh3QwrbpJZEENiO+yKm6TJ8kYkU4g2CGIq4MI4zvcLYZ8aYwpng0p2/UEZbuXI
         qTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788990709; x=1789595509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1P2SF1aoVUknBY0oCkVNz36viHEfihtK8+hDmw1Wi+c=;
        b=KflKzOffNMkStIl3bjhyKYn/luEpM08ymZQhzvV3qs8RhH8CbSpzfVpVzB3w6H2VnO
         rmPnwn2bSqpK9W/+jIakwXyQxRpjTl897laHA/cJQh7vELdFiPLxDDZvxpHGbxE0EWBZ
         uGbbc5smtFT+7hWzaV8vvbOlPvSjlQZ9q4u504hDQCGspcmO4ymYgncVRYt0A8Kbp16M
         9y+ftE33K/nebATzBg2pk3iLzXgTftazRHIEUQDyk2yv9wePP2U0uTL1KtEPwGyUZVOM
         CEBFuqApVDkw1/iFmdbe4NFwJNfYhsXUdlm3FF3ZS7REmFmDpKJcA6yrFJdWuIY6EdPf
         SyPw==
X-Forwarded-Encrypted: i=1; AKwUvBzhB4RgRBN6nSH9ejKTcgChObpXNEqNzRFwCwS4upxFpOAIpR63dUQ/3Ue8ytxD+o34a9T5ypGZnBNeS/k=@vger.kernel.org
X-Gm-Message-State: AFuF++lOma7XByYro6PZtVXUbvRDjsgUSuxsbOm3ZhqWn5I8Hmnv3iJz
	OLH5eGK60sD7x38/+YbEjwWM8pvRUq/WL+SJICa+Bcnh0byDc6LxQ6fZX+f5OGXHIQcZ+S1bJ0U
	9NLs3wUe8dQvULOFvsO3q0q1Ys5d5Mwmao39nEXFB
X-Gm-Gg: AYBFou1KPslIoDfDWNfPOJtBmRYMKF+A3zzIA15xZ1mLI5WZjlDmjmaSUM+LeFssaHB
	zkeiKxMdiXnC4p1jUw1V/Z5Sp823MZEpaiXQTBiksozNBOy7NqiF5KRRgUZpDCKvqs08/pnC9V/
	dgvqIwVWireJT5IdilDY+/DCTwHfeSWM4V94MW+NQYIKPU3WBoWzuChe+t7lDLdv0x/qJ4925PO
	CCW0hSq8hvZMqwWs4OaLX6RJS4lPQHpCb65TX+zddXVp2x9zLbo4vpIQX3aIICdphHOjdIlAMRW
	H22B3b8VlHznAkhETodk2/DJ12pg1owofnH8/o/EOgXuXQoPhTayulwX0xuT7aShG354xrb2bmV
	2EyH6/446QR4=
X-Received: by 2002:a05:6402:42c6:b0:6a6:32fa:1e99 with SMTP id
 4fb4d7f45d1cf-6a7e90b8f43mr14558766a12.17.1788990709336; Wed, 09 Sep 2026
 14:51:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828024335.946-1-nils.lehnen@proton.me> <CANiq72mn2vvCL2VP8yJxmzXM4n+jfV4R7arUcj4UXSi04y5sfQ@mail.gmail.com>
In-Reply-To: <CANiq72mn2vvCL2VP8yJxmzXM4n+jfV4R7arUcj4UXSi04y5sfQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 9 Sep 2026 17:51:36 -0400
X-Gm-Features: AcwNN1VmtEdFon5AgpPJO-meJZ5NT-8G41KJlj3m5Osmin_JTAnahMcOn8IdkOw
Message-ID: <CAHC9VhSuuNmdRQ5puaxWh5ez3Dz9LhtAmZU40SUGgEAL8Sn9-w@mail.gmail.com>
Subject: Re: [PATCH] rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Fri, Aug 28, 2026 at 2:15=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Fri, Aug 28, 2026 at 4:44=E2=80=AFAM Nils Lehnen <nils.lehnen@proton.m=
e> wrote:
> >
> > Two equivalent one-off patches were posted earlier [3][4]; Miguel asked
> > in [5] for a resend that keeps Benno's authorship, which this is.
> > Cc'ing the LSM list per Paul's request on the original thread.
>
> Looks good, thanks!
>
> Nit: nowadays we typically use a:
>
>   Link: https://patch.msgid.link/...
>
> to refer to a patch that was picked from the mailing list (usually
> written on top of your Signed-off-by) -- `b4` can do it for you
> automatically.
>
> But no need to resend just for that, of course (and Paul/I/we can/may
> change it when it gets applied :)

Looks fine to me, I'm assuming the Rust folks would prefer to take this pat=
ch?

--=20
paul-moore.com
