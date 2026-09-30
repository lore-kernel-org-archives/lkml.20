Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6CB35C691
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739361; cv=none; b=DaGKc2YT0uJUvzCn6EDiPOA0gVS+hVpBtvisoOdU9KzIRZ/k5SMOVH+xH5xCQviqjaWFelX/ntkoQ/8CEaGgwAJeF+9mexn8KUGyqRuitpCWUljRr0UGyTuMRdXHJMcr29eUp9TyyeQH56IE6HOSQW8l6Acixb17F5gElN7YRa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739361; c=relaxed/simple;
	bh=dR747zwW1q0VchPqSXwvSIkoWDop9WAag1SPY9rPzVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rxhhtd0BBN50zPr1NWdEXSP0w5PG5yauqF++GPa77qP7wLZu43WrJXbz+b+uK1h91qasPbIppVmZ04Ev7RS4SWFVE5z20Rm6YpxyLV1uLA07XBUNnhU/apOJmahXVawruNNwoH/YSugjztGjNRZmoXhuk7kugKvJs0Xic+5kpq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPoOXJz2; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPoOXJz2"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a48e359e0fso1265693a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790739359; x=1791344159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJdCn5DM6GkKH27NOplYX+VPam9K7OtehdfQdeZW9iA=;
        b=jPoOXJz2Z4Cc+I5trdzVGjhlDNEcHIikUGjUw/M6Cy2/LrCVcJQh6pi/AnnQWy0z80
         tR13Svbcv+HOrEnRWNr07HeAnSpFGSi1Q6JyOxATGWgUFzIKQD7yIQHhKf124WgBPAge
         NRgCilGw6ksDt6se4K/WPKUcTKjyau8uzfX6kPyp00+/y77d0GC7F/d9oXAMdkLOev2i
         6ZN+SEZMcmwY8wBQB0XZtqKu/HSfmo8pBMd88xt4e/WMPATkirQMyyMt55KXXyufC1rB
         YitHXBas9OVyCGTAMkulvtHPEe9JPQQd4kY3TPYvREgH0Xpjel349bsJqTAo/bFXp3Po
         dtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790739359; x=1791344159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJdCn5DM6GkKH27NOplYX+VPam9K7OtehdfQdeZW9iA=;
        b=G/Dt86K63iU00nqJpCLEQypsSEENzXERKllZ5/5k+Z8p0HUH83mUX0fs3S8SqZkRDq
         ZTWt6PcJaRm5N7gNUqqwgsqlkjNYXNuL16t5QedYchyyZ9tBsxy6eF0PxOCcBkox66O6
         wD5OlkJpZQoL9WVp6ec2PVwMyLQmMG2M83R9eQHgkqcfuyIAFSAaSYbDi30pCAz6qxKc
         At+l4HKqooaUgPfluvc4RAaWJxdaE3xVWVYL2WSOnypkcMGd+OhT6SgvbJOayoO5kuz3
         eEfazE8AjBfN3qipKrjxQ8hRRu4UNXb1F4Msk3ig3JzQ+Q0vUE6bKMy1gp3tNLled913
         8tzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsi/YKL3lGGoJBPHecA3nVej4CXQ5NqYVfrr3jznzIKMRtOGE3joZm36gVnO/r7U4ufuNeMCRWUWKqdG4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOJqLCspB59Am5LUcELHUdxeXHFtw+CkBUgdYjnLrjxlooYnLh
	Te4tf8JinhtF4zjgl5rN9sLZJnb4Fuvb0MvDOKvfpiCXUAH019XJ6Qh1
X-Gm-Gg: AYBFou3EglR9c4XAv59psozblG8Z0Ha/2jCQym61f758Av7zXvA8hgQRYvKD+hbAOTL
	9F/l6ZZURkowUpDuoAjFumwURSTHamm2MV53e5/lap8ztP8HJKbAcAvPV5aGgMGzfwPTI4p5b4s
	SniJ0kqpdxk8EolOJ9BLuTmEtuqikDGME29HeQLH+FY+mGMhz8Mq44pMkhlopWHZxXa0VJr4+pG
	MnnqzhEg5OZslRfkxiZM/941YYFXmloNNE2UUkpyZMOTQmmKgNrTWAyS7x2TKAgjJA1fcSZC3oE
	eP8fImQLFJeOPBO1h6ijSQfAKOyUA3OI4kEwHvBlZPeViQoWju7GaI8s4c1queU2cFCXyMGK2aX
	SehT79nsmP0X8QvwXHywkbtBkyx4pAntcXIqfNyDa1zbrYOo+UsSmFURZ9e4Dwh3NCaYzW4nkW9
	+nlDH/nSndhFtNgCSy9S1eMfGXMaf+J6/gyywDNd9vA/u2PV/lbK525t1tcb9Qj5twWw1exhvW3
	x1RLOlO2k4YuSUgIEXb8mMSC1wrIGJUWPu0hEGch0p7sfy7wJZpHElL0q4d7xN09U/EIVZAPJh1
	mHv1mLuP3rXZz5gO5aLYWgJqGondVMHDmixZ8Ngw2fB6qpwCG+6Geqw5OoY=
X-Received: by 2002:a17:90b:4c4c:b0:3a2:b70b:9cc8 with SMTP id 98e67ed59e1d1-3a4d1941780mr115836a91.61.1790739359128;
        Tue, 29 Sep 2026 20:35:59 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce16abc2sm669108a91.9.2026.09.29.20.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:35:58 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ntfs: fix the undo path of $MFT data extension
Date: Wed, 30 Sep 2026 11:35:54 +0800
Message-ID: <20260930033556.169300-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fix two bugs in the undo path of
ntfs_mft_data_extend_allocation_nolock(): patch 1 makes its $MFT
runlist locking consistent, and patch 2 fixes a use-after-free of a
pointer into the runlist across the truncation.

Both paths only run when something fails while $MFT grows, so I tested
them in QEMU by forcing each failure once with a debug patch.  The
debug patch, the test scripts and the images are at
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-28-ntfs-mft-extend-undo-v2

Changes in v2:
- Patch 1: if ntfs_rl_truncate_nolock() fails, keep the clusters
  allocated instead of freeing them, as the runlist may still reference
  them (Hyunchul Lee).  The truncation cannot fail at this call site
  today, but with a failure forced, v1 freed clusters that $MFT's
  runlist still mapped and later handed them to a data file.
- Patch 1: did not carry over Baolin Liu's Reviewed-by, as the patch
  changed.
- Patch 2: unchanged.

v1: https://lore.kernel.org/all/20260927105706.3111333-1-matthias.goergens@gmail.com/

Thanks,
Matthias

Matthias Goergens (2):
  ntfs: balance the $MFT runlist lock in data extension error paths
  ntfs: do not use a stale runlist pointer when undoing $MFT extension

 fs/ntfs/mft.c | 68 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 58 insertions(+), 10 deletions(-)


base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d
-- 
2.55.0

