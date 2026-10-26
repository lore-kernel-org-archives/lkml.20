Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992910;
	b=3r7P1o8CcEFWzrknwytnI6Pdq0yi7BZiIZe2nO+kqIm6IqCjVpU7sN5U08ZzLqpk7IeW
	 sZG1VxpcYWz0OXWiKn5p3MLuonE1NpP/7IHptOlqlKRTiGwne26o+rZok85mRLzriEyhm
	 0LrgzvkRLiciK89hwoazF/Iu547cAG2mJc/3D6zE47pn2zrnNsMOgYUFXjnb//GjY/DHA
	 v+5BbBvg2sl/87SHZoRyM1Aj8Zy73IBC/Gchq9kIILft3DTQ72hlQ0sKOyJOMOlULfR0Y
	 gALle6dxDBKJHPgJuisyf3lv/BwxBVQDeW0yhA5UZNksHSPDtUwAYLjnZlVhbjfDeYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Z+u31LeAmcZ5W5bBi317MlxpfwHqN363dhzo0vXbRUM=;
	b=ybq+U9BDaz4QoJiKxF59CqgB8F3DilImhekwEcqm8wztKJ2o+rgYWvIftKXVFPchs3Gh
	 bCXKbyNgy5w+8yofJdMwtQVYiz01T6F6pHJmQIhQOCPYEvIFXyikFP6Xl4D8wPxxomWg7
	 OjsdH3OBQiMz4ZoJdgPqzn8svP9lFRKNTybwoWWbIq9AWp59kSsvhulGgZVlCjUMQD0Zj
	 gbi+CoxEiOHtIj/lP1ZlgH6s7uioJFOvQROplTbzMeVRge8I7zx32V4ciETVqSkOn1joq
	 XpSH1M70o2POlWmUdtuBqPpe4FPaDIbgaMdOa7wUiWXz3NHiUKllz5wNm4HGkkrTcVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AUHW7wq9;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DC8606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74DC8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AUHW7wq9
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1870184a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792992909; x=1793597709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z+u31LeAmcZ5W5bBi317MlxpfwHqN363dhzo0vXbRUM=;
        b=AUHW7wq9iMCiWOoaHXsP2JE+3GaHH4Kg39si/n8BlOG1XLsyTAFJI5i4UdZRR5wjiV
         T47waIdDXHONNSAuAcQQZRTNvIhbMwF7r4eF1h/kV00Lhpj0pf+Lnk7rknGUVG8GiBuI
         FFMuNckhxvZfc1cqIrdanMCLF8/QshKxfEycbonZjSQaG1GVi1rqzfb+KaI4O3X+e8PY
         WX2oJt0JwjRVNJsgfeRpHge2h+98ulWIdL66UotVx1mVPerq0G1WClHFmDLOfQepwGZq
         +hWiH8OneIeu7he4Iwk/n5Joiz8upQqFaT8gWPiXg2J5WmKI9u8vyZPt3EqAfRl7cIeN
         +q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992909; x=1793597709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+u31LeAmcZ5W5bBi317MlxpfwHqN363dhzo0vXbRUM=;
        b=qFod48U/KFF9WwubiFWP4VbyO6JiezklR7+G+fM0Mvol/29UneGerGe6EgY3r5bFJy
         1Pahh8svnW4wmrGbEHlrBQcUI52hifsA089eaV05BavL//TUr0SZp8HkTk98qu4hatG0
         AiE50/n5yQifx3Yel8ik4LrVaLaSq30Ns1dA2Fii0ghmCu3fHmObUl61w7QaTOgQiqvS
         73S9CAJxfFID1a2sq+M2OHaucyUyNaHCtEP9Sftwb6JZg9OlnCK/85+tL7kHQ/5m//JA
         5hsej2Y1sa/OUqH1uLqqrvnYx33fS5fTZT0+Dfl89AnVxPZKxF1prPU3RDbJlr9bBJTw
         hsdA==
X-Gm-Message-State: AFq9FYIw4Zln6GmlMatJ/P+Vi2EQPU8uixpE+wq1w6/IdWNWY/MBoxI2
	4fbE17S6sLWY29yeCupC/tkXYlTRyB7RRVjO26tLOLT9wQAt2l8dGhXT
X-Gm-Gg: AYBFou3h3VOsdhGKw0MMx40+vFP6KiCKAC0lLo90XPyQA8Md9C2ol0TB09kBzBbp2V4
	BY94JYo2ieRwl5ui591TodWAQYqmYkrwkhdEFjyGLIH4lhIRe3jeYuNOY3BXgV1+4hQ1SUZm+kA
	S/d2PloWyzEbx1dVQlgc+YDPgcsvjzBhO8v0EeGnC04nsVAtJ0mBk7azvx/HDVBE0P1/z6jDBe8
	B5oQm8sc/Vqr0pzLLSqoFvAD6s0jBlYdmJuD55FnpkpNusIxfxtcP2Eoq3Hlmllo6VP0vig/FMt
	sBx+24//CrO4WJtaPQ1/jy8I8HqTsjwuDYgEJtOv4ZRA1NYSeVZW6P6HYPxi2tNTQVcUYm3rzVj
	aAqj9QS1cjNeZUxUcaocxsPS4ztXNpR+p1XegY35eajmrBRUcfUEh3xYQbIwHd1l3oPaOrb8HAB
	s5l+iJ8dEFyOWtASqvnWqXeOk/uKo5xmEbp8IsuDmwSju0V42VxkxWTETli4eC19FkcdCXHutxl
	ENg38EVF45ZyAESnJiNyobJElEIlb3fFLUVLoFawpRhzZhar6ECZ8csGsw=
X-Received: by 2002:a17:90a:ec8e:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3adeb0fb5fbmr4521956a91.41.1792992908735;
        Sun, 25 Oct 2026 22:35:08 -0700 (PDT)
Received: from fedora ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm6947614a91.12.2026.10.25.22.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:35:08 -0700 (PDT)
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: linux-xfs@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH] xfs: fix unwind handling during xfs_mount_sysfs_init()
Date: Mon, 26 Oct 2026 15:34:55 +1000
Message-ID: <20261026053454.987673-2-wilfred.opensource@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

The goto for failing to setup /error/metadata jumps to the wrong place
in xfs_mount_sysfs_init(). Fix it.

Fixes: a9a7b9e8686d ("xfs: add support for lazy direct read bounce buffering")
Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 fs/xfs/xfs_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_sysfs.c b/fs/xfs/xfs_sysfs.c
index e77917ac179d..4a6a8c92c3a1 100644
--- a/fs/xfs/xfs_sysfs.c
+++ b/fs/xfs/xfs_sysfs.c
@@ -906,7 +906,7 @@ xfs_mount_sysfs_init(
 				"metadata", &mp->m_error_meta_kobj,
 				xfs_error_meta_init);
 	if (error)
-		goto out_remove_csum_dir;
+		goto out_remove_error_dir;
 
 	return 0;
 
-- 
2.56.0

