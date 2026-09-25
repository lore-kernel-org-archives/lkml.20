Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92204FB9B6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371565; cv=pass; b=RqW2nUlcOUFlFORQziroLwzBxkS0zfyedLXGYjpraUcnfKm4IW0LLOQe10crK34Nbidq78rWNrTUg8IwZLreB6Qh9r3U+Y6faGyHhdWhw2X9wyfseUYWSFKQr5P9TW11BKlw2iP5UChQ0JQFaOXmAvvc5TrGQEavUr6Pv8AXWZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371565; c=relaxed/simple;
	bh=vVnqE9ewICJyUy6ZNzAvR3l5JpDQPpcbhDYQ9tAgpNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rijxGCSSrLBxR1wGI7X7XUI1nNoCjtDmn5t+C3Vi5IGuLD9IbuY0FTGoCqOUjgd6HO72sqPuA33nvfvc69RXVrLUYq5CnA1nOW5CvVWTHpeQFT8LSWh1jM9E2yuwZsH5AfTxDNPSJsdGYCX8B+NIpBx5kb318/umsVh+9bT9Af4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NXQj5Su1; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NXQj5Su1"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so9074605e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790371560; cv=none;
        d=google.com; s=arc-20260327;
        b=LsbOi5NsWDRPNx2oWpkyqiGiIifPu4/WiWzj/NuZb98dPq48avTtpUoad3uSrs+WkL
         9WyWvheQEgML/2+vvBmFl2D4ZowtmvGGtdgpEX6HopfNEmbLcoPtIdjcbN4gzkwQB02U
         fGvb/bRakvnjER9rbrCB/vZ75KQUBvl42GVlfA3UXSY6Jj0jTZK4nfsDp+8JFKV2uM4o
         sQ5FriSdaDOUz0FCAG8CQi4OvnHClwUaHcvPFZcs6J5mpTuMKjCUxBwebtF8rdEreDoe
         Xq6SYRlqP8ViuS9KDkQnU01FUFSlK0a6XpsM6Yxj+/yj3PEyamSiTmAhMEdn6NeQenua
         9Qaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZBkr4Ro3niOwydI3OdaV1WcaDVvXJ8dIflx3msX2no=;
        fh=98sV+PS9Ti3KJM7PN1ziy01v+VrQfe/0OpBUt2EdeEI=;
        b=UWX3C+WInjwZmP93e0uw1sQskuSv3r82MwM9iVb65YfuIeLuGZJhPpuVryfZMlYWf8
         gL2TQoqwaH6RtjMG7gxPAP3ZgB3IFYJLQomqn2zM2r0gKpcAAas6iMDHpU7gxzkGPKLF
         7mjtKDdFXXfBt1YBcYCqAX/QmBRD/LdTTMo1qqXJU8X5wMK6nCT5AhrRSaOyQKGRrYvY
         qTkd1+u8ixg190H7sWGjNbLvCfuZrmUAztZY4bQZyV7EiklY6fm+vlRKEQaS6CNhdZ7z
         h1DwAXbIH6o0xPoH88o0s9tHg9eq8ZD2zZ7l5uOVgURFt3dbOorq49ECzTxl4jhj/54C
         4jLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790371560; x=1790976360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZBkr4Ro3niOwydI3OdaV1WcaDVvXJ8dIflx3msX2no=;
        b=NXQj5Su1NyY2V82z6GcbwpZmEgoOqbVpBN+XI5JZ2jspyD52wIfhadgoFeKrMAiEv3
         TiO32ZXy/pgrGlO8iJlkiOF17fvb/S/A4YGqNWBZvplAb+Dq1YVvnil+HDr4xLaxwwxh
         blE7uGTpY0L10m5Nv0USCJNikxUu71fr0kqMMQtO+wJth6+/s8AEL/ODRDkZvTmrJoDF
         gT+2NioPWIJoc0/skAgGejyELUFvLVUDyToK7hDUxfOPjyC9csNgBzQA8MOxTb145lL6
         sLjHloH3yHoEkbJYG3q7xleGcNoxMwKkm0hy8CNeG+4NT55praz7A/CZqZvxYsxmPMKL
         otQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371560; x=1790976360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZBkr4Ro3niOwydI3OdaV1WcaDVvXJ8dIflx3msX2no=;
        b=p94NTzkI8JFFum6LSRofI1Ossf6MFj/jksUfNnabW0opDmnbWVEayQjU+R442ZEl80
         PcQUb9UbksF1mJfBibj4bFeGFAL95m3As0KPTCKwF/hUim8jzL/DUwwmR9DCe2LmboS2
         UHBBIoJTCGxPJJFQ4Ou8fIst5eGboiiTq184dNdrHJhNOUy9a97sr9pkyfG1x2JWLSwI
         TYB7pMG7aS7vmveh40zAVewhJ4gFQgA+/Fp6iYG9AFJHxs0u/2wCQAYt8Rdkfy+cplSr
         7AVijIpnucnn12SPYe1foq+65Eh5bGT1Q6z4l2e2LV5mN+ZLeE3dvedRwPHrxOxn93sm
         6N+w==
