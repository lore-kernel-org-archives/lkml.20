Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032F824BBEB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983368; cv=pass; b=aVbwCFJQGpwxWCbKK7nG1xBVtj1CfDjxzFkJwWVH3OQXf799AlrsihLXTEL/w27UPQAwHIpQst5QgWe36Bmka0Ye4aTY4drTUwSNvYsNW3gpUPM75+21bDm5GVhtsmGmlL48RXZF3hqLF5IBaNvfyGQPzymXo9gxcOLEiLEmSoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983368; c=relaxed/simple;
	bh=i63kkYRN+s0Z6WIOGfVRLoULhk9JW5XKXKE6rv83tEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lCJ/X2GZ4DjMZ6Zl3y5KPwNT69XqfrPz7G4TVAVrtSJpycm/0Exj6rnA8pJhmFGPG1aJ1DzneK3k+mCsgAZY8ve0QuBbBHLhMqlWhP7wie19VX5cB4uY5LhGIf8pFnCY7jy+cFp2c8SBh8W7ZbNL4VbWsn04Xw97PT4qd6YpZW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Vy+DOp/v; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Vy+DOp/v"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so10780366a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788983365; cv=none;
        d=google.com; s=arc-20260327;
        b=FLX1dfThp/IgLDwmOrMSgeeVPLMZYf8pBTbUh/BeyYyiyGiXGoSvGYiwzjr4/+BkaT
         go/ay3+3W9QTOHg3VA72aw0j96Gi8q+VmPp7/HSc4Db44ivhmXWJppiYdY+arMlFLeMm
         ycWDeH7JPYKkIAIoPJUZEW1VKyuQUO42svwOOIPxRJAg7ZTnMIbgoqbeJuo+CBhVTzYF
         bv5Ohf4jMTaQCQLBT4tvQXvkeB8VdcZo2k4BpeIyVTBOqJc8Mtx0/VAfpT8swjSJ9XYd
         Uz3Nga2Q5ZwPW8LJRDdmz2YT2+Liwkdir7nAxvUPi/JP3zY543/mY4Zms6dZLlUMEJ4w
         vcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kxHsThRV7xoUza64gH6LQVWpwNMtliqmldDr2tNl4fI=;
        fh=jOjDL4+2mJQErfc/y8O1OH21iHjjU5hEM2ZCx/ZvMIc=;
        b=n2t0ON1FIyeQdpH9esizPotA1Rf9N1jKk3B1rMILcTjUTb3BD7DiRYEaWOPltBmKjA
         n+HDoxUCV57nCZNgGIKDWmqs/6Ps5E2k4RbclcAWLT60vCVQHhgc2B2yPh2bvPlEfrri
         x4vAHcBbwJXlOszKjQ31vXkeafNKnr21DpftxvbDvVZV8nEg5JtlvlRqWoZr3+bMfKln
         +cyYUfQfkMEXNT9jBqkeq+c6iPsnr1w5azg8+NakhSnFlo3cTwxIm/n9UoPNp1BUo8Gr
         PEgkym1V3sWX1ru4Je5+2bwYwq2Jvf0erndt6V7Q8DisYiG7c7tsJdLoklQmY1K4CBAc
         97ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788983365; x=1789588165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kxHsThRV7xoUza64gH6LQVWpwNMtliqmldDr2tNl4fI=;
        b=Vy+DOp/vjEHIbXQvjo4ifi2hdshUzJe4H+hOiJozAuGmTIXFFEsLYZRo7d6DypDbcM
         DOSOosKTICVVCMj3zZunPcijPljaagq2pSorME79SLUPNOFpLZqBBqGAZL//YaHBKVcg
         DSa0KY4WeidcW18GK61Ke/LJHlFmoIVDLKqIZq+qF032JAK33h/ORbBnRh86A/+CkxGE
         WjTHooB51REVgbYEGRyE73+hks0wDV52Fgi6rAA08BctzeJIYvptI5N3Ohlkp5KcrBO5
         jLz6x7m952NTwkbTm3rDHWojA6HryvMjNkk6+Fbyl5kpo+54WhsJ8aXJRLkgNlvUGdQ5
         I9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788983365; x=1789588165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxHsThRV7xoUza64gH6LQVWpwNMtliqmldDr2tNl4fI=;
        b=S4n7D2buXwAnycdzDiFBSNDrlHvC2tpxXfb4HZwgUWZTkz+1mqNMAgfIoDBGadfWzT
         FzkhbvVVlSNWRJcBgpCXyktpd3XU91sWmQu7TAIBPXHAEuEM6ID2vc5lOfBHNLDAkIdQ
         HCTFgzV4nDq2+HyqCcFArfxJCCtXqJwRlIZ6x401jj1zCpb7vZDqYfRqurHy+dwqgaSb
         WLP9GKPwafZsWTvjF+I29cmijnLOWe6XFvcohNp8tmCp112UE01qO3K8wlqcY3kSbdV7
         9r4LAYg/c2e9/255tNSvheidzUYkn2Qm6KdleCAKW7O6m9PCd++odv57tqNXPCgH2Mc4
         iuXw==
