Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844176;
	b=Qw/G2IFvddMM30fRq53bNHpzTlDmLloQ8sDO57EH65FS9jycUns7RC8rwshr32rVFRK2
	 r8l3YqwzVPZQQK9p7BtcEA+YXhhR1LI/W+TFrNmyZkfZCEzC88kyh8yUP2qpeFgPszQeY
	 xbgqE/eV0fYBcRKy7D6KjrDCaSZqKk+nghc/fPIdRSO4ikfH2FEH671RWff2jqJJ6EXuM
	 o89288xwIybNnKpO1BlcwCrhQRh10o60U7TJfXBNbF+65mFMUBnc8hrG9UqE01f6BPHvE
	 dxB9+RjkQUDX9f5xFDy8YaNMo0921Nhgzznuaf1o3uvBTzUEziH4aGiZCJ7XAxkx3Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ddi8ZLCL2hOZfi+sAkv5V27pHP2I/vbEpCnwvcWNBys=;
	b=bbU2fF5JJmPgZrURUobH05AGe9xHbksGC5gKpbFenhVmp3rNtIS5NAJ+O6lYGxVdRop+
	 1b0RnZGfRE4CdI4WW8BWD3lQdOOfIoEB+OfiVQ1+nrlXdGb8WCCEUIBy+JN4msvrJGiTc
	 +vjSNtYPghsx+E6SLKPWctB/m9AItFrhtHnhWGjvv2ObEbZfxNQhfSovzkzwGw/fnYjM0
	 BNAHQl4Gu+dYo9iOGPVxBQng/Ek6Pox1zwGHztibV+DtoVv8C2GlRtnNc9txA9Grc+63X
	 8j+pnGgoT881tCZsDPaSas5wzwrTyo6O7jaBHREtjDJIZHr2pyxd+bmK/C4LQzxQbtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0XltcJOT;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680BA606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 680BA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0XltcJOT
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so31304435e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844174; x=1795448974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ddi8ZLCL2hOZfi+sAkv5V27pHP2I/vbEpCnwvcWNBys=;
        b=0XltcJOTj8qBuNtrY72600QfOB1p0BYfaOyWxa6sfrFcPWWv9Wv5U+HZ0nLB2jSYBE
         H9uLZ6XXKriVNS/p+9xSgz2TPj2TPVCLCmLWYwOEis8NDtkBH3GJBbA2X3hsjdGEWAc3
         8pEfmuUNkgmFnafHxuO/oyDILnZ5DwGPgxwJDIq9GEPpwXs7YXivG2PTuMWPRSxJX7kg
         yxM07gtdVqya8PILauVaFS9Nx4+awJINSbgxRUCEy+JOrMNZM41JqsODGV/jeBXKoX/+
         OWTygCiYC+O0mCwkeLlJlnUQjNTRumVj8Ej9ggVLaHkLb7TUKRxsrGQSSt02GV/qV0tL
         Il6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844174; x=1795448974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddi8ZLCL2hOZfi+sAkv5V27pHP2I/vbEpCnwvcWNBys=;
        b=lL0UAXOUieeEEycxNyFppsIY2yoUUCg3Qpm+XmEpH5kzvJ3Z0OFO9SAV4xZ3HoqW6s
         jzBsmOmkBei8/VRrybRxXIb0qfUIU3u8MYbhjOB7H3c+cealRSRJcFiTPmO+yDqo4chL
         DWZnP9pvNMivycWywjjmw6bxPP+8rOIw8PB5xtx54+R/WX1NOdmcTaqtvhcFSlUG67Xi
         37lf/UV1vyGMzH51e5f6BfDlziL2qqFa/pkgIpIiYXp1zUppowZPmSQcYpQInCHFK5dy
         sL3rThLUBOOJOm157saN6pFsIvR0tEQNShUxyeK+9FkesQTxoJFGh1Zikqr39zGzUZqW
         3oKg==
