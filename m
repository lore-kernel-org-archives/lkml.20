Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988636;
	b=l+gz9vj6KYx40NLgGbjDhHYP8C2AiHLvtnho5fh3kha3a/VtdhRpJ1gKXk2m9GhiSNAD
	 fN6d8dwfq7oqeqW0tgFDEORLfujilLLqc8QeYx/A+X2I01YC5hbXsCc6XYEtPhpsFJeb+
	 930Omb8pe63wczD+3fKdjWPKS2vPX4XKVdMtxb/i/+FrrQuC7N/QGo4MtcpNOHf3iTVL5
	 kzGq1Rrpkn+G3ClJa06P0fNkpfblR3LlrbB+bLXSUJP8VxEaYqneg4qdZy6pNZ5jExe+N
	 Ot0icrx9uYF6L/1hpr9/hBAmbVGS2UO1jrxDZFSlu+OIdkIgRyYlq8D0+nqFLW0wAlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=srzoV+ideYabaTr3Mldr3P6lqUJLkQHddHcBO4S+sFo=;
	b=gv1FM07v/Fggs9L6FFReRt4DmbPJljrIlYomyAJrYalU0noiJLjswwvJjhATRV7xDg/N
	 ibD5NtB0DtNXXFVCcte5NCKSId8XV4UQeYgMk0AhQF3uN5RIUf1VoDYPlbDXCG4XHr1yI
	 yZLk+0fwj5zkvgpfQnnRMTyWaIVlzjYV5yClt5EgcMMvCwF3cCe2Q0Qfa6kH4TlW1Qu49
	 jJqFKteoBAMre86ucTfhXU1a6CkkP9aslVCCDTrlHNNzu2jhc0ipQ7Hb6+mJKcnJgqHVd
	 mxqeurBOivTsT/JFphhJnAN+2FA/6BQ1u/Vgh5w4O0Z1TdV14nE37D7v8kLdd9GQG5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BShUJPYf;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1867606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1867606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BShUJPYf
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so9713805e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793988634; x=1794593434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=srzoV+ideYabaTr3Mldr3P6lqUJLkQHddHcBO4S+sFo=;
        b=BShUJPYfR6oc2gRoPqvXmoTtBY0FJt+yRk4EMOurIBf1Q7sAGmy0J47znQU5w+oIZ1
         ln0A5xuLTf8OKmdwFqm148fdKKveHP7B2cAN2OqsBORpfiDIMGyAUXBO3dndeyVkNJfP
         ueCJjolK6LBpTRfPymOWJIg+WhkTquwKHbWhlBp09pcl04F2UaiHZwGBmSMijeQK5CF4
         /Hu2rPwh7KmF/OBjAKgtXRLMtBUcTKu0IHuRXh2kWwLwccuITy4XxFwVqiYQQEgrChOO
         c9gS9olV2du+aeTohB2hDP9AXDtC4GLRhSJQWRAXCMaOzWKySDt8Kd85l5gBiJwr2LtZ
         4yZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988634; x=1794593434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srzoV+ideYabaTr3Mldr3P6lqUJLkQHddHcBO4S+sFo=;
        b=tVK2mGDCdQ8yaG8rZy4wHoOVJJ/GwlOhq6Vsv0eoTxwUb9mDtS6d412BP4gK79H8X1
         sADzx1QIZqim0ic07pJF9Gy5eSNc6qeXjVExMYHb6p8HAK3zW0w1NkCePZi2Zx0xF7wD
         6YC4wxfIiwrnpx4D12KOzqGml9t5X7ABMkBEQ0XfqQvVUSdEU1DaOdj9PiD+BANSy6Bk
         hQebeGXg/bBbJ3cC7aXZJJO8MIfR9xXnXVeZTyfbESGreWR5nLiJOKEAR0Sdz5i/z+Zl
         EI3O4GWzRaC5L3NnKKw1dJ0Arr461yCD28EMFOXBg9uvJkxWsUU70s28LeBMMl16DGR/
         7nHA==
