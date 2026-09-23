Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B01C4562B1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149350; cv=none; b=elyhSb+RP0Sf31HQVobcy9g++Yjoi3quyUWiuSAw/FHWo8EcG8kkpDvAKgBCe/lvfk/q1erEX6unMdE07hKBxeOqGz8GZ3oeKsTIxYQCZw4pg2YKJkcSPEZ//F03ZQL3D0k9dYUgVj5VVxRtMuPJYkekadYTEfIp/eUNHC4l4wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149350; c=relaxed/simple;
	bh=wCib6KE4dngNiDuCwF4sJCSEDWwsjhpFRS/au6SmFBs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sy2j8VbTTcyBCOrgKcALAcuBEuxlPBtDMck1/L0LSaTC5zbMnCm4UnCslvk+qQ1Bp8OzSAP7QmgdAQ1XIR1jrRPv2IUnKnTEzfkyPEOMhYxGJwIYUNbfaLzs/SvzpUPCxTM+GjVnZzSaxmG0tbe0SHkgCPMBlZs2Y7+Bjf978Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aj5u/BT/; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aj5u/BT/"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49b0e6638e3so4343145e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790149343; x=1790754143; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgukdaogGpd1Caq0HK3UN84DQotWk3nLZ54dv12cOPM=;
        b=aj5u/BT/u4ZDEtewW3HV2foVDvv1c//1FNvloHRj7WvDU1INJL+g7DDbPsZxQEJrfs
         GmbLlmD/d/4rg+sp3QOiBaXU9cgvOJWAAVHSsabP0CRwMqoPE5+LZZFf7ZRa0j3jC0+w
         0eIfl8yuNqSBiBVo9EwqCOZ5OWEZ4nyPsxugG8ZI96KNWmNX//9nAfHFHxAJcBl+e1b5
         vmD6hmHdf/kIZcd4iOZxE9pwUSSaGftHhExU8Vkyfbh5dQwkjEpCDff1AGUIMwNjmN3p
         DSgYfNHrkaPfbH+sjkiV3b5RUthq4halPRYJ101Pd0B7ej0cUFPD74zajVXHqxK9YFRO
         6mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149343; x=1790754143;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgukdaogGpd1Caq0HK3UN84DQotWk3nLZ54dv12cOPM=;
        b=wkyW4rzQsoL1k5ud+0G3tEp770R0IN+PYo7CWe2QTw1z/aqQO74Z5qN6C5kqb+3COf
         fRT20Xrs3XrIUFNmMiSE3wSIm22nuEsJmZCGr3k51i2twZMvw7pqcZPGmC9Fw2Fhxa0j
         7wQVz+iu1IVLmloe87eAMpqQyfnGqzX+c5YEIad/byMPJSFLHDVbUj6HQTPKDh6u6M46
         a1OlzxBVg/EYBMGQJQfWP4S8N/tr+V3f770zzhPlfUWtz6pBAlA9msBUPpFSI3qU9kO7
         Oa+2nf/9jsS5VPDwZYj9rMCUxz2fh1BdFiKvJ6ty5esvkQ5xkJyhDo3OAMzjca8pRbxT
         dmVA==
X-Forwarded-Encrypted: i=1; AKwUvBwONfCjPrjQQS2vqiH/S9HGIkIlGpr9s6Aiw1bHXVeqvM0bCcSZGkP3DJlAnzyr84ooYhizqNy9Zr6aNls=@vger.kernel.org
X-Gm-Message-State: AFuF++kPV+UKkit/xYWqOzhN9jKCmY17us7lz6LdOPrkl8JW0CuqyLKv
	rD/C87ohXnPO5330VRNWryLoPTahUu/OuJy2GyUMSZfCAKL/ABe8SAEcbNfFZdM+3ZwxEmhvXvn
	Yig5d03zNSv8/iTzoUnRDYw==
X-Received: from wmbjr15.prod.google.com ([2002:a05:600c:560f:b0:49e:73c6:38ad])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1553:b0:49e:81a7:9fbc with SMTP id 5b1f17b1804b1-49fdf13a117mr17551095e9.24.1790149342977;
 Wed, 23 Sep 2026 00:42:22 -0700 (PDT)
Date: Wed, 23 Sep 2026 08:42:11 +0100
In-Reply-To: <20260923074213.3077182-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923074213.3077182-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923074213.3077182-2-vdonnefort@google.com>
Subject: [PATCH 1/3] tracing: Fix empty symbol names in simple_ring_buffer
 undef check
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"

Sparc64 emits empty symmbol names. Skips them when establishing the
allowlist and when extracing undefined symbols.

Fixes: 1211907ac0b5 ("tracing: Generate undef symbols allowlist for simple_ring_buffer")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/5574c9e6-9ed2-4ee6-a2b2-fb6ee81e83a1@roeck-us.net/
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index f934ff586bd4..0e1846f7dda3 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -146,11 +146,11 @@ KASAN_SANITIZE_undefsyms_base.o := y
 
 UNDEFINED_ALLOWLIST = __asan __gcov __kasan __kcsan __hwasan __sancov __sanitizer __tsan __ubsan __msan \
 		      __aeabi_unwind_cpp __s390_indirect_jump __x86_indirect_thunk simple_ring_buffer \
-		      $(shell $(NM) -u $(obj)/undefsyms_base.o 2>/dev/null | awk '{print $$2}')
+		      $(shell $(NM) -u $(obj)/undefsyms_base.o 2>/dev/null | awk '$$2 {print $$2}')
 
 quiet_cmd_check_undefined = NM      $<
       cmd_check_undefined = \
-          undefsyms=$$($(NM) -u $< | grep -v $(addprefix -e , $(UNDEFINED_ALLOWLIST)) || true); \
+          undefsyms=$$($(NM) -u $< | awk '$$2 {print $$2}' | grep -v $(addprefix -e , $(UNDEFINED_ALLOWLIST)) || true); \
           if [ -n "$$undefsyms" ]; then \
               echo "Unexpected symbols in $<:" >&2; \
               echo "$$undefsyms" >&2; \
-- 
2.55.0.1082.g2b9226bbc0-goog

