Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722873;
	b=PdiTa3BcVNrcX1U/LZkGP/uqxbt6VfWxRaNU7lbT+1OD0UvG3lhPSWv0w6bXNUeCAuzO
	 D893tqIxNaFMIBRV0nJZ7yGopy15OCAKhLiMzzVMUByapL2fgyn7Zepi3VAGmOQsnuEzq
	 uoRykvoDhplrmtI5oWHkPdpcnt2NS4k4TIu6xCXNqBriP0YtAfP3PlhDKoSboVadZqxla
	 HqKHrWhHVh3x8thxyTSen9av0kgOqTUzoa4l6zAWDj7byU1+syYKyHo5af0KOVKcelAbv
	 qDu/vnoiE8ilI4tevKOGo6MxVn2T9zcoEqMGGZBIPsRp5SnUtpvqrsC22Kcx74qfBnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K+PeZm9tsGAqhp854CH7k9KBWOkxy9cTCDo0Ktot44Y=;
	b=Rbg0yAVDh67FBe9xqYu6o5rOq2g6GX/dC2X+LPybaA5zfE1KtGOUuypIXQNYSfATJ8lk
	 CGhNRhhQYwl9hA1ngi8Dqio/f2QPPlq9nPahfH8CCQNArBcHLWT24ITvVdCGeCoxoP5iQ
	 9vV0c3Jc9xRlMbUbVYCUlqVzMzy+ItAWP0a0j3gLct50sUeDZPj5NiyEG9QFaCxVbsq1b
	 HgfRVdvqEg6fB9xnKe5p3n7Y+C949VkAknBEgtLWnb+O8p7qLbZOUCxRbvcw7EBqy9/zw
	 r7fwc7A2Qb8nO5Z/LUfMU6ocVQKXczWUqv+HbSUmDFPpxPS7jwx5f2j8yLosxBqg/DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ODzaKoW+;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEA2606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBEA2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ODzaKoW+
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so305935a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792722872; x=1793327672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+PeZm9tsGAqhp854CH7k9KBWOkxy9cTCDo0Ktot44Y=;
        b=ODzaKoW+2YuJUQ+vZ9KMdvyXuyk11NdRdz3S3VkA0otksHGLDYoyX8j7rqASnOH3sl
         88LCBxGQfyZYSLx/Rzyf/TthbjifScupo6zH6za8wq/9ZKdcWrJpAax1J/cvPFQRvb+g
         9Jv58lyF5FdUTkfA8qRsGlSmXptO/yoNKicm6HjYgH2z5OOMXEVsroCJ0sRM+5StS8op
         ookltOQGJQbv/eHlSGP6eP2aBeIfb27lEonc+ealpigPknfFnhPlS/qc9SNFnRJQHpf3
         DWRwfVs4TTJMRojk1oGqdtU0VoCr10TgIk76GPIh1XMSbwoWUOBkF5ODskhKgcdXpzdE
         uRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792722872; x=1793327672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+PeZm9tsGAqhp854CH7k9KBWOkxy9cTCDo0Ktot44Y=;
        b=02e3WhFzYiPIl0C1/po4VfsllKOADuvm98f1Mc+q9Pton5R3zJfW9wULpV7YNudDY0
         Wy/nIyVGPpOnJG6ebDZQp/nswbC2LhL129DawNETu1Ugw4zpgP5tppf4XSCZvznWtT3L
         PaJjJ2gaKC1tAYDPxh1as7yJOpKN2qwsWOMDUp2GdPHpWdAvEO4N2imlMW6jCnupLMO6
         Gt6jT5dDt6FTrR9IKLGcEaw6KvZEOJyF9gh5Ucm9fXrYuuX27Lhbn5+FTXOhcFReCSHW
         YIZ+/wpLIcYoZUbmWoci9tN4aC9B8sWTMop6Ham2uEgDni9INS9bgmUdXCP6XLJZZIBr
         5yJw==
