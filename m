Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245E7377566
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124877; cv=none; b=TeGQ/cDMaOJUCby54fWgM+bTs4zfM1Qk/3jfYeZJpoVCJId4cY5xo+V5Kr4hcVAUW1jvWU1xcyA2pzIl8HYi9bOvEkCj14i8ib2qdbSBBcS+sy6j0w181R+eACpONqcyCHJYEzF9Oq6+luzDeBUOj27BftqqvHGOx+vlNL15e5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124877; c=relaxed/simple;
	bh=0S9ZiRaNeD0ONuhBWck3LZ15qfVQqVd9GHb68v++sEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYTdUnt8b2QOgwhyaBJn2tJZcAprAGfzDdMJ/9k/Gq+AQ3qfwVIjgxEM8Aibd9wyqo04Gn+v1lut43E50dYnwzeXkQdgwqy9f4uSwVP9NIKf4NEfI8KiXDbHbvdrRVFpitBQd2b0e0thQbtYt5uFNeRqJdF+3z+by3EvJUdODg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRiRWugd; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRiRWugd"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so3978912c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124874; x=1792729674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=TRiRWugd03HK68YGIOm6hyiVi/PjVf8wnrBkLIXB2TR+7DT0Z+wTQOsYquKPT7j0Ai
         xELXqywbzK5VnBe15X0qtvrcdt+PzFfyFgbkaqSsTjOWNCsf57XsByX4YJoFdOj3fKvp
         A31z1O9DXfPfgUTvyTZ4cfpHkL+N5wAW0Uu01DbnBSLNtKjFh9l2AR1UfwRBFljhrqZr
         DQIxdwhquy/cAbuMH7EDQbg5wXXdOQnYIaK9Gez0QluWOiNLKn8PfFbd+7dNUkht2fI9
         9oqoH6Za81Xmv8XP+hQdoM9NIst2DTGVyEfbmbFbldI4xpNeKpOTXbXVgfxr0mmb2kKM
         Gxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124874; x=1792729674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=N89UO06Z1BS32/bEKhfCNPBiONQFlnm24FKKP6cJXrQWjvTjPlda32ydUgnO+XQvxf
         UIp6O5UnLS2gqlGs4sesp0Nlb8HA+QgUeRF8qJTCaivUR9lQ8vNMQ30BhKkTDEkZfM8D
         AJ/dNi5vc/mx1U1u2WnxiqH4bImutOU0rhX+BNlv9U33kJLn0VxXzMSi7eSqBRa429AR
         qLJROy306nzH7KX5rHjpKjDk4vWuO/V2URb+0wLna7s52ETO7eaa4CEtN2k/GTtEUfkK
         uzBUPFcDoqI8mo//Xk36qF4Lhjx0L+C9V/Qnue3A6wqh374baPQGpZhhH2KvPHZpKK1A
         3Jxg==
X-Forwarded-Encrypted: i=1; AKwUvBx96O6afKv9nDdHEN+YtQ/ai50yjkRsrtSVTcz8oNIx4OneWXzEa8E2cswfjIiz6NePJ//8f/8Sg+prAE0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1bFqdHrdBgNts1/PUEzxonu7S0qQ+0POCoCYjS4fcDaE2iI7r
	tSKF49nAwbm4AEZHbPNmlz8GLtZxCKHwsN2zbyIRQnOZDbcQc+PZY9jK
X-Gm-Gg: AYBFou2l55pce4uqciTpCPGE+wuRHrnoIYmzUZIbwktzlzZBxpW31d/mSlzT+qtRfD0
	vA1KLdetDZPCYE/302ydgPgKR9eUSMxkhULcywaqOoPAM05xQQSzkivpVTV1UxJf5eQ4hTcn8a5
	/Lg2kfJh0fijvfs3BX9NuyJmNVXnbFnirDRXuuDwnUR+hopJ3xuvc1ZFV89H2zLMJIy7JvNtnHF
	oZevdNSqfSx/JIkS89KHzwKIm7/xikOSrmj78TkJJRFcrcLGiYM4GE0b0IqSzhNMFwC5VKNSGSr
	zbpehXmocLMLuXP7O30qtozgeyjYolHxbECdEgtGLVccMwEkXACNB/Qw5icPyaY+pf7LGs3xo/1
	5bT4tsq974Gdt7JyMS6JcIpV49nH+SedTbf/6mEdznBF3v3Wjtfj3tLaI7ZIzOuWq6oJ8KFJs7h
	Gb379UnGGDPJBH8RPG+grX71V8qmdJVnkFO0IjX+NGJMfkf+jWDAzqel6Cw36dlIN6Qv8RTVn4b
	XMtV2Mj+kP0DYn6nkh3fJtWfcymWC/wyMic9F73tTKW1Y7gNNH4zZpsUfHaE0ytXg==
X-Received: by 2002:a05:701b:2605:b0:144:fa57:c617 with SMTP id a92af1059eb24-16a60a02625mr30091887c88.34.1792124874051;
        Thu, 15 Oct 2026 21:27:54 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm2644712c88.16.2026.10.15.21.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:27:53 -0700 (PDT)
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
	konradybcio@kernel.org
Cc: danila@mainlining.org,
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
Subject: [PATCH v11 4/5] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Fri, 16 Oct 2026 04:24:31 +0000
Message-ID: <20261016042432.824-5-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016042432.824-1-sreeshankar0910@gmail.com>
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
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

