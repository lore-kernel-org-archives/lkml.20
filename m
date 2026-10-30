Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793332771;
	b=vyaH/1GUb5pDWAPdi8B6Uvrv1VSbdTBu06k7zT7TcjeQl275RoQbDEhZsZw6imucCxwT
	 O/hBcZF2Ug1r7F0rxV/5FXiOBszjFtMcxTZr1inaIpWjkKXDLCEubr+rt6L6VUL9P31U2
	 eE0NE5Y2NkR9MV5wauTQooU5PZoc8DJZq/ABFCQ6A+GQp3mN0ECRVzR/nH0+JhYo6MVi0
	 UR9evUP0UW3wpw1WdRYTootsGiJ05NGtWWcL7g7qRa0Geur0OAfiOlCemsndCdrCQgXKo
	 kJxXbG/YFEV1aDh6OUdtnEK6m8pCnG6Y2XYvOB+erGirEx6utlMeKJpNZE/74uu/ZcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793332771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FOT2v3eFb29HN7FW8NdCrAqVBUnxkiOGyHwF4K+pcrc=;
	b=WIOeoiZEZLJeGjaHTLSlH9FBFfnlLgtRZDWjJyMx7vlcGi3Ay/AnkJ5FzYrhL4e7/KIt
	 7HogRAMFkLqTtRcTvkF42umCwTeOaKGGwOWiAzdWmIck9XKtKKQUUh/qsBsiWa6NkbGts
	 0DPZvfK5D+ACAZbLOb8OBq03TMrkvEIzdrkVWIIHJePDrWUdWFKN3dFzlzsG7Vxsls4K6
	 RE4bWrOKq8qLxT2A1GJ3tT+a00HVhzygTTu+HyIu0VMpa0JVrXhrCOje49QeaiSowlVDA
	 E/Sb3vo6cYi0xup5Ca7LfPFGvJLCuuK+YXAwhZtnjSIP3OuayUpo/h963rQjOEJH4Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kOm4/A9u";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B54606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0B54606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOm4/A9u
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab39af88aeso3882891fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793332764; cv=none;
        d=google.com; s=arc-20260327;
        b=rqf0rS3XLyZM3354EgovXio0q7OPMemnhdaN0PlMTF0ZQ89MevlyxDty2Bh3vb2eUb
         xWKSpVjlavYCLF85HksDIY4gjTtrspPnNQgnmlk7E4YmZosbXZtmNMFn/xEfFmQbd+gM
         Xtp77iYcHP1m5L+NzdHFXhoeY/KJAUy1E5hPv5wXD8InCG1WmRZGuV3LFFgcBsxPS2wk
         dlcdh79wh5uEI4mhc3ASY99GXFn7rftxJStCApzmYfZ6IGTqZKNqeCw7uyMRdt3szeIa
         tlus+41F2YhT+8U5Pa2Mces+0urC9+hD5HEreyUt/VAaXXReZnatQl85O9fo7R+yWL7c
         c80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FOT2v3eFb29HN7FW8NdCrAqVBUnxkiOGyHwF4K+pcrc=;
        fh=38ftbecFmlJCLW1DG+4IcRCRoHbPzHz7Eq2dYORMntw=;
        b=gZ2VqCtKSUQCVVgYUYkDx7RCcmhGPM4Nm18x8to/PJd7vRxuLKWSzQ6U6SjKkgKGAe
         xFfzZzgVb8oV9AwezkG8otr4NfCxu7QgjK8aJ5DM9AniRzoDMXF4/aANPTybKcaFBozf
         I8znF9TA+3/kS6CoxUVmcpgSkZlOUySMW+/mwx6hyN6tzoTbi143Hbqu2dKX4e7SfhLm
         bg+H92aVDi8qznd2Mg/e1A6LXuv5G0pYKifQMUEClxrDO20u3fCA/jdz5FCmEiOe5PS5
         Et9VGb/pwZr6alUismmvC3nbzTN1wl7QtJvN1ZGwQ8C87e3TuKNBNOwFlo3HCZkdobHu
         9Mxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793332764; x=1793937564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FOT2v3eFb29HN7FW8NdCrAqVBUnxkiOGyHwF4K+pcrc=;
        b=kOm4/A9uYwuoxIElIPkqOL6pDbf17izln7xJORCwomxPzYzFRAjWGx6dz/pFDFMKvs
         XvgdHHpsG0mYL7sSAfudM1W+DTArUE1vd9/NVrpfOrDCIcKqecx8mAsX3+6ZUbD5DD54
         rOFOTaCkgCxwj2UgQQUjJNrqYho2ZY+KF0u/coLUSvBD/UAcsoceiJWqJWzf2sFL/lm2
         ZpBCebJYk9z+LhJbF+A8uOr5ltcjX3SFjAZI3vBDkHeOzbRWYIHO+5WH3EMyWHfa1lDL
         stl+QLqZGL8MlL6UPoQoMq/ZiuTkHu3dkvq+RLU3vckc+l35nZZ9dWOJsZfQAv2+Mw6v
         Q0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793332764; x=1793937564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOT2v3eFb29HN7FW8NdCrAqVBUnxkiOGyHwF4K+pcrc=;
        b=haWzsZQ8U9mxdEp1KGdFQLlGX8am6lGXobAsAuMx7zrOaTT/5WCKEpwaO/F9A/SJOU
         GK8DoXZqUcAALHlCd2cno8+fP/z/s+ROXXKfPMmkEmi+HZ+NvnFp4QjDFkD6L4obA/rB
         wX1oBYrtgl6veaXEllDsmK4qZT/4hSlrZedXcTuQzb4ULXn6S4NQ4WB5B7kQEzaPGwMB
         4wnb1vsnP9bajbiy9XjJHUlBH/NPraj+0OtrJhKOEc7xCGue/dVH8R0xYPR7uc0qe8Yl
         ARRbVStveNgso6vOJ2qP9dr6kzp5f9iDanV4Vt64QPBukOLJN5ehI3QA3orp1w5q2isq
         +K5g==
