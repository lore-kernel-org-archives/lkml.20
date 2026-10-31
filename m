Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793481899;
	b=IKZ8Qy9K+oD8kqpFkHdQmO+f6EOmXnfQAGOc5Yi90JTHh4epcGaKlzjRoCTgZCaaEKfd
	 ROi1MOxBkJOK5nSnz9yIfbR8CbBGqSPnr4MPQ0YQ8a/RviJnbLfKASSWnwEQTEGmcACve
	 bsGfZynNuIX0O41fqEGGc/bPum9jlogIGg36YEAgpWJMe/9rX8SImAP6pD/+XZ4cquLmq
	 sKx45yYItwfs/90a6UmNZbx1UB1DM7IoJxZw037PWg4mkWKiBZk9TVwVfFPqvHrCXZwV9
	 HXxma/Fy1kAuWYolCAqOArZHfDw0D6D/b1q+dBetmeH/yz2j6tnje/ZwfODxnVETIGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793481899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1Vk1hJfR0u61Fe9qHt5Nn3FgFhmPztbFsxazzVHlKZY=;
	b=OUu00qGDnpYjH3oA5d/V03x98cU2cfeJS07uIG0aN2e2AN2p3nh9Qr4pmBoDxiS1Qhc1
	 5JDa101G+7SYhfAbSrr0UGYV8rYPgGRv928cjZ8KqkEFCH2+jzARqj1dxUzkdFwR5j7lL
	 OqDOPARPuUN4BvMr4KXwR/5gDVgHB2dh6QqncKYvm0d/KJqMsu6W51dBn9+enitt8Esza
	 bBuNDskmAOIYrHJLRO3bifRMhH3OJaJNPFc4Q2DYRPWoA0o8DkX50bB7gEXMBJQb/ULFb
	 gmG5BcGSIwdJ3/ZNVBdGChV6HGhnudEEYIVuix+cGYr7KvN6AdUjky7XjgjB+fDD5DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fRulVzh3;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55B8606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E55B8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fRulVzh3
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so913628f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793481897; x=1794086697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Vk1hJfR0u61Fe9qHt5Nn3FgFhmPztbFsxazzVHlKZY=;
        b=fRulVzh31Bhqv4/NY0qSOKuAao7KoNFrPQExsVBxY7qusbFaVTWyHO4RWrHIdAtg07
         vFUPO5eJXntEXjdfR1QLkzpfOsUJKagNOTK8XkC/c0eOnia4NkMKvJI/Nk3VrVFoxsOh
         i3oPWiPPU2rtDbWV4kOkc6izndYKP4KXuDEkGhXYsoeRWL/kH2x1YXIiD+1hnaPPH9HG
         9EzMsLOiHjBNpJGxgjQQzJ7ekqcK37vxtBU4edxk2DSn5o2ErNIoJFaP/+AoToO0aF3U
         MxjsXR6/F34luSr3gv8m2/9Ro5kDnFDCdNXHMzKkM8aUGzvbYkTbhDMjdSXCvtxNlOXL
         N7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793481897; x=1794086697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Vk1hJfR0u61Fe9qHt5Nn3FgFhmPztbFsxazzVHlKZY=;
        b=LnYkCqOyWnCWohvZHnDyHIAjsd6q3MkFc8nu1b+iII4w53PybfePhhcJxLayAHvWjT
         hMjBMKGcxtgSfQcbqrtbCTDlan3qn8RnKUTBvXdszBLgwLylcI3kTqDADVIInsm1pFM0
         eEOuhTA/A1i5m0SeLRvUuTHiDG2K9bSPdtZWjcHQx/L3AIwx4q7vEQjs7Gg8YMhA+A/j
         aQLt/601127KiMlwQPBhb9yR8XJLoZLJ7HhBfNM11tPfEiRU+Aqj+Hk2YeMFI+o886AC
         R0S5mBs0RqNpom4znYxduyoyTSNMFOa6DvcHqBf/hkdTb+ntQNOx0wQ9iL/uAPTBSnHM
         NcKw==
X-Forwarded-Encrypted: i=1; AKwUvByrzcOX22ffGpIFRr/k7k0RKHGgw422O5lpWSBVT3lKe0m+ohHulcbYDiOVOoRv9BMDIe6tGY/YwrrHsU4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQkI2Bn6uWvv2lO1n1wOC+LFwfrNx4pCNgZqevZGNSDAsLoLoD
	Jj+WNrX3g+WoOM3IkMFfUBPV/W5wAKCO52ADId5+kzsNDWUKnOAxBtPD
