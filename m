Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506973;
	b=43ZRdH2mVlfN/At/ImjFefjLj8j1Fn/4IeUhPZ+8B7XbAoHbF1zUTgIT3h00cvFye1HG
	 u47kG84j/zq+KCgDzbRZdYmjExLmX77dBfd0UieDYGB5ukilQ2Qbq7IUHxaPvSLT5broc
	 jWcB5MwbQva4Jl3FVfkqtBlht9BgbTZYCMdxbMwrkPSh/XKD/WdUtHOz6siM8ufdWfDdh
	 ZW0E9cXr8UOdcs3jIC87/6u1JftLgQOpypnkslUY07eFx5DL7u16y9myeKGTq/6Ucwe2z
	 q3TL5Nb/IFvMEv78wWDP4Uoduwe/uIAlQsDnfBMR/Tb90+8UkbriCnxVSEee7sNppCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=isMBoyoms6oniA6nTm27JViI+bHA1PNz+BY0qs8OtxU=;
	b=3O8oKPdI18voieHW2HnKc6jVPc4vf49trmDt5O8q/Ehg4c7StSWGLNSvFYR2bJ7Hj41b
	 apD34+kaCXWmyUHIGhJiIqdrMata8masMyCn1WS7O4hxECB4wV5DI/HbcDvsBGctZxlMj
	 sq1tJYRHvbxusZYVLI7u1mRzbSCik8+ysuNuA84apOBmJKD/NHuhKpqgfVd+2Idi4y1Ye
	 VOZuoL+bURPNhkshQxv0c+AIOrZ0EblNXr/5gnfg70MKwB4nnKHbOltAnOzkoCmkDsdRF
	 C3t6HBoh0vcXWj4AHTif6qH85X+cqktObHlST8Fc40P+Ts2fY2pMIICOqO3LU401Tdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L7TzAnWW;
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25840606A326
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25840606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L7TzAnWW
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a350e51559so5133511fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506971; x=1793111771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=isMBoyoms6oniA6nTm27JViI+bHA1PNz+BY0qs8OtxU=;
        b=L7TzAnWWfgZfeCuY67XuabYOGr/Tqzy3AsLlOu5dVp2PlR46kCZ0Y0McOQ8heR4pPC
         D4aUrowk+C/P47dvv62Qpyhqo58IOZjY7xXFKy7dfjAlUPGgmE2ZgZDnqCZAd7WlDmxF
         YWIK3V9PgvAuF9gt2+Z3CgGfyLxs5yyX8sdOcwbBxriLu7KAl5e/p4KMMODfSGzB2TkR
         zUuaQSpRYgInQFNB6Pzd8X40avH+YyTDl7drnflQuO/zgeVvlRUnQD00uXWYemo0MYqV
         yiBxd7QKARBDoPV6ch1MhrkiG66w6/EmLA0JLhpXlYoBfiierKpgssViG5onUHv8Z7vW
         aDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506971; x=1793111771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=isMBoyoms6oniA6nTm27JViI+bHA1PNz+BY0qs8OtxU=;
        b=iSYf58imWF2jbbmlAn30CdtL+MgQaQFSXeQZJrO/kJHKjeYEFxr1FkBGPSPT2mWk7b
         SbxoGnwBCAyabpW06QaTecyqwkchQuDBOpHlhIPV4aQkRAM+hBLhYwhi8tc8HUD/gR/V
         3zDS5KEWwngpdAdPi9LfcS6zsgcB4HeObiWxe2zb0C5WGDkVIZF57usENcbtXYoloM2m
         MbpLabMY1mjDt57fxApjAKQZvrOsacKwPSsaQ3/MeJZ6pmHRagIlsOXLMRUZ3BQ+fRro
         4Q5I1lvtZMRfTPq1Ow16bi4dECNBLdoZ0nD0RyYmaZqAiElugHyOESf+9jHFiONjkQ1e
         DUhA==
X-Forwarded-Encrypted: i=1; AKwUvByvnfq5L/+aKGzFcPS+nrFyN4DDBdTBh3lVDvV15Y3Z9UgBLp8VkvUNcqB0dg4o9xIQDv1jQJhE4ALLV1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBf3fPyo0xRkn7drc7fRsxBvKzxLNqq9iVv7rjBJIjTnl1hVZw
	DuHu5iGXU2RsLTY6NHEtVYKsuLrWk6cCKxBxM/MW41Ct6RF5AjXrYCd5
