Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9074758596D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156581; cv=none; b=FgKoSf2fH6blAlwDtZBDj3piVuFI+7E6hJY5VGSOpX1AXRkENUOF34L1aLA7+m6QvWZ3jyCv+SazwSVgqIXpnoVCXS58VPl/b/u8obsq27wTFYaPSkzu3byDmBzX+fn5mOmFBsyDMmySfvu8FBcwCJMj26Fv3SVuaaG9R/9Ic0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156581; c=relaxed/simple;
	bh=MuXg6y241kQAFFXgtK2Q3UkQFZr1v0D+y3gdcjdSvI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tZnSCsdAzdHk99Pids+MpgVepG+MGc62g2Bp1GZdu1uDcKdQ+3ap57kOYgJA35PVpHGCZnlhrW+JqCUCyeko4aaim2rpd6NllxyDS8KFtK1mZGGp6ortxr+p6r8De2C9t0Qz9Deh/CClhWSg2kywuoE3G72ojoIvJ2lgBVGcl98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNN24k9M; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNN24k9M"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2637dd37c1so198004266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789156563; x=1789761363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VbxJsFTbQ+RydGePFrpF5dFVh+W/MFXSp8uy2MJMaaU=;
        b=PNN24k9M8dVAGL8x7ciTQZ44C20MJ8Kj2jfC8cWHrn60dNP5vW6DzIwEI95FGciRUr
         zVDqyAkqgwGWNqsAAeJEXUkoNllXuMG0h4OKmnxE6ee1Vm+HrAZ1Wm/trBrOrzfYm9fo
         QrtLKwA9yrsg1t5oD2NFqn936poJJgcZidGWT+LRjFrLm87ikyxRVIDOnXwsjQQgC6Z4
         4M8PYa++upd5egNnZ6qJ7wTMLxTnj4g/btxW2u0438RDq6EsIf/yMWgmzmUdIn/8cs5l
         AvswYJrh8qSRdRNnbZglzvycyT8qOhYRAFzJ7B4BGePPICvaIu+533364JEOc96YGFig
         dPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789156563; x=1789761363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VbxJsFTbQ+RydGePFrpF5dFVh+W/MFXSp8uy2MJMaaU=;
        b=Lu3gkHoG00XVk2IAVGD2VrA5ZlXHnDwtL552xCo6aOOfhoMuM8wqBVfdrxUwaZaL+D
         3OoN29vYjWaYE/UHKatvM2tsOym/4sE5OfghEKl1++cvsgWOB7zkzNlnplMiNrU0Z8rU
         D6QgXO0+M6r9IYq73+QEAubS4K8ixEV6aZ9IvaZHq/iJVYi0NosKM3pu8DzRcIl9TfN0
         5U9sPT2yr3Eg2Hf/xhZN8P3Q88FPVjx0/GTn/1cXZ/YPsA6tIpPIQG8qlttPX2A3AWTT
         bKv3Wxfy5aZZRbORw63C0tCE78CLUNL7Z2JoxjeaGX03XGepsUxoknk+4t2dPEC8ZS2i
         Ktig==
X-Forwarded-Encrypted: i=1; AKwUvByoD64JjDKWexMhH/5vqMi9AB+skCT3kp7iWWlNIQtFysHqtpjFVUwLEL8cepaCrhRDbPA/qw8xmQSPRXo=@vger.kernel.org
X-Gm-Message-State: AFuF++kfIKeIm42uJ2tAgDzQVaYkCPH5DWTsw9m2VKCzpgiuBRqapNiH
	3RPGlUMyGF1KIt7xoQ8KnhUkL0WvocgooQ1PDacAJjxWhwjfffMsiiLG
X-Gm-Gg: AYBFou3cFdWK0sh6SQxcCm3jjWN+peI/R4jfqnhdFEJ7lYcsXIajsI1Zgfh8t59sQjw
	eQZmZ6btwwH72lMWC+aIJ6SdMypt9F+CzkZD91vnD/7rOrwYYx+GJKt/PSHNQPImGIyC5tPsUye
	b8soh1x3we+jTwEXctem+JtG9Ajc+ICAZeqPqaTOnjIEGlGvCZ5zYyScGKoYCPEI1HNGacQcgf6
	+8vkGxFcEn7vXuCXwU/hbdhZJWsYpq9N+xnDSn4/ygheH7dr+r065pDOVmnW3yUdypuHuQ11Hxf
	+I+wvmCI1ontl37fi497KVXTW6J4mgGT7hyH9iIKPbIEQPJRzV7UfqiMVghU6L2zjHNVrOde2ee
	x3Rw95+g2qDVwm8pHUp3xPS06yyE7ipb4anQUURlPgQom9nKDflZEimk3I6wQYMdblaqGSo1tYg
	GMIwCeQFrHiGqEWAkUe8AiKWJS52f/9dowrqDEVR20bsSZFpjZR8mXWO6io6gh9woQziTTHH5kF
	RP1SdIyUXHhq10dF/9uz84Piw4K3TMiyxIWt0vs7vJHo65LYv8nxXAoL1g=
X-Received: by 2002:a17:907:c28:b0:c25:34c7:44d1 with SMTP id a640c23a62f3a-c2966235aabmr287609966b.0.1789156562685;
        Fri, 11 Sep 2026 12:56:02 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm121013966b.1.2026.09.11.12.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:56:02 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Martin Kaiser <martin@kaiser.cx>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fprobe: Clear the unused part of the fgraph_data reservation
Date: Fri, 11 Sep 2026 20:55:59 +0100
Message-ID: <20260911195559.230709-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fprobe_fgraph_entry() reserves shadow stack space for every fprobe with
an exit handler, but only fills it for those whose entry handler returns
0. fprobe_return() walks the whole reservation, so the unused tail is
parsed as stale headers from an earlier call, and an exit handler can
run twice or despite its entry handler asking to skip it.

The original memset cleared only (reserved_words - used) bytes, and
commit e0a384434ae1 ("tracing: fprobe: do not zero out unused
fgraph_data") removed it. Clear the whole tail.

Fixes: 4346ba160409 ("fprobe: Rewrite fprobe on function-graph tracer")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 kernel/trace/fprobe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
index 1e9b00997ff2..bd84a982961a 100644
--- a/kernel/trace/fprobe.c
+++ b/kernel/trace/fprobe.c
@@ -635,6 +635,10 @@ static int fprobe_fgraph_entry(struct ftrace_graph_ent *trace, struct fgraph_ops
 		}
 	}
 
+	/* Clear unused slots so fprobe_return() does not see stale headers. */
+	if (used < reserved_words)
+		memset(fgraph_data + used, 0, (reserved_words - used) * sizeof(long));
+
 	/* If any exit_handler is set, data must be used. */
 	return used != 0;
 }
-- 
2.55.0

