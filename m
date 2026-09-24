Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4FC49D5BF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261928; cv=none; b=p/Bp3+SnLOQXGCe0wkzt7gaAc6oGFCSOcorDOTTLAK5Ud0U5MaK2fsmYcmFhs/N5YOIijgxbTATB7tYzbSyDSN/BK+VujeDTrxfaz5A8yQLp99qtL5LK2ElsBT3GjbfvLMfl8zOHd2BIieWGu2qxYM6Xg9PIxFCvtYgs+sj5XTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261928; c=relaxed/simple;
	bh=gyLVAF3tlmRS8yu7R0Sj0qry/ybOo5qjXc2qNQmb9wo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XAp8voNVy1CTwsX6lan08gPBafCLCRekDHr766fP7fFiFEEyfi0NlS1xmTWmvfSZrXcOGSUR7pGr/mlb94PhT9HO5B7RPuQcWMueF4+tn0rg2CHjxIzL6cFTpLAl/7tGUTzSQP28ORDfZM0SLv7nzfLmGwV6Hr+sKzym5aBzHt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KlLbPsRo; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KlLbPsRo"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4887782ab2dso215190f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790261923; x=1790866723; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41Mral2Iew9L1eDAhCS002LBnxt3yzfpo/S93Hv8u3M=;
        b=KlLbPsRoArAkcoE/hIs7bSqdYJFb0CdFxlAtdUVJsRtbY/HIge4MtaVQEj/Dl+NLIC
         jaCWS4ySxaiPVQ0qd1QZTXyO95W/EGXrTQEKknHgUubcMhBjId4m4Zo8k6t5HVm97xSc
         dKkj5JzfKzLU//HfLaSh1jGny6zABRpX/3CzVE0eQphQt9mb+/SHHkcY4uEsiAsRZZdo
         fey/8UlVNf+hVjlgCPyytz/PvfaD3+2G+qR0QpVNkranizxLrp+nxr0hUhldlx5KKfs0
         BmHilDHuns5Bk0z8OYxsmENQflNrU7ZScFA7wbevWGDX7pRQ/uJ6xvg5P3sGc9Vly0fU
         8Akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261923; x=1790866723;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41Mral2Iew9L1eDAhCS002LBnxt3yzfpo/S93Hv8u3M=;
        b=gdGgDsqviArXjyz2P60tHc+9QW1TX1hvJtt13U7J70v02si2LN0wB5bt9tRRpwiFzw
         sA0tnCL+XGpcER0x6hdngiqRX0iZEAyiLLFtLEbMffza/7iulxy87Tvf+h+axUCTummh
         kfKk2SP+SJFBxIG7Ukzy9gXZQBWXkiBOYY8LdyqFpCPQoXidB8RgXZ98jOoPL9O929f5
         us782sxdgP+TsrS2hzjn/TN6tLTnTPUl1iJW631u6+zCgSgofIfj6lGoZWlvuPIWmfwc
         s0IX5yxB6h1KqwE39puLz2TlsMdkDsGnAoRv2U3Ad7/A6onPEt+1vrTg2gUlN87E27o6
         Fo4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwrZ+0gPiBcuWQf8saLaN4Qmk0LPJB22K6/uk2txNzwvlkWFSqYQlx1EAtR1RHYp2dhF5k8g5Eotj8+EI=@vger.kernel.org
X-Gm-Message-State: AFuF++nTTMvF0PHXWCp6NJdivGOvDCAODosRV7QFN6/jHOFr/rGoBAyW
	r/yo/qo4UEGpi/6VIBkoDBKy0pUZwuvo/o27HxacFvg8nvKx0Vwk3Q3xRL45rek+dKRXAsisG99
	iM8kOikBQkGvAF9C/UTQtbQ==
X-Received: from wrck17.prod.google.com ([2002:a5d:5251:0:b0:488:658b:25a9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4703:b0:487:242a:c020 with SMTP id ffacd0b85a97d-48872a5cdb4mr4380837f8f.6.1790261922940;
 Thu, 24 Sep 2026 07:58:42 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:57:51 +0100
In-Reply-To: <20260924145754.1285146-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924145754.1285146-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924145754.1285146-18-vdonnefort@google.com>
Subject: [PATCH v7 17/20] tracing/remotes: Add poll_ms tracefs file
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
 kernel/trace/trace_remote.c | 41 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 0a360690b174..b2547eb117f8 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -427,7 +427,8 @@ static void trace_remote_do_poll(struct trace_remote *remote)
 
 	ring_buffer_poll_remote(remote->trace_buffer, RING_BUFFER_ALL_CPUS);
 	yield = trace_remote_do_dmesg(remote);
-	schedule_delayed_work(&remote->poll_work, yield ? 0 : msecs_to_jiffies(remote->poll_ms));
+	schedule_delayed_work(&remote->poll_work,
+			      yield ? 0 : msecs_to_jiffies(READ_ONCE(remote->poll_ms)));
 }
 
 static void __poll_remote(struct work_struct *work)
@@ -1138,6 +1139,40 @@ static int dump_on_panic_show(struct seq_file *s, void *unused)
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
+	if (val < remote->poll_ms && remote->poll_cnt)
+		mod_delayed_work(system_percpu_wq, &remote->poll_work, msecs_to_jiffies(val));
+
+	WRITE_ONCE(remote->poll_ms, val);
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
@@ -1170,6 +1205,10 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
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
2.56.0.rc1.310.g51773c2048-goog