X-Gm-Gg: AYBFou1N6eaUI14Vf+Hp9SKx8RQXA8NCjqghgFNRqaVnYO1mJyijxModzS/6FNxK7Xc
	zqQpJ/5XVIiiIAy2jVIl71gbD77Enb8WpaF4+7PM9psj5DpZ1+5bhHRsZ498/647so5Qv+shb6a
	OxHgRxitS3pLGKp1KQRucATHVIynhF6/1yxsDTfpmCf1HPKl3tiJ8CFw8NMUJUKBMLzeG2A+s+J
	6L+YOxfl7vOt5wAYMeLruvjQYwOKoANtdCmpr9pQTh9JnX8jNYsZbhSaEbQjaTOvlb5cv0Oa7LS
	T05mBVSb8N/EssX3Jq9vHrXOvz5oK8MMrQePNCv/NqMwsbCyJIU6r7MJviRzjds30i/JvzPeknj
	DE+AAVrlbwWKIlbssJgyKmwZho835Vp6LHTcYjHN7nAYLmigdzYGvBqpJumhT0gD6i44xI5oubK
	x092DKG/1I61d0Nin1Z88qIDBWg80JxQU26mc2qlQjyP5Zs0p4breUJ4qQbZ+uS+9bZoUncpXQN
	HUg2zTf2jYm
X-Received: by 2002:a2e:bcc4:0:b0:3a9:825c:7785 with SMTP id 38308e7fff4ca-3ab290eab89mr27892321fa.1.1792506971246;
        Tue, 20 Oct 2026 07:36:11 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab16d7ddd0sm33890831fa.4.2026.10.20.07.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:36:10 -0700 (PDT)
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
Subject: [PATCH 2/3] ksmbd: fix uninitialized xarrays in __session_create() error path
Date: Tue, 20 Oct 2026 17:35:52 +0300
Message-ID: <20261020143553.105014-2-dokunevdmitriy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020143553.105014-1-dokunevdmitriy@gmail.com>
References: <20261020143553.105014-1-dokunevdmitriy@gmail.com>
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

In __session_create(), the tree_conns, ksmbd_chann_list and
rpc_handle_list xarrays are initialized with xa_init() after the
ksmbd_init_file_table() call. If ksmbd_init_file_table() fails, the
error path calls ksmbd_session_destroy(), which in turn calls
ksmbd_tree_conn_session_logoff().  That function runs
xa_destroy(&sess->tree_conns), which tries to take the xarray's
internal spinlock - uninitialized because xa_init() has not run yet:

  INFO: trying to register non-static key.
  ...
  _raw_spin_lock_irqsave+0x3a/0x60
  xa_destroy+0xbe/0x360
  ksmbd_tree_conn_session_logoff+0x174/0x1f0
  ksmbd_session_destroy+0xaf/0x390
  ksmbd_smb2_session_create+0x131/0x160
  smb2_sess_setup+0xde4/0x6fd0
  ...

Move the three xa_init() calls above ksmbd_init_file_table(), the same
way the rwsem initialization was moved, so that all xarrays are
valid on every error path.

Found by Linux Verification Center (linuxtesting.org).

Fixes: 02b68b2065c9 ("cifsd: use xarray instead of linked list for tree connect list")
Signed-off-by: Dmitriy Okunev <dokunevdmitriy@gmail.com>
---
 fs/smb/server/mgmt/user_session.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/mgmt/user_session.c b/fs/smb/server/mgmt/user_session.c
index fc28088772ac..386c8629e134 100644
--- a/fs/smb/server/mgmt/user_session.c
+++ b/fs/smb/server/mgmt/user_session.c
@@ -844,6 +844,9 @@ static struct ksmbd_session *__session_create(int protocol)
 
 	ida_init(&sess->tree_conn_ida);
 
+	xa_init(&sess->tree_conns);
+	xa_init(&sess->ksmbd_chann_list);
+	xa_init(&sess->rpc_handle_list);
 	init_rwsem(&sess->tree_conns_lock);
 	init_rwsem(&sess->rpc_lock);
 	init_rwsem(&sess->chann_lock);
@@ -854,9 +857,6 @@ static struct ksmbd_session *__session_create(int protocol)
 	sess->last_active = jiffies;
 	sess->state = SMB2_SESSION_IN_PROGRESS;
 	set_session_flag(sess, protocol);
-	xa_init(&sess->tree_conns);
-	xa_init(&sess->ksmbd_chann_list);
-	xa_init(&sess->rpc_handle_list);
 	sess->sequence_number = 1;
 	atomic_set(&sess->refcnt, 2);
 
-- 
2.53.0

