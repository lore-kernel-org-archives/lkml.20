Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F5444AB7A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797082; cv=pass; b=HMXDW5WphvLwGkJinboVku58EVcoP3MJ/ZHmhvtZ87WRWAwfd4LleUhRVY9L2WGm8BDsWemRnHO7HEugvnUB1j7qpDFYRVzOefOCs9LG+ByRQxoPXrRSSSjhRyGnFEQ4xKT+HUdASov8Bx+A7CAPEsi/PSVrKVTW2RaIRDxhjC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797082; c=relaxed/simple;
	bh=PVSaTCIbvuvldSa3Gy7QhKra3/fS4FKyKxTvIAiixZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ryc3TYMKJj5UP/vwb3QhTZiFQ4QqDSbDh56W3ON7f6ak+7nSFfwSGIgJEAvqojFdNNV4kj0dgN3dJWIRfKEZWhTG0EHIzoTZqiGfnqkxtb7wBzEfOXwrriPYXYJr54f4+tYzlkDfxcAdJYPPp8NOCWlQs2jbWXR+NCKVSH+TVS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yjcs8Lbd; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yjcs8Lbd"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-7f4f0c89e34so3999545a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790797079; cv=none;
        d=google.com; s=arc-20260327;
        b=jXShPmjJ2w5E6eDw3hHbB6nZMF0+hKxhnrgtMWzdX1IZoyretASuTcl9W3VzWUMaHR
         wFfQa3gQF0GS/BG4EGyokHQsH373B57uOkxCInlTttUqNvOmLMqKn5KUQSh3Qs9yC3h5
         H2cvaK5wtM2Q9SQhfakLhWL13eslMcOCLF3EW1XUkjRK0TusFGhF+eKzkmdUXYHAXgPo
         dMJ7n2U/Xl3OZ7adaCmeCfiZlqW53vG11GoMayUOrjquHdV5auO1/M/pq9VFSNpA/3cV
         U5mfbeiD9gRBdTMJRlHRlk1VqTv8L6F7wYLVC1VBE5fwZpC4MRGtlC2o+BuT6Rkv+OmY
         N+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PVSaTCIbvuvldSa3Gy7QhKra3/fS4FKyKxTvIAiixZM=;
        fh=v96TbxG3m23hcS2t+bM/JW3w4S3dVTDl7jYijl8cksw=;
        b=rk77RpFJjkk6KwxGXsNCt2Q48uA7bbUKlkV39MuCQoFv3zYeG4UHvouyRyfYtJY6ho
         H9ebQqR1qOkbZM75NKiA73raBb6QuCO4xY0ga5kaH2O5vu2VbE29Wn96wE91e0MHET0b
         vnFbL6hsvcdRrhbJKG6xZ3fhosMFJzQTicrSiqcO7+guGm7XnoMCIvD7mc7ghyF18HX4
         Gg1eAPPeRcEE3ali/6Yr2E4yTlsnznntiAaDBRF10j40D5p5p0cV5uZa8qzIXTLL3T18
         2Y0eyaHOKC08hY8xxQyd/i/MeWqnG8ZHtp8qWqwTDwiaUAqKi6Sgzfx+ZOY11x4omHvL
         xLQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790797079; x=1791401879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PVSaTCIbvuvldSa3Gy7QhKra3/fS4FKyKxTvIAiixZM=;
        b=Yjcs8LbdszbMEDmNMlQnsMU7lHYG8J/QG8e2oBD5dVJwRo2TYh/aWSVm67lt3dEhKh
         SGk5bjMRYf25jBOXHK7DkYE2wljCjIfJEcUI66SLJLMmP5d1QYgOjoYvP50+oxKS9yXq
         W58UzIrLOFR0Pq/268ImDpJaRHWOvewEBHqwCpclUYxfDRSGL6x1FHRmc+rzl4VALwQ2
         B/hcFtYJvjVFRaz7jvk2aE079IKbr3aZv5okdgPeLiJloD/hwkNfedjrwm/IDd+elxE4
         /ld1oQAJCZw/nMOXD6eBcR3RPu2/XFcdmIw6fVM6Oz+jGPRs9aTbaGG4qbcwVGpY6hWZ
         i4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790797079; x=1791401879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVSaTCIbvuvldSa3Gy7QhKra3/fS4FKyKxTvIAiixZM=;
        b=YaGAS6wzYEsBvUr8lO1g3l9hpztMCJ8dT1w4IkyBlSfN5J+4dzDVzLnE2m9lxhwdro
         z6O19cex0niNI7ip9s8iNbuF7tFM5IlUICUZRooa0qwHBTZ+YDht9LtI+2VnVNrtcy57
         Yvgg6H9D/APQ3pOPlJQ3L2LA3IeYtC9IR6wRht28cPGgMvFf+NdxU1mSw67GWUVVFIv5
         282OaeK1i40a60QIRzA0lbjPV4mjB3c/yNNrJT8ks/76l2hu4DrQ499iPoKrC9DlJjzl
         ry0AXW5KJuRIGJ8/iSHZJ44c+94oGIxINzPwOjrUbMHfgMPWXPjqlRk2fBtgWOsI3OS3
         sIoQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4Mm0N/37MjDqBt6qTAd8vTT4Fz61/sccy4SoOEgV+VpIMRinB5FpLgkUSiWf2RGp12trM6NLXLezAyiU=@vger.kernel.org
