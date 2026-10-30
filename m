Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338964;
	b=UJLFxywMbQdv2NHwA79pD5yGkVPWO+4MXPKYUXOE7XKXDyGfuxj5R9svpx5jfmttCiXx
	 dNzsII9Sa5eq0ZIpep5N7UrRebfWCtUDwYAU9Cqq92OMZE+SoI68A8v1gM3FUMi9AtIk0
	 iAsdBPlSheMS85jfXyoxSDkQFY3D3PBacaKNANlJb7iW9G3ccy2ZaZVkq/ni0MvJZL4j0
	 u+od999TB3PMMt6CWfqYVX0PA0pmAN4KRwhN8eu7JrQFrI3xBwYhJSnCK6ETY1gHcNHS+
	 1ZHikHbTQBeW/Rsjndi/reMcuTwSUl60E3aP7A3HK9uxjv05DOjUeI/Zn+kXAxHnCWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=12tXOxCPsbo39hlb1mF4iGYiaxkf5vgxLfHL6faGPYw=;
	b=iLUiBvkCMyxbw9hi7llmUXHS3Gv7tN940weTSqGGRMaYylbhroy4aOidcgSgizi1MiYG
	 cAkOT8QQyLLix/3BpAvP72Mh1O4vZ9EAhfZMOvNgsWN6frFAuk8IHWBZO7rSpD7nQ95EP
	 smeHAGnp2rvdaPQI30Q5ldbqIXY0KuCTnnHnbgLcYr/brZhkYRWsv0TVu/TfJUebof16H
	 QzYh9ECLqQgw94BI/drnrx5GriF9IXQ7yMyFjH1u8s+PWcr/Sy1A/NMvBtfxfB41bvbCJ
	 VPqFqO1GhACTVErI56ghqPXEwP4MJrV31E6981Ie20QheaZSYR8POEl9xeOBt4OXCbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vMkfXhwf;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95931606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95931606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vMkfXhwf
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-33e48934fa8so118622eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338963; x=1793943763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=12tXOxCPsbo39hlb1mF4iGYiaxkf5vgxLfHL6faGPYw=;
        b=vMkfXhwfjyi4TT9vUKlVmpL5S1he8tN0Eb3OBr3LB+59kf0jd0sHTvjS0daU3xZirX
         38JOrj1dHn2bYAzvy8ok2PFdB5+NB6Gy9s1WZgqEHfOMmmsvx1qYK1DacHnPe4mFeudl
         +y7nq4O3NBjrzP0YL8fu0bEBEc8bLiM49cB4UGLS8jsYY+o01DjgY0zLBDRpT0ox6mmC
         16Q7N+X3FZzbKYJZbaYtdiewA9le8ZqXWwIQEB7o4FroqnRw/9Uz5hX9IWoPPOmkUqmK
         zEVD9+qKrHpzxdYsgyoXSXmXzCoXaXzCZDh5h9gvlHEYQ57w5UESvPOqCLx6xMIQ3kPG
         FZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338963; x=1793943763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=12tXOxCPsbo39hlb1mF4iGYiaxkf5vgxLfHL6faGPYw=;
        b=fmCtmBjmoeae8ZOgGso5Rla6TI7s84d4YeAwlUVasjLAZL73Lm8UJtj4ORHQt44XYS
         X9+4BTjEtXxcDymvyfOGUSZI0n687ZPjYmn2KEY2yAw5auNc+3RzIEkvm8G7TzWkcW4y
         l3K+hHtWuocz0eBiJR42iAA1XQQxx28Zh437JRfbJm3BEQ8vyqYMhOzFAMHgqUFRyxE7
         eZmkC83RF2mw9nSKHZVnDjMOn9SKMape/9FTKbUe0TjJUU8Cu1PxjdPKXyIZjkk70H4a
         dVF7TsixyV0+8w6o0VLQ/ggFo7zlTarPiz0XW2qVmjigIEsCHFpRZMtb2z83pmO9cRsR
         DBTQ==
