Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA28A4718C8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076304; cv=pass; b=kWpYMKCLq5VrMjapWDGqiMkwVOK7p1wo5MqMV11Bgi2r8VxAyfjdhwPFLbTJqa3zFoYZp6CCKO2h44hpgewfaak/hzRyrs1nCRQbqXIBDhLo0ahB0WcKMpIw7GyYIOmAR9sBZYoYrdTyecgwVCcoKQhvnOqt+qFU6BWhkwaH01U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076304; c=relaxed/simple;
	bh=DJMwu9KTlxT/76kwpOr6QYYOlgkUnIVHv3DhHahv1qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgNUOEest8pS4o4M9txm1xBK8FpGYEZ/x9PfAaXmI1S3ZaR7hswcG9j52A6MDGn3Rr+Apf24ReR4Tim2KktbQPlLAq5r/XvzF/VgpvJhS5nLb0cg+RtG1mopcxVMAuP1qZKMv/+JZ6CRnZ6h8rEXbvr2UfZuJ9W6oczR9ce0W1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbzdTZ5X; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbzdTZ5X"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4678d3e490bso935001fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789076301; cv=none;
        d=google.com; s=arc-20260327;
        b=ik8nl7/kkQ8wv2mTSosaKaEbAiixL27tFxIQ91t+Gua9WD7vcZZklEo/Jo1uoYVQ/9
         UdewJ4kKFL1EkpXSfpQv05dgYvgX37SkqioxjF0Y4mPCkHA3jihdYFpMYrbH+/nHOTAY
         m3izy24LkNd3eQYb8/lbCzlNYU39BzXbFFkzv5yHsRVfKrA1KVP0Dadan3tiWAtGxg0i
         8cu1FuyKJPJiL8lKQZY903nW8jtu65CkS1tU5R7MN8hbG77AQqgjMDIu3cqdFZ0wJWWT
         VwOPPGnxdFHRDE5wKHCO3WyO5amaCtIQ1Kk7s5Gx/fJpBI8tHvfKatqhCqBPY9Or63FP
         jpbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZhQPjd9BPdcyQWyYvt7EkC4S/NWTkTndutMjiDfsSCc=;
        fh=ZhRZKV0zT27728CMGLo9SSnIaX23V58kAbbAPcOmPvA=;
        b=Xy+8ApCn4E1hmXXIPbmD2W7kklzThhWylPJhXJ9BA1h4JdXeHkQwgtcA6lQH8VED8R
         pHa703xTpmKo9H5AHIUdkQV6vKQaajEOMSsND0fRmyy0U/6EwpakKr4NnSrR0qzM0ybl
         KH7gx95g0YfApDQ/MzFMWNAkoGHGsQt+ynzRZunbxuBwH+RbpwIs77I2BpoAnq8ceC7r
         btPSDByR4tCYlWnRy8IuEihl/9Bmx6nb2FC7hm+eGgw9HBuRmE06gTbnlqc/dmcBPtwD
         0j0IdB3AVjLZcBWzYsD34WcSk0w7D8DJrbWfkey23ZgydWpUN28oK3gzuuTl6nUxbYMa
         JnXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789076301; x=1789681101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZhQPjd9BPdcyQWyYvt7EkC4S/NWTkTndutMjiDfsSCc=;
        b=LbzdTZ5XQ1WkoTEaSNe7ws0YWNoos28qUbT+itWSO3Oco4YvwShf25bpbvWomd7NKK
         wn6oVOq2XFRKRFJAYZHc81nxaswo/sKTiEl9hxuwCqyuRqR/bocfSutIXpu1rUhP42Fb
         4+zzcM0p76XHAYCV5zaLvhOuUicvu32X3Ho677SOhIJyPUHouG+4hTeSBuCxYFznkD5U
         7AgdXnUMGsStwTFu1XifOful11Jh1ulxuo4NzUvTsyBUhh//4HIzzaRTPJwTkhFgh6Be
         UEgRKduQWDYJXh9PuOrnIxR8sUngioI8hWXT0W1Rt9jXVsNUuBAb9Z2O+WOBGR9qJZLw
         2zqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789076301; x=1789681101;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhQPjd9BPdcyQWyYvt7EkC4S/NWTkTndutMjiDfsSCc=;
        b=ovCHKRMdVOWszfRbBn3HZ/NMCwIEAeCP8hTeIyguf1OJ0fICWxzTXbLRIu6p5RXQBc
         oAcEVTFMIq9Sm0fo8YNna9Py56kTdTeV7nrZId8u/QU9CH7QhbYZnm3mgVpgw819Bahk
         ZmBp/+7/1zdFJssv3XASKxQ/NPDEjBWjroJyL9fCdwpApOD2OPHxyc3yRefIAzhLwPVe
         fOH9HVlJcaG6KSEowSRlTWHLsebCvtBbDBzRhrJQ1KXVKzbBvYmNZOLTHQvMQZYWbJbh
         0wDWjJJLORjJFp8KSpjm46ILCHu+YpPxKIVGrfa9PI+U0S01cZKxBvJ7T1SayA91mwn6
         AAaA==
