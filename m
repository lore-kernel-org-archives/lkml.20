Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551116;
	b=Q12FnS9rVrwU4VIhOs7IVhyrdkzxk5nGMis14Y/FLXkuvN7J38Pp9ZzRGDTxTSH8EL6a
	 7j5CdJlyIPnRWX8Nqgoc0vFXDJlEmfAj+OXLphuKaSXDB6z2624H3E9DJ0XrLumbxc+Gu
	 w/IBPMGvpO6Jvi8t0TOOV2K1ldilhUBwvcxke8Pg2JY6KzWTDmTu58nNzWZ8e+f4ePx0A
	 tg03IsTI9sU2XF7prJz9Ru84gVrxVgdZ11WsVNDBVa2ve+pDQU8JkZ92yz6Q6ofzrjT/L
	 V3EfVAl0+YO/dP8AP8iWAW/GvG2FzJ5zyitGsRmE5+VvdLptaKB0wbdQ4Tcw5a6zfqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551116;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=10XdwItay2xjSSdxRndz5fIEXf9huWW90M/UIJxcOJ4=;
	b=ufZP6A77URh0NIE54ezyGMki0jYZoHGxwiBIlyon2SFTKMGXYy2ift3XN78gg4VZwt8D
	 o7bkzmkF8Zs1eggOIW1LRKTcLImBTmYN6gY5bvQOWmSrWaTj+L1mbwElL1zp98a/ixr3l
	 zirCytCdx80m58SiIWDHYKv2dVhiBBeRLOk2YBtYEQjT/QXiI/YwIHPLn3uLrlQ8Mttp5
	 AE4H4WA10eLMPJGvSZlG7T0+hAsf//Nh8YEk0DsU698m0I7o4kI+vObDeY04Ecl3ukORi
	 PB/AnqI+Ewpx2tEFfBC5thZEBY+4OftXy5XXrmSeDXhYp2c9viStoyMMUZxR5FwLeQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=dcQ929YE;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE133606A31C;
	Fri, 13 Nov 2026 06:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE133606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=dcQ929YE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794551066;
	bh=10XdwItay2xjSSdxRndz5fIEXf9huWW90M/UIJxcOJ4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dcQ929YEsOGkGPNan7QjS1u7KGx5Z415Yy4PFQDXgyTK1+cYa8s5ovCuw50W2Q3/i
	 uPso9ewvqsjMI6YQ19qMVbaO8ktjKzZonwAxRcvsOlRsxKFqxjp9DASXa3Y5kKVSuf
	 GIahXXQkDObLN/BbjfzmZCOgRC1vUYa3s91n5tV8=
X-QQ-mid: zesmtpgz1t1794551049t4828b390
X-QQ-Originating-IP: u8uzL0sJRFmJJC5obPseqYa3qPxqgT8Y1IOOnXc81TY=
Received: from PEC004119 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 14:24:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14666418982326683581
EX-QQ-RecipientCnt: 11
From: Haowen Tu <tuhaowen@uniontech.com>
To: broonie@kernel.org
Cc: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: [PATCH] ASoC: pcm3168a: Leave cache-only mode before resetting on resume
Date: Fri, 13 Nov 2026 14:24:06 +0800
Message-ID: <3BB19624DEE17CA9+20261113062406.1504452-1-tuhaowen@uniontech.com>
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
X-QQ-XMAILINFO: Nu7meyJZV74IaBvgr8CaXJuC240ykQW8XKjZb3zvUfBOngsI5EwXcBvI
	OlKGWgdPExmeyEWTUpENYMcJGMX17MO4kCbKhFrVC18XsoPGwQ/pY51jpei4QBnfBRqOie4
	2IFsLuQURVV8Uxojbm+9ygh2CIlQPy9W4f7Ju+/2MjzX4BMm7AAXsOUZS6aHF9oT8D0nixV
	v6O4peu5/y8GbBTqKeLxKK12ZS68X99Il1Kx2LVFjUGfu1/AZZyBxz2nH1c00nj7YyfJzBj
	TuYwi2aXEJFN7yyyJ40HxjiWxMjSkqIkp8qwusbRlXSUQ3O5MGMsRxCVQpEUEnVHef7B4AP
	lsfEJA19C2sfLRFVvwkmFsTWcWapgpaSjiLyips8c6GjEClnbDzld3+sCss5Ql5gOjl8yB9
	id46HGyWWvkvvafh7mAUcxJn6ltmDtV45W1nFlrjHDhj9MQluLBOW7EL8KTO56SUasxHjuE
	zzlIBwoiEVzI7capCLGM3W6A87voRj0tPgXSNdbFk3PFj/lOozRTTXKoQg71cPDUiUQnxiH
	aBnSoaqEQ8LWj/zSPAp7QAxwdUPw4UutAVf/KXVcnH2bt1h6rqDAif7Ubjl+sai0zmRL4p7
	ZE2JaMymt6W7aCRSJhrqOx91yOPQ1ntsWZytuY3+TDW/+syu7YZ/8IskW2ZynJ+sADyXTxD
	hUurJbqLki4Otj3lGA98w30MZJ8TIaQXqx04DSaP5FIXPUpouFssmLHli/uwOAR4XtTZ+C2
	IUqSD77jIerZVNwMRjMuGMXTG5x38y1lOBWKwQIvr2gKClcSabnywMMRCiV+SC22lgG6VG2
	6zykJb4v40v1DvOBRbyO7+wcmodJ96Bh04/3BuIlJ9DZXle4VrhS5xDoie76zOoN90QmA10
	gC93Hh9BIu4XEmgLcfD0SmDfDu9eVd5oHS5L5y7rIEV74MGWb0XExcabZHcZuCi6Z5qmhrd
	RXx2O9mRRzKvnV0MquWqqOrq2sBkrQuuEfFmHfcTWdm+4YifxZ0JVFsmT3FFYL77EksO55y
	bdAXUptMhE1k4cZkjvHvz4ud4nKzeRRobpYPyigQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

pcm3168a_rt_suspend() puts the regmap in cache-only mode, but the resume
callback calls pcm3168a_reset() before leaving that mode. Both writes to
PCM3168A_RST_SMODE therefore return success without reaching the device.
The register is volatile, so the writes are not cached and the subsequent
regcache_sync() cannot replay the reset sequence either.

Leave cache-only mode after enabling the clock and supplies, before
issuing the reset writes. Restore cache-only mode before powering down
if either the reset or the cache sync fails.

Fixes: a9b17a638af5 ("ASoC: pcm3168a: Add driver for pcm3168a codec")
Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
 sound/soc/codecs/pcm3168a.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 11fd948ecd27..bb539b9dd0b8 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -855,14 +855,14 @@ static int pcm3168a_rt_resume(struct device *dev)
 		goto err_clk;
 	}
 
+	regcache_cache_only(pcm3168a->regmap, false);
+
 	ret = pcm3168a_reset(pcm3168a);
 	if (ret) {
 		dev_err(dev, "Failed to reset device: %d\n", ret);
 		goto err_regulator;
 	}
 
-	regcache_cache_only(pcm3168a->regmap, false);
-
 	regcache_mark_dirty(pcm3168a->regmap);
 
 	ret = regcache_sync(pcm3168a->regmap);
@@ -874,6 +874,7 @@ static int pcm3168a_rt_resume(struct device *dev)
 	return 0;
 
 err_regulator:
+	regcache_cache_only(pcm3168a->regmap, true);
 	regulator_bulk_disable(ARRAY_SIZE(pcm3168a->supplies),
 			       pcm3168a->supplies);
 err_clk:
-- 
2.50.1

