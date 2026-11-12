Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494307;
	b=Vf3iC62xKmDpkDaM44tm3BYEcladxVyIDUaP2HFYbWZDiyhMUkEeL69+QJ+jImebXx+d
	 zG0zHIOQCmK+KYEXCPiaWWi8qN2V5dlUnFjNRxoKCh9uGH3uGFLXOnvvEbH4NXbl9ATDp
	 wRXNqrVsULHfQFE8qA6zoZ3NJjGVF8U3/WYBfGx34zTJlYot5j91jFJDRXZzikb79ZF0U
	 yN2tbKZIxtrOZrv2GuxKjKQ3nLjHYTU6z6zq8SKignTEf4qLaHxyu2iQ6HUN1swnrznw5
	 9+O1utmBgJMpENDtrLnnDxS4DDuuZYH3jY9A29s2dHk1NlBqBrYf6wOMFNgeaxR5Utg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=cB8ddj7nwuP07tqnBAQ4tCqc/XQIzNVVwVmCcZLYx6A=;
	b=eMNRY9ikwznazO6AZmGIsFTepuMR1iDtv6OKbTGRp9kw9ICljEa9COgatV5CWi8rmpgE
	 tJjbhi1YWe4BnstJwazRO1MJ5IFnvn5ZcesNbOZP9jJI8jT8w9VfGzdQ2af27eCBBfZY7
	 LzrqRYrsP+uX8YAyamhbTr3/hapBd31aaX2qHBwfcgdAGDsMsaTSIEEyAbWiniTuoWag/
	 5kuBrPmhFpB5qUUKjwFoAMvFWWTW2Jx0pXEBlFlvYPXpCc5JlPefaBwc5uygxG9KvCcSB
	 aALmOqLnagWdBa23wNwqHkXGyjjz70V8TpEy2hi7jHXeMp3w6xreENBygLRn7jqhkQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AZ4uqE7r;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5547060A260C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5547060A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AZ4uqE7r
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a359b714f8so33483055e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794494306; x=1795099106; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cB8ddj7nwuP07tqnBAQ4tCqc/XQIzNVVwVmCcZLYx6A=;
        b=AZ4uqE7rawHW3KJYfuqGLG5Fivg2DjI+pQkzPc7/67VLlRtuVp09yqhjE5KpkUfrz1
         Xc33dH5cJeFXKFiMsWq167Xlj2OrSzns+BDVZ9Hyk9WoEDI/csB3dk2RjH1LYkUOAWXA
         pfOWxluqnpfRI4yUwPbDmccjZINdS2fnC5v5iZkUjw/Ckzy+ATJ5FiG9ZtTdSMepl5RZ
         sstR+xrcaYFS3X7AUBR6eQGn43z5CdX/dzVNyTNZu9aJAkqHru1gDqbfWCsJOtkp+AfL
         IpGnke/4J5vwb1hBrzBgKqlMCyVn3R0UmpODXwyObXceMgF8Qg/MeSa+qzJ8gOLB13Vm
         BzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494306; x=1795099106;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cB8ddj7nwuP07tqnBAQ4tCqc/XQIzNVVwVmCcZLYx6A=;
        b=MUeifut2Dq+4OX2Je0gZs2pXLo4t55KE/POLvrFrOTOAd8tUhMvrS5yZPrxcnvJyHb
         UIB54fjE+X1mtDzKAqwRiznHT83f7UkZrvd0sd344KsOxREjQQfrkb0N0cuZeWXO2u4t
         okYF7NdJVv+xTg6fC1fSaX7dOWPR2PNE3zee22t3agPoQLzplQ9fJgWByDbTNsHT97A0
         2SvwSFrh/ydXC8797Tz40j3mOsgu6tlJYu/JsWK0MSj7GV07EkzSut4QVsCCohIe9CcJ
         xqWTia9cGQLEJqnidmNMuqzrUqh1gZ78XMYDI1YZVsyjCTw2sWO/c4hY/hZLnr/cWvBD
         Ld9Q==
X-Forwarded-Encrypted: i=1; AL+hErECeNBX50q2CLbeEKwUaM8SFvV5t1XhrNx/v6uHI2axDjaJ+GXBaAfMtF/7nbOmRn7zyPkvC9ZFkKwuK6g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bWu+1weR1LWxr2ryOD/doD+KCRqSbTppM6ZK4ZhrQr6M2l+GX
	/6JLf8mnOBroc1hilev8arCIWc00zG4aDfIOZYPM8spphwyTjGCM/5aqfhKXViDdchhnoImhheY
	BYjnisM2ddVM+XxODi+D0v7BbI0vENw==
X-Received: from wrbgv25.prod.google.com ([2002:a05:6000:4619:b0:49b:296a:a185])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:310e:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4ba09383147mr103696635e9.16.1794494304704;
 Thu, 12 Nov 2026 06:38:24 -0800 (PST)
Date: Thu, 12 Nov 2026 14:33:47 +0000
In-Reply-To: <20261112143355.2923939-1-jprusakowski@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112143355.2923939-1-jprusakowski@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112143355.2923939-2-jprusakowski@google.com>
Subject: [PATCH RESEND 1/9] f2fs: compress: avoid sleeping in atomic context
 in f2fs_decompress_cluster()
From: Jan Prusakowski <jprusakowski@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Jan Prusakowski <jprusakowski@google.com>, Eric Biggers <ebiggers@google.com>, 
	Yonggil Song <yonggil.song@samsung.com>, Hans Holmberg <hans.holmberg@wdc.com>
Content-Type: text/plain; charset="UTF-8"

f2fs_decompress_cluster() can be invoked directly from bio completion
(softirq/IRQ context) when in_task is false. Passing GFP_NOFS to
fserror_report_file_metadata() in that context can sleep and trigger a
scheduling-while-atomic bug.

Use GFP_NOWAIT when !in_task, matching f2fs_sanity_check_node_footer().

Fixes: ccc6436abb84 ("f2fs: support to report fserror")
Assisted-by: LLM
Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 fs/f2fs/compress.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c7910688c318..9453254ff522 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -763,7 +763,8 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
 
 		/* Avoid f2fs_commit_super in irq context */
 		f2fs_handle_error(sbi, ERROR_FAIL_DECOMPRESSION);
-		fserror_report_file_metadata(dic->inode, ret, GFP_NOFS);
+		fserror_report_file_metadata(dic->inode, ret,
+					     in_task ? GFP_NOFS : GFP_NOWAIT);
 		goto out_release;
 	}
 
-- 
2.56.0.567.gdb80ae8cd5-goog

