Received: from smtp-sv1.saltyming.net (smtp-sv1.saltyming.net [152.53.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCD424679C
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 00:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.53.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791073665; cv=none; b=a86wuX0wTNFHakjDhOn7Tbm8MdevV+rel4Jb8o5QQJajI3x6voFtVS9wQ9RLWTdlHtGGYApUcBs7TrryK/wz2dbe1Pg59DAaqjD/BO/LAHUloEYtVcrwDjF7ZVAd8DQYGVrYrjgh9/aXHKXvl60KO4gHmSZ74rQJXEl+fqleBuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791073665; c=relaxed/simple;
	bh=9y565mXmPk14OT+EJKpfLw7jDnD7lIoT4YWiqhVhvcA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PSX7DQBP4p4vDR3HbMHJDoFgqxQtKooK4+FILbQiLdAESqW2NUFQwYvnPR/f5U4S3Z+n/l2KIiw1AeqeMr3SRUryKhVWzd/b582jsqoMF55E0lVCBqmJnyZD6u5VjSanAN2YeF3hii89FO9fdrWY5Oc4FZU8hEDZdwrjVHCOt0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saltyming.net; spf=pass smtp.mailfrom=saltyming.net; dkim=pass (2048-bit key) header.d=saltyming.net header.i=@saltyming.net header.b=J6O6z64+; arc=none smtp.client-ip=152.53.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saltyming.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saltyming.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saltyming.net header.i=@saltyming.net header.b="J6O6z64+"
DKIM-Signature: v=1; a=rsa-sha256; s=saltyming-dkim-202512; d=saltyming.net; c=relaxed/relaxed;
	h=To:Message-Id:Date:From:Subject:Mime-Version:Content-Type; t=1791073662;
	x=1791678462; bh=9y565mXmPk14OT+EJKpfLw7jDnD7lIoT4YWiqhVhvcA=; b=J6O6z64+YG
	knxzhGWdOZuShlLiMEo7CaF1nY2H2t0nkkOhIr6/+BJnfdQdgxmqaD0h8hayKpAya0w7TnN5nqg
	ggVUCT6zQWB5+EzhZ8F8Ys7Z8Yl/J4nMCsnYGm4uGkPTJe8Mvj4GbLPIsvyALBhzdIhI+eqDLmq
	Z+RYG2o5w+P9KkQZdsPo4QgdxiUE+9AIG4v7OX4nX76+vdUiRZX9jj5WF4jWe8lCcLzZZb05Avt
	sYPOrWW5z5U9k7SQ5TItqNo7S6O6A7iy258/NBHXOEUlj2nLWZYKiI+r46/p75oatz782RJ40CB
	juLIkoYWs7ASdNeEw4E0dI+lljT3RMUg==;
Received: by smtp-sv1.saltyming.net (SaltyMail) with ESMTPSA
	(version=TLSv1.2 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 bits=256/256)
	(No client certificate requested)
	id 7ffb334e-1951-424b-b4b2-9016d9b3cace
	for <linux-kernel@vger.kernel.org>; Sun, 4 Oct 2026 00:27:04 +0000
X-Virus-Status: Clean
X-Security-Tags: spf_none, dkim_none, dmarc_fail, dmarc_quarantine, arc_none, av_clean, ham
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.41\))
Subject: Re: [PATCH] drm/nouveau: request a privileged CE channel only on
 Kepler and later
From: Hamin Sung <hamin@saltyming.net>
In-Reply-To: <cdc6f42770d824240a6d4474d090a9be8da7bc2a.camel@redhat.com>
Date: Sun, 4 Oct 2026 09:26:47 +0900
Cc: Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Yonatan Maman <Ymaman@Nvidia.com>,
 Gal Shalom <GalShalom@Nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F16C3327-4F6A-479E-B4D1-F8F2B1F55EF0@saltyming.net>
References: <20261003223244.63133-1-hamin@saltyming.net>
 <cdc6f42770d824240a6d4474d090a9be8da7bc2a.camel@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3901.200.41)

2026. 10. 4. 08:53, Lyude Paul <lyude@redhat.com> wrote:
> The LLM didn't mention this (of course), but you need to increment the =
version
> of the patches that you send out when sending new versions along with =
a list
> of changes that were actually made to the patch since the previous =
version
>
> Also, while LLM generated patches are fine for fixes (to an extent) - =
but
> please at least make sure you write the changelog by hand to avoid =
inevitable
> mistakes

Sorry for noise from the sudden series of patches I sent using LLM. =
These are my first kernel patches,
and I just wanted to fix some issues with my old NVIDIA graphics card.

Also, those weren=E2=80=99t new versions. My mail server had a bug =
delivering most messages twice
(I mentioned this in the devfreq RFC series). Sorry for the confusion, =
it=E2=80=99s fixed now

I=E2=80=99ll keep about versioning and hand-written changlogs in mind.=

