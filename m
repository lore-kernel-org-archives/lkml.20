Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1F04E73C3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612406; cv=pass; b=qpx2K2fBihWd7CujB3KXHpLk3I27d//QoJcPkHL75sXLMxdcu/NU7GTYWWqSIfJcsZUNd8iXuVhfLP4C26IAqBvK12rJvhYAmpIl9sYl0EPfxwSm5RU+2dm/3lyIi78iHvLlWMEW1QawYvkSsX+OcNnlBayCvU1gjj0V/DR9xlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612406; c=relaxed/simple;
	bh=fi949oQMxoIpu6w4p86whaB5RahCgAexfWrkdtJ+AKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPRkDB76Y6TUAXDGkm/j2ghSh28IkoHxpx7gRqf5BwaKU7he8iaUkkNkhdlJPf5tvq7FQacQbFdBMlVlecP3gfNwI1Gn4OsquvFWJly91M3sD2R79SyNDtiikuaOmF4e7o84PjzXibiq588FvDTXQb4KEcUJ125wodldzegT4/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dd3p3Dp+; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dd3p3Dp+"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so2705514f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612402; cv=none;
        d=google.com; s=arc-20260327;
        b=l7lRkLZC67kkcqvVvwnmtQgDE7rf/aiLSiPPPsNRMpqnR7NPjbsW0EY3RpUL8a53EB
         IJb91Ad2bUxQboq007khJHuJTg6Eo36K9U3RPcHsqpsXkpS2J92ZYHo6EbDXkFf0kdzA
         6hlo670ZgvQ6269yuaClY/qu7KrDg9661JXCZXf4iDDCJNObhYdz3bQVPxKmzXI1ltVv
         NHfNk90Rch0a9gAtO9GV1B28vVgC95Ar3WWy8qKIrqVKWqWBhCOTp3JheRtKr2khvh1U
         n6yE+TYOr1RA3TNjq+iRDxgZ9bjBfoXqg3DbjyHOAH4sjV25Q9r7g7St3ZMEgzFyO8PA
         86mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Idi5LKEyTFs2voreuzbcbppZ5nLIeoJ5tGdhI+MVBSA=;
        fh=bqssgAvSy3uhPjrYT07H0efs6vHIDlQKAUWB7zY4ZB4=;
        b=PUvQW5/0tAY1rmQJfPZr88GxEOSGWjWuwP4whPHO9Stor2sxK8o46Z0y38y1YCU2U8
         E5om6i4IwQnMHkFo3gSScbAthWVdQWDGns8CJrljCxQz2CyD6TfONt6BrH6BqpmvdKNy
         vx3Pv2TxEbokqFya/pqqsYZkIM6t3IG5ne+GZspO+OE7QTGHWzq363Nvz1a4WZ8zZJNj
         BYN1PFwsr9zo4s8xFldCc7OFx/VKfX7DFADpoZLqf7CnoL3YBApueLmlD5WD1MqWiQzd
         kox7LW4zkDqTnfgH5LLMO+11q6QvzYAaxyqJTErCgHZBbM4luf6OWk0z3jonVtY8V6/z
         JPgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790612402; x=1791217202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Idi5LKEyTFs2voreuzbcbppZ5nLIeoJ5tGdhI+MVBSA=;
        b=dd3p3Dp+gNS4QfK8y+5Qw9vtU2KfPx0E4bn4uSFW76oyAOvHkfWld/kWQIbRfOQlRY
         rQvLURXeK578sfSb+5EhqOr6FwGX+XPo2FMKX0oh9rUTV2ktB2b5d6ShkLjKzmx4rQFI
         9qVmFPxJ9WKxVl7xSuCYVonJLVo/7xjxvUEL169LNU/dU6rltjse4PfqAfWEz/TC4cUu
         g67vxuYFeY91mQ9QD98SX3MdXL8ectHLSsza8Xzf3Mh/M/lOX75atyZmUxcyy7ZogWeb
         Sxrr3ZAEOH5oWf2vaFi0m749Yuf2pZ5DE1nV2uKQgTjS3mmqdE2Z4ygtEYefZrYjN7ra
         LfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612402; x=1791217202;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Idi5LKEyTFs2voreuzbcbppZ5nLIeoJ5tGdhI+MVBSA=;
        b=2BQCk4coF+C9PrqStTKWT0Mv0GDNFNaS4ufDOCXLtsUNc7lVULn/7feg/VZW0mDVKW
         YKdGbKbZzpAq1ETGOcfZ9NwKfXj++0VOyt9qOsYm552Mg05atZg2lfz+STeNpxLQvpvR
         vuWel8fNxCxeoDqL4Z38iMMRLwW9ock/8DajilGpVmtj9joBJ3jFShYb3kg1Kaq7A1nL
         V4Mp7N4gjOe49gp0JFmQMyk1P7yWLJJk6Tyud3f/nL/LJrl8/DIVxL2CkKHO/k8pQHIK
         Nun6sqtYHrkuzXc3imRt3Tpe+MIvPq+jBDY8iLLakJsvINcJsh4VXv3OShiteoXw3Ij4
         xAmg==
