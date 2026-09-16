Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C4F4A0F00
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789596951; cv=none; b=S5usyFC1qj3DC3UFgJh1PRdVlaadL1GclIcaVlZq1mb5wLuAJDLT+q4wBMrVUeyxRkGgRtcP4TdtXhMJ+MY7+UqT5qPs6tN7+oWzC0/OskhtcrWgpD4sfEcjnq4/V7U06VTVaBc50yzmf8jz0wkQQscRCy4i1Pe+Xy18LWAGmTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789596951; c=relaxed/simple;
	bh=OTWaLEXPWBhQzeYYwpzf8NSRkb261QT0xbFLmxx6C24=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lvZYaaGCPgs/iISoGcND+zT5r79y9d//IdhTtRlTtUcnxggeml/ee2ajL6s/Mdk4HAQbiEMAFE0a4+GE5S+LcZuREPoyDvireGwDjq6g2joIT6POMualyax+YnkizAX0xwW55L/LVQquYxe/4va8FekiMWidvR+6loqzvglITP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uOvwBjtf; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uOvwBjtf"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6fed0652bso2621135ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789596937; x=1790201737; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VT9yxlG3sy4p8RM6yvQR98/kAjakpHzOMZ+6UgJJ6ZA=;
        b=uOvwBjtftUm57L0pGcU04fXOHevdpbG/LQ7pnXkCbK5tezWxplEJXbWkqhW/vYoBQN
         yDuO6jvUKYl+ABKD0lYHeRjY5VARJXm7iXI4neOSCyyFBb3IL88g5bzsdM4euiL7M+gP
         78NfH/XdPv2AhaWYKn4pp8XDIZ4+FSm60D5GsJwTLzPo3anxIl1YIS+lwnLph69OWdvi
         a4fCXnbsghFe77Oe/rNP6tx/Q/ccamwOr4sIhbTgqcTyzzEeBjkuzWRlxDFKs6waf+Q7
         avvm0nYctItMrSwDOsJNwvZ1aVi4keeEZcIEqGg5dPG5wOpQ+7DPvjALCreEU/4ru4a/
         IzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789596937; x=1790201737;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VT9yxlG3sy4p8RM6yvQR98/kAjakpHzOMZ+6UgJJ6ZA=;
        b=C2+uUsCjE5Nmci6Da4x/nuQ2FlLQdAc0OHXjrbuN4EkBxf/dGVoq2fRX3JJbRXS3aX
         M01+WdWWFPOb8LP3v9RzljuW4+u31BW5Et07Wc7wr1ghRzQ3Oyd6Uk/a+/YM0T5kaJkX
         5oCrcRwEZfQdBWjDE2FnE34MDcXJG4Q/T4gyVBdBwV761jVDhn8cWGxdhOdrEo6BaC2q
         hsNl/vfXnc8hxrdPg+kkCXMqUnFDUYzATKZyMKDxZy3iZo6rdJwOQRSlIHfXEVfLPnRi
         z+ulDJAgFn0TVX63UrKqzvNmLZ3nFLbHsX6syLoa3CniCp1+ZKvNQDMbrHnd9YpB7kCJ
         ybVg==
X-Forwarded-Encrypted: i=1; AKwUvBxHhvSHvV714qIjAOlfQUaGWrxqg2IPURYf7HMY7SHBDotZW8bKWp97S1lAWqJkKjdt0XDrU7COFrMtMkE=@vger.kernel.org
X-Gm-Message-State: AFuF++mm4yM/oEgPu5SQ71qBvDEV0RsjSXozw1X4KF4bAqvRTOStk+FO
	fwvA8DuJEShBRArC3ThS/08xN+KTfSCJFIfu6gbzjqeFiNcgukHJ0G9b+DnwBZGyR0zR2i+rSwt
	R
X-Received: from plbbg3.prod.google.com ([2002:a17:902:8e83:b0:2db:7978:1b17])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce89:b0:2db:5052:fd6f
 with SMTP id d9443c01a7336-2dd8e636afcmr84599995ad.17.1789596937146; Wed, 16
 Sep 2026 15:15:37 -0700 (PDT)
