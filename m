Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DCF2931C4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321757; cv=none; b=X00Gta8cCbLDBfjMNQlVGhsfqUp6lu3k2khXIXXxM4OdN48mNcGMfyevMd9POppbzvpCBeBAOBryth+z2oMkbFAqmJq7m+o6BeUjQ4GdufIX+6IavdJGjrAzt/g0qA5d8KntCBzqNJ25ksxpHqIVBx6zK5B97kw3FzkGYdaf4K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321757; c=relaxed/simple;
	bh=XtXw3UExvaoOyrQTNUiRZR5bOimftaG1kfjM1WPBsA0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Df4hMsfDTArw5GADHGsHGTUeGJnuUkRrM1SNxvJle2pMhj6I/h8QE+OdCR9By2sQxn8yeb+gfcaU/RpD9pthYoH7l0GlkmS0k5jLaVo7h+Ye8BsAQ92zZ6TPhpRDq2jdsJmz32Hx6vJeuo2JBgA4tCFrHMqqnAQS/M9qovzoYLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvJI4pk6; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvJI4pk6"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d7200b2e15so6133585ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788321756; x=1788926556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GaI7raCAqp2a79i151DYwWtfG9qL+ufWge5ZmCXwzF4=;
        b=UvJI4pk6IJRykYXrzZ0MDqt1um8PZTflKClaU9VhdLwtRxDxFG0Tce6pDTzgy1s59m
         VmrRrNh5QXe3mR7+xhsoA1V2xvhCPvlmM6pyYigIOLYuFHLwv07v4WQ9g68TOIhQPayz
         uwvp9om8OovdjbzBwgjKO4/Er7Sj9iKcgu38gtWZkzi06JjClCp3bmGbKJJmbBV7MCw5
         YkGGSMRU0C9OsTkQiFCX0x7XbHUR0x2AYZojJJodcYBQfowYePPMBSAvXzFo/RWB8+64
         1fFa+1O55v1dYvgZfMsARJmON+BvUWqeJWK7th+WYm2TwMpvx/NFgeV/0tVgHjqzizXK
         UW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321756; x=1788926556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GaI7raCAqp2a79i151DYwWtfG9qL+ufWge5ZmCXwzF4=;
        b=ouZ2WtkivXvg2pA3/B5Wpb2mORSNG1rtPvdU+u6YvuINR9u/rHpj0LIET9EI2yqjf7
         6NvzrYVkFF5WideUHqmSwJzfBbfi/JAXlUcNAN/el7YjYQKtVnd0CZt/ZICliG7vs7j+
         N1EitOowY1N7eBM8URB2L4q6frquyf0Rdmjb5XFxrQAot/eXEAiKQY0KUDf/qTzlizt6
         NwtvFyhZ6vFvLG6jgvVVeU8Evzxf8yxCXadxejB5f75KCgXlOuigtQ0FggJY5WsHZl8u
         px5Bpffr8G7m+AplgmC6FlRBSm10WU/59gMg3H48gksWFkk7c9r7WOAjqrJOsfH0QJcg
         W8Sw==
X-Forwarded-Encrypted: i=1; AKwUvBwstOiLPGuHJhV1YWQjRHznS8jOF0MbJScY4LDVaMhutM6BRqdA55ETU9K6kzifXXVzwMS02guo1E9EE9k=@vger.kernel.org
X-Gm-Message-State: AFuF++l2iHMweVxlswqjXaYpSEGYNfQb0dByikfNEYofIlXN3rIF552Z
	z9iGCDFhIEwokDVaKhp/3JjE1347lc+HwNzCprHZApLWzMv28RvMLJdD
X-Gm-Gg: AYBFou2CrvCGLyW8Npg6T6DqJfk/DvuhrxNp2PKXzUgK37bQAENB5W17gNpbUIMek/U
	Ox+7hfT4N15UmNKcwROCIzBciX5b8YiXB/xIFI4FYywcbYLVyteni/v3G58CTXSRpRaTyvBRGm7
	wo4o4xO5/mP5C6D4VOYJthJJkow/fs5XZU7xiGmo0nQPVu4pQZp8CyJ+LC52gj1FAe9lCCIjfHB
	8MHu0yxevspYdpr5IIStoqzqj+8UO2ETQwX17guwxRpdgojzFIIluotkZk5Z6JUXNi3yNB6gSTJ
	8iyBQdrS7zjTheP/C5+SQLKTOMppoUuishrDRmdgTttwwHdLszmzC0Lh9EB0jpZacus/zI20Tt4
	d/iTnjQzGKAKM82tzdAanDsl+yprdUwljLCYnmV3w0FsbbV5BP9OmRDJd0E/2ltTfDvTYe4wPWw
	mVKfUhXUUUzQOj0zpAQ2hlsnsIoKCn5aafLiRGKO/6ZX/CB5ZHenxklX9VHlYobljV+eW7p4qlr
	kZH3jZbmCbadCDyL73Y3pFuAx4KZ2hyTtJnOD5yTuL30tyhu7ZNdJmHOOgJA52A
X-Received: by 2002:a17:902:da87:b0:2d6:d3f9:d394 with SMTP id d9443c01a7336-2daec43fd64mr28404345ad.0.1788321755716;
        Tue, 01 Sep 2026 21:02:35 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:5fdf:d463:f07:1882])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07baa594sm3364529eec.22.2026.09.01.21.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:02:35 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	jhs@mojatatu.com,
	linux-kernel@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH iproute2-next v5 0/3] tc: fq_pie: add per-flow class statistics support
Date: Wed,  2 Sep 2026 09:32:18 +0530
Message-Id: <20260902040221.83734-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FQ-PIE exposes no per-flow AQM state in userspace today. This series
adds tc support for printing per-flow statistics via
'tc -s class show', matching the kernel fq_pie class ops series.

The corresponding kernel series can be viewed here:
https://lore.kernel.org/netdev/20260902035231.81866-1-hemendranaik@gmail.com/

---
Changelog:

v5:
- Addressed Sashiko review comments (folded into patch 1/3):
 - Dropped empty tc_fq_pie_xqd_stats placeholder; class_stats is now a direct
   struct member in the UAPI header.

v4: https://lore.kernel.org/netdev/20260727165028.106817-1-hemendranaik@gmail.com/
- Split into 3 patches: fq_pie class stats, pie avg_dq_rate
  formatting, and tc_pie_xstats comment fixes.

v3: https://lore.kernel.org/netdev/20260630184453.171410-1-hemendranaik@gmail.com/
- Moved print_nl() into each xstats type block to preserve output
  formatting.

v2: https://lore.kernel.org/netdev/20260614130729.10076-1-hemendranaik@gmail.com/
- Addressed ABI backward compatibility issue.

v1: https://lore.kernel.org/netdev/20260531131411.28213-1-hemendranaik@gmail.com/
- Initial submission

Hemendra M. Naik (3):
  tc: fq_pie: add support for printing per-flow PIE statistics
  tc: pie: print avg_dq_rate in human-readable format
  tc: correct tc_pie_xstats field documentation

 include/uapi/linux/pkt_sched.h | 21 ++++++++++--
 man/man8/tc-fq_pie.8           | 18 +++++++++++
 man/man8/tc-pie.8              |  2 +-
 tc/q_fq_pie.c                  | 59 +++++++++++++++++++++++-----------
 tc/q_pie.c                     |  4 +--
 5 files changed, 80 insertions(+), 24 deletions(-)

-- 
2.34.1

