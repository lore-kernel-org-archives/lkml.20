Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917FF33263B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788328689; cv=pass; b=DGMnlcrFKtj50n7pgRlzRmTFqznva4wnf7kIMhvkLPnI1kEFTFZ2UDYbzMY/Icu/QhCNhqUGjNl5mKPQcCMVbgl7LB1sj6XkgXQKB3MgUv2mtuy5VGCA/77FtJiu2mysY3pjTlQNhV0gX3+SNsNk3gzczfQpq/ONJkADmqJ5ECU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788328689; c=relaxed/simple;
	bh=5XmfEqSRPTgbbO7h7FFAffQCGzKDNIjR2ydswy+DCHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujBBkdLOex3I6+XdTU1fOAR5LpM9pFq4L/AfFMVw7LReErFfFgzlpNKxt0TOLIbrz+ZM2Vlyrdc1OZvQRAimvxUAB0OcoRJEgHxKQykU3vmKCGXqCH3vSGJ4sSZhmZiM0M4UqN/lMxjMqHV8okU7lj+bsmU39lnjalzwbQORQek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMVbcf+I; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMVbcf+I"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39682983a0fso832795a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 22:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788328687; cv=none;
        d=google.com; s=arc-20260327;
        b=jZLmmJ4KlJw1MyzQGcunQ2S8MCwptao/EwFBjn1WbyyrD7f8qgutmyjeyLfI8wEKyR
         B+A1FtsyegXasVCnebXV0qEaHsqX6Jb1eivJG0PfLvMb6UDHCwnW/+SEQ5oTefAcMxrp
         9uBRLqdBodTMdqaTYl9hHrVz5YdXIVPnqfKOSK9DF7XvMmaamAka3iSsZ1mObRkw6Ntz
         0cIdLdZ7HKgV+TnUqTx6qRfYXxM6mGXw5nikgPAvkheoQ5/n9PeHBO61tnkAtXp0YVYZ
         inLltO4QQcUzrvXQczF8dL0d3DX0QRSVm+sdEDNxV8Ze+4KU9wBYm7I5btEt5Lzi4sl+
         zo6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5XmfEqSRPTgbbO7h7FFAffQCGzKDNIjR2ydswy+DCHM=;
        fh=m70TI+NGYzY5BeSC06zCNN5/5aZubNtjK1uW5DRFVoY=;
        b=ZmcYIoZ9gc1Rti2rnbWrxKCcJ8zmJMyCvIAXMj0RLSUGmccfkLQylijxBnsMB38Xvd
         r7BRW8U3Uda0E0FhCOkKRSN/Lc4AeX6aqZdHk4QlzT6rS2TWZpYyNUmq5zSBaH3jNL1j
         apVFXbxFUPSwF7VQdydsAF/0v6nPBAj6Ms39W40BqNNcxQoegVEljXdvp4jbO0VO3K4S
         sR5aNqf0TkibmHajoKsOzuI+/Wt8kzKiGTdNgXfpk5vPsoiR4KzHuDU5yWJLmhKPO1/W
         /4jVmKgnMMizrWP2b8GEJH9RROxNi1TzUSRjd9aGLfpsTxAEN9yuRnTZs3+u7auoEFJw
         ZWPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788328687; x=1788933487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5XmfEqSRPTgbbO7h7FFAffQCGzKDNIjR2ydswy+DCHM=;
        b=CMVbcf+IuRlQPF+PzV5w2viUI93ORABnNjTPj1kt2jsjR/D6Kmh2+LwkdBw5k6Jwaw
         mRYB/VUeN57eUcsHWzTEvu99U56PWRqmJ1nk9V4NTvR7grQvL88JjHEF9TVYjrTf//n4
         x3d4sBB25Ycy5bj7IZGBtkuQb1NOIwYTNYfUGH3T690fDhsGdJpd6IPGMqSryU0OsIGE
         o7/fi9i+jk/xZx6A937OvDPvLKsvyDlTuo/dKMKUqeOhsnb/17md2OlhmUWu+Oi6dwRV
         DUjo8MFgEN6M48W/29+c2M2Vwck+1sW6TKy8N+mVAfMp6audbRXrQWFGf4wPgQBbq99m
         S9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788328687; x=1788933487;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XmfEqSRPTgbbO7h7FFAffQCGzKDNIjR2ydswy+DCHM=;
        b=gU5mhPv5lotWM8YjkHoqcgUd45aT3x5A77URsGbeK6/f72Bdi8yIW5YbQq0RvnOTT0
         59Z94sWmUrK2lbbNEfCGgBGQfdU1Lma32aYxO3/bHf6i8H+wYwddZ7/h7+KgUMuK/qWs
         mBv24B8BkInhqphvfVf2xg4dZB9V2huWrgnnQBYQer4aPsxbZgOty/lHO6G99+fMkX/b
         hq3q4Jz1gzM/0RPn+P75QCo1lsV/ugVZTnSPbMim+W8b6FNsGImQdO3JL4m6qyUIW5/J
         uTmatUgsW30ZzaEM+XWs0CCVl6l0wA7NVUU8ytPGP2USlOP03YIAoJFNNK9tMBWZJjuX
         fKcw==
