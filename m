Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548509;
	b=o8QftTqgeJz9C8JaFIRkoy2+ZkaeMrc/4srudIxSGrLGjNpgNB/xZOIvHHtkmG9Fq36l
	 km0gOA2Ij7/ubBznvh42KMO8KtdZC4UoSNfYS6aUQCcMviJzg6304w9Q6k+IV4G8voPDp
	 Jrq3j5kQfUiWB4KqmsjJldF69WA9IXZ1/vKo/c1p6xjBDZVFCNtAtSD+8pOjBTrwM/Ej4
	 un8Xg9wP1bxbOL1XMcvyxFHmDMGuFSzoiun3F7aybptVrUvQlB36QEezvzIhhl7aqy+R7
	 ZvdCsjSzn+dzNXeu4JROC83LxWtQG4LtyLeFh89nXq+h1zwn2BPjCYc3dSVftUjJPWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548509;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=0svt3xN7tEgLNkUNTCUE6Svv1bFuiZerMEUqfb2X6Vo=;
	b=cgOZSyzcMeld6ndeRW5yeFKiMc88oupyWV9UHuvib0GlgxES2V38CIxABo8iweZ3ZiUT
	 LV1EgGw5qBTGv/hgF6rvYPPnM/PzZlaaIFD91uUv4zozA7tWrE7nYke4xlHFJe4B6392r
	 0FNq41i0T/SnGxiF9F8mUBTHjd2Ae2YD9BGexhsxikeywsXjjoleS2mBlXexja+G/M+lT
	 2vNOuXyekHU4TDgMaRj07BNgicxK5BXF/WVE3SY4wzTQY60NfkpJqrW+sJpW08GxLCrlT
	 5DLFUGbsRXdHkkA0Ao0urTHOmRPoX2/3MAZH2l2SGOAjfOh++INu1CJ2yAu1+kfqXEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=WZq9GXI8;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FF8606A31C;
	Fri, 13 Nov 2026 05:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4FF8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=WZq9GXI8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794548443;
	bh=0svt3xN7tEgLNkUNTCUE6Svv1bFuiZerMEUqfb2X6Vo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WZq9GXI8pFbcNTvpOmmGva5FbGCObdeDjKfR6ZHkelVVZR7GA7Je1tVgEvuyQUrul
	 0vSF+gJpeiHo4osai2BW33j6ss/AsIny0T5IqZjysPoCbkG5I4mZHFP/xQZc6P5A3n
	 a8Xq4BP/F3uvKTbAmhcz6y6sptONYqhId+JlqTFM=
X-QQ-mid: esmtpsz17t1794548428t5c07aff6
X-QQ-Originating-IP: PoCut8I1rnEjTerzIH7htfha0isMrBIHR/2d2SiegxE=
Received: from PEC004119 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 13:40:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16451900134131399225
EX-QQ-RecipientCnt: 8
From: Haowen Tu <tuhaowen@uniontech.com>
To: broonie@kernel.org
Cc: oder_chiou@realtek.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: [PATCH] ASoC: rt9120: Disable runtime PM on component registration failure
Date: Fri, 13 Nov 2026 13:40:24 +0800
Message-ID: <992BCE4B961FCE50+20261113054024.1489799-1-tuhaowen@uniontech.com>
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
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OFlhf05/e8bvy6+WFT/xlBVAnf9ij9REVsqRy9MfkrAs4Y4YxdSjjgWa
	Nx8ZHMbmq+E0HYvbXV4ixsBHQ4JHjPUHkvkxWyxptTHGvIcYs4d9jFrF1ZXMf9urHfSKtC2
	FBR0gEmUY5GkXgYjm2XyIHuiTIYAHqq37fbRZjAv6/nhHT6bfsuj7YrfpgIeBNS8o6BHE/W
	Qxf/prWsHoEkgPTniB2n5twjy9eO0DqN/UilFbH/ZJEo4ksGKgqX8QR7SrCzFWHJAJZvT19
	YJapaDaL3Q23YKdpEAiWTZJf/9i56g6rxqY1iK8t5pYuUFdAniJBt1t/1fSUYUf3fc+Z9pl
	S5vxHwTqblTGy+q2MY+7NBPPzBCcpLz64117DGDrqEPAuL48Z/Ja1YiLWfgQVaMswZkan6v
	PPnbcsr3bG2KIQBjIzlRItuRvs8Ov4Kmt5NZS2GifB7MvHySGGr/yvm+flNqld1hRvkiDgW
	+I8CpQWhEpMX1i0fWhoNCJ8IZpmj/jVITE2AecWA6RLlY4uiKlTV0gS7G6FusIkSTTu5ExT
	k0xffF4LJt47k42IRzETPDMEzAAElsXhJEJRucWs9jAfjSzi80d57JMWf7irpaYBxHQleuA
	vPShhpgnpfBsNExwGXCRbvfWnXdtxC08hDnZiHtvkJ5KhtHkwD/Dn3B3tAG4akUOpL5mcwO
	7+8QISTJpLPfzLO3PRJ8ozILB4w53BP3QL+HwpXXdPVW2cO4AGGVy/Ra+nMXoRYb+WPuO5L
	HK68tV5DPNG4+rUFViZ3oLNT/FAjdE4rvTDMN2RznbKGSc1LtNllgNK7brLzLgug1HeSbJD
	yi6KMOwmRClFGZdDSQCO7CKMf+0Y+gzfqLh2k4oQhkiwXdBkr4q8304F6gHerW9yZqci0dD
	SajLrcjL9DO4U4RPKbI5PLH4ASK+Dk7oKsACzPap4ZsSPbk1ZZ0FtyWbEdB/JOqntwUvTZ2
	iCkO63CFPSnakbeYdkEwM7aOylRPJvg+2dEHwJOOhSjWglRnNwvc6bK/QYtDgl9vdNCeFRr
	R8t/bOUmEbGn/4XiECiw0T7jY/9AuWupUkmOtT5IstoWMOebxsomHfCxqIT1E=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

Runtime PM is enabled before registering the ASoC component. If
registration fails, probe returns without disabling runtime PM. The
remove callback is not called for a failed probe, so runtime PM remains
enabled while the managed resources are released. A subsequent probe
also encounters an unbalanced pm_runtime_enable().

Disable runtime PM if component registration fails, before returning the
registration error and allowing the probe resources to be released.

Fixes: 80b949f332e3 ("ASoC: rt9120: Use pm_runtime and regcache to optimize 'pwdnn' logic")
Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
 sound/soc/codecs/rt9120.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
index dbf12e270917..5dc34034dd1d 100644
--- a/sound/soc/codecs/rt9120.c
+++ b/sound/soc/codecs/rt9120.c
@@ -588,9 +588,13 @@ static int rt9120_probe(struct i2c_client *i2c)
 	pm_runtime_mark_last_busy(&i2c->dev);
 	pm_runtime_enable(&i2c->dev);
 
-	return devm_snd_soc_register_component(&i2c->dev,
-					       &rt9120_component_driver,
-					       &rt9120_dai, 1);
+	ret = devm_snd_soc_register_component(&i2c->dev,
+					      &rt9120_component_driver,
+					      &rt9120_dai, 1);
+	if (ret)
+		pm_runtime_disable(&i2c->dev);
+
+	return ret;
 }
 
 static void rt9120_remove(struct i2c_client *i2c)
-- 
2.50.1

