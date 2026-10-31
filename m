Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793489987;
	b=fSHj727gXoSufUa6ri01tcR2Pp7vqqKSn8jyU4M4/tnBmzDBlHYKk6/2HdBeqZ2e4a0U
	 8ah2kxsmV8ycAW9KzjXmddYgdzyl8DJQWNoTRXoLzOn42/4okcxTfCBlGuo11peyKrRBx
	 QcMDXKMEirdO5OH8o7PLjEhwVk3q2lE4nJAwBBSSdPDnSNhSIk7kmCEmeKCqPGPMCssAj
	 TgMKUnmDCzYXWDjpcAyQvEJZbYM/pF8rGKmJQ5uH7QCBjBbf7Tbor3/RsWJpWIhYqWq4N
	 ssujL98MFY29+0FwCEZmCUdPWwjh2bJWmwuVL60GRk2O4wuzfsPx9GZpgDwrWEHmtEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793489987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=34cB3uC2AMmxA4aiV16zEHx0bet8w40xYeWOvwX1TF4=;
	b=qIk9G9n/JACdl7gTIcwVOeruESOjW4RKo0V+fuUGayh3OlPbWs2imuIZ42no98mPKsiH
	 fHgz35J/YnNjlrmntFs7OOQeb5Y0MKGsm0BTD73esMgmzOYlvYCv1RShRkqcJsWEPwdV/
	 kgXuVnp+zyvOCSZLqWh1AlUDajksCX+C4jsgTvGo939FMYzW+iMMuH9feZwor9hOpLQ2K
	 hHhKxMn0oyaa/UmNRHeSynPfpTmxXEPX1GGZsTBOFqaaDCFwXzPGsrYraVQ61syWYXioG
	 rPiLnh+WxUsassZ8kyRXmiZXkKV+kQjCFZGm2NKifdOLfFTBEGFb/ZfhCle+EmFrgrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AwYfa/Dh";
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C000606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C000606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AwYfa/Dh
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-3535a54c09bso1815504eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793489986; x=1794094786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=34cB3uC2AMmxA4aiV16zEHx0bet8w40xYeWOvwX1TF4=;
        b=AwYfa/DhObqy50v9gbYRVC0WG+szIT819eubKkgF9HgfFBohDHV/MEzzX5m8Yo1lMD
         OHxjE+64YlE7gY/Ak9AxDQPCpGV2+eLliUlONKB0IRWI/f+M78Hm9KGxXn88PJQbDHW1
         JVoK8K3pYkeck3CAn4tWpqe/w+RWBoPhdeeQ+u+bX+cranJIyt5HX1JJdmviNsz9pnQZ
         tnM62Yl+X4B+UM/iu2qzpPg89LgaYcWICTya6wdo3I6w5hsjirW0BrEoQxC/wdqNGRe8
         /GgXhGSKoRpgw4Xqz5XzkRTRbhdhonxzBkkvu2z3TtVK+IZ6voFMkX6PCyPJWO1hZYx2
         ogwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793489986; x=1794094786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34cB3uC2AMmxA4aiV16zEHx0bet8w40xYeWOvwX1TF4=;
        b=ct2erNE4yOQRCInHqCIoBaXCZ6qASJxeI4KmF3gxCyUVnZyqYey7mXvn7IDKlESK57
         DsWODfw3U8vOG5xEY2e8oB86cCUCiE4IbJJ3rcX6ymg/i1565r46oweGisNhnqbN7XIv
         aVUoJb1RbMl/QYPLx5RdYvDU/OFmWbnfjIEO50n/WDDU7lXHQaKka4Qt2by7GzXZztvs
         TLJy/rQ7JIS8Ev0viTzRrudaDj4sCwyjFnTuwbICoiiczpch+VHBYHNziD9ps8UuCT5h
         W9lC4jtVMzQhHcd735Z1K4Biqt4tcyy3Q/eG0T7TCnBhR4uALHDTKuiZPfxWcccVK71C
         AdCg==
X-Forwarded-Encrypted: i=1; AKwUvBw7RXTE+0FOtqBk4AmkgyB/bMaKDctjTzCF2O+uJqDpq+FFfxDKFwaf0Jplc4FJS4BCt6EYkSkz1hoHbK0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8KuN26dPAkIv2CXOoCUUT0SsXFKfxSPImZQO5XgpFrK6YHuZF
	3YN8MxC4SsSgNKczQgoOfWHYg0Uyi/BBMz3aXsyJOPybEwztK8Bd9dTO
