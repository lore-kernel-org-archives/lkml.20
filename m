Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558686;
	b=S7lEaj+G5PnDoP12N8T8qpIQn0Nx35ou0XQRXNE2Uq944HnChOYvlpewXR1xtb05J5ZT
	 YeaqCldGyHRTE3JJ/beIVJOUAavZFg/Wqg4/5kXAEsglKGqFJODhfwwHM2KdJbF/Ov4xi
	 0+KBUJVdvL/ytlbheynixIezE6NnYKSY+PraBbm/PmFbad3FX+BQrIKwRYe3iHVrX45Jl
	 fMNmm5qwkaO1pV4vyutvOmN2HYS+m8hSPKRe6nXqQX8MTgIlcey/OfcYMEnG9XYW34yFz
	 r0vdUeSOasGi0JBkYrCdaZm60fIC7yAO2Vdfl08H2sKYjVZkhCKmDWj0ep7SBb6NeCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qh9VAxc0yOf7sHhKeEjPhh6+juHQS4PhRPr6V8+HsDM=;
	b=MIbhCOguLQ7XkO2W3saYNmRYRaO/GhFCyiJW6IRR4Hd/lxbERTsdRhodKAEd72YwcO3e
	 iVtVaUf1vVX95IeDQDaI22Jftxv/G+s019UUq6OgVSU+bBdX53cygAPMBxG5izE2RxTqA
	 WS/HqQlczuWp0Jj2X2qZWW1pIDQqr5+HhAWPWVvs8tiaENPhwm6umlqHuXpaRbvkw3L3R
	 0i0YYzP1EqKKXqMP0Y0XyzfiHyDr+F5eaJMShu8bBz5m1hDLHmbAhsQB2SvddI0+7CfX3
	 kumAQ6lvJk9fp9PjYYLICafd1ybzx6Novc1RMgzBS0ibhZTXI2p+Q88dPvvzAfTzFvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vwvHdXcj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860B7606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 860B7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vwvHdXcj
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9950a7530d9so1077237241.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:31:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558685; cv=none;
        d=google.com; s=arc-20260327;
        b=YbTB3W/DOSWNOpfSKCeM+ndRpwsWs+/2I2iCKRkQ9jTak6nH2d2Ai+0F848r6S5hdo
         aLrJvsie4nMTCC/WJzFpH1922jN+9Tcmlyu41ZXItmcQveKO7r7VqDErEQjimQfJQwmf
         eQM+4maIrlu/PRtYTfqd5GVDWHcCndieBoeyGTghrsRJupg6MzD1Xndkb+RjcgM6iTFE
         ZwnmIe9HP33C0NKqujZm9LN060JzrmiaMppmv0M/Ej8ojNn0c3PQIW8646EGu0GHXqZN
         W/drTjSXIQ4f3dlwLi6R4Lf4FCm6D0Nx0tiothcoluMs7CbSEo4f3Bc22zzor8WEtio1
         S4hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qh9VAxc0yOf7sHhKeEjPhh6+juHQS4PhRPr6V8+HsDM=;
        fh=G15KnZKIkpm9ch/TmUxGeURrO6Kvql9TvVEjkMSrcqU=;
        b=D4nc2nk27LhUL26Q3aJl6CkwS3SINNWzI/GjiFzxCTG1yu0cHPTmMpWRYEV0imNtM3
         WEknrJLLbxcYdR9d9pTw/1Io+BBWcLiZXOau8VPXEh5KTPcquYJhStSAmnEwaLv2QExH
         nhR8sYmt5TUlmQcHpPkueyi8u7MESTd+rmWXOk1V0zdAkNLPuVqDKJ1/ur7jZ6/rO3/v
         THmtOitgoL1P1an64eqf1IsBesqBdV80WYFvIaowdXcfLWxUJPNU/tY1bw0txITbUaxg
         JORKCOFm0y9jW171sxyxAZgGXVrZkvtTPwPwmRacmnjWPV2sLit4tZVeS3fYm6nKG0G0
         Es6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558685; x=1795163485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qh9VAxc0yOf7sHhKeEjPhh6+juHQS4PhRPr6V8+HsDM=;
        b=vwvHdXcjDbzxcP1qAc4+OmygMV6ohjmaT4r5PuomOh6Bhv42hnUThdRbYnHJbsS7Mg
         gtdCKhK345EGZAIzwvUI6uwiE4PzhzH6vGYAB1QbjXWdtONxBesrGEIVhLWb++vhtCw/
         RPtIT5hAlZQfR9hjHicxQ4ql9bdGqpMDU9eBkxZttf48rDInvMMs6Z0mNbsh1sqoHMGt
         0aKpMjflHl3Pw3Vd+58l2SzwKr2dSoQigJBrZPIiLxVYJzwnMBHMBvEFhilnE+mIhwPi
         N0YR/9DTKvEH5FynQY3K13xwscohZ25m+WB+QCKDXqigoeV6hSlFoA2O1m+2xEDvGIfs
         wHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558685; x=1795163485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qh9VAxc0yOf7sHhKeEjPhh6+juHQS4PhRPr6V8+HsDM=;
        b=a4cZklxBFJfsPIveL0HqhucBBe0pe98lSwUMFhKqHmFgILBoxzPtQsieltSVxY6O6V
         LKGdfenwzy+tMbOsxkbCYNO2bSQ4VXPPc3V8OPDPlfcYv4xW4y1gelyV30wvnVbEnnCb
         5U4t/uvXNeJpyzl189RZa+ESiJHJ3iFFm43GGAWgrGbXg/uyw9G94JojsiH7eeHfr9ys
         fUPbx8vL/DU1d9olKw4b9kaTWcV3INgS3Z0NCxmD54nC4+4BxpuWVTAmCBr8hRbnfcaC
         MuKLBr8US1cf6dCal4cJb4gOynNfENbSIQ6AdnvXvewmPUgyxa9Ybrw6JZLTuserJ7ur
         3BIQ==
