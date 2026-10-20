Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506972;
	b=y8riKdflRf1s5D3ArHpLeonogOnyFPUnjzGzqaztP6p3WiIqfnXuLl4D/TmVoc6s6P2B
	 NfsC7EdaggEz5aW1X+evFq0++dgTsXcY14vcE8FZpnnawO3D+gFtgA1MsugEo4sJ/vssS
	 GDNmRxAqi83IzVEma2EtqsNwsYAou0Ow5ws41Pxr9ajcaPXrM9MeRMlx2lhT5TQyzv6RL
	 zQb0a13BX0kceZcNOaHPrMuu57N3+dEJnYVTcn97uTO6QbYtglGVU97a3iY8UYFLdu0+V
	 lO6SQw8dEFLJQVXgIn+UB3OJWzFmVlwsa6k7L9EsSoz9La6Qb+YG5AA2/iIJIs00UIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+2iu3aIJF32cGS02KODg//wkIy9/0jNAnx60DBj5Tuc=;
	b=taakRk/vS0U51Bf/4nn3M6ivbNIKeVhWlwkAVT2luiNcBcOzZWLq8D6SW7FaNy2I1msa
	 KdWIQmdvS+/LA6yTjWJ40gVK29vsZ0Wo8nnj1/xgOc6TeEtQPqtJaO+VTVJysjo/rbmDB
	 y7O3udzZyTT5UXzTfMDtB0IdTLO5kFToi5zqJLEk41EK9oJE5IObgKL+WHR/NrhGcyzC6
	 McTFRkKwOaZ+l1rhCtxvDeyZZ6ZVgi2T8j81CVb+pApYCJ0SdT9TMRUBtK5fPh/gMa991
	 KF+LHfaFpcvpU6SZGJruQWicDm/k5FkvmaoHZTY32Sr23EMAK7gByGNAf1A9fE6fdNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fTmicZM5;
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2AB606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F2AB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fTmicZM5
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a65120bf25so2851851fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506970; x=1793111770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2iu3aIJF32cGS02KODg//wkIy9/0jNAnx60DBj5Tuc=;
        b=fTmicZM5odu+gs3ANXnT8HxcmR3UtJLbn5fjVooKO0eaT9jpt9b5Z/Io5arniaXgMK
         RmQFTESEQZR/dp4VsF8C4ifL/wgaQs+gs5e8rp5IvOMamrps72D3+CLVfRu+ZuVYPiJa
         rTn9VA/TGd0+AYKuAJqRDkQ9eU7+MXaAbWrorrq3FSopnL9OOAL82RlUv/Rp6YWvUGgH
         twEIsEbX7yq91cEau0L+2aJcl4vOSIdxizPqlLtwKzj7G3MrVi63Tc6JqEAlvs9zBsqo
         msI5VzNIObJ0gWmYwBtsUeTyeYWPzYQZYYhFQc1LDY+VUqTtbIgijUr4kdYrRq5db4rB
         vAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506970; x=1793111770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2iu3aIJF32cGS02KODg//wkIy9/0jNAnx60DBj5Tuc=;
        b=Z2qN/TPScx1i1hb82tmyp7+5wEXAblgFH1/yFSm7HAx39tR8H93tWWo0+V1pfjbgmX
         8WSiq+OWy8jBwZOhJwsdkZkME1QuwPCG1or9LxFYQVLZcQMv2WBzmu6IOwkHHFSMZLiN
         1vbhYTcoCZThlXcnTlIOhfluvY3xNr9C8779vJUu2McjatZdflKxpufeSzn1guTam27u
         LI39ZiJtZUkATQbn1fTMx/JhonEbMacZbXyJLv3wC2xEwoyWXRn0WDWwSYU/UZgcdQQz
         X5c8IpSnOsG6VwYtI4XcGbapu6qUDSUxy7DRpemyT21RQZVWC5KrWRd5Z2slzfAufNOS
         4nEw==
X-Forwarded-Encrypted: i=1; AKwUvBy0goVonAY5Sfjc9sZNler49D1G76/gS8G53BwQQ0ABDbF0U9YDrjq0slECoBuCXWzVwmNoUuxbbyKpkZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXnambuXZwNNOL0mpd258EKvO1sHk2FOq3ekJgbeIfcBw80P+X
	Nh6dStDgLhMIPm+zi+gW64dbz+ofxmjVToUL6C5sP7Zy5GtoumgC/Vh5
