Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE302874E6
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 03:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666255; cv=none; b=f+RVIlWcBKIdAl3y1zNTgZYoCPpqxIEXEQ+WqbnzpPTME6HpFRjNvKBT4WUhRo70RrCc/oNQjvhoTmZ+1P6EsOk8zlWLNB664Cx3CxiZiouASzutD3+ZRz4utzus+8NMq2EZaUE75KX5a2cWj5qHB9mvA404HUPA0CNVfXB7gkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666255; c=relaxed/simple;
	bh=nz7WpThK2Yj7pbRrI2t4/rlRY2RNQP/63J6KbYYh4Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HBaugJg/SeJAHOatYS9vwfkmAfxb2/tg9YttSUwjsRR/i5WAlt7DZA6eLp9HikDhpY3/ymSl6KB4Hkptx/pnWapJq3jcbjHWyiitX6IEP5kfiamsio7KQXhPncXdI/4gqP+UK3hpPJaFZZsdW/w8KEX4EZPku5GXcOqCdi26Wjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gW4z/BbB; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gW4z/BbB"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2075256a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 20:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788666253; x=1789271053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4Ap773c76TL1E1578+g8wGsSz9MJ+j7nGEGULZVyZ8=;
        b=gW4z/BbB+9lbC1GbCfud00QxSZZJ0aRmwBiAijOo/LM5wfhW+9JI0DU0iGcEvIcYVu
         SYaKGPzvt5pZ9ETW4Bu1bPHxuVzXMLUxWGoJ7nvFGwrtcyq5AfaTXaDWoFcta1fby0wF
         l53TqmDENCnNqCaDGqwxDy0VfPdPRcnApmvvoo5lhpN+h6ux676r0iiC4LWJ5bNqz8bY
         hDLzTPaJqJuUFGlpvpJSHCHrRvn3gyx/McixGxBI41+aA2K+W4OYbtdYRhl8aHEFMa/3
         tfCgtWtEDUt6cogMP4R79z6QdbFJfqDhZBhHZvAKQylCwRefe3hxsCCYiPprm0WI6Dou
         bK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788666253; x=1789271053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4Ap773c76TL1E1578+g8wGsSz9MJ+j7nGEGULZVyZ8=;
        b=hicG6fhHCfUF+J7nT2c+sPNq0jNF4rKRMflGqf/63HA5DMQTV2cD6RyBnpnDZObJJh
         d/nCTAZlGY+ywPyogSuB54YROveUXkp9YCLV+WzzSzuYo4zOpaQ8bAag9zZLgsjyJVRy
         kdt+VMhH4LCiQnBtsO+0tCJH/JkOds5Dlxcd707DEHRmOcfVyaFMX7MEYiIcpDVIYQZb
         /7eUW8WZDmIMz5V/ORv8EXSgftKXskn3SWXX/fWVsAlV/nO5pWE6rN2Lv5j1KYN/9TN0
         rx1AOh5LwAmNMOzpKsuWoVMaCU9I/cS+IA7qlcsxmXmJ/MvugR4pyqQf4DTgSk6bwBd6
         Hjdg==
X-Forwarded-Encrypted: i=1; AKwUvBxKRurTw7gOFPqd34jVVhgGBNBNHJsGvCcMq4yeknqD1FW/HYCVYyOv6kfj6ID9WBsBRaX+x4xJou7aujs=@vger.kernel.org
X-Gm-Message-State: AFuF++kulnzDMYdm+JyzRNgEzvnSi8DBrvMtcUaMz4wKrppRpI+9PSqp
	j/J5LTFT++QPmQvXJtcDS5bgcNtsijcaFQNaMHqzuIRSF9zNDEEnZr8=
