Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794120473;
	b=tlHZp72ugfDO8vyfYzgbKwR26Cxjf0RRQS/g8h/CEpkfIblxiUOFEug7uCNVcI+UJHsx
	 QFdhP1XWeT4xU1PqqI4zGluuwJ/l1DN+47qL9lhscGlRweq96vl5AkbMI839fFafhJwVV
	 hVRhgWx9zG+L3UQm+9yfGpA5O9VHND+EZKR88fMvHQz8O0O/nZjjcSYY6Q60jWMyz9dfL
	 M5DZVakcbJR8/FKctEEwct0rD8/TX5zl847F6hz9G8TLEOZ8y3s9LMOQGdOj/Vz/3YzeM
	 mM1FGPREv0ZpcaeiHohIZddKrMO+jn6WPMbfw55TdJLBJgvU9zwZLwr4niq2XadHswA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794120473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cKZVAumh7VUy5yuq+U1sG3RMnUiZQTey/FtdDJ1Gal4=;
	b=gVvFE7s5Zy1uLeacIr0Ep5UzCMryMsZWniquxyEaKmjwYlzUJtKIixkqwyv5D3js4mub
	 Qk2LMqocDcTdTdLLlzv6rU9kjjgg/nfnqgKp0XKjNOi7QVe7nCf0AcwfXWarL2E1b34+O
	 rUbj99Sa1pRTfkkxMv3s3obrynlewyP5NHi9Odwulvvv1fbmELosFWy4+oOOHLphkTzwE
	 goRLsqOceDwEmsZzzobw25b+G/CukW1YslXkAoTHkm3tn44MWe55D00+5tQZbYkGMluHi
	 Hc3ut/u4M1Bcf3VOTrO/VYKJqQrsMbmFtMZHmg5NMwTGi6HKWAcRD4g7cGk37/I2NvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKM0CFgs;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679BD606A31D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 06:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 679BD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKM0CFgs
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so737951eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 22:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794120471; x=1794725271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKZVAumh7VUy5yuq+U1sG3RMnUiZQTey/FtdDJ1Gal4=;
        b=yKM0CFgsy3uOk0v7hg0qZnjSn0Ndk4B798CoyjTJAdcGju0+LCU7fVjHLF4GcPSQ26
         RXEYTrlsy5c2MftfSL6Ha65ta3uGXbCYR77lhkFFj6hTV+Or0XorCRHRl9dPeGEuAWgY
         mKNjdwFL5koQjaaA0FaI5gKyNB+rUTfyfdmxBbbaVDaty3Yj0EMdzI3QbAiIEdwRjm8g
         w6xhKwdRXLOMpoBRgu2iB4icwo7kNGHJ7Ag8m8krRQ3+cgvmsPRo5pvlD4QF9E+NKozm
         zsptjvz+3HAOP5IQL4vF2ezAOozp10sNF43zz9vAErXMLgcnpDS15PpJtCoCTx9Of0CD
         Vn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794120471; x=1794725271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cKZVAumh7VUy5yuq+U1sG3RMnUiZQTey/FtdDJ1Gal4=;
        b=qn6c/o2PU2O1fA9qTWdygYFltJF5F7a3q5BCtZg8rDtDLqcU3pGKb62wyUSXtlBmVb
         X7suPv/yB9cVCB1U0S6I4/UzC4qF5B/KfRx+FrYkd1NMdNRhDHy4t53npLsrsGsC4WLA
         htEdF4oWWUHxfNP1yulAqrORj8QU4dC2uLqee8GZIlNrNc3Sh58EJ4YIuQ7BF4T7m6VZ
         K0OixwQOOaWxGL8rXvmgWbOHgTLSxumvK3Q74j9VBfcDNDvOvh/eNsNhlPHq7aPe0TGf
         PKWVGmQ8DtvBlkwz1b3Duc7On5c9SN0mePqZ5tV+imE5XjMAA4a8eG799UIFaxUNRJij
         8nvA==
