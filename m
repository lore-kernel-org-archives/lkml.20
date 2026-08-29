Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5315F35C69E;
	Sat, 29 Aug 2026 09:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787994774; cv=none; b=iSWuEshf/RYWnWntDi4OSYw3Ea5/H/gPXc4SGQ8oMaUoxveysga16kvaRBf0vWOYunq63gm5l4FRtEs/iJ3w7M9ErWM93HhCatZEdiRZmK9qSiXSe4IUQcWrIlNoy7bgB+scM6NnGZLj6tXbdJQHQck203THiJe1gAMDGkkRrh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787994774; c=relaxed/simple;
	bh=UAz685gtoIu6kBn/yxbovXcs2WBKPH9EvlliakMXGuc=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=nQZfGBEbF1G/uj0QAfKnLF7ulbtlgMvRj7LnHMe96yFjTxdegVqLBpvRkMD0ZogpQKOmMUp0pHhdmEmyj5ko8nnSsZxqEyqK4OD7X5JAG9Q4Mfodnp8P6jlwl/EVYPpVWwn3K0I1HxuMrRaGRvgs3wTx9iZOOxrB52mEbA96jGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hX8ff5Sglz5B101;
	Sat, 29 Aug 2026 17:12:42 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 67T9CZwB090162;
	Sat, 29 Aug 2026 17:12:36 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 29 Aug 2026 17:12:38 +0800 (CST)
X-Zmail-TransId: 2afc6a92a286032-a35e3
X-Mailer: Zmail v1.0
Message-ID: <20260829171238191s9SIXoZPTlZSmA2Px30hn@zte.com.cn>
Date: Sat, 29 Aug 2026 17:12:38 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>, <thomas.weissschuh@linutronix.de>
Cc: <corbet@lwn.net>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <xu.xin16@zte.com.cn>,
        <wang.yaxin@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHY1IDAvNF0gdG9vbHMvYWNjb3VudGluZzogcmVmYWN0b3IgZGVsYXkgZmllbGRzIGFuZCBzaGFyZSBmb3JtYXRfdGltZXNwZWMoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 67T9CZwB090162
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 29 Aug 2026 17:12:42 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A92A28A.000/4hX8ff5Sglz5B101

From: Wang Yaxin <wang.yaxin@zte.com.cn>

- Convert per-field delay members in struct task_info to an array indexed
  by enum delay_type, eliminating offsetof() pointer arithmetic.

- Add __kernel_old_time_t typedef to tools/include/uapi/linux/time_types.h
  per Thomas's suggestion for backward compatibility with pre-v5.5
  UAPI headers.

- Factor out a common format_timespec() implementation shared by getdelays
  and delaytop, using strftime for cleaner timestamp formatting.

- Replace the complex sizeof/ULL/shift Y2038 guard with a direct narrowing
  truncation check ((long long)time_sec != ts->tv_sec).

Change Log
==========
v4->v5:
https://lore.kernel.org/all/20260824081329-eb7ca513-7418-4895-9fdb-dfe53fb3a0e6@linutronix.de/
As suggested by Thomas, add "typedef __kernel_long_t __kernel_old_time_t;"
to tools/include/uapi/linux/time_types.h to provide backward compatibility
with pre-v5.5 UAPI headers.

v3->v4:
update patch 2/3 and 3/3 according to the suggestion:
https://sashiko.dev/#/patchset/20260718133420538UvsJFurowueTqxAaZ1cRP@zte.com.cn

1. add #ifndef __kernel_old_timeval guard to
tools/include/uapi/linux/time_types.h to match the kernel header and avoid
redefinition on sparc64.
2. update commit message to document the nla_len < NLA_HDRLEN sanity checks
added to netlink attribute parsing in getdelays.c and delaytop.c.


v2->v3:
update patch 2/3 and 3/3 according to the suggestion:
https://sashiko.dev/#/patchset/20260715124740929HC7tDDb2SK3kRxbuPruHd@zte.com.cn

1. tools/include/uapi/linux/time_types.h: use __kernel_long_t instead of
long to fix ABI mismatch on x32
2. tools/accounting: add nla_len < NLA_HDRLEN checks in netlink attribute
parsing loops to prevent infinite loop on malformed messages

v1->v2:
Only update patch 2/3 according to the suggestion:
https://sashiko.dev/#/patchset/20260711173112482SCQEM08VED2PT1pxUYOXk@zte.com.cn

1. tools/include/uapi/linux/time_types.h: expand stub to full set of
  6 structs from kernel UAPI to avoid shadowing system header
2. tools/accounting/Makefile: add $(LDFLAGS), $(LDLIBS), $(CPPFLAGS)
  to restore compatibility with standard build variables

Wang Yaxin (4):
  delaytop: refactor repetitive delay fields into array with enum
  tools/include/uapi: Add time_types.h with direct type definitions
  tools/accounting: factor out shared format_timespec() implementation
  tools/accounting: simplify 32-bit time_t overflow check in
    format_timespec()


 tools/accounting/Makefile             |  12 +-
 tools/accounting/delaytop.c           | 265 ++++++++++----------------
 tools/accounting/format_timespec.c    |  37 ++++
 tools/accounting/format_timespec.h    |   9 +
 tools/accounting/getdelays.c          |  36 +---
 tools/include/uapi/linux/time_types.h |  76 ++++++++
 6 files changed, 235 insertions(+), 200 deletions(-)
 create mode 100644 tools/accounting/format_timespec.c
 create mode 100644 tools/accounting/format_timespec.h
 create mode 100644 tools/include/uapi/linux/time_types.h

-- 
2.25.1
