Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED78A47ACC9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254826; cv=none; b=lwlNJm2Lfs9SkOPK4C2Buf0RFDWrD/gPbYfVFpdwOtvPtyv8ka56/h9wmmxn4xWDQRNuV68Sl7+AkKK30deM5BKC8drOOyL8gduvB6wMfxp6TXIPpgKjif7VxKj3JGu6h57n7oJabwsFdXJxUklo+fcYpC8wb2weCZSBjHkGfyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254826; c=relaxed/simple;
	bh=0S9ZiRaNeD0ONuhBWck3LZ15qfVQqVd9GHb68v++sEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WezXbzm/NR5Pi+4LnJDnyuk+0wtT+R1/5pd8vpGF5UQK7woDXjd6dG3YXghTiuMskFBmqzxxxn0z6Aecdg6CAIVeY3gTnWzX9eAkx3ry9Zr2aJuwotvgaAoFx343gjqqecfqf7pSF3VG17ycJQ9ADbwJdl/afmh6/lhz6JG1/9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4RabrIH; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4RabrIH"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso3528572b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254823; x=1788859623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=j4RabrIHhYV1Ub35pUQn41n1e6SX+9SUSz3Dmaqb7/V9p/jlYlcdOGlG8r+VYxK33W
         CqMcMhm6r20R2s/3Xdz92Or4lYLEAvH89AQmsSo0R++pl9FUppc5O8IEcsUy5Vr9Y2P1
         grDHpRYBT35lLiNAlwNI6REnAmY1Pa3YO0XzimZcUDJ57jjSfv6veYrlCJy3xYRZarrs
         rVFv7sX9Pix99fzmQNx0U8Vr7FivCzEjFj1auQsWcK+WRr+vkgjpS5/M8TMbO7rZHGAo
         gPHk0qzWrj/M165K1qo0UG/VzVVt/jqBhVJ1CNTY1o51lj1zymxwUqPHYzJDh5JR240h
         re6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254823; x=1788859623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=PwVEkorx+sA78+5zkIxZd1SkNYYtKRQq1nnEwmLH47QrC8iVqhvEsQjAVy4HkNplwv
         O028qTk/NSLls3NgGQCoeCliA35NifMOaQovrdrhh6q3BTn34p/KoRD3WTtLgwS7x+yP
         o0eMU2hJScEwfrBbzN0Vp3CHPEEg1ukTkK1kNibphhFLvbeolNd75sOCD3/oWqKvFxpZ
         O1wk6CVoArgLQv9swefplX5WEb9CQaXVBMGDBnTj1k9dEblMHEr/pJ4nn+QNv64H4q9F
         aqmvwaWjNzLvEvpGm/80ty69QxRGEeP9TWwq9W22eLkE5Xy8FYlyTPXk4mt1rKWmI8Zb
         J1Wg==
X-Forwarded-Encrypted: i=1; AHgh+RpLiYHLWii/OWYP0XfJnd079RMjZyqdVYWw61zwGRntYkqltmRbmcXPGopWByb438LUE3RMFUGuvXEsy5w=@vger.kernel.org
X-Gm-Message-State: AFuF++m8VGjbPWC/wVr8B2wQQXIR6/g+jzMNRMUeCHmC9L1njIhEdKG2
	yz4L61jlO326GdfWTaMYO9Opy2IK3F6m8uBAr8PE2pC0OAGkiq3Lz78Y
X-Gm-Gg: AR+sD122yY7SaW30lBo1lUpqkrMKAlv/kMMPcPo9B8FZiRer8mSOyi2U9tK9Wca5FYg
	+X6bsv5TnHSOiGDGGdthOglMWR4B+UPvbk4iGk+xWrvncoIBtLn5lD6rSWkDlgksu4qMV07v5O9
	wWS/2Rg15Re4d+VPsm+rLXIIyEJbsDS6CrBaG1wnoYI5Xg9cKQ8tyGnqNel2hVUmrfHCKrcUpjL
	0m9m/Hks5YlNnievgaDVf7WRoAx4eG4wCaEjV0hpqxJS+k8Odc/2itS/m1H31AMobxOtNiQwwqh
	C06aaP47Bwq6EXOiXnfYBuCYQi02HPVpefEMJtljYWccxbji+oy6I6lHi+KYcFwd1TNQVVfCM7n
	GC8oD7UQYEx8C+WodI7G6tTYKAOVweP8TP9f5KFhY2QS41aXPC5RlXTxgy6pSdLJfVVRASWRUSD
	IthQOjYHq/3fCsiZdxE7/1nJOAwkVHxbAX/nTJKvTATXpY5zREpHY1JCPoFKoo4x//Hlot5ub7Z
	kQ3U47slC/8
X-Received: by 2002:a05:6a21:7a97:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3d7ad992574mr11465441637.5.1788254823231;
        Tue, 01 Sep 2026 02:27:03 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:27:02 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 11/12] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Tue,  1 Sep 2026 09:24:46 +0000
Message-ID: <20260901092447.3028-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..2dc2c265c 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
-- 
2.43.0

