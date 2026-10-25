Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.243.27.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792952059;
	b=LNZnSMPtgnLsmsIkmUrxZrr9Qo1WI2EMeKKh5+Cin0RSACIo99noSapcetPu23qLQYSK
	 HWzCe+y/9ZZIPtWC8O4DGGIxQQ4f5bY7tMxP5UIj/KfIVzySPme9K0J5wO260n14UKNXU
	 3dVGIXi/J5GUCtxAWykq3jDTD5/1Cq2I0UpicdBNJrV7cLhPilmIsoYV0LMFzj4RM7CK1
	 2lwzIA5enWJEDUFwg2DMO363g2JOV1taTHwbY6RloHQlH2M1sSxpCnY50KbSYuK6XK3Pk
	 5n7U45PZDV38b+KIq4yyYczIuGRKW1YF2/EPehdh2cyy/FYqk7WG787EquMgdCVY8xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792952059;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JShj0BHapZjCPRnmZRtazgccMHrZh+wjeIrgp+DO19Q=;
	b=UyhU8cNy1bJSgqdTuJ8CXuqTv8/j5sRsBbXLV5M5IY7DCFan0V61dpinGyEy/PoEHD1B
	 UxjMMWcdVEu4J2MKiAlkIEi4Sj8/k02/R9jP/FLbl6vCsKX7Cz5SD/7yIeSfJfdhHv68i
	 fkfYVmenAPBpQqx573ogInOGnFleJIWU++Tj9513vQRZKBOUhMLBs/fk4vg1VmODcdNLS
	 1QmaqhyJqOdNnsbl78Y5nAN1cieZPWr40f6wAkgu9Bdu06KBNzMeu1Xtxt6vDCLOxXyB7
	 vQk3Kv/V023s1eFdEkkCR6+h+SNk7+znjisbN+edq4NS35bXV6L4RuuQyzBZiaxYtpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mess.org;
	spf=pass smtp.mailfrom=mess.org;
	dkim=pass header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=d9TPD2E0;
	dkim=pass header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=YMdcuiql;
	arc=none smtp.remote-ip=92.243.27.206
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641A4606A31E;
	Sun, 25 Oct 2026 18:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 641A4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=d9TPD2E0;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=YMdcuiql
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1792952052; bh=qQl3PLRmeN8ick+gNeSMWtkZqg1ICdFTPKOnU2DA424=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d9TPD2E0G219sm8MaBZBzh9JgQyVuA5HdSNrsxHIahdLLwyweaIh+uk9vbJQjuR4j
	 zJXjfsvS6yTxDRhY/FCb/xOMRTsrW+EY62ZVmrw4xJcRch2VRnWDSRq8+xmTytGNv6
	 LH2Ap3v8U1Qi8oq69+WD5a/uhuwOxqPSiNq+uTD6+fJhVwE0fXOyvatj3tWJrKY557
	 3K/pERfd1Sxk012dCOUe10zFQ+mxlGfiDw2MAOySK4ZBCV2vuKvNKhpsph4EdVWTNO
	 G1XIcFW+1A9Oqqdd+7WVfVeWt8kZ1rQD8UT6YWnLHLJEtyScuxRjCLoko/c7Cypb47
	 Y1uce/iam+Ahg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 4178D40B50; Sun, 25 Oct 2026 18:14:12 +0000 (GMT)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1792952050; bh=qQl3PLRmeN8ick+gNeSMWtkZqg1ICdFTPKOnU2DA424=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YMdcuiqlh6uqi4X3iDuthpm+OAPp/BFlq5anv9y3E3rUN2SIU/bE3obz25FBhoQqa
	 tPFQfySCMPWCb58JIdpID8CGsaHgY0Tsji6KR4oq+iKeFB04EtvSIsAsfPQCryMYfH
	 1KDuLlnzEpDjbOQhXcWylEsFAAzP+9SyuB6KtQsGmGolUzdXh1twkTy3f3zF1LEF7R
	 tpVV7XmY0xBrBcxphE+vzvcP0y2rjIZdLnwf50qjrzXXjgcPWzQy2dao79kkr6NjxK
	 GtSmFhy3Tr9ApDHrwK7GOmKp4bOfZnzSmqA49abyREDsyTkvfBZQXr5O6GX4IuqjAm
	 2ClSPLSOY8Q4g==
Received: from maru.home (host86-145-132-241.range86-145.btcentralplus.com [86.145.132.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 934F840B2C;
	Sun, 25 Oct 2026 18:14:10 +0000 (GMT)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] media: rc: Prevent overflow in ir_raw_event_store_edge()
Date: Sun, 25 Oct 2026 18:13:42 +0000
Message-ID: <e8d019982470fa2f9bf5f11729464e06d35a5faa.1792951808.git.sean@mess.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1792951808.git.sean@mess.org>
References: <cover.1792951808.git.sean@mess.org>
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

The value overflows every ~72 minutes. In between button presses,
this could result in a bogus duration which would prevent decode.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/rc-ir-raw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
index 75dee4a483d4..a79fc89f0dc4 100644
--- a/drivers/media/rc/rc-ir-raw.c
+++ b/drivers/media/rc/rc-ir-raw.c
@@ -101,7 +101,8 @@ int ir_raw_event_store_edge(struct rc_dev *dev, bool pulse)
 	struct ir_raw_event	ev = {};
 
 	now = ktime_get();
-	ev.duration = ktime_to_us(ktime_sub(now, dev->raw->last_event));
+	ev.duration = min_t(u64, U32_MAX,
+			    ktime_to_us(ktime_sub(now, dev->raw->last_event)));
 	ev.pulse = !pulse;
 
 	return ir_raw_event_store_with_timeout(dev, &ev);
-- 
2.56.0

