Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564270;
	b=bEzDCTGmcBEA0TM/vj64RMvvkp7rSBUfmtevnMjGOcOw/o0BDJI2hyWhbwHjo0MtJuFK
	 qvegKlbJtSVWfP9MO8tAoz7fS945KZ7cyUSvjnqJzAy7asyTckad3dHBaNhImm6Rw4zLU
	 o+MhURDE2g7wXxU1T0XogoEOs2D+WHYyLsGoqJlHCeic4MEtwZoTaKzqQsaasflXuj2gS
	 5OYogUkH2UZHGt44oJ964jzM7mEWTKP1al/SNZ8R/G/HZrfPzn9PgvZzssbxJEGighOHn
	 TCBIMHAnU97L0sB8uuVVeOCi8ZXRVDfroSERzVH/HgVPx7wJ7PxLXNU1UzLRxfIGkWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3WB24rA8ZdBO+wgJnzmfsh+oAV8Yu7u/lMoaF1dD+/A=;
	b=Msv0auiZkG+AMlLrwx6KCYP0RexovqUSfKea+CIFVLdJ0EswaAIqrcFwr7psS/rEyCKY
	 Fztm8KhEeXX0+gMja0InC50AUW5LYmWEmUmb0BlfIR1d4UsabIFSroTaVzl6x/wzGo7eT
	 Z8eWJTkdZbTxutgvMOg6JPs+OsJ/nMAoYtXy7HylwPI6VS/L/xKSfJc7KOzpgiwKKIoTJ
	 qhBg4ldgFw3el9y/j9gbyrgu/TX1cxKpQfwdSafcD9aG012cf4MRoreXoTyZr7IOexFXx
	 lovgNYLIWb7Ia3+rvwUyTI9piPmFK3uUv3Uq7ICpS6RUyUBPYKr37ydI17ZJ76I/0aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RfzxA4f1;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612F6606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 612F6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RfzxA4f1
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so3299153eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793564269; x=1794169069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3WB24rA8ZdBO+wgJnzmfsh+oAV8Yu7u/lMoaF1dD+/A=;
        b=RfzxA4f1PVbX2u7sxGNuTPflLQ1fOYAhDe5z9feTMs6M6MBCAPDljBc0gP3SXfIB+R
         2xsQLHZXGTvyA1/z45TzuBtwS+ADchbD9ZyRoCk8BSoH0IDZKorT+H4m9xJNByR78yCT
         rqGrdj2cBoruwHwKAUZfc2B2yj9DEM05dkZVl6l1VbFI8EvLpf8pZaoPVS0Fo4zP8l4H
         ttKALzqg2YtgjMNAwIL+rMSXAkUrEIaS1gnluI68RTG7G0Lc3CTS1ufaaXgqsryFHRLB
         6EM9VowZdMHpzsYpOdbKTkGYBEBWXEP+VHEb4biCXUrprCzQzlLGweXcVMxkwXiFN0MZ
         IZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793564269; x=1794169069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WB24rA8ZdBO+wgJnzmfsh+oAV8Yu7u/lMoaF1dD+/A=;
        b=sRz6Z/82vxhDga5o+xd8eO06vwW640Gq/pE8XV8FWd+jGmSjUW0adKo07bzPxo/1gu
         cCrXddbQUniRZ5llbLE8NwQ4dWFirynlz+RkqlSnvZfZS4Z2gGhdNeRDvT7Swkf6mCIU
         Y4oKoWo0FCjfsURhxeif+t3bPGu/5qnHtXGLidbAV4/A4tn0bsiJvffxmR6qlsVG3HGo
         GeZMkh6tlTLnQXAKdEgxHxc1zILE3ysmDZkn9SO3ZklmRdWqCwS/TGrv+7I+nHOiMgvq
         xTgc0GJvzWuIIPPywYffNUsqaS5lsGWXG8Tyrj3m6tV5UbsIeEtcOTCnBYSBGjxIduSt
         Euyw==
