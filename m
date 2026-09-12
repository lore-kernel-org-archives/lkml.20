Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A603732D7F8
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789238498; cv=pass; b=FygIanUvmPPKdze3R+bcbZ0qz2+o9qmrw68lKBE4ozftTcP6QefXKNVt62ycCY9TKzqN3NQdt2GLjkjKiAQRwI/POy1EbcEOJOj8Af0qy/VoLPY+fPAEyr5ECXYLTLWGq5W2ic4Yrj44ENmiRIgqMbsxn9NQo9oQ7M1brNFikxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789238498; c=relaxed/simple;
	bh=qtjD8mGNVxf7mZ2NIHBiWN/l2X+eK3VcVypAVVOeFfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndpLBOaVqp6V/WE+jBlecIfCaCmJs0OgxtaDiLFlmAcum8+Aflh+23lHe8KNvXsQ0rMC3UaeF63LqFEuY3KvUJi0u0B4WUUM1rUYmopZzAnkwGOn3+/f4YZbPqqj/4L2dtXyWT+4q5/n2B0KRYBKqkjDV0xSiUhdfzl7iQaOvqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=YA/c8vZQ; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="YA/c8vZQ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-86265451beeso1269593b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:41:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789238495; cv=none;
        d=google.com; s=arc-20260327;
        b=bdpMOPvI23P6+d7rvK7InZIa5/FduK7TW6m4jXsd73dd1C73+BuWxf+uMOhvdF3GYW
         +J6V420IMSFVO2y8H4uFA43nM+dgynFemvX6SGEl82jkddW1C1MkBDdCCDw01K453K5k
         7dlokAMbZNnMtOoOBH763iKHeRCyZqOuYKx5u+dO6blkn/1Gk9cwA+FiHH00nSWscxTY
         AfA/UK9zPRziC2I4wQDqkMLyI8wwYxiw6FELfPR2bDQbN0gHAbMYL/VmtG+V/+ei3I8u
         lJ2TBeNB2O6nxeX9QdlQ1fMHa+WTCBDnpcCPuFVYR3TelPBFV8RcMEAHL+FvBCry7mZo
         6pKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q5HxYaGLmH6quZJ16ng/1tdJU0o/ciJH2LOZdATejjA=;
        fh=wdWMKT3JEtWwPZok9g7tCrGVLRFyiX8HUiMeA1AVgoA=;
        b=T+ahwnq6C0ugnnhh7v3nTNblghWadLk608KLpT4erg95TT5A16GOJ2XhMHYkcKgg9S
         Tg5MbBCagqsf6dRhabdpKTggVarZgNla3/XTfdf3ccUKMd0lmkubhr8LhYbyCIP0rhqy
         SL5+ug1Qk5Cti8VZeQiW0+7MCFYSQWSBrwnlpV/Rv9csG7WU1ozWtXf8ZSoxR1D1qy+O
         k8hSGdTQKWgwpyyrKJJKdgsNWjo09zfDiMIveVdqP2km64jLaaswnhTSU5B9ExuaIyhn
         6eMh5FHkozM/7PiYCIaeRFUvxNhUfdG2qMVuoYUVsaDLgDjQwowYRMMUGhsfklUJlIjf
         UXIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789238495; x=1789843295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q5HxYaGLmH6quZJ16ng/1tdJU0o/ciJH2LOZdATejjA=;
        b=YA/c8vZQzIjbBNSsrIznsbARA0mR57HjDigMF86p3o5ebQd9Hi/u0TLnxze2yL5mXO
         ge1ZxvHwFDpHX/Dc5s7ACpy1rbK4lAY2VZtxIuXe6uIFdiIILhAI7PQTYtAvCzXpbfV0
         ZgcJBMZbzYz4N/aUAWaX8aOkMsMJR/Zc5Kbvm1Wyo93NtjBhVwMi3tKi6fiZRPi7ro9x
         ggvbcyboX9mRGPVCv4TMsBqsw7JSHEjp5MEqRlvcP37JwsDadAQZjJAzEmasYaZJ4NsA
         rr5jFA/JaAPRHw9aYjb3IVlwohFXEz9Y1przch0uAE9LunlxleiB/3X1vIKEgJfZfpzo
         M4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789238495; x=1789843295;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5HxYaGLmH6quZJ16ng/1tdJU0o/ciJH2LOZdATejjA=;
        b=aSekKmITxDYVSjo8hL7yu/JOh2B+x46m6TuqlQgIWr3r3AqwD0MDLGdJbDK8WmpCY9
         kAybvFC3Bo7kJabhGIJEQlJd4tCcovqeuiWekSB4wQjcfrnxOjHy5EmOxKRmRFQKl0TE
         TuFvZKJ/OLRUQCtdWdCYjK7rjOjnSAnCJmRnw8LAQkrTkaydyN2zA2WbaN2ZmHgUfnan
         tQp7WgwZKf1UCcjEKeJzXbnzQCh+wGjitgBWyiDhVbxc12lRqxEMjvgpqsFd9L6QnUlH
         1mtw+g2Og1ADCKb94685pynCxSK4VNHbSVbPRjwE3p36pUm4zMYkcA5gujZweBOh5yMl
         PD0g==
