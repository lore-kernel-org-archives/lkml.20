Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF76431A3E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239802; cv=none; b=Bgt4F7uAN+5mEIBNRAb9xbb0xJSgbcyRoKmc1aXWUzCXvu/mvnk29h+jyXS9TMMynqMBi/L5wtMuNtB7D38MQe/LCPrjkLhU/aWBJ37kfXUmQ5sDID0nb6V/eZu5WoueBrN2BvpbsyvNUjTuvse9x3rHadfriOF+KzYD6OFax8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239802; c=relaxed/simple;
	bh=RTolrfWc72Cy+7e76YB0IcJJ7ooAp/AC6TNHC4OWuek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mmp8NquJidG2Oc3FV5r79gQguyF/fbxYLKd7QWil0mm9tZnrFeyaJjtGhCsBo7LcRMHnnv9tCEpXs/0Gzo+HFfBF0aIGLr0gCEjU+5JjcsAHhG5zwRXZu3Qi6CD36bEylBth2fTkiGOxF3ryIrFXMcqy8b3Ga0T5paLlbENfiyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jafwul+S; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jafwul+S"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa65080so223171166b.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790239793; x=1790844593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1b80XxLjp7p9yNMOdcMsvgCe3vPig69itQP5JgqdKTA=;
        b=Jafwul+SrWbPqylyk3BSzRFTLwdO1lJQ9x8haOGRLwml/+NWYex0mAOMwqoXSMkJ6w
         K33SlGpNzvke3QpP3WRd0873Q8tlas8vy2ASdDxNWM+t2AtfDQqk9o47Rmx5jrAjXfrM
         fS8K92sqDOToh+LJ7Ri2A1OLvwlLfrtMJjROFA9YvJ1T1VZnE/oIGC34ORU9FE2pMRG2
         B9agHW/BWMzjPCDgLka8uH70wepXsxpyLNpaRdUl1omVKU8V4W79yx6iA4gF5G9MkUBi
         2s8C53+sSTfJGLVh2v/GKKfnjx98LH6fnh5kRzQiAnTqoEHGmgbmoKSKAZ3D7do0I9ie
         JVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239793; x=1790844593;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1b80XxLjp7p9yNMOdcMsvgCe3vPig69itQP5JgqdKTA=;
        b=lRTKf8aeDeLsn1RMU7UsrXffwReu7szP+jdCdtRWGGow5TuaNDfQvF7vS+wL9zn3q7
         z9pkhs2VKWp7CC1VBAxYuZENWAhrm6x0LO9dgN/2p0MXaBW4LGA+/3vNt1UsiF3I3WWU
         CxCvVrfgne9WEjgDwjIwj5ntHY9nODCcXBeruWWRxrClvIP+9dx3uAdwAjv3VbGQcb0P
         vtV9dS3T95WSe1a1f1H9Vj3KDetA7IlkMmEjvRPzuTtRmjVH870b3oCY+xwBlgPmiJC4
         TaKVR0hnlrKFn6TS3FWVa1uVreDThdZv3b0G17lccsvOvtQW7EnbhdmtQ5hGFhUMO2OZ
         OX4A==
X-Forwarded-Encrypted: i=1; AKwUvBztIX2LfOV0b4dGI/RIk7U3ejtNOCuFBDMwtXpRjn9ecUqiLe3PTCJtpXHXr1MUipXbBdgwFc+o2eNds4g=@vger.kernel.org
X-Gm-Message-State: AFuF++ku+OVyGEozWvncIS+ilwVHmO5U9GosuJHbMTVlQGZDdoEQEq8n
	j7k/c/72TQZBWPPFHzqc7rxTjtgQ1w/3NpxO9ozmnpYFIVUshygmaxAmmwvr2V5Esho=
