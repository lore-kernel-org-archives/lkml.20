Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2719033122A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791499392; cv=pass; b=im0u/C98QAuoRhFcLp4Eahf+lXRGZFJS/v1opabhfa0LXdhnDlR1U7ANiBq/KVkyMbCBvYpOEtIYv3mrcTWKG3/sgSzSfCqg9vMtxCM9WfyzejP66JsRqCcJ1l8eK9XinkbcIo+nzNznhihuK3q6W0RHj4N+n+1cTol2Anua4JA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791499392; c=relaxed/simple;
	bh=Jkrge1vcQmIVS+2wnxJm+tmMInEAN+x4OhuxkeyqqXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bo/2nU63hIDAl9qEhw8hErodBKwFvbDemQuvIPnLgPvbVadwqRILshBvITdL5s/3CWyR6OJul4ALfJC/B95BarC7zwB+KvLS/CfJT+zqLFLcWti+pz/fFmrds4Rb3IQWFTDdv/TBR4HGnYTOgNOyW67Zre2QdOy0POBDQwMjMOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqUdeWPo; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqUdeWPo"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67687f279b3so3528380d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791499390; cv=none;
        d=google.com; s=arc-20260327;
        b=oP+k83Kx3Edk0jzY1J63fewHqxakRHNujIok7ooyL1mYv3QxUWa33ivvMMZPbIeiO7
         agVriOkY2kWYLs1zfI9+9Wm18LKK/WYoe3YeeHEopIdI9Bxnsnzw4RC7tbqeISJvl1nL
         jYWlaRXjTBlXivo3W4Y2Yr9kkBToGSJyybYV3i+pJGiNbzpjNTT9LnjSZRNs0LQOYhyM
         CZE37IH1bh/U4JMTS8HQsq4PRKzDapz3I8+W77jAZc7Yol+lH/n1cLVGppREuYFzSa0q
         ILltsdvgUf/oesECws2KP43Q9/6uev1XDsadRC83rO0SpLkNRPicKmvMhsegtu/vHSJr
         8Qsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T27sSsy1//nGPCZ2xCeEy5WnCN3gvZtuuWAjBUul8kM=;
        fh=117v1dmLCd01H92o56T0gCwU6dHSP15Ma7Yapc8EP6M=;
        b=H1d1kf8LFZJrEvmits9rdUqFYOUDRU1y+yxhLk8BHyn5rSFE/AmFB2Gq4/uKTscAUy
         bdVpvhY3qeD4BWzxI/L2DY9TO0+dGM3tVdCxGvAXyUL+PkStqiHQYw2yGhxJpcqLz09c
         iRB09zh9766dwFE5oJ9BB3fZW/sPPseIN35TJUZzkfCmhegvvCIvTwHQca1RxGwl5MON
         ZIkr4HZ+dOSaLR9fcSh20rrh8Gp4pTJu0o5CIjYz1DFxT78T9Q/GT3eVzZOTMQOf5Zhb
         YK7bfZNlcEOva/91SPOSU6Qr9DXXWyUff2lphNFsjrZ9mClXxjVKi1yd2N3T8ETtpZnG
         /1+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791499390; x=1792104190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T27sSsy1//nGPCZ2xCeEy5WnCN3gvZtuuWAjBUul8kM=;
        b=TqUdeWPos8qv/AQUh43RFvEC4NxJep7w1ZNcLLjbkZxwOUXMqBU6TXF4mdWDEVC9CT
         4AoNcbthCOQjDTpajp4tRBPJbk7M2xV6OcE72Jeznel0oKu0QgyjTM4zz6g7IpzXBLPm
         85kawtU5S844Jy0QTM+kay2JyQyRlZC5gCBK7fMdXs0s11hrcCewTQ473c1BPciZ/38I
         zWeOC2EOi6nUEY+1ephdkt1Q0gLmAHyYU+SlQOVpyMQdSzylTOLMAbLuCF9x4hICnZLt
         86zZ2NbAMrqJPgwUxRHBj+674lQHTPWVnQQXrN782Xh7faSV4/CjmeM0Wosp6+IniAJ1
         EEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791499390; x=1792104190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T27sSsy1//nGPCZ2xCeEy5WnCN3gvZtuuWAjBUul8kM=;
        b=fhr6C1q7AuxeDnbVpwFx9Ux+60isWo99c/0ZDOfCZgg4NGG3eEI/93mUOuTJvt/fY0
         MghU2UUxUC7NnCYc4+ULcuo12yycrOWVOiWEj2V2cFa0WMTCwRe+dhYeKLeoGzdrGFLT
         OOAUjObff/VEhPIfPNR3prRsfzR7jlcFOF7jvd87QxjesQTC7VZwt1YJAh//DbRDO2do
         9B4pz8UGcdcZpaP3e5JDQxWFZ5kGvMcxv7SVMFQLbGOYbt+I656Z1AOXhE9c7RrMS4F3
         mAqDyt3DS1DfmfU+Y8YbJNF7hNfrPfYTj0NWpJTJjVBBp4KZ1AZajtlu3pFtk1eUK20l
         PNvw==
