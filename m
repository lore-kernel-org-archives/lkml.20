Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B590489FA3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261918; cv=none; b=MzjTxNPGA72JUNQZ6kOslmXl8D/wtQPpGjlObyR7qTlkrt6Ul42KcJLWVwun9/rYqUr4QupzBTMM/r75GHqOPskhfE8EREdyIqp1oCZtEalgDjsy7uPcbImDWOYYiwedthgz07KiHDeJ8Fa7Fw+XU1+j9OFr2kTxFvoub0jlbyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261918; c=relaxed/simple;
	bh=AznFEGZWe1gMpFnOB0uOLCCbnZE1+JMQ2urDFsxgYjE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F+K3QgVxMcRHTLozPO4044HYzc93Ke52TCz3DB1ZAv6dM4UNGFMSBsNVQ8kaXPMaj0cD1P2959f2bhl4IZNP9CduY39Q9vAv/Ub92PLRaZG0T6TSVdu1JnfO4NUkcqyBJRM/uOOifUacDjSOY4u167aV2wOfFryuuXmXYcUrCkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZvRpNGZW; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZvRpNGZW"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so16084965e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790261912; x=1790866712; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2rSXjapMgKgpxKca/JVPfzG0C/68e17lAk891DH8pU=;
        b=ZvRpNGZWCiW2XktB3d+t4y034wtGMFC5Fld8hn4ejUsGMXh+6FcmPjOhoOYMpKvWEt
         hEIAhtQ8xjLJETH1oJ3+cXafe+LlGyjuvVL3l1f80MfVBa/PG0QiHNYhaxC/k97lhvW8
         P9W++l4Ncil3g+lWN/LgOpdiRM0/hklLxY8eTs7MHZ+F/CLqUKlvbpPhpnd3kBN1WTSX
         alX01OCxzI/U5TaAmAwmrU/jOK7aQlk5kjJ9jwTwmgR2EN3NPuC1Jm8aDRj9slilmj/U
         EfeL7qqTo7ZJcLaCwN5YXINhxBHAxFtf8Rcdzi+RPe9x2ZFkKesnlKpJ5DCnDx6tq0v9
         12/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261912; x=1790866712;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2rSXjapMgKgpxKca/JVPfzG0C/68e17lAk891DH8pU=;
        b=nBUS3hQEz5NGqIGFScsMnK9yx2XM7R1vFGIjKHza/urTrUIA5wttD6NKxo7o1I36rE
         lewt6Jyn2a6sW8ynUBtQChtyxPDXV0yeuREDsbdOJ+w+/qFi8B/xHMtrxfhuUCbUfCsO
         /UQxReLmCd0nA9DuDtJQuSVMqhhegXkMYvCvdReMAjqj/9LwbxGPXa2cYWE7N++YqOwz
         +4Dte2Bb6Mpq6oLCN122a6RgYK+mF0rMq8xCFMNZDOS8Ker1vZ14fv/kvEV6k4Po11us
         tbhwlZ62JnCrWORFEuFGFcMwN2n90gPtUSlBwLBST1H/68Wp8e/6Ej/8ZUV5sWzQumMA
         ELAg==
X-Forwarded-Encrypted: i=1; AKwUvBxeY0wx3zhCmJolPXmRVa8e0X7fSo5LTqQBvzihmLUpwZ5uUdGoqItNTrhVsyUtTF3De7sgkSjzWAKJvTA=@vger.kernel.org
X-Gm-Message-State: AFuF++muFc0n7LP8WwTqmFtSiwmmtkMODKyOiO+DVYL9w6cQiFEWe1vR
	ul3UgbmL2NjuzhGgqE+WrxzroNWENWbd7G7Kye1/IjXC4HT6sDO9BVmRL/tVavuF7DhR6qBErBV
	4lfzxEbXZt5g9KF/37d6Ing==
X-Received: from wmpz10.prod.google.com ([2002:a05:600c:a0a:b0:49f:e55e:dd64])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b22:b0:49f:bbab:aa10 with SMTP id 5b1f17b1804b1-49fe66f13f6mr48689765e9.20.1790261911477;
 Thu, 24 Sep 2026 07:58:31 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:57:41 +0100
In-Reply-To: <20260924145754.1285146-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924145754.1285146-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924145754.1285146-8-vdonnefort@google.com>
Subject: [PATCH v7 07/20] tracing/simple_ring_buffer: Add support for
 compressed length
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

The array length is the total size in bytes of the data for the current
event. It is possible to compress this value into the event header type,
which has 28 unused types, saving 32 bits for sufficiently small events.

The compressed length is expressed as a multiple of the ring-buffer
alignment, 4-bytes by default. Enforce this alignment.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/simple_ring_buffer.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_buffer.c
index 49913bb0057a..70768666e365 100644
--- a/kernel/trace/simple_ring_buffer.c
+++ b/kernel/trace/simple_ring_buffer.c
@@ -207,7 +207,13 @@ static unsigned long rb_event_size(unsigned long length)
 {
 	struct ring_buffer_event *event;
 
-	return length + RB_EVNT_HDR_SIZE + sizeof(event->array[0]);
+	if (!length)
+		length++;
+
+	if (length > RB_MAX_SMALL_DATA || RB_FORCE_8BYTE_ALIGNMENT)
+		length += sizeof(event->array[0]);
+
+	return ALIGN(length + RB_EVNT_HDR_SIZE, RB_ARCH_ALIGNMENT);
 }
 
 static struct ring_buffer_event *
@@ -223,12 +229,15 @@ rb_event_add_ts_extend(struct ring_buffer_event *event, u64 delta)
 static struct ring_buffer_event *
 simple_rb_reserve_next(struct simple_rb_per_cpu *cpu_buffer, unsigned long length, u64 timestamp)
 {
-	unsigned long ts_ext_size = 0, event_size = rb_event_size(length);
 	struct simple_buffer_page *tail = cpu_buffer->tail_page;
+	unsigned long event_size, array_size, ts_ext_size = 0;
 	struct ring_buffer_event *event;
 	u32 write, prev_write;
 	u64 time_delta;
 
+	event_size = rb_event_size(length);
+	array_size = event_size - RB_EVNT_HDR_SIZE;
+
 	time_delta = timestamp - cpu_buffer->write_stamp;
 
 	if (test_time_stamp(time_delta))
@@ -259,9 +268,13 @@ simple_rb_reserve_next(struct simple_rb_per_cpu *cpu_buffer, unsigned long lengt
 		time_delta = 0;
 	}
 
-	event->type_len = 0;
+	if (length > RB_MAX_SMALL_DATA || RB_FORCE_8BYTE_ALIGNMENT) {
+		event->type_len = 0;
+		event->array[0] = array_size;
+	} else {
+		event->type_len = DIV_ROUND_UP(array_size, RB_ALIGNMENT);
+	}
 	event->time_delta = time_delta;
-	event->array[0] = event_size - RB_EVNT_HDR_SIZE;
 
 	return event;
 }
@@ -284,7 +297,7 @@ void *simple_ring_buffer_reserve(struct simple_rb_per_cpu *cpu_buffer, unsigned
 
 	rb_event = simple_rb_reserve_next(cpu_buffer, length, timestamp);
 
-	return &rb_event->array[1];
+	return rb_event->type_len ? &rb_event->array[0] : &rb_event->array[1];
 }
 EXPORT_SYMBOL_GPL(simple_ring_buffer_reserve);
 
-- 
2.56.0.rc1.310.g51773c2048-goog

