Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703165;
	b=0otRemtenVukqk7y4ftXhQV0GINABOSX8iMupvwGXELoRrz7o72BNBwaY8NOdXVLaUBS
	 NjKJjPd84K/zO89+g5co1uqJ1wy7XORHZjiOo/c982vW2W347cp8WzAAHWxYefZc+Z+1g
	 a6cyQKl1to92S77Zu+nIw3wJfTDyADnwxLcZ9Vkmwlg84JH7AD77eWFeGWcllFlTDyFZK
	 ZCS39Ajhw3d73/1kjaOMs5HHpEHsv06frwaXegrR6bxwwheWYtTgeRjXKFVsOSvrg0cxR
	 e3BzKqu6oDvl4PV8N0eIVOM3KMsrHmz+E9grzKfN+7JhW16842Q+7uF7egO34ktRwGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AmLLppEFOPvTRAprkKzlNES6CSqTXbzX5HYhiEOrIVc=;
	b=wDJJ4uyVvaeF5gvPxMkUArq/Njv1DEhhM07mcJhlPu5WTP1IQT5ZlzgcqfQpEDa34MJY
	 t04wxz/v3tvkp9d/RET2jYEy6b6FNfj8WpE5dBrPxaWCR3viYPPMwCBz4LbWe32mWXd/x
	 o9UidGPns72ux9FH2MbKNkXba+An25hh6ycNuIY99Z7P79zrAKHte9OFzZsb8eIlsPVhh
	 JCVCNFDMoH03LDBAAc1ygNrVOcFhUOcrqx1z/d6Y+y2Y0bwyk97rRioTD57dcPIugyOA6
	 hofQ901gxXyde62uoBJoKDBGxHhEheKCdflUSUGXFo78m/F2PAAVbZf3LOKr3iJNizA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="l/DoGnhF";
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02020606A33D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02020606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l/DoGnhF
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-677af43eed4so2082560d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794703164; x=1795307964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AmLLppEFOPvTRAprkKzlNES6CSqTXbzX5HYhiEOrIVc=;
        b=l/DoGnhFF7+ypxBEew/dllCBAZYIA7H/dltmZ1WcY7x7O5Nkb/CG6EvD98YUwIWOSy
         dIVQt27CGjHX4rgOGxXDuU1obvD3otLbmLKVY/eEXMgYkOj71JGZenaJLQnjligFcX0F
         Wt2ogxCmi7+MUtHcbQsfq1pSh9bxqFevTiauym00k3TqHO6poJzx2XdupYeIjFU17DnA
         Sdeyv7ebInjxttZLll5H8Z00iI/KLd0nlSShkmlXXVL5OHkqOETLDt4weZyU1z8F9VAX
         2MN1QpyRMwamArI5jcWa5mYlYyC6xT7rH89uu4S3EE/dj5WIemKI3MpkqAC3UGk1dnVo
         YtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794703164; x=1795307964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AmLLppEFOPvTRAprkKzlNES6CSqTXbzX5HYhiEOrIVc=;
        b=t21zPAk7ibZru1ljuDIUPbQ0uejakBA22oiFu/CpVyglRSrsnf0wrQdfXipAMFem6N
         F0+raz5chMd1gWGGODzmjJvECwZ5KSVI1ZicgBCYqQ+g0YEK7fCNEsj7YjwjfXBEGvYJ
         HKTZXQSFl8P0PbxXQlWMCIVpS2zKyMTLCadH4MxG8BJwJ8kjt6MzqZ9MmyeSqML5hgkE
         vjTlO5ml/ke2DESYpqC6L8W1RUuJ09SwnZQx4gRFg0hk1Fiaw3wgwmMi9dJ+qdATfoPa
         LJQd1e+tmWRV5zK3WPImQPaJQFuZPN/YuZFex9Gm+Xuo0oTprCA9XdV27pJQhEUgK43S
         UYXw==
X-Forwarded-Encrypted: i=1; AL+hErGr+JnGb0SDCrUjwHSz/SHEtxv8ZK4c53eIpdqAyzQiUvV6+J4AkeeYC4ZqnIAX9KDi4d8We1siopXzZt4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i6niTX+noVoMyD38BCfh1wrFzidP9T8j9JHqO4zYMFSt5n3R5
	RqYlWIupeh3lS/tVVRDnfvdgWkjCemvvkrdVPob0lgpQf7sLdPBRFv4byZqtYRubCAQ=
