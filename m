Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E650F37E5C8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610142; cv=none; b=Vhv2W3yW3OdKv0henfEGji1juIIkf8nAspGG+qySEJialGChBCmzpOduux9Y317pCyDhhqx6SyX/NNFr2qDcKuduNI3vvY/m3/1Y8Xn801c5HpZ9YdOHNB51JVCA/WrcE/EO/f7MlC7kukkGb4Mdd6vmIM6WA/yNeXItontIsP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610142; c=relaxed/simple;
	bh=huK5NMhjr2x4b93vE/ihBE517KG4j4GmxK1igWLRb1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ec/FBs7+FBpWCmG2R2TQi/r7pJRBKWN8ZfYmHKfl+lcILlq5ymh+RjBUeLtWUu1E7jd4GYvvHNsHnaE0p0apbgbMw1MqZHl2JeHhQYBD5w0R95/TCDzTmwdAGCUC9llq0TfLdUc+6u65bSURTRec+uXtktLzIDvRShHZeJc9+SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cu199noT; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cu199noT"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398cb5615deso301863a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789610140; x=1790214940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZOaFj+S59FnHr3BU64MfuAR/RqO/6DiqpgAbb7s87UA=;
        b=cu199noTMhkr1q20tQxO2VyEuUnE8Me0EupXHJzGpCzS0W4FE2vRq44PEXAw3GmlWC
         mCR2mwZMkPeGwZuo4tzbFcrr7g4v6BVj4gK5QyXl3MS2iUvsuHhe3szx5ctTL8LoV5ng
         Xw5+e6Db7LWXvuYeQciDCUeAxmmAtzgp7cfaEJi+XcHiMkjV96LA1zaM4B4Xoyfh5SF+
         TO9Qos1Sg/At6FVaMDgD/ito0xwfQq2hiv3BRA3EzxCNHCukO8lbvNrI+hmSC1maDaus
         k2jCc5MEyPXYMOJ52jJjqLB3pGLZKb2V0dNiSdlw9ko6QjOb5ZdoLq8Yij8qbtg3qJvq
         izjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789610140; x=1790214940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOaFj+S59FnHr3BU64MfuAR/RqO/6DiqpgAbb7s87UA=;
        b=Ut4YlZDVo5ui6mOQx6LqDNLXl3+dp48J2snpb751og76cWgspFoxq3QR9OWxovcfAT
         A02n701Pi9WdWapWTPgcQ8T7azRW1cHUaiizCl7UIMSruhkDvzyg2+DJqcuOzDtvGJnW
         7YfNjhhm9c7vPB2LWnWAWK/ufC5BVri8ainIv2OG9q6KBJdjYNShujfbllDCqyLTr1qe
         v3gXl8f0OIpTPj01LttKYQG7IE6NFf0p0bDz9hl44MItWc8a7R1ROid7EQUFfrUPV8y8
         MQo6iRHzj329lEF5fPKIhrI7m5Ryud6f7M9KUbrORnlbqykzVVZsRegtvUT12Yu3ExJs
         HDYA==
X-Forwarded-Encrypted: i=1; AKwUvByvwywaUPjGzOKTu+xpvrs8Pf4uHlbFDIfW+g86OuKI3MHrA4O7wr1nE686wKRrLu+Gg2fZbQ/bSP2LrWg=@vger.kernel.org
X-Gm-Message-State: AFuF++nLbrvYD3aKucY0/FIgAGZMl+7qHrKgxs0gi8r1qZKlLe6y2e+e
	vzbJfKUTZGquVmQOTzWJlqiKhA+yuM4ErGE3IXbWRxcd5T7Y0vv8aL8=
X-Gm-Gg: AYBFou2xEAuPQflur1B5v/2wiVzVsFQz7AKAvFpUH4t4A9pS+p02mm4mAhDQlQZMz9m
	z2UjI8+uqsri7+kEDyxX5TD8imJ2b1Tw59wjDECBGwx1WhDrAnoCxEn2UOukGEG0yLkmnxnA+hI
	afPcJP30GkLGGAwj9lp4kRLWPmmT824Y0j/YoGVaz0NyeqmohpZdXANujIuNg8Mcp5coTpFbYkI
	3MlIFzs+FSbWh7EhoEAHYjEy7GXB+UeSahn0Sjay+RxVAZGy92h4TR1IOnE5Qo0zcRqc21CDyYl
	HVLrjpHPRnDBYjgphlLsS88wvDyeN3I7YtfB/KBTtgh2aikBVBeDKCrHM1iIe/DIfQfn1nrSxW1
	jAWlUCAJ0ytbiIwlB5xomH/N7uH+TFHLn1Mg/ou3QrqkLTHQSXClgFqARvCWiqOc20pKvkpQ3KJ
	wTITgtVERs8+2wchceXEAmBk249NdQyPJyww+txSCb9fkIXpaytLhHn2usivo1ILczDp5PxHUZk
	HI9XZD3yW9YdivLjftx4KLiaj4=
