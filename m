Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806621;
	b=XqJLUQXE90y71jDdjJ7DMEouuA/FpsZG0tdiHlV/1HFBkpRtL7wlAJ6IGn+P+tR8IC3o
	 1FmnZs7OgyhQtikl7IZWjoLpn771TQjcDhpwH+zlnbUfOPXOYXYm/6ZSyhcx97tabg/c3
	 /lNBIgIwszYm/0JyonpLgzspfML4IA64KeSMixYRfRwAlUSJcn3KHMj9D+JIxaeh/0NwX
	 AOwd1Oca4aNmOLHQoMoYUDHyP0tY+XHTBjuz0sX5VOZ2wmXmLaxAg/HGHR+k8dsHVM3Cg
	 R2dFuPY6rDHVFmhLTviL3xkep/Ixpc/dTbX0YAQ2BaUXtKC8ZuiUqk9XVWhuQWtNAtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Obe+0XIIsqY3BnVbbgH1QXLQqnb9dul7kNk0NHZTe1I=;
	b=ZBZV65+G78X2mDtKB1++L0AAoi62+xWef15B8B21HhEEJal/wjPrtG8rUeQK1v1qPg//
	 S4c2wVjT9JXd52UE+Ury+kiAMNUYSrGHPw6JEr0moUFsJzQSEyv6qRw7hmBFmjhPcZC2q
	 NpPKwoV/oT9b8LW7njnlZ8DDoiX3CStoqnr+XauTZns6zx6Vg5Zl+UwJdBVmsOGA/4rYa
	 gAZAQHpO+UzYiHr2hrAmvh2efaSW0ZXllsByn4S5W8WEXDQZEpjPiydaptL0hJdkcM1D9
	 sWIoKiJaoeBxmw1AzIq90LGFaWTlDQKFqHWOaRekpBOlF+ft7SpKVMhCvbcnWjqD8rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CsQY6IkW;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F96606D822
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F96606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CsQY6IkW
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so11863255e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793806619; x=1794411419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Obe+0XIIsqY3BnVbbgH1QXLQqnb9dul7kNk0NHZTe1I=;
        b=CsQY6IkWXsu0ThEdpAcrvTkuNFtSvd84y9iSKTp3ogmpoQp41HRzWtLMzscuol+DVx
         UdOGuqLK0k83LXZ9kzwdhLzQmAX314PlhQ/Uoxtun3yRnHnHWzseyZZkCiMsdLjoJrnJ
         OyiyWC0RW2x7W3IpS8qVM9wrm/4nbD6lWxA8ZLU2whCt+Q8WlVlOe5EboPLGPwtdSr7n
         2L+ri5SAX72eOXuIq8vUp6824oW+aFpGwE0LMbvpOBs+0fmRSFziQ0TSTnG2PWVk4aUk
         yO7O+gYHUl66h6i8DK08anx0nBY14bpsvoWX3hZvL6R70z+kG7ii4z9SEkYTwXoTF9tL
         iYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806619; x=1794411419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Obe+0XIIsqY3BnVbbgH1QXLQqnb9dul7kNk0NHZTe1I=;
        b=c9sfx9LiGL+B3pcm+qvwQMPYT8zLJUHcZ1GTXgBt3V89weBJM2hblOSIzvxbbjKsC9
         Jd63mSgW+0HHIVZjxhrXkq2AGTdG+wraI/69euAr8Udzv3mq6M2gom3Z0vIPfthlI/PP
         KHSO86YMVla3aw9TQ5/avhhx55q/gp3WA1uNqP2jD0tP5qn9Oqh2LsYCFNsXefM8LjAS
         qDGIWyW9awRIKSqVrpE27K1OckyDs1SLB/ePcDCVpJaNVQo9HT+ERxV364Wt7sc+DNF0
         Dc5O8qN0xXpq5mPJKWx3M9uiz+/5sCKqX0iujUBUYOmIrZEvgOKpGmljdDRLM8a6b5uu
         fseQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+7n8KkptalbY3ZMyL8ziffMoyN/pyF/uvxaGadTzgdgtDhggeF1HZIs4k3F+uZ8i4JvOJXa8HNu4Hnss=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tDTLN3gjvuBG9nBHL7qUFLpJcxjdqDTryI18xfFye0N8D6cRG
	XClZn5cexGtEy8oopcr9NMfY/m77p8O4Ab71tzDQcqYsa9OkL9NaQwEyxiMgma3yO84=
X-Gm-Gg: AYBFou1umKEYps1o/ihJYJW3RJ/lUb2dvmzaB0l93UKJnGoBmk2G4ZHLeDlJxiKNSno
	q+1DUjRNzlHpOvzUtm8k6BvIIitsngy3jSqcikodcAIcobb7ta8JyjMDRUMHenBBvAYzolsSJ5W
	NULcoe6ZhprnVWYetUXtiWwe6CpZc+UsACieEgixb0XjOJqOQA4zBNFgXDG9spSk/05uMdpHZJU
	+uj/8HrqD+SaQr8zOSZlzDH/ly6SPAixkds2e2SZaHcm7tbVhjUqzAPO7gzwbp02wm9ueTSsHcx
	6xZyfg6LxHh6E+tDKaWW+kUVQ/BQuAT53zAVMnni5joatFxwZZScjqNT+YBpHxibBv7zGUmOZ54
	03Ien0wJUX7kG0q4lrmQK6Hu8JChWt/tjKcIS6RDCeLqmUwdPC4nMU0wabTrMXo9pWBuFTk/v8q
	idShh/lmmcL20VsNPm6uamEoqblqtagVWHara2D5J/zw2FmhDaFb5dRqQMLK5QhbE1gsICTwa66
	uekefujG+tsO1s+yHBWW+AzoypCJ4s6GnHRfVO4YoLwiWilusFU2J0q/CpUwD47zUPZ6jAzaffA
	7JDZSkV4FfFG+azO7asVsEcfUguambVi
X-Received: by 2002:a05:600c:37c8:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4ac16acd93cmr381064025e9.6.1793806619073;
        Wed, 04 Nov 2026 07:36:59 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d4c9d4csm82566395e9.12.2026.11.04.07.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:36:58 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 04 Nov 2026 15:36:34 +0000
Subject: [PATCH v2 3/9] coresight: etm4x: Fix truncation of nr_ext_inp
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
Message-Id: <20261104-james-cs-sashiko-easy-fixes-1-v2-3-410c03941267@linaro.org>
References: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
In-Reply-To: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

TRCIDR5.NUMEXTIN is a 9 bit field but it's stored in a u8, so values of
256 or more are truncated. Make nr_ext_inp a u16.

Fixes: 2e1cdfe184b5 ("coresight-etm4x: Adding CoreSight ETM4x driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-b3468d48-ff08-49c9-9ed8-fb6af6979e1e
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 5417280cdb27..8628dd4e15db 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -874,7 +874,7 @@ struct etmv4_caps {
 	u8	nr_pe_cmp;
 	u8	nr_addr_cmp;
 	u8	nr_cntr;
-	u8	nr_ext_inp;
+	u16	nr_ext_inp;
 	u8	numcidc;
 	u8	numextinsel;
 	u8	numvmidc;

-- 
2.43.0

