Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852393403E7
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746293; cv=pass; b=dvQax8hZj8OuYsi0USM9DcrvmSQ8F84QnAtmEg4eQwJUHS8sM8y3wjWGdWJ2DEy7OrG80UL5q03G6vUTqUFBgMp3eWQOaZH7/MO/GdcLANJHNwQjbNtLg9ysT94hBIAShm8y7C0XruOpkYjQGh2ObV6VNeUqCCI27Uj79suWTWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746293; c=relaxed/simple;
	bh=IWM92jlv8+bItDuNLx6rWhbjIBftHslCpZwGdPKFMhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2ePBgLdZjIqJt1JtmSlc6zD5FT9ekpqpARgDsQJ9wMcV6COkzZLV1zRvjsENMB4Ks6iSZPPFMANQHsXx91EvhkQJK6weeIWWpc5CK3BnYiVN9w6zWaw5zp1TnatwA04dG9tXvqfBKPJVSnzJ60NRb7kAlB8lzuc4MiR4ZW0bog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPhi9XT8; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPhi9XT8"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67718201466so705123d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791746291; cv=none;
        d=google.com; s=arc-20260327;
        b=pHKzq3aqx+m0jyB4ZpAGeT6s9M3Ef0icnw2uyX8L2qiwn3kQ78YtlMbVDNvVMjWVUx
         LEApP3j90ew9B84BswsBE/7jWbec/KDGDRsJ6hWV+QLukIE+PE37vDpeSGV9gI8Ef1QW
         cXUYaWzzJ/L48rOa1VEjc1FZNrVydxJvjcA0Ih+qXYc25O4ZvNtlyAiFOKc9mUYn3Iuw
         fCu/AjKcA/0Cx1+TgRIQ1wIkNMNapVOeE00Tb8nyOQxw5obZw1mg27AwDYltvlWd1Y/o
         zXTmkuznWLpKU/zz9XEAfl9tuJdS9+ObcwiKppGSXKHtjwjkVGd+tg6cXJtz/7ewwoKn
         +c8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yLIfFMIqaxLJpdrdg/vzw0VW5DZQ1Rbzs/ibWNjyDT8=;
        fh=9d/VRcRPE1fL6K0NGRtDhkLAI2xTow8g7W9KwN2eGRE=;
        b=QOYmSwjOgz6rq1+o5eSnTQYVJieEk5OptP3T1t1nxTJxxvpSVDh1Ii1HfCtG9KRfKN
         ifsOl8VSoYRJVJWlJY7m7PoDcIhHXPFRgMByK6OBG/htVERKfW8a6KGcnqSsw92wQgiI
         Sseq2O42zqpdWUz6g+4spPmatzqVYrOiuWuSf3BxWLoLXxlzQtttmj0+wBmPpVWydqWs
         8DmtbUDaL76Ni2LBjjlo6mIf4WDR97x7puy5ethclILPNidB0CUKuy174QBNf526EZeV
         3qu2Dv3K2RgWU8yEzFjIur/85nLTQ3MbGhosWL2ICBXu1YjxkY3H/XzIvUAH19v1Rg/C
         h+rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791746291; x=1792351091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yLIfFMIqaxLJpdrdg/vzw0VW5DZQ1Rbzs/ibWNjyDT8=;
        b=BPhi9XT84rYDt+zxZ6gXkQxgHxvWlpvvlOPox30hZfYx2xsDsxCCGmjdxQ4kqO2uoT
         mehK5dqkmYwyd0P93bROzbUnemwIjqF3MsB2Etm0u9qzrXqIOXjzIpuFjvw+000+/e00
         kimg5GnrdclIHLmmFNXWQA/ErOIg2Z0P2kVHwgMumn1DWs2OdlnIAO1nnudzOocBmzTH
         VhcJUNy1fQkJ3v6yg/FMXvsbSB+zfRJRGE72XKO0/R1ZfFRUlbXs+IYX5Qzb1Wt2BN9g
         GITHrd5GN7iruDqYacitZ/MX5LmbH/Ts6ZjqGsC5Sulor/LO2OqWIpi1GmnN5cOU9W65
         ri6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791746291; x=1792351091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLIfFMIqaxLJpdrdg/vzw0VW5DZQ1Rbzs/ibWNjyDT8=;
        b=F/0HiEcHKZm8s8mR8hY38Cg2mydDsVgz2XpGFJU/J49jvU8pUL+ocHKBmjwO07tGnN
         KcHThWhZXnMwuVrCZpx6K9t/hReXj9u90PTeokTri/h4qOzdnnHAmojkGtxkQKKk8Djn
         Jbdpq8CbaZwUL4nly4Zsci08Cu0SLIY37lfGngHncvnY8v0n4t4oE+F0kF1LBr6VG2+h
         8ONimK01M5AevSi2RnrfWNqYlw+shW6FopYjDQBZgrFM+qVeMq7BPM2LcjPjblHR+3Vg
         3id2tc3tSfdkGZKc8Jae4FZ9H2kGSMvK8yGEkICKd1y1U/PShWqDoMi/P3B/Wk44VTQM
         vxJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxflZFYLiytigB1Yp4qibbj5nbAYN/YXIx5zS9dGSw2DDWEOBQ6EQ26TuwB15RLoUJS/pYFI4N05rszB3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHYT86B/sxcw24lRvLWUoXmHbZ3n8iKGyxOdSDimZ3JRha3f/M
	NToNUAR/QLLpOf0YCJcBLx/TpnyyW1RBeOYAML+B+OHZ2JZRmOOg6duzKe5NZznfM9Di8qxrOgO
	y8oQDyA7WDHEt9gtEQ8IGLLF/jwx2J3w=
