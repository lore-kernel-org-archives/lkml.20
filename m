Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9C34908AE
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369248; cv=none; b=hUPCGI/s+iq3yL7fkqxp8XBpvzbTW5aMUUYJYANzo+ynnI4WpqQdKsyGkYtmq8mp0/LBDVAsTFMBsi+D6CvJE/3UnGJ2nuP6z7Q1XqUhr4VDhKuvgTBRxJw8QX0duBayWe6edSRdG6+V8XGXJEDYiIimGPJd1p+WVvWkw2FMlEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369248; c=relaxed/simple;
	bh=hwYZelGc2cJ4YCRonOqXHjwGmnal0btcIymMebtXd9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aQKrwpek3gVDZj1WHjjoR4BQpB9i6iKji6ZwbLeOavOOriGFqDdLzWk3fj9mpH82wKiEAv093bexUb/MiOOV/D8dikEpWxiQnn8k5FdNdtJfkm1t5eoPnVj38TR9Vd0MbmpBc5FF3Sr7kWMy2s0iWk3QGjpI4XAjrtaXwmSYL3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbPU636O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbPU636O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E631F0089C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369221;
	bh=2pOrvtc34zjiHi7ArAWp0fsuOWQMob1icjSI0Sd/kJ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IbPU636Ob5RgsbCstlDZc9of3OIg+ojp1VgPmaW+V6z0LO3SNCwVZfO0FVORGwQao
	 xLBqmYyA7d4saiE2g4zwfpfDmnFi5PLJ9+TPb7iegvd0RtbUlXsiD1cvb5DsSJcEWc
	 c2mzj2wRlqpUEthThuCtmaJ8a8kmKET82KqAXftVrU6VLVV3hRGCzqqSmc7AZlqcjn
	 xm8Q5RZd4jI8IsLGjq8TH0MHKlvMYV8J6dO1RwBvYp8fFvC9VWll8dtvTPepacSUHe
	 01cfV5fY6KLFcBpSwqknu/VmTnbezrrqksVMy+WTuDH3aq+WXlzHyGuzZ/Jw9VZRj5
	 tIH2EJG0cqrUQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso2670943e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:33:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxW0ktjMAiSPtihg5liQ+NlxBxBqETs64N5u5JzL3DpJThTY8pHBvx3kPgIyd2mntDW8jXNwdslw6CxqJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHEoLJ4cJGOOP1+Hy/zBJSI3SeNnh/SV3ofmiitpXRwfuPlREx
	n2da2d787bT82y11jbs7Jx/Np4nXfhDs34NAzUYGQJXYPzXQkQxs1GEFERLtiGgDT0YgQpB67bK
	4kAQ5UdXClrbfxMuq+QMCmLbUGN+g/is=
X-Received: by 2002:a05:6512:3186:b0:5bc:b659:2e11 with SMTP id
 2adb3069b0e04-5bcd06faacemr713954e87.25.1791369220442; Wed, 07 Oct 2026
 03:33:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003083200.459705-1-yaojiale02@163.com> <20261003083200.459705-2-yaojiale02@163.com>
In-Reply-To: <20261003083200.459705-2-yaojiale02@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 12:33:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLk_eLX=AekTrqSH7yB2vL_zL2jntAYchJehnxxQ_jALzw@mail.gmail.com>
X-Gm-Features: AclHuK_J7REc7EOu2ICAHynEFqSp9Q5Bd9Te4ZdG3E7XUdnipn8Eecp9yHxk1kk
Message-ID: <CAD++jLk_eLX=AekTrqSH7yB2vL_zL2jntAYchJehnxxQ_jALzw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] pinctrl: sprd: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 10:32=E2=80=AFAM Jiale Yao <yaojiale02@163.com> wrot=
e:

> sprd_dt_node_to_map() reserves map storage before adding mux and
> configuration entries.  If a later operation fails, the error path only
> frees the temporary configurations and leaves the map allocation reachabl=
e
> through the output pointer.
>
> Free the partially built map on failure.  The caller ignores the output
> parameters when the mapping callback returns an error, so they do not nee=
d
> to be reset after freeing the map.
>
> Fixes: 41d32cfce1ae ("pinctrl: sprd: Add Spreadtrum pin control driver")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Patch applied.

Yours,
Linus Walleij
