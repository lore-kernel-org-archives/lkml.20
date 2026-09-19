Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F23334CFDE
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789836738; cv=none; b=qk6oN0Xcku8UjVZ3CDzn/p7dxN06ApWm+qRrVO0XyCH0MLmNRT5GiTMHc52nMrBwGEp1DItqrPRud37G/SrTwxzPnZjEocGViffHr60gAAtDuzTRBUpvi9u7QEscqb3/JGyrMrZCEKeVPHkXcYUP83R6DA6lKNFZD8Prw2q9UsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789836738; c=relaxed/simple;
	bh=FKmT0sInzGZ8xglTcpDpC+2cWv5nRkUqMW5XaUUWFgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XzYVldQv2Ve8DbDhIxXnjLkx0YEawld5eJ36iGDQy82/gZuJWRYoVVIIdlbj9jCX6o9gAiDDAr6Ig0UX7qV0F3OGxE1vYrrYKW89y+bQxoWmxo0m0SEs0gpDXddu/kcblccCZTwDYbxJ340L0yAZdmoy3KLcK1pdZxfWFB/DqJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qaYGOQ7c; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qaYGOQ7c"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso1886403a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789836737; x=1790441537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=efPfDfh6WJd7P8cYHSc3/SVG8GD/7sjcKyH8NOMuMCc=;
        b=qaYGOQ7ciDfc8O8eNUKja2SQFez72tcJYQUtPE47c/mLRqYuBJpGJHJZcnU7ve7aBq
         Di5QrMH0cWP6aSrhKhbH5vjR/b//CxaFol1+5TRLFgpH8qnqxPfx+VTFsbLOHu5tJ3kB
         GwMOrFJRX9DtorKfmopDaNVDK1kZqAKr1Qj/kX01wl6cMN+CTmIZAlUTwK/rSjTipFUn
         2f4VfKruTeAjOqZZt1peknPkkZZyAD96Hw0OzLC+qjHsCuRqmlJEOOEuN0zwr8o/09Hk
         wg7p5o/e4WJs+cagJkaSe3OtkaG2veEWh1taKfupJkI11xlY2BjHs7rQ35+9+ESbx9TS
         mv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789836737; x=1790441537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=efPfDfh6WJd7P8cYHSc3/SVG8GD/7sjcKyH8NOMuMCc=;
        b=KClFh5uUVaS8CwIgSIYtc/9vO6NDXg7oBqfT3IHMpwOS9bL9rhaagAXWsxj35EzIIQ
         zt3YVj7GULpod3IRKi/jXUed7UNJ6aL69/H2bRfvtMlePWV1YwvCFqRraKSDiB0k/LEd
         w2NE0ri3quNjdgvdf2n+MueA2NtUjaQqqhYs68aWeM1+4x8o/B2GRfKItYdLQNnzIQE1
         DIK9HP2b95ZI+5UfViX8vg+082DSjQ09af8mxrYlybwlp3LkuLDaVfW+zoqrWECzgPJp
         9g9NpjzelN9KIpMoSEJxpXO2o5VYo7g2tmjD+KzrmysW+F0177Pni9Ohp40CpjDd7cFf
         Jrkg==
X-Forwarded-Encrypted: i=1; AKwUvBxUk//2bTqMeCst1LCGvhtKv8Aon99sB0HKS4JoeHac/X+wubAIZ8TpyGcdyCld76f4ClV8HdHTA/SjrrE=@vger.kernel.org
X-Gm-Message-State: AFuF++mb78BE+CNs4FMjEQKrgAt1zCqWlpilSKNtf1MqjmfRfwMETGSm
	AWibK56ycGUPd9eEFe2hqiid6olr8Yf+lJRVNtUzGRUcnUjWRlSnvo5h
X-Gm-Gg: AYBFou3cnGyy4CEsTxNnQaL9Ncj3Al+07H7WeTQsEu0YtpyMI6TX9sjiV5WNWrxEaz8
	QPWH+ldLwnwc1vh70gXGVvEIltD2k0JnWGzEfNEI8C6zi1vuduTvcXpi8M2AkySaS9neLs1M5rK
	r7cigOS25SbDpOA9NCjRkJlbK68w9kgMLWkMF9gC5q90VW1nU7Iwo/rMGAny7ewWkN0k3hXenHN
	twbIxImgBRdN9VmR0dmilgOaMy+su5p/y7rrRS1Lil9VR7ubBP0gipt+TGL90NBRPy0LV9arIxc
	y3lohwO+wrf3pDsBYv5F6a+FqzwsYLVEknv+oB2LuX9rlO/QEzItVW1Fi0a7CFyBU1dNrmLsUNB
	JCzyG+xxgnJpd5GGfV7YqsM1NtLT2WZSbgsDSAJKLTDBg/QjajanwfOkGaIkrxewYk07aopoXcy
	SVbM9QHY9Ese7POcDJVpsnk26DlIdF5t/hJbC8h1bjyJLlJ7PC6L2a7G/zcqfGuZzjf42VtIbDW
	b9JFb3VdCvuzklInbj5Qw==
X-Received: by 2002:a17:90a:d40f:b0:39e:6c69:9b8c with SMTP id 98e67ed59e1d1-39e6c69b291mr4591077a91.49.1789836736571;
        Sat, 19 Sep 2026 09:52:16 -0700 (PDT)
Received: from shaym ([223.181.116.106])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55e8954sm13966859c88.14.2026.09.19.09.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 09:52:16 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove redundant else block
Date: Sat, 19 Sep 2026 16:52:04 +0000
Message-ID: <20260919165205.9896-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the if branch returns directly, the following else block is
unnecessary. Remove the redundant else block to improve readability.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index d18df407e365..cd178ddfbd00 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -552,10 +552,9 @@ void ODM_TXPowerTrackingCheck(struct dm_odm_t *pDM_Odm)
 
 		pDM_Odm->RFCalibrateInfo.TM_Trigger = 1;
 		return;
-	} else {
-		ODM_TXPowerTrackingCallback_ThermalMeter(Adapter);
-		pDM_Odm->RFCalibrateInfo.TM_Trigger = 0;
 	}
+	ODM_TXPowerTrackingCallback_ThermalMeter(Adapter);
+	pDM_Odm->RFCalibrateInfo.TM_Trigger = 0;
 }
 
 /*  */
-- 
2.53.0

