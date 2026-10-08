Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C6A4DAFA5
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473164; cv=none; b=nxyXS1Ue1oZsFJMbfio+B3XbnUPhIPbub8lajxHGbchPsKHonvmWqUW8qHmFnWNaBt0HwZZJwbg84TbbNOdwauGhLVyhtStnM4q5TD2A1GRDt06jlZbq8TXoXC0ymoI7pID1itzbxpiw3JZkmrUwqLD5bUCpNps96B72Qn9hT2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473164; c=relaxed/simple;
	bh=TrVcGHbj2TtSqdQJyHLxeKivTSFUEkce/cKcVLryNGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8IW7K1gQSxnkYsD0hUiACB9kT3KPXdUIqyFf0v040wH0PCEnOirXMM97ITmEjRcZVg9EIyZt4XR67unY/PUx6cTm8za3BclxnTjuvIwT/wpuk2sBOf34RT99qrbrenYFLutMe4tMX4IjooDTBlXhAT0ulJchn4D+E8JYJ27Y84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EelizpaG; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EelizpaG"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd15c885bdaso64223a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791473154; x=1792077954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n4w9bZBZ+hZ07uC6pPSV2O57YUginTevP0JitdrcPK8=;
        b=EelizpaG98H/6ol4S6fWhXNCASN6Spw/+xv46ntz72aluG5qpEKTM8KUOCHTj6l+Yy
         Y0dEEwHjgzIXrBOmwYuM/sv5q7rjpk+vDwTnlxG6XoDZXjfJEpsHzZXVbh1THh38X+I1
         AHAlT6MSgNxEl+2mQjOhVMbVeARKaLEF/EUL7pUMA9jAbFnezzx0RHJLXvc9oJe5jgUM
         64E/EY70jsnovJ8wSauteR6BUsT4QTaWkEeHN6VrrRl3iBBAuMAy342dzRrexn6vPGnu
         kqhXfPpKPeeqWH0FmRt7QvqREGZba326f1rrjsZFukzXdWe2IN9XLvbOq9Vf1NKdxObm
         r80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473154; x=1792077954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n4w9bZBZ+hZ07uC6pPSV2O57YUginTevP0JitdrcPK8=;
        b=yoL8S4xe2zZ10ZvY4FcNI50HRt4BZkFV7dDTtpiIK09JamH8RNMArzCiR7wezuWJyl
         yhZwviFCDKJ0qoDh0BcswCnj36M6q8fkZ954WB5pHjH7LliH1J3JMSV6xKPsiB5NMUXA
         a96jo2HRg9uswHpNL8/Lik0QfKHm/d+3HtkvWYbHUJnTrwnHfjjHrSOFw5dun58C9zll
         SnLwipmhj7uc6ve+l95Q4ZT0vbKQvjZxe9QPAzg+pGFn4H8myx5m3NRz1Takjty0EHxk
         ZkZY5Ee74OY1hIk09dLHVQiLaQFs11B+kgQy8TxzGgUP4NK3bOKmiARCiKud61yi5KnN
         OquQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTH/KwQhScTL67qO0avUVlyIMh71dCPENpLvC/Deoz9k88SJdVI5we6Cbi05eLmE6h9XpkCv6O0WmAgmw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMmP0RpGZRaLxJPrkkGwkndhL8civr7CFDcQlVuZH58HhCFGLd
	D5P+Fh/Up3c3Vabg565TEetB5vfaqKzCUxcq2FzUIAaMr5CERrizxKfp
X-Gm-Gg: AYBFou3q/pHJfijPRUpop2feZnjurXch3MP6mdRaHoQ0YP0Zm9Ygjjo2uAyx6pjnP2c
	Ec+zfmwyKxAkaCi+RR/3Q8/pkKucGHpeEFg+mVKGuh1rs5BZewDTlGcPJDybTBMQ31jnODsp49r
	Xi4dtmL0hKRk2NzIMF7QWB7wkbFHdYrko04/GNNiT8kAi6zi0L+48w5A7nW2AqIJmELoFR0KVsR
	xK6jdYnbyyMQHw2Pi4ZSj+zmVulsL2Mvzb+mTiaKEomXnCGYU5OWwKXAcgPloqDl46Fqufljhco
	T/kKUGqAAsYZmLelxXeDb/CbTSbf4Vm/eR7Zysl00D8ciLPAZormxwiWw6+kW2fOrUVfxZ1vqJR
	R5cJ+7jiXuJU25L7wyyX1KF6jNE3ZSEzWRP7q8QgSsB4Ob+on+BbFoHTPdAqbj6+v8x15e4n8WL
	QWN8qzwiM+0PEizQeBd4Aassg2uWtA56Zv7Y9lbjJME9rWqCfUnY0ChWPbOGXLZ+mJqFnURnlZj
	O8=
X-Received: by 2002:a17:90b:3b46:b0:3a8:9db2:a59 with SMTP id 98e67ed59e1d1-3aa7c6c21f5mr4045344a91.0.1791473153896;
        Thu, 08 Oct 2026 08:25:53 -0700 (PDT)
Received: from ser8.. ([221.156.231.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1c17b63sm5554792a91.12.2026.10.08.08.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:25:53 -0700 (PDT)
From: DaeMyung Kang <charsyam@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	DaeMyung Kang <charsyam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] ksmbd: return end of file for reads past a named stream's data
Date: Fri,  9 Oct 2026 00:25:35 +0900
Message-ID: <20261008152537.4147299-2-charsyam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008152537.4147299-1-charsyam@gmail.com>
References: <20261008152537.4147299-1-charsyam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A READ on a non-empty named stream at or beyond its end fails with
STATUS_INVALID_PARAMETER. ksmbd_vfs_stream_read() returns -EINVAL when
the offset is not below the stream length, and smb2_read() maps -EINVAL
to that status.

smb2_read() already turns a zero-byte read into STATUS_END_OF_FILE, the
status a regular file returns at its end, and an empty stream already
takes that path. Return 0 instead of -EINVAL so that non-empty streams
do the same. Clients that read a stream until end of file otherwise get
an error once they have read all of its data.

The buffered copychunk path converts a zero-byte source read to -EIO,
as it does for a regular file that shrinks during copying.

Fixes: 2ae1a6cc4302 ("cifsd: fix potential read overflow in ksmbd_vfs_stream_read()")
Cc: stable@vger.kernel.org
Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
---
 fs/smb/server/vfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/smb/server/vfs.c b/fs/smb/server/vfs.c
index 74cd8007a..ae9f9a693 100644
--- a/fs/smb/server/vfs.c
+++ b/fs/smb/server/vfs.c
@@ -269,7 +269,7 @@ static int ksmbd_vfs_stream_read(struct ksmbd_file *fp, char *buf, loff_t *pos,
 		return (int)v_len;
 
 	if (v_len <= *pos) {
-		count = -EINVAL;
+		count = 0;
 		goto free_buf;
 	}
 
-- 
2.43.0

