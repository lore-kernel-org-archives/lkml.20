Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679992;
	b=tJs79gDg7vmuGfugvMMXZaqMgFSxGPnPh2P9opbcXQ2RoQcimqg+ZWklpel7Lgj8uC24
	 YCKI+Bn2rBfJLnGzdT4lec6H6Ul57lM7ltshLuNGfESzGobRj03nsLLezrzmqqiAZK7ll
	 zp4dVZaZyJSiiBVxsO6Updh2cZs8k5AzwlCQYjL0Tq8zC7VK3cadxri6cmALKoC07iH2J
	 rTc7lycoAO6HZ50zloWL8+QjFZluKqri09YMDD+xOM9UPRuGrdGg7zkrrZlTu1G1d+u84
	 Ru4zzpLnLs74ohkCdHAAhcDfhHHv1K8l5OWbTsXK5O5DPxSt/hWpK+/CxQ8mb0ZzIcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SOI7yT0OHrSyCHbtS6CSym+qiCE7LQk8h/07mNJ/aRI=;
	b=WN/1oo/moK2CNjrjwPNFovgrjj1HCMxz9JpSVjWe5UMtnRNeAeEY0oRHknr0V5IAHFEK
	 6dEgeQc0uy9pbboEUmL9Pk4EKbPod83KwQ3FZLjOcJbLO72tk84kgU++p9+8ftpDuofNW
	 S2Y2q4Mo4x+rrTplCTfyVKBeuzljy9dnZUrhRvADtOLBYAVFs+4cCxrUaBS8ac0/oZ+8G
	 bnwOrbfF4v9nyjDCnkl+ibCA8ZtacSUZFlb9kbcYUcBlEr8ZNyyl6JZISySgCmgC0Dr91
	 tlWaqnVKxOHOz7M1EF+jkUfmLg/N0uWXESBmNcJP/p52PZx8UL4+urh1TI16u+B9vNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="HPC/DVkB";
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B77606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34B77606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=HPC/DVkB
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1133670a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792679990; x=1793284790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SOI7yT0OHrSyCHbtS6CSym+qiCE7LQk8h/07mNJ/aRI=;
        b=HPC/DVkBo4HcbBXil45ZFefmZkRsZyJkf3WYjjWDRzkhswnw0IxNmsVw/vWBCZmtpL
         GfdrFrThBDAB15NBTdsVsGxhZ49VDftZoWjPsXHPPXBQt/bnhHp3WHvZbjWolg9rrmJb
         rVJx8p+uCVT1r+6J+5jrppkkxchpu8L6zqSdMJk6rSCThBnfXMYWZBH4a9V220QNexTi
         LTQrfnJEr0ZCGQ/4+GEqCOdOQgA2C5MDpb6ncaOU8rrbCEKr0gcP/5qr0F39vqXTyyvf
         TCSwVfEWwVUqRPS/v+ao7k0KAHkCrAUTaz+4BH2eGa7JqttC+rCRT3HVbHDfoQDfEKKQ
         CJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679990; x=1793284790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOI7yT0OHrSyCHbtS6CSym+qiCE7LQk8h/07mNJ/aRI=;
        b=orOxZTZAb6CJclSxMWFr4o7TtxBcK9YDrDJIZJn9Ni8zMGjTFvgoJXLgRZKhiBjxgN
         42X5WZu8UTdPILwy5raGQJ20yqONw4WuWPqNnnPrVjk499EtyRXEDDb8UoCmhyVv/J2i
         UqvKRIrtHrvLol0XKioSQ+JiYweXyKzWOpb4GZDMGKJ645cGioMMIvw5HWfTDhQQ57Ca
         Z5vXSbqSYr+MCJOFp+WCltLV74wkP+aDoF/GoubGzb67I1k+50SaIJXKWLy6yGYDxaxo
         5hQqq2e65LqGUzEBSx3vedtTc6fTmyodd53uhk249Ge2xA603kyJlYDpi5qMGelTmm4i
         bI+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzBEcDkasBg1Zs98FasJk3mu3dIP1QGnUsVkZMWBI2VBY6vecxKNPRNxTwE+3d8dZXKfdYf+Sd6NcMiFXQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzPMgz1PMPHaN0ZaOiCkk1AE5m1qOJoKodB7Jx4xqsRXxSgfJB
	07RLX+8oqQJA7wctbspa0gsoxSHsc449cnJo+wFKt32iBbGt85Gu2D+a0RZO8yTyk7IeE/6z3I2
	Y5kgQ
