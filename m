Received: from smtp.inf.ufrgs.br (smtp.inf.ufrgs.br [143.54.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ECF32B99F;
	Sat, 10 Oct 2026 22:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.54.11.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791669886; cv=none; b=Wc545t5IdOS50G8246xogsUTCJjQjEVU/DqN1Axv+Zk5BHGs0L5z6UMWSEzP1rH6oC5PCcZtt4cET70xwlCHysQ6KwyjVQfzMlL8SCz3DplxucYoeyYMd03L1yOM9l9X0CU8JibKjGMlOfgSJbFC07o8jsc5ub5ElaAMxkKIiek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791669886; c=relaxed/simple;
	bh=hEraFGMDcBQ+6RkWcIcWT+UIhz8ImX67SIBeKaE6wTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GGapUXAav4IKk9Eu495QsgEbcQxu//SrEVeyiCfHAJj24DNF4sLzUJRBzYqc2S7gRz4hk+lkTd0IS7dEx4FUVIdaIyRdchQ/SGyJnKe5wX3Md+grHtVttCIM2d4HMPzsMO0PgqXWgBLtwXS7XWbefaHhnwgUrlMY9iqpRk3xvuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br; spf=pass smtp.mailfrom=inf.ufrgs.br; dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b=PedvPwH0; arc=none smtp.client-ip=143.54.11.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b="PedvPwH0"
Received: from LAPTOP-R01LEAQM.localdomain (unknown [189.6.233.4])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id E72D1121103;
	Sat, 10 Oct 2026 19:04:31 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inf.ufrgs.br;
	s=dkim2026; t=1791669872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=msiRgp0WKKRWYWYWj3N6N2XtoRCzE2+M/Q33g8znsBE=;
	b=PedvPwH07JsrcRRRjH0bDckQBOVtKmYU43suqEJ9yjrAamkpMr0CpzRXmHe1zKoQaH0Udn
	XdsHluAj0FyTcwxTyIX4J80K4aKvX5z08APnTT2FdFYIPtam+VjbXWmb2JMFuRyeqJzlXQ
	uAqVxQVeqc14Fu6hNF8NO7VEQ/tUCKdG+1637cOVpoxCreQy0HnEw9E21ASi4Dk+Fyz7bT
	+OJG56KO3IFxe0iwCyKscgL15VPDhN8JqS8+r9dJZsIinuefpZ1AqwB9S1x4WG35st4k4P
	IxAiRLvTmKIwfpRfdIyWOxOQ6rm94bPTDlPQy24vdfTguy7Zx8zvK1VEMQ/KoA==
From: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>,
	syzbot+3bb39e30be6cca84a865@syzkaller.appspotmail.com
Subject: [PATCH] media: vidtv: free pmt_secs on allocation failure
Date: Sat, 10 Oct 2026 19:04:11 -0300
Message-ID: <20261010220411.280670-1-matheus.aalmeida@inf.ufrgs.br>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vidtv_psi_pmt_create_sec_for_each_pat_entry() function allocates
a pmt_secs array and populates it. When a vidtv_psi_pmt_table_init()
failure happens during population, the code returns without freeing
the array, causing a memory leak.

Free pmt_secs on vidtv_psi_pmt_table_init() failure cleanup.

Reported-by: syzbot+3bb39e30be6cca84a865@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3bb39e30be6cca84a865
Fixes: 039b7caed173 ("media: vidtv: add a PID entry for the NIT table")
Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 1b6225d65..a762383ef 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -1483,6 +1483,7 @@ vidtv_psi_pmt_create_sec_for_each_pat_entry(struct vidtv_psi_table_pat *pat,
 				i--;
 				vidtv_psi_pmt_table_destroy(pmt_secs[i]);
 			}
+			kfree(pmt_secs);
 			return NULL;
 		}
 		i++;
-- 
2.43.0

