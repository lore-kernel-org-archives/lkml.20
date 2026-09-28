Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E28649B457
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601884; cv=pass; b=jZGQfkzSQSZN1U8tvWt8Q1x8e/WvBv15ujVpIGYvWkknQytKKzyPGOHXKL3Ft68H1d5RchyuQc9RaaWHZjVB7J5E6SN1NBmxwsUlfa3+QVib7gvdKAPKbdCgkP16MlCKIPCVFgxiklePqLRfXhQHd06vsjBkfG7C7VasquEnfq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601884; c=relaxed/simple;
	bh=GnZRje535Omjq7bTjfZY4Rt+ArD7RwaYq15aIzeRtgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJDSBwDPs+CCW/aGvw7yJKgT8QJRLM0DKvJslC6yEWbzeP1oV/AMDfWcEZqTqDbXb52N2IJrwYzM7yN/OAzP3kr76zsGsAWjlBES5pv0Nzvghc1+B8F2X8jmef0ikNM3DRG/Cfy9U76IOd1pu4XZ4fNEQaHGebz4iy6QNDuo5U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUXo8JBH; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUXo8JBH"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882c1f2baso526676f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790601881; cv=none;
        d=google.com; s=arc-20260327;
        b=U1N9wdISN1q7in/mSXlesksYQ+tdzkd2dG7wp3pnl0caN+dTvCZqGkh6InlYtc2Uj6
         TFKFBiExuX2XkdMD64CUYmWJydizYVK0jCABOK52U9P+7lpqXkUAqioEHn5qsdyUeiGL
         XDUHw2SR7ZzsusD/jmUrIOK4WbyTCOB4atzxgu6j3H0QkyzhucU4cPoDJK4adhFNjAfT
         VIV5scyLS0RcjZbh0ZajOIQQl30JgX5rwtm5cKjoTzggCtrG+j93tMt43L6id6vx14D3
         OHizFyEXi4BlOlVVFoSsDc01j6toWENmEpUIFMwDYo+6Hr/a7gij7nbMdfwubtp5OB0F
         iVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GnZRje535Omjq7bTjfZY4Rt+ArD7RwaYq15aIzeRtgo=;
        fh=Hs23q6kxr9GAVCrBbWcy0m5CFY7Xm6DLWAHKI35b31I=;
        b=S1JKBhXgtCc/V80hGlfnmL8k4Da1gR0ZscambTMR3uCN+vNXXaYT1Bg9kJSNcw6PsB
         L3aYt3DdCRzgrp+QXHjoex/sjG2kEZ+yBkNoLFbH5ozkDuCARfTPP9FMD7CZwXwEeh4A
         i3eGCDe6KMNd9WRGpMVZJhVcnsBAabP2hTIu1yl2XmlN1J+BnFTTt5WN/PHNBzmsL2x5
         AjiwB2lbvPhw9KJ46qtlNVSOBIK0VVCJmn51JglZVhtFLai4D+/sPiKskKckjKn0uvEl
         6YHpC1pfVFUsvG/7I7zEZrZlTXEseRjz61Sg6zMGv9GnbzbHkIUo6wda26ddUc7ZvRqk
         loOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790601881; x=1791206681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GnZRje535Omjq7bTjfZY4Rt+ArD7RwaYq15aIzeRtgo=;
        b=UUXo8JBHEslABI7CGJ0PDDjiwm0LbNuMedQsOOZhGgkZmmvyfDKRcLzvjXqDtRpgjQ
         ZH3/8ECrJOFrcQ7qCQKOwnOoK0+70LmPsGLnW8hGk1ffkJLguP21c9k8q7mDXZUq1hNM
         AhKEcpOSD2dzC1LpINIK1azIpYQzPvMh1JqAa1mTiMBfFG2/vBQcUxfWpEPi0RGeFYc6
         UIedVqw/6selEJ7KDiw53OVkiDr+dZKeYmSqimqTdrj0e9yVBUPxdmLqLlIm8oAP9TBb
         /ZVDKY+dhqoDkjuNsu0VLWJFxafb+4g6cr1kfcEwX8P6c51EssXwLyDa/cE6SKCSBsfZ
         APjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601881; x=1791206681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnZRje535Omjq7bTjfZY4Rt+ArD7RwaYq15aIzeRtgo=;
        b=hYq856BRSLBdnf3bn9VLr4zVG42pEvuOiu9WQId9dtlq9Yyy8jJpYMpQIOBNK4oXMD
         ofN34/90qOWyYKf9Sw0or7hWoMgHrXrAjMP6t9bAHE+FlK66nAkTpF3HF68YmO0Kwj38
         UbNMiAg/8MJYCOzaJ+xFAOqc40tOlTHMqNPASHuGGC7pdw95DVrAf7hPB6aybziH+VfW
         3xIqoUWfuTAK2yYECDvvGRiDfYOmM/03ocurygJ0fo3ZM4mSMpiZE8HATO4KoxvXJHVA
         F/fml1rvzBcLu0QafMReEEicToUvaZ8IoJdeW3EfLrluQCjE6w1Nf8TqC/LB5TqnQNu8
         /khQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAz07Y+2foj34dUMphsWkcZUDsclOBZjbBhk5Mpbcz0wv2jHONLJekvHlSywLqKw8yJuTgOCnebWoAcTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjRymAzSakfsGszNOnvnPX9P8ptmtvSF3rjpeTCu5I+98W389F
	fjzu5OHEL4zKugGK2KCevC3vFxui766GKEcOmjLBh0mtlxYZ2Hw6UPvRO/hEgI/qw8IWg4AAlL4
	570BZZ47B7EZd11set8Eaw0s/it/UApQ=