X-Forwarded-Encrypted: i=1; AL+hErEp3gCEt1VQeC6nZ4Yl3cA3kv/vzLYLEQd37s2nUuWvImj/AzlA9SFpk1rdT2ofnF5sneqjNXBRvlsK2K4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/z/tyCo5B8ePrtCX0vmeUhIhBfVTAltTg5NzRh/oYJEhaAKAx
	CnvA7SWFutqdznOuFGRmBHKkzVpD45uBLeTmq/6gnstEeCAa9+jeR8H3
X-Gm-Gg: AYBFou3Op5Ha+bKfRDroLATKaIXxT95cFtT5od7REpKKOShnB6m2acgHa/PaidvmHyt
	ZIT9aht69kZ+mkJV+tATos/SHqsVewjskkKa7T+3uDPGz5N1dNRh+jFnBbmXjc5UgM0j7utv5Zv
	5CIyjJcuOlQucpsPLlKZ/Y9QXBM5CEgGQRYH7MBIR5WTfYJ5lTWgaxdg2KpZ4sc24Apes+3arzD
	G371ORRVLqC5xYMHAJOw4gISIMIkaWXK5N6Be/3/98ohK/oPWlMkAHAyMACdZfYdQVTiL4a8fk3
	vTz0NKmlNW2uS13eUQIeMoZcq0qtxsf+TyU3Fu+1N+ttqEqU4Ly8SIulVEnbwutFwaCEgVbLpwF
	fMej/tKR1qP/v15LyBfoZHJ6DmEwbzkd6ZgT9vxBMmDgJD0+t1TWmN+2u3cRfTCWxxgR+5vqh03
	Qnv4XLMi6cMvJarj8bamGmabOqhLTO9uGYFMeyxd9ObjPOjHwynXym7SEhN2hy0FFMCGyzesGFv
	2So/JbLf6WcnxVQRDRV7+ZoMn2V+Ta5kr88qoJJrft/MwZx7UoWIrvDA1E6YosBFj54/uzhZAdW
	BXpL+CwfZ0+dC/pBEHdBUrgr1Nc7bpGo3ec0bzY01hk+3CQmVFXBNkwcz7BQYFxnhinqTIZGo8p
	V9W+dsjeWB/TJtKM6zeg33L4dwCejNNBn7MyLBw==
X-Received: by 2002:a05:600c:1d10:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4bb55a65ea5mr218622945e9.5.1794844173463;
        Mon, 16 Nov 2026 07:49:33 -0800 (PST)
