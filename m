Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777014;
	b=kbawrMruOahLctdyjEdYAE7wYLYJCPjK3v5jV/FOkog3FNHWOe4F3O1JtcrfwDQ+0PG8
	 CSViEenlVrfvJyAdJoEcivuFrzTDaC0+RieQUSY489zI/wCeDERlxYRaZF+uwJ0m+0CtH
	 U81Xcfywye2yBe9s8su/CDIhs2LIEeVd5yxKhu+efvQggYhByjOMwa06gT4Sn9HoqeVGk
	 v/B7hgWA+lThPz9cYJyLWSShAQffTEc+tbH9susNMjQpzLKXkvayWBoBrZCdco51Ntt/B
	 dZ6aftyrTiXZKGNnV9S0gwE0bEd368JrnsRPsWVCm/YjxNQ20mJMbIMj+vxEWdJ89XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oQFSDg5cHBfrZhn/Xqr57kPvYhbLjr1otgLb7m0JLjg=;
	b=lp+qriClTGpPFkNj1Mj3UhIGNZEih5rSvF8rlbS295qhF01Yj7naQslcGU7mheLt1exp
	 eUNGwHtXgXphq2WfrQ+Q99A2gqj+c6/s1oMJiMcrbU6+p2FAxaEn7NQUtZXSzWkdRbqKF
	 hOXSaObws/iwYSyLRf/O/qPjn8tCXlskEHcf0uCcR4J1fkpUHiF3pkk0IIHZYXf6RhX29
	 1kNHEn5SbQfoWqbnplslDDtf6bICJfMTZmBwX2rZLGeraNV2Py4LES5O7cnQOaIw4zXjT
	 BDTNcwmEI/ZM+Uh5KWjFtXJOuVTj9RAkPFCRPN/Ql+voLzl1VEfdBlXnuWgi+E/RhSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzSCHJmS;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF79F606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF79F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzSCHJmS
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1439465b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794777013; x=1795381813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQFSDg5cHBfrZhn/Xqr57kPvYhbLjr1otgLb7m0JLjg=;
        b=uzSCHJmSpT6rzm/HyErENUYElGk4p7T1CSvlyZl0mzgDMdAfIgkX0aLaP7TtwxAoax
         svNoHOEL8l/h/2pQyQ3ZlTMD1t3gIPMXJdpwVsG0ma/h9WoOV+2NvsA+/8kn3hjruQ21
         dcI7KWPlQYxkBH/J9CtXpJxzFSVkAZnoB8HYbbu0GH9r8fri9YsGfMcnkb+z1n+PRdr2
         JNaorixqYXZO4BmtjqqA4TTqv1d9DPC2z8Rjnv/eJAfqi0fTQT9TeTv/2UHJ5Mt1qyvv
         49Mv+rm1Y1qM7A4Tz9mbPuS8hdd7E0Qxrxzx/fIOiPX0tOTPMqRv53rYSqVX2qjMCO2a
         22Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794777013; x=1795381813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQFSDg5cHBfrZhn/Xqr57kPvYhbLjr1otgLb7m0JLjg=;
        b=DTqhGrfCPo6ksUVchOC32eVE1c/cgjnIz7+V781BFf02x+endWXnhq4DW/qNqq9tGh
         hiZkgBe8QD9I+BJCfjpNT65fNCFcurH5IPbMmR7tn9GBraQZDzRRdYS8irmoyr++EJua
         PTSclJAeQQ4cmppYQxzVHNvZveibc7beQPElFudjh/vL+P3HDMpzYODwLizy84hQukza
         6FszsYBxqeK/AGtiQ7IP47+Y8qpQNM4dM5tdaj4k5Y35t0SAdgkKz+LhPvDiX3O1MGxQ
         LnpPWgTIEBmlxByVYPIrkj83hLGYCySZTU1p4SXHO+oYe4kMvQ84GEhvir2KcxKQeXkq
         m2oQ==
X-Forwarded-Encrypted: i=1; AL+hErGtaIvo4iN/yglEz83+LumlQ0yvuLME3DaXMeqNOIotXCmtaoWE3ji2xtyemrJ9WTnXqJRJ7m2pLvMT0U4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/25uq0NVTEdA1gJdk+BXxnhhpqojHlAfJGkF8AJ6INp8PCtIT2
	5gDMCZV3hncWppzRjmaNWmYbKhtTHcID0VTWCFwkk+ZUEdCmvoBvkRB3
