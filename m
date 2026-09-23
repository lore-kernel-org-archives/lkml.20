Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B9F5328C7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176464; cv=pass; b=itg7156xmi2vZj4CRKf68wClcltQPyftblGC/gqfG6M7mQfHVJRqPjVDQh0CAPZ/tKmtKEZvXdq0CKKmYXbfRl2Wkke6TMRWrtq1ko0YmWZlIbFnOgoOFk8nA6/OF8nzZHpLn0SBI4nnrdxfY7loPkvb7IYOVKINY78ZYsF/FOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176464; c=relaxed/simple;
	bh=jrtCe9nu5l+rlKR/V9eYvI92IDWfuKwXPfbk+EpZIPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIpd1zjInhd4BtUjkgQt7dpk4LaoQz1X9pxLR26w7HtTV1QMx204N0lBcTirI/rSMuU9BBns0rEwwpaUnLgW6qoO5cA4PAsw5c0cZhQR+0votGvIhR17HDM9hBFqkf/j3JsynObI2QAGLTuDa4+DJHb04eweeTxXaleqVseH8ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ucVFZrWM; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ucVFZrWM"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d8facae850so82365ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790176463; cv=none;
        d=google.com; s=arc-20260327;
        b=A060ENxsFxVg0qCjSKqHcnsHu7T6Kh6pkFvlcot7QCE7JWpfpxvB5+G8F06mpn+PoP
         OzCiz2o/vGpPGz3QppImUMbqbSFP1L8arRoPuznZWGvGwq9+sz9Jy4VSiNLomzjYP0/r
         FOBazC8knZS/C6HLdbFPvG8fwSPUKIeaGK+lDDXfSgkNAzMbhTq3Igq1ud3le22wBUD4
         fnRzZ0Bl1UmAesSDuhLJ+7Zr+CaKgFYqHJ3T14NY3oWm66Bxvwn0Nu2ENUMMxz/rx0xV
         v+ciPtGj7B1Jm6JB9dLE9lb/Y6fp+GnmtB5Z+EBer5Fu1xy6LtuUY7x4NjVbo3NgryH1
         Ow1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bMRQEia033X6Of2B2M7NQD4y537TtEPziJ29t2lyTP8=;
        fh=LhgegjOfxcY8TDAmmUDIDddt7lTqbENk9MBtBAt+z4g=;
        b=MyuiPcMQ3TbL/mxNyEVmVWVVZi+VPOqXFytm7Y/54G/LCAxSBlGTPtdPEV6odk4eWo
         5icALCrBhuQP48c4O8Zhv58EP/A9Zo9BOwLofXDama4BpsfME3OXj7Mo4EMxb7ga8ozC
         m0WBgLMmgODME320CtsSdb/21hV7fSIKFxtHwCdAqPTEZtHBKfxlty1YQenvkDHQDbpj
         jfxO4TaowSecvrPH+eiNVNPfE75+zt0R+KV7ci4pSj2z7iyJRILRIXLM/xkAJy0gp7vy
         9i7+syVpIPQ3N0Qd0i/mFvCmmGTv2DeY9VcuroX90VPGGimWVPpcyNCKPxdn5JqHwReF
         6mBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790176463; x=1790781263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bMRQEia033X6Of2B2M7NQD4y537TtEPziJ29t2lyTP8=;
        b=ucVFZrWMOTcVfuDNVJSOnjS1r7jw2Lb9laSYz17xfHks5wLA67TlslBuYYTUluJPGu
         JmrOptZnwY6uaCHcv0GybtkSf+YjTXJbzIaN9iKGMsNXX7zAT6iJ+EtRrXsjo4jgN8LE
         t4LB8FTyAXsbtYTptroLWRerGnU8QpyNYeiwILO18Kg5tEezhHybr/k/TLV8RVVCpfv4
         y4GKz72wue9zvL89B4h+kBKKmXItM31rUFPf2lDof8v33asY9FfRqB0fdgb1MXX01bUT
         R5hC6lNdosBftbHdPQ5PQ6ClBjec3dIjSEmeZYhQXijQx4ScX4BaJi5xWKMQiKU4dMnx
         5Aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176463; x=1790781263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMRQEia033X6Of2B2M7NQD4y537TtEPziJ29t2lyTP8=;
        b=LG/kVqypXvQw4XS+piWA38NH62vkjmIEjyRvvpasvqvii3+prw278j3yJzjRrRBNXt
         QBGlKMbGRXh8qR7Ucc62RC0NdMNc1moOnggW/r0KL/ZlA3XP95w035wilFhNAjAgTTYP
         xJHnmtrLkBSwUxjjAYzimze2GqyDovci3BhA0cw9tlU2Lee8ZdFNCoDw+A9YojyzPZOe
         +y48poq451LifzdDx4LVbbRtX9HluSVW02NUGMwCLccwF9nwCXiZqzTM3N2aJJXZkBO2
         xlPKVrnfVHYpCMUJuNOSBlVIFGlpo0tY+78hjymbgDduufKMQlxu5k0zeF5r8ATAfDhp
         j6Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzcI0Xa/YCN4baLk7CXluwyD6/jbZw5C3P57EKLlIaYRwnyT/xvyB3d9H7JgIexsTkG+Ni5WsGawxfkRzU=@vger.kernel.org