X-Forwarded-Encrypted: i=1; AKwUvBy8ZobFpHKy3aWpNbDhYkkRRgpDlXmBZAr9S20G7X46VjI/JhwBCdY9qqNT6g2Y8j8FsQkQAOm7ZLDEvk4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh1h8sYKco8F8hFIwKaJVnm6Di4woJjSlphC93zKptyWua3aq6
	bZca9qmx+ZSYC+pjoRZQgtL3a3MwpV34sPZbKecs8xA02udEhr8o3OHgw6urdY9+mIndnJAsybc
	nGxbCR5uju7L9XhoIxZOh/7h+p3TZuzk=
X-Gm-Gg: AYBFou2DuNx0FS0G2efQLP4OGy6Yy2NIQAS3+Wo/FvbatMGYFQLVKxz+FvGkYrownd6
	lF9Xu9H2Ods/UVPIoUtWlMtRGAEt4rtIM/JLm5XUM/6pku/XyGNqIxLV16OZdPjaMY5wACJeW5c
	I1afHvD7Cf2Gloq69I2z9mIbaf0Bxtsq4SQTnaE8e5DgqeCggB1WodemXRAgxJDIyaU+uI/4DfA
	BkGTQKOHVxr6bPV9ed7fM5TajSO9axrtzM2j+StsDCcBsUQdXsnsT/3dr1dCBkbVMaP/eTxDFbv
	KYcdTQlLD2B1v/WOLgL/+frmu7L5OJlqL3mALzN3R0YwVzcv7wTsbSIkH+eYXv0mDL+Xm/w18cM
	AIqubQPaVbtrx7c1AQby/tMoKIrzK74v/bT425+OgPcefRGTtUsu+j0CNvwo3NcEiVN4G5AcC1c
	7fUUguNda/KFaF0hv7n824HKXRqyH86KEqZUnas9PGsLNw+XLTHKOU
X-Received: by 2002:a05:651c:1508:b0:3ac:416c:721b with SMTP id
 38308e7fff4ca-3acb7a98329mr1607061fa.10.1793332763639; Thu, 29 Oct 2026
 20:59:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com>
 <20261028-alpha-profileme-v1-3-d44b52bf2500@gmail.com> <CA+=Fv5QZhtB646nAvoMzbc5O+EdFOnZhXyRrv_1Q-LGWKfbrEQ@mail.gmail.com>
In-Reply-To: <CA+=Fv5QZhtB646nAvoMzbc5O+EdFOnZhXyRrv_1Q-LGWKfbrEQ@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 29 Oct 2026 23:59:11 -0400
X-Gm-Features: AclHuK90bCzCpBH3kCewscdgnWin1k9-jXiMf8ZZ82e4TOlEtXb6Mcvjq0xGsE0
Message-ID: <CAEdQ38H0sdgPHOi=iDrHWjzsF4GNJgVUt4GxbZ3O5YwpPc3zJw@mail.gmail.com>
Subject: Re: [PATCH 3/5] alpha/perf: implement ProfileMe sampling
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 11:18=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com=
> wrote:
> > +       pm_regs =3D *regs;
>
> On Alpha, perf_reg_value(SP) derives kernel SP from regs + 1.
> I think passing this copy therefore reports an address past the local cop=
y,
> rather than past the original interrupt frame.

[...]

> If PMPC is in userspace but the interrupt arrived in kernel mode,
> this also makes perf_sample_regs_user() select the copied kernel
> registers as user registers, bypassing perf_get_regs_user().

[...]

> Could we preserve the original frame for register/stack capture
> and supply the profiled IP and mode separately?

Right on both counts. sashiko caught the same thing, and v2 drops the
copy. perf core takes the sample IP and mode from regs
(perf_instruction_pointer() and perf_misc_flags()), so there is no way
to pass them separately. Instead v2 sets the PC and mode bit in a real
frame for the overflow call and restores them afterwards:

- interrupt taken in the instruction's mode: regs
- user instruction, interrupt taken in the kernel: task_pt_regs(current)
- kernel instruction, interrupt taken after the return to user mode: a
  per-CPU pt_regs holding only the PC, since the kernel state is gone.
  It is not on the stack, so perf_reg_value() reports no SP for it, and
  the user frame is left alone for perf_get_regs_user().

So SP comes from the right frame, and a user sample gets the real user
frame.
