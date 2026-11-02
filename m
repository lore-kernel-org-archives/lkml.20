Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605462;
	b=LCf5RwxO27zCM3AQcflAieGAf2xaHuh8Du3CQr0jDfW/Cq+nHLYe9k9vrzcVNHBtDvzj
	 e0O2uzmW6wE8C9sOR82OJFY+lUsnMw9LQvNXgZhXIFT4jAq7LwZO/5qBJbaRnoiAm+Rxq
	 h8U0QQFsrVZw6zkFigz2nCd44f1qwOSIp9/I2CFObDXpjwpG8EVQWnPUBQ76QCP5bolz/
	 X1b/r3iMLRSyYeOV+bXwijfXr1HhxqHZs0KRNsCFY617tV5VfQ0whnozfpYSfPVZbdnM8
	 y9gmZLWVGTIe9KOVAAW1xfp2EW7/2cVLHxZzs9DEddJnoLm1EEN66VhBXdzk7evcibA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KUnvJpVPViW69AF9NkZWmBblFWCE3alugKf4rSddKS0=;
	b=dUwA8l/UmYzqQ8A7kkuPLsNwPXIoiIUIn5Nkzjeggk7LcTlROhlFncFrpFRbSPAbb3p5
	 JMXskLN/f6BUAPqjy9J0JA6lBAn9Xw0/rz5puYPPI1tXnBpH6P+4Iw1eURb6Kw3rzzIeG
	 rurOejU6iPR82YrF+YTAH+VICc2rY+3Dw8uieIBBANFEYubBXfd2uDKMMD+5hufF19dmh
	 Jd8o9kRLhcK1r7fr1cIS85J0cCxOLSBE8XktrCBfHWBXIXfZXhwtB1J5WhBqQKdO22EJG
	 MO14s8kz7Vufeh+VBMe2GQ335Q6sgXtsvnl1aqR8pD6tp6oXfP8jfFn6p3w3RCy1lzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QeLZFuY6;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6153F606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6153F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QeLZFuY6
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e10a70540so1433280f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793605461; x=1794210261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUnvJpVPViW69AF9NkZWmBblFWCE3alugKf4rSddKS0=;
        b=QeLZFuY6mIhG5rzjWO62mDesKo0jmIC+d12Httjn5kyoXafH5D2vvtFeUt40Vry7WS
         m34GzWAdpIRf8fdu4MqLLqQ4UBO5jbUVcSc5aj6KsNB/tK1vo4ffHQGnPr10MZoMPDiz
         IOmXiiPcmjbGg+rPF4qbqZvL3WqrdHND3PeC8ZQ8XVVIj2Qe8mFARNngJRFbpzkp4DIz
         i3oLbHSVB7/AMa2Q+kixbii2k1XlYcnonfs62EueJka30Y+0vJQsmM2lIUWGYYPWxTIS
         yUY0fqONZh76OqmB2NtlbMiAe+YAQqduPeD3+n5AdqAQb3wDt52BmrOHMkThaZg5S1ac
         uKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605461; x=1794210261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUnvJpVPViW69AF9NkZWmBblFWCE3alugKf4rSddKS0=;
        b=2O6Idi0hM+qEKF8iZevWDkv37Ruvxjb7WTkQ827u2VF398DLAUbS2zK3+PJ7IgEE1a
         cNpDfHuNp5XK9KI4kQ7UKXxmmRys9+KKxfJs3HrhyC32QQBaO633As3YyNzL+VluHmU+
         NJtrzQJlR5e5kxQzrWMaKHl2x6HUFWddvKJFXGwI/1nxS0qyT1I6N6/UlyIlU0nD6wvy
         DezKDxwu8lyxleQAitWwpHyrh2A8ex4zmODomoMWqv/KwgtfY3TJjedHrbUB8cg+s466
         EXlumhlDa8njAn5UFk0OYayWfNj1n+y3uA9HZ1tQjNsry66bHXuy1Xk1TuGr89abYohf
         3Wsw==
X-Forwarded-Encrypted: i=1; AKwUvBx3H/6zdCD+Tb8TZghR3VtY4MiT5UXyKiU6P2CVEWdXuCTcy1sPEN/EnhRm5e0KP5sF3UCMi55CoJJGH1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FxByDjvXU9a41nW8rnAW9TkSMkoVVpHR5lKkG6nMLRQnpFMbB
	MIewATSB6p8W/azja1Yodta/tB2BZHWaIshdwYv7gTKnnotGy9Da3kdg
X-Gm-Gg: AYBFou1Rt9PjE18SYV/itINhQZZ5FNEigQJgcNfYYQ0H4YpmAHXS2NPjCZGQRPLpqV6
	O+fTFhrvuhIRCSO2dSdV1jkusWkFiBB1tEAU02wjghcJqr65hKr3kd7PMw9uHZ8J1RBQyJBKEjj
	kY8RHsp9ZHDvWOMMoJI7wsUOZdlFWnIyxUWC3NsGZvsYj+01+2mH3wC36SjRlY/E3hH1lrjpLYx
	d9iwrKARbxw6oowjHzULvfUJPFFxUD/2XXWUq32aSGpROQsdq5VPBoSlQtg1e/JsoX6UhNRmJR1
	4UYCnU1qPtJvfJ/mt595W/0gws9O/seDQbJE8O0TuAGs6psSNDtJnfMOYU7HyoFeSIbIkCLZNBM
	bPJZ3WIuJhNS8EXIajlBjh0nbZBuZFkc2pjMJ+OEqYDe2UoeCn58z+5W3bWQzTY2pQIaYdfyWo/
	eYqcxKz+sJkUdh30yUy8Buepse9w4RNsJFy0KLt4DaTLxbFRuMLgVu+KvsYXQLoFlbwYJvpX5uD
	OKin02LbVP+hu/NjqRnkDyQ978NQiGN1mYq38jsD/9ZrtEjj6QMvUn5Bkadb3VCWnAUfGIYq84Y
	Lr+7We5zD7eeDg==
X-Received: by 2002:a05:6000:310f:b0:48d:f95e:6e8 with SMTP id ffacd0b85a97d-48e6e2c3586mr19528998f8f.1.1793605460880;
        Sun, 01 Nov 2026 23:44:20 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm18050374f8f.36.2026.11.01.23.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:44:20 -0800 (PST)
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
Subject: [PATCH RESEND 1/3] mm/mlock: make a zero length request a no-op whatever the alignment
Date: Mon,  2 Nov 2026 08:43:59 +0100
Message-ID: <20261102074412.189554-2-azpijr@gmail.com>
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

A zero length mlock() or munlock() at an unaligned address is rounded up
to a page, so mlock(addr + 5, 0) locks a page that was never asked for,
and munlock(addr + 5, 0) unlocks one the caller may still rely on.  An
aligned zero length is already a no-op.

Return early for a zero length, before the rounding and before
can_do_mlock().  This is a uapi change: with RLIMIT_MEMLOCK=0 and no
CAP_IPC_LOCK, mlock(addr, 0) returns 0 instead of -EPERM, which is what
munlock(addr, 0) already returns.  man 2 mlock does not say what a zero
length should do, and -EINVAL would break callers that pass one today and
get 0.

Reported-by: Park Tae-sun <ts930@dgu.ac.kr>
Link: https://lore.kernel.org/all/179066531783.50175.13377521828379196177@dgu.ac.kr/
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/mlock.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/mlock.c b/mm/mlock.c
index 1c70a7829394..673a8433a0a9 100644
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
2.56.0

