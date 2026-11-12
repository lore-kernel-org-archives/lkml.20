Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491225;
	b=DWyIIbnlR6Rwu5qmMNrAepqxMdlJtFveW49t9lQm8xR+NuAUjU8aiGXPXgsEHQX0ecF1
	 T575ls3GVLkG5hFksqQi/iSqNpO7qk49uT+5L9fPp5N4osVR5IhJ1VjOOoue4EVs35OSE
	 8oTk2A4845K/ZuqsdYN7VLnVEpuCBTlREdvcZNNjUIE8eEwHGT/zgbj1f/UzK5YKdyN6w
	 sZvJlU4QFedvE92Wcq2BVAkpPRzdihrOX2D/zF84kWIb5llcJ78ikwR3P/H4mrbsebMrp
	 pm+Ejr57GCL/3QhINhukhMKBzBRPtUv0/Q33liPV21Nwgh9idmO/MrMV/MYGjpzAULQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=At9dnyT/4q/wJJ9tfHQDwKMvIA9o4nNPXbuYEoFso6w=;
	b=BXczuwVhz28MF8KTOb1YXQ/0V/PESceIcWvc2vSTcRWQgmoIzknpt3hJUIB0FjXy+IoG
	 A/4bM2LKL3hm/aEqtPqXjv22a4m82fFzHhNeBIdGUMGcWd83DYP7BUONkV51OHC9a2IuX
	 GXry/+oyFhetILUoK+oq9bP/J8nMc2H49fXkzbZ3zJY8hZrdvpw4hKN+3SEssi1ioJkbQ
	 KdASCICLPzQf0EezyMJMLLAc4V+jONCJHmZgBgycrWgqAI3wIXPKQxwnIpXiLdDOZVj9y
	 s5l9i5KyOtI7iU85Y8hcugr/Cj+Zx2Q37EyCjc8WAx5hFU4xEf3TOzvWlX1k4d5VO0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloud.ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=Fm27Yuq9;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1DB606A882
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C1DB606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=Fm27Yuq9
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df4f7ccf4so94404f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1794491223; x=1795096023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=At9dnyT/4q/wJJ9tfHQDwKMvIA9o4nNPXbuYEoFso6w=;
        b=Fm27Yuq9g7zEqILjHO8VSWuJNFq4DrD6kqa1MUcXpyXdfjc16G9jkLcHADjhHFO+SX
         6EiMtZOmwH7i8vIYEqg14qvjz2PZFGAS+bwQf4ApqcHOCaX65vYSCtAemyHSY95qRSJP
         QLQUKnw/Ewmf30XmRjyHWK5iga3UBw+xW6IbwUh+JbJItzusbgI+crjcSRhmltNrCmiF
         VRZKk25hGlHbMbVKPZbIvL6fpoJytG9KNh2r1wVhz3vp2zuaIERwCEBVc0zPmOSVQPcF
         6yVcPlJSb5KdJiY8DtuOaVqw22+B0IjziubW5L4oOEyzB+zZQjBRE8vG24gvJaPF0zjX
         ErTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491223; x=1795096023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=At9dnyT/4q/wJJ9tfHQDwKMvIA9o4nNPXbuYEoFso6w=;
        b=wT+PxY7T+4+/idw6Q6qL527XzHu7Sn7COzUi4S5a+Z/U0M85UrFu1G1J9JhpAdGTrP
         q8c0L2KiTNDxw2FyHeR0/OU5FyGHbhzsqhDMlwffEi6cXhYMI6Q8XVmSI9LIWKTUdHa2
         K5oxmElAZnkW97n0Xm5oePAr7cT/XGJhtXQsfgv7N/pz4LDfk4bU/4gaONY77AS9PbNJ
         ouE1uxMi7Dwu+EvoBvyiR1+8yEQX7krfsr7JqUaynoF/NNs+YugdZMIsGkvwDK5QPj8N
         U7KfHzQWDVDjQwYi/ygaBjRTXmKO1nd6ZIV2dCdLX16ROaMPY8VLvqz2zwCMW6dWE/bk
         aUQQ==
X-Forwarded-Encrypted: i=1; AL+hErHxTjduGqMqOJslX1jXXUu48hqK1SWalYzDayoWY48v9CDlnuABvZmZhzkT3pGJ7IAt8SRXvzxphkWQv8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x3IgedVkV4Xu2qhjV61c2mn6X9TIkyiz+J0Kab4kz6EieqtXy
	cfS3dz1XhnCG9ZgbUnH33zm8jMOG6RB+13gjYiyuUpZV5M120l2858Wt5S5fzUtP9E8=