X-Forwarded-Encrypted: i=1; AL+hErF8oup0oFeXx1JBQ7LJoA5uulv/XvXrPYv14nuo06RBT89OjvydjM92LBPPoSxjTzULqWnOnIDkSVNGjNk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nN7n9riFPKUPqW2vqiDAJeiiPdSELrcqcOL94ZZhoaIkpETA4
	9MH3eue1l/MZ/Ezo/4Gun5hTCcjh7hUntrdsG5y5GsUwuhqUBlCJ9xvGXdGRSUsmIUrmWPZsz2D
	mB7KULEOmu+AnNqkMdGJy/FDb3AEdDYfvS9I5CnM=
X-Gm-Gg: AYBFou0u5m8BifS9yzwhJChUVacaM2Q5e7LcqTL+3hW/1vJfKlC5q5BGyWgdDANQM33
	y0lO6m/u9zBT3qvMSGwV5/YekBwsZrUZhTGTUbZr+yURQuSoL7zAJjTDQQ6i01JNFP6aCIJloW9
	RZjXFLW8mgNWxtkt+0cVKD0pOCJDSoeiJy4rjUZF46kHJEqDWbwMT3l97CczXddQys8gJ6NFNIT
	O7e1Be+X1pU9OeASWmwaM/VVvYMrU71HqsR7d/5XM9GJKI0PB8Fd2gG939hBBbmCfF4hWc9nyts
	1BXzj6XX5KsjfeWbsqRw6qI8zGBD6cTBAl15/yczd4dMZz+HnxJA0QSOMPcR8d1SPqIP4/GvAUq
	p2aZvmMQ250dA+rbMXNgKD7w9W3OHvWUpUUmDVHeiqWDLKylNoYR3LFiXVdERCh08WY0YqwskFD
	YikvVOoXiARVj28hFOQSPydNNUfcNE4+wjkajyLIK3o7m/UR7c9LcQ5YsaebNImLMMeBnb9XlTx
	q6sM93VtEO5s9IWgxL7tDDf0UtSgmwpMjjB0cHXU1H6eH5ljzfOW2xpHWJni/T1bDTHaMB/
X-Received: by 2002:a05:6122:512:b0:5cd:590:c22e with SMTP id
 71dfb90a1353d-5ee34b160edmr531605e0c.21.1794558684447; Fri, 13 Nov 2026
 00:31:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794333957.git.edumucelli@gmail.com> <cover.1794337724.git.edumucelli@gmail.com>
 <6ad95c1a6eb524143a38ef9a0d4fd87b92ef1daa.1794337724.git.edumucelli@gmail.com>
 <undine-1794547280843201319-34d0935dcdc44d3a@undined.local>
In-Reply-To: <undine-1794547280843201319-34d0935dcdc44d3a@undined.local>
From: Eduardo Mucelli <edumucelli@gmail.com>
Date: Fri, 13 Nov 2026 09:30:48 +0100
X-Gm-Features: AclHuK8SskzkyE6lr5Bi-ArH1tX0oRKTmCUc2F5NgsXgtlf8OJuRKNQ5Xe9Uu6A
Message-ID: <CAK0NWSO7ieSgooH94PY4g771CRHNXVas08cTrMnw_vt+Y3h+-Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tools/bootconfig: Preserve values containing both
 types of quotes
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: akpm@linux-foundation.org, rostedt@goodmis.org, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masami,

Thanks for the review.

The parser currently accepts the value, but the tool prints an output
that cannot be parsed again.
I agree that rejecting it would be preferable than supporting it
through the formatter.

I will drop this change. Would you prefer a patch that rejects mixed
quote values with a clear parsing error?

Thanks,

On Fri, Nov 13, 2026 at 6:21=E2=80=AFAM Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> On Tue, 10 Nov 2026 20:08:47 +0100, Eduardo Mucelli Rezende Oliveira <edu=
mucelli@gmail.com> wrote:
> > An unquoted bootconfig value can contain both single and double quote
> > characters, for example:
> >
> >   message =3D He said "it's fine"
>
> Nack, I would not like to support this unclear value in bootconfig file.
> It is OK to *detect* this kind of mixing value as a wrong value, but to
> support this, we should support escaped quotes and force user to quote th=
e
> string.
>
> message =3D 'He said "it\'s fine"'
>
> But is there any actual usage for supporting this syntax? I would like to
> keep the bootconfig as simple as possible.
>
> >
> > xbc_show_value() surrounds any value containing a double quote with
> > single quotes. If the value also contains a single quote, both compact
> > [...]
>
> Thanks,
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>



--=20
Eduardo Mucelli R. Oliveira -- http://eduar.do
