Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504425;
	b=dZ1uYDfO2N+RU0+WI54+bZaOnW+o3OetLCbYrDtF+0M2Krx6Hk5GpYPigvi8S9cUrd9v
	 repjtmkTyjhGoAARb1XRDFWhKY0E8I8/2hY1gt/YvRT2Au+QA2bvNDwFXRlxvOt6U+USm
	 HPc4b81AiIm9dzvvLnTzA8fsgKdE5stn5MZAnI/cWJzDhcrh2AYoVEX8PkAiuaQT91n9K
	 oszl9Ia5XAdHNFrSqKB8K5oUf3/b9CjgWpZLMMUgfYsHmECgjIaIulHOTvZOM0euLAcsN
	 9Z+aRaAOYLAjZXB6JyoT91lIL+DeaxYIF/XVkWQ8OE+HnDeTd5TKLkm/iwFB1g40aXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=ZQwf7Jz8fnuXb/gkOxiJVLvZZf8x79ximks/5OVJDwI=;
	b=djb2AtRawuf8HhsOCEG0ID2imUMZKxTZPpk+JCoKD+bMMsWj/3J22978fD3CipWe8M0J
	 g3591mQJOVGE4c/dja1Cz6gG+zoFY/jxJsUQEHBhzWuewrt3jxIUPNCja6ALpaOCko0KE
	 vTuKzE3NULBT2nUEWwKCtFeXis5fJxik8oFfEOeEthTdl3AZbyrG5mIUf7kbCImNF1A1q
	 9J05vN98pKM6NtDbaUXTWVX58sG+xFf+fj4jkYR6B5C8+2SOz82TWoVnwFQcNlKQNF3+3
	 Uk3OeRdrJJSWuJAozpDkAZwbXIqvQaS0Exi26RG8lUKY7WLDXQ4yhc1F7gzz6Gdsqvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NSN1pAGo;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7447606AB0B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7447606AB0B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NSN1pAGo
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so6356175e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792504423; x=1793109223; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZQwf7Jz8fnuXb/gkOxiJVLvZZf8x79ximks/5OVJDwI=;
        b=NSN1pAGoCXd6tv4U5XARBkrAJpmI0CGHcfsUKI+NXhPg0SgW0JCanYYRfHyUsaTba4
         Ipk3Wv0BMF1T9LMxjF5cb3FXxPKA2Va19xiF/4eg/G4zZnd3ojZhs02RQEyBnm+Zc6DJ
         fFjMg6egbc3ni0givDNBzK3iFXLkdDOV2Km+lF/V2FnRinTpTUemUKl0QGSc5r/3QVGb
         ek2/+21wH1jJvMW9FQtwojLN2HOTzsL47AuYSTssj2tpv08Ot9Zq0BY5DIUD1hN7pcOG
         wuFBNmcrCVXZY8nTNtRF0AYdsoM7jTiNo8oEFjiAEu1GPcqTRGN8WoLsru9n9V20LFkZ
         EuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504423; x=1793109223;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZQwf7Jz8fnuXb/gkOxiJVLvZZf8x79ximks/5OVJDwI=;
        b=L+lYjTQ3yvKAYNQugpm08d1/OTFPkzES3GazJRRPxEuacoJA1geVj1lv92KD49mAfc
         9tnTy8Z1RIOL4FDjvyEcULytd2R/6ykuJhmXIJlPjddlujjFEf0sJ3hsHAdcuLcCGb68
         SGyKO9WdSzH8LBXn5p4MssV/ExVgzmcsFeKH/R3g8eByph1b9WS7AiXEPrAaIFbR8pHc
         2gl1XmO1NalmQCnl6Ck+DAWfrnAczvkffR79yViUDHPbarkH7VoNEXG6Z+2SnRODQFmd
         4HMz9Rqa0pyuBW+tgsJfozXTjlBuJH10yInJTms2YlO5F2Ti2sjMPx8fA4TeS7OldicL
         1lwg==
X-Forwarded-Encrypted: i=1; AKwUvBzJX4r8W4eiqGKusAI5x+CYyRb3K/qisvXKD9CDe4lFfgMzfd7J4W94rc40h5yK4zBliUtyE3joJG8+268=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxoRDNKJTbpwk1PRaJ7++c1KCLG6LCgapnn24KRal77fHc83XA
	aDMIVqWrNuu3EMjd6OK1iJRv55+Ea6lY246b//hIK3T88MSwaV/UTUtZ+P5WsOLS3Q==
X-Gm-Gg: AYBFou3FYHbkRX8uKC7wvqp4NPMcJfByn0ykwJ4kcl4s7wrd2w8cyPSzdPuu1MD4dz7
	Z1m8SUGVAmLuQc2nYAo1y2tWYrG5Dvu7GgGSNLlx8t3hxkiss2dTg97+5XBGw0GVBObowgZR+r8
	itI/ajkchrBDTU7WWTckhvg9yXKE3RiOs5uU6aC803MftJahRPSzwSCLrr+6k2EbxHIzCH7zzGb
	einHpN4l/mngpAHzwpzRyaT/byoq0ddiKW+gqgptFcKMg5MSDl/vHVKiMP26rQPoq4jSm0I6w7A
	Rpuq+1t2FNcT+JPqDZrC4EoLlBeYpxnuePZ/haJe14UOEmEAMsUlNbTcRwbjS01HbNaAbz9DgPp
	IshI8ikiQ9YxcNRh00G/GNTTy9fcuhBOGc6UH7pmvPbEtsllzSQ/J9BMXaFJNruXemT4qwro1N0
	eCgsfC4M/ArJNqLhnz3tD1kV5AqAUZYimAZ4sfI/4g+4BP/YPt8sRiqBVcpc1wovvZfUiXjnkpG
	kC7loOeOC/aewM9UjSOja0/SXEhn4YYI0FER88=
X-Received: by 2002:a05:600c:3b1c:b0:4a1:d248:25c4 with SMTP id 5b1f17b1804b1-4a1d76046dbmr240467695e9.13.1792504422726;
        Tue, 20 Oct 2026 06:53:42 -0700 (PDT)
Received: from elver.google.com (11.26.205.35.bc.googleusercontent.com. [35.205.26.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ca3597sm73492715e9.2.2026.10.20.06.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:53:41 -0700 (PDT)
Date: Tue, 20 Oct 2026 13:53:37 +0000
From: Marco Elver <elver@google.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] KCSAN updates for v7.4
Message-ID: <atdyYfVApEJj4Y79@elver.google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.2 (2026-04-26)

Linus,

Please pull the below KCSAN updates for v7.4-rc1.

Many thanks,
-- Marco

------ >8 ------

The following changes since commit 93f51579e7df248780214094418f205253383cc5:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git tags/kcsan-20261020-v7.4-rc1

for you to fetch changes up to bd3cc16d1d7d584911f856adc458f242b1c7e85f:

  kcsan: test: Do not count report printing time against test duration (2026-10-10 13:03:13 +0000)

----------------------------------------------------------------
Kernel Concurrency Sanitizer (KCSAN) updates for v7.4

- Avoid division by zero in kcsan_prandom_u32_max()
- test: Do not count report printing time against test duration

----------------------------------------------------------------
Andrea Parri (1):
      kcsan: Avoid division by zero in kcsan_prandom_u32_max()

Marco Elver (1):
      kcsan: test: Do not count report printing time against test duration

 kernel/kcsan/core.c       |  7 ++++---
 kernel/kcsan/kcsan_test.c | 34 +++++++++++++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 4 deletions(-)
