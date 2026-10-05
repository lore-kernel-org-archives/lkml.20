Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40E62F28FF
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183182; cv=none; b=fzsHGRmx6gTq1hR7xT6fJRqkbKsJT9YQh6A5742biQwuA5pz2no8yMntO20gOlLjqZd33di4eq0mlC9X32hBXi1W5FNPX0J+U5i2oOQXsk2hl3xeZTA9p9BqF7ha8bHKoSl1HiHNSb1Xa/x+lj/abvczmrIoqfMheD6KCQhdAZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183182; c=relaxed/simple;
	bh=SxzbEJ4Dlj6z7Xw0SIJIx9HrjeJuQE3LDNWYnbtlPuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y8iyg+edRZaUTxaXkhcZpJt8JhVX3ssML7n3YnrGr1++gD4AI3g6TS04qJWk98ge66Z88blDMu2+DT0DcVQGEkh+gIqpwqywYKZeQBhLozCWEaSO78BmZEzoGEJRucMQJOL+uEbfFv6KvCSGWP+Cj874ry8w13nK8l63I+BelAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UcLVvGXq; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcLVvGXq"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b08452cafso918603f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791183179; x=1791787979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R+cel1ot2Kfg8JeSO82W7kcsnYWCLr8nwIFUtN9mXDk=;
        b=UcLVvGXqtFZPC7h3viRaPlu6/SlhmRC/Ybnuzd5gbsJMwKG5172TKUqnQYTF7/6omS
         Rp47doehcjE4EsO8uF6YNOv4ATNAOoqHQ4O+Vru4029eZxAnK/7By13NWzjwrhO/ozXN
         Z2citDdF6eg9bBmhJP+G5R/OjsFBrR0w/DqTNpuX/5LZaT2guGpONqYX98+yThWHZDS1
         j5Zp/cCe4Q6LIbppPES0A8wsmISz1DKFEG+s9kQIurkuiYH17LInIauooi+jPMf//KUS
         aIap05UZTbxZyNwS/pqxaXIOMz5Xpjk9b1d0tWBPSFjhq/ksNiJycih5jwAw02iIU2ii
         5K2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183179; x=1791787979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+cel1ot2Kfg8JeSO82W7kcsnYWCLr8nwIFUtN9mXDk=;
        b=Vbfl2x06ExqIjJJ4HQLRponwdsYdIzUkYxJeGXCmKIPKzsoWH41XJympzAQjgtW4HF
         l6Ug60zkhfb+0YwsByk8j8U5mmXk+jLS5Djto60blpZxwSTfM5+Mio+18HFCef0ROLCQ
         SSyzl9eHF2vUTWpnlA4DURP+bu0XPPti+JVub47T2L/NjoFjNH+NnSwByManVoLZD1mX
         bo30dgdE5hX4TIKlVUKluwv7CvxX/IkAwwGnbuHW0ORUHgATH/5IvohauGDO3024ewoT
         MqHrn+TQhpTggbC+bPM5HvIY3semz45S8QPZwsDOE/1VvEbydEjox2uZbLKIpY7I+mZs
         5jqg==
X-Forwarded-Encrypted: i=1; AKwUvBxZg4Bnr55KApP2TmHof68mXQR4/P8qjr+AFYgWFtgAPlg4ERhCCJ6lWWEWEFupH55QacnlWqOr7L9O26c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJs9LrolbyohZAA0NammPSiu8EN2iK2r4FKtCoiC5FnMfjiWwOj
	HNhv24P3W5xg1TJWq3KZV8YYuRXK/4mn5dmwJNFFZaUuSW8ccsAk+pQS
X-Gm-Gg: AYBFou2HS9IqCjXvxBVj0uY+VS6jZXNh3aKvzgSjnygf3aGQcGNp2wX/oY08awQEuXK
	vyqUKqveiwV+gzYqpyOFhdOSwDobPaMMJQG9lthXRwBCRNwHbeV93yIu7jAVknWjGkTYVfYO/yE
	lgcUCLUF6ewzgpuCDb/dLdRn/GOUl6tIWHQwTUGJaFibPuy6a4RPMYS0wjaDqkBIRz4Vogcsl3r
	Tuptg7SsxsVvSkctRDCUlpl3MU0E+RkMjclNP0M8cjt6ObCbXxxM8+ED63/aypPymQ6T/Rpufpq
	8jZgpJy5zCh3toDXWOkuo1tOdLJqIFtbFmT4klPYwOgwGdr4jsZsx5e/C9WiZWTsR791VRTxNEZ
	KkAEhvNonf2k8iABB/Gx+mq8jNok99YX1azD776YcvnpPtFVeQ4Buly2CrfCp/PHAeRtA7WddON
	e5sKUL2/hr6URDrdDtp6+dyW38WVk8MaIV3SygggcMYSvhd7fQKPlS/CnGIpKfhWgn8A==
X-Received: by 2002:a5d:6f0f:0:b0:488:79a2:3232 with SMTP id ffacd0b85a97d-48b12718166mr18760857f8f.31.1791183178947;
        Sun, 04 Oct 2026 23:52:58 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6308481dsm1247436f8f.3.2026.10.04.23.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:52:58 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH 0/3] mm/mlock: make zero length requests a no-op and reject wrapping ranges
Date: Mon,  5 Oct 2026 08:46:28 +0200
Message-ID: <20261005065244.6935-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow-up to Park Tae-sun's patch [1], which was dropped. David asked
which of the cases it raised can actually be triggered, and for selftests
that show them. Two can.

Patch 1 makes a zero length mlock()/munlock() a no-op before the address
is rounded. Today mlock(addr + 5, 0) locks a page and munlock(addr + 5, 0)
unlocks one.

Patch 2 rejects ranges where start + len overflows, or where the end
overflows when rounded to a page. Today these get a silent success, act
on a single page, or get -ENOMEM/-EINVAL depending on CAP_IPC_LOCK.

Patch 3 adds both cases to mlock2-tests.

I could not find the commit that introduced either behaviour in the git
history. Both are already present in the earliest history I could find,
so they may predate the imported git history. There is therefore no
commit to use for a Fixes tag. I have not added Cc: stable since these
changes intentionally alter UAPI-visible behaviour. A man-pages patch
for the zero length case will follow.

The mlock-random-test failure CI reported on [1] came from that patch,
not the test: it assigned 0 to do_mlock()'s error, which has to stay
-ENOMEM for the over-limit case, so mlock() over RLIMIT_MEMLOCK without
CAP_IPC_LOCK returned 0 without locking anything. With [1] applied the
test fails 40 runs out of 40; with error set back to -ENOMEM after the
check_mlock_range() call it passes all 40, as it does with this series.

Tested on x86_64 (KASAN, lockdep) in QEMU: mlock2-tests 31/31 as root and
as nobody, 24/31 and 23/31 on mm-unstable; mlock-random-test and
on-fault-limit pass.

[1] https://lore.kernel.org/all/179066531783.50175.13377521828379196177@dgu.ac.kr/

Jose A. Perez de Azpillaga (3):
  mm/mlock: make a zero length request a no-op whatever the alignment
  mm/mlock: reject ranges that cannot be represented
  selftests/mm: test mlock() and munlock() range normalisation

 mm/mlock.c                                |  29 +++-
 tools/testing/selftests/mm/mlock2-tests.c | 191 +++++++++++++++++++++-
 2 files changed, 215 insertions(+), 5 deletions(-)


base-commit: 33eb75fed9eef7a57e3f77c37c160d3e9ec55f2e
--
2.55.0