X-Gm-Gg: AYBFou2gmtMTXfFKLLOaT23+ytuHWG3gkWkeolwminKB/dR4SwAEJ6Lt2kHRibPMqMs
	fEfNELySi5ysj5AL4VNobR/NBQbjiz2cp0go3fG4lJKtWCTcRBKRftxHbxx0xG2WUPuBgVA+RDd
	tJETNj3kbD3J7k05lq2+81CnnkiuqtLtdd5URSyGV4FFZx/O/dTQ45rxCGUqtNQNnyv1UM3tn+/
	4NPpD6+9porAkj+/HH/FQV7tedT/VT1+v0jlTKYJ1MLpYpywYA8QRevouB0LkGJ4jTSsBPqu1sI
	hBDK2gTTC51FcdRtsnndNOHVR4Ke4LZhPirP/fk+jIJmCQlcWmDrWRggfDS7f6vJ8Xmz0pA0JL0
	WUhI73dGUiM3xsTH+s3LycTw9NiKgL2MC84z+6FgK7FL9ovltJWmlH0xpH7DkdWYgs1XCDKTV32
	zFapZzQEq/CaOrONggWlfgt4oitWS6O6cof+goBi/PwOkDKUP/mOeSAfBHab2cgBsnLOQTAaGx5
	5jj5dNxe9LuV34Jn/IdVmLENxNLo+wJdOebFuE5vCXvTCFGZz13jJ3aVfv2G1NUW+qBSbpiwwvA
	s6XCFkXSdA0YvrH+Y3ybwEmqM7PSAgsjc0v4Vs5dcPRdcvJlFNASkHzw
X-Received: by 2002:a05:7301:6193:10b0:369:a162:af96 with SMTP id 5a478bee46e88-36a4238974bmr9155351eec.17.1793489986095;
        Sat, 31 Oct 2026 16:39:46 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm18318233eec.10.2026.10.31.16.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 16:39:45 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] f2fs: preserve 64-bit FITRIM minimum lengths
Date: Sat, 31 Oct 2026 23:39:35 +0000
Message-ID: <20261031233935.9600-1-dennylin0707@gmail.com>
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

The FITRIM minimum length is a 64-bit byte count. f2fs_ioc_fitrim()
narrows it to unsigned int while applying the device granularity, so a
minimum of 4 GiB becomes the device granularity. fstrim can consequently
discard free extents smaller than the requested minimum.

Use u64 when applying the device granularity. The checkpoint's
trim_minlen already retains the 64-bit block count; also widen the
discard policy field and its initializer argument so larger minimums
are not truncated when passed to the issue and wait paths.

Fixes: 4b2fecc84655 ("f2fs: introduce FITRIM in f2fs_ioctl")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/f2fs/f2fs.h    | 2 +-
 fs/f2fs/file.c    | 4 ++--
 fs/f2fs/segment.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f7423b3f6e4a..94ff3852bd1c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -522,7 +522,7 @@ struct discard_policy {
 	bool sync;			/* submit discard with REQ_SYNC flag */
 	bool ordered;			/* issue discard by lba order */
 	bool timeout;			/* discard timeout for put_super */
-	unsigned int granularity;	/* discard granularity */
+	u64 granularity;		/* discard granularity */
 };
 
 struct discard_cmd_control {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e2c0f5083313..93a9c04bca0f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2729,8 +2729,8 @@ static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
 	if (ret)
 		return ret;
 
-	range.minlen = max_t(unsigned int, range.minlen,
-			f2fs_hw_discard_granularity(sbi));
+	range.minlen = max_t(u64, range.minlen,
+			     f2fs_hw_discard_granularity(sbi));
 	ret = f2fs_trim_fs(sbi, &range);
 	mnt_drop_write_file(filp);
 	if (ret < 0)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 43f400715766..384e0cd5e5b9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1241,7 +1241,7 @@ static void __check_sit_bitmap(struct f2fs_sb_info *sbi,
 
 static void __init_discard_policy(struct f2fs_sb_info *sbi,
 				struct discard_policy *dpolicy,
-				int discard_type, unsigned int granularity)
+				int discard_type, u64 granularity)
 {
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 
-- 
2.43.0

