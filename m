Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601245;
	b=uRV9NZCBqiOseL9J9+1K2VbQzCa3v9C2l/Y7MsbyayZV3oy2KM2tB5vTHXA/oaHnrf3F
	 hp4iHNaauT+Wb2iE+Xc3TPFsP/AJSNeSGTybVEh+TDEc3GLt59HVOpMT833pWX8ov3NYw
	 KjwPlep5rpCUKrHoOBheXgrM/HwZ43aZFkHpm0HPij09rYfERK+85ZRm+1zfEZvKHrYRa
	 729zTM1rq1EOpzUF2iwAaCenK+hvJAcAGwShxxxP9McqPfkbYAhe+eodXf+SHnOWYxhne
	 ibX3+Y0g5O9vnmVypWSQDiDLZoOmsQlXGz/lDG99wHN7h0djnbo1B2B6U+fxiUGiNiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LMah0FJH7eM9uIAHBN801ImbAdcq93Rgy9kg6cK8pwU=;
	b=U9KDJ8ObOiV1egghvXryv/Q5+smDUEPEjW6yYd5u38w5feJnCbm/SApApeeD1HlhWO8w
	 /VnQUadBqdt2NZLew2QY4M2AP4NZZdGSD/88kxbCrxYQtV9fGkQ1+mQAs9EqwGALyj+IS
	 Cx6VULlWFJtDzI6KSfn9/LAgdWaGNu3wzmxkKYQVkTBssAIdEkz+jZCB2QOX/byugqr9P
	 ynlOdaYhH622FURn7ehWe7DyxirxPBcLuM+FZednQZYi/KnFLKDf5Cehg/Qr3fHjcoDPx
	 gxuPRtIdepNL+PmPpgiekZdz7RmH3THqJFaqubSAvQQL0GocwcFCDQpOAv4CZMm1lsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=D56VqIN2;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D0C606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D0C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=D56VqIN2
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9179bfa9e9cso13323836d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792601244; x=1793206044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LMah0FJH7eM9uIAHBN801ImbAdcq93Rgy9kg6cK8pwU=;
        b=D56VqIN2mD3dv4GAByYwDvYCkhg2Ua4EGxHO85+aYP1hfXIYxIhHw53SXC6T9m2g+J
         swXuJA4YEH9V3m6ucnRzfA/sr88oFzfqkrkargrGlse7zMfF/QAH2T4BUrINl4bQUR2b
         pXThtglZHpSl16oCcy/fZQ9rcTfnUH3bFDKL4Kg7ZZigWCad7PhHlYMJVH7dVz6hSQA+
         avzdMUlF7AcjDdZd3pNjj/mecQipDeMtGaGB+WWnDDUdJbSWm7Fb/zIqAyvdert7bxY5
         FtzCqvivAC5m/E9tfGNq+DAGJdjDxM0ClWtJXtLC7HWWkpWVBn58qEWMdB5shwger84r
         jMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601244; x=1793206044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LMah0FJH7eM9uIAHBN801ImbAdcq93Rgy9kg6cK8pwU=;
        b=EXD5ws/TUBQoELpNvOOSHMyAluOnfMMEYivD2vvyY8jxnUKVVZAR4uhAq9WDlhghCa
         Bhez0d+SYTNpT3sIQTub8nm1IGtrQDB6oJIfdEwhJjUTAVc+uu0gQCyjF3WipOv1us3Y
         2oykHv9KJ3/bSTzQYw+zqNBDOwea1xIGxnlj+Ndadvg4Lj3cLk5+oG8EM+flfvfyj9pH
         CNlv9MmNBAFcNDFI4hSj0UOYuHnu8S+yJYotTfBRn18VWvb8p5KjrPgcVC+5bvEdQp6B
         GE9wj2T1ecOm0siYc+6MDsZPtF6hyJass9Xt9S12D3iXlzZprxqkBNU4uu4RXUSCpvq+
         1Hdw==
