Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936744;
	b=s+twimBWRKr3UKDiZ9pzQDRIH8T8bzlgFfZDF9h6qn+h69qKN+rFQGkPxgrZGEW2r647
	 MGSzFV/9CTb/sOgsQmg47PBO71wtn0rb+qLQatafGOm030g+K9Fe4TwFi+yoF3CTP3vhj
	 cRiGwSKhwHm1ac7mqqcbx9Eh0p8y2IzsVzaakfIVeIlSBLK509ELgnY4IrKXNMzZxlfxu
	 gAeAq+B0LP78KUal1HcVtme/wUO6P/8R5V7XOjg3RCLKJP+CwbkVoUqP+8DJzZqQWCiHF
	 ss6AQ2+qJIasip8LayjhXRPxJBMuvwMG83zP03A0gZrD/NlkPPITOdOyFQmGbkpHFfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oC4Xm4Ftyd/KVEfH4kMfevGPXxcxUVZ8t5slQlGpuNY=;
	b=ulScyhMMxkYg2QEHiccTp+EVaBUL/GPQU4mxvpN2P9svJ/QWmER4KhEm3QD175PBoMAV
	 RK783z5FUPxfLAKVNqx54avF1cbYsoQKQf04jpyBN4Cn2ot94f+JX6L2j2pM5Vqs7MSV/
	 BAfWaHwFtsd0/CfzOJVVNofxBqMwrbXfZPdTlM67nKEdl4QFMdF6M1uO/GPTWZ6gvgNrb
	 pVlRq2b9jhesjYSxSCFkVP62wWtJHGke9TOraBqhXR4LuDUPlbgA+duxw+P+SO/rEjDzc
	 vnYuPg3m9tx1Hp/a+BClsDtg6KRi5UsWustHulPLaXvH4ajkmTYWlhhK7xGinXPKIzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4yH0jhH;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EB6606A336
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54EB6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4yH0jhH
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3acec6677so85866c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936742; x=1795541542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oC4Xm4Ftyd/KVEfH4kMfevGPXxcxUVZ8t5slQlGpuNY=;
        b=x4yH0jhH3nyyevBqTucgrxPsS9NXT498DNNe5pZLBy2rzBSWYRfUT7EVniWtQ7BSzF
         c6dK6mYKzpk2s74lqd6Acw/Kgz1yfLE42RUEPs5NxCEOIKWLDEyfFPlXCYEaxIYvVerF
         faBhvptbOJoUoDKrChD7RWrRNUnD5utZng6GBYFjR3cX7e9ohqIS0QF16hV8tosHM77V
         RgC/iEBtlhnJsTSijntRIUwTBwyMkwjKiy7XbXWsp9sKWYu27dDIXoQQ+BdfPpXSuwII
         m3bKcC8NcFiNT9tm4SNd740HctImZV8HstiLhIEo3SOVqJs3JoE3j/hSU0AZ6cKYf65z
         UHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936742; x=1795541542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oC4Xm4Ftyd/KVEfH4kMfevGPXxcxUVZ8t5slQlGpuNY=;
        b=DHtxvG4XolmuJ5Btwv4jpCnB3CwjEH13HkSgSnAiHQ4z4DJgf63tDzInJ5UobAKouX
         XgG8yeupt5JQ1J8XEyQRJNp6pr5Eta+0VlFvVcnxDo3LaCJN02q+1V92l0XMRNGqgOpQ
         wuzFBsledORS6zDbxfmVZayquOwD5+PoayB6SRkzUxg289XbHq9PPIz0yWku3P1qOrOo
         QvjUGb/dRxaEYkRpVEOwivTOxdlG41O2Z3CpP8+FAmzdgsCv9VmqAInJjIv/pdLG9Lyf
         kTPc/4Rq9aH9Wh+GhpJ0gIZ4ShOA5x0ztPcIQ4L4paaBWrKDuNPNxRxJJnuTG1FtXGD/
         zUfg==
X-Forwarded-Encrypted: i=1; AL+hErHIdKszBK39+7Nk+8yUya39z2OtmWTvvc8zd1zq0+Pte1lVRzg2Njz9h3E2G98ZvVgMrWpMwn9XORYsjS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fkpIX2+BrIagfnrGesM72vYqVK3IgbeRja7ekKOodxf4gCJ7h
	7uIw5JIA3tWRk87SbZTkzJgLb3oyD3YCNU2skappyDWvdrBfaZ9pIseQ
