Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6B54B3C94
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176480; cv=none; b=b1c+cLvDACzLzAt6uoHwUuwgUkzCGkauF2Vt4hbitzla6H5DYIMzsSRwK1Y+pRAJdK/4m1z2i75VnEpxf7cWabg4mQRBGGDlR25aq1gdHy9DFKkhRpk6ypBYmZKDor67/eT1MPpWvfjDzUJj2NkpycbSZqjg66DR6082SSPi7tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176480; c=relaxed/simple;
	bh=9HaWzOKfnpaXCLuhegUHtmuWqks+3jlaF1gMhEmsKRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fM9fmHjZeC+fBYAqLXLSQNNOFFt6ZgI2op6JcGqKIEzcKlXis0uKgMqIRgToxTP1cLIC0eLq5mDSL41TThTxaqztSs/BVD4+Ujw5fMrOgylR1DM+6kC2Oxbv3BfXXXSysisvQfbJ4OqP7KmU+QPDFSGkuiCDcR5WqoI7cdP174g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=cWiGq7hH; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="cWiGq7hH"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3550c917fd3so236568eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792176478; x=1792781278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ic61/wqBGtfRXKsiAxz/tXXdVrm+pW2y1wsldll1w/I=;
        b=cWiGq7hHOnIm3ZX+xWXvn1LLHgSwL29Xd8Ej38K7tW+XFEWvPMBt8bSedxyBPDhbGn
         tisAQVd2r/5sXBgmzgVnMEhRB3GqCcLrJxQQejVt8gVehlKNcB5IFHqREwBli4DFX3J/
         a3X8NPtVFz6YTbaXOKu9RHCcZIo4ajWIjZM1rTZb8lwGi7cUjeci3SYwdYYBR/f/Cf0T
         eeOk6ap+0Ldgc4OTRg6m9zfoDAd7521NrH/3tNwT96ZvzOl+/piScRqRFNpe631wfG+8
         kbDjRHsRLSKjSYlfaVafg1xM1y32bflyCrD9VMZEpNzABGZ4rjllp8TgqSCQ7VN2czXZ
         PQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792176478; x=1792781278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ic61/wqBGtfRXKsiAxz/tXXdVrm+pW2y1wsldll1w/I=;
        b=DfyI7Ony8T4+kCZSyRQ/09ovaL14bFmRbCXHUWXmM6yluZLmFJruZyQfnNc8U6xomu
         gXY4M690MVqxkcU77slsSeKtrEJHoDt6oVEjQswxZ17B9Pa0ypxfHv396ZRe0dh47FiE
         vfhZNqdCflCEy6Hat34ZTgFti1mCcWv3OFBHAT2ZzCzNloTJIgVDdX6WckYdD8Ef6uXi
         SH1cg6xgqIeunuAlNCL79CwCgFmn9Pojo2Ghh9z5IYrJ5oI/TGoS1GNvKWLrgVGeMIYM
         AWLVk4f/wmLUzBtVw2FgzYam0SgEGglBAjfr3PeC57fiWAv2wVvM5VVUrXJB+tc2Ldun
         4oxA==
X-Forwarded-Encrypted: i=1; AKwUvBwCApEeDTsmekrgUsGqYzFhHUVtE0mk0WuIUMsno93n6OUITjXrpF3+vmENn8XBoS7lt4rB+cfa1DkFZR0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF0eByk8oTcyXN+WjCkYAJhsffD92Y/1RStHmo0+QKMycnVeMj
	EgByOjITvBd9bq7SqlHrzMLTzzkrNRwx/syXSEuKvjovTDpd87KIGLvOmLFiaizxjOQLiqc0XeD
	RIpoJY532hA==
X-Gm-Gg: AYBFou2ZU6a00fXd3t7q8j8aEmdn3iy0itScnYSIuQKR4Szz/GFpoYcaxlbhV9asmdi
	EZChmFZI8M/upeEbFDgcLFBwqYlQAOmCZLZK4gE/36VcDLul6DLfesDx7MmfqRwtQlchJATqh+B
	cMJ3Z96odwoTvy0RHVmXbnEEdz1V5QhNUH5QioIbCfJ7+7qLWMntWYQI/WGzT028J8U7PeJX13r
	X9Lxs/6exo5yP8MQOeHMJgaZld5a3XrDCkrFOUUpFJQr+hpq6nUItOATO468D4FJVOI5QKvt86m
	hcSvVhK8tE7D6I0UveQYzALz9VxXTnVoNPVuPrMdMfl0LYiPwpyUzB4Bw6JNY5aXNvADbdOhp8a
	1/2bDBjZrIY0qUo2YuDG+aAvOCn1jLW+jOmJHX4bgDXDf2U0YYe97zsroUjNms3bFu7+fQNxqIo
	8fN+H8g0HLR5F+3xfutZN6So5G3YawPiyEe5qDNU1fknGUiRuBO7wBgf6SxPaNQYlk9qQXpku+K
	tTgITlYbnftgQ3woDgDLGJMcBgo6U0qRobdAsTHNzM91R0cpc+YczEIUGvcXC4/ODUfoFq7Mazj
	yqetZA==
X-Received: by 2002:a05:693c:62d4:b0:35f:2349:a570 with SMTP id 5a478bee46e88-361a2a3832amr578015eec.35.1792176477713;
        Fri, 16 Oct 2026 11:47:57 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:85ee:eb9a:5637:424d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm8004502eec.22.2026.10.16.11.47.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 11:47:57 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: axboe@kernel.dk,
	kbusch@kernel.org,
	kch@nvidia.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y 0/2] CVE-2026-64017: backport fix series
Date: Fri, 16 Oct 2026 14:47:51 -0400
Message-ID: <20261016184753.27189-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Please consider this backport series for CVE-2026-64017 to 6.6.y.

Apply the patches in this order:
1. blk-mq: pop cached request if it is usable (fix)
2. blk-mq: reinsert cached request to the list (correction)

Patch 1 removes a compatible request from the older cached_rq list before
preparation and QoS throttling, then initializes it after preparation. A
plug flush can therefore no longer reuse the request while submission is
in progress.

Patch 2 returns that request to the single cached_rq list with
rq_list_add() on each of the target's three preparation or merge exits,
replacing upstream's shared-exit handling.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested as part of a cumulative 6.6.y series on x86_64
(allmodconfig, CONFIG_WERROR=y).

This backport is considerably more involved than usual. 
We performed runtime testing to check validity and stability,
but would still greatly apprciate another set of eyes on it.

It was runtime-tested on v6.6.158 in a QEMU/KVM guest (KASAN, lockdep,
hung-task detection) against an unpatched baseline: blktests block
group and fio on null_blk (none, mq-deadline, bfq), virtio-blk and
ext4. No new blktests failures and no kernel warnings on the patched
kernel; no small sequential write throughput drop over 5%.

An LLM assisted with preparing these backports.

Thanks,
Artem Dinaburg