X-Forwarded-Encrypted: i=1; AKwUvByMkEMMqC06byd+esoO5Z2NjRRwCmxTf8TwUjH1teFn1edeZdXZINz7bZXYEplvuQyLzrWWIuWGZWF8Xe4=@vger.kernel.org
X-Gm-Message-State: AFuF++lKbHbNkInx8Q+PFVzSNNLoVUCD/ccp4nqiuHO6o7Yto+MtGLwk
	HdQcq80q/gNAx5tYlSjtqysoCTEWn44RNESpcU5H4TSsVYMt7prmr7LgVj7Z6tsVMDr090OX6iH
	DA69JnORl5MyDunBUipJIhMcWcAdejK26MdDagqpz
X-Gm-Gg: AYBFou1Kw+CdX3iEtRF8h6Sb28vAebaEHYYcvhw1rtuTkF1VPTnR1IP6eG4HTSB0tJ7
	ZjpIuigCgsG52tQRbiU2nc672lCIhpJmfx2SiagkU90lh/GOAW6Oi4/7KpPsi/uQGY2kk4hTNe3
	5d0LsO7k/r01xyrEmI7oO1VxNFR8fO1Le4OtTPGaUJ2m2XZld/0+nboleenx1DXdSCAOaM79ZYD
	kGaKM3QBsFUWWOkS0PgCE/Zjr32u+fbBUQ6grrqQImqcplpIcZmnJUPriGlYHwvwC+wIlFcOcJa
	yf7m8VFct7JOowfwPzUtXQyIkgrqXzfPWp8X/jMoU00ZrxfAa3r3GHCxnuXtQEeHx2I+cAKtgJ7
	n4Zz2y6Ov8aaonR/8W/x0+nza8nqKOONU1WvqspdYc56c2xnJXNPoyZLh5x+MDXeQ0lwv0ZQUex
	CYxvuczQ==
X-Received: by 2002:a05:600c:a16:b0:49f:eddb:bcb1 with SMTP id
 5b1f17b1804b1-49feddbbe6dmr72387875e9.25.1790371559677; Fri, 25 Sep 2026
 14:25:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com> <e801211b4c71ddd919fa5d7b9c859b86addf3fb7.camel@sipsolutions.net>
In-Reply-To: <e801211b4c71ddd919fa5d7b9c859b86addf3fb7.camel@sipsolutions.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Sep 2026 14:25:47 -0700
X-Gm-Features: AclHuK-P_xUsgO3opj_R1RrEcEd0-ijVSs2NhvjFANGxEbSXnfoNvN06zC1Vukc
Message-ID: <CAKwvOdkMK9Tj=JgsPeQj6_Xtx3FgZK2SWTSJVU_BJ7G17pDC2w@mail.gmail.com>
Subject: Re: [PATCH] x86: uapi: ptrace: guard register offset macros with
 __ASSEMBLER__ or __FRAME_OFFSETS
To: Johannes Berg <johannes@sipsolutions.net>, Oleg Nesterov <oleg@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 7:54=E2=80=AFAM Johannes Berg <johannes@sipsolution=
s.net> wrote:
>
> On Fri, 2026-08-21 at 15:45 -0700, Nick Desaulniers wrote:
> >
> >  arch/x86/um/asm/ptrace.h               | 4 +---
> >  arch/x86/um/ptrace_32.c                | 1 +
>
> This seems like a simple adjustment for what you need to do in x86, so
> that's OK, but I don't think we'll take this through the UML tree.

Appreciated! I agree, maybe with Oleg's review this can go via the x86 tree=
?

>
> But for UML you can have my
>
> Acked-by: Johannes Berg <johannes@sipsolutions.net>
>
> johannes



--=20
Thanks,
~Nick Desaulniers
