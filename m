Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9219D3CCA19
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 13:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788701647; cv=none; b=otvnZznX+Eg+xkUoNPir3ln9Nzp50QmqYMZBQ+3uhA5ziDa98vsIFXEmDLBqL+zIdn7zUxaqpeT0wLR5mh1oDvlldLzjpI+RRIGjLKz6rhSJOm6ZFf9SsOlzr2Z5jrOuyfVwjAJwLofMMLVB/XLFmHiw7ftlg9gJT+e+TRE5u7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788701647; c=relaxed/simple;
	bh=OmrnDvEUGlBTtRmQLeMuelKWG/ZFqM9c+ArC6f2Q3Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O/jRRDH2SqBHnN52ALhQOyb+Kk8HBwCI/kAq7lBwNtvE2DVu2RgaEKH8CdOpq0O17sAqS2XWZm5/VJBxCrGdW9yf5Q/HXywCwcrD+AWDV9viGEAWdn6NTDUMfP2ziRptcCdiiiYXVLZjy7jMSIxrjikNUFsF/P9nRbRo2e7y+eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIopU0sX; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIopU0sX"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1c7364550so2881388a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 06:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788701640; x=1789306440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fa5UOAWLkyriWvd9QAh8ho2PSU5MrwWqtM+f95UnuKM=;
        b=hIopU0sXNy2NO5d/Rgrpj6GqD5nkrSMyXk40GCa7M9Lqj0CTaVRmGu5Jq+lX6ppZPn
         I5FmsLPSY9Gq4XRIRCBB8GgcJKsHOWmecaSVhKcwy3WCXCl7oycqv0pRZesxI7WbG0cW
         r9RppUtFghEUBf6boxvGLZzupqKxJVerWMnXWyTNC55e6b8Sh6xGfvhj9dHRudDuWTHR
         VS7Hm9ksXB058pIDL6L+rsQyvjpQZw7ZXZBvNKR6tea/JsnwteIS+q1u5xv5cZ6vX6pB
         nFAdqzDaoGrwQzxespGOmMUfwJAxOuXhVWAIdKfRR9pyViHls3wSd+Y0bDU82t12qUJS
         VyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788701640; x=1789306440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fa5UOAWLkyriWvd9QAh8ho2PSU5MrwWqtM+f95UnuKM=;
        b=Mf1lJdBiL289N9x3BfJ1qWcVclMsH6Hg7O0FZ6vzeMV4KmmbPOX9CdbKTDbnKVZiuT
         E6zpOnxCdJG6Tyskc+m/X5ROeyfeFkGp5l0GGKUVBFWXYVToADNvsr1cbVQZJ2aaHsQT
         oKoatNc18NoRN0fq2L/J3QiPJ/1q+9gGfXq7MaNddVdt9CLqqXP/LQDEGBDIBZgw/rds
         4OzQck3BQSSl3NCrfNstmaNpftQ9v809mQnSSVzHtf2XJTDYlGZJEyFf8Dk3wzGbQZ7O
         kS6WgOXF0Hx0+V999C4a8henAS2X0s2YYsQpbLYrOY4m8vrwiej1hy9DditX7fProhjD
         pvDg==
X-Forwarded-Encrypted: i=1; AKwUvBwoPhwmGV+Ih0Q7gEtKMuqTEtAqc14C8z54KvIHH7j9nJQIpApaEuP/GaFLbgTnX5vjeK0hpYhmMP1yC+s=@vger.kernel.org
X-Gm-Message-State: AFuF++npL8LywOF13WEYkCgH2XrzaWpH0oCxLBKe3klo7Z+vK/AL8zz4
	4sspwXMnPs1mwg7icmkN2YzbNuIoA3SWLyLjSoXSMWOlp5Czmzmazz0=
