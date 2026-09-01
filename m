Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0831347A867
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254815; cv=none; b=XNnME6SQKde7ntRncN/Xj7CnvX98guDpTnlwy+q0Iq5YdUApiZmdhPia4CU4e7UlxaLeJIqpZQ4v9ucfzVwtNOyNzgr9/qWKrKNYHoEksJ/heLQ1nFTaxvwBBU4kaqfKIMVKHP7exkjwPd++9gDLQpSPyR9Ox04aI0UYhQvftX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254815; c=relaxed/simple;
	bh=6sYp6gwLdM8q2X0kWDCuDxQHrC8+z3UsdjNuoTgAQ4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBuJRXKSpti58Nkr+t9zQBmto05cLIlZvQRGL4r8bUhgzmLpvTNl3I26LN0fNiUTMZCTxIJDb46GTt8WwKwPLwg11jYw/hp1ALRVGuLaxCVqflRu09UP1ONirDqZLKKm5Hsn/3jYKJHmohi2LhGJJIxyw0587ECZApKJiQRYp/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHygRcta; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHygRcta"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38511175ad3so4643920a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254813; x=1788859613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=ZHygRctaRJM9pKRw+nbcSMGefPFY3imiqe0JEWjuiKrrg8Icfp/wIe0Cjx4RDsbaBP
         p0FofFX9y9KNCdLSSo/mCX8FqD7yp99OWSDCqp6ZCZyltbIZC2UeJmSx98WRQntb/dGY
         EI//esvub1DXMlwgcanmgiWp93BpjQtx7hlDZ0N577eWOqRNqoquCNiyy23JDThiLUL6
         dPPXZUyz08/VfIr1CzJctokv34hl8zSE+qJWIfdA25qcxxPVEj9SUlACQMgE/z/DRrY7
         Xnpt3+d81ZJE/9Bi+cVuZLoSmoL1dw9dKIN5a4p/86k4S4CZiLa93g6ufBDxHsJVg6H9
         iUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254813; x=1788859613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=SGGnEqkyYMJrEHKeI6s8rRYAZV+f9nzRqmbynFvhcq2zSr6KNd+B8nMHb51VNd5vzp
         ITRKeGAWTaiSLL30hS3zVLVh19jeL6nL41scJy197fbQG+rnMj2J7MC+bjG2Bp4MHNgL
         +aLFqOAEyXGGRReK18lndO2AEN6XDjIJbz2EBXeAMrUOYzUv3uxuIyrcz9q9ujmldD6V
         PyozLkNrn5y1n8k3h/L0AfIDifUg1XbvOW2xfiPKlrBC64Dew33alNW4ZoqCWMre8c0O
         cArg7W72aVI+Lx7N+YPS2xXLjOR59321hbVDKP51EEfS/gfLdhkTvkYNX6cm0uAu7zEv
         5fJA==
X-Forwarded-Encrypted: i=1; AKwUvBx3OrNioSBPxW+qRLs+7lckf+FTrkOVN1ziWe8m2Ntj0WyWXLUwd1vDLWbjj7jOp2Erz9WJx5AZpXxquLM=@vger.kernel.org
X-Gm-Message-State: AFuF++kUOckYGUDvecbwN5ce2zoiX1C2nuHBqa06lMuh1vKLABJyEl5b
	SrNGWe75Axj3i2/9JQWNRng08K5T96CsuXE0C8oEQyyiOi70+RFgBTZ/
X-Gm-Gg: AYBFou3oQ6a9mHLjqMtPCeHfgUNdINwkhFAYOfanh+ngysMQx6+T++XlT5PNWqdIl/O
	Ma6k6UE++dmw0HK+qsrIV9aDu7UqGLgLXUe5ey//jwEtIDIF2UjgnUm40yZ37keFwRldJ8zThi8
	JPb1RX4AVukWSKgn20MepS6bdDZ69HtW6LjFuaSM018YzBvII2GVT5ObkevVsSv5lQSNvzMdB+l
	3Up6wU21rZSkglRIMeGpNE+i8iC4K43JoUqyrAoNGgtpkXX6kicanUHZlwLduz/JtQpF1dQRiGQ
	7/WVHpykAxwwThfUFmuNzAwba4IRi+SpsfrDbD/Xyea+Tm6gGxYf0I26Ifk5aQbf7lVFmnMJFd1
	/ZuD44amLBwUJLeARqQTeax2saIV1EWZys98bI9ytUGSXRNqaIEBM4QmUUGcHjT6V+U3p3Y5twk
	1ECbzP6MWz5dfxuGxbtn5/gZKOP/Lc9dpg61vvB43URGX8lltVnxoRGxfIDwmLq9/PipEn+A4fp
	HLj+hyeL7dN
X-Received: by 2002:a17:90b:4ac9:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39907aff7acmr8439695a91.2.1788254813186;
        Tue, 01 Sep 2026 02:26:53 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:52 -0700 (PDT)
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
Subject: [PATCH v9 10/12] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Tue,  1 Sep 2026 09:24:45 +0000
Message-ID: <20260901092447.3028-11-sreeshankar0910@gmail.com>
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

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

