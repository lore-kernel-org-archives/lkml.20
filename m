Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B72F53B325
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171153; cv=pass; b=tdl2U7C/K8IaLDZtVKrzTigFrBrrp78E/VX87niKPlNP4naEApzzx7wkQXnSG64ZSSGtd2TdtA5CggMaNG8VoBP/gOdC2h6XWVJnI36hZ2i5TYOIa3jkzSeQ1GpqZXNcjjGjKJHO5RxSylM8d4cMgOe0tWoHiJB4ns9nLicB1ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171153; c=relaxed/simple;
	bh=b0QXcZNpXsUThpCOmQL00R26guN06kE90slVJR6kThE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GdEccxTNpsTTPME74Y1PdDQ3WkW/PRrxbdqeWQlvaJwBgo89S9nkhIxZ6rYr53K1gjtv4bbLTgpt/bQ73TljzvgPxj3zySS78D/1/K4JE1wAJrlF376VLS6se6nChcBb83axYPf8LtQIpd/L5/LlOXmb5Gd1oNxst10Ml/+EgNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3YULxwj; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3YULxwj"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-32836ab4521so108856eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790171150; cv=none;
        d=google.com; s=arc-20260327;
        b=XM45KYECKbbseio5Kz52LXIfRMsR7G9szeJyv1zP2NfwkQFPk0cedW4LTbFysjOT6O
         MlWggIoydvB89TIR6Y4v6FQxnaCxKffB02G8MT7C+EOMTotQIXvoropHLxXVL//w2jhh
         riL+1RTeqj8+DPQRAZX8QC5ZcBxmKfFApDkjBQtq7jwhjoUqgUOJUlGcCuFu/8/cAYT+
         z7M69SmexBsbIzD8EkKhX+EujPYr/e/LlBkNR2L3VjgkwBBpoMH/TCK7w5MUtyif4jF5
         WAk7fD2HlqkMyrKyOsnO1Jo7feYTzb5cjcMcE1Jaq2tZQ7p2m1k/KYy4HhdZ88vSUxQ3
         +HxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HctvDPTtuOL5MhTLFfz6tCI4gTGEFCKNG8C5WWR9dmo=;
        fh=i3hz8SFgCDK6F10274TpihoUXSPt7zMaHiIuO223BA8=;
        b=cwrQUDAOwN2ooZMPtoKo0k7j5jq1lnc/rMC1C3XoCXRTmOnjSlJMViyJ/3rdazn89/
         eW7bA7XPxUa+KUUDC6pc+W3fVUpV8qR5n0gTDmL827jJrR1z88WeuS0MjAWfeiFpB+X6
         067ZaXZRdlWuy9EYYcN6UnavD/2eM4U5qrjvsgrlmx6Cp7rdp+gZJGJ4WmJ9Jh/fJH/Z
         WeK4RzvXLN2PClzJ5eaL9/xzu90Sg7KTUaAX6M+l9JLCYkbZc90DjzXxq7fr+J+Gq1lZ
         0QF7IIRTMWpzk21YQXrilXk0eNTvyQL20ADMQ9OEzTdj0h+CwNxTz5tljlmRU10lb8f3
         vbsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790171150; x=1790775950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HctvDPTtuOL5MhTLFfz6tCI4gTGEFCKNG8C5WWR9dmo=;
        b=i3YULxwjStmMODCY1z4ScFyNm0LPrJe9jTOGluAnPm2QjAMcsxkWtLADgT93sy1iBU
         lif8crvMyKNZD2Cn4IDM9lH/2QFAPwLmUaFHrpMdENrqzS0tRInsCgnnFIw1znzilNpp
         puOptjSYdxOo5k7A4krEXi9m7YTXBcyGl9uPvjoN9g7xbvCz20D1TqDDb1ogoca8Jom/
         1PuLsDP75qoi+KbcSNFszlQgVIzRD/RjnP+Oad0v63+hJMLgyRxHMNQiPs416u2oPuo0
         sCzrQQz+5UybINuzMQ76LY5j1OcsJ83EpGP2PzDVsMaown44qRX6X1n3iq3Ls7ojln+p
         67RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171150; x=1790775950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HctvDPTtuOL5MhTLFfz6tCI4gTGEFCKNG8C5WWR9dmo=;
        b=IzVwq45YViF7spUTg/fGoPlsiZhO//5n2lH+M4zZRs7NVcpgZ+ibCO9VL/1LXCLrx9
         /PFrecfmkVR1prIpqAlBsiwaRE5ahSCdhI3ddSe9r6FY7CsiiGKyxCo96B9yBpA0C+DU
         cy64TuofCGmTXJZpfYpNf7DVMl+98/W6zBYSRSd7PTY5+KrQLCmUWl0Dikh0IJEuspfr
         DxjvI8LTTnq11MY5CqX0aE1pReaxWWJrzeFxgD1z3ljzuZoO9Smzu6EWoec6NQsjMWpo
         GTr0kh0NxTDWqCaQe/SEJdAP5/9JWmdN5J3aZBjta4RNQE6yTBxWdhQxJbFlgBJxcRfw
         Z5NQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7r606xr3kFBWSGPR9rMeD/iP+hvnqomkk2LQI3qbNSlmoT7mp+iX1F8qrZt5jzddT7nzFuSzVWw0TGwk=@vger.kernel.org