X-Forwarded-Encrypted: i=1; AKwUvBwDiBgnMOKOuo79mVtcndNdMoJAIEehNO56Qum/vecopqbRea5AkVXnBwBM3hxQEuaJQETY+ftAhvWq1bw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqbCt1Ajl8fZkipLpcZ9lInr4+u0OK5tddEwoGIUF+O9KIg6RA
	nVW6H7het/vvZDE3a2Xtm6NS0Yq/A5By4WQfk35gceTJrVuTiDloeuBhVL2JR972EQZ01386aLT
	Eq+Ko6CyTmbuHjGzC3XFpDioxMNkV1meTYUW2PHkj
X-Gm-Gg: AYBFou3kLC7Yb+g1Tt+gXXcEYzd2SRlti5hp5eTWDVUsDJqRiqPG/g3YO0+n0nt+gAb
	gqCrNmkuZwDoyyk0tPQEOTMeEtbo49PwJtqzOa03tUYUpxB2hAZ2q/SC5RvqHgijJDLPPHt9pXB
	J0Ye1LpMkJKk6oW/Vsz5MK0HuyVGqyxz6BPmmcZFMWP0+7uFpF9a3htTKmtd3CsfpZVYWuYRJil
	Q3UmDLgw8WpF9r4WIqgv/L5BnY+j62MQsQdgtrwTqLLr0gaq8hea4y9IyUCbzIgcw4DHhyGJCeE
	t6WOc0bcF77IO5ZCu7WulMycmU2lM4c2319pZAFVXOayw8kQYj0bNyakY54iNoc7H8l5OksDZJn
	uQZg5ntl67iPgLn4TIfRtmg1r1nxj4Rxodfl0p7Bl1VoS8qaJFn5FtXQ=
X-Received: by 2002:a05:6000:41ee:b0:487:1ac0:32af with SMTP id
 ffacd0b85a97d-4887197853fmr26855385f8f.51.1790612401692; Mon, 28 Sep 2026
 09:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
 <e801211b4c71ddd919fa5d7b9c859b86addf3fb7.camel@sipsolutions.net>
 <CAKwvOdkMK9Tj=JgsPeQj6_Xtx3FgZK2SWTSJVU_BJ7G17pDC2w@mail.gmail.com> <20260926195145.GBargiUSEEqjWPpuaK@fat_crate.local>
In-Reply-To: <20260926195145.GBargiUSEEqjWPpuaK@fat_crate.local>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 28 Sep 2026 09:19:49 -0700
X-Gm-Features: AclHuK80ygbd3wiyZigI_Z6HIjLwZPQopGivmPnn4hRCPTRgq5S7ll5QQxv7VJs
Message-ID: <CAKwvOdn2U5xy5T3kc3epPX74nr6ja4NBFVGCqLD4GPwKYX6hBg@mail.gmail.com>
Subject: Re: [PATCH] x86: uapi: ptrace: guard register offset macros with
 __ASSEMBLER__ or __FRAME_OFFSETS
To: Borislav Petkov <bp@alien8.de>, Elliott Hughes <enh@google.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Oleg Nesterov <oleg@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 12:52=E2=80=AFPM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Fri, Sep 25, 2026 at 02:25:47PM -0700, Nick Desaulniers wrote:
> > On Thu, Sep 24, 2026 at 7:54=E2=80=AFAM Johannes Berg <johannes@sipsolu=
tions.net> wrote:
> > >
> > > On Fri, 2026-08-21 at 15:45 -0700, Nick Desaulniers wrote:
> > > >
> > > >  arch/x86/um/asm/ptrace.h               | 4 +---
> > > >  arch/x86/um/ptrace_32.c                | 1 +
> > >
> > > This seems like a simple adjustment for what you need to do in x86, s=
o
> > > that's OK, but I don't think we'll take this through the UML tree.
> >
> > Appreciated! I agree, maybe with Oleg's review this can go via the x86 =
tree?
>
> Do we want it in stable too even if it is not really stable material so t=
hat
> userspace does not have to upgrade kernels just for this?

I don't think so.  Android, say, is not going to upgrade kernels just for t=
his.

>
> Or are they simply copying upstream UAPI headers from the latest kernel s=
o
> that stable backports don't matter?

Right.  IIUC, bionic doesn't have N copies of UAPI headers (one for
each branch of stable), just 1 copy which they do move to newer kernel
versions when they need something. (enh@ can correct me precisely).

>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette



--=20
Thanks,
~Nick Desaulniers