X-Gm-Gg: AYBFou05WHGPWYH7V8gGWWzegrZ2UJbObFeGzyhQ59FTQ8OrBgOJ8VJ63bh5NXnubGf
	yrhugDG4SUAxwIkjZX3F9Kt4zDGpwHIxydQgaOLmhMk7sHxQsJLhZU3zzWVmhSXAJybxFO9Ck0V
	Bnp6e45rWfxJ5vAtGRkeb5WMjXixewhcvAqeyeSFf+Eu4f52OWCho3UAx2KK3kYOEmkj9H3l+Vh
	Ns9CBEfXFfhid/mGfLF3me2QEoAjSqXQyAxWXyvLK3y77K/0upwCYAZxkAB+6N81yuEk3WA1zXq
	vHJgRFDOkvbm/xm/JhyNxZpqWjg5o5zGQP0y24roayrqEEYbJXHOMaWMFKhs1ojj4KNF8i4ktEY
	Dcaj7aIdIqpCVhrZcBbMnXWcfHlmnGN81apEMw1mPFkiMr3X4fIaCLqQbhDYGDZY0yGMg0fL5WN
	5CBrErVCY2x+wH+d83b53XDEYaO3romb/PhFxpfac7W+FGLFQJUw852O3ihrfsBQiW9UIifJdmY
	Vep3RaP2/4mYrsU
X-Received: by 2002:a17:90b:4a49:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39b26100cd2mr25616356a91.2.1788701639546;
        Sun, 06 Sep 2026 06:33:59 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:2b14:fe4a:ab17:f236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm21427552a91.13.2026.09.06.06.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 06:33:59 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH] tracing: hist: free the var ref when its initialization fails
Date: Sun,  6 Sep 2026 22:33:52 +0900
Message-ID: <20260906133352.3815019-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

create_var_ref() allocates a VAR_REF hist_field and then calls
init_var_ref() to fill it in. When that fails the field is leaked.

commit 656fe2ba85e8 ("tracing: Use hist trigger's var_ref array to destroy
var_refs") made destroy_hist_field() return early for
HIST_FIELD_FL_VAR_REF, since var refs are freed by walking the trigger's
var_refs[] array instead. create_var_ref() adds the field to that array
only after init_var_ref() has succeeded, so on this path the field is in
neither place and nothing frees it. The call was correct when it was
written, before var refs were taken out of destroy_hist_field().

init_var_ref() cannot free it either. The caller owns the field, so
init_var_ref() undoes only its own string allocations and leaves the
field alone. Freeing it there would leave create_var_ref() passing freed
memory to destroy_hist_field(), which reads its flags.

Call __destroy_hist_field(), which frees the field without consulting
the flag.

Fixes: 656fe2ba85e8 ("tracing: Use hist trigger's var_ref array to destroy var_refs")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Found by the Sashiko bot while reviewing an unrelated hist trigger patch:
https://lore.kernel.org/linux-trace-kernel/20260906124025.3550596-1-donggeunyoo.kernel@gmail.com/

That patch and this one are independent; this applies with or without it.

init_var_ref() only fails when kstrdup() returns NULL, so to reproduce it I
built a kernel with its last allocation forced to fail, leaving everything
else stock, and installed

  hist:keys=next_pid:delta=common_timestamp-$start

200 times against a sched_waking trigger defining $start. All 200 installs
fail, as intended; the question is what each failure leaves behind. With
CONFIG_DEBUG_KMEMLEAK:

  before  200 unreferenced objects, 38400 bytes
  after     0 unreferenced objects,     0 bytes

38400 is 200 * 192, one struct hist_field per failed call, which also
confirms the strings are not leaked: init_var_ref() frees those itself.
kmemleak points at the allocation in create_hist_field() reached from
create_var_ref().

checkpatch --strict is clean and an x86_64 W=1 build of the file adds no
warnings.

 kernel/trace/trace_events_hist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 963e0d6b61fd..34831a01bb9b 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -2234,7 +2234,7 @@ static struct hist_field *create_var_ref(struct hist_trigger_data *hist_data,
 	ref_field = create_hist_field(var_field->hist_data, NULL, flags, NULL);
 	if (ref_field) {
 		if (init_var_ref(ref_field, var_field, system, event_name)) {
-			destroy_hist_field(ref_field, 0);
+			__destroy_hist_field(ref_field);
 			return NULL;
 		}
 

base-commit: 1fc5a74b108fc90951890ec513ac81869f5eaff1
-- 
2.53.0

