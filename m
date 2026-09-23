Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4F1442B1F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149352; cv=none; b=im5cHz/UaMyf8t/Bu2BRsEG/Bi0OU5AH4erBjkqIVJTwuaKediVz8c2vwg5rfjoaG8+PEj8Uzbhqo6C92+4mt1gVWVInwYAYEO91aU/l5tdsLUr3oGfa1hjtytDEIxJOEqzYRtVYclnVeFUNU4ZnZLPuEC5ebwjp3B2+nsXsuAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149352; c=relaxed/simple;
	bh=5Zea+MSuSEydmdxFyN5UC+cOhl6spd4XO36pT/qC/8E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GcIDQxGnIBgnMt0Agcm1+8GYZfky7J2D5t+RD/ASE8TuZ2XaSuPmCmPvQqo4YiWjI8wDkAb3n2XiFLyx9/6pzfcFo1zBwPiUqtv+ZieJe+3VoP1My2HLjaIoE3iaXF13KTykkDaKV9QRoInJYtaxiqo8QMLNum/sQcV4M/dh1SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zw4tABZ9; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zw4tABZ9"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49fcc575709so5467745e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790149345; x=1790754145; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dtLY+YCAN032Sezw8r3fkk6yvb7HL62eMVFXP1TzXo=;
        b=Zw4tABZ93+1LONG4immrYhic5CCv3+Hf7Riu3zLZXmtf+kVViYmZWBXN8M3Vwy56hq
         rBbabvRv0O4phZfwJiUg6aC5ILnSNY+xvt1jQxK5OpCIVk64YuzmAhYI2UVbnZAbPCtA
         FE2LSH8YhRCh2IDK9Xlr3QD+N9X3ksCiEObsq7lxTbvrtqnGk4FeTQTE5J9o3p090FQs
         zfLIYpw0GFb1v54js3Kkxh42q/JessPj73UHPR/wP0SBMvtXJqoZ1D3DLgjKtILE4WOv
         vpR+4c2G9JyBB/4G0L8pAf7bR8Kma5Z7nKKiMYE0DyV14hJgN5ZI/yDtYxM/UojcWRMz
         0f4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149345; x=1790754145;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dtLY+YCAN032Sezw8r3fkk6yvb7HL62eMVFXP1TzXo=;
        b=NaiV1uebfE8vm/LKRGYy6wEvsbayZZSwPim+WTehga0AFxRoiP+z68iC2IAnLrSB4m
         WulirHd+RIn2hQEYxdP+ULUj0TgCR7pms9ObJB1WrQ6hJjykuslaZKmekbin9fE+Ge/d
         UajE2PCu44vX18ZKxSUfeB3JQTXZ0UxpybJJ3YHL5dgCmGT10U9ajCCYjKTkkaoHNPBx
         1+bizCtUGtocmN12VqliY8c2tff1dcgFT7hjJLLW4qRXNoa2vLESCAIosnMp1YzAzag+
         PhP3sHuNypuN6gHppZ036JovXndWgoHeRutM/ZeKQdTFVifWMx0N99CYnCkypCaoVH53
         9wcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUSRC4A99A+47L3VqybAMt6bPrJD1Jl9TuHjjlQc/aU7gG/Y/ZRX9jxiwtL2oXAcamKAwnJvVLq+KKd0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kxIu8if3E9D+Yw4OQ2InjladHq9rhWZOfwuaEL2uu7lEheJZNR
	Dl+G5GO7QqEm3XItL/l9QXfJFU1PLAVPJXb4n27aPa9VJbOO83xangARRoM4DCXy+RlrP4Prmkg
	rFlP91VDy7Fk2DTFfYtzjsA==
X-Received: from wmwb13-n2.prod.google.com ([2002:a05:600d:444d:20b0:49e:715b:eab2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6304:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49fdeffdddcmr19281615e9.9.1790149345174;
 Wed, 23 Sep 2026 00:42:25 -0700 (PDT)
Date: Wed, 23 Sep 2026 08:42:13 +0100
In-Reply-To: <20260923074213.3077182-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923074213.3077182-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923074213.3077182-4-vdonnefort@google.com>
Subject: [PATCH 3/3] tracing: Fix simple_ring_buffer undef check on sparc64
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"

simple_ring_buffer relies on headers that end up including
<asm/thread_info.h>. On sparc64, this emits the undefined symbol
current_thread_info_reg. Allow this symbol.

Fixes: 1211907ac0b5 ("tracing: Generate undef symbols allowlist for simple_ring_buffer")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/5574c9e6-9ed2-4ee6-a2b2-fb6ee81e83a1@roeck-us.net/
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index 0e1846f7dda3..3860bc53a4be 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -146,6 +146,7 @@ KASAN_SANITIZE_undefsyms_base.o := y
 
 UNDEFINED_ALLOWLIST = __asan __gcov __kasan __kcsan __hwasan __sancov __sanitizer __tsan __ubsan __msan \
 		      __aeabi_unwind_cpp __s390_indirect_jump __x86_indirect_thunk simple_ring_buffer \
+		      current_thread_info_reg \
 		      $(shell $(NM) -u $(obj)/undefsyms_base.o 2>/dev/null | awk '$$2 {print $$2}')
 
 quiet_cmd_check_undefined = NM      $<
-- 
2.55.0.1082.g2b9226bbc0-goog