X-Forwarded-Encrypted: i=1; AKwUvBxUnrDoMwdXQZfnN9eKpn4xKYq8gtLTpOpNc5IKuE43OlWjg51sJr6TX2jCtJUhZy2xvYo1j7HV+RXjryY=@vger.kernel.org
X-Gm-Message-State: AFuF++lCwXwB0skjnNzblPNVZBbtmBK3/3WfYptlO2SULvX0ytufuN2F
	74Yw04JVVbpe4a/FCW66NIkwVo35k7yzWcHBnfLcglrRiJ1mWRi15GowoTwjGR4p4Xhcnyfgt7k
	Hmu1WQbljgb6IIFztxX6UsLounuYiZjE=
X-Gm-Gg: AYBFou31ZC5BW/3bmJwI7Ce85iH3eirrhEOUIrYYBKJmHD5RHx+jw6YOIQ+1N3xo9+s
	WJIkAvi0B9KwEwFQqH1CF1C6J4GoJbeLyY1A5MQFOekznMMbxDl7E+iOS8qQvHhD9h6OEkFPldy
	YD9VdGSj6rToAqULunc1a7u4Y8U+rpyu2eo8emlLyoUmbuAdD9WzrrBXKpHhy61CgnI0EZsK5Pr
	9iHxdy6tJYxDyffCircbgU7uwZdWmSzhTypzGlBwCk75HQWpNJiixblRdZu5NIPQOQaAejdj8/4
	TB8A1Q/ZcWuWaXYXHDHl+9m0C7I8C/ZwG5MuZGKoMJpKuWiGkTg3SHK2iK6z8pQH2NXK2cIBnQN
	I3ir+bUxh6k9L2DcbT4jVcX3UF2wzVG6GicMwcmo=
X-Received: by 2002:a17:90b:4c0b:b0:398:9bd5:490e with SMTP id
 98e67ed59e1d1-39aee1427e6mr3457741a91.21.1788328686768; Tue, 01 Sep 2026
 22:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819122252.1782790-1-florent.revest@linux.dev>
 <DL27QZ6SEZKT.1CV2HAX4A3WI4@gmail.com> <CAADnVQLxi-R1KDUXJJjpq69SpV8UcNJVqBi7uicO=V0WhAvyQA@mail.gmail.com>
 <DL2S878KSOI5.1SZMLIAWMCNUJ@gmail.com> <DL3FIBQNP6AU.1HO08FMI292UX@linux.dev>
In-Reply-To: <DL3FIBQNP6AU.1HO08FMI292UX@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 1 Sep 2026 22:57:52 -0700
X-Gm-Features: AcwNN1XUPbWnJt4wDy1lHdklrgi9PCmuthwiRhro39sjZasqw3H5dZWNrM7Ep5Y
Message-ID: <CAADnVQLMm43qJxuiHUuuh51wAL4kH0+fRoaM7YfbZEXT7LHn0A@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Keep progs alive until the trampoline image
 calling them is freed
To: Florent Revest <florent.revest@linux.dev>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	John Fastabend <john.fastabend@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jose Fernandez <jose.fernandez@linux.dev>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 1:58=E2=80=AFPM Florent Revest <florent.revest@linu=
x.dev> wrote:
>
> On Mon Aug 31, 2026 at 2:43 AM UTC, Kumar Kartikeya Dwivedi wrote:
> > On Sun Aug 30, 2026 at 3:21 PM CEST, Alexei Starovoitov wrote:
> > > On Sun, Aug 30, 2026 at 3:41=E2=80=AFAM Kumar Kartikeya Dwivedi
> > > <memxor@gmail.com> wrote:
> > >>
> > >> Overall, looks good to me. Thanks for the fix!
> > >>
> > >> Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> > >>
> > >> Note for whoever applies this: please add Reported-by: tag for Secha=
ng as well.
> > >> Optionally, wordsmith the commit log with the suggestion above.
> > >
> > > Hold on. I don't think we can proceed with this fix.
> > > It defeats the point of fexit jmp patching and keeps progs
> > > pinned until a sleepable kernel function that were attached to
> > > will return. Which means that the tracing prog attached to "unlucky" =
kernel
> > > function that sleeps for an hour will stay pinned for an hour.
> > > Let's think of a different way of fixing the race.
> >
> > I don't have background on the original commit being fixed, but is that=
 really
> > realistic? Or worrisome even if it happens in practice, since worst cas=
e the
> > program refcounts remains raised for that duration?
> >
> > We have similar worst case for programs too (e.g. using bpf_copy_from_u=
ser on
> > user controlled buffer in, say, LSM progs). At least here we won't be e=
xtending
> > any RCU flavored GP.
> >
> > That said I will think about alternative fixes in the meantime, if we a=
ccept the
> > premise that we don't want to pin program references in the image and k=
eep their
> > lifetimes decoupled.
>
> How about having old trampolines skip freed programs instead of keeping
> them alive ?

Isn't it doing it now?
That was the whole point of patching nop to jmp in a trampoline.