X-Forwarded-Encrypted: i=1; AKwUvBz9/wC6JV9XPcDABx17oh1lGrtzF2o+1ombB6Ecl/Dq4CWlQMkZvCj5oC4y8pftffW94lqJmVG8P3Z2P64=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVWMO+N+EyrITxP6jQZyJNzwezDeKy8f9gJrqzXMsAfJbgYld8
	GIff3FHhza23Xy79ci93wgc5lEXzl7qL5UAA6UT7+AarUemmPAXSFjuU
X-Gm-Gg: AYBFou3LEnqgFAVXuEq5PsRy0R52DZKPX9ntnqxSDFCwPlWjpMyAVEwex7GR9sob9jk
	thXtYWI/D4Wdly2tgOKxBIXdC1iri/Y/uk1d0WxA0o4SzA6zdORbhdkr7O4t5L0SH3X+Rhac8TI
	zjAe8xng6iXQTdxhhHX+5SO+gflkYu2zxWyw97q8nGQdgoP89Dv6W2RwKPebXQESkiNPTkyaKps
	ZbQl4YhLQoUMIDG08XQszDCxqOsX24QB4QkzNX0FT76M+IlpnK+sghpbmuFa9Ua3DJqMoxSiSdh
	yGTgWq87fHAI8waPtwvn8vGHP7vsAc9MmUt4Dpfehl19bPxnCGdOX5e0DBwyvumHgh54buN5D/z
	hJGKtOsesi4pXQlIGKna8Vmx2ACCWbmGw34YXKJWmnUVNndpQJ4Rvdq7yh//7rC+RPuVK2t89v4
	tvHvPws5VpykJuS+A+9ditxFBw1gUDizzz8m8r0+kLFW5U7YeB5DzVzKQ+VVX9EndqU5k5UAuPf
	BAWtPWU6rEEtxQZOGrihjrpVa7C7d4RckAp7TfR+sw21vBjiiXaE4cftgWt0BecmXMNV37vWW6+
	xSbPqkEmLOZd+NaT6w==
X-Received: by 2002:a17:90b:5108:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3adce0cfdc4mr660962a91.41.1792722872119;
        Thu, 22 Oct 2026 19:34:32 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490c096sm6544867a91.7.2026.10.22.19.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:34:31 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: fix cluster over-free on allocation failure
Date: Fri, 23 Oct 2026 10:34:24 +0800
Message-ID: <20261023023424.4003943-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_look_for_free_space() returns in @flen how many clusters it marked
used, which is fewer than the requested @len whenever wnd_find() falls
back to the longest free run it could find.  That run is maximal, so the
cluster just past it is in use.  The undo path after a failed
run_add_entry() frees @len, releasing clusters that are still referenced,
and a later allocation can hand them out again.

run_add_entry() fails only when its kvmalloc() does.

Commit 0e5b044cbf3a ("fs/ntfs3: Refactoring attr_set_size to restore
after errors") replaced wnd_set_free(wnd, lcn, flen) here with
mark_as_free_ex(sbi, lcn, len, false).  Use @flen again.

Fixes: 0e5b044cbf3a ("fs/ntfs3: Refactoring attr_set_size to restore after errors")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 fs/ntfs3/attrib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index b1c315206ffa..fefd201809a5 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -199,7 +199,7 @@ int attr_allocate_clusters(struct ntfs_sb_info *sbi, struct runs_tree *run,
 		if (!run_add_entry(run, vcn, lcn, flen, opt & ALLOCATE_MFT)) {
 undo_alloc:
 			/* Undo last 'ntfs_look_for_free_space' */
-			mark_as_free_ex(sbi, lcn, len, false);
+			mark_as_free_ex(sbi, lcn, flen, false);
 			err = -ENOMEM;
 			goto out;
 		}

base-commit: 3ac032ef6ca8e47bb06d1e189dfcf88fa0a09c75
-- 
2.43.0