X-Forwarded-Encrypted: i=1; AKwUvBxHhDcIZbc28Oa9Ju03I01iabjQE5VQiN9xJL55qJGxCQ5CBOdhE8hWSFCSngQlZdFvkZbmKPfMDa2Gjmk=@vger.kernel.org
X-Gm-Message-State: AFuF++mVcYaWKaTKUEvbNWvBPzY6GGo3jtOw07kT9cTNO4c16npzGmK3
	/g4CCr04YCPQVN/TWxkW7eE7IlE7cPzR9ayBp6PQG+mDFvlTW8j79VO1mKaaGmDXqp4btn4Oo7e
	Wl2jcdmU3Y+AGtf+iOB5dxDMaNLHRVAC4tvi81EjA
X-Gm-Gg: AYBFou1IsaNa44B4KpUcZU1JMAf1LCpV+603IhHJhRpFGUSXXyvMcE9TLU3+/TxYCcN
	afwprBRJby5v+Pp6mxUTN3jL8XKdU9WjbLfG26a2wiJ9XY9HNLk1JGSOvTcMvUOJb8MhhvlsR3C
	2x+O21IiOe1aFsnXUhAEMmejuZozckiq14XT+unQbcER2wzgv3rBoI6FQTRy40nmMwPfD1rhx6B
	oqbYA6nVEuOnPz91lq7vlTzOoEiRneyfj/xNaYJe/V7GudLgCEv+CPbYS6pVv2oLzI2gtpHL1mw
	V68FjjqJzSkoy/aZPG3JFav+AmFlDwGjXYCcCPMvcVKs9qyl4hexnrjJ1tPQ+QEs3dcT26N+sOz
	uZ5OiqZMJw8A=
X-Received: by 2002:a05:6402:2350:b0:6a6:37a3:2b0f with SMTP id
 4fb4d7f45d1cf-6a7e8d6e0cfmr12759887a12.8.1788983364537; Wed, 09 Sep 2026
 12:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726161400.3010511-4-mic@digikod.net> <5cabf9b33a20f130cedcc423b8b2d151@paul-moore.com>
 <CAHC9VhS_WP-bLgMGiFAfE1MT76iKvVJ-OV5r7xju-KMdrfjssQ@mail.gmail.com> <20260909.quahcia8aiF4@digikod.net>
In-Reply-To: <20260909.quahcia8aiF4@digikod.net>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 9 Sep 2026 15:49:11 -0400
X-Gm-Features: AcwNN1UQqkyFo5vvQsxzjUKUnny07mGrmWOQtO0xD7Tk7ZJkJIAuTKutOi4gn-Y
Message-ID: <CAHC9VhSRV_axaGM0hTZngQY36Jw1ULy_sHHsik0_HCSdVv4P+A@mail.gmail.com>
Subject: Re: [PATCH v3 3/12] security: Add LSM_AUDIT_DATA_NS for namespace
 audit records
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Christian Brauner <brauner@kernel.org>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Daniel Durning <danieldurning.work@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Justin Suess <utilityemal77@gmail.com>, 
	Lennart Poettering <lennart@poettering.net>, 
	Mikhail Ivanov <ivanov.mikhail1@huawei-partners.com>, 
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>, 
	Shervin Oloumi <enlightened@google.com>, Tingmao Wang <m@maowtm.org>, kernel-team@cloudflare.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 2:35=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn <mic@digiko=
d.net> wrote:
> On Mon, Aug 31, 2026 at 05:26:20PM -0400, Paul Moore wrote:
> > On Tue, Aug 11, 2026 at 4:16=E2=80=AFPM Paul Moore <paul@paul-moore.com=
> wrote:
> > > On Jul 26, 2026 =3D?UTF-8?q?Micka=3DC3=3DABl=3D20Sala=3DC3=3DBCn?=3D =
<mic@digikod.net> wrote:

...

> > Micka=C3=ABl, if you would like me to merge the remaining patches in th=
is
> > patchset into the lsm/dev branch just let me know.
>
> I'll send a new patch series soon because this v3 would not apply
> anymore.

Okay.

> I'll include your lsm/dev patches to keep a consistent patch
> series.

Please don't as those are already merged.  If you want to stick with
the same patch series, which is fine, just note that the first three
patches have already been merged into the LSM tree.  It's not uncommon
for patchsets to add or drop patches over time as both the patchset
and the surrounding environment progress.

--=20
paul-moore.com
