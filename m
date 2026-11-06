Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988485;
	b=pNelH89sxJGRpI6vmBYUCcgX9az5/ohdCAY/ncQpb8Zfl01FFq1baHiZCD+1fod9jIXv
	 vhAU9Zyb66nWpxOd2hmOy1WKrtQMVjp0zfohErYg/5uiIbpXnwtdKSYYiS3gQ8C96Tb8A
	 wUXEKceDyOicES5QSlycHOLfvVE89iMUVPYD+Q7b6rmjmuhTdGwIyvMUJAuQgHM4a2Kl/
	 aTccBCy4lMH2NoYckkn7SKp5nkIB0K+33uCAfkh7fjlum3GpJSn7EUIHEM9IGqedYEEJp
	 wPp78QIUFM0vLrzt5rP3w4NzjLn/PUoTGWwy9esF6uXB/99hy75oJrBnmUBkXNjhSMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=OcW0ehiseo0kKW3D8JtxdTJVWEOauFOo1Zzj6IjMz44=;
	b=AJt/DgaTcqnXoUkrBljNdIaNQHWYyMbVsgfU7J/zSsFQ+nSB39dktJqXqG8PYfJrKX86
	 Ru01/hgDkMy6vxkM/iQDRD3uMmyeHhvAk1A394NtdgXxpM3BIi+1cqBo5XRhvu75QrhuK
	 hGAop3zxZSh66uKAWGHMr7gurOPlyhLojPEq0IVhYvT6+POV1PhXfkTIZ2vVLVKTAEBkm
	 JURtMgdksG98xK4JMEcVB617iIPf1A/DyQuVH+/qej10AIxaMfP5MqUi3h60hF2luHEk7
	 9CcGjFS3wIMNSMznsoWL0APs9kMAHdmLDAj2b6h5256wtgKHajaHb62Gmxt2KodDiRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="J8L/wgzS";
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E486083607
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E486083607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J8L/wgzS
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a35e1d2dddso9055335e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988484; x=1794593284; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OcW0ehiseo0kKW3D8JtxdTJVWEOauFOo1Zzj6IjMz44=;
        b=J8L/wgzSRtmhLZTZuPdVcRu0A4DLH2OlcrwXzeSIZceKrX/d/ufM+Svob43UTOTS71
         l3zRXwS7TrHJn+fe+d3+SNyAPuVbudRM9ZLLFb5XVhrLxGbXrPKJdbQ48saG65LxzGmo
         7gyM9/FMSONvpO+miidiPEEHyYIJM25WqXpJL5Vp74bh2jk227KVhdjgpRF4hJ9KNN6R
         lvBsJUj629+MiuttVPcYY1Fr0kfVhl2XjNO2jLng0bIclcqQkZG48lBxcWRrP7Xl8/0o
         LT8uCEVfV4/lYZCOJHndR3mpsgp3UXwviWLhXJV63Zut86YtA65R4EFEkc3fzcXNjPaL
         0ABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988484; x=1794593284;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OcW0ehiseo0kKW3D8JtxdTJVWEOauFOo1Zzj6IjMz44=;
        b=TNwJ493lxOqdvpjX7dCkKPSLyk4QKpPqI636TD4izcSS39Ir9xDPJYZQ+pkD2xmNvb
         RQgIWJcLH7qnP5XTACsRf4rzSyjBZkoF+1257Rn3RI17yM5KPntEAWTp6NeV5dxEfOqf
         whmW11TntaQhF7kRVBZp6JhxeZz7m3gL4NKhCI+yenkk7Savo0N3j/jeuiLiJ+mosMwr
         iAC4MyezQZNrhn7MEOSqJUh7/PAQXhFSQOQXVmgys+5u0EsGj9NtADLKo15oDG1R8snk
         tHdOUYCI+WyAZYG1xH4Sh8GWYYUSFXSQ4hyVQq9nAXiMZWW7umaQeoR6HFydVSFRH/xS
         L4vA==
X-Forwarded-Encrypted: i=1; AKwUvBwqytSM6BX1VrkIXGJDtRr9Sdr4otVcwuZuuHphmOZLl3iRR+GNTB6AfrQWy1oniudISv9onsaVLIIadjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9E8CQqO+7nFd5Q2/AZ3DxeddzHXGc0jUUb/MYsCpzuOK5LdCsn
	swqS+07Gd7U5DL5MJ02yaVBEhhx+r4nbhXLuCp5xAJQvdTgCEL0pfd17ANB0BFdgLb+JMiBklsU
	4GYty3xKs+4o7wbi2A1uGjg==
X-Received: from wmdd1.prod.google.com ([2002:a05:600c:a201:b0:4a1:811f:6de2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4694:b0:4a2:994:575c with SMTP id 5b1f17b1804b1-4b6e0454d69mr60811855e9.34.1793988483632;
 Fri, 06 Nov 2026 10:08:03 -0800 (PST)
Date: Fri,  6 Nov 2026 18:06:54 +0000
In-Reply-To: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106180657.2460376-19-vdonnefort@google.com>
Subject: [PATCH v8 18/21] tracing/remotes: Add poll_ms tracefs file
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a tracefs file to configure the trace remote polling period. Keep
the default value to 100ms.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 2946f263c79c..ebfc2dd67b79 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -1137,6 +1137,46 @@ static int dump_on_panic_show(struct seq_file *s, void *unused)
 }
 DEFINE_TRACE_REMOTE_ATTRIBUTE(dump_on_panic);
 
+static ssize_t poll_ms_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
+{
+	struct seq_file *seq = filp->private_data;
+	struct trace_remote *remote = seq->private;
+	unsigned int val;
+	int ret;
+
+	ret = kstrtouint_from_user(ubuf, cnt, 10, &val);
+	if (ret)
+		return ret;
+
+	if (!val)
+		return -EINVAL;
+
+	guard(mutex)(&remote->lock);
+
+	if (val == remote->poll_ms)
+		return cnt;
+
+	if (remote->poll_cnt)
+		cancel_delayed_work_sync(&remote->poll_work);
+
+	WRITE_ONCE(remote->poll_ms, val);
+
+	if (remote->poll_cnt)
+		schedule_delayed_work(&remote->poll_work, msecs_to_jiffies(val));
+
+	return cnt;
+}
+
+static int poll_ms_show(struct seq_file *s, void *unused)
+{
+	struct trace_remote *remote = s->private;
+
+	seq_printf(s, "%u\n", READ_ONCE(remote->poll_ms));
+
+	return 0;
+}
+DEFINE_TRACE_REMOTE_ATTRIBUTE(poll_ms);
+
 static int trace_remote_init_tracefs(const char *name, struct trace_remote *remote)
 {
 	struct dentry *remote_d, *percpu_d, *d;
@@ -1169,6 +1209,10 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 	if (!d)
 		goto err;
 
+	d = trace_create_file("poll_ms", TRACEFS_MODE_WRITE, remote_d, remote, &poll_ms_fops);
+	if (!d)
+		goto err;
+
 	d = trace_create_file("buffer_size_kb", TRACEFS_MODE_WRITE, remote_d, remote,
 			      &buffer_size_kb_fops);
 	if (!d)
-- 
2.56.0.455.g6c5a503b38-goog

