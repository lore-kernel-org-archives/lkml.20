Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5C9380FD7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199339; cv=pass; b=cJI9LlyE2q9yKQm5omntVw4x1fTst7b3MYE58w6QWyNGYIrNVrESlI8Aqzf6DL7e0AmoD4cSjff2f8Mx8+HfA5Ql8wF2DZlZCTYfqRo0K1ma2mRjWs+JSuIaI0fTSakCevEMVU9viIbyOaNkzeDco+QJ4LwQk4GF+hA6Hn21olw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199339; c=relaxed/simple;
	bh=vUxrg70tu0gkCfDG0Y/HJqfjufL/MVav0fcyO6O4mEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUNYJwqlzTze/OE8mjssmt5+onZWeAljeZT0iq7A7+KAY+ys+PsO95GduOkyk1P+GNiRvBcVtQ/xZ6bCAoT7bDYTjtcpB3UT9tCfJ0GOuQJhZC2Y6u6c0kR6nXWj8M428qgbUeexSZ3pj0PjgeWNSvpYZrZlwTWlxsp39tZtvd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=RzNNzC/5; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="RzNNzC/5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d560775ca2so27158395ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788199338; cv=none;
        d=google.com; s=arc-20260327;
        b=gw7e6Q/iyBQNNf4ezZfQv6xo2BIalBvBfYTY4veE7tXgLFbLPNsnhhUV4YeFFh+3Kb
         A+iP2J6NppAihCTo9dUjegclmQ5q1j8lBZYW0TFbGAjxYzIWHAKiBjzTCPC+fks4xlmc
         SGTh/xPa7/KvHOboeOrJvC5m+LeTfx7d3sDzvOQOmNTWA8tUlwyE2w7RcTB9gUA39wFg
         dTE+crgXL+Rqqw/nDm1u7D4d7DLwQZkb434+wS1IJcOxFPGy/jPYeVOlEdS92gtPIIf9
         R70QZ2k5gSCXgFLpz4vPVW3/WJFCijn+l1BVQcbnsR9GeRmNbfHp1HW9fq6+yFJX3Cba
         8Qag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QrW08dhGSa6XRepSE7GPhDrEpeomStQDl4X2ydpzQUo=;
        fh=mU7HktP0I3r74dbbYKJzDNabkQbCSMwh3Ea1LhHm68A=;
        b=sROsewXApYc0vM0H6/J7VEy2fsD+U1pSUVxZZH2PvEVUixTLOwTJiC0F6ZgxKkPseR
         HmpOiq+PlY8ZMS8CF1xNon6NJ52zqTEq6LJ6xJKOar4V160CaDjyWNmPExIt/rTSyVOX
         016RyqIv1rLc/v0JarRJ5LSuD34BrcAopKx80MrOaOtyLGm/tgEsyiRV7C1I43TBsNS8
         X5CKrHaBMfN7anMFj+qvMpO2xsMh0ooA8uIU0HXPLfr1DkLPJRJTUVXHfEWnGhKcg2U0
         g/ZkHh3L6APXkE/4YRR5gxr/5qI2Bwt1cnsX7dUuNJ6eYiDnEOod5gDAdCNg0JsqZecm
         bRfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788199338; x=1788804138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QrW08dhGSa6XRepSE7GPhDrEpeomStQDl4X2ydpzQUo=;
        b=RzNNzC/5r19aCD+cKnDE9LyAIenQXtB9Fed64ng+CaYCwMZ+XFtr3lyosyxoGAlDfP
         vzywD/OD6Nl2EHmIF2qam+uan7fBNYlcJtM9VkATu42kHZwtVlLOJePfA7/1B40XP1sW
         f427g9SdbPfd4sYwAcbiDwTgl/j6tUzTYeasFbMMHfWWyRs6KmYiOf7F00Vm41g3NYup
         VknLI3bDOAaDiJ8e0kZVO6TAU6uDBShjhm9RcNpmTrNH5UEeIWXt4RZQG7MO7hI5piuO
         2eqGlQGJ1D3By1bA7MbElRznLa2TwhSvABl54YqoEKXKEYMLn2/hbGP9ujfOWK77Fgp6
         GGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199338; x=1788804138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QrW08dhGSa6XRepSE7GPhDrEpeomStQDl4X2ydpzQUo=;
        b=VesyYflGoTgWti+iGEzHaNC7uJmaLv6b7mC39gNbbP0EghvKEn4oYvUtwhjWtkPs9T
         +YIulJ4rOczvnZrhWaQ8egqYSEuR4Kx4sulXL7dAe9dsq7zqb4skt3qBEAZRR2UBbiy/
         20TB02zeQUyMw84whWx8DXaSWkollSG2jfgzJMMa0/V+rjJZyaoqZ3ZAn01dXxmwQkYR
         pYeoHhE7gwwSCuIhpUxW0ENxQT/wKP9qSy4VNE8kiBjqjYSQsMaLxZiUEgGvP0+2CzMR
         mhd6wjwnDHfBSJPZev1t2foraDfX1cTOCZJzQgrYxdjjCDh+2HO5dhX+MxXgaJAWMJWn
         +lLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQbYI8sW14ZUWgrwsKWptBoIpoxA/caW2Vw5iD9ToiFnfVycN8V4eDkW44Wud1hKe0UDqZEnEndYTLKIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kTwYdtjh95kIWvK4Jz0jPMe2mQ2iQ8rrkImlFbmd556Wy+9OfG
	iPxxVoSyNiJWv4LWdXmpmy+1Oe2AVzhn5zJb3TuoxxL3slCK3tDw9z4nOjMVRbN3anL3SYWjHW6
	JpFfGNljlhu12V7pfWu+41vEjdDXoQz3Eauhen/fjh3WgnQxPXc/Wjg==
