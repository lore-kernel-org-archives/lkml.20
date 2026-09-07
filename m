Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9D844062B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770510; cv=none; b=tfDqvcxwuTYdAEZ0YO29RfA8wh2/bcfiT8O+l542e28T2yZz2TI0uzyH8LPQ84kVwZKlgP8MeWGxJe/7dTl2LG93rKym658lPbrxDhZJDkvTYAYGLEz51IT5gADoaZEL2NThjG+H4hn7OviIK/S2R9wIz3zPVpgfit/v2Tr8Szc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770510; c=relaxed/simple;
	bh=uNFIzY4JXjCeEjBfCARmismymHNT0T9fxAim/+MPT5E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DASijP9loUJ/GScFrMm48EmpUdEZDOtV0lWqouYWQ986nHlz77/geLqNffk1WqKg55oL/bMWNlqkXKdHxNQf/kOuXXHoe6C8Y5S3wyKcBL5Ha6WtxEJXo1B4UupoMTD359ElfEB5HvpHXvp48VZ2VfJisQ7QrrWLvrOfDIY+c0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9upFHyB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9upFHyB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso36795105e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788770506; x=1789375306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Z6RPCJ+oakT2xFF52e3X6co8pKDgzKRCpw/dv6H1tY=;
        b=d9upFHyBVqcgQto8vWcJM3jfNEVmMI1nN5rOXqtIfoo2ghsmtd3b+I5NSXovEgGOwP
         kxK1n4McPeCHaarFrJtTQV+LZDn7tdoGJ/ssqbeaitgZjIWIswP2QP76h6urug44ZOWw
         o7EErzMGF8dVZWpxZayXd/DcAN2RoiqproHuGGrFmH/B4K3Sw4bXO0wQbjIXzyoYKyGk
         SSiAKpj4NjYF6o+IwuEXn+p8yK42VomeiK0DmF6LzG2Nd0pO2yR40D6DNOyjCjob53fZ
         CTZ4ouNkpp7wJdOgCX+YiEDr0/AGw3ihFDCq5vPQkJKwa9QYNbFrSUYjUjB3loB3/bKs
         aGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770506; x=1789375306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Z6RPCJ+oakT2xFF52e3X6co8pKDgzKRCpw/dv6H1tY=;
        b=IQZWLChV6bR+taqFtscrOHLueM9uJ7c/U4SzStUE7vMBzo8Wg3TK8SWgUflhk2sO/y
         jWtF77wy3fi4U7yI781t44RB1BEjfZSQtKjKh6g4+gFZk32V4mJ68cRdP/hT3j3Ul2ow
         XIwC/N+Sm5OCKdo8bJRXCXd5WyT55MMDnLIYrNh/xMFxu6+ZH3eM2jYl0+7lFPOzC0d2
         NyB20RLdTeyoIZPTm5Hh99eT4rMvrHX7u79NFlD4fAv9LgKOhrA5Y9rMtJNYtsOKKCTH
         7uG5cE29uE4lp5VvqiH4ZQnDsHikBwkdBup8Z3mTaxtdcj+Wgq3pprJnmBp21/ahsu+0
         W1hw==
X-Forwarded-Encrypted: i=1; AKwUvBwrVoSinGxpVumy3mqdaVhVCQsAmWO+mIw50wbJ9/iEbVLur+VLvHvPetZJ7ps9sjZj2L/XG21YZm6868k=@vger.kernel.org
X-Gm-Message-State: AFuF++laYAN2Dlq+rfl40h2SVqye/H3aj9uWL0kkmH0quZhfED/4+AEp
	VeHvwtkhSBI6IBUn5AgmIQz5d/B/wEU4dkQRiZUALFljitelxcjhZOT7
X-Gm-Gg: AYBFou0Nch0xrGmyjuWUMq60n6jXvt8gjOS2BmS4EiMlk+8mEaVZCT+f55T+Q9ViJKG
	XUysBBcmRrkea5BvBv3ocdxTIWgVfW5AcMNTwqwSwxogCjoBKLobrjR8SbxMA01HX1swy19D2Xi
	lGX81pJpn+qq+L8kBuMF1gdnFlh01HF7posGvOWPleykWYqcix35ST2vxq0F5KkqMGa9O8QW/hJ
	0ogmp6onknuiutGCGB8RTDVr/hbZbxjPat1pecterlhEnkdWCGkkBWCrnO46NMRvTcsK6YHcrzj
	Wx1z22a5DVfNi5hqZWaPd5wSFS9L0IzFgifdxxyclsMj8onyfnK8G/iEEG3yPgJ42jUqRN23eBl
	GMQ5eZzM2W/f30MZW+iKg3cP6NqRKo5M1YwtdIQzaJS+XCI2/0wC56ytNVJFarQffP9vIGvKtdX
	RpM3FMv6NUd+Ih2AYDQjktn1tQHaiipd47YPgXrjkGeXsha0pQBy9oxgZjrBsws9QQqo395DdZS
	+Oyne5kYnMMPe1NawMyj6wcdrXAbJHqZoJlpkUODxuXJg==
X-Received: by 2002:a05:600d:848e:20b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49cf824f697mr151249175e9.10.1788770505776;
        Mon, 07 Sep 2026 01:41:45 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm27883762f8f.30.2026.09.07.01.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:41:45 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v4 next 0/9] locking/osq_lock: Optimisations to osq_lock code
Date: Mon,  7 Sep 2026 09:41:24 +0100
Message-Id: <20260907084133.3696-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a continuation of some patches I wrote over two years ago.
They go a lot further and reduce the per-cpu data to a structure
that only contains two cpu numbers.

I've fixed some broken/missing memory barriers but left the initial xchg()
when acquiring the lock as a full barrier, I think it could be relaxed.

Tested with a userspace harness that can conditionally sleep at various points.

David Laight (9):
  locking/osq_lock: Add some comments about how it works
  locking/osq_lock: Save the cpu number for 'prev' not the node address
  locking/osq_lock: Set prev_cpu=0 instead of locked=1
  locking/osq_lock: Delete 'fast path' code from osq_unlock()
  locking/osq_lock: Avoid writing to node->next in the osq_lock() fast
    path
  locking/osq: Use cpu number for 'next' pointer
  locking/osq: Use 'unsigned int' for next/prev/tail
  locking/osq: inline encode_cpu() and rename decode_cpu()
  locking/osq_lock: Swap next<->prev and tail<->head

 include/linux/osq_lock.h  |  10 +-
 kernel/locking/osq_lock.c | 286 ++++++++++++++++++++------------------
 2 files changed, 154 insertions(+), 142 deletions(-)

-- 
2.39.5

