Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506975;
	b=e97KQBs0fWsymTYwwL2vAeiKrr1wAghl4QbgltEIYfCzXKQbaYRcZIHAO26cXWGHDBw4
	 QumpFa+KDai//gMvTjJdcjyJGrOmqiWou4Ae1pKI4/aVsytD5hf0u710p1//tz1XxK31A
	 Xt9Y0O1Ce39Tn+yF12TaPzGEuF7BnMvLwzymqfyY/Tajz/i7WFxiz956RRVAB5wmfZUvd
	 XABWdsclqQqafHpvE8ne3o8rJGjIAju32h9mHBiI+/cDd+jjTR8Z7KZUK7y7NuqGhqCbb
	 XsVd148/7koC4yQwk3AzjWc7CgJBn6WRM89PURotE6kA3euAdCCdeuLK37vQOYSqYcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=58EM4/eUCWXYKgAAv92oJHvih90q+2lSB+oZ8grsLBc=;
	b=z3Qqm/on314mDifIIGqoyG1pK2mPcs5C+nz2WorHvQc8hH+CnBcJ8yBJBkO7q/UyBOMq
	 /K3vZ9jjGKGWY9TRgwsZiQMF1tP594txMA16FLmIFHOgESU3Gj/k7Sb1IAT0YWVUjx+7d
	 OmAndBVOJHZV6Ztdf8v1i1HwshShTNMWuR8kUFSbNMAWn3Gf9UihF/D6NX3U5i3ft5oqJ
	 D4adCyU40zV6AfPF0jQQOhWMSIW6xD9Z7UZEqkSWSGFgCZ4FpYZDhH3ZVOH8En1gEAZ8f
	 /eh+PwRFierUeLD0irvdJcgiHoueEAUZSUprW7hTOgvj46dW5zQjwzhV6/a7qVzPKhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hzikflMb;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBC0606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EBC0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hzikflMb
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcef474680so458503e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506973; x=1793111773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58EM4/eUCWXYKgAAv92oJHvih90q+2lSB+oZ8grsLBc=;
        b=hzikflMbvGyvPewqIHQOQwI6rPjfJ/e49GZ4qyA17j/LdJv/DbAUrWuoUJruBoy8K6
         jQ99uUB6pWQYRHTECJhlkUqljAohk7dXUl8o0JFLO/q5ULWB/J/xkIH8uvZY2gczuagt
         d/mWictAjAbyi4RDe/DGsFTKBXu+DuGx2P9u9SNohqEsGewqFf0RREvUl0rKi+MIHlwe
         hY82TTn4aYiSplQUDufcdVItP0/nJ78qdnsBPXRwai2JFCBeGuN8MYNgUSIkhQvqnvBn
         VCnxbABzYQRXUtTzPf6Y/pZXraXN2hgoR4+XE9xSm1gwrHh/5j6ClbEUEC4LMvIpgVMK
         G+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506973; x=1793111773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=58EM4/eUCWXYKgAAv92oJHvih90q+2lSB+oZ8grsLBc=;
        b=J+B6VQQsesJDmP1P5qJYzgEPD96vXkVg1TwdHqeFGnkNXZezGOllKjaxr11uWRzjn4
         sRFvP8Bv8/Erd2UTbwcSI4B+h4gVRzbhGEiSuWyf1OG4QMtRp0oJjFxuwNA6IbkY+7NO
         95g9xBhvvF9LUdFvljFDwGUSpavsHlL5u6XnoCqWfbwcwpbg8wVe5VK5iOO/VuYqY2WP
         CtRMjtmP/V8Njvf/IvE7kX4wjp3mzDhgz1CWxZ09032YqMmenFZPDVV18ZIkP4on6GPd
         4R+md6l2/eQX0PgQ3dTd37F4XE5FyLIW+YO/OwI3rlUdBxUANQ9xeC7nAHgYyxhcShVk
         672A==
