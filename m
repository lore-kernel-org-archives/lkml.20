Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AD63A7F68
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139315; cv=none; b=OixebCRxebsHwW+tz/mAO75zXAR83D5iriTXkmxOXwyzarPI3px9NV5LN2CA8E97P9ckPxzgrK1fM5XuwIsnVD9o4onVGzpEp/EzyfPwAY3vrVG/oaudIdPfark1yA+p3k4A6Tas5xcAdGC4yg9fzrScZO8QSQQkVSYfJi4AltQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139315; c=relaxed/simple;
	bh=56DHsbFjbbt032La1ZDE5ZQ6b4jYchWtNS/Q4wqnSSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijfq7NzAv6SPmv/ULzIXMFwEoAfaZ2PCCvDqM4f+Wf4QddoczipBxcaxn3Nwb6Y4a2AMThOrTsP7U8ooxEgBzZdvJDL/jeBelJr++jZlHk/U9TNp5art/P5LVDSGBQrWrsEgk+mxIRsS07SZX2Qv0qiPJwgYzhLTdoMdWc5NBkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=NEVNAb/h; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="NEVNAb/h"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1531176a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792139312; x=1792744112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3OFybTCapRj1qkibinKvw/kI5UMMbhQYY44MQA34050=;
        b=NEVNAb/hFkhuBggq2r+sSNzQPZ1rV6n848g9w2pr7CmWzTCLrgPFCZP+JqP3845Vzw
         Z7x1fRrIhjDCyzHQjGERPwm8PL+gh3b24y+wrxnDrxWoVH0TJsAm0OiyuEUIhrOo+tj/
         lPWzY/y8iaa5DB/bBYwDaEcF1H53bDz1QtNkvIABBHTVEXUCaIiX4tk5F8Vq+GDS7GIe
         N8SAX4eEkibhFcrqWe06l8ih1j6ZMlBwP1paPB8dhx415TBx9rR4yUoxvsOX5xWnRakS
         PqBGgwtG86Od9pGCiAIyHGN3n2q5uT+NgtJNQSLTXT8A4bmli1xcQrMFMzxgHjqIg3C1
         b9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139312; x=1792744112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3OFybTCapRj1qkibinKvw/kI5UMMbhQYY44MQA34050=;
        b=2OJ+3vLD3qLZeZ55ObVbU3ic4umtR2QJGHhJuVtZnVnQr1vWq5Fk08lXJU5LOGtzuf
         RNTfhFIuLpycIk+9BM4nm5epfpR0nZ7E76HHUY6YdUQAOzjZOjBga1IWNorx7f2E6bda
         YEI48p44VHw+fuyVn63BD/4yUkfONNhwbZNBwMH1wzus8Jtfd6XY9ckkNPX4lAPd9BwR
         TccqBZxU+u0wZozqSu2zJr4JMkiCEXfBbwjjoHW8zBEoE+/Mtsw0+AbkXSJjNG29kk6e
         5PfTV1rz45Kf3qYLdq1Tezi+k5buewiGDzVwF4y5cvmFlN8pI8eIrjvBlG9xBw4FY7vi
         2uxg==
X-Forwarded-Encrypted: i=1; AKwUvByej8cpZ17h6ZYhhVu6b/M2sfq9D1UPN6Rgu+A4XByUn6FoT8IZiLgNRCzILtmVjxMJO6GTMibdsnI2+gM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOa5idzeqPYaq0VPa2tYuWQGO8o+fqB/bdzoSCQZXS/tja7GQX
	hbhSi59Aq0OIId3xI0CMhivaMS02Dg+dyS06jOgE7z0v/XVIhoH9K06LxIGcD6H4aTq66BNUIUq
	CBxXv
X-Gm-Gg: AYBFou1fyQjdXfGR9FrLjfH518v19rgtbhPYeE3YSYpa0SGjhKS0iFxSHu1Z3ahwleg
	ng5L8cVXz/pcUpC8BK8FWAp7mspGEAP78bvVxpd0Al3RkO3I9DC/MTD+vZi4hmhtfRUclGbrgoC
	hWjSEAI4/B9srU29Y6XtsjqO8GafuVhFVn74YWIVTFxH2hwiEnZmvnyIz+ZzINV+vwv+2nuigis
	yZbLrIqnlmeloKc+o9NyVAnRLM8RJgg6r6HCzxuLlbCRzQmPrWHNXoxbW21WU22EYnUEsWiMk+w
	+z29zrvmT+WsgANcPOGtJqp48hvuKCMsgyKCqBx8G32UwTmwhbhfWLyfGWN7psJEgnIbj9ccntd
	4bJuEwTm+pKrQOpJ8W3Lb2/nDOGZNEWBx3GrLwrowj1svT4krS4PpmQuUhswEJTMWV9oNXGsHKW
	4HkTx0R+OiXWo7kgVpYepz+QdUz6WMlqEaU2TG/AHNDZggiMTzFShBMm/SmZVH+vy7hSt22w3KZ
	pU2xekYoythal6o
X-Received: by 2002:a17:90a:1582:b0:3ab:9f1a:3825 with SMTP id 98e67ed59e1d1-3ab9f1a4af4mr10274048a91.4.1792139311983;
        Fri, 16 Oct 2026 01:28:31 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc48f19d9sm3088933a91.11.2026.10.16.01.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:28:31 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v4 2/3] scsi: bfa: drop unsolicited frames shorter than their VFT header
Date: Fri, 16 Oct 2026 17:28:17 +0900
Message-ID: <20261016082818.1237059-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016082818.1237059-1-yhlee@isslab.korea.ac.kr>
References: <20261016082818.1237059-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bfa_fcs_uf_recv() keeps the received frame length in a u16 and, for a
frame that carries a virtual fabric tagging header, steps over that
header:

	fchs = (struct fchs_s *) (vft + 1);
	len -= sizeof(struct fc_vft_s);

Nothing has checked that the frame is long enough to hold the header it
says it has. A frame too short to hold its own VFT header makes the
subtraction wrap, so len comes out near 65530 instead of going negative,
and that length is what bfa_fcs_fabric_uf_recv() and
bfa_fcs_lport_uf_recv() then hand to every ELS handler. Any of them that
believes it reads up to 64 kB past the frame buffer.

Drop the frame instead, the same way the block right above drops a frame
whose virtual fabric id is unknown.

Fixes: 7725ccfda597 ("[SCSI] bfa: Brocade BFA FC SCSI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/bfa/bfa_fcs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/scsi/bfa/bfa_fcs.c b/drivers/scsi/bfa/bfa_fcs.c
index 9b57312f43f50..711d2ed83a7aa 100644
--- a/drivers/scsi/bfa/bfa_fcs.c
+++ b/drivers/scsi/bfa/bfa_fcs.c
@@ -1552,6 +1552,11 @@ bfa_fcs_uf_recv(void *cbarg, struct bfa_uf_s *uf)
 		/*
 		 * skip vft header
 		 */
+		if (len < sizeof(struct fc_vft_s)) {
+			bfa_uf_free(uf);
+			return;
+		}
+
 		fchs = (struct fchs_s *) (vft + 1);
 		len -= sizeof(struct fc_vft_s);
 
-- 
2.43.0

