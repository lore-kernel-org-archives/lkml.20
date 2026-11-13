Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588191;
	b=RWnsE/+Fze3JhF5gVcrvAeJonncLRu7z6FqHrlMvGhjiODxSh5svWeDKMFjnp0abL6s/
	 Aat1xxd0992vE5x/lln9UMla4mSoThdKQ9nGUCa+auZMvRHhAAGa3LHJroIZ1Eld0ilsX
	 Io/LzVt4XAnna/lx/yjqA3RVwh3hT4IUmaktgKi0lB9VtaVy1FRykhxh+l9YLnBMsRqKO
	 5Rwo2cd+1mNEQD3eAo8h53Yxta9KBSXuvRky4skTw48Ly0A+4hF1BQqm9IxHLJq5HnrDr
	 2aiZRaiCrrCRlsKK8Yon0KyXX+71oTo+hhSoHQocGC7IHFcpbSi5C9P1jypFTHuY0cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=l7HUW+ncuH9lkksRwIY3oA2dBuKo042zJ9HBGsvTacY=;
	b=NgsRrWDcu87N8aUSoHiIPkG5BcKBEKMDsdI44OWhAHBx+WVRFb6U07yDsx5T85oR4j13
	 kmtuX6L+fVvUJPOZqKNLpkjwHgeEY7t3i5MTrxHSefRNcu+GAgYNnbCYmnPYnDvylyAwW
	 FCabKrus9osDLGv7GpEOzG+0bX7t97Z276soWPHPP/XzOzG9E5AgA+MPqtqGKRP3C8tZZ
	 BQkb7vPkqWx1Xwhl2JZGXz7ujczloPe7/DF871a9IN6CJ6Ucw5XHPUVVgyjrEvY40yx0S
	 ysZm86v0E8XiQy72fOD3YjGwYRGL6WOMmaUWJ26YlXeYTnCXelvJJVrfZ60/bcQdQdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jmHn1N29;
	arc=none smtp.remote-ip=74.125.231.134
Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F6360A2628
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F6360A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jmHn1N29
Received: by mail-oo2-f6.google.com with SMTP id 46e09a7af769-8629eb92bebso43667a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794588190; x=1795192990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7HUW+ncuH9lkksRwIY3oA2dBuKo042zJ9HBGsvTacY=;
        b=jmHn1N29vwT89iRdWkH14RT1lU9HKGsWm5GLUbBebiA9zD6t9Vn8WmoyOa68IfmOkS
         NEZLlOcbXrXWkyenJaQIjmv0ej2Gu+PhPewn9fIw0K0eJ2lVC1SzXrJsbcT5XojJD9zc
         BneUYK5QQdu3iwcUHT8qc8wgOvD6Ej0XM/VdKUg4dFpvE4SEG76meQGrBFzBzx2ONiUQ
         TcDBFAb/kNQNRRoL+y4JtCiWD1aUob/RLG1v1etLHYrQE+MO8tO8C5aXYAm3aR1V7aRo
         vy9zQQacS76phtujz2M/CD0CFjgpw+sWmETnn0xgzVDPpuMu2tqqKD7i8zeDzz3VnXKz
         b1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588190; x=1795192990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7HUW+ncuH9lkksRwIY3oA2dBuKo042zJ9HBGsvTacY=;
        b=poqmEo6ZNW98mpyo80NB7VsAidDMTrED04gb6fNNyy/lu246T9TwNRTXz17P5UbNjZ
         1ViHEbAfkJih2EReXWJmkMKV3dS5aNhzORGs1qAfffTmJjSnboe+OD4S6GnOa0qaOdaX
         +tvKsaFwLqD2FVzg+oTXN5Mg3ggJ5CLlrFBG/VE9jpx0ylrWfXe5oiKaQL/FMcOWnZhX
         oloDBHtQoXadUabDnOzGZKaFrMj05ytbk3rh0m7RMB67F62zgnKmX8BnXlHO8BOTCjjU
         +b6RKH09di+kLPyOWEHbOu17pyUxrj2l6Tj13C5qM02lwaO3OCKq02xWf02XzBkNwROx
         3TLw==
