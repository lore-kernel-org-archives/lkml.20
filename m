Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469941;
	b=vZW9Wf1Gi8aP8rvZc7atrWZY4tYF+MvgpKgtCaqLnKSEOdygjdEddfSbbP5CQZDXq1Tk
	 3agLPnW4cZtnCrvzJHrzO+fSuvW8Z/yJdSIdn6LTvtdfWpuTzZxmx9yYKE0G7Ayv65rfg
	 cSqnjIKNrgx4Hwm8aodaY7XRJZZVqlb5ATYGv5wgewTK48n5i1owNfn86dgsQXRYPjL3u
	 ltcjJNRLU0sn8a0N8YLBZ7+VHpOf1SCeii1dOoCmQeShpVHSK/DHzDp6Yt+xENeIW4AM4
	 MOE3bADQlzqd8rUrRFCeA0WO5IMNlKigBNmmKZrvUhIlk9QwK6cG+2xOdI3dzf3toWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9CWiDyw1g7jDT+BVerXT3sWV7E4AqptmK2wbWTyQpZc=;
	b=v14DCF9O5kJtegy9B9BzpDXs51YLMcPhJzsvaeUCadsM4+7nrKihOs257HcNr03Uplbl
	 bVQm7/Tf5asmAUyYjP7ft6H3zO1Ysk6d6kzfvNIi+DB1lAYRmhAkdT11xEmuthu5lEBnT
	 tbkCzYD+n/+FjbddH2OM+hAM8EdtBC8FsO2226iXxUYIZq6seVdUzVMSdQYPOoXJxCBZ3
	 CDwYMSI3zHmpRBrAC4Z9IGRNr+L+iHh4E0CLwyS/zH8iXDX6UTsxrZrGznD7EDjuRbTuN
	 saxFAncB519l4XI61Yu9cWZ9iV0evM8vks6DB+Bqe9fTyE43P+gdyyxTfmhRqBYisBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XOIb2Syi;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D210F606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D210F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XOIb2Syi
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so2148488b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794469940; x=1795074740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9CWiDyw1g7jDT+BVerXT3sWV7E4AqptmK2wbWTyQpZc=;
        b=XOIb2SyisJVHDloSE/6r4DugSGW7+DdR6GumM+xsWG6SFU5ztmST45S5lFIONzuRVh
         kEU8kfOwjnGMC08tRxSDjYMfqOPdz1+LmXbCMZyTR5BmYNMw3IBKF6HzttUUfItmV5To
         VNf+A5z7V/+E50UfI7F8B9eSM4T7BgxUp2xoVZNS9HeJNvKLq6h77pOZ0fH97blW0fnR
         Yju//aUPmIb0dM5VorznSD9X+AeBVbWJXHmCg1fChBe0rJY0fhhVwKRlLiuqdBp0pCtV
         TXJSE1Lc3Up0GwrJHQZ8nK0XWvF9GUGdpbqmfKv1HDlS60eqKHsJo6N+pC3/ZTRVmgiF
         +MYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469940; x=1795074740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CWiDyw1g7jDT+BVerXT3sWV7E4AqptmK2wbWTyQpZc=;
        b=jCxteCRR2d3+nOLJSwan8+EmE5+WRHoYhN+VjZGYzBaapDFLvcrNAST8tThQrCljOp
         G6rq2DUSM+ifWpgmkAVg8X08i/lmDKhk9iHTFqQSCU21yPnS4W14vW8B+WEMOO8PdMrR
         56CRZYz9jR46amgvLOS3BtHf926NtqxV8MW8K0Y99l/1BplA2l0D4PwlPoV7pXpt83yz
         ArXqxUCWIyiUxvjbiS6aRTA1JYKAsMa5RLChkK+sf/twtmKKsU049V7KAHGPijD7lReP
         6h2cOnhkAO5z8KOWiV+sUhe8Mkh/C+yfyGjp7dEM/0C1a7ISxSSHtgalOp6gVQRsimLc
         eOFg==
X-Forwarded-Encrypted: i=1; AL+hErEA7rbbAZ8MykfF5PQq9zxd/pvPagI2jupNwaCFX7npT+lVCa28FoCgSEoYAuBa+Kd40fZrPw4Ch3hOztM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aUdr70KcUSWOLxXdDLMsSrV2AdIYY6CMic5bLbIGa3lcTbiQX
	xvm4kKwt54wn5HZFYU3AXysjFoJM/AB4gih7qWETYV1iwQnB0RjWFfq7ubswE3hW4Hg=
