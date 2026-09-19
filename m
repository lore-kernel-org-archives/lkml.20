Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35467367B7E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789835853; cv=none; b=dN669HrIY7RcZ5+yNO8OZpeuyuwE3cBVOzEX9lzlJV8CDrE9yjyl3hwRO50VDUuQkzwsLosyBd58xuzhxFIwAdTslZC7LlBEmWgp2NBAJGV1GRruDTgHv393qpHAz8xWs34ZFQ6ledYgdI28kkgB/Qfb6kY34hd5Mo31QNgvVoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789835853; c=relaxed/simple;
	bh=6vc5mwlNKdSSWUqAj4sjOR1pix0daDHthz4ig1XWDs0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eVrMQOZ6/HNZa6Pckx7Exdwx3wUbKXxglnxkO9Tn3hU2/D/gguCeWONFJvjVBQ+s8b1LCRyw3keA+5nXSdlYfJy59O4bz90Fqa532Xb+oZ7tMlRHNBOsCh32IQ4q38ujqpbMXX/iHGA28hsw977R+dTFWiCx5FnhC3ccMqERNO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArsxQoob; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArsxQoob"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso1381835f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789835850; x=1790440650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgqhI+7tTNR/gehAUgAlA1m56lV4Jk2GGCXFewptpVg=;
        b=ArsxQoobVYhZPeuVZNI/p3t6rLpk3TC1g1BFH7LsFViDaUvGIhZ5ke7WEoa6wJ2YAe
         A8KCvhJxyCd5p1Zx33F64z76Gv5Pqa2p+KsC5vswAAFKoROTpGl+Jh/D3N2LEQoEBWWE
         n95uN4qD5Jwp5mroklTfFECqyLTCW78d22FH9A3df72/6jUEiP4WIp/PdknB0+q2x6be
         /gGtevfISbtn4fNCOKibwdVBF2nW0ye0eJvycq1A9KHODe97Y4yqXV93rDrMQkmEHNbB
         BVHm2X4fTC9Na1O8mGuL6ENBX949Das9u+T2EtXFm5nYoq6+A2jGxWfjuo4/zrTUloZT
         UxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789835850; x=1790440650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vgqhI+7tTNR/gehAUgAlA1m56lV4Jk2GGCXFewptpVg=;
        b=tkC+FKaMUY0t2HWueZD7iNYXcPUFELrqXN2YfJeFnaiapXfNZ3pw7tMNd4RGihv8aP
         8S7reqymN6aHUyes8gy2xpnUW80gEpTV1KeVd9GKUCajSEt/p2GxUb80OUgFR/lCbWAB
         PlDxSuMy8tHRjaMK9MQegaHHfE8jlNVl04IuXpEzcWlycKJNAdDGMY+UqvJthX48EJ91
         1exa7ecIPF5jZfuCrixU19m3qiIUkmRtYfAUCUgqxWr9Sney83QjOtrWj1XdHQlMxXDY
         xzsSVyJKDyNu+FUJwjRurxZPO2+Tqw5nBAoqjL9ggsF839y6VCY+hal8JHmyIkyi3wD6
         xI3g==
X-Forwarded-Encrypted: i=1; AKwUvBxz80gxpfxko2qSKkg37maC1DYrkq9WWOsTWFCjAPeNdT+nFRlvlmH8O1IKofnmJeU/jRVRgP2w+qVox14=@vger.kernel.org
X-Gm-Message-State: AFuF++kh5sdvcFjBVMfrcvudnAMJ4+MuqRtk11SbePzgp+qhrMcgfXFx
	kbWpPwEyB7PillO51ecHYNeoPzMvZEfJGk0n3jgCvOHyafPXacM8QhqD
X-Gm-Gg: AYBFou00+3y0X83AFc1wHcRUHUFnfBWyQBIMclZNzOxbF8hhjU4fIANNKvxuqxcO54R
	lbd52wKxUmlNlkPxQp/Q15K+7lLBk7obcuA2heDhKMAXEMM2w06xpJF0s4q6G7ioyf7nl5FPaXf
	IM5KyI9/rCCi/X8nL3ixbZVmAdO0qUN639ogvzpbjj+GAV9lxtmI0VePLOT7QukfAIoo3j9a1zr
	HH3YWzYpch7qhuL06sQVzPkwHFwBr/gnChNZfbR3pR+GuAdDbmS1Fh8L8eRVxW+2/Ck4hmwVmBk
	pbrL3nPTAByZQyzl2P+L5GXmMeMcvyDeJPQfzlExc2BFTm6y/lxbFYlPu7t6y7mwr9E5SrlNvQV
	9o6NDQAwkHMqlHM27S1CdhFl6Z/Q8wuxq1VJN0CHzl7ICs0Xdq0HJLGw5GYbr0h7TdDFFcQJ+2L
	4Nl+bK0oDQRsdW2Os7eNTRUdz02tKplzse0GiOeHgZSAoLPMlYZ/L6tvs0shavfYtnJ4/ruaDAn
	4ZclJt6UuLE7m8dL1BoV61y6neD0wynIMgGTBdTXXHX9GxwHiP10ECUJecUOQcI4Y0G1shWQCsH
	X8Uw6xLsv4WSuAyySZUoGFD6QQNqQsiD7c8Wa4z64S54anaAHSq2kc/L4bykKDK6/zDVvtBMNLC
	Ddjb167wWWVcA04Q=
X-Received: by 2002:a05:6000:24c5:b0:486:f980:2361 with SMTP id ffacd0b85a97d-4871e3b20e1mr8905817f8f.45.1789835850295;
        Sat, 19 Sep 2026 09:37:30 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872442263fsm8155986f8f.1.2026.09.19.09.37.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 09:37:29 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: ti: k3-ringacc: Fix DMA ring initialization kernel-doc
Date: Sat, 19 Sep 2026 18:37:21 +0200
Message-Id: <20260919163721.89044-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260919163721.89044-1-kmehltretter@gmail.com>
References: <20260919163721.89044-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The heading for k3_ringacc_init_data repeats struct, so kernel-doc
cannot match it to the declaration. Its three fields are also missing
descriptions.

Use the structure name and describe the firmware handle, device ID,
and number of ring pairs used during DMA ring initialization.

Fixes: d782298c6f6b ("soc: ti: k3-ringacc: add AM64 DMA rings support.")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/soc/ti/k3-ringacc.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 2de6031b9424..37a333f9a10b 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -254,7 +254,10 @@ u32 k3_ringacc_get_tisci_dev_id(struct k3_ring *ring);
 struct ti_sci_handle;
 
 /**
- * struct struct k3_ringacc_init_data - Initialization data for DMA rings
+ * struct k3_ringacc_init_data - Initialization data for DMA rings
+ * @tisci: TI SCI firmware handle
+ * @tisci_dev_id: TI SCI device ID of the DMA controller
+ * @num_rings: Number of forward/completion ring pairs
  */
 struct k3_ringacc_init_data {
 	const struct ti_sci_handle *tisci;
-- 
2.39.5 (Apple Git-154)