X-Received: by 2002:a17:90b:2f47:b0:39e:2f57:67c7 with SMTP id 98e67ed59e1d1-39e2f5848damr6369344a91.3.1789610140261;
        Wed, 16 Sep 2026 18:55:40 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:b6f9:c198:e14b:34c1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e390c2984sm386968a91.0.2026.09.16.18.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:55:39 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	namhyung@kernel.org,
	zanussi@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com,
	sashiko-bot@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] tracing: Fix 64-bit and signed histogram fields on 32-bit kernels
Date: Thu, 17 Sep 2026 10:55:32 +0900
Message-ID: <20260917015532.103081-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DEFINE_HIST_FIELD_FN() reads a trace event field and widens it to the u64
the histogram uses as a key or a value:

	type *addr = (type *)(event + hist_field->field->offset);

	return (u64)(unsigned long)*addr;

unsigned long is 32 bits on a 32-bit kernel, so the intermediate cast
discards the upper half of a 64-bit field, and widens a signed field by
zero extension from 32 bits rather than sign extension from its own
width. Five of the eight instantiations are wrong there: s64, u64, s32,
s16 and s8.

The cast came in with commit 79e577cbce4c ("tracing: Support string type
key properly"), which also added hist_field_dynstring() and
hist_field_pstring(). Those convert a char * to u64 and do warn without
an unsigned long in between on 32-bit. DEFINE_HIST_FIELD_FN() converts an
integer and never a pointer, so it gains nothing from the cast and only
loses information.

Drop the intermediate cast and let the usual arithmetic conversions widen
*addr according to its own type. unsigned long is 64 bits on LP64, so the
two forms are identical there and 64-bit kernels are unaffected.

Cc: stable@vger.kernel.org
Fixes: 79e577cbce4c ("tracing: Support string type key properly")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260914054614.82A9B1F000FF@smtp.kernel.org/
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Tested under QEMU on v7.3-rc3-82-g238650ef6c7c, four arms: i386 and
x86_64, each unfixed and fixed, defconfig plus FTRACE, HIST_TRIGGERS,
USER_EVENTS and DEVTMPFS.  A user_events record declares one field of
each of the eight types DEFINE_HIST_FIELD_FN() instantiates and
userspace writes known values -- s64 -4294967396, u64 0x123456789abc,
s32/s16/s8 -100, u32 4294967295, u16 65535, u8 255 -- so every
instantiation is exercised by one record with no timing dependence.  The
eight fields are read back both as histogram keys and as summed values.

i386 before, keys and values agreeing:

  { s64v: 4294967196, u64v: 1450744508, s32v: 4294967196 } hitcount: 1
  { u32v: 4294967295, s16v: 4294967196, u16v:      65535 } hitcount: 1
  { s8v: 4294967196, u8v:        255 } hitcount: 1
  { common_pid: 1 } hitcount: 1  s64v: 4294967196  u64v: 1450744508
  { common_pid: 1 } hitcount: 1  s32v: 4294967196  u32v: 4294967295
  { common_pid: 1 } hitcount: 1  s16v: 4294967196  u16v:      65535
  { common_pid: 1 } hitcount: 1  s8v: 4294967196  u8v:        255

i386 after, byte-identical to x86_64 both before and after:

  { s64v: 18446744069414584220, u64v: 20015998343868, s32v: 18446744073709551516 } hitcount: 1
  { u32v: 4294967295, s16v: 18446744073709551516, u16v:      65535 } hitcount: 1
  { s8v: 18446744073709551516, u8v:        255 } hitcount: 1
  { common_pid: 1 } hitcount: 1  s64v: 18446744069414584220  u64v: 20015998343868
  { common_pid: 1 } hitcount: 1  s32v: 18446744073709551516  u32v: 4294967295
  { common_pid: 1 } hitcount: 1  s16v: 18446744073709551516  u16v:      65535
  { common_pid: 1 } hitcount: 1  s8v: 18446744073709551516  u8v:        255

Five of the eight move: s64, u64, s32, s16 and s8.  u32, u16 and u8 are
identical in all four arms.

trace_events_hist.o is byte-identical between the two x86_64 arms and
differs between the two i386 arms.

 kernel/trace/trace_events_hist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 8af97fd4ee2d..9079b81cb7b1 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -466,7 +466,7 @@ static u64 hist_field_unary_minus(struct hist_field *hist_field,
 {									\
 	type *addr = (type *)(event + hist_field->field->offset);	\
 									\
-	return (u64)(unsigned long)*addr;				\
+	return (u64)*addr;						\
 }
 
 DEFINE_HIST_FIELD_FN(s64);
-- 
2.53.0

