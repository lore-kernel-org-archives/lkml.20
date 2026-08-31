Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC00287510
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160352; cv=none; b=Z/n9g8TSgCx9MKnk9O9hYcQWaozfeCRh+QN9HeC1xfLz4+OvQGQzc6BoDoErN1lx3bGxw8FDEo9v8zL+xUcWQSG8UerPitf0xiWziikdpvKkh9eX3S19rYbkDF5VPbXTZywiDEpYNqRRKFijQjCoXXjQ3yeP5YHoMFffNG3eZyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160352; c=relaxed/simple;
	bh=75zpDxz3fcvYGQmBJRYnba3Ei7Njd/5H7f9o16ZZTtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6qCY4+CX2halDckxs9YP/HpJaSk1GxwUSiAIrq0fTAtFhGBaWDdh7FlPHkP2u44MS16/OXqk2VnO1oo1q86+IoHKSnNSt6vSjA6xZA4sBJIXCUYo9pU9T5Vr3veQ1JQBdGwzxefBsokqQQ0U82ENyxN0eZO/GDyF1M1VFG5fSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ChQaPjtw; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ChQaPjtw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788160303;
	bh=GNUOYDPt61vaxXUbZr9IM7CvwCmMyj37FRBTp9CvSG0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ChQaPjtwFWh2TlbFyP4ijCsFp27PMQygWnUtIsfr/Wk2785OXE/3ouOHdIPYPj8hv
	 n7hlqAXoLC+CaDm2205wbzLCZEWDjnjwQp2EfRf6G5J+qENiqyXe9EsZEyvIu+geKJ
	 uS6Fl6b/Q9jgeTZqHU4ESqu9ohWCegzn8OmLzZGw=
X-QQ-mid: esmtpsz18t1788160286t12ae2ff9
X-QQ-Originating-IP: /DNoQEQZBErUbZ+nn4f0QYgSknwCoEqN8vvAz7018ww=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 31 Aug 2026 15:11:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18264328242113777515
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: axboe@kernel.dk,
	hch@lst.de,
	kbusch@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: [PATCH nvme-7.3 v3 3/4] nvme-fabrics: reuse string helper for subsystem NQN
Date: Mon, 31 Aug 2026 15:11:22 +0800
Message-ID: <090DFCAF26D6ECA1+20260831071122.638486-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <B1A2864319EA3B6C+20260831070557.631487-1-raoxu@uniontech.com>
References: <B1A2864319EA3B6C+20260831070557.631487-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OLustoS+DIJrdL0qqtdYHm2bJkT0kzxcSjf6n/Is5xMuFslcD21l4KWF
	YiRGpNbMw8U0q/jBSnOaPBF/bdAOHO3gOS20tcVFL7NAFgvZ+5TuqrXwvRVzY/AvC8vM+MA
	By2474E8vbfFSLUVzFlSHTS1xUDvUvsEQvyKyiAH+2vzgEXrU8uPnleV6AqDgCH6daRKxWP
	KCDMgsZZDUWjMOLhUyza83sIfiYQi/1oXyWoXQEqXTkfs0JxrkJCD12NZD5RHWP3A+Js9n0
	XDmQwoY3uCtQYCx7ccPaBgMFxiGRzoY/tWT33sF8BCjdtN7x6WYe2s4xZRJwIZdmHeMunvW
	UAEauTHvXLEOYSyBAeRMgBtPAV1nwB8GWWt5jLxxga5U6flpKZ4LMOfHILikIaY+ncx/2xJ
	pZQ09hUsSPq5Q0hYmqa2wG3F+h4ovn94HMBScgdZPakpoclN2ZeZTgQjPyqVGG/P7DPeqPb
	qDLn7at7ngVEUwnMDlnMZoCiI3mGZ5OjbKdSGrLpHGP4C1r+L1fizZLqz//61BMVJNZQ9ZY
	fhfc+8DY0Beq2caxwr9V2eLL7xl0KXGHKhecYG9o2c+2nooR8iFANdChE1rLMBwvME1iPvY
	a8D+J92AtQvCiaBzBvAd4YyTNhSnZK06o8ov5TzEqoEdU5LollKQRRd9hbo8UEuFC02tdoY
	N5j1rIghtbRrNNdsUBu47bSriqNfffaBiiZeK0FBXrDReY1zTBa9EUVMf0uN3G3LN08seOD
	uF8eGBPFUsF2Gj44teUAy+Tx5m4wLgGWHbCZPtif0ezgPIoguiMr90irlEsZ/4Og+utGbCC
	edruo4lKm01N5IpuLCIm4DEfLS8NVlliLrC5M4XoaRs4+Dl8ZiZFtciJyqWne2xAUIracls
	LTCYLW39JPWMaYvHtO6gWWT5U2feWT6Js9CW6UKZBEhKiLCqm3z6TNSpVJLk9bZP88veB6H
	D03n9oEcEhr/kS7FyZThzZxfDSYTbcu0rOrQeOyyWF/pyK2MmT9Bc+XmlQeeFF2WJW0XSez
	YBk6LIuDrKhwg71Y2m5s1AZ5wmMhjcxQNTSffoE0PuPy5GuBkjX766Z0TeCRA=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

The subsystem NQN starts with the same owned-string replacement sequence
as the direct string options handled by nvmf_parse_string_option():
duplicate the matched value, free the previously stored string, and
transfer ownership of the new allocation.

Reuse nvmf_parse_string_option() for that replacement only.  Leave the
existing NQN length validation and discovery-NQN update unchanged.  The
hostnqn and hostid parsing paths are also left untouched.

This removes another copy of the match_strdup(), free and
ownership-transfer sequence without introducing a dedicated helper or
changing option-specific logic.

No functional change is intended.

Suggested-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/nvme/host/fabrics.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
index aab3fd279d0e..24385e777307 100644
--- a/drivers/nvme/host/fabrics.c
+++ b/drivers/nvme/host/fabrics.c
@@ -773,13 +773,9 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 				goto out;
 			break;
 		case NVMF_OPT_NQN:
-			p = match_strdup(args);
-			if (!p) {
-				ret = -ENOMEM;
+			ret = nvmf_parse_string_option(args, &opts->subsysnqn);
+			if (ret)
 				goto out;
-			}
-			kfree(opts->subsysnqn);
-			opts->subsysnqn = p;
 			nqnlen = strlen(opts->subsysnqn);
 			if (nqnlen >= NVMF_NQN_SIZE) {
 				pr_err("%s needs to be < %d bytes\n",
-- 
2.50.1

