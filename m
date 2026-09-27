Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0A837F002
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521946; cv=none; b=Q+mfU4eNi7yqE/3JZMqGzvvj7vM7r9B+8TqiJWRI/XXLr+LjoeSYiH1PKLwAIz3+zPidJfBjmPc6Wtqh4/P7ynjw5fONNwRanyl/MBmZWO3FDUG+TfgPc4IR7efC9TxKwwn0lhljIFQruUJJpTYhJVbMC54/+S/jBJKN654WODo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521946; c=relaxed/simple;
	bh=IKu+NW7V12nnMBgKKHdP7rj1fpU2GspG4UzSnncTVMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jh9ZopZngWD0K6xRqMe7JteitZ9h/uHDkAdupgxScHvINaX77NulG5JUVPPxyDDaeFavQnXyUsR1y5NG1dysh+7yv/QiuYjv577aOk1pRLzetsqHP/tCVlMsmf06UCFS+bfkCGFCTZgkTsy4zyxoSIokA7m8BaIKW2I9yTpGyU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sS6wGcck; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sS6wGcck"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so1197424f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521943; x=1791126743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=sS6wGcckEDtm5nm/bbgxYKujuHVksCJwzBWS0VFlvJh8D3ZjkPtgHohVPCt2JHwkFk
         XXx0pgrTViRD8Vg7NItBOYBOt213Mq25IiEMtkWGasGXRpw0eXCuoVOAoS5Sfl5dtWdy
         /mh22AsYrx0oByeS/lSQMzY//VRUzILCu25bTGNMUam/jmftNDuE75ZdYe3vHpd7MOgS
         SMvDFQPNLkgsbYa0gN0UDijYaQ5TNeLvdcbfZrUw8BJ1evu3JlIUbI/6R7y7zEJlesOp
         O/lvwVdiYzIomhUcBwcN5blykfj77Ja3hB7XjpbnezUBkg8BzF6FLyrJBCFI8Nc8c5Li
         d98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521943; x=1791126743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=g8SGS6CaLV9NA/Ov/T0NoJl0GA/HeOeI1b0x4Y8pWYDmykiXfxpCZ3WUmp8K4ZRIB/
         nv0LEclYKkXGqGR4KDEZ2i0/EqB9/vQBVNL8lxvndy6UTl/GyrJvMTkXzceuxJgkJIEz
         +8RJE2hxytpfMzHxtsbsKuF0pPYypNCi1r7JHFX6xCAiP86/Jmql+QA/hSwzjrQAUWHq
         upORbbIXm7KsIw+Uz6yEfEZmphoVB0U0P0pMB/sH//39j90slQ8tpBgGst4AcizQJYlS
         Ak/vP9vy/9T9Qqrw5m+UXJEgNW2VbQXuntF7e0rMc8z4P+iQOCNHCPvAmFLem61javXx
         lkFw==
X-Forwarded-Encrypted: i=1; AKwUvBwj38JzwrxqqWA3UQR67xzb2ItFZU7JCAcnwgE25JNLyMf5D252rOxbpsZWa+sff8XiokxOfkEraVrOLTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOh/9nsyVWns65M682sRZSQL+3Z1xvcmUeTtt+cZUgm9VPhVpR
	yI0hWbDSlr9rGfMfObjshRBj4yl9dWyX83etkSh63pphOA4VDKK/eZSX
X-Gm-Gg: AYBFou0YtdeXlnpDniKyfGLTnRSh/3zokRFvGBq8VfpAOZudcBEbK3WvSRoJ4MDExP9
	Nu2y4ZXDjIv9Q0RbXw97pvNiGayYKmoyTL10GzbvnSItAuQi+AJuFeM9HgZe5EjyZ3FWCbe2Xkd
	IxxDKRmjQZM3ZsDLSGCDkrPPZqC7ddE/2NcKp3yu51zBH2VwYm++XdI/oV+gmvQmazm5aR0l3Xc
	x6CnP1+HIJywZ8NKXEKlXy96NKsq7g8Q+aiPtWV5vgodAWvvJkS2Ul3jw3HLZzV9y8ckRKXLy5W
	mcTfW9+w6RbdYzstBVeoZvBqUpGqfi1DnybXOxQ577AqpWnauI8Q7IiCnBn/ZGK8/uX6vtrpjfg
	vbo1PIGAwUzL7lMH22iJcCGI1y+JZIcJu6f1Tb3zme+h3MgQFY976/jAiRS4z+Pn5Qn+78ZUoel
	gwii8i680xnWS2M+h62rPmjR/wTo7VTKCWSl18vdMrcwU6T+j0lemcErnq4moLe7ddvvNZWo49G
	ultDbiNLaOhf9pfvbKV7JBj41ELwQqs
X-Received: by 2002:a05:6000:4693:b0:487:342:d141 with SMTP id ffacd0b85a97d-488774f4f02mr11163439f8f.23.1790521942896;
        Sun, 27 Sep 2026 08:12:22 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:22 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Sun, 27 Sep 2026 16:10:10 +0100
Message-ID: <20260927151016.186493-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 RTC wires one alarm interrupt, not two.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..1699e3576b91 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun6i-a31-rtc
           - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-b288-rtc
           - allwinner,sun8i-h3-rtc
           - allwinner,sun8i-r40-rtc
           - allwinner,sun8i-v3-rtc
@@ -162,6 +163,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.53.0

