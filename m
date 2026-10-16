Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDABF3955EC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129124; cv=none; b=UCBdKDPwDGGwatHwb2i/zz59b95ISBEEaG4a85QR41JZliPvD11X4E7x9xQvXCThEM5KDdg+dFsRKQyYaauAzoQ9bZzGMZ6XD7qqYBPd7tkNW9YOtlwBxgWZJMz5Z7cjUo+Uany+o0BnS+W+RLOYDxSuiPKnxWUxYRC2803bwWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129124; c=relaxed/simple;
	bh=XA1td5RtXyr53ECVqINeTSELxJLO5VlbkDz1qkltoms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PW+G3OYS4a0UyhyN770n0tLnEJjUj5d94UHCH60qQH2KmxPcQfA0+18M01i4kiRecCtrj+F0kxCOjyZr6ldTX5J1VFH/1Q9yVHcjDRSnF8mPo4GkS5CrAeduXszhSCS6cvo2iAs0rz6JPd/wYZ9mP+KK8rqJjAjbq8PebQw4Fxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9wC3PV7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9wC3PV7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso32255865e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792129121; x=1792733921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TOIiQ6a4LuFeFNpA463QSfXeTShKxZ66XyKQsJ4fw4s=;
        b=m9wC3PV7XGX8JoHcO6Fb/rSPE/nxKaxOTssgwI0+SvUYKD7tLiN9shqpxg6gSlmA/u
         AQCprENSA10LROwWRnJJQDqrCfO4Yx1LWfzPdFuzTeWN5pnVpVQ+fZ/d7S83RdXDZHXt
         ckdzmxBV9Cfk31+QGQw0TvDSQ34/w8R5Fpr5Y71VrOHJX68L5iNkwcf8n0e07AyWvLoA
         d6Di+htDoFkSUednTuT6w5AM/U/w4EcHpgLhIJ3FdXviHtV82l9TTuXqxjgJQLx6r3TC
         2UDfFin2tMYb2QUKAkGgsv8B9zcex5HfMz5P+QahZIvKNJSvC2O5dz6FzeBp6OuKaH6v
         zkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129121; x=1792733921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TOIiQ6a4LuFeFNpA463QSfXeTShKxZ66XyKQsJ4fw4s=;
        b=ryqbxkl91+5FdCDZ7L6Bob8xEu6iwZXN9MtMourV1OMxGvPwU3bfMXUr1lw7jrvMrR
         uedMrrIBgcMVArkjoUrU1rjgDcHMrn8Au9lrUPbjgZ0Mljyy1/0bbqrTtuCBiJnaRn4l
         gOexT7toNTjWWQuefKMHFeAowgBLykIj91HNHh13DYDR3nttjMvyfaArPpQ+mESUY6Bo
         B1rfAZh6AQdPWeWq3k64/eezbk5YSBWE7SZGJCWhCw3yhyuzsvYPkUcvCde+Aef8WsD2
         G16a9ihomCkATGPQh/LPsYIV3L1nwuuIzIbkQkpIEGj7DhdYyYGcsfE56/erDdGXW7/V
         0fVw==
X-Forwarded-Encrypted: i=1; AKwUvBzeEBhlH4QFqUpuH/lYT+fNTotQ41iYiH8dwN1fp1cWadn2578z9V2ZuQlxKawmeKbVVGkPUBUDUcsbPNs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEJkWUdUldvisUCG/c2yT2t7KQXtm+UMvMILLMwPoODtTmMVaO
	lB3s1AKDRv5eU0e1fowhP3Xx5vMwWhX/nkCme30HWaj7Kgb59VWm1YlV
X-Gm-Gg: AYBFou08Od1QUHqNCVbs/X0mSV99d00X0qn1ost6Fb+2xWYyt+du0pDXNqqJmCcsTdK
	q0jp3nUx591Gn+0MjBq7l+AgzK9fy8umcmcIYUL2+rB8yg3M8G4bybV7v6dlqnzo9MZZiYQNKLp
	hLQbUdzgPXdr8RyUzt/A6DL2nAL8TbdJemhdSlSmqHJE7/HHzq2C919SDF3iwt9Ng2t7ArLt8ZE
	DoQv9QEF0yHI39wvA5UoCkjAgWI5qVAofoA7oEkKlQGvWrVtVCx6u8H7ChsDXl5lDCdwWe3bCI2
	/PC2CVFJ/RTffuCanGGizqAGLUh8LlsoIACFVjSH/M33uNy/o2ZxkbCx74KGVMpZDRWiBOM6yJ5
	Dlm5T68oNG2Y+YYFrLgnbPB5xVgPXiGmxdvxaBKrCSJ4c3ozUzYNKSJZvbV80oNUHhgbiFMWcqC
	YSV9DiJ5gLMpC3RUObY+O46KuC0qw5tIGPgn4LojxisR++oXwU02Hkp6H3UYY8IY3W98FBhyQ0P
	hwTM5R6oo6TRHvzIOLegGqox/n8jmObifW1aLdvhyHDB3U+86L33eptmac=
X-Received: by 2002:a05:600c:8b70:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a18e4a01acmr452496145e9.9.1792129120743;
        Thu, 15 Oct 2026 22:38:40 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c10fe9d3sm98463075e9.13.2026.10.15.22.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:38:38 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] tracing: Hold trace_types_lock when updating modules in persistent instances
Date: Fri, 16 Oct 2026 06:38:35 +0100
Message-ID: <20261016053835.204353-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

trace_module_record() walks ftrace_trace_arrays from the module notifier
without trace_types_lock. A concurrent rmdir of an instance removes it
from the list and frees it under that lock, so a module load or unload
can walk into a freed trace_array. The notifier also reads and updates
tr->scratch and tr->module_delta while update_last_data() may be
resetting them.

Fixes: 5f3719f697c3 ("tracing: Update modules to persistent instances when loaded")
Cc: stable@vger.kernel.org
---
 kernel/trace/trace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index e4a490d3d08c..d3ffbed9c44b 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -9247,6 +9247,8 @@ static void trace_module_record(struct module *mod, bool add)
 	struct trace_array *tr;
 	unsigned long flags;
 
+	guard(mutex)(&trace_types_lock);
+
 	list_for_each_entry(tr, &ftrace_trace_arrays, list) {
 		flags = tr->flags & (TRACE_ARRAY_FL_BOOT | TRACE_ARRAY_FL_LAST_BOOT);
 		/* Update any persistent trace array that has already been started */
-- 
2.55.0

