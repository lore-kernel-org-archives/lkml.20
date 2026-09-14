Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C818247254B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392915; cv=none; b=tLJbS3v/A8znu4FUz/wsBZwnMuYC77Ho5tsh/vA+baSziSMwLnfQYvqzXUGDQrCM9XI7vgj3SetfbwuD6Yr/GYhiJElNeos8UWjnaaGPekmJYK19J7qpBUs/OAhQxjlXhgKYOS2Jnp8LBU+x/pae7Tpu+2UrUuTxGmn7T4IYYTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392915; c=relaxed/simple;
	bh=Ci44wgDN0GN7PC0pFLwh2qIUZhXRf/cUbP346xyKCR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwhA55T6/LAKlBS2OLXILfdU0aZaVoP8KmsZDkepxuZbgXMwsn7dhrqqZ1zo7kfOtskYF2Gd25YTmRC+PUFQvXF9HGoH/s2ExaSmB4QQWJaKtsbSEWCSC0wxK2wcJQGnE/9tIlnUWx0TkRF8TPAZOjL5rXwiHMoIx1jx74GdZwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSaJojxc; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSaJojxc"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663bfso384082766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392910; x=1789997710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNT4kKLCYJ3hMXnGWz3Nru1slAulvkgUfWcgV9YmQ6k=;
        b=nSaJojxcV7zQVAi4KU0Fvywgvo5pXnSLEpW2UE0hsSDE6RYr3DVxO5ZFjKbp978nC+
         xsu9G/vkSGKI1THdlz0t5xTDCJJ81sTEtWVMnC9lP1EJO5bQY7ZTof7nBVadKPQVJpmX
         Gxu+fI8CjNfDziuHiyZdPRkswguOYqeKxPYTMTLQVQsbQu5W261d6aoYE5W4CBkHTp5I
         FtpfiM4Gh0Lk13mkdw0RDu9CVW6M2kDP7FuazCGBywznebtLQpBjz4rY0E6THwpJu7RN
         a67qo7DEPtPsT9f4IdgPR8j8Rz0xnmDvCTxOY3Q1fs/lcuwc4uiFYnmG7Xrds5ToINNh
         M/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392910; x=1789997710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNT4kKLCYJ3hMXnGWz3Nru1slAulvkgUfWcgV9YmQ6k=;
        b=hASDOxdj5d+MwUwaaJUDbGZRoPgG15rqNQgEqXuPoyN4JPNr+5HY3/41SbXuX0MDFN
         xbVJ1fQoPeaz1jHVpvgpCD4IknQnv+DfjPbYR3/IN5ckTOyDM5BwSAUNHwlGwd3F1kJC
         4X6zzRe2uciwEFI4q51VgoIN/pHliUuOvoRcD7VHqMy0yMObWpt6z/sFGWxEcraw41j6
         TabeKUNr0pOKysOhnhxvAAcGUzr0S/CAGDI0BysKh8KuJ5Xbr2FGyHnyGEKmoFWACMMw
         Uq7gK6t0OVp4S93egiwHEq+3DnMPmDVDGu2GTpq4hR3reru5L6VclECNVYSNYdlNRH5t
         IZWg==
X-Forwarded-Encrypted: i=1; AKwUvBy6ND6VjoULBaL7iwi786sSFSNrcdGs4dAsA9tTR6N1VJwEqiaCSVL/Dq/A2YLQEaIzFpWGW+TUeYsuau4=@vger.kernel.org
X-Gm-Message-State: AFuF++nGZcbw1vRDg9+GSE6Z4GYvIW+isPhBCtef9Aj1+Tus8OZmUD1O
	noDFGiJiDIMdcZBI+LxsB5SpN/O/B4hU/YJhBrmb28Q237bPX9OOrZ9B
X-Gm-Gg: AYBFou1b1RjyB2MuAMCG2gZjO7uO+tdH4RqmzEUj95Ic7T/ecQLT79Yy56XggWPmF3y
	ysy5RVTSvIxnGTnAuXO4HD89HZ9yxIvuoJ+6C2XtMO6+uDiJgjE8r8Fgz4RRMQqNopQ9cjDdrKu
	2D6Zss4N8YzRYJrlHPkH6EsG8LpwGU/PXUu2TGo/XkXWFqp9EdD+UvysXTORNVILx4mif8Em8//
	ZlyyOZKlMQ7+owehvqvQA5OzcvdMYLsMV8wOTH43dMGOUfCnIhz3WShPDyKTEFAP0xX7hjKaQ54
	gJbqmbrKgDtw9ItaxprkXj0XCqQpfJatck0OtKej+x+5AiC8Dsa8UbmgWtfqWmjwlrwdsdopNgk
	QhWsdQm4rjU/JczHjLX1UvryHk6nYtOC8dSH3Ngt/T7Ay8f376qc0FlJ35LeNp6cQiFqr/L60lo
	CDRhagNA+lWsZ7t6/xiAWZO0ZkejafW6dnUsQrtU8hh0lJPmow6yQnzKllxz3ppE5+r206XiT2f
	PCP/qnrbJqMubztV6bP8Q5TjViamH/xYnhBRrQE6y4wk6piooJMz7fhUUM=
X-Received: by 2002:a17:907:7204:b0:c16:84dc:9607 with SMTP id a640c23a62f3a-c29b86f1119mr352247966b.19.1789392910285;
        Mon, 14 Sep 2026 06:35:10 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966159c07sm441454566b.63.2026.09.14.06.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:35:09 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2 1/2] tracing: Take trace_types_lock when dropping the buffer_meta reference
Date: Mon, 14 Sep 2026 14:35:04 +0100
Message-ID: <20260914133506.4865-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914133506.4865-1-devnexen@gmail.com>
References: <20260914133506.4865-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tracing_buffer_meta_open() drops the trace_array reference with
__trace_array_put() when ring_buffer_meta_seq_init() fails, without
holding trace_types_lock. Use trace_array_put() like every other open
error path.

Fixes: 950032ffcee7 ("ring-buffer: Add output of ring buffer meta page")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 kernel/trace/trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 8658cad53cb5..c8295324ffaa 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -5881,7 +5881,7 @@ static int tracing_buffer_meta_open(struct inode *inode, struct file *filp)
 
 	ret = ring_buffer_meta_seq_init(filp, tr->array_buffer.buffer, cpu);
 	if (ret < 0)
-		__trace_array_put(tr);
+		trace_array_put(tr);
 	return ret;
 }
 
-- 
2.55.0