X-Gm-Gg: AYBFou0Fc//nCR1kPoZq7lFQfSDIKWohr8ZhCmYoCgkK3Fwan8l6mTPPn/Bb+5RjWE7
	Z/D3B5Wp+8fWphb83Kx/PLhmgeI1DYUFLIOBlshyODOkqtRiW4t816ElRw42BqsNLr5mLibLNJg
	/WJCeJ8sMUaMxvxb5AvLN9yh8Cxda1FI0uE1UkBgeF8Upa5dC9eXQeXvDG1UPc2tAPHMV1pz82T
	d304n7E3lHPg2tB+wXnviqn2CaGzlaSBp4QtnmrIgjsTVt++OrgGwNUe5yvrJKUIZt8rwAfog/l
	afKIU2tRw+nMR+tboqrPnDnYGd0VBCH5Av33UT6yA4gmiQJxcvLHLEXvFIvG0ynd0vIyTFVetKB
	J9m1GtcW2GcBd9hrd5NK9c466/fc=
X-Received: by 2002:a5d:59c9:0:b0:488:8232:d159 with SMTP id
 ffacd0b85a97d-4888232d348mr16059474f8f.13.1790601881245; Mon, 28 Sep 2026
 06:24:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918180241.3424851-1-nphamcs@gmail.com> <20260918180241.3424851-2-nphamcs@gmail.com>
 <CACePvbVaDNspMDSw_qAcapKAzXj3JGV-KMYmow7aePa0POHpSg@mail.gmail.com>
 <CAKEwX=OP3Gb9sVOvch+p4j7quzgy-rUY=UTZau5ztMj7heJJoA@mail.gmail.com>
 <CACePvbVQsHXt4=+qfKz-KTar9CG+3OiAfLd1EZgnRE-1gyoKOQ@mail.gmail.com>
 <CAKEwX=M8pJUYhmADfvdk+09O53EROyDRC+_b05vtimQE5VN=qQ@mail.gmail.com>
 <CACePvbWTZgbL7U-hrgV=V0egHZ13EqMCOsUbnKTcLvqnv85zUA@mail.gmail.com> <CAKEwX=M1tc5fLSgxbq9S9TU1AKJWtRZA0AwGQZgNXJ_76hThFg@mail.gmail.com>
In-Reply-To: <CAKEwX=M1tc5fLSgxbq9S9TU1AKJWtRZA0AwGQZgNXJ_76hThFg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 28 Sep 2026 14:24:28 +0100
X-Gm-Features: AclHuK-U3fLTMhHK0pk3rONO7wDcH81pPs_iHjZbfq38GiuI5bJWs1UPQRmTG2g
Message-ID: <CAKEwX=M0afcz+b1pBd+R9Ddwqwcf2MuC0XUpC6seL=yU-cn57A@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] mm, swap: add virtual swap device infrastructure
To: Chris Li <chrisl@kernel.org>
Cc: akpm@linux-foundation.org, kasong@tencent.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	yosry@kernel.org, david@kernel.org, muchun.song@linux.dev, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, baohua@kernel.org, 
	youngjun.park@lge.com, chengming.zhou@linux.dev, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, kunwu.chan@linux.dev, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 2:14=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> Vswap does not have that, because vswap is not an ordinary swap
> device. It's implementing the concept of virtualization (the "V" in
> VFS, if you want to make that analogy), made optional to reduce
> overhead when indirection is not needed. That gives you all the
> machinery you need for backend transfer:

... for zswap/compression backend.

It's a necessary condition for non-zswap inter-tier transfer, but not
sufficient. So it's not a solved problem quite there yet (and I don't
know if it can become worth the squeeze, as the data becomes
increasingly colder as you move down the tier).

> layer, where you can update the backend, without having to go and
> chase down all the external references - no PTE walk needed.
