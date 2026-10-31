Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793421017;
	b=Mn17WehPhWrdgRX/P+2X5wOaTFs0Dhq9bltMW1nc+8lgJ6N9cr7KSJuiCAap6TmisdVh
	 wLcuW1S1LvCgklkwjqCoQ0fM/QT1/Hqgxqn3BSiY8pBYN7Y/fX7fGLhLWjOYaMCYVXjy8
	 SKTob2C9tiUvU5QxM64opR43pVHzFRK5+WSLj09y01JVLaQA7Y9w626FawURH7waQQGFT
	 B04AouW+4SRe9K6cV2pmZTmZyE1WKvOSN7VOx4Gxjrk8ou5mk51MTRe2vZEoqp1eJCwUL
	 s1WJJqGI7ZzlZrQq3fA2d7yk3BED+bJb9ukvyXgwFHu3Uen42Bg96M0pUg9n6+BvM8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793421017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QQz9ZMCO1NYjAQThAO6kREsaOzKbYb4nEoL6Va1QKuk=;
	b=BdAMNuzVinddzVBLxOAuFyw6zhyUESPNaB/DsGutePn5TgC8Mt7nZ8185/mpZvS9BR9h
	 FOh2WyKSGIqdh3bSWpM5/aNB++tMQDhs3eYiJXBHfuQ3bIPHRwWvqVWC4nftjJ8B0VNOG
	 KtcqvLG+0FfYgjAxpx+LainpWYRluE1P8i9ZbHCTedEI3pdw8l9ts53am2TOe8EQcdRzG
	 jXpp4bjV8YvR1dZm1vh9k3ndnmMeubDOaa1ocXA1BH4yQ4anUEf5bIdnaqRACr4C/MUaF
	 GrCXhLm6/ByCNrm4qLyqRi3o2rLpkiLUknHjcXybn8L1wVr44ivlv+nxiJl4NyCOe3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thingy.jp;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=thingy.jp header.i=@thingy.jp header.a=rsa-sha256 header.s=google header.b=HwItLxYv;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E95606A332
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81E95606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=thingy.jp header.i=@thingy.jp header.a=rsa-sha256 header.s=google header.b=HwItLxYv
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35b2c599f43so761824eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1793421015; x=1794025815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQz9ZMCO1NYjAQThAO6kREsaOzKbYb4nEoL6Va1QKuk=;
        b=HwItLxYvDUaVhiWJ34DE8K96sCInWwEHTmCCuT4taB8xmpo00nyUZbSmc8mAiR6DMF
         +zT6+KC8Bu0+KxMtb6G2MsFHkmCZKOqoBiGXOwtvROM8ndKKmfHycwXRieuRM9+xr0Ny
         qUAjTBkAKFvxiBp9WMpUuZzOwoJ6j8AWdvf/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793421015; x=1794025815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQz9ZMCO1NYjAQThAO6kREsaOzKbYb4nEoL6Va1QKuk=;
        b=cvYgT2eLTPmOCgYkHAM74ZwmIVt5IHFfBky0BTnOkxm4UC2X0+PLww7CKAZwEZ8SjZ
         y4MUEBEbx8NG9JgEz8VGjj2TQFoIigmfeZU8XPM1Lb45b4Lj0+i0Gk/Z8KkHqtu4P+SU
         FLJSHdhewSgMpcQYC7TQa7dqfBwUD89jL45scyPs0ZT1EO8j/BP8Fu6d4XCemZvaHyc3
         OhnK2YBBbR98BJtSU4K5Wj4A3mY/KzQEYFVHoDqKBzO5smMXTWHby7wkIq6zJk5HU5/P
         ZHBYtPyxMQvyKKUq0OjcW8W3guYHi/giFJeQlOO2eKhIxQvqUldH4f3VmA6zToX9sj20
         HVbQ==
X-Gm-Message-State: AFq9FYK/QlyuVeUoYaD25M37lvqNQJr0nGGIGcdns9Dq8m9KzSMEBQuN
	hzrd0qUCxLCV/4/zj3+j7QPbmkuXq2nebhEByl7JqH0uU8Z3FfL3SaLjTGX/bV70sQ7XTEkaDCX
	rzrTF
X-Gm-Gg: AYBFou0tZC3Udian85MHM4/lXRUylcQtrtsEotYg4iZB0Mij5eQX24FX+BbLF9Syi4y
	rqzSz1/+jN4/Lwl/YCS2adlW68gOBvPlF/lfUOrtxghkg7PU8xAA5CeRZ2zV/hHjWBqiDx0J3q8
	LHMIYyz5gXO8XjXsYMteVboPBd/uiW1aC9Iathstqdh8Ob5aH37qwGLtKWnd2/gtEJCgrwFeMXd
	DcM6zzv4JrBjMEsByRB7w4DxR93DyWMty7YnbwnJJrSr1v8ZLdiBl0ODjvpo0yXq3EfLBCilaTi
	2leh5MlWtcz4h4ICwZi3c1wq10pbVU6wBVLG7lqVc2KbT4sTaE0jQh2HZRU2OD15usZ5S800Yfb
	Cw94pwQJb3cQXQzefQ0cK0xFz1Eb3HDUnASlAPYLI2iyjjJs0pYtMrxHm7kltbmMwHd4OxZkcs0
	A34OKBVtrcm1oTFfUxnrTsykVSyE6b8zO+PEfVWBRW3t0ngw8ycNQlMNkpHbknEj9FCdoemnubg
	xaCbyrn669Az8zHkIG1kmToo5eQfgWnXYz/qg8/jV9eZBUn+MreR0lVw32US/Q6pjrrqTGG3M+4
	7tBQZuVEj4NFVqaufePyt89OP9OPlqUWpi2k3rfsavNQc9Uq5U2z/qaZdaqBX+FwTFKQnUIaA6i
	Zix5hY3pINPeAn4u7/CPh8NRxOarlBzcnSFZ8M9s=
X-Received: by 2002:a05:7300:a9f:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-36a4235f45emr5549868eec.13.1793421015489;
        Fri, 30 Oct 2026 21:30:15 -0700 (PDT)
Received: from kinako.work.home.arpa (p1795186-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.207.151.186])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm16603361eec.16.2026.10.30.21.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:30:14 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH v3 2/3] tools/nolibc: Add dirfd()
Date: Sat, 31 Oct 2026 13:29:59 +0900
Message-ID: <20261031043000.145709-3-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031043000.145709-1-daniel@thingy.jp>
References: <20261031043000.145709-1-daniel@thingy.jp>
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

This is useful for things like fstatat() on children of a directory
opened with opendir().

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 tools/include/nolibc/dirent.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
index 7666dc69506f..76331ed65560 100644
--- a/tools/include/nolibc/dirent.h
+++ b/tools/include/nolibc/dirent.h
@@ -74,6 +74,19 @@ DIR *opendir(const char *name)
 	return (DIR *)(intptr_t)~fd;
 }
 
+static __attribute__((unused))
+int dirfd(DIR *dirp)
+{
+	int fd = __nolibc_dirfd(dirp);
+
+	if (fd < 0) {
+		SET_ERRNO(EINVAL);
+		return -1;
+	}
+
+	return fd;
+}
+
 static __attribute__((unused))
 int closedir(DIR *dirp)
 {
-- 
2.53.0