Date: Wed, 16 Sep 2026 22:15:27 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260916221528.1256283-1-morbo@google.com>
Subject: [PATCH] seq_buf: add seq_buf_strlen(), seq_buf_init_append(), seq_buf_puts_trunc()
From: Bill Wendling <morbo@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

Several strlcat() call sites being converted to seq_buf in this series
need behavior seq_buf doesn't currently provide, either directly or
without introducing subtle bugs:

 - seq_buf_used() reports the full buffer size when the buffer is
   completely filled, even though seq_buf_str() then overwrites the
   final byte with a NUL terminator, leaving only size - 1 bytes of
   actual content. Callers that need the true length of the
   NUL-terminated string have to fall back to strlen(seq_buf_str(s)).
   Add seq_buf_strlen(), which mirrors seq_buf_str()'s NUL-termination
   logic but returns the resulting string's length directly.

 - seq_buf_init() always clears the buffer it's given via
   seq_buf_clear(). Code migrating from strlcat(buf, ...), which
   appends to whatever @buf already contains, can't use seq_buf_init()
   without silently discarding that existing content. Add
   seq_buf_init_append(), which preserves it and positions the seq_buf
   to append after it.

 - seq_buf_puts() (like seq_buf_printf() and friends) writes nothing
   at all if the string doesn't fully fit, whereas strlcat() always
   copies as much of the source as there is room for. Converting a
   strlcat() call site that relied on that partial-copy behavior to
   plain seq_buf_puts() can silently drop content that used to survive
   truncated. Add seq_buf_puts_trunc(), which keeps the leading bytes
   of the string that fit.

Assisted-by: LLM
Suggested-by: Kees Cook <kees@kernel.org>
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/seq_buf.h | 60 +++++++++++++++++++++++++++++++++++++++++
 lib/seq_buf.c           | 35 ++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/include/linux/seq_buf.h b/include/linux/seq_buf.h
index 9f2839e73f8a..a552bcaab07f 100644
--- a/include/linux/seq_buf.h
+++ b/include/linux/seq_buf.h
@@ -30,6 +30,10 @@ struct seq_buf {
 		.size = SIZE,				\
 	}
 
+/**
+ * seq_buf_clear - reset the seq_buf to be read / appended from the beginning
+ * @s: the seq_buf handle
+ */
 static inline void seq_buf_clear(struct seq_buf *s)
 {
 	s->len = 0;
@@ -37,6 +41,14 @@ static inline void seq_buf_clear(struct seq_buf *s)
 		s->buffer[0] = '\0';
 }
 
+/**
+ * seq_buf_init - initialize a seq_buf
+ * @s: the seq_buf handle
+ * @buf: pointer to the buffer
+ * @size: total size of @buf
+ *
+ * The contents of the buffer are ignored.
+ */
 static inline void
 seq_buf_init(struct seq_buf *s, char *buf, unsigned int size)
 {
@@ -45,6 +57,26 @@ seq_buf_init(struct seq_buf *s, char *buf, unsigned int size)
 	seq_buf_clear(s);
 }
 
