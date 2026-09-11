Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43644A9D6B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789147835; cv=none; b=cA3644XQu+BYcHxclIjWhm4qE9kA2UsVlLAUqAcaSPnVORP6yrJd5d4EOFmEUKE5psAagZLgQ9wP5zp4FYEgUW//ZmCdiaEZrKb8opWhVzInfNhe1xB6XOBQuS0Aud3ehLkN9+hFlF9WLW7Fx6YlfI+rl9m+VkHTfCTRzIp5az4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789147835; c=relaxed/simple;
	bh=wZoeVUrftPlQaurfDqG6r5wYQjGYza/yP2ACVLPNwQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=niXXwweGDfnrMiQ4j6HAJ1W67J3PA0sGAV3sEX+nebNgdB1KblFwC6pUOIyND1nxfJLsgRed/eLdX4HvkfAyR6leYcgi4lPL4VD9J3ZMrJ3XeOay2hu+Dy8gq7bZ8whVGLtmGM8JK01gHyHu6Pg9mA1j1cUIUwffjh43NF4xZe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qqg1jqar; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqg1jqar"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4b29fa803so225946a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789147828; x=1789752628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqzBLbk19E65WkhLCrg09mnABUiyrWVl7DuBIaVpsz8=;
        b=qqg1jqaraKKYbjdmdukeSfbFoPSzZxaypZZRqSGTGMh2ccHlQgCvQvf2JedmjVPy4c
         T4baBRR8cXV7qEpuGgzHbtVh4oF3F7FBXA+fdx+JClVxyAIYw+I+r/IZzc7zwSIFTu9F
         OCp0XjYeu+NpzBb0oO2b0GmFgnXBohI70lSDzBGOjGS21gOGRvVbXcgFGfP8nNVdehKf
         Y9GYjAmOy9qS+2VywW44QozBjSDlxg1888WDAF3plsMWbExdjKgmQ8lSEPUA6WL4WKNF
         8jfZc2Cu3rRF4SaIhkpMNc+Lm2yIQ9NNumirgB7XjVGSZkf6X7un4FdhpxWgu08DuJHZ
         NDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789147828; x=1789752628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqzBLbk19E65WkhLCrg09mnABUiyrWVl7DuBIaVpsz8=;
        b=V8/+WSgSdWJm3kD9g/i96r1r/zumFbUZU0sGufIOBh5h0E/bngSK/oA3WOPRp+sY22
         mgofUByUA87wQ5JwkUbOeG9p5dPlweER6MpzmWGyxKCdpEW+pn8Ypt90f8ENFh2Igb3g
         fVxCAn29uFJ0Up4Mcj9RDujPlFUbG8taDkXcZ/MKIfbFKWR5zbjegymOev9cMJj2F4Fm
         oBDJhNRtwc3PwpU82Pok+5Y0An5QggzHEkoaQTol9irMTe8KFGguaUr53sxAyF5wnQmC
         xTaRN5Nrk5Ig1GYPiYAq02OmHjsdQ5yZr2fncR73pcZ7qcgxOOfyEA1hNwyYP3z+92kP
         ZZwA==
X-Forwarded-Encrypted: i=1; AKwUvBxPdLyVHQqymOt/9OUr6t5U8SqO6cP/EARMOU6SGv12NuF/kqO/f14m+/nH8YLbkujAGi7L7AX/lX0CHu4=@vger.kernel.org
X-Gm-Message-State: AFuF++nGFcg1jrPUq0RS1VHO9yvci9B3aKZNPjJ9scTIJVHeBRSHIi4J
	EcT72jIC+nhr+c3G974NxdNKDfj8BefBIDkWkGVhAnOj3flMXEHgJY3+
X-Gm-Gg: AYBFou3gtsHt13y/wOS9428j0bWD9v0z0iHpPFnOa50K25jPu/pg/7wZJ1tctKJMrbU
	T++Jf7fA0cRqP2GfP+vK32qgEPQSi5wpMYQgmdFSA79ho9yOYnpXj1ShBlpiN5q6vcRI7sdC9Fn
	DDbfw/kVVzfX8F/fgTX3pD+ypSW+ysqEA00J1jlkKhZy8Jhc3vy7ZlVs4mfJSFmICskkDz5PHG2
	tailGcnCbv5Prxf0++QkVZ073zYG5yHAEoUdmMiqHG7ln13XtxO+r3yQnBi56QBxu+NkLLcYKXq
	y9peFQvRbJKXVkDCL5BcngMp6s5kr4YR9TlIlatQZAWu7wviiTNjx6L3f3bpbBklKZRhQdMpp8J
	ttdWWSI+2GeEnxo9Na++DGk4FXVPkRjyPZf4TYfSHuma1oRnyQpQP1ZV0GdXYdmP9+V0AQxcj+k
	/0IXQmEXBo4iD6MH411crFxEpKNYZUUswpkpoZQqP0oldXnXrgaYlYhunq740QaQs3JDkIRIxg
X-Received: by 2002:a05:6a20:6a1c:b0:3cc:faf3:331a with SMTP id adf61e73a8af0-3daed1a0776mr8903054637.10.1789147827603;
        Fri, 11 Sep 2026 10:30:27 -0700 (PDT)
Received: from G15-5520 ([103.206.144.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e52a60sm7710158eec.6.2026.09.11.10.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:30:27 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>,
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] squashfs: replace kmalloc_array with kmalloc_objs
Date: Fri, 11 Sep 2026 17:30:08 +0000
Message-ID: <20260911173009.57716-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the remaining kmalloc_array instances with kmalloc_objs.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 fs/squashfs/file.c        | 2 +-
 fs/squashfs/file_direct.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index d83594ce91d2..8cfedc766256 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -588,7 +588,7 @@ static void squashfs_readahead(struct readahead_control *ractl)
 
 	readahead_expand(ractl, start, (len | mask) + 1);
 
-	pages = kmalloc_array(max_pages, sizeof(void *), GFP_KERNEL);
+	pages = kmalloc_objs(*pages, max_pages);
 	if (!pages)
 		return;
 
diff --git a/fs/squashfs/file_direct.c b/fs/squashfs/file_direct.c
index 2c3e809d6891..ca1af243f064 100644
--- a/fs/squashfs/file_direct.c
+++ b/fs/squashfs/file_direct.c
@@ -40,7 +40,7 @@ int squashfs_readpage_block(struct folio *folio, u64 block, int bsize,
 
 	pages = end_index - start_index + 1;
 
-	page = kmalloc_array(pages, sizeof(void *), GFP_KERNEL);
+	page = kmalloc_objs(*page, pages);
 	if (page == NULL)
 		return res;
 
-- 
2.53.0

