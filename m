Received: from mail-dy2-f25.google.com (mail-dy2-f25.google.com [74.125.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4103346A5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386034; cv=none; b=rWdrozWoL0K3eOzq6g6zDiNBI35D2d+5U/WL4rTsJaxSP1LwbagYDnHjkBC/AlbTypw+87RLHria6xA2sWYuVaRoDCEc8NKZNyeayvYbBJ7jBegS+ZX6Cpzhfuxr/4vt+/aWBWD3iZkc4iOv3vfhcup4ejfZW7sDzmKpCQkPyZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386034; c=relaxed/simple;
	bh=HxmObytxjCVZYN2/2tU6MMECZGCcBAk3YBZLxGMIJbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2nN6Hcc7AG5c5aKTOBYFwS9tJj+1cLg0U9NKxTF3WpWTZumBEv7JAiWNe8tEofIrK6psTOItkLkhyRlCnrWy+cvrLAbA4PC+d41U8Fo950bRaEtb3JTPQRQlserJeWZkfGgapJZLvl04tATZGvFGNY6LJcGdrfj35K9br5+Lsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlwdmC3y; arc=none smtp.client-ip=74.125.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlwdmC3y"
Received: by mail-dy2-f25.google.com with SMTP id 5a478bee46e88-328664e061cso1592379eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386032; x=1790990832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77lqY16nUTs2ynMxLaappVwJ4p8VGXjrsXXCnEIe9Ss=;
        b=VlwdmC3yGPZsR0ddpjLsTz6r9If7pvLtnitmo++ALsbGDfGVj+eWAZ4iqrdrcVjhIJ
         2uE4HwFVlxvg3LvC1P6fI4ZSdUBYKXoyuzF3KvUSAwTMX4owTpyAB89niG8cw3aEOpFn
         jjgYkummqUVHPWKzYa8fXavRJipgu4lTQnbb9Sv5iycF3iswupK342QFMo9Qtf7tSqQd
         pkLYzCGMxtC89qvs1Re7CB7z0W9reNxYxqFlvw7Kv7nYPMIyKgh+ZTAzZsQ/e1iwvJdg
         BOE+fzgY1AAgQ1vOIk05KZQLCmASHfFORRkrdI5cMbXd9kdh1HwIB4a2YMnln5rJt0Ck
         brUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386032; x=1790990832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=77lqY16nUTs2ynMxLaappVwJ4p8VGXjrsXXCnEIe9Ss=;
        b=vKn5rDKSmqPEPPGg2Jw54byHRH+gUXwksW97P8A3HSc2kgi1Rbso1AOPwOyECYaYGG
         cuofzNIt/QiBBdI05onDQK9rTPlXRXg4kGrVI6S0dAMOqODz8TYo8LyhX7Zyvo0weZWB
         CVngeKvCg/FJTpHNyxP5DM6Pj7vPeo/oWm59t18yig7nJyWOvkFSvLvV0mmk0kT97WqN
         Lt/oHuzyUtTZW2xOmIfMFCXuphbYIeVjjEAV/YY2PMQgwrwedTC0stTeiNQC+h5YdE0R
         ptc4gYqzSZqp108bTDgUNRnR80P2HEtYsjIJiqKH9VKhqDNWAvlFVlkQ05XosNfghKJJ
         IFFA==
X-Forwarded-Encrypted: i=1; AKwUvBwJJBWNz2DGxuVtk354ByYqrsW+O/TF7t2LbyAW2yEKt+DGsipWu0r8i+GQ0U31PkAFDy0OusUw8VXtL/4=@vger.kernel.org
X-Gm-Message-State: AFuF++nTIuV06ca3IFVtWX7Nkr3CdWrQkb42DYzmQTvx3ME+IwUtHM0e
	Z07jR8fduiSe3yubsw2TkkDDRuFra6p1u9XTLXDAQ267DhYXWUrwsOK4
X-Gm-Gg: AYBFou3BYh/AAcwkj/CoQDt2/jGvJDDapNmjvvcB/eRHnwSWTedZSlu0lvhPQYKQZMt
	YRA/cSqr+HwcvtTvtDEtSp/o8oZlWTL9e26iM/XSWvT/f1g2s56srQ8MYEWVBU0Rj3zyCHLD2Yc
	vDoaX30hUr7LwEQEYTe4qL8xxCuy9FLC0Wb8k7NVVOTNIMD7V/grREfJfKBEqUOPYiTJFD1ckIw
	FnvYKOuzekJarZWyFgxQbeBS9cHMd1KD0GN6CzOHgiIAGWDvMSURy1VOIW+kyiPGrHrF3TAczNI
	98OKT3MArvk9eXGbUH4ECEV7iTpNQfnLPRyU0Usjcx390BU1uRKqb84IWQG+2+vJXwzVFD7HqIx
	1EztiAkXNnVxpqsZwA3pWUKR7++t+On/Z2cfalx43M5vSn7p3fukQz+p+qwNpZfqg0f8G2WKjzg
	+1O1qwATrnpNF/jMgLnZGUIO+Jr+NVc1ppSxx7deh3DIpluzZZ/4kI+P7O4V9UbCNtUfr1xmt4B
	64s3ZsEeXfbrBRJLkYQ4sNCA8xQmLlHwfCEBQMYi+BUjbpkZs7DT/hKyZj4uA5nEKty8A2+BBfR
	jz6FYXXm/3f6w0yeSRD602TIXGTpTELBGtgFhyQKYdHn2QLlYUus3gCXUuVCUgJypL8bri8KxiN
	ytkJt/ivq
X-Received: by 2002:a05:7301:dd8f:b0:340:9d9f:a5c with SMTP id 5a478bee46e88-34273550304mr1408469eec.36.1790386031997;
        Fri, 25 Sep 2026 18:27:11 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341f2b18cbfsm6746171eec.30.2026.09.25.18.27.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 18:27:11 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] bitmap: test bitmap_parselist() with a group size close to UINT_MAX
Date: Sat, 26 Sep 2026 06:56:51 +0530
Message-ID: <20260926012651.15524-7-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260926012651.15524-1-jain.sm@gmail.com>
References: <20260926012651.15524-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bitmap_parselist() cases where the group size makes start +
group_len overflow an unsigned int.  Before "bitmap: bitmap_parselist():
don't wrap around on a huge group size" the region walk wrapped around
and also set bit 0.

Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
 lib/test_bitmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index f316a82840f5..ba09d057f47f 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -502,6 +502,8 @@ static const struct test_bitmap_parselist parselist_tests[] __initconst = {
 	{0, "0-N:1/3,1-N:1/3,2-N:1/3",		&exp1[8 * step], 32, 0},
 	{0, "0-31:1/3,1-31:1/3,2-31:1/3",	&exp1[8 * step], 32, 0},
 	{0, "1-10:8/12,8-31:24/29,0-31:0/3",	&exp1[9 * step], 32, 0},
+	{0, "1-1:1/4294967295",			&exp1[1 * step], 32, 0},
+	{0, "15-15:1/4294967281",		&exp1[13 * step], 32, 0},
 
 	{0,	  "all",		&exp1[8 * step], 32, 0},
 	{0,	  "0, 1, all,  ",	&exp1[8 * step], 32, 0},
-- 
2.43.0