X-Gm-Gg: AYBFou1GxGD5QITQMqRn2EeNTa2F55W1CKUrS0CcWE5Mn6wFDUxsAe+C8LZStQw8jRR
	Riw86PhPcUGcYqW2zsxjpatYTLt2MlLq5YI44Fw5UfjqTzXLwqA2CQ842fXq4NoVlxjKFozxlGs
	wo9f6bOr2rAJZAgxupUQVnX/8gPIw41a8/tpxhd9vP3a/UNHcURWvaOvRaCzs84YZjf2/ZMrmYV
	F26hrxqJihqQOzyX5PhCzgA8/dvwe1Hi3tpfCOqT6CJ3fMwZ7cRbHEy3zYvolI8eMII3Bz8ZvZr
	VNTU7hqy2lzWKP0zFtIequncrZVidPu6H/pb2C5cLBAflBBaOTdLLnEF1IdEW6IMnIUbJ6PcZO9
	WRU+sHbdlSOxzX12Ci3PL+0zRe1w5YLDxzOvDhvhbi3G3FS4uR3Ek
X-Received: by 2002:a05:690e:43cc:20b0:677:d1d9:1277 with SMTP id
 956f58d0204a3-67936aa750cmr1760899d50.82.1791746290718; Sun, 11 Oct 2026
 12:18:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008220433.965791-1-linmag7@gmail.com> <038bffb2-e40d-44bb-b7ce-53e9de32e50d@lunn.ch>
 <CA+=Fv5QvhYd7EqVBYKWVgvf92SLE=FjE8EYcZvUQ7HKdx2kc3Q@mail.gmail.com>
 <becc8f95-4650-477b-b1c7-cc4952e5e980@lunn.ch> <CA+=Fv5TU1rOUimi8f+e0R4_48ki+X3qzD_+1QPyviTnJz-irvA@mail.gmail.com>
 <c8bc138e-2d62-4ee8-9020-5f1091efe015@lunn.ch>
In-Reply-To: <c8bc138e-2d62-4ee8-9020-5f1091efe015@lunn.ch>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 11 Oct 2026 21:17:58 +0200
X-Gm-Features: AclHuK_XYA2IeX8EB_wQ6S_Y8XgepVmJIFtOKL2to5kfxrIk9XqHG7Csp2E4u_w
Message-ID: <CA+=Fv5RiKoE07MVn5qRS1+WtLXUVO+HrXyLpVCcXGoCb7X6X3w@mail.gmail.com>
Subject: Re: [PATCH net-next] tg3: normalize inherited M3000 register byte order
To: Andrew Lunn <andrew@lunn.ch>
Cc: pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Sun, Oct 11, 2026 at 3:33=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Oct 09, 2026 at 02:52:57PM +0200, Magnus Lindholm wrote:
> > Hi Andrew,
> >
> > On Fri, Oct 9, 2026 at 2:09=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > > > Is there a legitimate reason you would want the bytes are swapped=
?
> > >
> > > You missed answering this. I'm guessing, but does the hardware offer
> > > this to make big endian machines more efficient?
> > >
> > > Please could you look at the driver and think about what would happen
> > > on a big endian machine. Is the change still correct?
> > >
> > >         Andrew
> >
> > You're right, my earlier reply missed the underlying question.
> >
> > That is a plausible reason for providing the hardware swap mode:
> > it can accommodate big-endian accesses without software byte
> > swapping. I haven't verified Broadcom's design rationale.
> >
> > However, Linux tg3 alreadThanks, I'll expand the commit message with th=
is explanation in v3.y initializes misc_host_ctrl with WORD_SWAP set
> > and BYTE_SWAP clear on both little- and big-endian builds, before
> > this helper runs.
> >
> > The helper restores that existing setting. Its swab32() compensates
> > for the device's inherited register state, not CPU endianness.
> > Subsequent accesses use the normal driver path, and the separate
> > __BIG_ENDIAN handling for DMA remains unchanged.
> >
> > That is why I believe the correction is appropriate on either
> > endianness. The runtime tests were on the M3000 running big-endian
> > SPARC64.
>
> Please expand the commit message to show you have thought about this.
>


Thanks, I'll expand the commit message with this explanation in v3.

Magnus