X-Gm-Message-State: AFuF++n17ED22oDxbxh7srGpa5LTskNtyP852hgxRy+dYExOR1FOCqiS
	Tp1UvtSxuaTWyQWxX/UqJNpscJj9Opqni10m2qaGV38x57q8xLHYHkxM4z0JQ6/GtQps9yTwzGr
	n8F/dbpI4k0FQEQOy0vnFDQJ2MdqGqMg=
X-Gm-Gg: AYBFou0+0VzI+WuWXvmXwvdTfDpyL8JIynhD2YFYkXD3QCFqmLtysv7G5pbb0t86Jka
	eIR++SxKAHFYnbX8XeytsnwE2prM/LJze/2vtdA/rZLhZeSYZli9JchsRMJ7M7886GAnZnBoTxk
	0jKNY/1yEPZKHq9fbKoozJmpQ/hOHb/Fz4HHLc3TzWwwgIQ2cjsYCaL0Ylu82i+k5T+lqi3jVnc
	h5EDQxPKtZy2vben9ndjAz7TabMMmnQYaa6F7W3LV+iLAttwZTehm8jyYNuCKi3CkmLqmN0Wm97
	jy8dVfur96qBNCNV3lPbnrJU21XKSitEHmnCte3fLngMwBnQy8WZig==
X-Received: by 2002:a05:6830:83a2:b0:81f:707d:7646 with SMTP id
 46e09a7af769-8204980c727mr3188073a34.14.1790797079277; Wed, 30 Sep 2026
 12:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929232621.3745312-1-avagin@google.com> <20260929235700.GBarxQTLOrWy1I3UZr@fat_crate.local>
 <CAEWA0a6McVMNv1ALC7EoEeA9-7_7u_b5JrsqixifvsfVJ7b_8g@mail.gmail.com> <20260930025153.GCarx5SUn-XMHNdly1@fat_crate.local>
In-Reply-To: <20260930025153.GCarx5SUn-XMHNdly1@fat_crate.local>
From: Andrei Vagin <avagin@gmail.com>
Date: Wed, 30 Sep 2026 12:37:46 -0700
X-Gm-Features: AclHuK9qCi1FrPZuNiOETWOmGmo5wY5-dsXzDO3i3GDoGQmMl29wtmB2ggOwhd4
Message-ID: <CANaxB-xYziLhUBXreHKf6FRvyvnRnHy5iWu5yKwEAATPoEbQLg@mail.gmail.com>
Subject: Re: [PATCH 0/2] x86/fpu: Allow restoring signal frames with larger xstate_size
To: Borislav Petkov <bp@alien8.de>
Cc: Andrei Vagin <avagin@google.com>, "Chang S. Bae" <chang.seok.bae@intel.com>, 
	linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 7:56=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Tue, Sep 29, 2026 at 05:02:50PM -0700, Andrei Vagin wrote:
> > I think it is a misunderstanding. This series is actually the next step=
.
> > The first series enabled migrating workloads from older CPUs to newer
> > ones. This series enables migrating workloads from newer CPUs to older
> > ones.
>
> Aha. Any particular reason you're sending this separately, after the prev=
ious
> set?

Originally, I sent all these patches in one series. Then, Chang
suggested splitting them into two parts. The first series was mostly
straightforward; it contained documentation updates, code refactoring,
test updates, and bug fixes without any user-visible behavior changes.

The second series introduces a user-visible behavior change and requires
more careful review.

Thanks,
Andrei
