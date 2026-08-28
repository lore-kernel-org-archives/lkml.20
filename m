Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5963C2785
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894948; cv=none; b=IyekxQUbPHr+iBGL5ms5R5UDfkQIk82nT2pqVGpuGloGj+N3Z1OhjD2aTFzPv2cFxaS34OOPDICvFWHGD+FLD3EP9pm0M/+YJ+aAB7P8oHspewGS1Os25y86y96s1TLYGXZojvDFkDeg1QpO+8hItDos8s2LABOxqaUhBxg75RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894948; c=relaxed/simple;
	bh=wKKtsaBghx9mUO9q+l+PL9vL/BhJSMvjpEJOAIYYSZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rAXXzWd0ysk5y+mPY8yqihik5ap76P3oPFbZtTxRuPeNj/GZllIiQszyjIcAIasxr5J5vR5Z1h+wrJ4PNu1Vl+r6dE5IuMQzx/2q3QsNtvh/PdNdJWm71UCkdrMiuaegSeiMQMG/OJSkRCFTTSBGX9b6qUfim6X0BgcHP0viuP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvK4Nt6J; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvK4Nt6J"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38f620399a0so729762a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787894945; x=1788499745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vShHEoFxeJdHMF1BmMYjqhuL+4mZo5/13uAzSfeknUQ=;
        b=GvK4Nt6J1MXsURKTrH/4CvS2YEa51CZLkv66FPIrBXV0udvDK25c6KhVScTMebca7B
         oX2By5E914t345OCz55OVpTaJWrAg7G7lhHdIIp88OVSqMSBljnlaS8Y2s81LbrmYj42
         js3Pe5DFbR0XvAYT1Pu8ig7Jz7ordLJYD0vsJ/8vW8PqxmFSQ3j5kRg37lYLlF0wdh0x
         JASHoQipeg3ihcACM20RZ4qIZ9E9g+Ifi+tpjWcoFJm/W+iawhnnQz8UkGy7LOFWlm9B
         dXPNqfQwfW1Aw6duvrlfoFpHilEp925Jl+peaCDOr++R4BnH2CqLLNMp1f3Y5ynzt6JL
         pjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894945; x=1788499745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vShHEoFxeJdHMF1BmMYjqhuL+4mZo5/13uAzSfeknUQ=;
        b=Jq35IG5lk9JYwJdHRUYjqWgMlVHjO0XCvlp/bfqgRNHANPbnNNMuxhnR8SIeLLJRHd
         qm5Rug5oGTF99UdeP+W35LiRfx69+BnICYps4kcEFbb63mfLMrMVk8q+nk+WrMdbhySB
         3IpYgHbooKwsuFBTnpOCWGL9uEYP7V0MFmgcB4jWDhrVhv2YuQLPy9CwUDqb1cf3luU8
         3Y9D9wPuxLQWa0pzLbShFnMzGAXTwm03JFERpKUGiQBh2u5XdpJrZNOW5ZuIfDEE1Rbz
         +KJc4J7agSy7R+xPVn9xDGXmNJLJZ66xf2bRG0GwTNPL/TTdlZIagsCXSOXyOZuW9oN1
         X2ww==
X-Forwarded-Encrypted: i=1; AHgh+RoXtxaR7nYGjK1Dp8dplBRyNmv/DqWqh8VnucAxq3nEFVH/7Bpuce7qkNwNkfwjUgQBgwSnLFJ93DcPikY=@vger.kernel.org
X-Gm-Message-State: AFuF++ntN+7zShbwLjaIyVBPDkJTOtqsFXZoVLMOBFQPaSOfZIvlapCc
	JfrwMPtF0nQtboxaBHx36R0ITx21lnZQSZiuQ0PtCTDfWDYDKmGxKbBe
X-Gm-Gg: AR+sD13h7svXLzKs18MovGcWsgktX2+M8BjCRaa5O02muekcqbGSNJ/E/KlfkScMM/s
	WQJJmSISkxYRrfb9dyXL4EqYLlJKXS1Zktot6C85zi8tjnOvIwOnSOoRxgu41WhW7y7EHBxLSIq
	v34JdC+RwRcsK249ITluD4C3fqGiiRPBLqXi2j7DJewkbvt0MdVi/4ieghihclLC+DbnGxHfynu
	z6mkkWbpWOOKD9jUQ8NvNRNdIJ5gQp4h4kjrbhhxPnTiTLTygpibwSdDRm+3HSSJL6PpVti1sov
	JHJHnNZslyM0rkp//T1qZ7/yNHzKNf3OCqt3OTU9NHd50gw/KEyuDK00DOoeHYDR+Rux4yQBqtL
	C9qBOcMu2pThfEA4F0QpRump6tVjNjzCELjgBv02IdFVG4WynRbKmxP3eztVt3Ze8KMDGl4tvAI
	Melb7y0SIrq/vwmvrTtNkiHgZ+dyDAzF+XcXtXu8XJbeKw3SzOPdb9LljpLg6S+4Hgq4guBL1d4
	iEdA9jBv+DMd0u1KL4ukbBqN5NZvXDzwMT/37L/msuvguLPRk+fgw==
X-Received: by 2002:a17:90b:440c:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-396d0eab08bmr8717768a91.6.1787894945457;
        Thu, 27 Aug 2026 22:29:05 -0700 (PDT)
Received: from hnkz-ubuntu-vm1.mshome.net (flh4-125-195-69-140.tky.mesh.ad.jp. [125.195.69.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7835dsm1058007a91.5.2026.08.27.22.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:29:05 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kazuki Hanai <hnkz.64@gmail.com>
Subject: [PATCH] media: dvb-core: synchronize section timer on feed stop
Date: Fri, 28 Aug 2026 14:28:52 +0900
Message-ID: <20260828052852.1975097-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The section filter timeout callback dereferences its dmxdev_filter and
parent dmxdev. dvb_dmxdev_feed_stop() currently uses timer_delete(),
which can return while the callback is already running.

The close path can then release filter-owned resources and allow device
teardown to vfree the filter array while the callback is still executing,
resulting in a use-after-free.

Use timer_delete_sync() at the common section-feed stop boundary. This
waits for an active callback before teardown continues while preserving
timer reuse across DMX_STOP and later filter restarts.

Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
 drivers/media/dvb-core/dmxdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 6a825d9bae43..0f5a35bf062d 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -486,7 +486,7 @@ static int dvb_dmxdev_feed_stop(struct dmxdev_filter *dmxdevfilter)
 
 	switch (dmxdevfilter->type) {
 	case DMXDEV_TYPE_SEC:
-		timer_delete(&dmxdevfilter->timer);
+		timer_delete_sync(&dmxdevfilter->timer);
 		dmxdevfilter->feed.sec->stop_filtering(dmxdevfilter->feed.sec);
 		break;
 	case DMXDEV_TYPE_PES:
-- 
2.53.0