X-Gm-Gg: AYBFou21khBrqAi/ecTxc959/+T5aJElYYLlhsR3mKmvjVu1jZ4YGqQWOkCqOzSeiVK
	KgnT5gXMVTyMJbZE2rVVUCLwOBrZOB1iFCkOBRlVtA0H1KEOlTx1fVSN3JV9JlR6RsfXKpNPLLF
	A1tY+YGgpwnnSAS4lgFd2Tg3kuo2IUC323QJ/64p/xfT2FLHTSu2MZ/tRD23QQg/4ILzcgoyzuA
	oWkBF3DkyxFijbXmK7GZhfdXLc+MlHtWiFkC1rpR3654fvhR3AIr3smVDuGpWbdY4iKG93MKmW9
	2No38KhH11TFpKq4bBS3hozd5WSRXdZ55JRoe7hJQUp3ryqehFNOQ5QCjaJ5FaOtjwH2fvJx6zx
	F5PWSMna7t/ZGYrxa9mu+lugXY3h7Pvdnv31dHOq6Eti/eYhnD5WJupAGl8PbsDay0yhC6CjDB6
	0wKghxPC6wQX6q0+i8MeHHMq084XNmQ2ErJosn5UxQ/bk78Zeb8dvS3GXqYGvThJJDbVZhtlqyH
	HbvYy9aYEMqDeTXQkET/lfBgcow4EoI8pzzkAseZ6LCTXQJ65xxmcWyrqwyitrXYIx7DG1mUBNz
	lwmEUg7qHkjDjUZi/FKiRCmZ12yuG4xLObVWR+G/Nz7e0g==
X-Received: by 2002:a05:7022:b0c5:b0:1b2:4cc7:7db2 with SMTP id a92af1059eb24-1b543d5e983mr212080c88.47.1794936742350;
        Tue, 17 Nov 2026 09:32:22 -0800 (PST)
Received: from MacBook-Pro-8.lan ([27.125.146.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm43450247c88.11.2026.11.17.09.32.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 09:32:19 -0800 (PST)
From: Ding Feng <dingf3ng@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org
Cc: jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dlemoal@kernel.org,
	naohiro.aota@wdc.com,
	jth@kernel.org,
	Ding Feng <dingf3ng@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] zonefs: ignore RLIMIT_FSIZE above LLONG_MAX in zonefs_write_check_limits()
Date: Wed, 18 Nov 2026 01:31:29 +0800
Message-ID: <20261117173129.61028-3-dingf3ng@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117173129.61028-1-dingf3ng@gmail.com>
References: <20261117173129.61028-1-dingf3ng@gmail.com>
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

zonefs_write_check_limits() follows generic_write_check_limits() and
has the same problem: it stores rlimit(RLIMIT_FSIZE), an unsigned long,
in a loff_t, so a soft limit between 2^63 and RLIM_INFINITY is negative
and every write fails with -EFBIG and raises SIGXFSZ.

Keep the limit unsigned and apply it only when it is at most LLONG_MAX,
as the generic helper now does.

Fixes: ebfd68cd0c1e ("zonefs: Fix O_APPEND async write handling")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5 Frama-C
Signed-off-by: Ding Feng <dingf3ng@gmail.com>
---
 fs/zonefs/file.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
index 319d950..ea9582e 100644
--- a/fs/zonefs/file.c
+++ b/fs/zonefs/file.c
@@ -399,15 +399,16 @@ static loff_t zonefs_write_check_limits(struct file *file, loff_t pos,
 {
 	struct inode *inode = file_inode(file);
 	struct zonefs_zone *z = zonefs_inode_zone(inode);
-	loff_t limit = rlimit(RLIMIT_FSIZE);
+	unsigned long limit = rlimit(RLIMIT_FSIZE);
 	loff_t max_size = z->z_capacity;
 
-	if (limit != RLIM_INFINITY) {
-		if (pos >= limit) {
+	/* No file position reaches a limit above LLONG_MAX. */
+	if (limit != RLIM_INFINITY && limit <= LLONG_MAX) {
+		if (pos >= (loff_t)limit) {
 			send_sig(SIGXFSZ, current, 0);
 			return -EFBIG;
 		}
-		count = min(count, limit - pos);
+		count = min(count, (loff_t)limit - pos);
 	}
 
 	if (!(file->f_flags & O_LARGEFILE))
-- 
2.55.0