X-Forwarded-Encrypted: i=1; AKwUvBykw5oBJv5fetp60BIzzKtuSrVnk2FNT3+EhxJdUzc43ZCy8Uz/7aNUi1S5X2+dGINRNRr96hGyF2CNzu8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsJ/ib5VPujkJrSjPOxjVLi3+ptv2Xs7NrKSGiyvM37ijqkQlw
	D0doDl4qxeH5IAvARwFB4GWp6FSitB1isGqT4XiBBlogMjWS4R+cA7yu
X-Gm-Gg: AYBFou2RsYcVbbwmsVN+fSid8YWoSo7Y+lvMqjKcPmWK+Cwa13vYQ+s4NWVw8Wia4eC
	TY70ZPbhpqv3zZ7OH/08Z8QGTnN20IvG8dgsHLLiMpZtdFpmnSyVLiaEbu/GEeWLGfa5eTCk0X2
	lijn18DV9rAhyL1/hp4ZcduBHdKrRG3VMICHiQbO8D0/sso990YFBFCb7wZUy9eOMZPtGA2BeDu
	u6sn0wubUyLuRstocmJo0XcmunD1icsGfwknAjjTmas9D0OYVla4yLiMwANoIrydmSof1OpWXhF
	Ipc/9e8eYYS0oYlOuSpZnRwlqDRod3AZsPR1pArElqFwaVR2BLsFah/oFS6GbwkykuqYa+ojt0O
	L21qc6Za6ntLx59Nzsp8oNZO+maWc0iaLxwDEZFMnK/G+qIBOjWHQbsTK7LzvD4YyxFHFvsnCjZ
	nO4KM3SdwlDIWt3IvbrfgX+0jS7FA3HKUaxWGEe4o/rzJYaxd7HdscZABOsq0Gbml32tgtJlBex
	HzUfTpLcPO3cnKxICG98aOjyqXvhZdROdTPmgHjmzSLxtO5lHsgqSI6oE/ZX0SHYPDPMc++z7u4
	1bGuapB6E4FtgK2lQlJkhL7ov7XQ78MuQ64InBGp4BdQefO7RRm7NOkC
X-Received: by 2002:a05:7301:82a:b0:351:dbc:b663 with SMTP id 5a478bee46e88-36a4244f9f6mr2418639eec.31.1793338962362;
        Thu, 29 Oct 2026 22:42:42 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm4380426eec.26.2026.10.29.22.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:42:41 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: tglx@kernel.org,
	jstultz@google.com
Cc: sboyd@kernel.org,
	mlichvar@redhat.com,
	akpm@linux-foundation.org,
	oleg@redhat.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 0/2] tsacct: keep task begin times stable across suspend
Date: Fri, 30 Oct 2026 05:42:25 +0000
Message-ID: <20261030054227.35453-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Keep taskstats begin times stable across suspend without changing the
MONOTONIC elapsed-time fields.

Patch 1 makes getboottime64() sample its offsets under tk_core.seq.
Patch 2 uses that helper and the task's BOOTTIME start timestamp, and
clamps negative begin times to zero. Keep the helper prerequisite when
backporting the taskstats change.

Changes in v2, addressing Andrew Morton's review:
- Add the getboottime64() sampling prerequisite as patch 1/2.
- Lower-clamp ac_btime64 without imposing a 32-bit upper limit.
- Add Cc: stable to both patches.
- Rebase onto mainline d89e1d186ec9.

Validation used GCC 13.3.0 with W=1. ARM64 and native 32-bit SMP x86 QEMU
guests pass all 36 checks, including the original 24. The 32-bit helper
stress reproduced inconsistent timestamps before the fix and none after.
Suspend time was injected through the real timekeeping hook.

v1: https://lore.kernel.org/r/20261026005506.2253-1-dennylin0707@gmail.com

Hungyu Lin (2):
  timekeeping: Read getboottime64() offsets under the sequence counter
  tsacct: keep task begin times stable across suspend

 kernel/time/timekeeping.c |  8 +++++++-
 kernel/tsacct.c           | 10 ++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)


base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.43.0