+/**
+ * seq_buf_init_append - initialize a seq_buf over a buffer that may
+ *			 already hold NUL-terminated content
+ * @s: the seq_buf handle
+ * @buf: pointer to the (possibly non-empty) buffer
+ * @size: total size of @buf
+ *
+ * Unlike seq_buf_init(), which always clears @buf, this preserves
+ * whatever NUL-terminated content @buf already holds and positions
+ * @s to append after it. Useful for converting code that used to
+ * append to an existing buffer with strlcat()/scnprintf() and friends.
+ */
+static inline void
+seq_buf_init_append(struct seq_buf *s, char *buf, unsigned int size)
+{
+	s->buffer = buf;
+	s->size = size;
+	s->len = strnlen(buf, size);
+}
+
 /*
  * seq_buf have a buffer that might overflow. When this happens
  * len is set to be greater than size.
@@ -108,6 +140,33 @@ static inline const char *seq_buf_str(struct seq_buf *s)
 	return s->buffer;
 }
 
+/**
+ * seq_buf_strlen - get the length of the NUL-terminated string in seq_buf
+ * @s: the seq_buf handle
+ *
+ * Like seq_buf_str(), this makes sure that the buffer in @s is
+ * NUL-terminated, and returns the length of the resulting string.
+ * Unlike seq_buf_used(), the returned length is always correct, even
+ * when the buffer is completely full: in that case seq_buf_used()
+ * reports @s->size, but the last byte was overwritten with the
+ * trailing NUL, so only @s->size - 1 bytes of content remain.
+ *
+ * Returns: the length of the NUL-terminated string in @s->buffer.
+ */
+static inline size_t seq_buf_strlen(struct seq_buf *s)
+{
+	if (WARN_ON(s->size == 0))
+		return 0;
+
+	if (seq_buf_buffer_left(s)) {
+		s->buffer[s->len] = 0;
+		return s->len;
+	}
+
+	s->buffer[s->size - 1] = 0;
+	return s->size - 1;
+}
+
 /**
  * seq_buf_get_buf - get buffer to write arbitrary data to
  * @s: the seq_buf handle
@@ -179,6 +238,7 @@ extern int seq_buf_putmem(struct seq_buf *s, const void *mem, unsigned int len);
 extern int seq_buf_putmem_hex(struct seq_buf *s, const void *mem,
 			      unsigned int len);
 extern int seq_buf_path(struct seq_buf *s, const struct path *path, const char *esc);
+extern size_t seq_buf_puts_trunc(struct seq_buf *s, const char *str);
 extern int seq_buf_hex_dump(struct seq_buf *s, const char *prefix_str,
 			    int prefix_type, int rowsize, int groupsize,
 			    const void *buf, size_t len, bool ascii);
diff --git a/lib/seq_buf.c b/lib/seq_buf.c
index a92093f346da..4d56ac71fafe 100644
--- a/lib/seq_buf.c
+++ b/lib/seq_buf.c
@@ -376,6 +376,41 @@ int seq_buf_to_user(struct seq_buf *s, char __user *ubuf, size_t start, int cnt)
 	return cnt - ret;
 }
 
+/**
+ * seq_buf_puts_trunc - append as much of a string as fits, keeping any of it
+ * @s: the seq_buf handle
+ * @str: the string to append
+ *
+ * seq_buf_puts() writes nothing at all if @str doesn't fully fit,
+ * unlike strlcat()/strscpy(), which copy as much of the source as
+ * there is room for. That all-or-nothing behavior is usually what's
+ * wanted for building diagnostic/trace text, but it's the wrong
+ * choice when converting code that relied on strlcat()'s always-copy-
+ * what-fits truncation to avoid losing content that was already
+ * appended. This copies the leading bytes of @str that fit, reserving
+ * room for the NUL terminator later added by seq_buf_str().
+ *
+ * Unlike seq_buf_puts(), this does NOT NUL-terminate @s->buffer as it
+ * goes (it copies raw bytes via seq_buf_putmem(), not @str's own
+ * terminator). Callers MUST call seq_buf_str() or seq_buf_strlen()
+ * before using @s->buffer as a C string.
+ *
+ * Returns: the number of bytes copied from @str.
+ */
+size_t seq_buf_puts_trunc(struct seq_buf *s, const char *str)
+{
+	size_t left = seq_buf_buffer_left(s);
+	size_t len;
+
+	if (left <= 1)
+		return 0;
+
+	len = strnlen(str, left - 1);
+	seq_buf_putmem(s, str, len);
+
+	return len;
+}
+
 /**
  * seq_buf_hex_dump - print formatted hex dump into the sequence buffer
  * @s: seq_buf descriptor
-- 
2.55.0.1082.g2b9226bbc0-goog