X-Gm-Gg: AYBFou0MRCLV8zpQUNnrTRyXpxulPg7EhMz5H88eWTsv20HStjMGuQSnZxsoY27gDDv
	nXKu/FZKYYvV5+LgbNaHLxNd5/uSdiH7V8KXiCDdfbG70iDvNvHTC6tSihLzK8mbfIa9P1RGqzT
	UrKhAktNJK5w68/b1Arq1SountjUKSCDaZtOQx14TLQTREBOXumdOmBP5NCz6Ks7slwkXcgFasg
	YgBThXO7UGOfi5/a5HypimeVJCVQr9swGIWHQFZB5oily8TYKVT3PFOqD0CKsZDvzbGDLFKzMMi
	E10GroJCMYYkedSd9VnQw7rHVck3fzahyI2H1lZIQZYYUBqlyxCAQF6MvScjagJXj9ygP0/MH9R
	jrnoQXsBTb+5krn4pbFrsCiFIMukg9W9aFgGKfFMr79aiTewr51sm1Dw/44w5Mi0tGpvqpFYo58
	INn9qYwCl8V/Ln/iDhsu8+9/L3ZCyyrjWuTYwawqQGeIjRIHchbL8ZcAjGQl2i8wG/v+ljC6hsH
	8p4+8guxUBb
X-Received: by 2002:a2e:bcc4:0:b0:3ab:618:fc81 with SMTP id 38308e7fff4ca-3ab29118d90mr28181761fa.1.1792506969799;
        Tue, 20 Oct 2026 07:36:09 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab16d7ddd0sm33890831fa.4.2026.10.20.07.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:36:08 -0700 (PDT)
From: Dmitriy Okunev <dokunevdmitriy@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: lvc-project@linuxtesting.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Steve French <stfrench@microsoft.com>,
	Ze Tan <tanze@kylinos.cn>,
	linux-kernel@vger.kernel.org,
	linux-cifs@vger.kernel.org
Subject: [PATCH 1/3] ksmbd: fix uninitialized locks in __session_create() error path
Date: Tue, 20 Oct 2026 17:35:51 +0300
Message-ID: <20261020143553.105014-1-dokunevdmitriy@gmail.com>
X-Mailer: git-send-email 2.53.0
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

In __session_create(), the ksmbd_init_file_table() call is
made before the tree_conns_lock, rpc_lock and chann_lock rw_semaphores
are initialized with init_rwsem().  If ksmbd_init_file_table() fails
(which can happen on -ENOMEM), the error path calls
ksmbd_session_destroy(), which in turn calls
ksmbd_tree_conn_session_logoff(), ksmbd_session_rpc_clear_list() and
free_channel_list(). All three functions call down_write() with
uninitialized rw_semaphore.

INFO: trying to register non-static key.
  ...
  down_write+0x7d/0x1c0
  ksmbd_tree_conn_session_logoff+0xa2/0x1f0
  ksmbd_session_destroy+0xaf/0x380
  ksmbd_smb2_session_create+0xdb/0x110
  ...

Fix it by moving the three init_rwsem() calls above
ksmbd_init_file_table(), so that all locks are valid on every error
path.

Found by Linux Verification Center (linuxtesting.org).

Fixes: a1f46c99d9ea ("ksmbd: fix use-after-free in ksmbd_session_rpc_open")
Signed-off-by: Dmitriy Okunev <dokunevdmitriy@gmail.com>
---
 fs/smb/server/mgmt/user_session.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/mgmt/user_session.c b/fs/smb/server/mgmt/user_session.c
index 44dc3f800cd4..fc28088772ac 100644
--- a/fs/smb/server/mgmt/user_session.c
+++ b/fs/smb/server/mgmt/user_session.c
@@ -844,6 +844,10 @@ static struct ksmbd_session *__session_create(int protocol)
 
 	ida_init(&sess->tree_conn_ida);
 
+	init_rwsem(&sess->tree_conns_lock);
+	init_rwsem(&sess->rpc_lock);
+	init_rwsem(&sess->chann_lock);
+
 	if (ksmbd_init_file_table(&sess->file_table))
 		goto error;
 
@@ -855,9 +859,6 @@ static struct ksmbd_session *__session_create(int protocol)
 	xa_init(&sess->rpc_handle_list);
 	sess->sequence_number = 1;
 	atomic_set(&sess->refcnt, 2);
-	init_rwsem(&sess->tree_conns_lock);
-	init_rwsem(&sess->rpc_lock);
-	init_rwsem(&sess->chann_lock);
 
 	ret = __init_smb2_session(sess);
 	if (ret)
-- 
2.53.0

