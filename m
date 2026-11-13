Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794550088;
	b=hmnm4TQ5IbBvFKn9fItuEYWNPoUeiqILvCgDivUnInhMjEjMvCSWj8umuxMAS9/ZDoZW
	 BpVB63Ird+KwRObMdGC4SRudNiSblZjggYSUIVH+vqboZEj7LaLufW2XKfbUc6lA/IN4z
	 UEMZVaUF4SxmQZMzF5i0j0/q3agXfzHPnv2YgS3pexBa8Or0FfLQ0XwDV7Ch8VOiKjWrw
	 HW4cMPSHBE4QVPv5gwtOCyCXl0b5Zbt1DcO/l9lzDtB5sTXItXeayftEimnHJZg6r026o
	 Y1u6ra97ufTkq1miqIGYoKxxq5sTvu1sVXjcHY77QVqhCzs3nguHhWbp1TeSbD7esbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550088;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=wllpHAZYNSNkCt57+HHHYsgQEPuFI+eTbDLLhojO5E8=;
	b=nJnSQfb4iyfJ/O7xH/H4BQui3LtuMBg5fo+yX/rZYCV7PKDlGzcfyFT4jTLpqT2RlgIq
	 Ncxm3OBvt45mtQzWQK89tvx1TjCi8tWqtes92qVh0sNyhFWaNDBIqkutcY9b5n+YX516Y
	 lt7B2w0xOZJFCxNk/SLFKBEZH9tgHkjJhxTJtFATHpyIgQMpFVa51V1kcLhykXpg+UfEI
	 vxGuMFNeqLixtwAVtJTnfCn2ZvHFmLdocFvqMrRiP50smxdwuPZjQbOO9htCJvWfTFe1a
	 jOIucGrB27LpXNZLqQ1cDpwZEakGoWs49WgUqjGaTOTg6zWBdZVPaCGKdQYcGpiwh1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b="Pl9/Revv";
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438FA606A321;
	Fri, 13 Nov 2026 06:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 438FA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=Pl9/Revv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794550037;
	bh=wllpHAZYNSNkCt57+HHHYsgQEPuFI+eTbDLLhojO5E8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Pl9/RevvsMlSHBVs2R+kcCwWmKUoJbVyWBLKwBKUXlpSMYTYNLNjTzA8C7YBRjwxp
	 2+fZ11LD5vsuKdy5suKatg9jS8HCjJ5Hx+lhuq+5aXCFyoEHCniL5BsZ6pHIiZLZlc
	 GEwt7q13FanjKbJQu1yLiXv5inDRlv2ej/M9+fx4=
X-QQ-mid: zesmtpgz5t1794550022tb8788a0c
X-QQ-Originating-IP: 6UGuInMOY/d7vEfDBEDyZH5feZhcASUzl3QIHaKoVsY=
Received: from PEC004119 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 14:07:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2535765206702016621
EX-QQ-RecipientCnt: 7
From: Haowen Tu <tuhaowen@uniontech.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: [PATCH] ASoC: ak4375: Power off the codec if runtime resume fails
Date: Fri, 13 Nov 2026 14:06:59 +0800
Message-ID: <8C4BD8E710508D85+20261113060659.1497641-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.50.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M4XCXY8dla+qkSZ5YbHjeUhdk8wCSBrjHbfeqDibfjpAkhuCi/U6wvJi
	NSVoJ7BD18c0RORpBfXNy5fYvoyqseYf3sH1Si+jWyNLGUY3muyFAy9YC1r9c3p176VJewL
	HnYNc7suaos49SkMNYPF+OhysvNaZhVcWm6QJoEuBJFg9nmbsD6l7QyoMhhRazSoJwiGzMB
	fsJFM5xETfOuHf+Yp3hWaE3w2pmMOIBT01FZsLzzcDdjBEFsVq4B6R4qrvAayC2J6P3qKbg
	f7/wv8S8HDSNoK5tyVKA66n4eK9cihdagEIHYUZwq7jqvWCq+s3OydR7H90tJX00HwsbO59
	un8KGG61uqDgTJY1ApSd2PBQkchgZaass+D6tC7RTNSm0Q4z4bKBTI9k2c9amFyTfBkfu1U
	0o1x7UQ+yecwQW7fZmu5AnaNsuLN2gV3mxsf4iWG8AIsM3MWxqXxkZBoPiX3N7tvT3JyqcJ
	PeEj4Yq7Ib+34W94ew+Y0U/C0eyhUGmsxplHR7EdiVIXv00R92ovDrB0sKvVpjuCZlL31yJ
	yewk4acVQN41aR8iBYAy2DotkvAEYxsfnP5GbLV4Q3PEStt11SqY1tAL80OOzyUtOkGMoV9
	xhYJzUZGqr7qcvHMo2wkSEhVokuILOIQs8PWZIUY25StOCaKXL4r830iZn+tSIiT3QdfiDD
	HHr4IK5YkUUuIjRAhuudaeDNV1F+y0mDJzoR1vShNKDR7maB6SyV6JZ7vvp3hAYiiFuvkHJ
	aHxYdvTbgLnZckCh5u4K6NEmH/aJ1aTtT+rFhknZFf3aY0j1aHHeUIJX3OD9GfpFBRDZ3Th
	lkCOVw7eSZBw0qceu5vTrGwJVj56EvetpEpiLhci9Q6zhv4Dfrj/IAdZN6A2YOVdKHbULdL
	mTMidwek7LVMAQOmi7ZvkRcPsEXerRdHBeeZ7dO871L3wjTaPuYM2SfqJnp0uAF7RpQIGXD
	CCyQEjnDbD3YCdTQzV04fUsqS+PJPUKXNRQcD92acvG2zohR9vxwxT/RGESYREqtU+DFqon
	3SEmbLdVFsgbkEjBKBDt8SG4rSrOWDU2aWtRJRcF2vUJjJd78iSpW83GpRSs9ebvRmSpiCB
	lzx+7Mo6G146afIfDcSO2/DY1HKNe0LvA==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

ak4375_runtime_resume() powers on the codec and leaves cache-only mode
before synchronizing the register cache. If regcache_sync() fails, it
returns the error without undoing either operation.

The runtime PM core leaves the device suspended on a resume error, so
there is no matching runtime suspend callback to disable the supplies.
The codec remains powered and register accesses still reach the hardware
even though restoring its state failed.

Restore cache-only mode and power off the codec on a cache sync error,
leaving it in the same state as before the resume attempt.

Fixes: 53778b8292b5 ("ASoC: Add AK4375 support")
Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
 sound/soc/codecs/ak4375.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ak4375.c b/sound/soc/codecs/ak4375.c
index 28cc41014bd9..469b81c5daca 100644
--- a/sound/soc/codecs/ak4375.c
+++ b/sound/soc/codecs/ak4375.c
@@ -460,7 +460,14 @@ static int ak4375_runtime_resume(struct device *dev)
 	regcache_cache_only(ak4375->regmap, false);
 	regcache_mark_dirty(ak4375->regmap);
 
-	return regcache_sync(ak4375->regmap);
+	ret = regcache_sync(ak4375->regmap);
+	if (ret) {
+		regcache_cache_only(ak4375->regmap, true);
+		ak4375_power_off(ak4375);
+		return ret;
+	}
+
+	return 0;
 }
 
 static const struct snd_soc_component_driver soc_codec_dev_ak4375 = {
-- 
2.50.1

