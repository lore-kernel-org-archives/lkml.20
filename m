Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE432C3266
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035534; cv=none; b=NG5Yhra5V/y6PeNjAfDODzo3LlHNormRBXFmu6el9JRzzDmLPI3vQ+rWN0lFpQi5BOq4hyanW3p4vvsdmhCl2BZrd4Yf8X0XhrybeODm9jPmCCliWnJgeqj9trANLPONj4MmeuzdOuQSW5hSRszcpTDu2rX+kXsIdFeurALEZoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035534; c=relaxed/simple;
	bh=I7eufOpZZ2W3J7jKQo6amXrTAoF1j9MR2sWXX0CdAGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mkV1qpqXiUaF4Hd6eWQ0LB3Rat4O7Xa3ALxvSxtjrkktatmG/isuHBSfwVoHPO9Fn8Dj8MoK2PSf14k0yn3lCK0Dxvtyaa2IusO9Jr4TJTqXowQqn9qgiU39xrDFD9pQF7FCjZFu0I7LVJRrtDdeoNvV2A/aZCpClk/5jy65Pec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8k5v4bp; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8k5v4bp"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1517bda04a0so3370523c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792035532; x=1792640332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=STbYkXfQYBHP4vFrbP+VlU1TS6sSthQE0QYCE49OIug=;
        b=P8k5v4bpRQx+LPncerPNj0adfO/TPkNe1z0xYsKqotA1nx3fUDx+aoEzw00505Algt
         g0LPo6Lo5gGiSMQzqg2T7NyxMFKUeU82lqSbOSSMh4bDKLd7FC9EHJp0PLOkvLXwUxw1
         fDNAUH8bc7jXYIwbw71IwMp5MqSTlfAmXi02yDqRbR56y847TOZETMEFu9gKyHj8MUNo
         9tRSczIf9mGB3Id2hTygPj23upSK0HoT7LIGgl+hRWj0XqptzRZ5/fQ1psdYiRaSzSek
         Bh9FGc5SmIto1IsK0mdzCAok/kKurO4VfXapykSvYWb2kd8eFyaF/DtygaOp8l2letou
         TExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792035532; x=1792640332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STbYkXfQYBHP4vFrbP+VlU1TS6sSthQE0QYCE49OIug=;
        b=UW3Mo5l8drqe0i9QnbT4EoDf+Si0PDGl2eBcCNhaZ5isYBEGaFQ8ZyHXLSuoj0T2qn
         ugSOOgD+dXHPRq27mgEY1drHIWxzMJH0rb/ontt1Pskc9ZacH3g8RL27KKO0EVxNadE9
         aiMl7yPVeYAknuI5E2MYD+ztj/uZO41ocZJRZnEAL8W+oRIhdO6Qc0QSR1QrM8QizPel
         uLNiv0Z3/357JgNqTsFi+Xyh4JMJoWJr6Ts7lsIspEkbDAPKCpA6zlwLar4QvGkJtvU2
         nD+uyEOT5kogi+OUPvD4yi/IVLDKA3RiRi7A7nhexZMZPmI6je6Cgm8YRDP5g+FbeZxd
         NjTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQbIF0kSLSY7nolLRXkcIjVqe+LpxjQDaQkfNMoyOkG21oKFRfnE0mv+Zyh+MQ1QycqxxwrfFE6TsD0iE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTDxO8LHBXzA+WKFJWCJ59h4X5e8crzh2uyCdmTxESn8I777VJ
	iOo8zvfoqAaim52LsWAZQaKKm7hiFS1Cesj3htV4jSrOMt6dbnQfxjRj
X-Gm-Gg: AYBFou3/7ZZZdApi9hXiUW4j1PMRq4gVFMP5Lzyj6JAJeKQPbObUcTSe0A/WtxJE0a4
	IVmo7cRpV559nOG8/yYJQ1yDDYNnaaWSZGxuYIcl5tfu6oL6md0+AmqqPjR7CM6KOfKBlK/ey8e
	7fnKYBfkjIfwgcQoYnbZFV3MMaelB1zHTQTAd5yaaI3l5pFfEHjxDfbBLMBRBQzioBdrss297Fz
	10kVJ1kva6gZjT4E4BsX39pZrvUiSi6IOYvVqsNvWAokLFgtgtv9hhzkFmtG9FJVoxHz7Oifa/u
	QChVKQuVoN/xMTXaT25DM6BeAmFlFwKcLx7yTti8oqirh5hof5z58KBrdXl2CbGJayWGhgFAMkY
	RdVjOTklLPQqHreB24+OTSUWn/fNJn3y/i7Pm6uEvuC8imXxxdxuY3jk0h/ifERWLF/fBv4fgXd
	7ydfN3qbkmZxbCTuWdDNd/aqfoU5ewidaCgCDfrPulLa3FThoE/rJOMSwb77Zdtzv7cGBTo0+Nu
	/j/Re56xxGQDpw=
X-Received: by 2002:a05:701b:2309:b0:151:f0c5:7a09 with SMTP id a92af1059eb24-16a5f01db04mr27843452c88.43.1792035531877;
        Wed, 14 Oct 2026 20:38:51 -0700 (PDT)
Received: from kernel ([45.251.35.75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm63854661eec.17.2026.10.14.20.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:38:51 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: ebiggers@kernel.org,
	ardb@kernel.org
Cc: Jason@zx2c4.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Subject: [PATCH] lib/crypto: md5: correct header inclusions
Date: Thu, 15 Oct 2026 09:08:43 +0530
Message-ID: <20261015033843.6056-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file uses 'rol32()' inline function (inside the MD5STEP macro) but
does not explicitly include `<linux/bitops.h>`, currently relying on
indirect includes.

Also, `<linux/unaligned.h>` is included but never used, as the code
relies on direct pointer casts.

Add the missing `<linux/bitops.h>` and remove the unused
`<linux/unaligned.h>`.

Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
 lib/crypto/md5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/crypto/md5.c b/lib/crypto/md5.c
index 3d2b017a0525..a838bb90103f 100644
--- a/lib/crypto/md5.c
+++ b/lib/crypto/md5.c
@@ -13,10 +13,10 @@
 #include <crypto/hmac.h>
 #include <crypto/md5.h>
 #include <linux/export.h>
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
-#include <linux/unaligned.h>
 #include <linux/wordpart.h>
 
 static const struct md5_block_state md5_iv = {
-- 
2.53.0

