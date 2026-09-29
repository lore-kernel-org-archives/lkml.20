Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B16A538D69
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700757; cv=none; b=PPn8jpfay6TwJ/3B4dg3dc8uV2yKsI+hAp3PfWwUf3u2ohSMCUMk7jjN8A//PN1iWXDP6gAfZphP5XMxf46dwt0azMdP0d+jhgWYUhPaBI3j6TxIauzdDJMY4c2c0Wo4PYX7wMZirZXgCDHIBaqbmlx0B7Rju39IPgyAkNsZVC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700757; c=relaxed/simple;
	bh=uLBhz9AW5lUeQ1VBBZ4BLdqgKs0ZrJxGiU4f9ODmksI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3aOe0KuZP7Zzq8BVWlOaKM7HJJVRmqnb7GJeMLYFOQ0eGx9eiTJOF5sfIxzGdCA6Pg6WkbUgISdldhjPENApqBMuW6olYVKeURW26bEdYYON/7tdLXLU4R1Pph5PeV1xXmy32ESuN3SgCV6AqPP9llkEzYnlkBvoi3hDa83GmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bClN/PGY; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bClN/PGY"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a60e33d456so34560861fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790700753; x=1791305553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLqCht8vi02ko9LVVdoV/+Z17LWnTuXLunBgzjyMkvs=;
        b=bClN/PGYC/g+uKuJvt/1ji4QQXLAdPCYe0WOCi9dmxg9UUKokqS8XmHPjh2Ibvk0y/
         b1b8myIvZYo70GW7u3DXb4l6srFdRGA933Bbim995xLV0D9X9QF0s7xT/2YMeStk++N0
         YF3OgoooyNsZTQsgrWm1MXehoqNWOqu8D+kbFZ5DKrhK9ldEOD2cSni3KbEnlSoWwisr
         MzLULxty/GE5or5tK2RyQaF0cXGGeUJ+jzODCJrId0aZhNQmcomORMyruRkEA1+m9CPa
         odaNCYT29rBuVF8k4yD7GwAcucfPsaGPqKEHZs7l0v9bsBs2H2kdTvKC/fb5OZUc5yZO
         wXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700753; x=1791305553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLqCht8vi02ko9LVVdoV/+Z17LWnTuXLunBgzjyMkvs=;
        b=FU8ULAtOeW6vcvp95xwF2dn+Axc9HNHzVOaDyVtxHCOEfMeP0F/WMutgr8ywkKDweb
         QVpqOKbAyQQKdOoZN43jm8FlIv1xUnBmYllyThBohTmwy4BijDQglOsl+6f4CLpkqnzY
         tjRb48qnPiHnDHlg5k1vLkNTzEld6fzp3G00BU/cySObXioPf37mnuGcTA5ZjWXE6emQ
         mUQvnzzUzFUboUQsUFIot0rG2ncgP3wMTC4C1gXJogRTCp5/nqYLYCQLBpnypKnfaHoi
         5uFwZ8WxUKg1qe035LZSZpivGABi+fUH4jQpbOu67BMaWlLd7dGk/4xVtj8Y6Yn27U6E
         Aytg==
X-Forwarded-Encrypted: i=1; AKwUvBw2n4JzfSmh3CdNWArp1YcgQo+AM68SfiAeOrvMrbNkIaycR3XdPTUyF3jDJGV8LTxRWf+cY+wUZbXenaI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQHlUJGvBz7tEriFKglpxp76h8PpJ5qIfrfhTSLZV4TMw6yyKC
	OGf1b6WyX6hvsfPV2E7SNTAAeHsKnsKsWLmjVHBeZzM0QIbzf0FkSEaFgpltVwM=
X-Gm-Gg: AYBFou0ewH/sLUGeqJVXSVNFwV9hxbO6E+kcHhSFuXcsC0jyMfJnVgdqNWJ8EcFb2+w
	H3gFsPMelUOHDyW8cCePRkDPdYc7P4QNjBHms/25FZF5FJSZR2e3jRMdIkrwk9omgyolFYD4gxz
	f4kR44E5g/cVulKAL5o1QLa0VUo7AJGHsqDQCJzvxDeD7JBORzgKEkAX06EZ2/t5R+3xkzsoie3
	MnUSf35Fp/ElwMsommRgU1mcoJcEWs7sAgYsa9aVRov/yM0QpSTWn06uLoP2AdPqpCm8rnEwgFF
	znl+CVIqr/na2qcW2/nTbhA+Q6KLQ6dcg/iZeRQ1ldK1DJOK1W1qOxIitM0aZmZx9hqiCpnw2iY
	jlh0ip410mGCJN1IeQBHFereanguB7dg5OEMN3QAJYb5pBFFbpj7a3grM2Gn/6sL0h1+vIsDfMH
	J2S9dzAb4JVfIlQhmUkMjuRf0tUvmguGjwvMpHbWzDfBji9pwndDq8E9Y4De38rqvWUTOahv4=
X-Received: by 2002:a05:651c:19a8:b0:3a6:687e:9cfa with SMTP id 38308e7fff4ca-3a7719452cfmr283341fa.18.1790700753249;
        Tue, 29 Sep 2026 09:52:33 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a771947b14sm137751fa.32.2026.09.29.09.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:52:32 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH v3 3/4] dt-bindings: arm: airoha: Use one thermal sensor cell for AN7583
Date: Tue, 29 Sep 2026 19:52:08 +0300
Message-ID: <20260929165209.69669-4-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929165209.69669-1-sochnev.v.74@gmail.com>
References: <20260929165209.69669-1-sochnev.v.74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AN7583 has three temperature sensors behind the chip SCU: bandgap, GbE
and CPU. With no cells a thermal zone can only refer to the bandgap
sensor.

Use one cell to select the sensor. The AN7583 compatible is new in
7.3-rc1 and no device tree uses the property yet.

Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/airoha,en7581-chip-scu.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
index cc564dc7b414..4a10d024f5fa 100644
--- a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
@@ -26,7 +26,8 @@ properties:
     maxItems: 1
 
   '#thermal-sensor-cells':
-    const: 0
+    description: Sensor index, 0 bandgap, 1 GbE, 2 CPU.
+    const: 1
 
 required:
   - compatible
-- 
2.55.0

