Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97AE52ED31
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689272; cv=none; b=pYvMzyKpEuA0eVO6d17pjAiGB7jrm4h/zTKgub7L3yv6kpA7L3q1Jw4wKX7ZVcVAWb9TtCdLggX/RGiisfhOGlWiiBsIMqV6wPMWE+KAdwEGrKM5oed1J8E763El/XT3Xgy9zFWGsfPh8UHbXo5gxQX/hyLsCvrZ4j7H/Er1wV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689272; c=relaxed/simple;
	bh=q0g9bS9hVZmTZ/AtVPb+rUnAp00nLQxLkid0mc9V+ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQEf8/QWJJ5UhSxpVnrKEz7TTsY7bB/jjnRN7wEr9G1KZSX2tSrM0Az5h58iNEtOFQUHOjAITYSYokF4SLWJem6fCypWMJNFeb8WpGuZvwdnDqj1o0uWIljuclsrxuJ5TYz6RRBTLzJCknoTP4xEjsB40qn92gnxNtI20wVDcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=iCf/1ZGy; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="iCf/1ZGy"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso2070978f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790689269; x=1791294069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rD1F8iXqfiZiLgVxm4GqU69qGKFrkkbhDOhsxOqYYB8=;
        b=iCf/1ZGydr9e38NG9NeMQEtCkqJuq3kZXLYRm7d7IA/3kMEUpIZS0Y7RsJp5/xVfEu
         lTyLIUxOtSMXT7YvtQ5cvjZ7L7HFxyqH8/zP1UEuG5QXVVntS9liz39jGEyRt1Caqfuq
         +HtA+uRQ7d1uA7+3OwD4UgLVAntMUXs0Ol4T0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689269; x=1791294069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rD1F8iXqfiZiLgVxm4GqU69qGKFrkkbhDOhsxOqYYB8=;
        b=AbD1l+RqAn7Icpglc194S+FrA5DfTxPNufviZv3kWSkKPTiniPCJvxkGIRwP9pw28b
         piMpW5PxYa/wgG+X92Bxo6HSn+jmpVvJ2UiF/ovMbWEnSuxrc623MtLXzKvSWwBJs3wy
         i8AQ9/hiSaKo5PZIXWdVFxqf7xX+pvFoPnY3/0zdNd+MHuqtCwXuEX8PecKFmIU+DXE2
         QQmUw22HxMwuz/oHf6fCb8S2OfEgkDOTKWpPCQxBshCVrblMi2ehH6VRiLExfWXXNZv7
         PaNz+4RRB/ZdOff1g8pudYOcUvGlpgYB7MldxxSNXoLY67dpwCn/YnlwaXyfbQ9VUF8u
         oN2w==
X-Gm-Message-State: AFuF++kfNFpyMQIfbq1D0S6IEWm/rFZf4Xgg+wFRSuyyix46ekuZxSaN
	1/OfblrjlWJTFMRMnfDLeIqtF5xp/6QKi6iBieQ4vdyn+p3FYl7I0Ss5qcLUJM7FZlfrzqvSwQq
	v7TmL
X-Gm-Gg: AYBFou2nYsC0+7x20VMXqgn2DLd2caOPK9ppkxt7Q0yLzUuZcPKfyKtrDg/2G/nQWCf
	3Z3nW7N0zLLgScRrjz0jdbwVl5Ks2McbyVyoH6SBGSsA8Jn7kdG88Nt65CjOgQAycv7/QFhLgNV
	nuY9meGVy33MCpjxMiRYJUO6hc0xnybgJHdvjuJwUiKOqDB3Q29/Y1WgAaNRL2Um4BmDGln8Fp0
	4Fxzm10X7TkiovXCwbmGBcB6e1hLVnU0uQN88PcvgLHvOJCBx42eCu2o8pmTIUHhegiUkYn/PVs
	Wlz27rNUKsu/XerXWStz2Ik5w2l+zijwynS9pxyzZQD0AhONRRrwY6QKYhzkd5l27u1wkeKeN+5
	B5fKZf4ZULBDU17lgn8U3JF4Wzi5tmb80G/ROoOOjFoznH1bVu4mRTAAezabsN2/dRgt1gbfihC
	PJ/6TmsqEr0ysMHoBn77BdSEanYIVfw6Inf4hHsWX2qOTQg6xYUd+WDlzRsy785UFAQjCZK5R3i
	WZV0VTgGNcV/0yD
X-Received: by 2002:a05:600c:1912:b0:49f:cbf1:e765 with SMTP id 5b1f17b1804b1-49fe667a597mr288366765e9.0.1790689268322;
        Tue, 29 Sep 2026 06:41:08 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d1011d9sm91835165e9.15.2026.09.29.06.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:41:06 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v8 2/3] dt-bindings: arm: altera: add Draeger M48 dual-cpu board
Date: Tue, 29 Sep 2026 16:40:56 +0300
Message-ID: <20260929134058.819371-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929134058.819371-1-petko.manolov@konsulko.com>
References: <20260929134058.819371-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..b67dc10b0a11 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,socfpga-m48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3