X-Gm-Gg: AYBFou2vKJ6hppfQthWCDD+LsaK2tlfqVU2tSM1s2aiNnPk3X5ptSUUeSkfYPziLHvY
	wav3SwSv6TEpSbjdUZjPqKUgUZ95yQfdcMNlJKvLOIqqrBlq+XO88nmHyOsOP2yFu4ApfAJEReC
	nAjWzKjKhBibQrlIwROWwzxu+4OgnRKwLj6MEQKHPO77rZlpZvYm9DDA0JTos09KTqS5JMewskc
	gBIPww/lI+QtPxlXRDQHADogcef4o91vGa4O2c1+T9jt8epotxqAZmV3KZIB0pkcb/+2cjWHOmx
	yumHr0jRJnicl8RU5+R/cB5V7/YukDSWUzwQo+bMky1sJiRGG41Q7DJcD8JUpZw6Cgupjm0gCWJ
	EcCb2szvAh34e6VLQ815CGZh6JcPsAXaq5FlMTiZRPOitRlelJi6P6Xs6uMVkkukEZgKSVzwkHL
	KwhM8gARdbowl/+Ir+THOQCLp5RzReXRbqmCmnzVPH5xk0s4pWediiaIwE4quiimQamCQ+t1/VJ
	4WflQ6CmPXyA/iFUBY6JhQkhi0NCiLe13RZFnBY0k8MC9rMojsRDAMJS4LJWTzihHy6JaJPffgt
	gEtt2KjuiAoo4hFqHMOsKSFU3IO5jYk=
X-Received: by 2002:a05:6a00:a85:b0:89f:37a0:b2cb with SMTP id d2e1a72fcca58-8bc1dcfeb9bmr5054300b3a.49.1794469940139;
        Wed, 11 Nov 2026 23:52:20 -0800 (PST)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f3f99sm3131256b3a.51.2026.11.11.23.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:52:19 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Nov 2026 15:52:02 +0800
Subject: [PATCH 1/8] drm/msm/dpu: support allocating multiple CWB pairs for
 quad-pipe
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
Message-Id: <20261112-cwb-upstream-v1-1-a6a88d928aa4@linaro.org>
References: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
In-Reply-To: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469928; l=2316;
 i=jun.nie@linaro.org; h=from:subject:message-id;
 bh=DFFqJXWFJxJyHSAZmG8rnS2E1iwzVj1z2iZiYN5BVgs=;
 b=Cs6nofFJ7hs40Muu1yiYuOl8z54smVBLQh8txW3GCdn3f+u4H2JkZRypu80WaBRlsDJ5YGuf6
 tvuiBPyWPS3AzLvS1IcXy6C9jMzu33R+Sqy9NptyboIp+zVn9Gt/yfD
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=O9aRQ3+xXWihQiRRgStCET+eFXx1EZs43Fh0Xh+8Bu4=

Currently, CWB allocation only supports a single pair of CWB muxes and
dedicated pingpong blocks. In quad-pipe topologies, two pairs of CWB blocks
are required to feed concurrent writeback paths.

Because each Layer Mixer (LM) iteration previously restarted the search
from CWB index 0, allocating a second pair would attempt to re-evaluate
already considered or reserved CWB blocks.

Track the start search index (`cwb_mux_idx_start`) and advance it past the
most recently assigned CWB block. This ensures subsequent LMs only scan
unallocated CWB blocks, enabling support for multiple CWB pairs.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 7e77d88f8959..4ada16cf8610 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -244,6 +244,7 @@ static int _dpu_rm_reserve_cwb_mux_and_pingpongs(struct dpu_rm *rm,
 	int cwb_pp_start_idx = PINGPONG_CWB_0 - PINGPONG_0;
 	int cwb_pp_idx[MAX_BLOCKS];
 	int cwb_mux_idx[MAX_BLOCKS];
+	int cwb_mux_idx_start = 0;
 
 	/*
 	 * Reserve additional dedicated CWB PINGPONG blocks and muxes for each
@@ -252,9 +253,9 @@ static int _dpu_rm_reserve_cwb_mux_and_pingpongs(struct dpu_rm *rm,
 	 * TODO: add support reserving resources for platforms with no
 	 *       PINGPONG_CWB
 	 */
-	for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
+	for (int i = 0; i < ARRAY_SIZE(rm->cwb_blks) &&
 	     cwb_mux_count < num_cwb_mux; i++) {
-		for (int j = 0; j < ARRAY_SIZE(rm->cwb_blks); j++) {
+		for (int j = cwb_mux_idx_start; j < ARRAY_SIZE(rm->cwb_blks); j++) {
 			/*
 			 * Odd LMs must be assigned to odd CWB muxes and even
 			 * LMs with even CWB muxes.
@@ -268,6 +269,11 @@ static int _dpu_rm_reserve_cwb_mux_and_pingpongs(struct dpu_rm *rm,
 			    i % 2 != j % 2)
 				continue;
 
+			/*
+			 * Advance search offset past the allocated block so
+			 * subsequent mixers allocate the next available CWB block.
+			 */
+			cwb_mux_idx_start = j + 1;
 			cwb_mux_idx[cwb_mux_count] = j;
 			cwb_pp_idx[cwb_mux_count] = j + cwb_pp_start_idx;
 			cwb_mux_count++;

-- 
2.53.0

