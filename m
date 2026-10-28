Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187907;
	b=f+y5Ny5kcKdsuzwW3r32roZN4IaGYKleojVWtYpff+nn0CNI1WG5v10wnnXGpuvkd644
	 Syu7anUUvVrbytDdYRMo26+kWLUF9L3UItpJni4++N/bosmxBFSzw9Idi2SaZj+0JBvJt
	 PwP9dQMxvn/mDg1W/f5AbZmIrUB0UMIAaOXFA9Et66AmexnD3X2Ww3t4KKsXDXnYJonQ9
	 yRcrj3bldbg4unPnTY6dmlsDLvAyca1dKTg1IOONYSoWcVOw+LcXinRI5c0M0ZuWtUEQn
	 4+n7H4PoamCUu3fQAqe740rJx3L+SOINWlb5GiiEBDmU80CWkjds4eGqOk2HZBAtH8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187907;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QzHKW9rtLc5pIwwuROz+fvid8PAGUaQuBRU6aD/H4fQ=;
	b=vUKSGv/fK3KIVyZm1iq5FEBriFY6vihvVOq8BMnHJ+D5Aou3p/M/W+C8lQJK1CVzTx8k
	 APIMFbuNQLkBhwWFUm4km3OgW3IUQ9v+aCQSuoPf02ilI4+YokL2FzgHn9tkHh7JGlBEP
	 g/pl3/F8k+ieMxp3uKO+Q4N7o+QdSplm04HUL0j30exwI+WjCp19PisfrdCORRBrwSLxY
	 Xpdyit4GtWTpejr7hPfB5gWZlJ1yDoO3/EOPy2qBTy3cla0tRhVSkvtQBSso0qXZ++qlR
	 +R4p74R5kX0Odr3iANr1tzBH/wvliXS3UW1Q+OwA2n9fVZWJb+JQ0cUkvo/tx38nvwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=bchd9uPa;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E1A606A32C;
	Wed, 28 Oct 2026 11:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11E1A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=bchd9uPa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=bchd9uPaxgu4WoejKkBT0DJtjE6+3sYpwtRJ24fInJ13Y53eJYG3OyHd+NwtnypcZ5zNKfRVQmV7a
	 qz8GvVOFNfrhdailOsftmPKSwfZzeDSFgWTDxVW1Hso2l75LKpzSFDi3b1uuzOFdM/penVlDD3pvTe
	 /R3TtA8aGhrxTdIk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66ae1e03ee2d-2e102;
	Wed, 28 Oct 2026 19:45:03 +0800 (CST)
X-RM-TRANSID:2ee66ae1e03ee2d-2e102
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHA-W6400298 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76ae1e03d4e9-0609f;
	Wed, 28 Oct 2026 19:45:03 +0800 (CST)
X-RM-TRANSID:2ee76ae1e03d4e9-0609f
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: srini@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tangbin@cmss.chinamobile.com
Subject: [PATCH] ASoC: codecs: lpass-rx-macro: fix PM ref leak in swclk_gate_enable
Date: Wed, 28 Oct 2026 19:45:00 +0800
Message-ID: <20261028114501.2192-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.52.0.windows.1
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

swclk_gate_enable() calls pm_runtime_resume_and_get() (incrementing the PM
usage counter and, via of_pm_clk_add_clks, enabling mclk) before
rx_macro_mclk_enable(). On rx_macro_mclk_enable() failure it called
clk_disable_unprepare(rx->mclk) and returned, leaking the PM usage counter
and potentially unbalancing the clock that the PM clock domain also
manages. The sibling tx-macro/va-macro drivers call
pm_runtime_put_autosuspend() here; do the same.

Fixes: e38cbb75248a ("ASoC: codecs: lpass-rx-macro: Propagate regcache_sync() errors")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 282a6aaa9..1737d525c 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3681,7 +3681,7 @@ static int swclk_gate_enable(struct clk_hw *hw)
 
 	ret = rx_macro_mclk_enable(rx, true);
 	if (ret) {
-		clk_disable_unprepare(rx->mclk);
+		pm_runtime_put_autosuspend(rx->dev);
 		return ret;
 	}
 
-- 
2.52.0.windows.1



