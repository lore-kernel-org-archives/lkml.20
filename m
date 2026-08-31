Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3843229B12
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160330; cv=none; b=M9O8U9qJxmWQORV1jmGA4hnk/TIBilsQnu4e1OJc3RA2J+BVcvi2KoLuYKG+ipHVtGwhCxpQatgbcQjlrJRO8t59RpCJ+InbjI+coXCQtZCGr2An04tBi7OLLF02zD7OA0nOCx07Qwf2SPnRnD/hvojHN7G/StFkHyZ7eeyOXF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160330; c=relaxed/simple;
	bh=OjWkSyLnoRyPXzsTbnK2oW/RArHFcp+ecewmmo8ATQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGIRJj1C1ftrn4TfeFfDLCZRzcImFreNCoky9EoHMqc/7sIf+4GJsi0t70YQu2o+wiMZHmcsWXlOmrGxpXl8etW5X1Y1VsOOtJIekhRlSfGj//OQHwL+/KENUgcNcd2PKtEbHIbDYSvCFgrEZ1CDVOqHlmWruC9pDJ0p7iZ/guE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=VDOp5hm4; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="VDOp5hm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788160272;
	bh=m2C6iY+uu0tPZzhXdnPEQUIgtzuD2N/br4GdpKmMyFg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=VDOp5hm4fTt5VNkfR0Vq6QJkyPJxA3UYxWKwFV+DhxLiDvOVn83mzHm9DNybLK9GY
	 LNCzsDYmO4TF+QQjiLjiF2QUtoTG6b83c3D5wiKmoBmcHuDDKDSK2IlfWHlexTdBHh
	 QDYPIPGWp8VM+DfUQTZkBAIHyeQtGuH5S27Njly4=
X-QQ-mid: esmtpsz16t1788160254t808e05e5
X-QQ-Originating-IP: 2ePWxfxItYJfnyvk1iKRgQ8bRqgDbU+9Hh256R00M6A=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 31 Aug 2026 15:10:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15215064244287525615
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: axboe@kernel.dk,
	hch@lst.de,
	kbusch@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: [PATCH nvme-7.3 v3 1/4] nvme-fabrics: separate option tokenizer pointer
Date: Mon, 31 Aug 2026 15:10:50 +0800
Message-ID: <67C2BD21B4A592D4+20260831071050.637726-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: MD5lytsRYqTqSwcRsMIAS+4i85X8qyoUwhZwQlwXC/mAarma/44KGNXI
	ZCYlpezMUTaDUJYXyn0cjl+v3uvyEpBBNjB6Ih+xsDG7z0dh2WXRWioTeiUktTRWlq04b6w
	OYt2fr6USt237UMq5JUjmRZ5tkCwD7PQW0vi0gXaPm5Lt3XLvufA1WCiheYys4wLJztvmAn
	P2ykhtlAwcJZinkGWf6Xtp8WBD6cRNvhsMs7fYTCFvctZPobF7j1pRmTIFYta6DAzmYmBN9
	trqqcMwIe2RZ3JDT8mG7PcQsMh/Dtx9d8E9gY8+ZhTHUrQFjP9O59+ggfSuuXNt0wwAQTYZ
	1kTR7iZZonSi5qad8kgMgJMqUMkbuqXEA2V65MqByJsS/U5IEMWUAzIvY6dQWrv8ZHhUjgo
	o3GJNzHaqBzu+ibYiAgS1e7bemWMFJfdPV0AVz1b6jzU4pE1WdacUchOR5AJSCj6tPZtz2P
	rldkFGSsvDpP/1s4ktdDPBkvgBGXdxg44tQ8a5WTrHDHlZ7+vW0/gHhLVr5PaNp9EOa80ts
	sq5WEuI648LbpsZOWfRbDnFJkSj6wXHo8Cv5bznULnHWBSurv8PifHfIXTjEPuCNYrl/dWJ
	LudEacz0tLdzwpHWm7BmbO1u8Rz/juKginypKY90vxInuoQpYvYEIAJDGwFb8Dr6WwNGOvn
	vcgpqiWklVPr8uRm/yXk93IKTa9zUO1AvrRjrTLkn/3krhO1tiTlyMOAh+GPIbJiVZ7eEM2
	EO7JtgAqxzNgj1bqoYc5fBB1PZ0Fyw2KwMtRqc555jgt3rGB9KnFLkSzO5ObS1oiBqlDObL
	rvgqDkWTc3Z3HXhwRW4wnvHEiQsO1XvUMdv7VdkGcRXOEz3I+p4C7Nu+N7CCFikLEHvACU6
	F8MneK9JYo2y+KiKTxMkCT2GMt1Gu3V0aQBmtaA8czByqzgbX8yOXV6iKSmqpWXOYikAWuO
	EWvd8+wPZyEdp+/Fhu6FdauoOTtNIHOR9kQztY8MBCrs9Awkt+dbHyo59gc/7AgqKBhlwQI
	u5B8/B+wMAhloWzhHTKrr7/ihjQQdpvoXt8SHQWcqf2Lw7PKyTI4DiXTQPfVrGPh+1BFkIf
	sjlwg+kKv6w
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

nvmf_parse_options() currently uses p both for the option returned by
strsep() and for strings allocated by match_strdup().  The former points
into the temporary options buffer while the latter owns a separate
allocation, so the same variable represents two different lifetimes.

Introduce option for the current string token passed to match_token().
Leave p for temporary strings returned by match_strdup(), giving option
tokenization and allocated string storage distinct variables without
changing the parsing logic.

The name option is intentional: options remains the backing buffer for the
full request, option is one comma/newline-delimited entry, and token names
the integer result returned by match_token().

This is a mechanical preparation with no functional change.

Suggested-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/nvme/host/fabrics.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
index 59f823dfbbcc..1ec6da49167d 100644
--- a/drivers/nvme/host/fabrics.c
+++ b/drivers/nvme/host/fabrics.c
@@ -716,7 +716,7 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 		const char *buf)
 {
 	substring_t args[MAX_OPT_ARGS];
-	char *options, *o, *p;
+	char *options, *o, *option, *p;
 	int token, ret = 0;
 	size_t nqnlen  = 0;
 	int ctrl_loss_tmo = NVMF_DEF_CTRL_LOSS_TMO, key_id;
@@ -747,11 +747,11 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 	uuid_copy(&hostid, &nvmf_default_host->id);
 	strscpy(hostnqn, nvmf_default_host->nqn, NVMF_NQN_SIZE);
 
-	while ((p = strsep(&o, ",\n")) != NULL) {
-		if (!*p)
+	while ((option = strsep(&o, ",\n")) != NULL) {
+		if (!*option)
 			continue;
 
-		token = match_token(p, opt_tokens, args);
+		token = match_token(option, opt_tokens, args);
 		opts->mask |= token;
 		switch (token) {
 		case NVMF_OPT_TRANSPORT:
@@ -1068,7 +1068,7 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 			break;
 		default:
 			pr_warn("unknown parameter or missing value '%s' in ctrl creation request\n",
-				p);
+				option);
 			ret = -EINVAL;
 			goto out;
 		}
-- 
2.50.1