X-Gm-Gg: AYBFou3dBoSrAc4bH7VzC3tdKMQDiITu998dA20KxES6QYdgXAB4VuIuMEoYCP24X1+
	1nrW/47Ci1wNyobulUbMuK5W/Mq997JXli73CqSXD/7T4GlsYhbHjAfMA1ykCFpZJ5mRRvJ7lV0
	Of7VGC18pfcBAyNK1w4Z4JnLU41XkX4oy2kfOEvvO45tIOIm9xbNPqd82lsxqTKm98BzF1Q0idE
	Vh8nWKq6nIUz9aot7aZwl3VpmYbs8ZHQhIqTKeVU2R0sP9lalk2AzE++NNDFI4bQbnwfEh+06O4
	rjamep6S1TFJDbZmb8ohFpd4ovGGpquzpfwbWIm0AmGGlGVClcFy7ZcovynzZcB3kqpu5+InMoD
	c68Yoxfj+Snw5TqR3Xkvz+fWCVuH9cns/fTQdtWco3cdKMz0Pz9O9zW5KiPD7wX9En0aYFm2vIf
	EzyDQ3aU+Rjjj8BDCc85TjY4NXlhSHfD6HEDcLkfpU3OYheXBSDEidWiRdUlkkqyYNhPMqeC+FD
	d5TIQ2yY/L/IJbZ
X-Received: by 2002:a17:90b:224c:b0:398:9bd4:d15 with SMTP id 98e67ed59e1d1-39b26245d08mr21476187a91.20.1788666252720;
        Sat, 05 Sep 2026 20:44:12 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:2b14:fe4a:ab17:f236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm13075385a91.9.2026.09.05.20.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 20:44:12 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH] function_graph: Use the saved entry's size when reprinting it
Date: Sun,  6 Sep 2026 12:44:06 +0900
Message-ID: <20260906034406.1335316-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a graph entry does not fit in the trace_seq, print_graph_entry()
saves it in the iterator's fgraph_data and reprints it on the next read.
The entry has already been consumed from the ring buffer by then, so the
copy is all that is left of it.

The copy is sized with iter->ent_size, which no longer describes the
saved entry but whatever entry the iterator has moved on to. The
argument count is derived from the same field, so a 72 byte entry saved
and then reprinted ahead of a 48 byte return entry loses its arguments.

Record the size next to the failure flag, so that the two are always set
together, and restore it before reprinting.

Fixes: ff5c9c576e75 ("ftrace: Add support for function argument to graph tracer")
Cc: stable@vger.kernel.org
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Reproduced under QEMU (x86_64 defconfig plus FTRACE, FUNCTION_GRAPH_TRACER,
DEBUG_INFO_BTF, 2 vCPUs). function_graph with funcgraph-args on, trace_pipe
read in 64K chunks 300 times from a static init:

  before: 271 reprints, 190 of them with a size that did not match the saved
          entry, 184 of those deciding the argument count the wrong way.
          _raw_spin_unlock() takes one argument and printed as
          "_raw_spin_unlock()" 19 times out of 2209.
  after:  same workload, 0 times.

Toggling funcgraph-args and funcgraph-retaddr during the run produces all four
entry sizes (24, 32, 72, 80 here) and they are all reprinted with their own.

No change in tools/testing/selftests/ftrace: 80 passed, 3 failed, 13 unresolved,
81 unsupported both with and without the patch, identical per test. The
in-kernel selftests pass, including "Testing tracer function_graph". A KASAN
build reports nothing on the same workload.

 kernel/trace/trace_functions_graph.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_functions_graph.c
index ff7cb1a76b95..c5befd0c5b9a 100644
--- a/kernel/trace/trace_functions_graph.c
+++ b/kernel/trace/trace_functions_graph.c
@@ -52,6 +52,7 @@ struct fgraph_data {
 	};
 	struct ftrace_graph_ret_entry	ret;
 	int				failed;
+	int				ent_size;
 	int				cpu;
 };
 
@@ -1274,6 +1275,7 @@ print_graph_entry(struct ftrace_graph_ent_entry *field, struct trace_seq *s,
 		if (s->full) {
 			data->failed = 1;
 			data->cpu = cpu;
+			data->ent_size = iter->ent_size;
 		} else
 			data->failed = 0;
 	}
@@ -1457,6 +1459,7 @@ print_graph_function_flags(struct trace_iterator *iter, u32 flags)
 	if (data && data->failed) {
 		field = &data->ent.ent;
 		iter->cpu = data->cpu;
+		iter->ent_size = data->ent_size;
 		ret = print_graph_entry(field, s, iter, flags);
 		if (ret == TRACE_TYPE_HANDLED && iter->cpu != cpu) {
 			per_cpu_ptr(data->cpu_data, iter->cpu)->ignore = 1;
-- 
2.53.0

