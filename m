Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605459;
	b=c0FBzL6yjgTneUuN1Uzuei1G/pQayZqt+eJkNxK9yzP/OY5Btda7k3ho5M7SwxREQ0Tf
	 FR+M4FFmxph1jNUHQr5HlB+HVyWrhon0UrviSSc8IbUYfVX4+cMqqQoSnIm1oDeVqZ80p
	 b5BHXS7qmROoQkbdOw/sHjvvyPXU/X/6FtSxKam1M3PZDXspA8eAy3VhKEuTFfNatxjX3
	 dwUPKPIRFYKZtGE0/n8MHBiVgQRxBkjHEjyUGzsd30sn+wfY110Mrbql1fL1r46t1vbMd
	 XmMGghtLc34mHyNv1Zcg0ugXt2lzHFrpHUOyySM5C+V6mBEQCFeHO+1rPofoRsoeK3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GMp9mcTTKC9DHoWvLxRWF3MR+m0EkCxt9LMLL8huxSQ=;
	b=J0OY06PThWXEXFhXcVwENaQ2H0PhvnzzQcjzW5neQttgwj58nJe8B/yiNLOJNKc/IlsY
	 riFzfb58ocAMAEmbMA6pjDrJJApsiD8yULk0ST1wKB3wbzuCZbvVsTkXrVLZ2QWNIsCfx
	 8jF+0dC9A6DNn8pFsJOBaKh6bigOdN4xWrcX8C8tBPuBXkak7SPCxhSmrbNeCBRw5VV23
	 ezf7WL1/x5UXJAJetbqK6WVr5QriRXSweHeGz6355GvmtomXKpZn0hSc3z+HVeFc0X8nP
	 m1izlnVT8vOJioDdLjf8SA1mxyVWrW6Aw+gtRuBzNjgRqZDTHln+x1k14MKSJoQTScw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OYjCNJ4Y;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3E0606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C3E0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OYjCNJ4Y
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2790640f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793605458; x=1794210258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMp9mcTTKC9DHoWvLxRWF3MR+m0EkCxt9LMLL8huxSQ=;
        b=OYjCNJ4YGN418aOh4vtw14+7AbwL7A3Ew1CDtb+YSuxsqDbyN3W3NuNSwtJa2wrcK+
         /0DbK6/gccivSLcebaEXKX+PuviBnQdEZl5rWvIUJE0+unubt6dYmDsFeZl5JUyTPfJA
         eb5cfsbZTdDxFpV9Z2S2YwoHdgZgDyswjQ9g1w13yyKdN9fbW7JBUGkDsTW8DY8T4vrO
         vxyyS3wp/hibMOyq4jZ+uN+QFFFQYYKjWb/9TtDlU0VZ5kIriHuMnnVNtNup9Q+7OoJQ
         uGL5ABBYMspVQzy6ukvZB69Smvf1uU8UokxPfb3jSB6aTAWGnHCzZPdyzW+aWE7smNI9
         qv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605458; x=1794210258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMp9mcTTKC9DHoWvLxRWF3MR+m0EkCxt9LMLL8huxSQ=;
        b=XbY/bcRYH7NfCGpZw/dgJcHaGhCXXyyGN+3PTdD/TX3Fz0RJfS+u3JmXCgimvofJnE
         47irjNLP1zQw1YyA5lJhsWtTHHUIG1/xTIIz30wciquviC5YB9PGH/gr2xSL4QWqQnZu
         ETFPEZ2xiHY9IICBC9VbAyEQknRFN9xJNCDmHJg9A4+sbydOKI/Q4zojKA3sP0+ntqAm
         v/ssikwg776wafQIlS7hDNuBAwI0JphOIbfQMyxOpmlSzczrqc2v2i2+2V53A51+ahAk
         lVbQXHcoNj6bzNCJNZHyf9zauk1/CNunDAqS9d3LPt6XlJhgKb6NQGB9ZBEtO8cZ7H/C
         qTFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMTXQXyK0TNjFbhpIqKAMzeD87OTkqyBJP88wFF26dRzNSFm/u0SCQ+q9mDJ4fjHfrc+f116/nGuaHchE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tESd7863J9K3fSVqbmXg4CxOQ6X4BCicNOCsQRzT6mufWsQTR
	QqrFNNXT5IgHUXgBQtbr3kVMHBGk/+mwldJ3gMdITGbwwe5D1+UDkdbB
X-Gm-Gg: AYBFou0VjgsczYiXPaJ6ihrKQK3Z92OXiiab33Xtg3MDhT6gBLWCFxyke/LVXCxXme0
	alwHHYwPoBTnXfb7OWfxX1gs64jp4ECaGj+nWGUqE3jJqwBcDsJhkIZbnJbKMKnkuSu5R9mBwXN
	edRUnodMuem4B8Bn4Xwbq3KP5NmN/D0/JnL46RO0eR4feb7aK0tOSMK+QhPicgv3B3SE9c+88hx
	/95zJUqrb+U7NwTrWArrmH8J6xHMeKQt12gpoRHwzLD+gjj47mlSa0e2hErSpZ+XG5NlINFoHW+
	abOQiMoeiddzklfMvSV3ULgHCAziWNx0z/ouUJ7ccznhTE7GuaWc+saRFYYYr5g2427FGIQnLCV
	F24jmsmC14cv1azPzfPfgOEb6C0dck9jkoo8U+duXZVEq022CKorMfY4DovYbISmmzxa6X5dx4l
	NBOnHCMj953IX25TXG2SP3tdDPwzrTpGMD2u4trY/BjMzSBcpDSmAGdp3NTZDVGFV+3T88N3Zqw
	ZFYtQivguZJzefRG/ljoKRT8wLMViZSPzVph5qg2mcmSBM9AwB1z6NtqQmf3zNbBoROEpwIWwWw
	EWD/cda5UbbMOQ==
X-Received: by 2002:a05:6000:2387:b0:48e:20f9:8d75 with SMTP id ffacd0b85a97d-48e6e50b79cmr21195080f8f.48.1793605457581;
        Sun, 01 Nov 2026 23:44:17 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm18050374f8f.36.2026.11.01.23.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:44:16 -0800 (PST)
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
	ts930@dgu.ac.kr,
	alx@kernel.org,
	linux-api@vger.kernel.org,
	linux-man@vger.kernel.org,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH RESEND 0/3] mm/mlock: make zero length requests a no-op and reject wrapping ranges
Date: Mon,  2 Nov 2026 08:43:58 +0100
Message-ID: <20261102074412.189554-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
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

No changes, rebased on mm-new, Cc fixed.

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
changes intentionally alter UAPI-visible behaviour.

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


base-commit: afb4eea28037fa55c4560313ecbd8a1e1da8369a
-- 
2.56.0

