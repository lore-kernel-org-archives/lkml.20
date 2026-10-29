Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282017;
	b=A8QnZMM54gDHvjmG2bjnFzJUqQKjqzku3qjorwIczd6PJ2gpRC1YWrXq4BN64/OOJjxh
	 zzL80Ji8hA+ijASinhUjqHfbIIeayzZeQy8Tksj2k7cpZXyKrxifbAYAL8zDmuHzzJ8Gw
	 musXhft9A6gNX6HNjZxU47j9WqsTN7SjFRrN+dAP+4q23rrTjDiBgG8Am+qwnN9ZXZX9n
	 1Ub6sgeAjb0s1EmJPTfEKb+231p6oOUZh1GkCKI4B6SreLIU5FzDrpYLDs/nDurDI2Ohd
	 TJ6BwRM+pLQ+PZOuj3K2EZu4D/qIXRQVA4EQmTV6TjAK8nvYfT18j1mFzjxrhFevCJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hjD6VzzjtnD3e9erzE1FqqRgAbYyuZXKrgqZLwMhAKA=;
	b=c+DqYS9FF3QAC7Vtb+QSHrmfP/HvSB7+2xoWveUlXWRG/Joo9f6S8s/cNsr3uewnvcCC
	 72Z9rTJ3ql7szSK4oA1389DmosTB6RB457e7wUMPl7GXTK7y4fG3qFt96YvjoknXUSrqs
	 28w69b6t11YunxW5VkxvK14kAvJxjfWHLHaAopAsfmQ5NB2St8um4pXQMWtirGJfHLpn4
	 iauXdW++wSKhxDam/rd/tZxOn8Kz8uprtnb5p5ZJvVMebp6Ks+ngQPCMo0W5k344Icgcf
	 Sxs2J3V1kWX4BAafY858ncV1FA1JLAcdsYxhfsq+flM+0MGgEXVJ83Lb2MzPPOZOcjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hld8WdFU;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84794606A833
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84794606A833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hld8WdFU
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1626261f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282016; x=1793886816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjD6VzzjtnD3e9erzE1FqqRgAbYyuZXKrgqZLwMhAKA=;
        b=hld8WdFU8iJeyCtWh3V2Ho7fyvq2bd03nxb3Nx3hWjyDrA6+5fRApkMZc6Uct2VfyX
         f70kgogI9V+CHfRJ1i16vKgQ+RmwJ4bwULneAe59C4t+etSmEk1JX5IBD5arLxiu4yvs
         kLcG4jH4XkqeJBpodUgbE9xnrb2fwwBBFxpKnm1Uv0P4P1x9wC0a7mm4R8N1rWI4oszC
         c0pYM7NN0sVZP37MD2AQ3hAlklOonTajnsGRh2rqD4VZNXczAr8jBovQZfuawAH1+i+T
         H4KgDlPghGW5iWJrZrAE9I24pysLb5rGZwkYdwKZkdVXdAyTsLi7BtkdAUQgw/h4FRdz
         clBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282016; x=1793886816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjD6VzzjtnD3e9erzE1FqqRgAbYyuZXKrgqZLwMhAKA=;
        b=Fzl05seTDCccIxWAJ53MSvtpX0TDDxP9JkxWxg7pOHhKWXr9e9SUgXw4zBiOHzL8/K
         TX314Qqy+duujS1mNxpnaMtA0ImNXFDPAr9CcZHup9JY0PdN5ILALx1+OFp10NSgkOq8
         mTbUNs+EOFhRh9iaAJ+dvvol15VmOmmMwf4PqvDe8r0n37esjyKfSNOSaDnUhahlRolK
         gM5vNPxXQx2J1XGvK73vOo+AMYtewWZBTfqGAjWZDxkYThmX9XWHV+/VpvyYaPcQNaiV
         NH96l5Wpn9Yv2fn8ZQZS4m2sSWvYwC8eMQrLZIr8s0LOX9BeQlZd4jnE8Pkg+IUD7Sd1
         XfLA==
X-Forwarded-Encrypted: i=1; AKwUvBxH1iQkoaFCchUr0Nv81UMishgZrkz/zf9g/9/bQFEJnkceMFS+iy3+DSnc5GkA2EnQJrDLbpY9FFzSGic=@vger.kernel.org
X-Gm-Message-State: AFq9FYKle8gUTd/LAOcRrIqE4oDI/JPRkn4NrCowbeInTl5/6LHKJaHO
	VIHD+OsTtDq0S/GKX5AQ0Gf5zGslH+BxCYBuiLNXUkbUTgxk5fo5vkY=
X-Gm-Gg: AYBFou0uv1cCrVJkddb1wuzl6OM92lVBl8BFiySp4PByxcvkFNbP+U0CvuhzLe2axUi
	xuSfm8wP68v6TnGCOTfWN3t7QsWlPD1d6eMa8FYFyasHs4TUje5E5EyZ17bJIqJF+GOu65dbmW9
	Cm4KF3l92+FuWO7dBLJHFp+9GGI/lSK6460QmNei96Mt6PJS2FO5ocHayPQiuynlR8ak58NnyJs
	NkWQ6qWCcTC+sCuXMA7QFGsLPjHYafTAZxZn52CbZ7euo+ZDBNdvtTPDbY3o0ny4P/xrhOz0EV3
	xtjZjaGaD03SjHTEazRXpeYhDYCVAIMfo+2gPYhaFNWp0qSXPbOa5QZhS/GrB0LD3BdiPt2NBPe
	MW9tOBsKCDOGrw/pNyhR/ryn05MG7BPTqyIpxAmEr/rET1nYZy04HiyLswihXTzoEYtyXa1aFpq
	N9J7P7woNOHcvw0BQhADEmbR99+t21VapOZc65oYNEv3MYyUWHL2hGheFaQv7jl2Kwjkmv3n6+o
	tgfzTK8OBYygbcsaNIkCsvs9a9KrxKWaQriyjZ/Ypw4tj13qn/i4oPpD4NA0KK46LOYtzpqo9SF
	5KoYKXtX4qJw9ObV+qGP30/Mar9QpGT2bQpmA0PSiQoIETDOizPkELJYhBm2wAN+Pl4=
X-Received: by 2002:a05:6000:178a:b0:48e:56fa:9645 with SMTP id ffacd0b85a97d-48e5d5cf38fmr12439039f8f.29.1793282015845;
        Thu, 29 Oct 2026 06:53:35 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:35 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:51 +0100
Subject: [PATCH RFC v2 14/14] drm/msm: enable LPAC on gen70900
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-14-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=982;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=zftBrxFOdArPW4SDW/zPbLM/dW8N0ZZjr0f9slsMd44=;
 b=drJK44c9MU6MO0yKK3/YNJmZlff0GX8bkfJNHj78s+gEdYZMo0J9ar0ZFCpDUnU9s9p/mTv9U
 QEVDlUzSQ7wDLCQ28Hd4GN503IJPB36U2UQmXnTQDK6NcMLz/o9Mfkc
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

When the enable_lpac mod param is left on auto (-1) LPAC will be enabled
for targets that are known to support it and are known to work.

gen70900 (Adreno 750) is one such target.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 5ee00eead14c..cd1bdb54429d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1591,7 +1591,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
 			  ADRENO_QUIRK_PREEMPTION |
-			  ADRENO_QUIRK_IFPC,
+			  ADRENO_QUIRK_IFPC |
+			  ADRENO_QUIRK_LPAC,
 		.funcs = &a7xx_gpu_funcs,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {

-- 
2.56.0

