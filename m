Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784AC4A498E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060860; cv=pass; b=HPTsYLDHUEPBlstOrwSrGNhd1iT073ullrzvwJ3qs/lnSwjoFbtkBEj6RNd0+0OwCE0NtAuKwjg970s1avAyaSWgI8558c3ZNiNQIVlz+WWQwoRvsaMT1J8Aopyqc5KjIoCCk/fdYFIx9691QckmaJBnCAq3L5d9wKPT2DG8kOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060860; c=relaxed/simple;
	bh=GK7c7qoHtQuqEPaLuDtj2LTHMuxiL75fJf9jcPF0ouQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLMWnGNyBbgP6pA5ZCNq7lwu98pRNuL80lxBqmvzPXqzX626pyEN40e2Um6r1krpGpioIrWbMiQRzR7erckqbFdLuN8oZ6bdJA3Z7f6zOFhiIFX/QFkXchp0/HF2HhIY0OxvZ9l4Y20Zg8u5xZGrYbLefSxxahKuabPirlZXT2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqfpUHkR; arc=pass smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqfpUHkR"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e515769d3so432292885a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:40:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792060856; cv=none;
        d=google.com; s=arc-20260327;
        b=WKMkPjwPWnU78PsigNqfNU4B8lnmKfJ6aSVTGji31m+H0us40rvS1HmbcUSaTRQjmy
         9xZjZehB05mYqjFBYns7T0/jbVieqqC2BgmHR2nV2+Sq78dp+YaQ2vvZAx7rcInV1P95
         UahXta1G1QxpxSL13nM5HG3E3qC3uG5tNHbOordNkzPDEasN2rq9uSwzMkJo+jbQdU/H
         Ew2IPqNi64WB0yGjZpxht/wAwObUyJ6EELGUEbCOq/tt19LlHKGxXhyh9iflUQA3VZQY
         4J5DI+Nu0kGiQig1le+oCjsoLaDZDEZ4hG/emsYixjzuZUznvn14XKkljM1YlRmVraHX
         Yqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GK7c7qoHtQuqEPaLuDtj2LTHMuxiL75fJf9jcPF0ouQ=;
        fh=Yzt76iFRHUGCeGf4oN37vN02RPowg6Ph110EhKruXls=;
        b=V1KmxLgFpt/lObKg+6Jl4J30cPc3ZP7O7qzc3aA1tz8ZJV4HvUU99BhgJTgv1e+r17
         O1OA3uWVJZgYzMfmTtOXGKOpbWIhXyO+2G91h5RPCD3hkU2J1MV5qW/UtjXSXE/gImf6
         E/ZHu1HpZ2tRL+Karzqh7VP1SFECjo8lI3yv/YSzITkvpHjMce6GkbMJBRenprMmNd5N
         3Iukq+5vLpjSRJ8KYgd5cY7XqkkAva6mj0vf7o1eL8qGFxtwkM9fF/WD1dM6Ooek88FI
         w/irOa5wgFLuoTV7yAQBcSv2nSEOpyNTOchecbf9I87E2CTmTqC2TMk+4vy3NobweHtN
         erDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792060856; x=1792665656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GK7c7qoHtQuqEPaLuDtj2LTHMuxiL75fJf9jcPF0ouQ=;
        b=eqfpUHkRQ7qRwTNh95n+xJ6X85PnYm8jyjqce+i/61u7J2eh4mE7IcwgCnkRkWRa0i
         ty/z3VliTAfOX7kOev3zWEmrCNTCIEGDLO2bSMksmnUOgoyQ9dBwikiBfjLLUm79k7at
         Y2ALdycVhCAMOGzSbzgPDwubOaHzcC1k8ovoqPvkkVlBErLjh0K6DxITkd7FH9ok6Uyo
         YOk3EVOdWTKTWd635wGaT3APppl/lMkJsEnV+0SQXQlm3tweeJS/S2FW0i2nDsg9PeY0
         V3h/SQAf4neA966SgByqTmC7x6MT1m13Bd+855HKw3XgbC9Ur50BKusXi0MGYwVZBMbu
         85eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060856; x=1792665656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GK7c7qoHtQuqEPaLuDtj2LTHMuxiL75fJf9jcPF0ouQ=;
        b=Vvdk8S90slsttsUMC0Flqj87gXG30MH6kZLhJckLzIlJ9ADkPz5YdYxiY/MbEq4eQr
         6Bo7xnqMhk3S6K52ZQ52sfWXVHLSwTKcyM2qPHMq3O9BzWwMViONyd+3pP4xzKlDG4b8
         T7NC8dlkZE1WHD8kJlSlrb2IEOV+1Om5jPWMHJoLcwv1AZ200CQ1hvToN01FMGpWjkjR
         1P2fNG61sP12Hz8L3Nr8Bp6zhOEdSE99YLnCfzLRE6eapL+RJn9//lwFHiyr+qoKnmxC
         rvl++F5JhdaqkOWbILjp1uf77k7b8eeflNTokxSgJBkE1ouPq8UGBoCeHFNIeUdcT43k
         dhVw==