X-Gm-Gg: AYBFou2siyU5QLpJ52/5wwOjvwY1P2CajP2HNwwyvOXov9QoF0BSgIB0Kmeh643x2bI
	rn4P+QZzq9YIx2+tI5bkNTLvTlfTBHRQq7x7OihoVXlhnU0oQ0KbbOfCdQ2VgTQlcxr3HTq2p63
	J38rVpiO2jlzTm/s/9gxGzjhB0C42+QyJ46F7NMOUohOziNg88I0NWEqsRAS3t3IFHqwq8/+tRU
	7Pi/JNZIPMvAcsEQha6nOq8/A1NYKIKpWUc9eA8t2JIBi1wjg3NUaMt4z/jqJkdwBKHk9gVZ62e
	2Wade2Ne1qReswEFgliZ9PPLxcVEO+JpMrqzq9EpmLJD2RM9l2zwd72DQzr1lkMEm/oMQ3UIWKZ
	0nuxU12WFaSol9e7Hw4iF4s2lII2XDgoVMY4MXTT3deuB603BXur1dwfw1A/5NO6bxsc31XRA7R
	NzkuQIDmx8cjKjuNvKX1FumDBVZ9LsLosxjVZmWsLHmktWIyjB2nGqX/dS/otqfSB+k5D/bMwm0
	fQjhTHYiAJx8h5njuggM6vUq9QG8CUIznRYLYpmn3HNXWRkzAn3jNEms+y7nXQS1tJXgdlGghR8
	xZpRZ5GGV3xCislOuz01TK14KVxEpOh45yv2i41UgiVmKdNv0WnM9PMM1yYRgg7mfgZ04EVRq31
	OKbrlg93CHjNs3DMoUnGfoo/ralranxualG84FX5trDmM26WJviY=
X-Received: by 2002:a17:907:7214:b0:c25:c54d:d1a2 with SMTP id a640c23a62f3a-c2ac23c0f05mr127635366b.18.1790239792459;
        Thu, 24 Sep 2026 01:49:52 -0700 (PDT)
Received: from Ubuntu.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae687318sm266221466b.44.2026.09.24.01.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:49:52 -0700 (PDT)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot@lists.linux.dev,
	syzbot+de3d7f9bcc9212f3fae1@syzkaller.appspotmail.com
Subject: [PATCH v2] ring-buffer: Fix false warning in ring_buffer_map_get_reader()
Date: Thu, 24 Sep 2026 10:49:42 +0200
Message-ID: <20260924084946.20104-1-krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <15bc282f-669e-4a94-911d-bb435513461f@mail.kernel.org>
References: <15bc282f-669e-4a94-911d-bb435513461f@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The mmap reader can warn when it catches up with a writer that is still
committing events. rb_get_reader_page() returns NULL in this case, but
ring_buffer_map_get_reader() treats that result as an error.

The initial rb_per_cpu_empty() check filters out an empty buffer, but it
does not guarantee that the next reader page has committed data. Writers
do not take reader_lock and can advance commit_page before publishing the
committed length on the new page. rb_get_reader_page() can swap to that
page, catch up with the writer and return NULL.

Handle NULL through the existing no-data exit without warning. Remove the
caller's reader_page == commit_page check as well, since the reader-page
helper already handles that case. The existing metadata update and return
path remain in place.

Fixes: 117c39200d9d ("ring-buffer: Introducing ring-buffer mapping functions")
Assisted-by: Gemini:gemini-3.8-flash syzbot
Reported-by: syzbot+de3d7f9bcc9212f3fae1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=de3d7f9bcc9212f3fae1
Link: https://syzkaller.appspot.com/ai_job?id=488adc18-a10e-42d2-a205-25327c38837f
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
Changes since v1:
- Rewrite the commit message to explain the race more concisely.
- Clarify why the earlier empty-buffer check does not exclude this case.
- Remove the redundant reader_page == commit_page check, as discussed
  with Vincent. Let rb_get_reader_page() handle the caught-up reader.

v1: https://lore.kernel.org/all/15bc282f-669e-4a94-911d-bb435513461f@mail.kernel.org/

 kernel/trace/ring_buffer.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 9c03a555a6ba..9222fc881bc2 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -7990,12 +7990,8 @@ consume:
 		goto out;
 	}
 
-	/* Did the reader catch up with the writer? */
-	if (cpu_buffer->reader_page == cpu_buffer->commit_page)
-		goto out;
-
 	reader = rb_get_reader_page(cpu_buffer);
-	if (WARN_ON(!reader))
+	if (!reader)
 		goto out;
 
 	/* Check if any events were dropped */

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.53.0
