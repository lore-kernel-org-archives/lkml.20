Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6DE3542F8
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789198377; cv=none; b=hMj8YFgfI0X4FZb5SjZe2SvXr64kDRLZHpEPfhATRX5NQtBR9wfeRc+CvMr8T7oTtlD7KbDSEVje17jVS7j1zAwioOwyqBJswbZ1wjfN6e/aB2h2vCtMg5LT9Fqkhz1d/avvmSEWbUrdaiQHeBDvT33IuYfYCfG3B3qXpjaqdb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789198377; c=relaxed/simple;
	bh=hv+yhPDSVXbN/UnNVte7CYCKc4E29DeGDcr2LSrwiK0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RTeXyBjkQsq4LcJsqa8iqm4pKxjJQQXGn6BzGxr059pX0e30b8UfJeOvon/n4VFuTivOzs2LTUPMctFrE0mYVKLAa84BQ+rkWkOWXf2GP/WvHPpDger0jP1kP7BoMG8EEfxEGlzt+g9qMrYQdO8tNrkyBh2vlAg16zEqwVGUxYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMzSxrks; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMzSxrks"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so205422f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789198374; x=1789803174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dFc0Yt+Kj7ZATDq5PSR3LiOH9LJ6g1QqaQN2LWwgGw=;
        b=LMzSxrksZH/Fl1mqdcKmJA1PYHRltIDHdzB4M+u0xkdLXP8bD1xm8UshsRIBXL6uzp
         OMN51CfwBpOcq/hTpX5vJTA52sG375zBIsCenRm4QDqeoa9dzQdFOsi0I5/o0+oCqVrb
         y6nCMOShforaRkAElMaPPcyL7F+7dL2KU+Wfs/zoh6LzCeEh1jxrlY0aVmtnESKDb0Oj
         H1wU5ozsC0N9whyHhfNh65R+2c989ABH28kgoqMyE7mSuY86QdpU9oU8cc3NSRJDCjkM
         NVudAx84vOyHTCkskzzASGInncO802taZK8clGQNE4jsd5V5c3ktOb6aIfXydsYWDt6s
         V4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789198374; x=1789803174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dFc0Yt+Kj7ZATDq5PSR3LiOH9LJ6g1QqaQN2LWwgGw=;
        b=fxtpmgdgmlFT1FtgN/1nIgNkzu+uNO9Slboj++Vp09CAUd4pb/ieLW0IvqncUSY55X
         GmVUVozPgi3P+QY5tQ7aJuyWS7jeEAjlvGO7vCfk2jOZev/MmdLPWmPvWySU8TcoOlvI
         ti0eZf56Q2VMzjUb+wT6mWWp6V7HJF+0RwbZDcM7f49qeffJwBcXMd7GHVU+TmR9mOJk
         UjURd/DjUViuCmEjVPPr/DDFEhdnT3bHaZOKfb5NV9g/m3SpabJpULdqFLJOEgpVqPsW
         i/M3oP4AWUTqBBg2lU/zqkMrdv0Vbkc4MVFRcUqpOhlCtgzQZI0Jx3NkSd37Czj5zNco
         eFzw==
X-Forwarded-Encrypted: i=1; AKwUvBxxybl/CHmO4dIZ48ELLBwcaPo16RLXv04vVskAdPw1QXRdI0zTk7+QEYjA7CLLZO2PLAoS5F+/lis9FMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mbCO7ghD8OcqcmJlewh2kNx6ECaLn00rlzs2+aWE/iz0iMDGtL
	Tic54ULjZbAvOaNZoyArMDn70WGD3fAWr2ToW9+6ar3fPhNMuDErmd06
X-Gm-Gg: AYBFou1k1EvqDgb/Z6BoLil/xzLSPA5xF1cI8Pd9cB4zhSi+ScNlB0WXQJMwLoeZ2Kx
	adLZqak0a0k9KlTc0VFlnwTp+YJXAn/UgiTrRw1m1La2VABFH5Cdz3SniJcoRsTO197thS4SXIa
	uhsvwx4ecbXSN22Eu5gU9QZjWTgOxf94meCjxlPU/bY+qRstL5FD0hLwfCCx7QqftcpvtT4CAoo
	iI2tGKpiYLM3BtTKdJO/8otBz3li+JYWbk9hdcZNz2WAyy98zA1FgM3FH2CPuUWpwrapp/phEML
	g4iJcwKDbWrGGwX6TzkmI++c3DgTZIyASAjdFCI9tMHV3I3E2cv2IWOr+5w9bpuiZCOnPxXqTtV
	LI5LInFqbdhKrhcWRMem9UlUCU9bVliekRoEg8QplqWfuel2R131zTfCHKlQSvXEX0MNArjMGeR
	RbkxWEEQu4p2uZEBuR/NaA3QTjIC871rM7NryEOJNkTLu6C3JQjBA3sqJIIKjrNx3GFmKPkBRt3
	bYigAClSkkfKyqmB37D1F9df6SZ6Qjk0ToYWOQOeIas8nmBeDo6YRkl3D2TVvU2n3ZUJmXOre/0
	QQavXMKcTqrGP/10Y6fxhp1tmKdDVEq6RIWrOef5J2nPP3yZpJhcLrxm56rL5A0X3XOCuf1dKIv
	1i36Yf3bC
X-Received: by 2002:a05:600c:3b03:b0:49c:edd2:855 with SMTP id 5b1f17b1804b1-49e6caa72d2mr15036255e9.6.1789198373741;
        Sat, 12 Sep 2026 00:32:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e71e300f3sm5495095e9.7.2026.09.12.00.32.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 00:32:53 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Brauner <brauner@kernel.org>,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs/vfs: Fix the struct file_system_type copy
Date: Sat, 12 Sep 2026 09:32:50 +0200
Message-Id: <20260912073250.51074-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit dc651e25a6d2 ("fs: RCU-ify filesystems list") replaced the next
pointer of struct file_system_type with an hlist_node, but the copy of
the structure in vfs.rst still shows "struct file_system_type * next".
Show the hlist_node.

Fixes: dc651e25a6d2 ("fs: RCU-ify filesystems list")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/filesystems/vfs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index d3a93eec3945f83e057fbd6bc3ce519da03ea66f..56c68f4aefbac6f7be979f5ebc2a0aee886e13ae 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -117,7 +117,7 @@ members are defined:
 		const struct fs_parameter_spec *parameters;
 		void (*kill_sb) (struct super_block *);
 		struct module *owner;
-		struct file_system_type * next;
+		struct hlist_node list;
 		struct hlist_head fs_supers;
 
 		struct lock_class_key s_lock_key;
-- 
2.39.5 (Apple Git-154)