X-Forwarded-Encrypted: i=1; AKwUvBzpHgMDc74xxfUISjtGPt7A5zeMBadZZhUI4DIidA116lQjk1onXfBi8Efq+LkSgIe+hTMKc2cgwFaqyPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAeRAgIOnHzRr3bXzcrueFtT/H6/BfN220BA0OX2WYCXttGrSp
	jBiNrUsBXyHJjQC0Vc6pAyQ2HLkmr5r++NLGxE9TyHxK/gQe5wxCsTi6XI+IOp7uFyRdlGDl88i
	APh8xaT3Lr9jOpP7cVJ/2UV9L2XcjHxQ=
X-Gm-Gg: AYBFou1bWs/bY9lKB4euy9/Hzt+6OcTuKiG0JjI8KNvwCmz3AAB4N4xgP4oomCtmWr9
	7jWOu+zdyMIFC8USpukun70MJRbA6Pl4iDVh9q2sHms1wewAND884mXBsSZpTQM/sBSSGU/Bn7F
	7Zkt6NZrfM+X/NXIzdiKvuwLrMS3iMSBD+FtwrFOVqDiUAgMjoMDFfIxucxfJWcG0WayMF0iu+Q
	t+Vuc38MASPqCJwb7rwtl4GvMvusgS7QhgwmRZeZhiNECpgx9DLo6KB8hSFIZCQM0oE4685Hva4
	T9oFgof9JbYTMG72BgzMLS1EHCDHYId8g85IumKmBga/vBU+/VXrQbk0xUEM1OyJOdjkuchnktS
	7qOpsK5+0vEK544XDYApGgTud0kiPMnBfTZHQYeCAMYSM
X-Received: by 2002:a05:690e:168b:b0:677:d251:cce5 with SMTP id
 956f58d0204a3-6793602668emr129309d50.43.1791499390077; Thu, 08 Oct 2026
 15:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005200123.146822-1-denis.benato@linux.dev>
 <20261006081116.GA830598@ax162> <0cbe9bb2-69b5-4d6c-a780-07a55d40a63d@linux.dev>
 <20261008164736.GA3975095@ax162>
In-Reply-To: <20261008164736.GA3975095@ax162>
From: jim.cromie@gmail.com
Date: Thu, 8 Oct 2026 16:42:43 -0600
X-Gm-Features: AclHuK_qZbHhZtbNJ_NdJzWMdgJh8AbuPiXlIoNGPj1A7YcAc4zot7ziJa-OG9c
Message-ID: <CAJfuBxzMz2YRoHmsr28DjNontvoR6ZVfZ+AbAbOW3aHbsQfi-Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: install-extmod-build: install kernel/kallsyms_internal.h
To: Nathan Chancellor <nathan@kernel.org>
Cc: Denis Benato <denis.benato@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kbuild@vger.kernel.org, nsc@kernel.org, thomas.weissschuh@linutronix.de, 
	chewi@gentoo.org, abelvesa@kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 10:47=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Denis,
>
> On Tue, Oct 06, 2026 at 09:39:51PM +0200, Denis Benato wrote:
> > On 10/6/26 10:11, Nathan Chancellor wrote:
> > > On Mon, Oct 05, 2026 at 08:01:23PM +0000, Denis Benato wrote:
> > >> The tree staged by install-extmod-build contains no kernel/ files, b=
ut
> > >> since commit 4fafd1165b33 ("kallsyms: increase marker density to 16:=
1
> > >> to accelerate lookups") scripts/kallsyms.c includes
> > >> ../kernel/kallsyms_internal.h.
> > > You did not add either the author or the committer of 4fafd1165b33, I
> > > have done so now. This would need to be handled by them. However...
> >
> > Apologies. I used whatever came back from get_maintainers.pl without
> > much thinking given this is not the area of kernel I lurk in, but thank=
s
> > for taking care of that.
>
> No worries, that was a little unfair of me to put on you since this is a
> bit of a weird situation that most contributors won't run into (a patch
> living in one maintainer's tree that needs a follow up in code
> maintained by another). A good rule of thumb is if you have bisected to
> a particular change, always include the author and committer of said
> change in the report, in addition to whatever get_maintainers.pl spits
> out :)
>
> > >> install-extmod-build rebuilds the host programs inside the staged tr=
ee
> > >> whenever CC differs from HOSTCC (cross builds, or a ccache-wrapped C=
C).
> > >> scripts/kallsyms is hostprogs-always-y, so that rebuild fails with:
> > >>
> > >>   scripts/kallsyms.c:39:10: fatal error: '../kernel/kallsyms_interna=
l.h' file not found
> > >>      39 | #include "../kernel/kallsyms_internal.h"
> > >>         |          ^~~~~~~
> > > I would rather not ship an internal kernel header in the external mod=
ule
> > > build. If these defines are needed to build scripts/kallsyms.c, they
> > > should live in a separate header that is included in
> > > {kernel,scripts}/kallsyms.c that is safe to expose to the external
> > > module build but I defer to the 4fafd1165b33 folks.
> >
> > Fair. This is something I spotted compiling our training/testing kernel
> > at OGC using the github CI and my main goal was raising awareness
> > on this issue so I simply started that by sending whatever glm did
> > to make it build ahah.
> >
> > Please when something better comes up CC me as well so I can use
> > the proper fix rather than this llm-cooked thing :)
>
> Indeed, thanks for the report raising the issue, I hope Andrew and/or
> Jim can comment on it soon.
>

The easiest fix is to just copy the 3 macro defs over to scripts/kallsyms.c=
,
with a suitably explicit msg about the coupling.

Andrew, do you want it as a fixup ?

> --
> Cheers,
> Nathan
