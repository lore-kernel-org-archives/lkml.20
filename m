Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E626392C21
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762177; cv=none; b=K0o4TcDgsqj7tScPgI33u/nClVpud/J/UbkilVq0DTJFfZ8RgRoklVB/+LBieXeBlJJo8s/hdFWHy/RNOdK50BTSZ9qdNQmY8ymqCd9YWmF3Z69hJXgw3DCd+/u/L7EIg+rXsavFszqnr1dEczjPSHkxoINyZu9jBkkwDThCniQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762177; c=relaxed/simple;
	bh=/iahaNPc1+iKLkNg3CC/V3N75Bbs/6v+XMcSCmEyHxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lffcmD7sENMkaAT0Y8Q7N3U94/yf3P5aEXbnDVfTdxNlQqUZzd0pKVjHmdev7voqURccfWxWfh4WodGuwZkdxG5Ev2ItvCuuYiqRQ5ZaMnbeBPqIzIIKwPPtYqNKEcsFCVbPmAj2jSD87+3frLGjdhCxyrRSv3HBKDzoVydn6RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qB0MILUX; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qB0MILUX"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca7c1176317so2596773a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762172; x=1789366972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkZ+g2okmdjsiGE+cW2VDuqUMboQrNyO9NzzlBbqJ+k=;
        b=qB0MILUXzqFVppORFy7TWU2YfcXsaeFLrrZsW1uHwL6HwQmLk8hSFmArlz/f/tkGsb
         KKQ7G1IEG0Qc9Kkk3Z3KrTdZY6jEMRc+Utcl/ONNsC/rOw89MRmocD9HexxvCebS/uwI
         YwrJyqI2r8YKA2m1uusbwFrx+sQvVqaxYmamdpIRuV2W7L6Cu75ADfaeIjC7ftJa9RNh
         ewoA/VoAiHF42PJGGPeNNbUo4/z+6oQrm1YmOfZ8mVe3nuCg3TwQl/4JocAFPTSvTkTZ
         rjL/6j/PbvgqqunfjrZSE2p14gVHc8Z4ILFX2cdSOzIHHUkOFwP02pL6OTu3Hg7MVzMS
         IknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762172; x=1789366972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkZ+g2okmdjsiGE+cW2VDuqUMboQrNyO9NzzlBbqJ+k=;
        b=pR6ixdzvcKP4Uo9aM57xTgXaLQxFix+bRcUzsUUACpOli5HMXyYNWteuj/o7Il6zrm
         AwJInXYKjtPfCMt890qQ5Nhi++xlWaDzjFr06gSbaicxh3qfjll/Z8wRKNBv0NCS2LtN
         mlrfRUJDZLLThWqKtI7JJLTVmBmK37Xe+iTHBsOeSAqajzJ/QXH5/w2N0Dr2/DdqEhAN
         ooTgt1FWrIwQchu+EQnn/SZ+96dV6fBjCYyALynNWVffA3s3MFgtKMcQ/Q/4fvVKkKvo
         AbdVNy4GTFTpYodurbdK+5fOn/rqeqgFBeiw4jzg0SopOCRI6urHVFyV/3X1k9Ai+Gez
         VUEQ==
X-Gm-Message-State: AFuF++lemgGMiU+cf1cwqX9NASwDadEOcYZzRTcirY/zQn2CPPpqAF4l
	OkERO05XZ5JFJI76Ya4qEkAodA/Xitz0mX0r5SDsJkWKKgBOfthiVV2CSfCUEiCw1m4=
X-Gm-Gg: AYBFou1FhL0ew2jYmsNgntcA1da6pIg8WXB9i2FenmmdJ6Dru8XQin7eaRaTqQO7Vvy
	ADTBRjy1aC97Zf51xgco0ORByhQXOOuMhiusJPf6PoX4W9kD5zSam1+ibWjKOYG63EZYIXa8YAg
	X32Glx1yx9PhisumPMoC2bd8p8AX7LFLzHz6xCcEiqydJ1Xzuz6NjSIcf8cofPnZZngnQ7fhml3
	suofAKs4AgWnYkbKvyflNBPnoTXhLBExjs/EtYbtbkGLaFo62dzEbBO/LvdNZClDe9/E/3ZsKPv
	6QUQNB5AoPuM1r/fLq7uh0/gOADZA6TLh4E3dV13xQe5EVSexXgN+syp1uYdtlxDTgfUOuJT6If
	yqAdAyFAYdiWY/13b/MdMzj98XWfqLnULIXu4DrR1t+8KgateQT6Q/ZMKOJklqgjJcXA9xmteCq
	6eG5hjqdT6we5zXdcT3WA1XJYycQ55/3za37WZOmzbnYIC5Q/Ml0o4/oLjbwiwh2YRpEsm5RG8a
	IhltRey1Q8trA==
X-Received: by 2002:a05:6a21:748e:b0:3d0:6c90:5a33 with SMTP id adf61e73a8af0-3da39cff973mr31868480637.4.1788762172590;
        Sun, 06 Sep 2026 23:22:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24323742eec.22.2026.09.06.23.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:22:52 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: ti: fix typo "accomodate" in comment
Date: Mon,  7 Sep 2026 11:52:47 +0530
Message-ID: <20260907062247.9994-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "accomodate" to "accommodate", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/soc/ti/knav_qmss_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 3e4041454f69..8aaf79495238 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -805,7 +805,7 @@ void *knav_pool_create(const char *name,
 	}
 
 	/* Region maintains a sorted (by region offset) list of pools
-	 * use the first free slot which is large enough to accomodate
+	 * use the first free slot which is large enough to accommodate
 	 * the request
 	 */
 	last_offset = 0;
-- 
2.48.1