X-Gm-Gg: AYBFou3LMRQi6V4BWSDNPR7L0LYX2KYL9cvPfX1it6hPI26CG4Hrg1pCPIQs1RKIV57
	5+3ky6TAe5Awtv2mxhb4GRnqq/pLTd656mqpedjQnfx8VxDb0BZ3AgXk621JnqQu6ELOLU3PArO
	j/xMWTlrNaXJZ44lF4vgz4wdbiINGpZVPyu43416RNDuyH5stw3FuPhdDilrqJP/59IGCl+qlIO
	jlqxkp+AlxKDccEbsKMnBWlq94oOX1bOT8vcibytIaP/q0f1JjxrCOS4oZF0jSegYDLdIal/bwL
	NC4W/+XETuRMbnOBxHc6IebPiLu+XS3bUu2cAPoXha2fe2iyhPKzcFjIunp+v74of4ufZI/5FCl
	3/MO0D3xtwrU4WYfqAYATeskRqyFjCx2D4mX+3Hn9uTxuoPB2vipHke1xSLeCQCIl0hgEKR/wQ2
	B0XmHnLYcr8XUr8WrW2B5rfLe6C+ncRAyoVi5ATxq3dImFqsq/WrzA/VpY4xhUm/X44Kt+EgxUX
	+8da/PiMMm7y9yzyvCndmloBx5UkXVqJwYaoidJzgD4ksL8CW2n7qxskjFyjXD23sMNhiNyEvBm
	rTi3s5GkEwm3w+sH8wHVU7pVq5SSCLE3B2AnkJtGoLb5fjab2fYmrnmFdYwTtgDn0kyHQ0fX+7u
	3z7t67B1f92d2bxHjvAJ7+7UgkX/36MDBKO8=
X-Received: by 2002:a5d:4982:0:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-48e6e307204mr9624281f8f.43.1793481897073;
        Sat, 31 Oct 2026 14:24:57 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm10204530f8f.36.2026.10.31.14.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:24:56 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] tracing/user_events: Don't free an event that a dynamic event still references
Date: Sat, 31 Oct 2026 21:24:35 +0000
Message-ID: <20261031212453.16116-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

An eprobe takes a reference on the call of the event it attaches to,
and kprobe, uprobe, fprobe and synth events all refuse to go away while
trace_event_dyn_busy() says such a reference exists. user_events never
checks it, so a user event can be freed under an eprobe:

  echo 'u:test u32 a' >> dynamic_events
  echo 'e:ep user_events/test a=$a' >> dynamic_events
  echo '-:user_events/test' >> dynamic_events
  echo '-:eprobes/ep' >> dynamic_events

The last write drops the reference on the freed call.

If the last fd of a non-persistent event closes while such a reference
is held, the delayed destroy now fails. Mark the event persistent then,
so it can still be deleted once the reference is gone instead of being
leaked.

Return -EBUSY from destroy_user_event() in that case.

Fixes: 7f5a08c79df3 ("user_events: Add minimal support for trace_event into ftrace")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
v2: keep an event whose delayed destroy fails deletable by marking it
persistent (Sashiko). Deleting it then needs CAP_PERFMON, like any
persistent event.
v1: https://lore.kernel.org/all/20261031210420.501187-1-devnexen@gmail.com/
 kernel/trace/trace_events_user.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/trace/trace_events_user.c b/kernel/trace/trace_events_user.c
index f658c3a77aa7..ea6a20a30cf5 100644
--- a/kernel/trace/trace_events_user.c
+++ b/kernel/trace/trace_events_user.c
@@ -256,6 +256,11 @@ static void delayed_destroy_user_event(struct work_struct *work)
 		 * attempt to delete it later.
 		 */
 		pr_warn("user_events: Unable to delete event\n");
+		/*
+		 * Keep it as persistent so it can be still deleted
+		 * since nobody own this event
+		 */
+		user->reg_flags |= USER_EVENT_REG_PERSIST;
 		refcount_set(&user->refcnt, 1);
 	}
 out:
@@ -1506,6 +1511,10 @@ static int destroy_user_event(struct user_event *user)
 
 	lockdep_assert_held(&event_mutex);
 
+	/* If there is a reference to a dynamic event */
+	if (trace_event_dyn_busy(&user->call))
+		return -EBUSY;
+
 	/*
 	 * Detach the fields before removing the call. Removing the event
 	 * frees the field list memory (trace_destroy_fields() is run on
-- 
2.55.0

