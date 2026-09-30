Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D05448CF3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753105; cv=none; b=aFhqxy3RBB/xJcp8nEJQiNolQVSS/SvrYbERINhqn6O1qekngobGB+EXzyaKv2QNBiG6RVbCRPTcTWICIZgdkBSeUr+SGAv7IZRuv93L1Lk7a9LaAR+yEdDybMNcXDbRNOjuzq4EKxbHElDdYD0bjA18YGkVnY4CGUwZ3GyXSbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753105; c=relaxed/simple;
	bh=jMyD1jqGz1AaC/ou0E2FfmxGvxgefkJ6CyuNcosYIJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsNZIY11LqFS74qw9Net8TVbIBSS6DB1goalZWWpqvsnyeby/mcGVTdBTIg7zyExS1d9SUxcJIhSiaBb4zfTyp/6EoO8KBLTff53xb+vdUgNNTVUHY6DUYDElWnFkFXeC47bZuqspS8jf7LbRzzT4bvOGTSA5HkAXfteTNLwh2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNwr9+uf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNwr9+uf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so20337415e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753102; x=1791357902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D46y/6BuhZzAx6HMKm4qk803Zjc4arpmPOdiKp9sksc=;
        b=KNwr9+ufQ1fFKABsEa8PAigkfvzFReVgBzWFUkyuJvqpUuC3VK14f7p/wwq9/uK6Pf
         TBaiIQXxkClqYQBMMFvYezmnm3R2qqsPSCfw2QNFq5I+x7ihbQd3KGXQc4POFFt36Yqd
         3MBStPcyTXqjBE6XUPqneBwNBVZQSD8aDPIznzpZMYsEptvEjcVQHoDLITlqjGWKC5w/
         uBvi1GvN7OsCIk0+aUBNcb/6fwgZWNbtN79gfnVslLJme5+hULEeuTacHjGhS9OCxGc3
         HNjRUwx1b5qlKcmBkLbZ2l2V32FJJdsUDlblv8SlUr1bb+AvtcBkoEboFGnAivSftSHf
         kx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753102; x=1791357902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D46y/6BuhZzAx6HMKm4qk803Zjc4arpmPOdiKp9sksc=;
        b=RvF6OL7YhhDQz8/xpgZuCG1d7AfmMQYYGsbOOYFm438h5GVw9oKsSAx0DhFJMQKxa3
         Bil6o10IeRnTsZNL610NM96NJkyo49GUR3D+xkbTrKwUiTQfctVL50fAqlXJKWU0Dmp/
         ODwO7KITv/HIUfSjOHqZDiBXRWHcVX08CLG05AKVBMJmstyi4fTe1TXyZfrmTEEhEENq
         PyW6hSckX4u3v5DpyTyuZgylTvV1gdiEhP6sey6DqqyzMZsiq88OYn88tEUl/GthZvhl
         XBX56NHBk6yHiGBx/Ga6oldf/LgdtaDzGz6H2ZyhhvZmC9LA2YCmZmJZKSML3eihoOju
         ZkMA==
X-Forwarded-Encrypted: i=1; AKwUvBw74R2gZA0QpXHg6HAm+RdtZXNu1cfgQF1AxfkAoqLv2AvOph/RNe0ULq00pMluL3S712bZ8esyYyU/ciA=@vger.kernel.org
X-Gm-Message-State: AFuF++nYr597fgZb+fAvqIun4OJcp8gzEOEFUVr9nTZPgi4Ukq8/U0FZ
	861td+q3jIray043DTOreFbpVWF9Cc1zqL7LktG3Lxkzt8SLIakgf40E
X-Gm-Gg: AYBFou1gBHqT4pLo1L7bR0odWsHMo94Oa/8KEb2TDk6HTde141D9xtz+42zruwtCUQC
	rrIwU5qLR0BOTwxiKt4ekPqEh9japbTyeL2tlwKk88P01ykMDZ0BOm8vAlmQoaH0euFnNechJBK
	JV9Av46Jh2oYYr4ydz+XbtZcVJB6WfWfqtwYaF6BBj5xNsCS2oMTZAZjf5SVQEMmOVeKsQ8Lb+w
	V8b56bJZDmPr8C7isnMndBTn8yuBi4fcvJgQVRIv/qI+oVyvslybCVLb1hVzi2m/Q2U4pNksyoE
	3lrrZPSwGtJvZwY0Fb5xXRKd10AUB5S9NtG4lCnKq5kEVE61Jvl0Vb2wg/4aUvggcdqrxx/Phsx
	OoQh+lemSedK/oYLnYJCrlUWJqwtLZ8OuDq4OtGt2Ya9aaVBUi4/MI/e+sKj5PUlrdN4wWbAaSc
	vMjtwqz5pvCcqBoBq5WmkbVq+rmV/VnBRKnxiONfd4Fuqsx42uAoqmTHumgQ5QmuSGMKPV7OG5u
	bFGSbUmQK6aNt6OMgzmYKvyc6/bYw==
X-Received: by 2002:a05:600c:4691:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-4a01b126e5dmr5753075e9.31.1790753101752;
        Wed, 30 Sep 2026 00:25:01 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029fc420sm1267411f8f.28.2026.09.30.00.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:25:01 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] dt-bindings: power: supply: maxim,max8903: Document MAX8922L and RT9524
Date: Wed, 30 Sep 2026 10:24:50 +0300
Message-ID: <20260930072450.61836-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930072450.61836-1-clamor95@gmail.com>
References: <20260930072450.61836-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document MAX8922L and RT9524, which use a similar charging control pattern
to the MAX8903. The MAX8903 is set as a fallback for both chips. No driver
changes are required.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/power/supply/maxim,max8903.yaml           | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max8903.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max8903.yaml
index b3d8c0a5f2142..11287d07ae898 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max8903.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max8903.yaml
@@ -14,7 +14,15 @@ allOf:
 
 properties:
   compatible:
-    const: maxim,max8903
+    oneOf:
+      - enum:
+          - maxim,max8903
+
+      - items:
+          - enum:
+              - maxim,max8922l
+              - richtek,rt9524
+          - const: maxim,max8903
 
   dok-gpios:
     maxItems: 1
-- 
2.53.0

