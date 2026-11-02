Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605466;
	b=upU4XFbd3hRMCHTOduTPlACmfDf3VEx/20zQFqzy4Nb1sJk2jNZImwddXfS4LYMypjNM
	 MxeEpatMkZpqFW1Shzu0LNmpVHRvsj9RXLeXwIJId9nBgSgXZ4zC17BH3+J+exlm0qfBz
	 X8VbhYY741SnJDE80aF6X3LCCD727xzjnAw11L/9eNT72m41qzIU41q0T9tMClUv4Px2S
	 5zuSjc5sK2qM/MWhDVJ7Sx5vwt2YHlbY7F8VQ5Pu2fUJY2WWtjXy3kspiSjLGQzHiU1fC
	 E2zHZnYxE1QqX+8Inq44Q3mwUWKkywWC9+u9qw+sV3EYbKU9l1HhHLRdZWsa8DbTEWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=frsPb1t3Wa1UoN+W1OLcN+MUypjNEa6QpG2s8csovOc=;
	b=n3PrkWaxxeuPti0JlrdQ1bwQx+Tu5DRRogRivugbjID9B63nQ2qQQPTbDDwGwJOXltqQ
	 N0lg+AsZCVZWryQUZfCDVDB4MbngvVegRAd3NUMRPO/YcsKdlNzvGSnRIF9yPn0VpAEtE
	 rw/4GLy2wuhKH9bY0YKmE4FRO/VOW1KkBlb/S9phC3+oEN5/scJyQYpxN2TfRe2W3dZV2
	 hj7DebnQ/ShyWYDM+VrXyBWNoK09WmGi7Jfa7qaHBlv0pjhuKCZOej3b7EGbRGA1G2U0p
	 GeSXNq527jkYzFX9RVpHd1xmUugmrGpvgzyXIICdqUxOZ1OANdw3lu9vefmwXb598iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJ+cDcAL;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7627606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7627606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJ+cDcAL
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so26758695e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793605464; x=1794210264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=frsPb1t3Wa1UoN+W1OLcN+MUypjNEa6QpG2s8csovOc=;
        b=HJ+cDcALq3xnIfz5alX6NrO8pJjmgk2lptN87Lv9/jmTYd0C8pjGqWCsPnsQnEFfIc
         5euRxL2BrUL2aSUkgYwLXwRP7ZCctu5IrmPKpKW7GynqOLnaZjgXlQIjlNqBhnP4mwL1
         +cvQ0Nv/F8WdxDo/MjyDGNymVkwMk6SquY8auEWQeUPjHYtExMe3rW5GAI2oF+uj9mp0
         bq2EjuUjcX7F3xx/ZrsCS+rEbt6D1tAk8pJmoWTlYIiPr2j67fUb7zHy45fa7Z7HpP4q
         e4646eu7GoZcH6b//6E1PYX57Ce4wYme0SB7JDWYm+WVcBBdWd+sdhipZELs0I2Y/uLC
         fMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605464; x=1794210264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=frsPb1t3Wa1UoN+W1OLcN+MUypjNEa6QpG2s8csovOc=;
        b=wUfoRgLTTacus963jmnTwmcm/xy3mRMKHpBC/ri9TJG/5zAROQe0IaV0TZvAJVYgVR
         Dd7WfDaYHv4gdgRS1A8I+Jx/XgIJDnLyhcDhOEgE36uQsujhPfF1ywvw1qrLXK8yVyry
         EZW/44Xk7GFl3xtCe4z7Tw9SXnPNBE6aWWtQVzDEN8q85NhDuOYgN3sKhKgdjQsmmYwS
         dng4Ty5tCp4dWnpuMInGRsopfGHVMH4kVOrrKHJq+2oQCYuUeNMBU15bt53vUAneMcL6
         zdsOYPRclTgzcMswY7ESecctxLajni6FXt8qMQglwVdK8NPG4WyQoxeeG4H7HtSOiWIU
         FBDw==
X-Forwarded-Encrypted: i=1; AKwUvBxVK+rA3XivXLA/hQaF6brDDAlATHeJvitS1U/DCrSGuyh0pZRWsMQlOnBOZisZY2FCOQ4n5aM0IpuxLsk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd0f2hHPvnuMF5Z8V70QtHo+yFYaFCMlBtTRlh+po6K3N5ohtX
	NZAxphiiz4n74sKk8J2K7JLI6E4uzCsQLZuJZrGdv17V/QIdfEAHmIb+
