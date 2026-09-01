Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB8E416CFA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246527; cv=none; b=VNpsXURQx0kJ8kdlcagzksR62GWG1a8NMa1fFLobyE7XpNcO7RjBlE60O37W4VB9fBHYcZ3mbmGH+Mfb8WONKnk9+zKsPZMh67TTkCUozUtURp/TIany/WMZIrPU1owyuJA2TicGNLePE3zZ9YcUDEQP1rtR9kJCygOwEQ8AgyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246527; c=relaxed/simple;
	bh=SL1wdM6vp1VIszL+xuNFr+53xhHZT8pJnJOiXD1KxBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+eRMbZ6vVGs/d8nzWAmmtU5BcdpRSBX/MaIvTkFCty4dtGBmI58O2kKT1/0UvMnRmha6Eym4/8Kngqxpb3bDXnleQRsVhhOP8higcql1FfaIdrwj0lbhZMIPfzFxNCLvFCKssgB0O5DfeMkCl41y8mRlxv2Ix+pehY1HZ5x/gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vx/tFVbV; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vx/tFVbV"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so5252310a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246523; x=1788851323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=Vx/tFVbVtyQTXX4xTjkq6HUapejWaPA7Ja/er7YiR6H7amuVUE/iEWmiOqKQKm07r/
         +srD2+jyYToMxjz+mhvtgve9ocOPf//4yJuxghpoBwNMff6Cn+6jsieNJy7hSwAUM+l8
         VkiOvi14mmQHSXyUi+ftQY/8qZybDNa5iWXbxHkFh/vZ5C1kyFKgmqC3RsNvh9m/tr7m
         mRodkE6KKXMd7UhiSZxxXa0TlEJ6tSdWkBLXWdl0x7a57eUfUkc6HUJ5/e6S31Ba8hf3
         11/YJzRn6V494AlHKYJclLDRYp2a+XXPbSFGFc5A6HNqjASdTff9JGq6eCDDfzfjjFJ3
         KO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246523; x=1788851323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=GwOCh3Juhgn6460UCS/f19F1JDvyBRCshRlps4j0dgGABSJqXZrmBFza+QfD9SrT90
         +ZBg83U7zbTzWVoQSpGyPgQtgdMPP8IbrqHN1CEC3VvWXOqSLZTPEzpt0iFXvZiGbWZc
         gvboEwTUz6+th7Kbl/CetC3OQnKNP1jr7rLsQmpzijq8GDLk+5eXwRydFaRHE9+8jtFA
         E4hjYUAn4Soyh7w4yICBuKeyZbLhXaa0D2TWcrfrdvQyFfhNO8EThWMimsHx+EuFmzZr
         tEmCVBo+AoGBzJnqaatADNG2kP5fKuGcDyQJnxf9BxtLWIupZqTJplxTcxx7BiALEMab
         Exqw==
X-Forwarded-Encrypted: i=1; AKwUvByLMLQQehNAW7fzTwcTR+qyw7zTTWGrlcaSqGlkjJ3J8gOw3mbVlvHY/Ih5pEj+YRtv8WyehidL/yseJ5g=@vger.kernel.org
X-Gm-Message-State: AFuF++nZk1O61QlhqJ8+x1Ssyz/CswHR3LWbjX0epoVBDKrODKEdsNLb
	wviMBimTLjXtNuzeYiYl5CeFZJQZpoTt1c+5wfSusOUlCUpSQAiKyYri
X-Gm-Gg: AYBFou21+v8iTiQsZ4Oc+vktYstxOQsCr2ndg4hLz+ezUlkgsjMX17m7tFAlQj6HfJz
	gDGC5fsZidWyUQehCE5zuhpAPeJ7DgspUKMYtuRNmc+NdvHW24JHpbKUXXGBcyzMKAln/KZ2TOf
	QfbxUXtR1eeEXU4Hu4HoJTJjMVuyU/8rlmqhJ5k2h3MvoKdMZ1uWsVWe1+c+O6n7FqbeNclGUIc
	vQ0pui2oKeJ9GKa7AaSlbVtxAE/BeJS/9CSvWlwSxzeqZU8AyYhUNaX3u6KoEK0xQAfLOdiFkbZ
	tzQMzBWssThRXEVMb5tfsO7iKbyY4378MDq8mO6MjYIZm5Uh5RH4UlSHrwN8A7vZKxW8ZvU59we
	WD81+JIv8pHQjfjqn3Fw4Jl67bOwtKVx0816GSdg9gT8mPM07xV5W+Y+F9xH19cFZRuGaJIbXZO
	OlizBGX96lLPLb4nC6mtvwXR1xAcAQhRQ01Gl/K5di8/bY44GMHoOGm80sUTxMxQSFuQVFCZDqn
	R27kcEWqL1Z
X-Received: by 2002:a17:90b:3b41:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39907cd4e1dmr7683960a91.6.1788246522641;
        Tue, 01 Sep 2026 00:08:42 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:08:41 -0700 (PDT)
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
Subject: [PATCH v8 07/12] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Tue,  1 Sep 2026 07:07:12 +0000
Message-ID: <20260901070717.20513-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55..e08441915 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

