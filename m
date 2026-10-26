Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010122;
	b=ZogyqFopDoS7kQ/G9dl+wRM1EKcslfcICsG89KlYLy81/f2EUVyLMzHDeIlSIo1p7PJN
	 wUOeyz0ya8Sc+PFKt5NEq1Xv2CI3AI8iL+G2BIxFD2BXGYWnUjfRrfVTAvM3inVYMCWaX
	 qvArPJrUnaNSbTaZ2+2hLDX3Gdjg5GyfV9E1DLuP8igBr7rT2c6r5aLqf8DTfnPUQw9S4
	 UZweBKBaxJN7ByGRzjgPeKbP3nQgh4sa27355idBeGG0Uw4J4ajsVZk9NY51FGZKJRFcU
	 sC6dDVptz0cUHiWudClp+gbHExUZ9IVuuQwhPLMNfPF6CX2SzazeTPVAjgRbHxRUKuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kr1Aa3+HTl57ifUnZ6jARduOXVoJ4F2DQRpWjtSxKvg=;
	b=B6i43cRHba2bPz32Mrnj9an5tuUEMxzrbRDKU6Uv9wvCSGAV4sFIJxO5Y/nlOD5Ce0Ps
	 T6nOLQU9KQLOSDKEB2ZxgZTyD1C7PxMaOTWcWUCb5jw3MX7rSGPA9G5MravWHWARZDBVn
	 i2MOhRuiw/YcbPnEsg53LBXpgnoHN6h2FO4LQvISoRce7Npvegd0SlqxORbUZwxyoO6fo
	 9RL2+X/E5zXwgTLno5yiWWoaoLoe8MzVsEtY7hXHK+z4Z/UG0WrHdvx3LZAoLBNCXZlio
	 P2Y0oer8wKqj/mqAbj6AHFdvFkfVx5+VY8+bxTj6WYF/G8gGsTT418o8TyOUxKv9qTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Whiq3r5d;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83299606A334
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83299606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Whiq3r5d
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1634414f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010120; x=1793614920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kr1Aa3+HTl57ifUnZ6jARduOXVoJ4F2DQRpWjtSxKvg=;
        b=Whiq3r5dD47G3/CR8yg6f4enuOc7fSamDkiEzrFlDgN31Q3DfhgVzBioNEpCmkg1xv
         4/2RathywmKAwup4MGv/z7qxz+JFLKF9i6NHmNcBFe6fQj6Xxz4p4xVsdT0TtkDdWMvG
         5Yi6Z1P2aPixbMBpTg0GTSG3X3S/TgpumBZP7sO6z3OXd608a4W7csu8OZmLW8F7KH1k
         j1UxfIyj7+c5n7Th4U1gifTAQHee8vRJu9psysHyIAIR4jgaGMQHqyCHeXyq7RsbU9f0
         EdN85/ukV4J6vJLhzyZyTM2T2VNNTBqc2xk/+n8DRtmn+w981Q94BKTfbYRnVHG0oV/b
         oAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010120; x=1793614920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kr1Aa3+HTl57ifUnZ6jARduOXVoJ4F2DQRpWjtSxKvg=;
        b=HGvrdc6bHMYkKVg0ZcUils32ZBsQBjOQDfy5H19dKt6QBv4cwXOD9M/OaHQ3btjm4I
         NEBdsmYlFV6XGhoLSlbuEJOzN0vbyTpO66/iH7i0IC+MoF8SESlpMdL2bq9iENLz4j+j
         3Oq0n3qVX7YJLRqsjom28erxnvUeqdcLLCVCwWPtYPd0eGfalEhkohVTdYwif5WNhGwP
         mHTFdDsj+5t94Jk4uC1WAM8ECt/fOWmSNlnvJ4sQkhkrH43d9NWYLbVzivUlFm+V6Zti
         ltIdHYHan/WgzFBFpxHXAT8eIaYoQN2tzYlP/b6LFmGQA1j//5MaAchxjq3oRYRoXqtK
         NCUg==
X-Forwarded-Encrypted: i=1; AKwUvBz7wXQfVjZUk4vWeND0oHQUd9eKicKa8Ywq1BtVTxZqABa8uLGtTV5roZED75LGNiLfQs6zHIkVgzXqV7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMzKhRwUSDgllvyQAOJdS+aacE25gyDTImsjW4L0FUHuiKH9MM
	owRCRJVljDPUeyQTjYoY/c3398HPiWSoNTUOAdWXLRG4XXr9EBGE1ahu
X-Gm-Gg: AYBFou3Wlm+XgJWC5aAJH1eWDS0s4P4+rvM95Pt7FVhcsF8h7bnQSZGy87v6JNr5jt/
	5zF9HXgWQQprCO46LYcxpjLzW13HFvdthYCtm6pHkg2xm24Ubxdz/TylvZcE2Ex25QLhF7D1Prm
	44xfUoKQ9cXhP2lxTEjNxxKz108G6YxBS3Vq9kQNSij8Ouow0B5oJC/tL4P4h+b49993PB1iJzx
	HiKTRGqzh96n8BHq4Z15ml0O4G+lzpT67B8QTaptLNzSyO53wIGfI3Dq/9cCjVRzBVh85bqRVyA
	UhkCYbjE8dogdlXz8x32MPWmRnmhg65fASLusl/ENOM2G2aUnL4aR3u/hk6x8QIpdyx8kPd0FLa
	7JG5aW6gZahuJ7S9aheR2mAdxHfGzdwT9RZdQ5yQV9tbAkTqtnRuOQwsecE5fKF37aIKoCKro7a
	pp4FncMl9VILBCNrsIFCYko/tJ0BxCg8E3sDM337FHJSUjfzLJ2cfLtA+sVnvaxETU3SjwTuHTc
	7rl15Mho3Bb+rfEl8Ug8m1F9128R1sLisVLYTHi42YVNtlec6N6bBrwCvRspD3qTn9Y9+5BeyFl
	TCzW+7dL+/Vx00evgWLjHrtWtycpPLV33siBEqqlCKthHZrMjGKxggxc2rsv
X-Received: by 2002:a05:6000:612:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-48e3eba5700mr11608540f8f.50.1793010119803;
        Mon, 26 Oct 2026 03:21:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm16762876f8f.18.2026.10.26.03.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] dt-bindings: mmc: mtk-sd: Document support for Airoha AN7581 SoC
Date: Mon, 26 Oct 2026 11:21:36 +0100
Message-ID: <20261026102138.36786-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
The MMC controller is based on the MT7988 with the difference that it does
have a single clock controlling it.

Add the dedicated compatible to describe the 2 register requirement and
permit to define only 2 clock (the main one and a fixed clock for HS)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index a4d032224dce..49ad2a8a390d 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - airoha,an7581-mmc
           - mediatek,mt2701-mmc
           - mediatek,mt2712-mmc
           - mediatek,mt6779-mmc
@@ -238,6 +239,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - airoha,an7581-mmc
               - mediatek,mt7986-mmc
               - mediatek,mt7988-mmc
               - mediatek,mt8183-mmc
-- 
2.55.0

