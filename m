Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479856;
	b=PQMi99YHaDG6gMdg/1EFskMTZqPVDOesF+UXpY9dyUC5V/g0HF2Pud8VqIK3NPY2vLlS
	 1bSEN3c4lHa6e+EUKLaEc0PrjMpEq0LlQPQBk+DvRJEbwpSvBwWgu+aJsFX8NTo6RdbPS
	 1GwiEW5tfmKYd6TLvs11dmEhAYlOlV8fiICx/iW+J0aBcnvV7oPwtS73+ZY4EXAe5b+YB
	 AubVRT7xIx6HpveiVUaH8Fukt9tcBhwvhxZ0GvRqsQGAMH/kueb6DNumTpW2iCRMzRrFx
	 sKt2qRDlQ/Ajya5oMsrcQYU8K1QGRWAEj2TG+8ieID2nWmRYxe6GEObSLXt0zPFN/rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479856;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-ID:
	 X-MBO-RS-META;
	bh=UGHO0Oh1Rp8gcSmbv++9QDYR9aE1sJ5oXRRAH09V9KY=;
	b=qFpwp5xJ6MOavRIdzybSqa3ed2Tb+KfnepywpO6mfXjzs6aECgrcSQIJknx1hKTw300n
	 Z6M+ql0OjskIrOUpB7Gx2GbbzKxyFbR9mtHJZLSKKQUCQ/R6b48D2880KKqG499osmdLA
	 4Os5RbKcYsYWzzPce2klsZrppgKbqBg2KbCM8kF0u+VUD3wU2V9l+2SgMVd2foNVTvGXu
	 HiJyd9dD9HcJA8r5JyyAW19l/UHgySMGoxgl0TdAlPZW5/WAxOZ6nHpHowl+0wS5io7gf
	 ykBqqOVddYPjd6ETiNbH41tJPbKSisdvDwRm4d4HlmqhNKUv3i6F5BYiYlSd8gwKL6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=DM0OvQP4;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890DD606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 890DD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=DM0OvQP4
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4j83LN4hd5zMlhM;
	Tue, 20 Oct 2026 09:04:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792479852; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UGHO0Oh1Rp8gcSmbv++9QDYR9aE1sJ5oXRRAH09V9KY=;
	b=DM0OvQP4GTfXcW1vfu50tNwsjH/l1xcwlD3CfsZQOsNsJKkPkZAOSGoeV2kzFaAYWGdHG5
	93WI2Zs8/ydIcT/UipgRcbr/OEYAetQ5fE9PwZcdJb7YpU9hw/6aIiBR7gHXYHWlmsCrb8
	Yv3DS1/985/m7ROGuIfNFWBJgYMzpZmyOFoLqPsGvP2E/RVhbjzLGeb8LP76a4rRR/M/Oo
	JRPRp+1StcU6DbQxqrye8mpVx2newQypfnfvtatDyBJhO3as1cFUX+gc86drDlIFR6J29b
	TNKDtEYSM1TuOsiQPD6sbB4zMX2nnVJe5pCb8Schp+5VGjacMh8GX6ZAN/MXSA==
Message-ID: <73fc12734386c9bebc9cf6d3cea4c5f8e125255e.camel@mailbox.org>
Subject: Re: [PATCH] drm: Don't BUG when a CRTC fence signals during a name
 lookup
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, redducc	
 <sushmit718@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 20 Oct 2026 09:04:09 +0200
In-Reply-To: <4dabaef5-25ad-480d-96f6-5feb26a64e42@igalia.com>
References: <20261019161731.2341-1-sushmit718@gmail.com>
	 <30a31088a0386d5f5d53e74632ea9a63566dccde.camel@mailbox.org>
	 <4dabaef5-25ad-480d-96f6-5feb26a64e42@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-ID: f3da3a41ddf652a8c5c
X-MBO-RS-META: eqppfy79ui5huuypzdaxqw3p84bssusw

On Tue, 2026-10-20 at 07:57 +0100, Tvrtko Ursulin wrote:
> Hm this looked familiar so I looked around. There was an earlier fix for=
=20
> the same from Andre with msg-id=20
> 20260721-linux-drm_crtc_fix2-v3-2-afa8c71506e6@linaro.org=C2=A0which seem=
s to=20
> have fallen through the cracks.

Oh, right. Good catch.

patch =E2=84=961 still misses an R-b.

Seems CRTC is one of the collectively maintained components. So one of
us has to push it.

I can do today, it synergies well with my new fence RFC.

Regards
P.
