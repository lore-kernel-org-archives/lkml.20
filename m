Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112983;
	b=usIshg0Dv4CtS6CSbqebJsRL0yffF1Klh9Pv2QM5mxjxbaBfNKLOvvdg+p4jNcn8xXkX
	 JG8W+iz99rJhUFI79SCiDj7FbI+lm0+AF4lNFaZmr5BHK0+r2YCJZOL5y9T5daaamR5kF
	 /KDBBDuAo2Cs+gJ41ZXtPR7Y3E+m2yXAOSlPhxVfVaGs4rlNRrAwMogtgqPFKFlQXx0/t
	 uJhKdC1xDoAgCiY+6fTD30p3emyXxIQL6i/rtag6puv6dQwS1UC/BjLuq3vOplqszgEcK
	 l0++KSnhB4SIZg+WrUbu8n/M/cAgZaVcUgYk3H6/sHg9Ii6GFqbY0SyDVod3k6aFWNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=28LEL6SH/7U3NVlMxEJy+3wAWoY5NqjcYLMOY+1DsjU=;
	b=cJaxkdlCSPii6PZm1qrmQtObyJGBOGALSW00jKSNsFhDjs3IrbletjCYjxbuIzzGVfY2
	 Ndl19BeAaaIE/Ulq0OMWA0YWvMDWFaK9jlc1IbC/rrU4jOXGoxnJ9h3sNeRjPN5k/3Z0/
	 Y+kyC3tc20i9u5zv3Ue35Wv4hWV5C5wVwX8FmSwgmvYfLfYrNPia+gUP/gZtEbspINNaR
	 GMx3q1SYriJ6q2vZ/YVJfpBTXrlipoLiWGUTIk4QGr6pC3NbKg323eFsdb4DeQTKMqLLd
	 8AniACmfhQUmXot6Uk4+r/8twEkrKxZeYbTZV7Luo6zBYs7KO49oXKll4nFPFa6SVBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=x4C9qFDi;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D77606A329
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27D77606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=x4C9qFDi
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso37149655e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793112981; x=1793717781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=28LEL6SH/7U3NVlMxEJy+3wAWoY5NqjcYLMOY+1DsjU=;
        b=x4C9qFDi55tnaerq2MugRDB/3Pz8OPDScOucbJohWB79ueHR42wl07sbKjV9uj6+w0
         9YxUphPI11pXKILaNqCCCk204OvGvEufLEwh5m7a61tLzGKvasX+hJlK0YWBmWbI516g
         dESnbe9qrCGCmFT9YFOT6WZCKpIaMHO117PK2ZqEDhphWBwDEI+DJWU7tzdUXBnNk6Ue
         vrutnUKnpS1k/KcclFUjyXF1S9nCvkiKCgbnWj9dCZX5hge/m6H2aHmF8OXG5WdZNSi2
         ZUzejJPSfiGCNFXU17Okvrsn1nanXoimeiwQuSMSq0+rJmt9LNugPF7NpXnsszxBQ/nx
         QDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112981; x=1793717781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=28LEL6SH/7U3NVlMxEJy+3wAWoY5NqjcYLMOY+1DsjU=;
        b=A7mVdDbxyiyYjztem8iNaBNGLe2JzkgeMNdn8LLLqeYkEJpwkz9T3JkrvkyhR3He7d
         EtoTkdOYuNhTtD7z23nAQa2xFak9bHygbztByqW0qrcJHhAU8jVX+TThNabxPUnZEYyf
         rTEvr1cSv5stAvJAYm6Rus90dEcKOt2mqOgLaf6+nJOZQQBDl95v+w+SxfyR5nKIyfae
         y+hPwb2jYRi1nrR+v8EOX5O6OufogR7/42zSoRoWel5ro91a+SSNMDL428PTMqi2yB5d
         uZ3oXA1Z6dMmob7UxVF3HDHQl8o+4aM/4Zj5nyycoNxSXdk7XW+xDPyX7rHQLTVXoq+h
         pRvw==