X-Forwarded-Encrypted: i=1; AL+hErFp32jLoBMwpORXVADYVq3HbKLvP1OnU+HGnpnd9PAZ8PiZd6ag9vPiuveqFTvxYT7gY3FQBk+/s6RJgW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MkmmFW7cn9xDq8/xXgK1HR78sagZbXfSwYdhriVw8uC7ETYCi
	a/gXLeGFL3aTWTmTknZOkbpvH7qSdLrCstAlaFhtKHnVXL5TJZo9G//F
X-Gm-Gg: AYBFou3kKkhU7CS5AvqUxbmTLf3EViDvPdmjnHrm130TIxQ7ksxUob4ImM7AfO38kWm
	qcnUraNzpRfjw5//2feHY++HhTPN9bJVLz+akiMoR4rd4evVgt3nd4cnFBd31IaLBwfCiCB7hlJ
	cv/XF7hvERbZnedHzodBLuVx8rsacWz7Dydd8ujyqqmRGNqWKXvMVfaGjHKHA0THk+w+ng6PCGz
	jvGG1GY2BG4dMq7eP+QcrlPBid1EjGMzetXrjuYGDQFufYn+vntFfA5HubSsd7eS9MAakbNp+3K
	6/Xwf4I9NocAZETd0KVUzaltvAoQhH5EWycWwXTv9KnZXTmnTlyOzzrSU3aS1c3LFPXYOen/16g
	Cmvay6Z/KMqCc4gGiMCAweRIyHf/fVPuByHEistr356CpmH8nXcYjschJbiRglv8g4EmEKBN5cN
	yF2zWDHL21SDfUpNw7V77KM4Uko0uz6AlixyNYYhiZvhn9bXD/QGYQQSy1QAcREMj8sU1iVbhz7
	nhVVdAIfG2KKL/6R+nA28dCnFoKzA68c3KoGJ04ZcI345hnx5HgiBtKth4FOwSS48RkNETGnV7+
	Q68ZkAhfGSmb0HlywCmh09PU7zmGbNMcAEq5AsNllaNO7eG0O5TPF/fLeqUB/LMPTHwuYGzwUGL
	VX6yHzV2He60LPF8xex0=
X-Received: by 2002:a05:6830:2709:b0:822:6f0d:d04d with SMTP id 46e09a7af769-86289866833mr2450881a34.16.1794588190361;
        Fri, 13 Nov 2026 08:43:10 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e5148sm2712816a34.10.2026.11.13.08.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:43:09 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 13 Nov 2026 10:42:44 -0600
Subject: [PATCH v2 1/3] dt-bindings: arm: mediatek: Add MT8173 Amazon suez
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
Message-Id: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-1-d3b8865fa50f@gmail.com>
References: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
In-Reply-To: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588187; l=882;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=I6NAM91xiG7y4IDUJHiYq0Fw7LL1iEfDMhzdluyzqJk=;
 b=hFxh2nuoCt+M9OhbQICBEs+ke7rF5fRGCqw7H2cvfOLLCmLg/RuSD/8xWWVTL43MjLHeuoI+e
 PTT1VNMJ1OyBTfk/s33BI0jXHT7JcrMz5LW4pwiYIr0wef1T5m2cxBx
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Add an entry for the MT8173 based Amazon Fire HD 10 (2017) tablet,
codename suez.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..26f096587631 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -157,6 +157,7 @@ properties:
           - const: mediatek,mt8173
       - items:
           - enum:
+              - amazon,suez
               - mediatek,mt8173-evb
           - const: mediatek,mt8173
       - description: Google Burnet (HP Chromebook x360 11MK G3 EE)

-- 
2.56.0

