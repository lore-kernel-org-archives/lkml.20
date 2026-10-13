Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D3B43BDC2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887315; cv=none; b=sZmK1bTNN6qOPxQ22p8JdF6lyHDjeSoQvRcy6FXvsTG+d1Q3e7CGzsjRxwpXvi2k+iBJHUgk5oH76FNZDTfouukxTG3GhGKFvY+TzdZUVgXxK7gI94pbCoDM+p/Z1UdUtama0pbgE0TqtV6Fc8kQzuJzQz35DZ4lufiLtTWf6Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887315; c=relaxed/simple;
	bh=DiIDcokahbncOnRLXsQa809r4EUcP4lOEkQd0uAUbPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNeHe/GlZ9ctWt/LKGfFahYiRvoMvx4V0xrjH5XD5IY1nPGC/Oi600DXfchu9Tuf6O+YEL6xqgruaNmZI0lTijmWrKC2Jt9Gsm/aw/IEPQIWsL+irB6vARVPTS4cCRbHjM+gABC5dksQPyGEp2VOilPCzZzNU7CqnwEUaoKajL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=u2qUpuEw; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="u2qUpuEw"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1679451a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791887313; x=1792492113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GhN5QPUwL1Bq4m1uEuHr6tNGLQly3fEYwhLYLsDwGEw=;
        b=u2qUpuEwzv4Kgem1llwRJBoFPEKaZ8LlytKcbzh+q0Yom8Crr2BgGIp1IBWB6Yjk23
         44dZg/Z+HUu3vI6sjLNEW4ikEsYMeOL09oaSRjKw8alpo+w4AGXJ3NMWkW0tEZdKmaSO
         +hbmTKZV8UqiGFtA9cbiQwt9OcbYjD/8UYaV+dQtprSCBgVIPnYI+JO+t9J65IfOgjJW
         mDjFGmri1Y3OSRm20H2m8Te1j0jpTMFoJ0JY5MqhwGT1XhJgG5nhRPSG/G40qzv8YcnE
         34OoIZsggUBTGkPGJtk0/X6jK0J5Cd1Ftj24GNkBcugZP0/Itbje9jnPd2Pc+/yGaPdM
         BjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887313; x=1792492113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GhN5QPUwL1Bq4m1uEuHr6tNGLQly3fEYwhLYLsDwGEw=;
        b=A0BJJjAfBDYqQuJ+zN9ClwA5SjDbFvVvG3Z+AdrqJ+BNybvhN31/x+sz1lBU5YyQt2
         OCWSF1R5jQNJgpHJnpAP8kqGqQk7qvFPPZIYsT2681x0+xLpXeyf6plZBcm+c3k8O+8M
         x92Orp6piPDvcL9V+jfsnZ5vtDx8byla371HGApEGEGd3vVAEUdEDeXfeX2KxGfxM/yy
         I5WnKe9KhG0lFbU/Ow8h3GQJ+VGSgqHpB0+tIzQX340yvo78+jTzVfdylEgDYUMJyyLv
         W18Elz2xxKua5MlghjoW4ryZETVByLNnCyZ17jDOurdO+EVP7Ra7MA3g/mf1VSkUHcGA
         yqBg==
X-Gm-Message-State: AFq9FYIaK1zuwyxJYWLtRwjf3OCZN6bMMkzYcoc6pk1tjlm8USXRckOK
	tDkYThH/Mr1pBJK/DFxV0zAd2s+cngkxDkSTEk2rj2SvqjkV8BIQ6bP6IVHYVSxcoLbv9fhT10+
	ccK7VYf+X9Q==
X-Gm-Gg: AYBFou3upxSDsTLzwoS9YBflNcSlKmj+6IpXPDbz5FaZkIT9qlg2ECW3rhZc3NPWBQX
	skOGLWV0yxzIGR9aL2n1FIs3Lh1tGKrOANJyoZhJNlmCxDgA/9LA2iZo1MlOf6IG11S+i+gjpxE
	seqbBbZH6Jk9B9GDT7i0dliL6YJDYGOcJFMRIYfHSS0CuX0Lx57N6NW4SrrDDc93uX/w21u5h4R
	yFHA3iwS31bzuAtSOd+6LFyQRCmw+n1fi7cSR24OB98FqfUuETEON7NootLMv0LUCFPbH08WqKD
	aZp8lGpfES/ttZUCGTfPR4UaJQDXnmfRhpjlN3r0Z8UPE3QHSwEwo8nZzA7jQaE0EBSdqTLjiH2
	b3sGJXWZDHGTXXgdJxBBJaPPNnoitypga5E+9fNHK7ZCvorpVrCOVIK4gLPjkhkBYkHPWfxI8mb
	B6irdzby1/XG8yRpSesWX08Panvga8kqkV6uzIEox44q6p5kdr2XfRdTumiZYOr1dkI9pqJyYxK
	+hP8Q==
X-Received: by 2002:a17:90b:2d0b:b0:3a6:f6b0:30ce with SMTP id 98e67ed59e1d1-3ab3acb9c79mr6801718a91.36.1791887312674;
        Tue, 13 Oct 2026 03:28:32 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed040dsm25809485a91.6.2026.10.13.03.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:28:32 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Kanchan Joshi <joshi.k@samsung.com>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] nvme: bound FDP config log reads to the received buffer
Date: Tue, 13 Oct 2026 19:28:24 +0900
Message-ID: <20261013102824.3020520-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <66bf5def-eabb-4c9f-bcd5-0143655ffd1f@samsung.com>
References: <20261008182453.1262733-1-yhlee@isslab.korea.ac.kr> <66bf5def-eabb-4c9f-bcd5-0143655ffd1f@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks, this is cleaner - I've folded all three into v4: the minimum size now
requires the header plus one descriptor, and the per-descriptor check is in the
walk, rejecting dsze < sizeof(*desc) (which also covers the 1..63 values the old
!dsze test let through) and requiring the next descriptor to fit.  I kept
kvzalloc() and the unaligned accessors and added your Suggested-by.

On the get_unaligned part: I reproduced the out-of-bounds reads under KASAN (a
short config log faults nvme_query_fdp_granularity during namespace scan), but I
could not exercise the alignment behaviour as a fault - x86 handles unaligned
access transparently, so it only matters on strict-alignment architectures,
which I do not have.  I verified it only at the code-generation level: on an
-mstrict-align build the accessors emit byte-wise loads where le*_to_cpu()
emitted a single load.  If you would rather not carry an untested hardening, I
am happy to drop the unaligned accessors and keep just the bounds fixes.

Thanks,
Yehyeong