X-Forwarded-Encrypted: i=1; AL+hErGvofrh6XZgDLpHz0k5RgTst1xqx4zTgv+E7IfqwfxYkIZa9vPhyYAX+FvKZ/5H1fRr20ObP6I2szTBifw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WT2Ht0MOTY3FteqzBIlFacRe6k8ZdLkBHbs+E+fgbJwLSsvwt
	bGfbTM0N+FeVh69QbzTNzvbvr/sJw7Um0eXLE2PxmIm1T9LKqe5RA7rO
X-Gm-Gg: AYBFou0/Yx1GT4XY+wQgE1KCZuRKxsEY769AWY+ZdhVNRTzP5y/Z8tG1QZoVvHdz45x
	hy5RH3nta712iGrPGsGvh13RlRmRsXqn3jZViECAG9YKU8uezU9bh1ZI7coHB/ieIsfy9gEYyuV
	FtQiUr2q+xThi0hHwhjJmHFz6JOwbI2o1FxOJe4TJ9ip4qUfk+OWWuyLoXzVCRIcey6CXu+/MK2
	HYYAPPz3HIWxrdwtVGdnFoTCO7c63PxMoFj3KRdJ6/I6+JCNjqWL8xQGHEYVoJIxEiGPZVEcm6o
	Pi1ho+EvZ786FwpvCfjNcTKZIgSFJdM1VgTkX0DfFveyIovcGd5Sj+kfubXdVrG4EvBrN0Nruy+
	qGAMirfTLRKiEYrXHN7SQ24t6BebaZsHB58sV6XBFVVB4csZqJGBOsWBBHJgM0q+axYGR9C+Lr5
	Vrm9X4HthYtk3rM95bVEpxDgzm1ehVhaGYG+nAY0OTqCnw2dwH9MRpGHGud7nRvAmrZpZ+uxVbk
	GG2RTGVXBGeSS6Mi18UvVgDpG2OOT/Nut9OxnufX/9SFiy4/+6LVsltPMM4HiETtuZoyqDr/hYr
	VsTEmzByEzOcjW2qGMBsEGyDc0LpmAnwVuHeIzpEiIKWvT9uTw27z7LrLklNrjK8jFT97NsXaWo
	XWA8RSGaBt6PXkewsOQfmvkEWUQ==
X-Received: by 2002:a05:7301:7305:b0:369:d779:bcb8 with SMTP id 5a478bee46e88-3724fd69ac0mr1973804eec.0.1794120471293;
        Sat, 07 Nov 2026 22:47:51 -0800 (PST)