X-Gm-Gg: AYBFou0g9jk+N4XbJw7ja/djVlPLzbtWjkriKEHoRJD/QnsJ2y6DRm1Kp0JzDh7Qq6z
	prsxCVs8ViEHeJhF8klFjgQ6AgRnjaEZlQ9FHrI4K6SG25tvmKoxEdZteXYDx4iWwpruPNFXAVH
	0HErjTW2rpGudB0VvmVHuVMFCBovwONmy5rA/5liJP9BFgjxYOL3pcCYG2gpi/lHzgjEJS+PioA
	VqNowIj4RfdJQS6HYfF0xu2Eg5+eZUTMk4b7TqAqkz5vSsgObjZFStc+kmPnB46nvu9yrQlpXaY
	k3Q7U+xjFyrggw8qVtF9hYfe4VA7SNeeg3Fx9NnJcJ5UWMaT+p06TXcrExJ1WyEcZ6sRKQnvjmQ
	v5aXj6Jwrd5FYIXABZqUjfqwZ8uUO+IoQXkFc/PeKGOiehYfmPxc+LmiqkLh2IWpAwID1ERxHMu
	le+NPe52ao5hRhsgC4PK11Me0R67szL6gJKW31zlzx+kXq8+ASW03jrtcj9ZTn9r0WxalUNWcTz
	ie2JOckGDmJ1njghRMmsjHb+L60WxJJ1rlFbBJxB21eHxnlgEIV7PgiYuTnPH0xUOtC+qWG8msC
	2iMr7CIXHw3ePq9PDzrEueNNAlNej6QJjCtXNvEnerfwhStRgyAPQUnh
X-Received: by 2002:a05:690e:47da:20b0:67c:1dca:80c with SMTP id 956f58d0204a3-67d8971741dmr3150254d50.45.1794703164085;
        Sat, 14 Nov 2026 16:39:24 -0800 (PST)
Received: from codey.attlocal.net ([2600:1700:22f5:3930::a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67db0361f39sm189602d50.19.2026.11.14.16.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:39:23 -0800 (PST)
From: Lalit Maganti <lalitmaganti@gmail.com>
To: acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com
Cc: adrian.hunter@intel.com,
	james.clark@linaro.org,
	jolsa@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	peterz@infradead.org,
	mingo@redhat.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lalit Maganti <lalitmaganti@gmail.com>
Subject: [PATCH 1/4] perf python: Add kernel attribute to callchain_node
Date: Sun, 15 Nov 2026 00:39:13 +0000
Message-ID: <20261115003916.1873857-2-lalitmaganti@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115003916.1873857-1-lalitmaganti@gmail.com>
References: <20261115003916.1873857-1-lalitmaganti@gmail.com>
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

Scripts that convert callchains to other formats often need to know
whether a frame is in the kernel. A callchain_node only has the DSO
name, so gecko.py guesses from names like "kallsyms", "/vmlinux" and
".ko", which misses kernel DSOs named anything else.

Add a "kernel" attribute that is true when the frame's DSO is a host or
guest kernel DSO.

Assisted-by: LLM
Signed-off-by: Lalit Maganti <lalitmaganti@gmail.com>
---
 tools/perf/python/perf.pyi | 1 +
 tools/perf/util/python.c   | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/tools/perf/python/perf.pyi b/tools/perf/python/perf.pyi
index 087da00728fd..5b68d70c5216 100644
--- a/tools/perf/python/perf.pyi
+++ b/tools/perf/python/perf.pyi
@@ -353,6 +353,7 @@ class callchain_node:
     symbol: str
     dso: str
     sym_offset: Optional[int]
+    kernel: bool
 
 class callchain:
     """Sequence of callchain frames."""
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 902157c472b3..3ba3ce0e651c 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -994,11 +994,20 @@ static PyObject *pyrf_callchain_node__get_sym_offset(struct pyrf_callchain_node
 	return PyLong_FromUnsignedLongLong(addr - pnode->sym->start);
 }
 
+static PyObject *pyrf_callchain_node__get_kernel(struct pyrf_callchain_node *pnode,
+						 void *closure __maybe_unused)
+{
+	struct dso *dso = pnode->map ? map__dso(pnode->map) : NULL;
+
+	return PyBool_FromLong(dso && dso__kernel(dso) != DSO_SPACE__USER);
+}
+
 static PyGetSetDef pyrf_callchain_node__getset[] = {
 	{ .name = "ip",         .get = (getter)pyrf_callchain_node__get_ip, },
 	{ .name = "symbol",     .get = (getter)pyrf_callchain_node__get_symbol, },
 	{ .name = "dso",        .get = (getter)pyrf_callchain_node__get_dso, },
 	{ .name = "sym_offset", .get = (getter)pyrf_callchain_node__get_sym_offset, },
+	{ .name = "kernel",     .get = (getter)pyrf_callchain_node__get_kernel, },
 	{ .name = NULL, },
 };
 
-- 
2.56.0

