Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF63370D79
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183185; cv=none; b=SAToalvS0hQ9OkKLFMBJHjj5fAb3AhFFhB8AR8/wzcE5o8M0tZmurrRO3Ol9htE65VpaB9OyM6AQVBvLIelFlonRjTjUIsga1II5jgdRHxgInI0BYaXOupHbs7PDJv4OiYypl7EzRAbwiwO6JFYwsRvlJxPBF0FLaulehrVw1ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183185; c=relaxed/simple;
	bh=hQfYsL4RRwUOfZPXMVlGIisUY0zGqvIM4pVagY2neLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nx6CjOtioy9SQN1F6xnjZlwbQ5fNfRwRGeQrtl/GUrmgh+8jVsQVBOiDyUWIs2HigtSD0SyLJxAuUL00ps7A7YCa16xpEtcC8Q73bczXstjiK0f9768LFc8w4Bg6XGKimm+toeEp/+3Vt1gT27BLWbjjcx/CuKMsXfzQT7UtpX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a40jDYoH; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a40jDYoH"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afd5b1678so727627f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791183182; x=1791787982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNdiFKmiNwVXREQZb4H6BvkiMV9G9eQw2TPowFW6zrs=;
        b=a40jDYoHSEARO+Njqh6WkpbBs7zO86WuKhOAgprBg46TeFinHAzLcxOLTTl8XEGDTc
         Pyooez+YJ7on7JSmEWKGjMaJM+ik1TJaRpSwmcZ/zaZKAVp9J11q0ezcrnScw3yyLoC9
         b58dW0kD6RMi10+zdfYTTxu78ryvqH74apSH8Tpwle58J7FgfLSQ5DSwPL+fhO4Df8IY
         05bQJ7XP0313GqwjzqDbxfpeLDG1BxWgremoIDC8+I/xmaQOq+7nzuWSR/E2zwwA6j1W
         gyr7pmebbPtZ4/TT0NVD3VH4aa2SoNFiue38X/694W3tmbO46bwETt8NInGWXOzcU5PK
         eeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183182; x=1791787982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wNdiFKmiNwVXREQZb4H6BvkiMV9G9eQw2TPowFW6zrs=;
        b=Uj0EbdoJsmaPueT47l5Lbq6qKHKxU+EzyzUoHw7vgRL9qb39q2Pd9vOuotjycqIsxP
         5NEHvetiDb1MdKoveErWskEwgSl3rdbm2fOZvDKgaJcOtHkgnzULl+NNr2mdlcV+l/MY
         lu3b6wN3eKptbv8olWZPxQBg273PCWntOTcVA6Cez9M3d+e3CA5Yd+4hI4pgg6LAASZE
         ru187s6E/DAwcx0haucE1BNJA33mJsjsdCJvfeRWMSPsU128cmG9+hs6l3jNKfSABSI2
         5Vwq+/HHSH+00+feNVDaKdFvhl6s3o/3dI/8es6fH1rcPKTxsKxxA6yvYv+DxjXwQVNy
         hRsA==
X-Forwarded-Encrypted: i=1; AKwUvBwXfgFYeXQy/wZj3+BDm91yG8NcTU8mgCEQOwhI2ZXfYWXrGpuQXUpeQjEsXubL1vQP0hwh9eh8VbXZ9V0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3i23mkGBGbjpz1fBC+58vSywqdlbYllrgBJKJ+Z/QG2c83NV3
	vQhX0Izabh2uQh6gfllYdrgGzlkdlFtmv8q46yT8cvV84fQ2Q+XawxSG
X-Gm-Gg: AYBFou0nwlniw4a/sVqryYJ5s5Ei1FnOGH1wrViGxZqCE6OUXw5jPxE2pILzJdKlm4j
	a+F+IZK8/31Pzm1KeghW38QqUg/LnoY4GtYJfaX4A62v0M5NhMriQM1X0V9w2a8o0DSDURmexGt
	Zxe7rAxyw3NLObM34u2MlvBY2WfXZWHrumwj/SwBsUg9u1oR/t7G8gvSbTf2wKcWNKU9GTWzqaw
	TnR2DuoS+OvjEOnSu5g/AoIL9rZw+6QvBNf2R40wGJTE74Rqlb7+XaXDhH/tcyyMjQ7IUj8grH8
	iDW8wK6vlNT3FpIM/G7bXLUaZeB28ADY02NOu7Tc1uIHhfUC68UQf2CpMtTrelRy9sPaA3nZqcE
	4bjK2JYR72Op7MNqZW4oSKrCpLZOhY9bMnwF4naAqtzlYWCmbGv2B3iDEYb2HNH+Xj4J2hFvp2h
	wwY8C28ZmgxAEy/R+EmqCQUPhdY6xwechBxH+KRa7e+zkdHktXFvlMQXU=
X-Received: by 2002:a05:6000:4301:b0:48b:b1a1:a002 with SMTP id ffacd0b85a97d-48bb1a1a2c5mr20641697f8f.24.1791183182123;
        Sun, 04 Oct 2026 23:53:02 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6308481dsm1247436f8f.3.2026.10.04.23.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:53:01 -0700 (PDT)
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
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Park Tae-sun <ts930@dgu.ac.kr>
Subject: [PATCH 1/3] mm/mlock: make a zero length request a no-op whatever the alignment
Date: Mon,  5 Oct 2026 08:46:29 +0200
Message-ID: <20261005065244.6935-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005065244.6935-1-azpijr@gmail.com>
References: <20261005065244.6935-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A zero length mlock() or munlock() at an unaligned address is rounded up
to a page, so mlock(addr + 5, 0) locks a page that was never asked for,
and munlock(addr + 5, 0) unlocks one the caller may still rely on. An
aligned zero length is already a no-op.

Return early for a zero length, before the rounding and before
can_do_mlock(). This is a uapi change: with RLIMIT_MEMLOCK=0 and no
CAP_IPC_LOCK, mlock(addr, 0) returns 0 instead of -EPERM, which is what
munlock(addr, 0) already returns. man 2 mlock does not say what a zero
length should do, and -EINVAL would break callers that pass one today and
get 0.

Reported-by: Park Tae-sun <ts930@dgu.ac.kr>
Link: https://lore.kernel.org/all/179066531783.50175.13377521828379196177@dgu.ac.kr/
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/mlock.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/mlock.c b/mm/mlock.c
index 4235a1518fc9..cc28e5d7413a 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -612,6 +612,9 @@ static __must_check int do_mlock(unsigned long start, size_t len,

 	start = untagged_addr(start);

+	if (!len)
+		return 0;
+
 	if (!can_do_mlock())
 		return -EPERM;

@@ -678,6 +681,9 @@ SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)

 	start = untagged_addr(start);

+	if (!len)
+		return 0;
+
 	len = PAGE_ALIGN(len + (offset_in_page(start)));
 	start &= PAGE_MASK;

--
2.55.0