X-Forwarded-Encrypted: i=1; AKwUvBxZdB2UkgyvsURCVgDbtfCOtiJ0HtARnUL6uIxjJIRqLMvLB6fcz3jYsFY4dlyLOljAmOlEYoV7HUvaS5Y=@vger.kernel.org
X-Gm-Message-State: AFuF++khIUAhcUMFqujzNkZEDqQopQg3DA04xt+M/558IvXBXKXAUruu
	sDtrasErWu52n4LSYHOOzvP8SZYrq/DiB5dgedYMTlzSuUQ+oJYkK+ExQoTsHXvCQio8l6L7TyJ
	d9I+LLtywkBvQREcaC37Uv1u4Lxmm0j8=
X-Gm-Gg: AYBFou0Fkt57W39K4nfjk2Itz+n3aGT9kiuJgoJc1tQ1JPefjME6n6m13n9az/x9Xu1
	9v0zdeyJPnQrVKgbpPDjy6zNhvoqREbHXZbWpoWh4kwtpx5m0etx5IA21yrJnkEvoEQeYa3XPBE
	Pa9Z1g1b0PktDg3Td9eH5rnl6dnzBTNqPv3jzw8AqZP7mEx3A3ttTf9QqLT3DK3wH/v7MNyH/nm
	8XACYoz6jZJVBbw2Zxr/Fe+4/QpTTNzRh3qv2P0DEpxFCp/UPsLdTEY42lWJbwBMVHB4WEVkYCE
	vJ5MGxgYYRC1YOnNhiBjoZ2oDRXqcZUFHA+XdQYGwe+ptfxAYeoe1qyVZhJfzx8FQbvpZ/0QbI/
	acKDQ6L2LJ4E8OGBQfVo74/CiIg5fRws/TmaUB7UY
X-Received: by 2002:a05:6820:c0d9:20b0:6aa:1bc8:ae0d with SMTP id
 006d021491bc7-6bf43d7ade8mr2361347eaf.4.1789076301531; Thu, 10 Sep 2026
 14:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909190541.466476-1-mmyangfl@gmail.com> <20260909190541.466476-2-mmyangfl@gmail.com>
 <40e425e2-7d0b-4e20-9880-41e46ff340c6@lunn.ch>
In-Reply-To: <40e425e2-7d0b-4e20-9880-41e46ff340c6@lunn.ch>
From: David Yang <mmyangfl@gmail.com>
Date: Fri, 11 Sep 2026 05:37:45 +0800
X-Gm-Features: AcwNN1XDhNkpJDZMVPsslJW0cos01vLLBxJyg9QRQFcMH1WDYNbSbJYgMDc0t9g
Message-ID: <CAAXyoMPG6s_z3g8fZ5CAF8BJa0OY7uzzO5PccaR6amfmYrYYHg@mail.gmail.com>
Subject: Re: [PATCH net-next 1/7] net: dsa: motorcomm: Split xMII and SERDES
 port masks
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 4:59=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> >  #define YT921X_PORT_MASK_INTn(port)  BIT(port)
> >  #define YT921X_PORT_MASK_INT0_n(n)   GENMASK((n) - 1, 0)
> >  #define YT921X_PORT_MASK_EXT0                BIT(8)
>
> I'm i right in says YT921X_PORT_MASK_EXT0 refers to port 8, because of
> BIT(8)? And YT921X_PORT_MASK_EXT1 BIT(9) means port 9?
>
>         Andrew

Yes.
