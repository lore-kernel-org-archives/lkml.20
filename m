Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473856;
	b=auuypUrRmNyiBc4itGnGnGAmrq6Jbf8HzGku3lf2mB1qpyPA59oJaEnEoCf8IT8LuU5P
	 yAxPw9VQ6zI8XPPGk8G3YV1XmPpIzdYMtu8FmF1Q4cFn8+2bnLOTqB4cJVNo82EAwf5kT
	 1HiehO6xk2vLwlKxOkH+IOasUakP7OEr9ql32FaANhWvTChHzr0frySJ9bESeW6goW5F1
	 OngHSbxtLWXQ7WGLjHSmqA3t5sGSOczJ7wI+G2axowQ+EW3XZvQ805XuKOGILcQuZv7xE
	 iFwC5u/FSesz9Le3mivcK6+zRtIP+ePcYNEzLKd7f8DZF9rk5I99/zwR6xsVM3nBrXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=caTSnsBrTqe94LDzn8TNXzbenXC+l/bvRrYsgGczlAE=;
	b=WjXN/nayrWhfnnsdASdlDoLXqrTrtGnu+SgLQfjPCtOTMzl/pOZezc0oicfG/9LrmfuH
	 Vv9k9GlqAnubnoNJ9fRJ4+r0IdZW32P3Mw2j0thXrp6U44NkXVFpiC6x35MbK9OZKNygd
	 AfCP5biDGGntJGAhrLQGjcDajYYvckkG6a+7NJlRMguyiRbdOpIDwKwtyfCrpydYUbEal
	 4yDPscWZOb41AyQaCq4u+cX8qIZiTGnHlZ70v6u45xlZpGjkT6W1nkQvEzZPXd4iKbdp7
	 FfmZkZ6VSELkG/hF8ojNFojh0d5BR+fi9bWRYrSrPEmbyTt7FKNxjZTR4Qr4JhRNLRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qx1+s8q;
	arc=none smtp.remote-ip=74.125.229.2
Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0417F606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0417F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qx1+s8q
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-327b1d5824fso3277777eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794473855; x=1795078655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=caTSnsBrTqe94LDzn8TNXzbenXC+l/bvRrYsgGczlAE=;
        b=0qx1+s8qLZWIWAWbqA070ck8AaIJ0zFwuvyDK0RU+jNnluK9wao8FyEcxplBm4q8PI
         WzPQ8MboInroksTMHTkz7DR66jv0KxL68L3I7aIlSY3fdpxbj11WDo0HpQiSKyn2MoEj
         uZygIuy+9KUYik3lLYuU6WTm1S1mhYVhtIuyD9MDB0Q/ETtEG70I0/a8M8LLSX3mMrTN
         ANX8s5iCX4TNxb66fLLy08VVB05mRTbc2vnmP48TmnMGwrJI/bR/6FdLPnSeYDwhUUTY
         uYvVUu7arduWHpqzbBrVQWF4d4P5b+qKK25WOp5MInzX67GDtUjn8X3AUzCswmsD7/pU
         NAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473855; x=1795078655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=caTSnsBrTqe94LDzn8TNXzbenXC+l/bvRrYsgGczlAE=;
        b=oo70Vt2ocZ9Z5AIIJ9jk2dIZTPHTi0ls4cy42GSuJXyJ9P+5ipzXxsnN4EJMBBaXZG
         +4/Sosq5eUvKuWZppMVDzN5+qTfuqK8ab5IAFDuGr0WXdLWLHPQ/VB4RXh/UPpcevTL8
         ZxIk1z2ZHn0l68WiEqy00C6kUHFwEMnIz4n2vUtPNS2Dye97uYGBaaF8IcFctXAHX+S+
         L86CIfgRKFsjb9yzz6NPhUh4gAQdS88FRFgStP18Z/Kb5fAjeemBJYd1B1uIZHZN6y/q
         /0cdAvPH/PDKn18lNr/upnyIBfxXGRvGYkuVd3zp+oK/B6WOeviIlP9mAquE6lK8ngAS
         xlWw==