X-Forwarded-Encrypted: i=1; AKwUvBxH/CJb0GXFpLzcKlWB2JTpYesp/plzivXZbb0Sp7Kf/lbUQP3GurXhXgBKV6buRl0hVariQRAbJ21j1X0=@vger.kernel.org
X-Gm-Message-State: AFuF++kkIR6DRGRjH2fNob6lRvHmvh/UPbz4xZ985BOPdmf9Z12HmLqb
	/g6ukJ2JEw2Uvme9gt4FX6LVgkpRmuOykznJwSut27f1P1MTXjiV5l5+mS00Mqibpsc9Uv3//U/
	xrzV8v5Gmp7bFHZgRDiETBEaUISre90mcKZigEaQ5
X-Gm-Gg: AYBFou3AWvGMcwUYu+UifSShHEnHHcicBoQYY06k2ZmEA70Q1O3iztSTO6uYo5EUL+K
	cXB15DDzDZng67lCNFxHM4B2WkKQck8m8Qg/jaMWVPeY0uqoeG/FrrRzxhKEiqyaD1nmz9xeGCC
	5sdlx86aEW0xMvm5Axm8nhZ1rPbnMjhR1f3ZAC4t46cbJfEn0Qy9aM4jx7uZMcfTD4UIu7nO7bc
	BANfxjuzj992BHYjfjuaRilDYi14XxbBgdBESQAuuIJHZcKNqwVFsl9R8mmy9yS4VMehWfruTHe
	hVxqZ9UkUBAOLNgO4HQfVVO10juiwXsiGRt9RS+QpqKEPMAVlJP+oI/2aWTiVcMZTGs6CByz9n4
	uSr/lLOKLLC0DwvEXoHw9ppAhJge+93EB2L3Yww8eYDDgTg==
X-Received: by 2002:a05:6a21:3397:b0:3bf:b84c:2984 with SMTP id
 adf61e73a8af0-3daed206213mr20273722637.11.1789238495108; Sat, 12 Sep 2026
 11:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <J3vQPnNHSkQ6YUiFvu1bk8ai3Q8aZ7a9J1Y7@bugs.sh> <2026091217-almighty-slouching-de2c@gregkh>
In-Reply-To: <2026091217-almighty-slouching-de2c@gregkh>
From: Xiang Mei <xmei5@asu.edu>
Date: Sat, 12 Sep 2026 11:41:00 -0700
X-Gm-Features: AcwNN1VRko1QhfcNpXUHrgWahCKVmFdRFEfCWoiFBe39F7TD0MRyo3ctkWNOmGs
Message-ID: <CAPpSM+TjBEDy0zpkeNfz2ZeCZxYBHSKrw3spDBYS-kBw=EXL8g@mail.gmail.com>
Subject: Re: [BUG] drivers/usb: NULL pointer dereference in stub_recv_cmd_submit()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: co <co+66c3f58096d0bde8@bugs.sh>, linux-usb@vger.kernel.org, 
	Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, Suwan Kim <suwan.kim027@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 10:47=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Sep 12, 2026 at 02:06:13AM +0000, co wrote:
> > This is a bug report, not a patch submission. See
> > https://bugs.sh/reporting.html
> >
> > We found a bug reachable in:
> >
> >     path    drivers/usb/usbip
> >     crash   NULL pointer dereference in stub_recv_cmd_submit()
> >     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kern=
el.org/pub/scm/linux/kernel/git/trace/linux-trace")
> >
> > Config, environment, the sanitizer report and a C reproducer follow.
> >
> > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     If you fix this bug, this tag credits the report and lets us
> >     close it on our side:
> >
> > Reported-by: co+66c3f58096d0bde8@bugs.sh
> >
> >     Everything in this mail is validated by the reproducer below.
> >
> >     We also hold an unreviewed LLM-generated analysis and candidate
> >     patch. The same reproducer panics the unpatched kernel and runs
> >     clean with that patch applied. Use it as a starting point, or ignor=
e
> >     it and write your own:
> >
> >         patch.diff  https://bugs.sh/b/66c3f58096d0bde8/patch.diff
>
> Please just submit patches like normal, in a format that can be applied,
> and do not make us go to random links to attempt to get any information.
> That's not how kernel development works at all.
>

Hi Greg,

Sorry about this. We may have misunderstood your earlier reply in this thre=
ad:

"But sure, posting bug reports is fine, but again, patches are better :)"

https://lore.kernel.org/all/2026090139-shortlist-junkie-9bee@gregkh/#t

We interpreted this as meaning that sending bug reports without
patches was acceptable. We understand your concern with the current
format, and we will stop sending reports in this format to you and
linux-usb@vger.kernel.org.

To make sure we understand correctly and follow the appropriate
practice going forward, should we:

1. Send pure bug reports without any LLM-generated analysis or
candidate patch, similar to the bug reports syzbot sends to kernel
mailing lists;
2. For USB, do not send bug reports and only submit patches in the
normal kernel format; or
3. More generally, do not send bug reports to Linux kernel mailing
lists and only submit patches in the normal kernel format?

Sorry again for the misunderstanding, and thanks for taking the time
to clarify this despite your busy schedule.

Xiang

> thanks,
>
> greg k-h
>