X-Forwarded-Encrypted: i=1; AKwUvBxsFnbbVKIowKrj1cQOFJ/MPKl5DEtwCNCitCi/sBenoFG2JsgcVF4LJG6CBWyJMbWKlU1hPdweKKZgtX0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLObstESbutNx2VmRiSEb+89/qbU+TGzuyM6qeXidhKnSvIdBQ6
	xFb3PK3B9pRiK73/DquQqRveh1ewPxMPkmU/giCHpYffNHucKY10f152zWMXkinKcZE=
X-Gm-Gg: AYBFou3ZjK2e+mFnYjXPzMCO+1CDkkmBRScXlZ339qDSMAOUvt2klPsx9SCe4t2dNjT
	7WVpPw1caXTnfetiwkaX1AkqJbi/X9wvoyu5xMf/zg5fAXmgIDgN4dDL/+MtFpC1riRkOv9jMDh
	OLy6s3zvPK9U4gK+97SREWWkVqtVME+6NnnuXLXO90slg49LnbaXF8LIWHHvWoxDD0SoyyJ0XVH
	cMCe9MqobtZssk911c6ck2mdAfsDRVsSEn1pO2gWkNgNi0zmcDk/oA9zFP3gdnqaAcbg/0ZUXBA
	z9pf/U41SooQUUrZtHKVkNtgy4v19z0IIESvTToMVj01Em7A7xDBr3so/YIPhnYD0W7TPiKhV12
	mB3A7S63PfeJWVxvr1QX2gciwlqoBstB5BkaSpiiaeU/cDO4Pwr72YiaJi/W29zqYuf2sLLyGdq
	gEs+4fJ3Bdj5H1TkA5Z9gf15BB3WYiPhqxuQWtQK3cWsZanxQGM53mtBmXcOrEyAC4yjA1Q0Af6
	DqvrSTAi0FAEzruw4cjWpM2/8xWdKvzlQNd601WJrFdk/PiyPy6TsoXjDVIhAt90CfiUCAQHILY
	uD3A
X-Received: by 2002:a05:600c:3c98:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4a79006b1a9mr76781365e9.7.1793112981654;
        Tue, 27 Oct 2026 07:56:21 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm273188835e9.2.2026.10.27.07.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:56:21 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 27 Oct 2026 14:55:53 +0000
Subject: [PATCH 7/9] coresight: Fix resource leaks on
 coresight_build_path() errors
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
Message-Id: <20261027-james-cs-sashiko-easy-fixes-1-v1-7-db43c4668644@linaro.org>
References: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
In-Reply-To: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

If allocating the path node fails in _coresight_build_path(), the
references taken by coresight_grab_device() just before are leaked.
Drop them before returning.

Also, when _coresight_build_path() fails, nodes for devices further
along the path may have already been added and grabbed, but
coresight_build_path() only frees the path itself. Use
coresight_release_path_locked() to drop and free any nodes too.

Fixes: b3e94405941e ("coresight: associating path with session rather than tracer")
Fixes: 32b0707a4182 ("coresight: Add try_get_module() in coresight_grab_device()")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-fe264804-52b6-4b0d-a43e-184e228df19b
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fe64c509bf67..1d9c7ced39d2 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1103,8 +1103,10 @@ static int _coresight_build_path(struct coresight_device *csdev,
 		return ret;
 
 	node = kzalloc_obj(struct coresight_node);
-	if (!node)
+	if (!node) {
+		coresight_drop_device(csdev);
 		return -ENOMEM;
+	}
 
 	node->csdev = csdev;
 	list_add(&node->link, &path->path_list);
@@ -1131,7 +1133,7 @@ struct coresight_path *coresight_build_path(struct coresight_device *source,
 
 	rc = _coresight_build_path(source, source, sink, path);
 	if (rc) {
-		kfree(path);
+		coresight_release_path_locked(path);
 		return ERR_PTR(rc);
 	}
 

-- 
2.43.0