X-Forwarded-Encrypted: i=1; AKwUvBzr9JDoQK+TxYQA3EdKJnjIYbsgdwVOILpQGxt/U8dTgaizuRFvl7X7HS6Y9eMCKyKIyPXIL06E45TP2JU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcd58hOl/GCmd0PO1sBjpPOFHGx4+ZpknqbdczkxU1z+qXXl6Z
	dqhJjNDw41XLgYn1PTDdx1Xk6QW+h1RbpBfK6wgKxyK+qTN1/skEMxn6NtMNKWorGkeYK7et3pe
	Q6rhm
X-Gm-Gg: AYBFou3QfRw9eE9uVTW3P/4wQvahECixEWGLdE1HeIIvecxO5ZrzFcZgNTW1NKr+FHK
	vewx/oEbTFHlw/FnHC74A/Vfq/Hs1dbELqaZ0wcnlEcZfkfGBA+fv5pIO7BAbEHtduYqv8UWdIh
	Nu/pZHhBfQ3p/wXUpT84O0pQKkf3Qb7UtYbOvgavllB6f/xFrNO9voCXCprUT69QKG4oxR0+nAX
	t2dtw8yM+IrgvGKd++oBajeYEmEZg6C72V6BDIqotJT1uFRzQ1qjeGfm+94zlBrAVDZmagvpXAU
	iGJ6D6jgjkMWIGSvt3ap6bdxLuz9oqJ+J4O3QJtODAUTRqRqq6hKGxpgc44+QfGVF9yaIpENHDy
	E6AWrU+tLi8XE36am8/9BDn46eyCowSWWxy63E7RWYGtqeLBWRRoRGAMqQFQIWhhDGikIpxWrMt
	NituwzzHHxCWUktsiESoWahG08N1eqK9RYzalwwt/nrynVZUOILOg+hCYU1CMTAUOex6bqEiBU6
	n5At1q0hX6ZTP+cvrWzg9e4SToc+aCxa3Qz/NnKz5nUl72HyV9BUYueHefI6IpDjmDcg33X
X-Received: by 2002:a05:6214:e8f:b0:91b:80ea:60b with SMTP id 6a1803df08f44-91c12f30e02mr48846996d6.49.1792601244310;
        Wed, 21 Oct 2026 09:47:24 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.249])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10b70c50sm28791566d6.13.2026.10.21.09.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:47:23 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 16:46:58 +0000
Subject: [PATCH 2/5] fs: make ustat() and quotactl() killable in lookup
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-super-lock-unborn-v1-2-0265eddb6dee@toxicpanda.com>
References: <20261021-b4-super-lock-unborn-v1-0-0265eddb6dee@toxicpanda.com>
In-Reply-To: <20261021-b4-super-lock-unborn-v1-0-0265eddb6dee@toxicpanda.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792601235; l=1274;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=4pFxSN9rbQq0Lvp2SPmeFxAijaUR2vWg898aIvDsd6E=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCZ2mRaLXvd3XKOHjogTCovvQETfsQ7z2gp/mL7meIJRwklcPnq5QP6da92HUCWzLX0DsyCp/W7
 f4OKq94GSUQA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

user_get_super() looks up the superblock for a device number on behalf of
ustat(2) and quotactl(2).  If that superblock is still being mounted it
waits for SB_BORN, and then for s_umount, in super_lock().  With a mount
which is stuck on its device neither system call ever returns, and neither
can be killed.

Both fail if there is no superblock for the device, which is what
user_get_super() returning NULL means to them.  Use super_lock_killable()
and return NULL when the task is killed.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/super.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/super.c b/fs/super.c
index 7164c92fe70e..40f92ffa39c1 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1172,9 +1172,15 @@ struct super_block *user_get_super(dev_t dev, bool excl)
 
 	for (sb_dev = super_dev_first(dev); sb_dev; sb_dev = super_dev_next(sb_dev)) {
 		struct super_block *sb = sb_dev->sd_sb;
+		int ret;
 
-		if (!super_lock(sb, excl))
+		ret = super_lock_killable(sb, excl);
+		if (ret == -ENOENT)
 			continue;
+		if (ret) {
+			super_dev_put(sb_dev);
+			return NULL;
+		}
 
 		/* The pinned entry holds a passive reference, take our own. */
 		refcount_inc(&sb->s_passive);

-- 
2.55.0

