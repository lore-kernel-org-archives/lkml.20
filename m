Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802175;
	b=Cw2uWM01yCWBVBeUgxzg+g0h3f1Easv/GtcWDAmsMbCppGYQaYXVXGDVynTzD9jrshFL
	 l+zdGXq6DfXbiWxoFR3XdYePRAUJgus2P6didrxSs7MANH7K5ZlJ9ztg7X5wjv/a7dUbd
	 IkzgkU5zGo7+a7p64rhO/M55Syx70TkHuxelqGl6KaMSw2p3zx6tOgjWEXGckwMgPUErj
	 vhNB7DH9TfJRSkbQ8/Zxr+gmCrpf1fvhh9d3xdZgOfWOsNxPrafSIo3oHm/PUZq8nNu4w
	 WqTkh4dS2pYk/er0cjRXccR0YUQa7OC8w+Bf6DrMYgMQVVV8FA8zvh1wcX+TPBzv1vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sKcclmgJVhnLMVPLneFBpTL8LFfEdvb8QzwcAhBl0MQ=;
	b=kQDUXa7NpbznjzWWQiucJwg+yZZCC4FB+5WGPB8FeJl8+DdjAumOkWMOrZHkePJ9R7ud
	 8mOu1CrPhSpvfYpdQB5vzhIA4cce8CDFAhxrwB9UbnbCkxl1MP9Amdyvv1E9TFTsDNanM
	 6ZJp+MYbWyIqZzhul8we/CkNoHCl7Ujjndl+2/pH4poGZeT9koaZDIrihM8nsdpC1Fa0V
	 VRWm2gmSoF4QpmyzWFC1VZBCW5vovIOIDkhKt26Z5TdSTiEzuHjGBRsjMibSXB7AIOfaP
	 wGvmy6zxm3VWrJaLUUepTZnYTkNNrYyYPE5vqn/Aoi4Nm9iS5klxIWcr+Q4RMwVJNEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gIXN98x+;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF56F606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF56F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gIXN98x+
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb9f760337so1712853a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802174; x=1795406974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKcclmgJVhnLMVPLneFBpTL8LFfEdvb8QzwcAhBl0MQ=;
        b=gIXN98x+kcFKTECkMPw1r0nJXuKeZt+Ar2SkV3GTeMnMeE5uBHOKv2dfm7IfK3Mywu
         jqQBxQBhkN4icJjZyZlBQNr7b0WV4/I/DvdoQnWOuvkVnavtRjG5MXE4Bf8OlRLvqfN4
         1MaZceFDdKxgSajh6LzFy6h+A2BHNt46TX6fJbH1Myp3acfx6c/GUyEtNYbKvc7XjAQ1
         funrqOxfcSg9ARFKSX+D+WeZ37DjMLlAU/eM0bthLXBp7Zuz8Fxl+4dnIi5zxOOjmoy5
         GZH0xmqXF1+PZ3YFl2JjKIQGm1E+wv3BZCy7YejP2cFJTX2Fa/Vwepm5apMUx9evOfGl
         Ph8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802174; x=1795406974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sKcclmgJVhnLMVPLneFBpTL8LFfEdvb8QzwcAhBl0MQ=;
        b=nFVkl/JuxAOco0rIXiQaA1GNtBxIn4NfG7WNoBAskcsqxag5hY0q3v74ArUigjvitL
         EJawERn55XoH23sc+Hgueut01IZy2DRSEDFlXVB/KJSnETgvjzHqLZv1qORONiYWGHQq
         Dml0RsbE8Hgaenm+01lzXCRtvTUrXS21CozShXXVmc4+E6DELDBXAqAEE2ymmhQxutjQ
         hcGrV1IwQ0spF/bwxJiOaEp8AN0gOclU6eMZ9OJ9yZLZLMSBcNJNvTQU6451vGsYFVw/
         7Zd0y38ZgbyQHAUw/Gswb75dNU3bqtXHXnocFR3H8ssc+YTUVuFrnIJGxkMM91ekcQoq
         VrUw==
X-Gm-Message-State: APuU4Z+ws3wCWOeE86mP5bxLnUM7olgekb2OsonCgYZEMiU5pUfcO8kH
	IiMmyLsP4eF1R+oZ919UFSFdcRizXVpPuEoyfMPNvTNhA82og4AvGbwB0PJFWQ==
X-Gm-Gg: AYBFou1NWWfGwZJKhRGFJlf//nyyQZCoWslukLNGzLOElRCFNrirqvozh2S0FlWwr+9
	cyfHpzCNNQ05fhZqQRJpNYTUslzWlaO03Tvn2n5DgX47RV0YmhaW+6gmJrXVfP2PdM8AqCbC1J3
	cMSyzWYeG1Dd/xSve9jc8KWXJW5YW/hiHn8qQd49T/JNBgVF+kx2ZVW4lmA7hyggvlfAi1YP7/j
	nAE1A4euP7SnxryqrnnvLtQWhYPdfmHRiR7sLn+wJbx9l4HIEwGBU/zcbbKL8hWKCGl1EhSe0NL
	Woe+6f4CYB3nvVm47eVolac4sf2/HgJ3AjC0gjA/lhZA9P9hmk6o1U7YNXgFEJ7A2bd07Vqs13y
	o73NDPq7lnvMkdvNwD4NoHMOAAsx3eq0ulKAQqFqitcx4PFBSFYVvNBX8jc/SBD0PY0SCPZbx3L
	yb2DnoJynFUrQk7DbWHpM3rkOOxSKcigk25LYfqTEJFGHz626GRCYgoS8z7OmNHBKFafid3TdQ2
	jWST1hN1XeTV9PUGQQ6uHUmwbWy90zHDQslvGd22Snf+noEn7REQhYZva33Io3n1R55ZClqaoJ9
	kpNwMS7tQj6D5Y6ddvRl4+c14COisPjd5UlQkbqYKcWZdzy2XhBwc2sU05qh6J8PPasu/FaI8/E
	VVyhxIX4SzikZy08Hq9ONRZMWvMPEO6N/xJzpg0AFvWAmGG/jZOi3v1QUbfrKRc7doewd
X-Received: by 2002:a17:90b:4ec5:b0:3b1:6689:a016 with SMTP id 98e67ed59e1d1-3b1b0b8f9cfmr5536642a91.16.1794802174329;
        Sun, 15 Nov 2026 20:09:34 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:33 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 17/20] f2fs: support subpage blocks in online resize
Date: Sun, 15 Nov 2026 20:08:48 -0800
Message-ID: <20261116040851.2849696-18-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261116040851.2849696-1-daeho43@gmail.com>
References: <20261116040851.2849696-1-daeho43@gmail.com>
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

From: Daeho Jeong <daehojeong@google.com>

Resize works in blocks, segments and sections, independent of
PAGE_SIZE, so remove the -EOPNOTSUPP check.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d6304b705e06..64c91827a5f4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4325,9 +4325,6 @@ static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
 	__u64 block_count;
 
-	if (f2fs_has_subpage_blocks(sbi))
-		return -EOPNOTSUPP;
-
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-- 
2.56.0.611.g1030f0b940-goog