X-Gm-Gg: AYBFou2cejle78ZYPLM3H7nkPYAsQydIX9U6IvNBt1YaEi3/7OADHYhJ0zgj/nwyr+1
	ZK9M9ey89+vcJkBABQS1uBvirz6A93hczN6BQODKWWdhFfeq/TZoBU5Z6qjZPhY5nrULKysN+TH
	U5DrrnbxAKJSbYVY5K4h051zLV3SIRyG1c0JXaSHLWxCrF+SpjN36GMw0twjxIOnoqzdSYJoPMG
	C4lbi3hL9+3kQ9h7cGx249MImXUJ/SVB78uE4SlLS1XwYL7HQsTG2v47c0ayyRwJhqC0oNCMQtc
	bMyG/LBMZh8f6gWIQipfpqt2l4wv8AWT9dXhHMmzCHQPd+hAqgNuGNaCsQ/ARsHP7M0rtqgb/eK
	Kc0fr7x6gKZekdG8dJFIh0+GjNf/bztQzwdCOL1hZrKxlhY849pezXi9G9MH74SS3tGLbf0+zpW
	CAu8xp4V5bSpMmMO2Y3JAZqieOUQR5HLRKu2qJ/rbWpMHfJBtU1epH59qn4rY4c5BFvWgaSSL8x
	W84pFpZ5NGW99PGjlScYEMdGw7+gssy7pKM9v3c7R3EEQYLXKMMb41AuoLbX/rhQM+zA1cvAp3j
	aOyuZxKYtqvasK7KLcmJcWopkYuzga6+f7qEMSsjLxSOxh3RCodcahgH9isUDnelMpbzSLrjJab
	+S0k7JQ==
X-Received: by 2002:adf:e196:0:b0:48c:6611:82 with SMTP id ffacd0b85a97d-499c434be3fmr10614340f8f.1.1794491223476;
        Thu, 12 Nov 2026 05:47:03 -0800 (PST)
Received: from jwang-ThinkPad-T14-Gen-6.fkb.profitbricks.net ([212.227.34.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367b99bcsm17665990f8f.51.2026.11.12.05.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:47:03 -0800 (PST)
From: Jack Wang <jinpu.wang@cloud.ionos.com>
To: Yu Kuai <yukuai@fygo.io>,
	Song Liu <song@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>
Cc: Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	linux-raid@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] md: suspend the array instead of freezing the queue for limits updates
Date: Thu, 12 Nov 2026 14:47:00 +0100
Message-ID: <20261112134700.372702-3-jinpu.wang@cloud.ionos.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112134700.372702-1-jinpu.wang@cloud.ionos.com>
References: <20261112134700.372702-1-jinpu.wang@cloud.ionos.com>
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

Provide ->suspend() and ->resume() for md_fops using mddev_suspend() and
mddev_resume(), so sysfs limits updates no longer freeze the queue.

mddev_suspend() only waits for active_io, but md_submit_bio() reads the
limits in bio_split_to_limits() before taking it. A bio already there may
see a mix of old and new limits, as with mddev_update_io_opt().

Fixes: c99f66e4084a ("block: fix queue freeze vs limits lock order in sysfs store methods")
Suggested-by: Yu Kuai <yukuai@fygo.io>
Signed-off-by: Jack Wang <jinpu.wang@cloud.ionos.com>
---
 drivers/md/md.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 03e35386a802..c9fa4e99569a 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -8669,6 +8669,16 @@ static unsigned int md_check_events(struct gendisk *disk, unsigned int clearing)
 	return ret;
 }
 
+static int md_suspend_disk(struct gendisk *disk)
+{
+	return mddev_suspend(disk->private_data, true);
+}
+
+static void md_resume_disk(struct gendisk *disk)
+{
+	mddev_resume(disk->private_data);
+}
+
 static void md_free_disk(struct gendisk *disk)
 {
 	struct mddev *mddev = disk->private_data;
@@ -8689,6 +8699,8 @@ const struct block_device_operations md_fops =
 	.getgeo		= md_getgeo,
 	.check_events	= md_check_events,
 	.set_read_only	= md_set_read_only,
+	.suspend	= md_suspend_disk,
+	.resume		= md_resume_disk,
 	.free_disk	= md_free_disk,
 };
 
-- 
2.43.0

