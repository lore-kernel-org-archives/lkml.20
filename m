Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91574340406
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364094; cv=none; b=qo68zNRY1TVpXV3Avk1DXEw0UWQJ2p+CRP74K1kBKnC/exJLb/VJTnBsEuSn6bJhy76eggZxbPouPKu0u/hLrXFRXLzM9YMC1AmCRiWrjAzU/RD18mn0kXeUug/zU8twoR6eWKNmwXhTsxSoQK0iWNFDhQo5DkZSQK1WqMUitIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364094; c=relaxed/simple;
	bh=PyLYiRqolXNgZ1XljJ7WLyZ//aWMD1yUwpclJVxwOeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQ7EbY/qFcoJH2vcT6DkOV8F0+ITSF+fMA1rffrSMatAizr/d7W3RY9IhwZhJxAhh2J758MbhZG0JY0dS8O81p87gsvao3jvpLxMJk9uf1qaiRkbp8NXEAqbGgVPKppRH/paYitp04PIK1oSGkizfY2IESxJJceNzLQY/jGetLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JljD1vy4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JljD1vy4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2dd68a16955so3929495ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789364093; x=1789968893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IASBcTda1NMxT7D2tV4KSLuvYAReFfZa/VfnrrcpJ3s=;
        b=JljD1vy4GYiILbjCLDti8CecUEBnNZneIEPxtJWJ2lsmqUgZPN45wlaUd4aaumYn1X
         yV2WBiGCM5xv+O9uh77hIUS3lAn6yK4I00tCw/0vEXdNN/rWOpXjZ6kP/OeAv1blp0r3
         UMoodZVZD6ILxYwUM6CHlqsubgnuhCjfjzbFb1a4vDacn+sXF/n8vbwJDMMh0tTlBYZm
         cljfrPq7HLZ2hSYSctGGjD8bixEPgGsK4NnNTgxNgSasEENx8gxEDqr19OpFZtnp7z9b
         m+xleQurKLzUQ+f9uMlyujAL5/OWOu6Dj5r27G8y3pX6rOVzTu4r+n4ydBzjKaNX3FRu
         vktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789364093; x=1789968893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IASBcTda1NMxT7D2tV4KSLuvYAReFfZa/VfnrrcpJ3s=;
        b=c0qal37rnANUw0nBMUzwwQWy8qdqbDd553/OdAZVE1FC3ARAsQL3stNKzz6Vn+UOZm
         fw4yjoPsztzW0SyahR8JoBmVH732Y8PZIW7KFsflduFbFizPKJ/YwK6+wAx697Apcf6A
         lsl96Ekg6uqY58po2BmOvrHVLm/HEeVa1nIgUpmvFzeUB1uOjj+1pqzHeecE6dBE6T8g
         1/G9Ep0X+GO5rr4v81gSvmySGc6Wf5Xt3ZjTynC9sC4HkV3PbFj2tTHz+Y+iRPN2Zc1l
         RF4RDMkLWqGtamDUASDjs5laFwiWo0QGCkSgg3CDKOqetgCguv1e9Ieh0CvLbxxXc/55
         arZg==
X-Forwarded-Encrypted: i=1; AKwUvByi1eVPtinTFbrab2oOa0OI2yS2uwCGPVfYf6gk9eTR3lpq6i44b1M89eC8yATLjlgbRzeWhODFnAxshSc=@vger.kernel.org
X-Gm-Message-State: AFuF++ndJfS+TbzjYlXQaR7Amc16hie+Xc93hhT6foVe26/PIrm1eAby
	gRZbcRKJOH2d2qOIGMCPk6v/5M6wkbsL4JmsiQtsbBso1/iA17Q+pU4=
X-Gm-Gg: AYBFou0cb5XNAwymra60WnNrruAie1j3a3As7f5WHvbwiHmYSQn5QgGON/AC54QzAoq
	peIAKfr8oC/1Py2htfg8/gFSqtu+qGdx527YlQ021/qtHeUgH4oxxu75JEAUlTn58lGsUOFx2uJ
	3CIp255D8+cMOpS2XtexUwANkpkcJiKBXO043SPPKZXv/wp07GOsa+cONi4RBqiodY/ZLANf9+k
	wdrZhF72jSx3+Ib9lwgITEOkb/H0nYKrrwBOXxmr/u6cyxPLHoRxC4hh85x/djQxXuFsdJ0mRcm
	UHT9cSySyn1rkJy1pUzwJl/J3tET00RKdtxDVJepKsxK4zH9eip+fcht5YbBqXNf7rNTU6XbkZp
	FysWXYjjWzdCJY9bye0gxnxIzwZswjRpfxO7Ox4ulHCO1VWN28RtH6XR7qF4j3aBhmBPcjOLOcH
	n/+AKSUYiT88rE+Yhiq+IFEuEbR4Og90WzJJi4iGqzHTbSMxkj9sMaYIu6SljJ1fMp4tmv8Mmlq
	YEhf8LxDYpM8eGelYQaV/Vpi3s=
X-Received: by 2002:a17:90b:1f8a:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39dd56bf8d7mr6649571a91.24.1789364092787;
        Sun, 13 Sep 2026 22:34:52 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:3b80:bc61:4619:5346])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994872e0sm19009261a91.8.2026.09.13.22.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 22:34:52 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [PATCH v3 1/4] tracing: Print the bucket size as unsigned
Date: Mon, 14 Sep 2026 14:34:40 +0900
Message-ID: <20260914053443.981201-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914053443.981201-1-donggeunyoo.kernel@gmail.com>
References: <20260914053443.981201-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A key's bucket size reads back negative once it exceeds LONG_MAX:

  # echo 'hist:keys=next_pid.buckets=18446744073709551615' > trigger
  # cat trigger
  hist:keys=next_pid.buckets=-1:vals=hitcount:...

parse_field() takes the size with kstrtoul() and rejects only zero, so the
whole unsigned long range is accepted and stored, but hist_field_print()
renders it with %ld.

Print it with %lu.

Fixes: de9a48a360b7 ("tracing: Add linear buckets to histogram logic")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5
---
 kernel/trace/trace_events_hist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 8af97fd4ee2d..a3eae5c1344a 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -6200,7 +6200,7 @@ static void hist_field_print(struct seq_file *m, struct hist_field *hist_field)
 		}
 	}
 	if (hist_field->buckets)
-		seq_printf(m, "=%ld", hist_field->buckets);
+		seq_printf(m, "=%lu", hist_field->buckets);
 }
 
 static int event_hist_trigger_print(struct seq_file *m,
-- 
2.53.0