Received: from DESKTOP-0KSTGNI.localdomain ([41.44.127.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2f61c0989sm1107290f8f.48.2026.11.16.07.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:49:33 -0800 (PST)
From: Temitope obabi <obabitemitope765@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	dhowells@redhat.com,
	brauner@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Temitope obabi <obabitemitope765@gmail.com>
Subject: [PATCH] cachefiles: Remove unused cachefiles_prep_read tracepoint
Date: Mon, 16 Nov 2026 17:48:52 +0200
Message-ID: <20261116154852.7765-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Nothing calls trace_cachefiles_prep_read(), so the tracepoint is
unused. Remove it, along with the cachefiles_prepare_read_trace enum
and its name table, and the entry in the BPF raw tracepoint null-args
table, which exist only for this tracepoint.

Fixes: c990057233d1 ("cachefiles: Don't rely on backing fs storage map for most use cases")
Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
---
 include/trace/events/cachefiles.h | 64 -------------------------------
 kernel/bpf/btf.c                  |  1 -
 2 files changed, 65 deletions(-)

diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index a19233e8ae78..8380a4156c4e 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -72,17 +72,6 @@ enum cachefiles_trunc_trace {
 	cachefiles_trunc_zap,
 };
 
-enum cachefiles_prepare_read_trace {
-	cachefiles_trace_read_after_eof,
-	cachefiles_trace_read_found_hole,
-	cachefiles_trace_read_found_part,
-	cachefiles_trace_read_have_data,
-	cachefiles_trace_read_no_data,
-	cachefiles_trace_read_no_file,
-	cachefiles_trace_read_seek_error,
-	cachefiles_trace_read_seek_nxio,
-};
-
 enum cachefiles_error_trace {
 	cachefiles_trace_alignment_error,
 	cachefiles_trace_create_nospace,
@@ -163,16 +152,6 @@ enum cachefiles_error_trace {
 	EM(cachefiles_trunc_shrink,		"SHRINK")		\
 	E_(cachefiles_trunc_zap,		"ZAP   ")
 
-#define cachefiles_prepare_read_traces					\
-	EM(cachefiles_trace_read_after_eof,	"after-eof ")		\
-	EM(cachefiles_trace_read_found_hole,	"found-hole")		\
-	EM(cachefiles_trace_read_found_part,	"found-part")		\
-	EM(cachefiles_trace_read_have_data,	"have-data ")		\
-	EM(cachefiles_trace_read_no_data,	"no-data   ")		\
-	EM(cachefiles_trace_read_no_file,	"no-file   ")		\
-	EM(cachefiles_trace_read_seek_error,	"seek-error")		\
-	E_(cachefiles_trace_read_seek_nxio,	"seek-enxio")
-
 #define cachefiles_error_traces						\
 	EM(cachefiles_trace_alignment_error,	"align")		\
 	EM(cachefiles_trace_create_nospace,	"create-nospace")	\
@@ -210,7 +189,6 @@ cachefiles_obj_kill_traces;
 cachefiles_obj_ref_traces;
 cachefiles_coherency_traces;
 cachefiles_trunc_traces;
-cachefiles_prepare_read_traces;
 cachefiles_error_traces;
 
 /*
@@ -468,48 +446,6 @@ TRACE_EVENT(cachefiles_vol_coherency,
 		      __entry->ino)
 	    );
 
-TRACE_EVENT(cachefiles_prep_read,
-	    TP_PROTO(struct cachefiles_object *obj,
-		     uoff_t start,
-		     size_t len,
-		     unsigned short flags,
-		     enum netfs_io_source source,
-		     enum cachefiles_prepare_read_trace why,
-		     ino_t cache_inode, ino_t netfs_inode),
-
-	    TP_ARGS(obj, start, len, flags, source, why, cache_inode, netfs_inode),
-
-	    TP_STRUCT__entry(
-		    __field(unsigned int,		obj)
-		    __field(unsigned short,		flags)
-		    __field(enum netfs_io_source,	source)
-		    __field(enum cachefiles_prepare_read_trace,	why)
-		    __field(size_t,			len)
-		    __field(uoff_t,			start)
-		    __field(unsigned int,		netfs_inode)
-		    __field(unsigned int,		cache_inode)
-			     ),
-
-	    TP_fast_assign(
-		    __entry->obj	= obj ? obj->debug_id : 0;
-		    __entry->flags	= flags;
-		    __entry->source	= source;
-		    __entry->why	= why;
-		    __entry->len	= len;
-		    __entry->start	= start;
-		    __entry->netfs_inode = netfs_inode;
-		    __entry->cache_inode = cache_inode;
-			   ),
-
-	    TP_printk("o=%08x %s %s f=%02x s=%llx %zx ni=%x B=%x",
-		      __entry->obj,
-		      __print_symbolic(__entry->source, netfs_sreq_sources),
-		      __print_symbolic(__entry->why, cachefiles_prepare_read_traces),
-		      __entry->flags,
-		      __entry->start, __entry->len,
-		      __entry->netfs_inode, __entry->cache_inode)
-	    );
-
 TRACE_EVENT(cachefiles_read,
 	    TP_PROTO(struct cachefiles_object *obj,
 		     struct inode *backer,
diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 538129ed2418..c6403edf97a4 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -7264,7 +7264,6 @@ static const struct bpf_raw_tp_null_args raw_tp_null_args[] = {
 	{ "cachefiles_lookup", 0x1 | 0x200 },
 	{ "cachefiles_unlink", 0x1 },
 	{ "cachefiles_rename", 0x1 },
-	{ "cachefiles_prep_read", 0x1 },
 	{ "cachefiles_mark_active", 0x1 },
 	{ "cachefiles_mark_failed", 0x1 },
 	{ "cachefiles_mark_inactive", 0x1 },
-- 
2.53.0