X-Forwarded-Encrypted: i=1; AKwUvBwMveluC9R6dsShlgu18Rskqb8NaKpIyt3gVo1JpaXiXaN3YY/muOV4iW/ainXYORVtVKEJF+yuX+/6vT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xu0+oqpHpk1WQNMopgbokI7pv3Y1ZQoxbfiFJEHv6pWttcE47
	KPCXDLMMAZ5HhqXpjNsnLZwxG+8HHN+d+YUd7TebyFRn2bCuZKml1w1Q/z6poA==
X-Gm-Gg: AYBFou3rBPnwhEqMvJS+V7rqAC/L+XZeSFykeQ3OMv2ABEljQjNF5BFLathvJMF2qOq
	9nKCH9EdXYzvXOYa8ZV56HyH1nVkxSDpOib6K1gB47yPJcXCcqvO2Pv2GvcPhZloeIKHGJ2TlCV
	zmS1GjXDkZj/eX/yxglvlcApPLPa1jUbMinBvRTzeU4gSSQHRR6sxPRlG5R+6r6Y/nGtVGb6OWj
	qhGQ4zZC1+mEnbRNJYDDMxXSi1VIAZnXSZu2WQmMbEY12a+9/S5whCUyNztcBteQUeqz1VSBo3o
	iR5G2WC54GM3nChh5MlgD0KnDHzD6zX7UJPq6x6149Sze6G5QJeIYY3wDum8iH3KyHc+/Mi3yMr
	bOqA/2ztwKQHpIa8h8w8nqUnJYPgMvFoVQyY3J+lwDjqNv4UScGpfMzhF9iKtsua9nJB9SdPKXl
	vW42q3zODXPwivhPPS5TqOMXC1f1tAF6MLiPm8gaihBycEtokOjBDyH7sPJYsjrLEERV+lSgE58
	V8losilTc3rTj98TCR3J/r10521aG2TF6GBhAEYsKx+gLQ69Jk41u5J0djDHYbQORE0anz5WSnh
	LEAZ0JIHDycT/zPCDb3ERHhoQo/KdnCc5AR26cOk7J35Joer7A9gslk4leXQp4KHlQ==
X-Received: by 2002:a05:7300:e9d6:10b0:36a:1e0c:e28d with SMTP id 5a478bee46e88-36a42206318mr14066567eec.4.1793564269096;
        Sun, 01 Nov 2026 12:17:49 -0800 (PST)
Received: from pranith.org (c-67-164-4-239.hsd1.ca.comcast.net. [67.164.4.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm26752101eec.10.2026.11.01.12.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:17:48 -0800 (PST)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pranith Kumar <bobby.prani@gmail.com>
Subject: [RESEND PATCH 0/2] eventpoll: scale nested leaf additions
Date: Sun,  1 Nov 2026 12:17:29 -0800
Message-ID: <cover.1792432666.git.bobby.prani@gmail.com>
X-Mailer: git-send-email 2.47.3
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
Message-ID: <20261101201729.LnbMHQHlKQXxY1xpkvBv2g_vE4x12fmkOnR1pF0RIeg@z>

Adding an ordinary file to an epoll watched by another epoll takes
epnested_mutex. Workers adding different files to different epoll
instances therefore serialize on one global lock, even though their
reverse-path checks do not conflict.

The first patch freezes the epoll topology with a shared rwsem during
these leaf additions and uses a hashed per-file mutex to serialize
checks for the same target file. An epoll topology change takes the
rwsem for write and retains epnested_mutex for cycle and path checks.
The second patch separates the generation stamp and topology rwsem
onto cache lines of their own on SMP builds. In the tested ARM64
layout, this also separates them from epnested_mutex.

The series was built and tested on linux-next tag next-20261016
(7.3-rc7 based). Four workers each ran 2,000 epoll
add/delete pairs in nested and flat modes. Throughput:

  Kernel                 Nested pairs/s  Gain % Flat pairs/s Gain %
  Unpatched linux-next        1,558,641    0.0%    6,736,037  0.00%
  Parallel additions          5,325,959 +241.7%    6,771,375 +0.52%
  Parallel + alignment        5,487,081 +252.0%    6,780,276 +0.66%

This patch was developed with AI assistance.

Pranith Kumar (2):
  eventpoll: parallelize independent nested leaf additions
  eventpoll: separate nested-check objects by cache line

 fs/eventpoll.c | 116 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 90 insertions(+), 26 deletions(-)

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.47.3
