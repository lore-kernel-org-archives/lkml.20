Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5348F315D53
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790401779; cv=none; b=oHyHc6A7j6rmm2KCRsKewbStHHYID9VMuuU8ZI1f0ZRvfRhzKXElq0eLWoBC/FGs6SiNyQe+ryTHRfh5fwb78fzLdZFNGPp2Ar153Pw9wy72grXqaP06URtp7e3C8TCPOqCiC0PJX3oNLmsl23LiC43zBqGLnI3Qanr22CjmeOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790401779; c=relaxed/simple;
	bh=+hev5PH2vhYwXtrJnyBZNH9uDaSD97Y4xwd4MuE8gWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aoX/YQeHJDj+H1C2tKaC8xgi9Blg+/K2YmGdrfuuWPFT1HKuTKCGmpnTso2EwW6Am1C0xxKvfh+XK9XdSbLluulVlqMuLGrldc9SXJvTKkpR6tn7idPiBMGfOgFPmIaKLmx9bHs//RsrP3o/u9N93ZutXdOjs9S0ygn8lPpC4Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUiKK8e6; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUiKK8e6"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2d747ec6185so6352145ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790401777; x=1791006577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bc4lPfWuVIP6LimbcOmRnoo1k4uOtFv6epL7v0d1oMA=;
        b=VUiKK8e6tIS7foLpC6IVFDbVAmtu59V+rh1fn2c3CT116iKlO4aoAHUjw0CXW/nesA
         07Mh1xbD/AI45EegQe0I/fHFQTGeUNXNaiW5SGp5sg+PlASwAyc8h65BDqsitiinix9Q
         vAslAoHGy6sho0ZCyRYVwViSXYF3mKt2RJsnVvyHtyVWHIfBHKC24mHpFzTl1IDrIGV3
         Vs1G5qYDn7sGSWSukcb6nKRAnBPX7/weFkczHyyYvigFrmH5AYVKddGAXUO+bJbVhKGK
         OILOSqlVKQpTN33nXW9eEOCpSgv+clyuwDzdOtUDTxN6/3CtzhF/iJQ5786ljwYmhyuz
         5E1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790401777; x=1791006577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bc4lPfWuVIP6LimbcOmRnoo1k4uOtFv6epL7v0d1oMA=;
        b=BHGyf9OnWtNQ7xtpYnJCuR6kogfSYCBAY9+9oQoIhIoWqDjqGCwFQgpmC2FcmTRDr1
         KL9/ec5P2rsN8WLprYQMufcLe2K+w17aDqTfzIA6V7QJazCQ0C6l80Ua6j/auduZ+S4o
         M4RC84vLm92kbl+L24I0DOqbiy16+VoiFVt3D3242puWY3ct4Jf4I94S7gp/NgjrCq7p
         Nr7ROSY5Z36WdP1WoukYp23abjNhmU0IydAWvg2pfrTsS8fDPYTy22Ty96EmRYK2n0rd
         U+em9X5H5szom7xOGYwffkwNVaN9cBcsBw3lphYnIfSNsDNJHsZSU2H3+SiaqxbUrZFG
         +f5w==
X-Forwarded-Encrypted: i=1; AKwUvBwqeprNy93pdv0g7uMxsWNcLBLg0tdzcvIiOQXG83Bi44bGIDcZcdByKe79ybXblvNLpe+lXED5cbsAaWo=@vger.kernel.org
X-Gm-Message-State: AFuF++n5sK44uVOW1cYsn0JBEyeo/28bVO/m8sfaJOUdNNoa7BZNmK2m
	BZF9C/sn2WhgpQlLK3fNWLd95yM8CJf3Ro4Ci4AM+LtzrJVcexApU5VA
