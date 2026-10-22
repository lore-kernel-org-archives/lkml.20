Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668411;
	b=AUCpEFGgAuo/qANbGz/7JLKYgQJRX/aTclICgU+LHF30wiZSUPkNX4ClBoCXVHkqtwjf
	 f7fShAv3vmxTZsuD3YAPJ4xaWdf5MnJ+d3gFP2AqsJYJ3gAT5FzZNGbbw4MUZFiesuCCW
	 5c8vLmF+3TfQUthofnURYKSyTauS7/lK8qI60fSppZDZTdeJQtA3TvVZ6/+IvFi5YE8Dw
	 0rJ6RFES9IhdMLmCcMi0lgPh/sSmXXTdsHL83TevWuigCMkBdgdyd+9hVR4FVbpCj9gz1
	 a6IPl6wCRvT3r86/2GoLig5Ub2kTOG01hFBruycn91lmIePwX/zeKBx0ukxhmFnrrQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668411;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Virus-Scanned;
	bh=4E50WilOxFb8qDQvr3/oMZLrfE8a1b0B9JLvVN7EQv4=;
	b=oXCOgsUJBtZ3Ql/YJOLgPQm7chGb6GZKCqSBoOL4USJfvZPQrUrSVPKyPPwmO0mFWuXV
	 cXyqhEoYExjier78SfnIfl9ScO//YT6XMRPy19RCkEsv+CyePDblyTI75gSks447/R/Zj
	 PP7dAJv0GOIVK74MC9/KfBaCC8lSYgb6+MoHhVsx/Gv9xN4EgFTvOg4L7gfK3ZmoSScLb
	 iKQeNZ/Ovjv1O+cY9oEcwf0l9lkMMS+XiO9OSUi4wlYbYAbb3LfbAIFz5K8C/IfCrwgPU
	 O4KNZzLPmN1LONsH6xFRtGn2NPFg8gFAZNmTqUYXW8FRV2IijIvqdCxXQKuqY/iTnUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=N2IfWaRR;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C323606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C323606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=N2IfWaRR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=4E50WilOxFb8qDQvr3/oMZLrfE8a1b0B9JLvVN7EQv4=; b=N2IfWaRRFCP71nXTaBs8S22HaM
	tdYmyWemDBu5SHWNJAdZX9mVgBAMF6SpOlfnXayVGXnPF8dOrbh2d9df1CqzqGlgTrxjyabvTyEBn
	G6pR4bhYZdWA8ULRUcOsAxUUcSjLRnYB4EkbmYNfsHAkzoZ33E/aqXAmZC0d6zZI5AJaKEo9dYBI0
	f0ludMn0TsjmlHcmkoG4os71sHZL/FQkaV8lgt6y1GywbtW08jiIfBy82wAdMQGFcip5LZHfVaMDB
	7vOsoMXWlVJGuoGztWmYKbuebxm+lA+5bY1+llBdcPQSfESeF2a+9dDKla5pmmpQwbgrJXhyFd1Rk
	apd5EKfA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xJqwU-0004EC-1d;
	Thu, 22 Oct 2026 13:26:42 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xJqwU-0008wb-2k;
	Thu, 22 Oct 2026 13:26:42 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ubifs: fix typo in comment
Date: Thu, 22 Oct 2026 13:26:39 +0200
Message-ID: <20261022112640.11822-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
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
X-Virus-Scanned: Clear (ClamAV 1.4.3/28161/Thu Oct 22 08:24:11 2026)

Small typo which stayed hidden so far. Fix it.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 fs/ubifs/scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index cbff2d800e27a..50740e9dabf73 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -245,7 +245,7 @@ void ubifs_scanned_corruption(const struct ubifs_info *c, int lnum, int offs,
  *
  * This function scans LEB number @lnum and returns complete information about
  * its contents. Returns the scanned information in case of success and,
- * %-EUCLEAN if the LEB neads recovery, and other negative error codes in case
+ * %-EUCLEAN if the LEB needs recovery, and other negative error codes in case
  * of failure.
  *
  * If @quiet is non-zero, this function does not print large and scary
-- 
2.55.0