X-Gm-Message-State: AFuF++lOSFAEDmt7FmQQBu22SvD3lEo+C+VIusQHh1ZTB4V/IEdBnx1J
	hOw9raR9fsiY4f7MUvlaWN6PnUiDjELFix/VxULWWH8/Jf0MaAUHBdTriRyiyUJQbNepyDSVZDz
	gzzooeJpEE+vdnnOmH0JJn4AA5DQZTxY=
X-Gm-Gg: AYBFou1VRdsVw5mtoHR1o+e2MWaBEV2VHDiSGr5GoRWyefybjHpjiGNR+qeCu2BYgQI
	WW12CuG2nY4WloqccQre5qDOGQOxrXI0i6SY5k2KEdt0+Ag+dnxHeq3EZ2jGLZ/wZ5TxDPGe6W5
	c6XWn645Kd2hOR9E0lC9Wa+Z/raMXWSHfe11ziqwSsIDs1r/LM2mGCTRhY/4iTeT2pQQTvo38nY
	v2k4x4eHXrJvkUCqaUv0GlLJ1Bi2gGfN/NiESV1KGZd1CTXmvBv01fq2valSqWKN9GewXmjSem9
	pxC0BEBiV3FYsq8OEOaleosf+1o8tXXdZsL7ErITs5YuKxn416QlJ3qRUcDe5T6HiEIpLruuMM1
	seKivEamMUNc+ZT9EptbtMsh74gTHX9WFt0QEXjAweg==
X-Received: by 2002:a05:701b:4517:10b0:143:5c2a:e45f with SMTP id
 a92af1059eb24-144f8fcc55emr4442748c88.0.1790171150250; Wed, 23 Sep 2026
 06:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arPTRF4qS6o1Q3vD@sirena.co.uk>
In-Reply-To: <arPTRF4qS6o1Q3vD@sirena.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 23 Sep 2026 09:45:38 -0400
X-Gm-Features: AcwNN1VvuVKZ728jo-o9478RCdxxAm4oEfsFVGIbnAnLjFz4EvjQl-J3APv6aG0
Message-ID: <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 9:25=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c=
:87:37: error: stack frame size (8264) exceeds limit (2048) in 'dc_memory_p=
ool_create' [-Werror,-Wframe-larger-than]
>    87 | __must_check struct dc_memory_pool *dc_memory_pool_create(size_t =
size,
>       |
>
> which I am exceptionally frustrated to see was caused by commit
>
>   bc3f07516a992 (Merge drm/drm-next into drm-misc-next)
>
> which merged the bug I originally reported in the amdgpu tree:
>
>   https://lore.kernel.org/r/aq0vYhZXtMqA41wZ@sirena.org.uk
>
> and then in the drm tree when that was sent upstream without the report
> having been addressed in any way:
>
>   https://lore.kernel.org/r/arJoCiRM1hRbgRb5@sirena.co.uk
>
> neither of which have had any response at all.  It really seems like
> there is some room for improvement in your processes here, currently
> that's three drm trees all held out of -next with the same fairly simple
> build issue.  Can I suggest at least check to see if the code you are
> trying to merge is in -next, the drm merge was done after amdgpu had
> been held out of -next for several days.

I sent the PR out on Thursday and you reported the issue on Friday,
then the weekend happened.  It was investigated and fixed, however
Dave reported a different stack frame warning yesterday so we are
trying to make sure that is resolved as well.  In addition we've been
trying to figure out why our clang builds did not catch it in the
first place.  All the patches should be available momentarily.

Alex