X-Gm-Gg: AYBFou2ztRbVplg025mBMwjydsloXcUs0pJ4qYWzLu5sV++zZKPYWZlTZByZz6wJNRM
	3phJxh9E/0JwZIvTBdEbHa82fbfOVG9NQ2RWGXHIaVKjeUXBKgSga19oCX+jihX+BHQac+Byq8C
	7qTCm3WFissKwQXU1a6gxEOpAv2JeQRNwAJvQjGfDA+vzEbHuH8qX/Jd2bJhWezt6vQgxzlUuv1
	nIKRMWKaFKbpU+0ZXunc4CYRFIIz714exIpzhZVofu5zPXGt4giXIkZLYwzg9i8FXWGSbfiIKti
	fYnu4LCo63dS+Fm6OlRjtWD6XQb2njWBvko0MMQMs1D1YbcHW9PQQmM=
X-Received: by 2002:a17:903:354b:b0:2d9:49b3:abac with SMTP id
 d9443c01a7336-2d949b3ac16mr40004415ad.18.1788199337441; Mon, 31 Aug 2026
 11:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807140521.510904-1-rrobaina@redhat.com> <77cb8aa1365ead24eda2ff0800a8ec8c@paul-moore.com>
In-Reply-To: <77cb8aa1365ead24eda2ff0800a8ec8c@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 31 Aug 2026 14:02:05 -0400
X-Gm-Features: AcwNN1UdcuneJpmiDkNpAMqFfZZyAkd8QZdDly9SilEWFq-m2qXi3m1Fl70HtsU
Message-ID: <CAHC9VhSaEx6q165P=ifZcRBDwcdCmbAK0zuomjR83Kg4c52QNg@mail.gmail.com>
Subject: Re: [PATCH] audit: add missing unlikely hint to audit_dummy_context() wrappers
To: Ricardo Robaina <rrobaina@redhat.com>, audit@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: eparis@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 6:11=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Aug  7, 2026 Ricardo Robaina <rrobaina@redhat.com> wrote:
> >
> > The inline wrappers: audit_log_kern_module(), audit_tk_injoffset(),
> > and audit_ntp_log() check audit_dummy_context() without unlikely(),
> > unlike every other wrapper in the file.
> >
> > Add the missing annotations for consistency.
> >
> > Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> > ---
> >  include/linux/audit.h | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> Thanks.  Merged into audit/dev-staging due to the merge window, this will
> move to audit/dev next week.

... now in audit/dev, thanks!

--=20
paul-moore.com