X-Forwarded-Encrypted: i=1; AL+hErFA02ANbTEzE5ih7wPwXaJUYiTMtkMi92Qk4g0SioL/tepDWalnlS0Ut+FWIBOAzQDPyzaW30KK27cUw1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Iqv2sFfW6oJGcayH4Y7LMa6cAenLkK7K0/YBp6KwrZXkL4pe1
	7xnP/siaibg9zZFzDEnPxp4GOFm1LaO/63y4it4nMb8vbBrfi1ww2krS
X-Gm-Gg: AYBFou2/4G2b4ZPrLkIV48tXBgsnK0q5VKWIozwdB25ZzjnAbDqEtr9OHp5g0EiPCg4
	P23WBfqlfZFoRcLzlNNusvoSS390r5u2LAjk+DDbAUJVceu5mYoC2tpm73AQEQADX9j7VIhiDTb
	g7uIob4zFm8APfwW368vdVK1Eb95mFvmyu2yGRCd1rNVcoaju7QAErxxiATaeuglUNnnlsOL+BK
	jYMTBGGOtzOZNSKtVvgiW8ree4bB9RCKWlnka18pRtEGF4oUTfpGvTcEseM42XUQKfAR07edPD2
	qSD41lx4R0lXYt130YzDCoz9futvRVQ8+TiqWTY0SfxUCsvFzv7BSsuBttIJOiR4MkfYfB1ckKF
	EL/GULAEvRQsywDLkKuBXW9H4Pxej5BY4/Ckhw2opRX2vM8thqiRKlUGX1jcTeSi3rv2AochHO+
	kbw5jPOGZHJoxUf/pq7Od7DEO7XjeBCCwJh6Ejjv2M+rBDQ2WSvR7///DvNuLDn/vQ8ORdVOKzl
	LKgEqs7H5D7UauWjVRzdbzs73ioUoB9y8mrjKUs5Og1wC5nE4QI+oX6h/wMTn4zvSm0uLi2oR/c
	xnsNCwl4B68UVm+M+RXLxiGAigFixyIkGPlntHtfhFmm/zY=
X-Received: by 2002:a05:7300:561c:b0:36e:2626:4ace with SMTP id 5a478bee46e88-3768366a866mr5645746eec.5.1794473855002;
        Thu, 12 Nov 2026 00:57:35 -0800 (PST)
Received: from world ([2409:8a28:ae4:7f20:114b:916a:a0f2:66e5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm22163168eec.3.2026.11.12.00.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:57:34 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>
Subject: [PATCH] media: i2c: cx25840: guard media_entity_cleanup() calls
Date: Thu, 12 Nov 2026 16:52:51 +0800
Message-ID: <20261112085251.734109-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.56.1
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

sd->entity only exists when CONFIG_MEDIA_CONTROLLER is enabled, but the
two media_entity_cleanup() calls added by commit 634be628b5cc
("media: i2c: cx25840-core: Add missing media_entity_cleanup()") are
unconditional.  Building with CONFIG_MEDIA_CONTROLLER=n therefore fails:

  drivers/media/i2c/cx25840/cx25840-core.c:3964:41: error:
  'struct v4l2_subdev' has no member named 'entity'

Guard both calls with #if defined(CONFIG_MEDIA_CONTROLLER), matching the
existing media entity setup in cx25840_probe().

The failure was reproduced with CONFIG_MEDIA_CONTROLLER=n.  After the
change the driver builds with both CONFIG_MEDIA_CONTROLLER=n and =y.

AI assistance: the fix and this changelog were drafted with the Qoder
coding assistant; the sender reviewed the change and ran the builds.

Fixes: 634be628b5cc ("media: i2c: cx25840-core: Add missing media_entity_cleanup()")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=222245
Signed-off-by: Zixin Wang <w1355457260@gmail.com>
---
 drivers/media/i2c/cx25840/cx25840-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index 7066b2252afd..91794ec59e2d 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -3961,7 +3961,9 @@ static int cx25840_probe(struct i2c_client *client)
 		int err = state->hdl.error;
 
 		v4l2_ctrl_handler_free(&state->hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return err;
 	}
 	if (!is_cx2583x(state))
@@ -3986,7 +3988,9 @@ static void cx25840_remove(struct i2c_client *client)
 	cx25840_ir_remove(sd);
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&state->hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 	media_entity_cleanup(&sd->entity);
+#endif
 }
 
 static const struct i2c_device_id cx25840_id[] = {
-- 
2.56.1

