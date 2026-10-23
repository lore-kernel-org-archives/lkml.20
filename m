Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798104;
	b=TswylEFW7pB0mCs+2G9DzCsa+oG/CY9OsuW98nDRewvo6Gw2NpVcs6h05WTuyv+XzJRx
	 29mqbgQb4qIFxW4T+0ESlJevHY+D+OO03Rm15pBQ49vFiD2elcCmTB+Bls/AVipiTW+iU
	 RuNSQDou1s1Jp7T6CMgBs/vGR8Ni/RktVsHheVofUVUYH0pPCkcVP7MfKSCS7RzWD0BPO
	 NcxW430Uqwh3cU0/y0biWZearbG+MdC4dQLh+qtS40MVhusc1lVoeUMmJI44DHe/aiv27
	 x6X8b/rS1c0GlrjYJvDZyFC/j5tgRFQnrsGe7WRjnFzISNCQO3oBukxdAcgPFlp4bkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AhPa34WjyM0Rk+T0nHyrrXNrKgrug39dI/CFZCoWjh0=;
	b=jyZ0lOtW/Bo0bGJhf2JYNUI2gwW7za4CBZFGk6DtlnqxFOuRcAEUAV4sfiE8mVvW2zra
	 58HETSmgL6IqW2BstgvosVLVYjZDgc19jJVsJUUIt0CRZtAcclzIwt/qupSgP/QUQzqpp
	 8IN5ImSJtPQAJUYhxWQu8J6q/tKqK1wNoTO3YWakgs7YNysd9YaxIEpOShPmLo5YTt6pP
	 eKbJrH0+6aDHQsQUvV0zqbHz/BJ4jxOHjbjz1RyJOOqvtwzpc+gMnr/0fU7oSulgUO+Hk
	 aEhpVrsZNuoesIlqtnbjmgSTfNHl0drRhoTggnCWzmRmYrNq71lmAb/NpNjE31dFNrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=euaf7HDf;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD9D606A328
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD9D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=euaf7HDf
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so558476e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798102; x=1793402902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhPa34WjyM0Rk+T0nHyrrXNrKgrug39dI/CFZCoWjh0=;
        b=euaf7HDfGOvMTtBYQz52bNcERTURIMXSM4+PjNFp86cK5pUaVQXlZR0zTCCky68xqh
         0uua6T2fBrdEDDr0TjfMj9RMcWbAut/UlY0jWEH14aWOy7PEnjDgqZfp89KoxnyWyTo4
         AiUxIx5WNSpaz88zLBTP5gBq9yYnaR/nNpTSKZ85WuSHTVG3n6A55Hs6l6HNze3ti7Rz
         QG57o5SfLcR2fuUI6+ru5Zby5MmtCi5dm/LhPfgdY3yE6oU9x+gjPi5YXua4gn5jamS0
         4Qh+RgM/iDhhwewSgrOYmRFvT52OmIl5JFjt7QlNqx89gVIU2b3mkUgeafM7e9Y5s7bs
         W1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798102; x=1793402902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhPa34WjyM0Rk+T0nHyrrXNrKgrug39dI/CFZCoWjh0=;
        b=uA2cq8q4fga2xfNeILiFbCQ7Hic8/dPDfwdqxV37Wru0IGxOdkTjfVHIiGpMXUOGhE
         iWIxst5d28MWOpc/le9wImR+mQrmn8T4FpAgtxd88dIcEV1y4Z57zW/IxtklkjCKC1ei
         XFAplBDCKAKhScFZNCrHjlCHjy3Cfc0J2AJQNvm/5UawuM9NF9miKFejsIlmpfhoxtlH
         kpJSFSvU+Bjc88IGrEmOEM6gZ49D+8dgotSl+Go/GufBxkaBGqj3m4YFdFuEE6f+07SR
         WkCE4Fyi7fDxT3braWviRKy8RPyUxY4WVEO3/uiJyKvsf68QKbCvUBLC56rqMi0YPw6k
         SIQg==
X-Forwarded-Encrypted: i=1; AKwUvBwYIIpsQjPIIhFcPvja6mBQkcA62w2D2vnm/WLZaDTel9MHY3u8H21BWh0r047Q1gDYS9trzYTLJ2Iw+JQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSRmnKeR0W7EcsGLrD5wUWJWn4tMi+2lxj2af00CFa8xKqMMwH
	qCrX6k+htH4JCRy00lBkoAWCYOTXdCVcmUTMO+lCtkEwngqEbxl9aUye
X-Gm-Gg: AYBFou21pY9EzS4KC3tAWs1AID+uCkohaJwcT8wKMLk7+4Stpf8VkMVkZYngdTqlp/i
	wBNU4aLvox0ETWMB8HrbUiOAeGlfZIHqXpgSpRLAR5obV5cQMiLEw7nyb5QF04p5rdspUZgSL+j
	cSNPyfM0dG+t/S3irfZ55BDundU6oVWpMXO0+70y9T1QVSXgS4dBM+4NDWvn8x877TPyV5AItAW
	5MMBd2PXh8F5nP/0JEOt4iis4eqJOniHQYj8v8qaI4hUEEltcf0fMWQPkSVSoloB65A8HxXK3RT
	uXDhtJtDhv2o9lfM+cdjhvAhAfqUS0waMd1JSfrU1mAyxgfag8LB31w/a8/L9Z2XwHWkWEmyG3H
	kG9UlIXJTFApQIo68dZnn9Y4CaYsBj8KdHpzk8MsPQyiqQU/KccbjRj1pI2g3cV9tw1I4NSZV+Y
	tlxW4U2CA8heaJCOtK6Fu5e9665Mw0PciUHpMlU2SvJVi2AOt8Q6jhx4I746JTsSR9jRDFlzoHd
	VJWs81iG+UsGxplhj1gxVlawLSk/63g1GJHODRxA6Ojdwvcx0rr64STNnPM188JS4AFte312Jq7
	YrFx9lgGmLOFC6Q031exM4U=
X-Received: by 2002:a05:6122:552:b0:5c9:c60a:e9b6 with SMTP id 71dfb90a1353d-5ec232dd5cbmr149854e0c.22.1792798102466;
        Fri, 23 Oct 2026 16:28:22 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234a940bsm418764e0c.15.2026.10.23.16.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:28:21 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v2 0/1] MAINTAINERS: mark HPFS as orphaned
Date: Fri, 23 Oct 2026 20:28:06 -0300
Message-ID: <20261023232807.206097-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023151850.96475-0-breno3011alves@gmail.com>
References: <20261023151850.96475-0-breno3011alves@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the HPFS series.  Based on the feedback from Mikulas
Patocka on v1, the approach has changed substantially:

 - Instead of removing the HPFS driver, mark it as orphaned in
   MAINTAINERS and route patches to linux-fsdevel.  This respects
   Mikulas's use of the filesystem with OS/2 and the fact that
   MAINTAINERS still listed him as the maintainer.

 - Drop the stale maintainer entry (Mikulas has confirmed he is not
   actively maintaining the code) and the personal website URL.

 - Keep the driver in the tree.  A future removal can be proposed if
   no new maintainer or additional users step up.

 - The HPFS_SUPER_MAGIC value in include/uapi/linux/magic.h remains
   untouched, as does userspace ABI compatibility.

I'm sending this as v2 of the same series rather than as a new thread
so that the discussion stays together.  If reviewers prefer a fresh
thread, I'm happy to resend with a new subject.

Breno Rodrigues Alves (1):
  MAINTAINERS: mark HPFS as orphaned

 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.56.0

