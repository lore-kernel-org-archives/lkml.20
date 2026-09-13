Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3353EDAA0
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303983; cv=none; b=Au4Ck6DRwISV//PuSwIA8eIlBAcJuAD/z1gReplMkHFdeCUe2juXUJaebtbeyvSLGm//kD7/jNmqEi2C8D/mNVdGfoq8yogygVvx0riqjTq7ykdnnWVcusJTfQNoMFkbexCik67EGlS45EjNbIeBjVy7LIFLfyu7fLCql8iqjy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303983; c=relaxed/simple;
	bh=uqSZ9vaYLLr+IlpI+wNqRUJ19lOtB5XlEKHqPxDiWeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JI+d9S5MwH6ETwY5CMRFff2xci/Ef9QyqSWitGwxECUa0uP08pFQN+x7kT+u/Uu6yjgndNUznE67xRZTIimHAJwQCKALRZ1lQl5BOf6kM5ejE2oS7WJZ+FwtUH+tNNhCg2bjK9saSsHGX+fWOCn47RsNTHV+4Mt9jMA66/rrlhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ouJNpdD8; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ouJNpdD8"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f16so1363679e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789303980; x=1789908780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjCp7DsLa8JOzDd9QVc9nOTCPNziCux3eLTHVXVPDfY=;
        b=ouJNpdD8I11bkZFl2GYdEx2p1znfZF4lskK/OyWMEuhnduVqnlbqU32osjRApFaCBh
         Dy6/n3g91MXmVXfbECEf6anBgHIhvBKzoi/jtg4L+eCp1QCK/OYqlMPRLjhlmf+BCDws
         K3KavWc9QzikLiXxEIX2oJCTKQ4gCAZ3Dd8zrO1hoZeugtU3yhuWKSi4mSIn/Hkx721+
         9zg2/2csPEFsSk0zCHPVUTQ6kN8coWxkMJb/tq7rFiQaVLCcphjCv63JIjBLFx/tplnh
         B59Kl6rr6G3BGil6YedOs/OR/1fPNeX64nEyqLCauJ6y1JMViN/dbqjz58o4WG/bg2RU
         iGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789303980; x=1789908780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjCp7DsLa8JOzDd9QVc9nOTCPNziCux3eLTHVXVPDfY=;
        b=NyshrFyM/LZy64HwPzP2uh35d4Y2Wp8rorJ2OA07uAf0f5Dto6UdqfGl07Yv9K35AC
         AHJHjlsWYF+PfrYFQAhG7VhT50YcAk7CB6H/uwDFdqmLDXu02mQR2AgsW23ePaamjrwb
         C1L3o5UQkD1giGGcYfLL4JhMa2bbWFOdeVaZ6vYcFtTeIripjCoXSIEJkB7yBRc2jTuI
         uA/THEP43g3LufUbJJ90g845YXsgsinZ1AHeYmqScGFbY+a21ODNgsYgXhHtcQMWzatI
         lVUQ4SixXwPt0A7PaeN6scHwLztBsqUk8nizzxzFHe5BftKXJVqx99ntoOVp8Uk7vOeV
         A9/A==
X-Forwarded-Encrypted: i=1; AKwUvBwB24tUXWEDILUnL/W0vOrLglZ435Xmn31r3nF3IyyuZkECmX9fjRmGuJT+wMfrEzxaG4w0EdWS0gzMe4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mqe8x43Ipoqhi1JqyEICyob8yBGjmIDNhyJiYuq/ibLrDHzqX3
	lcjG+ei71n1LwMcy5V6Ye3if5PfLq7RwmtuqYH8TGCRUnXrWPHtcp1U=
X-Gm-Gg: AYBFou0EXOjJ2Q8HnjodQvFaiGh4J6aWbidya3nP+6/Tm8x472P1WFIAWZa6d/jbN4T
	6KrkD5Pz3UQASax4Orwhf5fkSbYV1SMeaM84ZICkWvn2fIZrUMUaM42sRjveyxpF7w9qTKvRYCy
	BKFgq8cbihL/WP5JoDZqK2zVoTV+1LTfMg93S6Md/XxVn9i1TnU+m2QZtAPQ9ZC5aWgKGsk51fT
	jx94qr6+XQMvCOPpFRNwYFD2gXrgoVxSbHXEyaC1l2i8Zbw9fgfVFkViIbK7+yTilxWP2Ac7132
	ILr8fN4KP1n+zD8AccVyGlJ6A5C91qAeUghJFJ2viMdaf8ODnUPXdHarnQm0KYSysEOzeO8m5p7
	6yjIpuNUx9SlnKys8ImG3rlRrUlyDw6hJGKL/oUmgfGI01JHwmIc3pQVOgkYGRSzVXQ5AN3tcxB
	ytEiZARX7U8jTtTUZWp7HvdjhReUpIITjvT8It/7aGx3PQrl+Bp0GlcXc9zyKmWlJjYm8eg65E
X-Received: by 2002:a05:6512:2344:b0:5b4:ab2f:5bd5 with SMTP id 2adb3069b0e04-5b8a02fa1e4mr5509677e87.8.1789303979805;
        Sun, 13 Sep 2026 05:52:59 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0469a8esm1762844e87.50.2026.09.13.05.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:52:59 -0700 (PDT)
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
Subject: [PATCH 3/4] dt-bindings: arm: airoha: Allow one thermal sensor cell for AN7583
Date: Sun, 13 Sep 2026 15:52:25 +0100
Message-ID: <20260913145226.34643-4-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145226.34643-1-sochnev.v.74@gmail.com>
References: <20260913145226.34643-1-sochnev.v.74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AN7583 has three temperature sensors behind the chip SCU: bandgap, GbE
and CPU. Allow one cell to select the sensor. Zero cells stay valid and
refer to the bandgap sensor.

Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 .../devicetree/bindings/arm/airoha,en7581-chip-scu.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
index cc564dc7b414..da159b7572f3 100644
--- a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
@@ -26,7 +26,10 @@ properties:
     maxItems: 1
 
   '#thermal-sensor-cells':
-    const: 0
+    description:
+      0 refers to the bandgap sensor. 1 selects the sensor with one cell,
+      0 bandgap, 1 GbE, 2 CPU.
+    enum: [0, 1]
 
 required:
   - compatible
-- 
2.55.0