X-Forwarded-Encrypted: i=1; AKwUvBz/rtFhPK0mW/v28LbM9BrXrFRs5CoUMUVkEkcrGtfrIZxjIxm0H9pu21oU0FYNuEJ1VN6thVI9P6df1T0=@vger.kernel.org
X-Gm-Message-State: APuU4Z81DU2oGmUBk2WecdrBIy7GJX7lmE8Fv3xnNH8BPiJuZUhU1Xwt
	7J2w5jle5RxGvzOucoiFWbqB90Dx+u6YTjcvA26+FAspXUGiqa+AWJZz
X-Gm-Gg: AYBFou3BudHDYdfHPDQYZJ5XFjEvziNQHEbBzyo6x/qrYN5DrTfqJ+Q9tG7hJlYEUNY
	ANYusyxqTncXE4uKHRfLXDvwy3nlE8hjqfGiPMn5VXQwB4UQ3anzt3CXm3JJWO7o1dyPZz7e1uV
	PhCzAWGOtCz8BzIuKPg3pWWH7SR3kDvX1wZGQQ+iRp4eTX3MBMN2tBXtyg2JqPFA+fAoHmRkOQX
	qUoVM2D9T60XhnsFOSVM724+2B9Yc0LMRZxYDvdVo2AUfMbhlBwJ8A0vnx4HkFiQ6mNy6XsWN2D
	t66BY5UKUO+s7K2nWyzBl0PjCfSAQFDnU/5WHqr/rRzO4140jrJIFHV8S7KjNphs+9Vum/x+ozy
	kufBM1Sd2e3rmptOzo7EUkrXFcP88bmXW3xUXhDaGD70/iREI5Y4gSiuGMoL3IZH3DgqoGP76Wj
	7YlvNr3M3vuLWKEVQloOPrJ4DAxUNaXfzIH8cuflEVxToTDAsl3WsiQKWMqUhIMUk2zajd1eUbH
	GVAlQJnqHAM2PCO0z9UVsEbnimEvmZLIiYP5pzceabuufCGDdIu/D1Wr2SI7edV4FFBWUZzunyp
	QNzieYrjwSQl3px6I89chdeq7JsT7+AS3jJ8TfbtAR7P6bHmqJYH3o/oY8vdloRMBNq45i5MyJL
	5w6AeNn4V5Tm+/P3JRmv6M1oC4ah/lXpSg0EKfTWJBMdBMRJumDaaf4yK1iib
X-Received: by 2002:a05:600c:c0c8:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4b6e5ab6ea2mr38781175e9.10.1793988633951;
        Fri, 06 Nov 2026 10:10:33 -0800 (PST)
Received: from DESKTOP-IR7J1S9.localdomain ([105.99.148.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d6385fsm4790715f8f.16.2026.11.06.10.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:10:33 -0800 (PST)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: syzbot+3e16980543e238b95bd1@syzkaller.appspotmail.com
Cc: syzbot+7ff3adde89dd795ad4c4@syzkaller.appspotmail.com,
	kmsan-dev@googlegroups.com,
	glider@google.com,
	dvyukov@google.com,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
Subject: [PATCH] dm cache: fix divide error in too_many_discard_blocks()
Date: Fri,  6 Nov 2026 19:10:31 +0100
Message-ID: <20261106181031.1446-1-drifabdelmalekmohamedsaid@gmail.com>
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

#syz test

diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index 1a5072425c4a..2d40d6047ef1 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -2383,9 +2383,7 @@ static int create_cache_policy(struct cache *cache, struct cache_args *ca,
 static bool too_many_discard_blocks(sector_t discard_block_size,
 				    sector_t origin_size)
 {
-	(void) sector_div(origin_size, discard_block_size);
-
-	return origin_size > MAX_DISCARD_BLOCKS;
+	return div64_u64(origin_size, discard_block_size) > MAX_DISCARD_BLOCKS;
 }
 
 static sector_t calculate_discard_block_size(sector_t cache_block_size,
-- 
2.43.0