Received: from localhost.localdomain ([2406:b400:d4:acc8:a024:59b8:c312:eefd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726039c635sm3190224eec.0.2026.11.07.22.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 22:47:50 -0800 (PST)
From: Torra Sowmya <sowmyatorra@gmail.com>
To: James.Bottomley@HansenPartnership.com,
	mkp@kernel.org
Cc: johannes.thumshirn@wdc.com,
	axboe@kernel.dk,
	dlemoal@kernel.org,
	bvanassche@acm.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	rostedt@goodmis.org,
	julianbraha@gmail.com,
	julia.lawall@inria.fr
Subject: [PATCH] scsi: sd: Remove unused zone append tracepoints
Date: Sun,  8 Nov 2026 12:16:26 +0530
Message-ID: <20261108064626.5539-1-sowmyatorra@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025151702.13434-1-sowmyatorra@gmail.com>
References: <20261025151702.13434-1-sowmyatorra@gmail.com>
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

Commit 1846f308d66f ("scsi: sd: Use the block layer zone append
emulation") removed the calls to scsi_prepare_zone_append and
scsi_zone_wp_update, but left their definitions in sd_trace.h.
Consequently, sd_zbc.c still generates code and data for events
that have no remaining callers.

Remove sd_trace.h, which contains only these two events, and
remove its include and CREATE_TRACE_POINTS definition from
sd_zbc.c.

Fixes: 1846f308d66f ("scsi: sd: Use the block layer zone append emulation")
Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>
---
 drivers/scsi/sd_trace.h | 84 -----------------------------------------
 drivers/scsi/sd_zbc.c   |  3 --
 2 files changed, 87 deletions(-)
 delete mode 100644 drivers/scsi/sd_trace.h

diff --git a/drivers/scsi/sd_trace.h b/drivers/scsi/sd_trace.h
deleted file mode 100644
index cba3c0b825ba..000000000000
--- a/drivers/scsi/sd_trace.h
+++ /dev/null
@@ -1,84 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2022 Western Digital Corporation or its affiliates.
- */
-#undef TRACE_SYSTEM
-#define TRACE_SYSTEM sd
-
-#undef TRACE_INCLUDE_FILE
-#define TRACE_INCLUDE_FILE sd_trace
-
-#if !defined(_SD_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
-#include <scsi/scsi_cmnd.h>
-#include <scsi/scsi_host.h>
-#include <linux/tracepoint.h>
-
-TRACE_EVENT(scsi_prepare_zone_append,
-
-	    TP_PROTO(struct scsi_cmnd *cmnd, sector_t lba,
-		     unsigned int wp_offset),
-
-	    TP_ARGS(cmnd, lba, wp_offset),
-
-	    TP_STRUCT__entry(
-		     __field( unsigned int, host_no )
-		     __field( unsigned int, channel )
-		     __field( unsigned int, id )
-		     __field( unsigned int, lun )
-		     __field( sector_t,     lba )
-		     __field( unsigned int, wp_offset )
-	    ),
-
-	    TP_fast_assign(
-		__entry->host_no	= cmnd->device->host->host_no;
-		__entry->channel	= cmnd->device->channel;
-		__entry->id		= cmnd->device->id;
-		__entry->lun		= cmnd->device->lun;
-		__entry->lba		= lba;
-		__entry->wp_offset	= wp_offset;
-	    ),
-
-	    TP_printk("host_no=%u, channel=%u id=%u lun=%u lba=%llu wp_offset=%u",
-		      __entry->host_no, __entry->channel, __entry->id,
-		      __entry->lun, __entry->lba, __entry->wp_offset)
-);
-
-TRACE_EVENT(scsi_zone_wp_update,
-
-	    TP_PROTO(struct scsi_cmnd *cmnd, sector_t rq_sector,
-		     unsigned int wp_offset, unsigned int good_bytes),
-
-	    TP_ARGS(cmnd, rq_sector, wp_offset, good_bytes),
-
-	    TP_STRUCT__entry(
-		     __field( unsigned int, host_no )
-		     __field( unsigned int, channel )
-		     __field( unsigned int, id )
-		     __field( unsigned int, lun )
-		     __field( sector_t,     rq_sector )
-		     __field( unsigned int, wp_offset )
-		     __field( unsigned int, good_bytes )
-	    ),
-
-	    TP_fast_assign(
-		__entry->host_no	= cmnd->device->host->host_no;
-		__entry->channel	= cmnd->device->channel;
-		__entry->id		= cmnd->device->id;
-		__entry->lun		= cmnd->device->lun;
-		__entry->rq_sector	= rq_sector;
-		__entry->wp_offset	= wp_offset;
-		__entry->good_bytes	= good_bytes;
-	    ),
-
-	    TP_printk("host_no=%u, channel=%u id=%u lun=%u rq_sector=%llu" \
-		      " wp_offset=%u good_bytes=%u",
-		      __entry->host_no, __entry->channel, __entry->id,
-		      __entry->lun, __entry->rq_sector, __entry->wp_offset,
-		      __entry->good_bytes)
-);
-#endif /* _SD_TRACE_H */
-
-/* This part must be outside protection */
-#undef TRACE_INCLUDE_PATH
-#define TRACE_INCLUDE_PATH ../../drivers/scsi
-#include <trace/define_trace.h>
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 56e455fb5add..a7bdf089e142 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -20,9 +20,6 @@
 
 #include "sd.h"
 
-#define CREATE_TRACE_POINTS
-#include "sd_trace.h"
-
 /* Whether or not a SCSI zone descriptor describes a gap zone. */
 static bool sd_zbc_is_gap_zone(const u8 buf[64])
 {
-- 
2.47.3

