Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC9B3C3787
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791567531; cv=none; b=d5BXpDRtd6w+MrjYdIdrflbByPDtPzoafG4xXnDU+PAC/+4J53hwdxDTnSbZ/ij3iTgrvgPbtSmPCQ36Q+lBEdHtm0gNaq6P5fAj6QvMH4fItSs/uDW7CzwJn12ZUdZ3ZZhXtAlcxGPGXOtY+jmCK+4zhEQsqoGXXWEVBsYQH00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791567531; c=relaxed/simple;
	bh=rcocceJzvdxseW7oSVOuLeEh+pzPMgoaU0tzjFa8pvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HlmvdHjjZW0WJgjLfGk/edr+v1JB1H4S9lUfqUsEiLR59Svr41FDbkAwkaaTbyAnZa36bl1nKU5/KJxbWYzoMHkSD2HYYH6VylaUySBKEdeetgvqQcmegRNFXjWd0TZuNhXvHR72cimNyFaOXgXNxzbrg8ExYL9Fzy/V+0zhwxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1Dpve/B; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1Dpve/B"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c247f6687dcso16232266b.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791567528; x=1792172328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vQtBsY6p+LlKSNXN5m5Dgc3FzmVkyBn0CPq52gBNyq8=;
        b=q1Dpve/BJqevJLwPZrHt/Z1nF1gmRDX2Gbm0eds6H+DRl5ZIamgjIAWU/ALr+qSQMP
         s3slCmjd7mU//7AzhVC/sZwiq/D5xpsSRh7vDpwPZe9kmtr8LNrw4wwh+U5V7ZNJsQSJ
         c1c6DWlgDDpLDRlBxfNTmC5Ds2roCPNnZrTwO9j2ONIZnKL1CxNQBMyjz6nnd5ycgSwy
         S0Fz5sSBmLBW0bSTmCSEua2chud0dSQPtakOsrJ+YzWk/w48bugzKzLN+sldPOuUu2wn
         IBAfb1eHzETMp27IKJ1gEMnBIrOqRD92Crlq9QNMyPEQqkULlbXPn21kpJgBMosnoB9+
         bBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791567528; x=1792172328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQtBsY6p+LlKSNXN5m5Dgc3FzmVkyBn0CPq52gBNyq8=;
        b=JAoCJgcMKy2kaPKdHQZM+h15QsuG623AqYvQg9+mxskAk2cwQGmqvXXeAY2lERraTD
         tlv+o0vKWqG8xU+lYxdum3/jja+BWcKAOxnz26Ptlw8InpRFqm08msorlq96JaCEmEcz
         GmriipX13cOJXm2aV6rNa6DOvQ5BowcVunCUewALLIcpNsmLD47rBXT3jfx+SOTE5P1u
         16JUWroegZR5ntHUtWiQR1gax9xRYgYiZd7bxok9yHXphg1VGrLS940rLBRcyZIn1BLX
         GnVKRkIvBuYA9zF2GVbq4GPhezdTmXx8BIbQlQ860oYK73t7zQqEqeYOKj3e7X+tpmiv
         7fDA==
X-Forwarded-Encrypted: i=1; AKwUvBxIYzFswZeda3SIUtm+Mtq++IyP+ETmEnPmURhwzAANIIEFG0rFZoGvsN6SzOHz9Ilf6/eqy0Q/N+F0S9I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIejs/qq7TZsdpLA2OMX8ucQKL+yw25M8tfWAAqTAWf3uBfPB7f
	Rt3DQW1L7RJVFq7T2JJFjag+k1ZY3JiX+Wev0r69Eqlbnd9wfnZsuU2RshG5jg==
X-Gm-Gg: AYBFou02twXMmPmg6jhxPWeeWDKH1xFFfKNVzAdhdhMIj+Z1HA+FNS7kIHuNCAbqAZS
	nBstAI9EoyPS1pUsxDZvbD+kADX5Qs7wgwQWmemxG3+dQYXdC0SyakTz4vYrtRrH5Dl/aM8ejbx
	W77SsTB+uzwkGoujtN+iw5cO74HahamEMypsLf8d2JDt7J1ca7ce3PQoGxUrPIfMfnuYiYZB69B
	wuuFR0P+HtG8UohHHYf9LJE7/8GPArOH46cJEamFYMTMOzJzYVx2C9isDZPgFBumAFnsLBpGKyt
	k/R5cj5KNO6aO5+L8OnWj+yCmxJUYT61FAGTG4re2zw56ynFgvxrIfPV+6MQoLeoHJB0/JnFudy
	7PccfMM0CofdubrIhzgvRAi6W8iM4xNtivpc1iWVkUqfAIgZup5B277CC5NpkTTsRLdf+zQUQ/5
	DEwjkn5j1Z6nkBTFQzwSTfyDZDiLOoAqXdXKH1MdbBLjlgoJfeys2omh18+FnGwjTm2idFKqAUk
	4VzqtzV
X-Received: by 2002:a17:907:e98c:b0:c2e:8eb7:53dd with SMTP id a640c23a62f3a-c31aa0c19a7mr316091466b.42.1791567528253;
        Fri, 09 Oct 2026 10:38:48 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:23fa:b7ab:755c:df7c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bcbsm124698966b.38.2026.10.09.10.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:38:47 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	michael.roeder@avnet.eu,
	martin.hecht@avnet.eu,
	Martin Hecht <mhecht73@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] add V4L2_CID_USER_ALVIUM_BASE and request space for up to 128 controls
Date: Fri,  9 Oct 2026 19:38:24 +0200
Message-ID: <20261009173826.968402-1-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

That patch requests a continoous block of controls to enable various
features of the Alvium camera family. There are many features like
triggers, ROI for auto functions like AWB, auto gain and so on.

Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..5ed91c053617 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -255,6 +255,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_IT6625_BASE		(V4L2_CID_USER_BASE + 0x1250)
 
+/*
+ * The base for Alvium CSI2 driver controls.
+ * We reserve 128 controls for this driver.
+ */
+#define V4L2_CID_USER_ALVIUM_BASE		(V4L2_CID_USER_BASE + 0x1260)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.43.0

