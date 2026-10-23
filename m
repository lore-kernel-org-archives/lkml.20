Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742215;
	b=Y9D1X+8ihgR0Pfr8szbccpzN40cnwFcttsBORgxIGRO8S8/qSOEZ2TuLlHG1mL40iLCs
	 KeeO5lteTIVheAOHUMZTgCsp5hCjbp5TgqZompl0iELUgf6Skzc7qI7yufIrSfo3iMfNh
	 M3+Cg7ZIe+2XTw0Em3VO5mDaTXQO6YQvJCNVy0RHr1fo7YeeIcEbg4AWGvy6Dim0cwRtj
	 yiflDiJDOgdSHEzHmdIw5ZJt1Jym5ghKezbNKP70gs7Y3WrWsYuPgx/B0tuvhFzJuE9mj
	 waq9qnyOSiuI+PV8Vqmg1DeqQda29mGp+Kv7F1kui2KbE5o5N8xuD8PVJ7sUtj8KmsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lDP6DNxZLMCCTvykxNYnugjrNL0G0a+2sCTH3kjJCeo=;
	b=nZQrMVUp2Ltu6HEO3eW1NLbQbYWWUIBk7VMdq+kVhXj8Z8MQRLGSpnNhx3tFQPKr/2S2
	 C9TZXqg98lhtkjGWWxF8m5ddCy0xsLUUiCxg9A3asWf98Cmj4lQmeZ6FjL6VdwCYm2ni8
	 FqSJ9+ABRUFGJKpYCau4LW6MXqqcZpoi98eajhhwaE5YiiMsAwHiyr3ZZgsCH92Ue8mSh
	 Os2NY35ZFgAVcCFB13kr3Bu71xlOAPt4GNm6uUfivBlLHB/C3jKf9O/y1tKAz20ukNco4
	 JkpxUkbNAJZ1+qSTJGEx9s7BHvCBPD5qlY5kH7RKMBSmqHfRiUkSXvfAbuvL/t0fGLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CEhtQnwc;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AA3606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3AA3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CEhtQnwc
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3adc0fd0299so467540a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742214; x=1793347014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDP6DNxZLMCCTvykxNYnugjrNL0G0a+2sCTH3kjJCeo=;
        b=CEhtQnwcLLpbQFKTgW3RaayjQkWo13wFlap6gS11OuDaSwR8gtNYn/wgTFF4xZy6X9
         6qFTgURbGDCwgk3zo1DjZ1/mfFQ6rAyxaddO1Qmr80Df17Zr8UTtvEWuvrvZf9DwPHSE
         pD3fiBpSdES+ri/QJDZA8nDyw2wemkJvZqbgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742214; x=1793347014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDP6DNxZLMCCTvykxNYnugjrNL0G0a+2sCTH3kjJCeo=;
        b=N/IG8rZk080p6TZd4SLCNYn7iEwHcOZaZvUrWQaz2DisVyKg3qzh9LIXPssRMTGMuS
         ZafaU8NlQUg7Nic7R8g5xYf3CV9PMHVrTTjhYcmzGIOv4c96mGht9gUGyoPAyNvHXnDe
         xgJJfqsYaxDmF4OsHXIT2KR6THGa9Zhc2cCGzsrgPpCDtXDSo9lru5ZJdyS1NpUFGAM6
         86a8kmZv79PL3GeJrOSuoXLLMmtZ80ezaWUJsAmlSxm3tvE3ptthcz1c4LtKtPUEh2Ox
         B3MPTjBOXDWCfU08IP7hyQx+ebjliOk0lzrZkx4Vx9tFJ03YV0/7L/O3uCE06JDSkWET
         wGfA==
X-Forwarded-Encrypted: i=1; AKwUvByXeRfipKnBQZ5tjwU3ZELikC5DmJ9yGg2gutfs3s8yf2do9Uju7X+WxG1RBwa9cDCpkINIyynpxv9jLo4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrJrXweK6j9YB1saYfKrQYnFMYChdV3gmH7Y7QFTldtR2cdawy
	KnwM22W7KYk9yxumdLOTNLfkSwo5HziBWTlzqHUbwL2RPtH51T5k26FNK32gPTGxkQ==
X-Gm-Gg: AYBFou1HWlxDJ6pt2JHBrCe1K8S/ff3ubsPP3ZM81MqhewD1nfdYi9cU10thYMn8COE
	kRFRiyEP/4gqOHiUJr58GxRNMg86KsCOHZUwmcXqyvFqydyCZhuS6CjdayVNTtMC7k+yTHe0Fv2
	02kfLywou2NuhfiuOCcFBnnRFbJWqTq2Uk2cymci0cZZktL3xX4I2dMUSo9JyjLn6wWejIyckt5
	vNVSBLUr+G+EHy7X994J+lHFw1A804vpch5PhvX+yZx3sKRMTn6a4QyoEQjpX5FiuFWK/C0CPZU
	PwvjnVof8pIKRBSi0MI3xbLCkKvU6+p4tQ0rXwsqIP71j34C4eVtmlMjRvzYLNYCrp0eC3v2AMv
	M455A3AjVKrhG49DvtN86HCiU/cpn03stKUNu35RCE7+ln/ZB3QHgRDJkGoweziWkPMTFTY5Ppk
	WnF4oYtu7ID7F8LpvXrthvXQoNv6dBouk6ZuuUhaMPF2NPGnyhw8XUZAdr3lOS96Y0DM6BdJ1W5
	1CkAKFEUkIwHA4WyMAQkl6538wbNgi+0JWs0bsIduhsqB/vu3xc/kdoi5IWsk5E7P2Pcspx6k6Y
	WTYF51veQLKyHFSL0bCHQmftVVav+kQlGu6L9vk=
X-Received: by 2002:a17:90b:5246:b0:3ac:8fff:5a1b with SMTP id 98e67ed59e1d1-3adce7dd700mr1102279a91.34.1792742214339;
        Fri, 23 Oct 2026 00:56:54 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:2210:4aae:b72d:9083])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm2483537a91.0.2026.10.23.00.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:53 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] media: mediatek: vcodec: Fix NULL source address handling in decoders
Date: Fri, 23 Oct 2026 15:55:18 +0800
Message-ID: <20261023075642.3671805-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
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

Both the stateful and the stateless decoder workers peek the source
buffer and, if vb2_plane_vaddr() returns NULL, finish the m2m job without
returning the buffer. The buffer stays at the head of the ready list, so
the same job is scheduled again and fails the same way. In the stateless
decoder the media request is also never completed.

The two fixes are split because they fix different commits, and the
stateless fix also has to complete the media request.

Changes in v2:
- Call media_request_manual_complete() instead of
  mtk_vdec_stateless_cap_to_disp() to avoid dequeuing a capture buffer
  that may be in use by the core workqueue on MediaTek LAT platforms.

Fei Shao (2):
  media: mediatek: vcodec: Return source buffer on NULL va in stateful
    decoder
  media: mediatek: vcodec: Complete request on NULL va in stateless
    decoder

 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  4 +++-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
 2 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.56.0.257.gf7497c7d27-goog

