Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFE245517C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149355; cv=none; b=E4mQI2kNLW/yMJADdYKuLI6XxYhnPV8SOofgPqOjsGOL4+XMClpI4gKzDfDV67r1/Spx8ufCT0DuJ2qq7PXk8WQWdQhtEUXrO4dkzB6DHIF3nIQK88BdoeDgwXtJ4ZVTdNN4sbcOV2Jm/gQTX9P9FZiIUoDPXfPeEYJod4c3gAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149355; c=relaxed/simple;
	bh=WpFODar40DMohqmlS0gOpdR8Hzf1EpMWE9H8MvsGOhs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E8TE/NPwue8e21Tz81qFIf1Cv2SF/8YSnlU3Ou2NglqD0hxlPFWepY3gAOtV+JXDNOd0/hV5zy+6jOoET84jlDiSdpQ3LsELb+EK/AWLOog0dxkNHNLp7gp0zM+FS/s+qA79WWEVtTnhWEB7SZgBIsCjB1JOy9Xh3AA4HANKz9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I8QA/Siv; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I8QA/Siv"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a9bb406f0cso634432a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790149345; x=1790754145; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n01qPftWqsYu6YQIAam2h/k+qUdj2gjru4thEeyqswQ=;
        b=I8QA/SivOt6V5sxaB/eG5MBDP6ycYnRuFiroAOpX35cmwpUsYhFOzOLCNvu9vsBT9E
         28492XopM/C9uFZ7V2CkBq5ytujIBs0udnY96dHAz7T3jnoHYpxXeI2vwiuyaCPYotOW
         kGLE3JukIvW5CNvouV66nz55hhk2ETn3MrtXhwBjVBGprMktUwAqXHh9+4imzhOV/ImL
         rlXRh3d6kYxDe205kAdgmHuVG6o5Rr6V+n7Z8Kv54/IkEp609oQwu99GeWg8YgQgZeTk
         I9TtpWu4c3E07AJZs3o9V7YMXgYELrXloc39l8WGUcca2uRs+CdQbzwO7ax5puu9g5i/
         VmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149345; x=1790754145;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n01qPftWqsYu6YQIAam2h/k+qUdj2gjru4thEeyqswQ=;
        b=k20F8QjYMs9NtFSAN8s1+P+CoknJTI44ps47DmCjpttaooQbHObOSt164wsCSma0d7
         9HX1QnAGrud5tiCArTYxO4YOqRp5fQNOKAVZgFpSWwBVKsDHEAaVJ8HZLm//daQWo8nJ
         dChQEjF7ZM/f5kLhTnso9XXHJjnsCXQmrTwyr70lZ+s9aK13tBHxR/6wSQ2NqvgvslS4
         VsjG65PAhYGd+xXyIhFqyYPvs0oav2JuGKEq1NlPCaRF+ZJALzJagvcvU73933yMw349
         lKN1O3s34+ZVtGoVbcLAm9d5XY8fHtpQ9W3bU61nWhshsUvOLKH9psshZFUOmed1xfJm
         L1+w==
X-Forwarded-Encrypted: i=1; AKwUvBwEVXWbBWBQqVK/xDHfa0yWGiYnlvdxKWX2wUIUqvYBKjMX+t4S4PWXIw1ScqkYRDzYyWtVHO2LSxHpXZU=@vger.kernel.org
X-Gm-Message-State: AFuF++kyauLbEtTITtiEZgqR0BdA0edHvRdtbc0/8JUCGmfmmDfgB7XS
	JBym7c/1Y2rcrmpxoTNvhAIaihdEMusQpkSVy77Lssue+WZ2yymH7Ji1e0JCzl7G4W47jd4YwZr
	fCoK0rZI9U+ZDnBL+w3CYVQ==
X-Received: from edbbm14.prod.google.com ([2002:a05:6402:b0e:b0:6a7:e8d7:a57b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5d6:b0:6aa:9274:b555 with SMTP id 4fb4d7f45d1cf-6aab3b66e94mr1403176a12.31.1790149344211;
 Wed, 23 Sep 2026 00:42:24 -0700 (PDT)
Date: Wed, 23 Sep 2026 08:42:12 +0100
In-Reply-To: <20260923074213.3077182-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923074213.3077182-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923074213.3077182-3-vdonnefort@google.com>
Subject: [PATCH 2/3] tracing: Fix simple_ring_buffer undef check on parisc
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"

simple_ring_buffer uses local_set() and cmpxchg() on unsigned long. Add
them to undefsyms_base.c to extend the allowlist for the parisc
architecture.

Fixes: 1211907ac0b5 ("tracing: Generate undef symbols allowlist for simple_ring_buffer")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/5574c9e6-9ed2-4ee6-a2b2-fb6ee81e83a1@roeck-us.net/
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/undefsyms_base.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/undefsyms_base.c b/kernel/trace/undefsyms_base.c
index e65baf58e6ff..37310baf706b 100644
--- a/kernel/trace/undefsyms_base.c
+++ b/kernel/trace/undefsyms_base.c
@@ -9,6 +9,7 @@
 
 #include <linux/atomic.h>
 #include <linux/string.h>
+#include <asm/local.h>
 #include <asm/page.h>
 
 void undefsyms_base(void *p, int n);
@@ -18,11 +19,13 @@ static char page[PAGE_SIZE] __aligned(PAGE_SIZE);
 void undefsyms_base(void *p, int n)
 {
 	char buffer[256] = { 0 };
-
 	u32 u = 0;
+
 	memset((char * volatile)page, 8, PAGE_SIZE);
 	memset((char * volatile)buffer, 8, sizeof(buffer));
 	memcpy((void * volatile)p, buffer, sizeof(buffer));
 	cmpxchg((u32 * volatile)&u, 0, 8);
+	cmpxchg((unsigned long *)p, 0, 8);
+	local_set((local_t *)p, 8);
 	WARN_ON(n == 0xdeadbeef);
 }
-- 
2.55.0.1082.g2b9226bbc0-goog