X-Forwarded-Encrypted: i=1; AKwUvBzGsc9MnkJ7YUoSffnH2NTmgYAVpoP1lDdMX17JBqA+7rECISM3Nh/vsXeijEsHrm2KcMDHIw8EdZah2/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTwfYwJZAZJpLw+SlTNWLIk8sHUUTLjRXSAPs57EmIhU1kYqtK
	EOv2LFYrGC1WbdKLu1984tbVVex8Py8DBMaUGyCtomhmA0WOaUCeTV/p
X-Gm-Gg: AYBFou0zZufU6uuGxsr8vVBSgFpOk8gAN7GG7uICtHDShefewFr6Gdj1raA3jot1AF1
	RK3UYMxWhbM3Jz0lzjmAaVRJdtqpxPqRJDJ9xuIH0bhVP9g6D5lm/ZMe0xFp/xtS7u11i0Qqmui
	BJj3fUcC+xKRsZikyTPxVpnCgADux5Bmw2oP76S9D+TeIlK8VmXa3cQ0NbR2XrznAi3wGT3YvuE
	HX9DYnF/JInIuxTAjYYEysdloO49vZVBqSNPUUza4ROd/S5IpOSGgtbChApJ5IQE0Kvd0AABLLo
	yvS2f9kpwNbVLA0rt7oCxZDMM2R4UkSP3Fg4yJlifD9TUNJ+1DH8ASiZeU9kP+JCJV2JaLiIdz0
	5aG8A7Y4ZinvtAgLDPrFWOjOlNMaDGayypMtNMzEB28L8Wf/9EzBESUWeJetLk02DGxvZXlBP1r
	xAg4fmECMgNQWbFHOxDKKJgvnOoyEl/fJYNJRK9yyfKNV0emmP/PbRj8FXsly+s1wpaoPQuaELo
	Cm98AxOyKRK
X-Received: by 2002:a05:6512:3e0e:b0:5bc:44d5:89e1 with SMTP id 2adb3069b0e04-5be5099bb10mr4092882e87.0.1792506972467;
        Tue, 20 Oct 2026 07:36:12 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab16d7ddd0sm33890831fa.4.2026.10.20.07.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:36:12 -0700 (PDT)
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
Subject: [PATCH 3/3] ksmbd: do not release session id 0 on init failure
Date: Tue, 20 Oct 2026 17:35:53 +0300
Message-ID: <20261020143553.105014-3-dokunevdmitriy@gmail.com>
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

When __session_create() fails before __init_smb2_session() assigns an
id, sess->id remains 0 because the session was allocated with kzalloc.
ksmbd_session_destroy() then calls ksmbd_release_id(&session_ida,
sess->id), and since ida_alloc_min() has not yet been called,
ida_free(ida, 0) triggers:

  ida_free called for id=0 which is not allocated.
  WARNING: lib/idr.c:594 at ida_free+0x18c/0x250
  ...
  ksmbd_release_id+0xd/0x10
  ksmbd_session_destroy+0x2d5/0x380
  ksmbd_smb2_session_create+0x131/0x160
  ...

Add a check for sess->id > 0  before  the release,
since ids are allocated starting from 1
(ida_alloc_min(ida,1,...)).

Found by Linux Verification Center (linuxtesting.org).

Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
Signed-off-by: Dmitriy Okunev <dokunevdmitriy@gmail.com>
---
 fs/smb/server/mgmt/user_session.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/smb/server/mgmt/user_session.c b/fs/smb/server/mgmt/user_session.c
index 386c8629e134..d46dc7b2c562 100644
--- a/fs/smb/server/mgmt/user_session.c
+++ b/fs/smb/server/mgmt/user_session.c
@@ -409,7 +409,8 @@ void ksmbd_session_destroy(struct ksmbd_session *sess)
 	ksmbd_session_rpc_clear_list(sess);
 	free_channel_list(sess);
 	kfree_sensitive(sess->Preauth_HashValue);
-	ksmbd_release_id(&session_ida, sess->id);
+	if (sess->id > 0)
+		ksmbd_release_id(&session_ida, sess->id);
 	ida_destroy(&sess->tree_conn_ida);
 	kfree_sensitive(sess);
 }
-- 
2.53.0