X-Gm-Gg: AYBFou28P1Ti5pR9ZqQZktP3Vutx1ORoSHZLMQ57l/jyzRNdHaaB2yi8wz8wInWhX2r
	4WXhGz0u5jt57p1CDeCqf9FEmKKW7O0ts1FchAck/gAAcmXNqwrxk6dYes0eQ9IH0lgbF4jglh3
	GIXhHgs0Pg9CE0G+bKxfpc0fTNpvT/XuLeHqkx3MCZshR5gSnyCLZ70cxGI5f6ODq38jaXhJOTe
	2pFQN+fVUN1hvpFNy6YWMtUxQYBypo6wVCFloZyZHMDDn4QXUDcrWl3sKhHVZRQQGbp68NMjy46
	m2b4zHnSFs0pPjTRDF9kKlULHTdWTjCTfF9dpTDKrIq4y46x90+hqVsuGLc+UqkBhev1BNmr16t
	OulvrpnlK9jbU2WJxxjkbRNhiHndbnaT1LyrC/RwZPQoRHL16JxnNE0ALuBouiCUl0YVxS72X5l
	cAOJQ14kQPgl1CAWh1ClGBpVVLV6yZB+r+3+V9lE+it1e5WkbxWL6eYya7EiH/mk6rdmWqMeYDp
	7mT80eRiT9CdSsE4R8J+ngGW7aPKz9lpn8NZJBuGndM1+7wc0zvyvUB7p/SZSrcrk9AhFzSjnC1
	wl0qvc8oRcnaGNgHsVNaFjsx4JYPb1EYoHM39w==
X-Received: by 2002:a17:903:19cd:b0:2dd:c100:4249 with SMTP id d9443c01a7336-2df7e13fc47mr65469735ad.45.1790401777482;
        Fri, 25 Sep 2026 22:49:37 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df914024c4sm18622805ad.31.2026.09.25.22.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 22:49:36 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH] media: rc: fintek-cir: process a full RX buffer instead of overflowing it
Date: Sat, 26 Sep 2026 15:49:29 +1000
Message-ID: <20260926054929.2686772-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fintek_get_rx_ir_data() drains the CIR RX FIFO into fintek->buf[], which
holds RX_BUF_LEN (32) bytes, for as long as CIR_STATUS reports pending
RX data:

	do {
		sample = fintek_cir_reg_read(fintek, CIR_RX_DATA);
		...
		fintek->buf[fintek->pkts] = sample;
		fintek->pkts++;
		...
	} while (status & rx_irqs);

Nothing bounds fintek->pkts. If the hardware reports data for more than
RX_BUF_LEN reads in one interrupt, the loop writes past the end of
buf[], starting with the pkts counter that follows it in struct
fintek_dev.

Hand a full buffer to fintek_process_rx_ir_data(), which parses the
samples and resets fintek->pkts, before storing the next sample. This
keeps the parser state consistent and drops no samples. The loop still
relies on the status register to terminate.

The driver does not document the hardware FIFO depth, so it is not
known whether a working device can trigger this.

Found by static analysis tool CodeQL.

Fixes: 9bdc79ea07d9 ("[media] fintek-cir: new driver for Fintek LPC SuperIO CIR function")
Assisted-by: LLM codeql
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---

Notes:
    Compile-tested only (ARCH=x86_64 allmodconfig, W=1). Not tested on
    hardware, and there is no reproducer.
    
    The CodeQL query behind this report was synthesized with LLM assistance,
    and the fix and changelog were drafted with LLM assistance; I have
    reviewed them.

 drivers/media/rc/fintek-cir.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/rc/fintek-cir.c b/drivers/media/rc/fintek-cir.c
index c196ee923ecd3..ce9c4eb4514e4 100644
--- a/drivers/media/rc/fintek-cir.c
+++ b/drivers/media/rc/fintek-cir.c
@@ -340,6 +340,10 @@ static void fintek_get_rx_ir_data(struct fintek_dev *fintek, u8 rx_irqs)
 		sample = fintek_cir_reg_read(fintek, CIR_RX_DATA);
 		fit_dbg("%s: sample: 0x%02x", __func__, sample);
 
+		/* Process a full buffer before storing the next sample. */
+		if (fintek->pkts >= RX_BUF_LEN)
+			fintek_process_rx_ir_data(fintek);
+
 		fintek->buf[fintek->pkts] = sample;
 		fintek->pkts++;
 

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.43.0

