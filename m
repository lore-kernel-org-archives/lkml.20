Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806620;
	b=Fa2a1fJ0Jyh6Qb3uouiKZwMhi+jglHXmQunkxqiEYrJfU/RRS2EigxgZ8Y5o4KupbgAY
	 oShp0F0eznaRprdW3XEpYXGA5WXvqsS3prN7eieB62pSmVWsDCwqpUxkiLkyvpEdVP9WV
	 VHeXdyqeksjQnzZOVtpUa8/9n8o8gur/Sh6KRfR9SQt7DToWLQXy+h7CUr5hu9KrKrhPn
	 ip6zSTHMkOCknufp+n6eGHyBqKbPPFcMTXJ6sfBgSZTjhBCIpfwNHt5Z7eDqeaJsa5zIt
	 OD6dgl0YT+p93ENe86Uxd8aNwQ3Z76fodJrFiInabf9xgMztjzeTKDfGjR3KnyerFZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ezAyafs7itRFwZvi69GYT5lFoWwHTrJ2DQwxldT/WPc=;
	b=FPgPBzaJf762hHArKS5cJ6hoXeOCgDAzchu5Wc7jWfWAI/4r6E411cP6ffVq0Hwiqr2J
	 8jjtF84oHI8e4HbY+6NFbmHPBzml07kEr0zBy/GLF8DYGQIaS8vnHP4WgkvaHGfXFTmGa
	 XbCaTmJJVgflt93fEqkwWQwsqcJMY6u6EtCYzFOGdl8DYqE832PzpT4fPAuGLxw0+qbjQ
	 VhD2Um50jXSkqnniKPu4BrW4MAONULOH2svzyRTKC/8LhNvRg5HI8Gq6IFJG7VfUs5E9R
	 1g3xOrw4kds1IDFTOeB43P+U1GxwIo+tC3SU4V0daGZqyH/t0gicmLYENebxWCbSQkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qcIhFa07;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE54606D805
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE54606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qcIhFa07
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a215e64962so8341815e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793806618; x=1794411418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezAyafs7itRFwZvi69GYT5lFoWwHTrJ2DQwxldT/WPc=;
        b=qcIhFa07dQQeWdIoOz8j7lunWh35YwQ3SDz+BwRbzAcJYFMzb9NMN+I6sgZoLmcaFG
         bRBn/04SA0qpHpvnr6+utzk6PX56lX03M8Vo5SVOnxugNGBr+Lajwpbh33MxApHtuGOJ
         yznXGOOvLbo3w/lB1i8FCvG0vqJHrtIBKwkxkmSb+/jIoSRbxx4iEGhzvXmvVkVJdM7X
         uPT4tHfc7V9lWC5Q3SJA1kkzSir00ZGCMohJZNdBeBSCYokJFS0/ZnQXxsVRpLN/qCsa
         sqcASTHhNpmuPNjwlN7BpNdw2FTbmHY51mz0Au9TZ3b+vqUGoeynhp6ZHDoLAVZ4iC7B
         6hEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806618; x=1794411418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezAyafs7itRFwZvi69GYT5lFoWwHTrJ2DQwxldT/WPc=;
        b=mOnKhbj9U4D7tgN7UhyRNGC4+TcwVgDQh7vywUelVCi6qXF+CWj35rIa/LdpAGvKAD
         RCNMzLM/aipKTRQiJE8rMKj2gXKh3ew14z44wiIvwQs3C5snFQ/pe66sb+bxWDN1mZeT
         xc6iZlY0e/FgXXz4ng8YHkVAvIvGvtO5hG0wLjonoQ8fjt1X3pjLcqk4VavFMeqUWXxh
         tBR8hrp61qaeiZwsmsEupCeFlZ2dqYAi1w1ahazh1ZRz1gEipSinNe3I+HmCw3lCNh1X
         dv8LUK+KZB5/Y83TEk5/1WGpzoaHPKR8tZxNmb5auDoX+F6nlOfnT2L8ejtdhPCPqXQI
         BLQQ==
X-Forwarded-Encrypted: i=1; AKwUvByQow65g3qps50cIkQUpm12s9VkswxSW2QRtIWgGXihLIzaeE8aGo2M6vrLFU9hg/9XRIoN6ORu3Uf6q2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ABf9Lj3qvwLtlRUrpX92gQEiwlmR4BGXx7rAVndW483ym/Lj6
	I7mU7N9JV7p1/dMcKjBNfiNp1lFAWcXt0b7QuGxuENvLJSusna1emRx44h7Wa2keavA=
X-Gm-Gg: AYBFou2cJJzVJkPo5HEZC9rsDm0JewUSlIh5NYBflYsWhX0ddrvM9lfxE/0aeKO3EYn
	LktXOBdPsjAfbblF+AggHkyPaOlsqFI0KTNuInkKGOJp4xkYZiRpeQZxUoasA/erhSjoMl8sTQF
	60ywQQHF5yd1Soj8DVeukphvH1VOZE9X9uoV13xKIlQ2kQjZhHu59kkEQ78gzleCdml/LjAhXwj
	lMt5uSZtF/A5pqnJBktcTzbelYHIbxEZw5J8fFrIeGZ9DyM6ZMaKaSwAYtJnU5gH22TKyIc6HjQ
	plx4cX/6NPECJfPyFGCfm7ijzUNpsfswTNhf0XCB5JaNHbd8FJD7Dv/+J+TBEBaKoY1mNLRwFj9
	bycV9iYr+zcgSajl7055yVUfYMVfO0qqJWUoPvA4rbWjozg5hb6yso+dyd7Zl+fYR0m+88julta
	dzTw8WdBylPtj0I2bDPbYkB0Iurxi7JSFEZRaSwcSY3Nd6ZyqDZoSEQJbrT/RK8tGAQvJyFziRc
	Sep3Bt0iWe4y7k45ihflKfEDWUxaGAJ3VXOWcD3uqt1NWov+m5SENw0v3IfDrU+vPSqA/nv18OX
	c7cheRcTFaLB4sU26KEQ05qybBhzWz6t
X-Received: by 2002:a05:600c:4f0f:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4ac17b2cde9mr430246865e9.7.1793806618195;
        Wed, 04 Nov 2026 07:36:58 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d4c9d4csm82566395e9.12.2026.11.04.07.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:36:57 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 04 Nov 2026 15:36:33 +0000
Subject: [PATCH v2 2/9] coresight: etm4x: Remove perf symlink if config
 registration fails
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-james-cs-sashiko-easy-fixes-1-v2-2-410c03941267@linaro.org>
References: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
In-Reply-To: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

If etm4_cscfg_register() fails, the perf symlink created just before it
is left behind in the etm_pmu device's directory. Remove it in the same
way as etm4_remove_dev() does.

Fixes: 810ac401db1f ("coresight: etm4x: Add complex configuration handlers to etmv4")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-5a385158-37fb-48f1-a8c7-28e86e07848a
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index e21be6468e95..ba21fe12870b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2258,6 +2258,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 	/* register with config infrastructure & load any current features */
 	ret = etm4_cscfg_register(drvdata->csdev);
 	if (ret) {
+		etm_perf_symlink(drvdata->csdev, false);
 		coresight_unregister(drvdata->csdev);
 		return ret;
 	}

-- 
2.43.0