X-Gm-Gg: AYBFou1MY6p8ra4ljFYg/yX1nsvrkBPdAKJlh+mI4cpKLMCqKZPv7ayL4vQ2tqExEnL
	j8JyQhM0XAWqtt7ZbLXFawwim8JtWOuw8WO+DgXIAM8cna9Gq2S2AGXzWMl6eX7/QVJ0lpcEbwp
	WGaGvofX6Rdn4iys8Ve3djNC5lcHF3wC4Diwe1oMarWLAelrygQFsymXSmDzO1tCt2wXMSW1pzM
	pHUekeNdY4iGcnWI5M47iU73uJnXLPtEXmq6hIvOloyBSK6M2fo8iDoPj3gIJLsN0q960DuQQSP
	5RlLqmdJE6lQo1aaCRqIr1RCPn9FHejb8GJRfbywkMH11OSpzXTU2a0NAv+YjJT4MVEAgcb0WVQ
	MFbfm5N/l5KEOHkOsTJJFR2PUeJK/D42FoVlepQ9X//kHOEaGLU8ddRA1DkSK2H5gVTjhiTuwvc
	w74ECarlyM288fOC0yKBqmH9t4Ji4rKM0CtbSmgoz40sERlfr3fTbt1RXtmrCBsvzY4105LR9Ws
	zTkpcKop4Upoj/TgbCGW4Df8x8dKbl321HUoIfWLbHJlzT1jRFiNPBQBOnOFOkLIbeamJsLqMqw
	QjyXVS/0rLOC3tefsaZhpDnkIdPZPondF+4nBhbTXU7LXizs6g==
X-Received: by 2002:a05:6a00:1990:b0:8b5:b3c9:ff71 with SMTP id d2e1a72fcca58-8beb374decemr7993433b3a.7.1794777013037;
        Sun, 15 Nov 2026 13:10:13 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6e7f5sm2892615b3a.25.2026.11.15.13.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:10:11 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jan Kara <jack@suse.cz>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Matt Bobrowski <matt@bobrowski.net>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/3] inotify: zero-pad event names after an embedded NUL
Date: Mon, 16 Nov 2026 06:09:49 +0900
Message-ID: <20261115210952.2140036-3-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115210952.2140036-1-graypanda.inzag@gmail.com>
References: <20261115210952.2140036-1-graypanda.inzag@gmail.com>
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

inotify_handle_inode_event() allocates the variable-length event with
kmalloc() without zeroing the name buffer, sets event->name_len to
name->len, and copies name->name with strscpy().

If a dentry qstr contains an embedded NUL byte (for example, via a
crafted FUSE READDIRPLUS entry aliasing an open directory), strscpy()
stops at the first NUL while event->name_len still covers the trailing
bytes. copy_event_to_user() then copies event->name_len bytes to
userspace, leaking uninitialized slab memory from the tail of the
event allocation.

This mismatch dates back to
commit ce163918cd33 ("inotify_handle_event(): don't bother with strlen()"),
which replaced strlen(file_name->name) with file_name->len, and remained
in commit b8f2688258f8 ("inotify: Use strscpy() for event->name copies").

Switch to strscpy_pad() so any trailing bytes up to event->name_len + 1
are zeroed.

Fixes: ce163918cd33 ("inotify_handle_event(): don't bother with strlen()")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 fs/notify/inotify/inotify_fsnotify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/notify/inotify/inotify_fsnotify.c b/fs/notify/inotify/inotify_fsnotify.c
index 6e3af6452dcc..78eb1e92a14c 100644
--- a/fs/notify/inotify/inotify_fsnotify.c
+++ b/fs/notify/inotify/inotify_fsnotify.c
@@ -121,7 +121,7 @@ int inotify_handle_inode_event(struct fsnotify_mark *inode_mark, u32 mask,
 	event->sync_cookie = cookie;
 	event->name_len = len;
 	if (len)
-		strscpy(event->name, name->name, event->name_len + 1);
+		strscpy_pad(event->name, name->name, event->name_len + 1);
 
 	ret = fsnotify_add_event(group, fsn_event, inotify_merge);
 	if (ret) {
-- 
2.43.0
