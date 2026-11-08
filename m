Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117920;
	b=ZcrXQzCMJn2TBROkoKTkYxqub/5eDm934ISeHHfCsz3eg6LJQaGXXho8lsFksAr6IDvG
	 HAXjnPCFtrBp4ugNMe/lE8vP/fEmIXJgMIl+my3NNg7/d6kJiB7Ts62nujtC7KwQ/Cgj0
	 EeJsWXJYmtHAT10qGOHaRpPjt05tNpHTT1togMqta59x11Ll5ExTPz5RxX6I31NlR+khx
	 EwX5XKaWTcXyKVA12Q7qQ+MkNLSn6MSzimOsBNcX1Gmj6+b7I/PKufUZN9PSicljxLvKA
	 /+1ooMXKGYwFsFYJz6EuQFMlDFHuF2Hjg/bZjmEwo9yhv/oeSa4mO6xltlURE3F05GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6lprU6Db7+ksq8wir9YKQMNUuhRExSoqjwLJdiuYXBY=;
	b=eE5vW+rpAZ/GVUq8ZmV+L5HyXH9MGqFoAdRVWSwvPG9kOK9upOtgzGEPbrsez7lzOzoV
	 Mvj2bqG41g+q5LjEUqdj9WMJkQgiyTVqaypRF+ijf1620xbhV+l9XyHDRAcbnbaDmJbh3
	 z3c8Pz/7P5SS9na9AxOWALoSTCmV8XnMSQjRSjklXRGEGrBugMydu+6amRAT+8fvE6LL+
	 xG3nhPJkMzcjS6XxNGVl3Svdo6kZiscD2/nfIZxh+ojlLLDKqJpbhI1AHQS961EWZoCCZ
	 QsijxrfEc4EJ9L4r39ku562ogMyphhIYLTy9SttivDUIH+TTQVoS/ahlJnbAGVlfsLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BA8iIj4I;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10F1606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 06:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BA8iIj4I
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so697520eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 22:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794117919; x=1794722719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lprU6Db7+ksq8wir9YKQMNUuhRExSoqjwLJdiuYXBY=;
        b=BA8iIj4IIhdQsBZndTQLjWYMVt2NMz9TQThvL2ZyzMTuV2NkUXY3pFgRB+PKPXoqa+
         cdD88dfdVQbZ1EnQbE4S/7tBct39DYHJg8BncSsKPp+/VG3w7/hodNhFV3YGrSPrxA8t
         FPv5yOPrvh9ogC+47zI17QMx0rKfo2yEtHy4s+K/OIjwPyS9O+sxZQ+hYiW7/ucVt/9e
         k01OKWony0xOL6uC6K7p7poOrfvbA9pd4BOHOiFwP28jfKI9PkvVxuHvZO2pEB/KDI9F
         fMFYGCevY6T2zAu6SPQDjhhFEtihtvRKQ9FBrlZ7b/Ze12n+YZhjlkINEIu2bqEvEUjV
         Y7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117919; x=1794722719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6lprU6Db7+ksq8wir9YKQMNUuhRExSoqjwLJdiuYXBY=;
        b=AfGMlGHevucREAGY0nJk2DBUSsYgmG/eM68muU6XFPFD5dxNEzaP4EbSVWSBKE3TC8
         IFUw7Dw8n3qsYXXY5nbnkB2zVHJ5Z4+LDwLWqpAwO80EeDUqFznUOherPsiTxHB68jHF
         W6CiwKHVDEoJpgvgAEobx9KLUrg1+RwvMSChdzNqYrmoqYgcV4DKCPyD5oIa2IpnC9YG
         cGo6lrzW5JPR5v5cUozqw4YsCPpjZMxUYA9pt7zrKv6xZti/Y6Y07x5mERp5eWH7bQf0
         EM7KyuIgPpoAPEfgQphODyjdaEJLl/J+gyG0TC4V66gHRkgvW7pXFyGpPAyVVJztD00q
         7fgA==
