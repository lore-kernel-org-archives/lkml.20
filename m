Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D653932F9
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469662; cv=none; b=YBX+mtpfZ50FRW+9/ABZ3dgx3o1ptWNW8YWCbf7mCEAmAhYO7W2wBIhc/aLELCXbUtbSBjvUwjQaVCqexM1Jz0+YUyv3QzaLrD3tna8NzTHRbweEi/KsSshua55W/pPCBUUGs4mSQLunJwJuTFPQFKJ0vxTDlKc2IC61z7ZIKvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469662; c=relaxed/simple;
	bh=iKkQeQlMycpf9iMeYIDxTMFKhkm0k4gvvGsiA/LaVio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AWxx/sAjaK//NQmCO1rLRgCXv+EtKnTZsNtTXn/1c2qBaz92nc1NpKpZd2tQ0QxxvzKnevI1kmUdD+3SB//ZLn3wzc0+oUlWX+CIzAsgwxN+JFMzyC47u0aY6JVQWRBZGTbhki9ShPw0qdM8hSY9UoI2LOTitKfGq7vntsbduf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VolJrv2D; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VolJrv2D"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a168355946so28384815e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469658; x=1792074458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sSg7ATSQQubxmgcmTMIuOrcHjExSpPhZ5BBe8FJg+Ps=;
        b=VolJrv2DAUnM+SUpkvGiXCm/BMhF763UnKJA15ea+gcsO+VaMoIBMiwdbx5qPRwLBb
         BVQUYzDe/vb0kHQrKTUr3tJ0X1kaFML7vYvJRZz+lS9L5qr6q3w6USFcIQh7jWgex3NY
         Bj6rj2mjvqlVXCYKCbVVhwvDZ+Os4fyFVgjrtU/sARLSfKD4go8tCY7iPpPsoOIrLxFy
         xOzbpyQ9bDvnJrPXLiZYHleu0ARlms1KWtufeh5/YIF6pPN7fV8UnWTAonDjz4a5rotj
         qNnANs0PGcL2k91xlTmMKjKGlzbyxuyp1NRblyoJEH4BN3xCyqoumuEMiIKZXH7Do4o7
         VykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469658; x=1792074458;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSg7ATSQQubxmgcmTMIuOrcHjExSpPhZ5BBe8FJg+Ps=;
        b=ySoOH2Nr2LoXwYUVpAADLxTCGyE8rUOebWLpVNEjGxAuMx//QSz+wCZGrMz6v57DSO
         QbSBSmV/+7lXh50hrAKU14PTm1va0qdvQ8Z2djt/N3+mvoEorrsfqsDK50eqvSnc3310
         k+CfmVlPYfeQj5FIwL4/gCt2E+zkadCdjDR3TLxKWkKOp5Sv/vEQs3wd923DqclIOvoB
         eTb82YfnYWjxJkw/AiLR9YPmCReU9YpybnnWnX1twbKBVGcR5pNZFjKgN1CUF4X5FwAH
         FlwC6x7gh7k7T8Y3XfKyM2OSJomRV7I8hX4VmcMU5VV7XNigVuQuwBIYlm3gZugPbHXG
         uljw==
X-Forwarded-Encrypted: i=1; AKwUvBy2kYoV/fulQInuzEbrQesOS8NVlOcXZOpn66DeEx+NnK0x0H4dWwf3a7xmJ+ZaUuqc6GKiYpL60SKe7kU=@vger.kernel.org
X-Gm-Message-State: AFuF++n5LxHHYpxG0GKHNWRstEAUpaD0XKsBSigNZgde61HOLIk3kbPz
	F8OVKaLMUKqbmXOxMML7qzqrN3Nc7gMEm/gWQsAcSh2bfhWrl/sWHIhqTvg9cQMW
X-Gm-Gg: AYBFou1vLhB19Pov5yy5dFizVQpQIFUvHb103F+LuWws4N7IbXgl5qYEGbCaJWI52I+
	O5z3yvEug9ArXZLL1ljEueDZJTdSbq6lLZxu2kgoBKIOO0pgoZE1aO7VV10dXFTuaINhmq48Or2
	31WKXCYvyO7GB580LqyEo+UkVsQN8tWcDlVIz9pB3W4/Fl6ymWLc7HLN/6KL5VnL7TSHklrC3dk
	gx/Ko2qa6ZPdaUZC5Ncyl//SUOzPeGl6wJSNONLxZXAg4P/RsE+N5477poA2xZHS1BEIZwIshB1
	1oja0aHptt4TaHcSTHqWiz70/2FR08IXLjbcxzH7frzOVfbQbbdmUi+fJYLk0glaMCMjqBDpocA
	0MPbPWPyJfbCXTYHP6dtKK84fGf664Ip3Fg3bNlKlKLZuX09z+fJzyLRcheroC3jzCITwt1wnj0
	suh5RQ1HmoXfJUYGpqRJrUZtQFn/HGbz85wzD3809pNT4eF9KZIpeX+ABg5zGIazTiGSGnksAYR
	VUStO6f953JLJ6ibrWxlIU=
X-Received: by 2002:a05:600c:8b6e:b0:4a1:78da:d271 with SMTP id 5b1f17b1804b1-4a18064be59mr102776565e9.30.1791469658475;
        Thu, 08 Oct 2026 07:27:38 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843bd060sm92856175e9.14.2026.10.08.07.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:38 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/27] selftests/landlock: Use _exit() in the named_pipe_ioctl child
Date: Thu,  8 Oct 2026 16:25:50 +0200
Message-ID: <20261008142604.39107-23-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In the named_pipe_ioctl test, use _exit(2) like in other places.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 90f63af1d64d..ba3b39ad5882 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -4276,7 +4276,7 @@ TEST_F_FORK(layout1, named_pipe_ioctl)
 	if (child_pid == 0) {
 		fd = open(path, O_WRONLY);
 		close(fd);
-		exit(0);
+		_exit(0);
 	}
 
 	fd = open(path, O_RDONLY);
-- 
2.56.0