X-Forwarded-Encrypted: i=1; AKwUvBzLEyv0P07+1ikQgU7CJ3eZ7FOxOAWNlMuj+lOfnCc00Aa03AJEQFL3O2jXJuOfITM4Kx61A5ntdU6q6XA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1EInZkDHiYU1iWrnUL/M+QLTZ8f2csjgAxw+x1333CZi6iLvv
	1P/wVKkEprW6h/B+cMICd7CNY7aHbE9DzH+Fbf6PO3dVRwQ3eJBmE/R9+Nu/hhZ92C9LKQeI/n0
	6U1YWq1rkXikzPNcfMCly/fRajrT6Yq8=
X-Gm-Gg: AYBFou1nq5XsOBLbs9lQXln9atALgumvn5Wb7q++4DSZrOIVsn99rNKloUxl/HyqkTd
	n/MIDNNu4hpt5o10kv22OrPec3rUvpd1MVFmQEKacZ7055mc7+4+TlaWlkqw0XmTucrsXsr03aG
	uUjkD8ZmJQ6hGbgexLeX198rg5GhARi+vYEsdSwXEQ2nRofats2EsmSmTujhJOUusjEjqBDJTTo
	1lvwKRSVMWLrlZNyxxo8U4x8LyLd7y4fTn4KLxwBBPY1T4pqHj3kDHW7U1XDAAGiTovK4A/B8kw
	YGVSEAZJzdNSSOtxPC2aBN0rWLwdU3fttS4nwPqEPwPgtDIcjc278CZX+KfPGRNO2YPnWuhQ+t9
	ZUpSYbGOeP8yvGvjwbDFDN53HYhv86ldSj82AGhdlidctxw==
X-Received: by 2002:a05:620a:44c1:b0:93e:6e59:ad16 with SMTP id
 af79cd13be357-93ebd1dfd74mr3037179085a.29.1792060856144; Thu, 15 Oct 2026
 03:40:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928081450.19340-1-dilddream31@gmail.com> <CAGC3ukQ7gX97E7pG0Oy8H0cnmQzoA1038io+VhrBogPB3y9dDQ@mail.gmail.com>
In-Reply-To: <CAGC3ukQ7gX97E7pG0Oy8H0cnmQzoA1038io+VhrBogPB3y9dDQ@mail.gmail.com>
From: =?UTF-8?B?6rmA67KU7ISd?= <dilddream31@gmail.com>
Date: Thu, 15 Oct 2026 19:40:44 +0900
X-Gm-Features: AclHuK9ftaX0YjG2NCtLvWvZyiH7eh52x9bAW5dRWFx1APAiB6cYmVIL6REePPY
Message-ID: <CAGC3ukSVk=N4ttd3hwnXXXppHchwroJmySPAFP65Vt+uP0COOw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: Clear fence channel in no-signaling path
To: nouveau@lists.freedesktop.org
Cc: lyude@redhat.com, dakr@kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle Ping.

There has been some related discussion here:
https://lore.kernel.org/r/1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux.f=
r

The patch has also been independently tested, with no reproduction of
the issue reported so far.

Apologies if you received this twice. My previous message was rejected
by the mailing list due to HTML formatting.


Thanks.


2026=EB=85=84 10=EC=9B=94 15=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 6:10, =
=EA=B9=80=EB=B2=94=EC=84=9D <dilddream31@gmail.com>=EB=8B=98=EC=9D=B4 =EC=
=9E=91=EC=84=B1:
>
> Gentle Ping.
>
> There has been some related discussion here:
> https://lore.kernel.org/r/1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux=
.fr
>
> The patch has also been independently tested, with no reproduction of the=
 issue reported so far.
>
>
> Thanks.