X-Forwarded-Encrypted: i=1; AL+hErH4PHFHOfS8Umla529sTm7GILYqCijfjtkzqjh8SOwrkSPBsvyHfQTB2LjqIvJ+xA6u9/b3s19gQZ1HaFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dIUuSaRmq8j3/k19XgKkccd+1hNwgbN6I+TFCV9vagfu09W9F
	AQB2WsEtl5KjHgaffrXp2uAaneLgqzOXXwf9QTSeqrbRrCxOqY/U4CvXtMAEJF06XUo=
X-Gm-Gg: AYBFou1XRPiyOtnjNI0n2iYy6eB0oxyBIgnd/lN0e35m4echHzWMS49EK3h+8kxH/fb
	oMEpPN+e4mQMbW4G+WE1eKkF3oaunlqNuVbicC2shRe4CkepXfUpGCOHpG4KuD+ljgOiaccLUT4
	j9W7viYfG298Qt68sglLuXCiRFqDkBTGVyb3RlIA2tg28sLLNK6WrnjnJzYeq/0wgIP2ylo/AL/
	ZvgCDAs6r3VZZIhsVp929c06OFT9nCy9uvCpC2fMeDFecNPl6e/eHnm1Vq59eBgZwc5QIBvbbmA
	2F8rbtFj5t92MbBFOEo0/tanBPFbsbKUL6YOa9103RA68v0vyMPyVoMxnJRsmkE2p+NG1WvB0N9
	7yhU2YV93UiGSsZ6TGcwif6P6dm5+dxFapMv71FqHRUNy92RLhBSpXOBP74JvRhlfqAfEgc3fLM
	s8Q2jVsseJQk31uAbnEAay2HhbdM+xJQUnoPnXJBeOUlO8JNhQD5S3Hqu4lM2ugdjRlyXetM5JM
	RAm4n5d8cz+YfQK++OoMD8XfI3foqIP/hTRNXAGNqiSYNb02o6Wj0yiVSQ0V94XPqo/Uy6eDSYC
	TwndpzXPciUSTxDxbOKY5JrPB9JGCjMrcmr6dgIUIlc5usxU06D/D00Phlcd71g+wI5n2NienGG
	WTyAW3QUqotT9G/mkQptExREf4w==
X-Received: by 2002:a05:7300:fe09:b0:36d:4570:a32d with SMTP id 5a478bee46e88-37252e3a97dmr1835412eec.2.1794117918967;
        Sat, 07 Nov 2026 22:05:18 -0800 (PST)
Received: from localhost.localdomain ([2406:b400:d4:acc8:a024:59b8:c312:eefd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372665db733sm2646694eec.23.2026.11.07.22.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 22:05:17 -0800 (PST)
From: Torra Sowmya <sowmyatorra@gmail.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	rostedt@goodmis.org,
	julianbraha@gmail.com,
	julia.lawall@inria.fr
Subject: [PATCH v3] drm/xe: Remove unused xe_vm_restart tracepoint
Date: Sun,  8 Nov 2026 11:34:18 +0530
Message-ID: <20261108060418.4554-1-sowmyatorra@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101125808.9770-1-sowmyatorra@gmail.com>
References: <20261101125808.9770-1-sowmyatorra@gmail.com>
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

Commit f3e9b1f43458 ("drm/xe: Remove async worker and rework sync
binds") removed the call to trace_xe_vm_restart(), but left the
event definition behind.

Remove the unused definition from xe_trace_bo.h to avoid generating
code and data for an event that has no callers.

With the tested x86-64 configuration, size reports a reduction of
436 bytes in xe_trace_bo.o, from 20262 to 19826 bytes: 140 bytes
in text and 296 bytes in data.

Fixes: f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")
Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>
---
Changes in v3:
- Add the Fixes tag.

Changes in v2:
- Document the measured object-size reduction.

 drivers/gpu/drm/xe/xe_trace_bo.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 86323cf3be2c..fa91dd2b2174 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -228,11 +228,6 @@ DEFINE_EVENT(xe_vm, xe_vm_cpu_bind,
 	     TP_ARGS(vm)
 );
 
-DEFINE_EVENT(xe_vm, xe_vm_restart,
-	     TP_PROTO(struct xe_vm *vm),
-	     TP_ARGS(vm)
-);
-
 DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_enter,
 	     TP_PROTO(struct xe_vm *vm),
 	     TP_ARGS(vm)
-- 
2.47.3