X-Gm-Gg: AYBFou0rPz1nKougsIQ0oHDQpKBE+1GmrsLjYwRXuKoo0p2ASxixTwERWGKpsJ50f7Y
	9aQClX4AtPScYWFXNVhkallzA3XsK7cZTdHPJFP9bToVKY3OPjd9Wy74GTky2POIpV5d1ZbzIz/
	ulWUDyo2nXXOOv67gB7Uj8MeBZrHHLtDhWNgooNNzkP0CS0ZSeYNZ9kHhu27V8n2vnR3y6ZrJqY
	7Fev2p8He/wEndhN51DcZbEbhZ9PEbnUjA8YHSXqTi6QTgHHNRTSjWsUTIz5ri1IYxQWmBb+iWs
	VFjIXdmg+aNPFn0ynGoNMyaoIXAvyWEFxS1Aq1KHLmUMbxmNkub1ozJJJGBeT9cjzNX0cBzg4Zu
	vNybPhS5nDRg3NU6xywvMNQ7OkkCpiGd59yRHhT/ycU9ZDKSRZ8YXVCy3Y+7xonbfthFm/9pv1X
	0DqzEo9VLo2YW9OML8543PmH84ZgIUvvseNTxczC713dMKTYT8C90s9zt/juVOXccoKh0Rs5hi8
	BCZT3DU/uC0KeZlxOVTJIbPBa6nEaYdCsuNxCSX1xE4yJfrMmXOGKyhr3ilB84aUYPTyl82ZDtI
	tjQ=
X-Received: by 2002:a17:90b:1dc1:b0:3ac:80dc:f407 with SMTP id 98e67ed59e1d1-3ad86dd7f06mr4369996a91.60.1792679990283;
        Thu, 22 Oct 2026 07:39:50 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:13e0:b266:5a7d:e119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm4719043a91.2.2026.10.22.07.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:39:49 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v3 0/2] RDMA/srpt: fix the indirect descriptor table bound and the context counters
Date: Thu, 22 Oct 2026 23:38:59 +0900
Message-ID: <20261022143901.2991062-1-yhlee@isslab.korea.ac.kr>
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

Both changes are needed, and they fix different things.

A 510 entry table fits in the default 8276 byte IU when the additional CDB
is empty, so the bound accepts it and the counters then have to hold it.
With only the bound, a conforming command carrying 256 or more descriptors
still wraps n_rw_ctx and leaks every context it allocated. With only the
wider counters, a command that sets ADDITIONAL CDB LENGTH to its maximum
still walks a descriptor table that runs past the receive buffer.

The two defects also come from different commits, which is why they are
split here.

Changes since v2, all from Bart's review. The two fixes are separate
patches now. The widening patch says that n_rdma accumulates the
rdma_rw_ctx_init() work request counts, so it can pass 255 with only a
handful of descriptors, which is more than the 256 descriptor wrap. The
separate descriptor header pre-check is gone, folded into one room test
placed after the existing count guard, because the header can never fall
outside the buffer.

Yehyeong Lee (2):
  RDMA/srpt: bound the indirect descriptor table to the IU
  RDMA/srpt: widen the indirect RDMA context counters

 drivers/infiniband/ulp/srpt/ib_srpt.c | 12 +++++++++++-
 drivers/infiniband/ulp/srpt/ib_srpt.h |  4 ++--
 2 files changed, 13 insertions(+), 3 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