X-Gm-Message-State: AFuF++k/kETwYY9Ub6sF77Qrmc1cqytG4Ei56FFGmwgx5qQJPVLq/B8X
	UfC7A/9oLbd5SZbb90bg3WQVOj8qBKk1bCw5knfK3WDUheEncS4OcZBEadNpFggtW6Y0rE4Zer7
	pkPhuxr9pES2i3E0mkWSCQynBFGbyrQYLc61txQeL
X-Gm-Gg: AYBFou1uspawz5upW70whADyAD5qfzUORJmgzo2wE5khviFWdwuc4qZUkngsRjkdls/
	4ThL8opW/zt1NyEj/xz7dYsp8caU8sY2wxJtObcawljp2Oc8lfDnJ7iBtWyifecC9yTP+RkZYHb
	IoD3piTYuGxU5qvxYNtnhyqflOs9ADnDG1GkhEIwxHfTV854DlsMKyd0w0+LiPJRkzkVRafNzNQ
	QU3xwP3M4jcGAN3hP2Kg9n+8r/Rn2q0Mz4wUkVuAf5vmDjSBVWTiQ/qgFkQoDCBcOUjFxeMl+zH
	/PgBWTRkaYaPI2YJkJol1ucRBmHDJ0iAeoOrTlX8+bLsVKRIw7heFHEKdMgacAzc81Oy4AgxSrk
	lPv+HVM1ANA==
X-Received: by 2002:a17:902:e948:b0:2c9:d89f:fd98 with SMTP id
 d9443c01a7336-2df7b5a3a82mr85785ad.1.1790176462207; Wed, 23 Sep 2026 08:14:22
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAP-5=fV0-yvc68BUSKoSajHjHY_A6COgbEJYiFxRg+G-8LeJhQ@mail.gmail.com>
 <20260923135140.386033-1-chrismelnu@gmail.com>
In-Reply-To: <20260923135140.386033-1-chrismelnu@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Sep 2026 08:14:09 -0700
X-Gm-Features: AcwNN1UACUSZ5SzoKX-d7CesDfr-SFGPV2oIBCagdKQTWtmBKBnYtM8bHC8ULfQ
Message-ID: <CAP-5=fV2O4bV99bOicODQxXc8frtUu23=3o7JBhoOtf4VzuyKA@mail.gmail.com>
Subject: Re: [PATCH] perf stat: document task-clock/cpu-clock in TIMINGS
To: Christian Melendez <chrismelnu@gmail.com>
Cc: acme@kernel.org, namhyung@kernel.org, jolsa@kernel.org, 
	peterz@infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 6:52=E2=80=AFAM Christian Melendez <chrismelnu@gmai=
l.com> wrote:
>
> task-clock/cpu-clock appear in perf stat's own example output but
> were never explained in perf-stat.txt, unlike time elapsed/user/sys.
> This came up unanswered on the list in 2013 and 2015 without docs
> ever being added.
>
> Link: https://patch.msgid.link/CAP-5=3DfV0-yvc68BUSKoSajHjHY_A6COgbEJYiFx=
Rg+G-8LeJhQ@mail.gmail.com
> Signed-off-by: Christian Melendez <chrismelnu@gmail.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/Documentation/perf-stat.txt | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/Documentation/perf-stat.txt b/tools/perf/Document=
ation/perf-stat.txt
> index f334aabdc809..c0d6c344f9eb 100644
> --- a/tools/perf/Documentation/perf-stat.txt
> +++ b/tools/perf/Documentation/perf-stat.txt
> @@ -621,6 +621,16 @@ user/system lands:
>
>  Those times are the very same as displayed by the 'time' tool.
>
> +We also display a clock-based timing metric that depends on the
> +target being monitored:
> +
> +        83723.452481      task-clock:u (msec)       #    1.004 CPUs util=
ized
> +
> +For a single task, task-clock reports a clock count specific to that
> +task. When the target is a CPU or the whole system (-a or -C),
> +cpu-clock is reported instead. cpu-clock is a high-resolution per-CPU
> +timer. See perf_event_open(2) for more details.
> +
>  CSV FORMAT
>  ----------
>
> @@ -671,4 +681,4 @@ that can be used for parsing.
>
>  SEE ALSO
>  --------
> -linkperf:perf-top[1], linkperf:perf-list[1]
> +linkperf:perf-top[1], linkperf:perf-list[1], perf_event_open(2)
> --
> 2.34.1
>