X-Gm-Gg: AYBFou0AV/NKWnj+bZWDWtSLFHr+V32yH4e+Dg4Zab00oIeDAKq77vUAHuj14uFedM7
	r4rSGORMabAR0nxSWZS0ZGaTvp3sn1gsR8kcX/ChnuChmXBm0O71g6WZtkIQCl9UMjXtyWHL19I
	ZwGCQb+OOeR0lmahb/Yums9ZFHc5z3rGue5Fkfs/wJy/pfxc3SLu3TX1nQwyuY8dSQG3Bg5rAVu
	7YNg60CwmSWct5D7uRN68cUSI+GnAeeoJuExr02Ik5G7sU/wrDpxfUXausKjckX/z85bJ6vxMut
	pt6VfuNs6FfevsU03BIQZ7v/o96vHWPKGFNRiGOym9zHlNrVRMHBeRDWiEzaj3nruXGSxOZ1SgS
	m1pz5UenM+rwwBxLGKZiyy4T9GJeJkHZuhHXkYq0MS0kAlRb2IN6R8o/6zO5xebn2J1sw5s8xCs
	H7+aTq/xAiiCYHsz8HGt3gM27ONZ4u1JmGsUWYmJIVjRek0I5nFPYJGELrvDyYO4MD7l/suFSR6
	Yxl90qcNdo5I3bifik783Jl6DVg7KD9w9BRVR/+8GddRqv3W65RNhoPu+QFlbZ/RzI6+4OFG35l
	iz4jbIJi88Pp9w==
X-Received: by 2002:a05:600c:1907:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4ac16fa15edmr211678515e9.0.1793605464208;
        Sun, 01 Nov 2026 23:44:24 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm18050374f8f.36.2026.11.01.23.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:44:23 -0800 (PST)
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
Subject: [PATCH RESEND 2/3] mm/mlock: reject ranges that cannot be represented
Date: Mon,  2 Nov 2026 08:44:00 +0100
Message-ID: <20261102074412.189554-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102074412.189554-1-azpijr@gmail.com>
References: <20261102074412.189554-1-azpijr@gmail.com>
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

A length within a page of ULONG_MAX wraps when mlock() and munlock()
round the range to pages.  At an aligned address the length becomes 0 and
the call is a silent success; at an unaligned one it becomes a single
page, which is then locked or unlocked.  An overflowing start + len is
only caught in apply_vma_lock_flags(), after the RLIMIT_MEMLOCK check, so
mlock() returns -ENOMEM without CAP_IPC_LOCK and -EINVAL with it.

Return -EINVAL, as man 2 mlock documents, when start + len overflows or
the end overflows when rounded up to a page.  Doing this before
can_do_mlock() also avoids making the result depend on
RLIMIT_MEMLOCK/CAP_IPC_LOCK.  Requests that get a silent success today
now fail.

Reported-by: Park Tae-sun <ts930@dgu.ac.kr>
Closes: https://lore.kernel.org/all/179066531783.50175.13377521828379196177@dgu.ac.kr/
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/mlock.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/mm/mlock.c b/mm/mlock.c
index 673a8433a0a9..0e9d8c110152 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -608,6 +608,7 @@ static __must_check int do_mlock(unsigned long start, size_t len,
 {
 	unsigned long locked;
 	unsigned long lock_limit;
+	unsigned long end;
 	int error = -ENOMEM;
 
 	start = untagged_addr(start);
@@ -615,12 +616,19 @@ static __must_check int do_mlock(unsigned long start, size_t len,
 	if (!len)
 		return 0;
 
+	/* Reject a wrapping range before can_do_mlock() and the rlimit check. */
+	end = start + len;
+	if (end < start)
+		return -EINVAL;
+	end = PAGE_ALIGN(end);
+	if (!end)
+		return -EINVAL;
+	start &= PAGE_MASK;
+	len = end - start;
+
 	if (!can_do_mlock())
 		return -EPERM;
 
-	len = PAGE_ALIGN(len + (offset_in_page(start)));
-	start &= PAGE_MASK;
-
 	lock_limit = rlimit(RLIMIT_MEMLOCK);
 	lock_limit >>= PAGE_SHIFT;
 	locked = len >> PAGE_SHIFT;
@@ -676,6 +684,7 @@ SYSCALL_DEFINE3(mlock2, unsigned long, start, size_t, len, int, flags)
 
 SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)
 {
+	unsigned long end;
 	vma_flags_t flags = EMPTY_VMA_FLAGS;
 	int ret;
 
@@ -684,8 +693,14 @@ SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)
 	if (!len)
 		return 0;
 
-	len = PAGE_ALIGN(len + (offset_in_page(start)));
+	end = start + len;
+	if (end < start)
+		return -EINVAL;
+	end = PAGE_ALIGN(end);
+	if (!end)
+		return -EINVAL;
 	start &= PAGE_MASK;
+	len = end - start;
 
 	if (mmap_write_lock_killable(current->mm))
 		return -EINTR;
-- 
2.56.0

