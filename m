Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621969;
	b=rBmYDaz6A5lph7u9gSrRlSCIY5xhraSDrZhjRt2N7f67c2VhrdyUFGShS1ru7eB7XySr
	 buu19JX37CS/YigJ5U5ba/KCGB/kSjmM/GPYKGo6GsxCd3TaFGqiDGXo2l0mihv2IYbsc
	 qQgZ5jQ/AV0OtiyoCyqRgzF7+8hgNqEhUSSHhjt7aarqxncV56e5qYkiH5ign5Rmx1hIe
	 HRzCeO3sbCZcVjzZHkcDxf6JkA19bYBlaFm34IyVEwwsovntpX7R7jlL7FsRFuLjDyf0w
	 PXZzatdD3FMQHn0colQntq5W8R6d2qjan+Uv7Cg98hcmdXIxLDnkQexbSsofLxfgMcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
	b=TclpJ19I65nkl+00rbVe9pC4RokPsduxXEd/B5wMGgPEiEcKcT3GC4glQihvFJ+MRL9C
	 2Vfm5WDbQalj3gfrN+mDTuv6uyPFKDFHZg9J2upPS4+pKfAdWOCDcEluRkiXdKWqksCH6
	 5JxY3n71RrPTQfY09ADy7CRRR15V8/8aTB6S7lfUQiLaTTYerx5XFZcdQNVqgQECHNfbw
	 tUXOEkTEgHMpbFTau4hBW7cWDF4Y7jJoGJZmEdmFRQj6wEt8BArFKJRXBo8rTQcj6csb7
	 7FQ4nrEyhQg46uRr0AOB1INFofJyB7RsPPuBaMfaJm/ZBr+/Ea8P+FRFYx4elAsdvYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TAyfUtT;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A0D606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44A0D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TAyfUtT
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4b190cdc9feso2059872b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794621968; x=1795226768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
        b=0TAyfUtThdvqH6Ea5+y8CqCzygO9MSky6knt5TN60Nbo10Q/ilCBpjX6dhsnBSgAkM
         G/wWoT8aCcFk8drGhMjc4gRFT/UJocS659rVt/n08QdmZFGQW3EbfRdhf12BPTWT9tB1
         2ebW7/Sq5JGQpR2+tiZYSLuwYdyz4JvNwg4X7e1pZI2OoexRM+CaGd1dBl69LZpkjA0z
         tmmeu9wncADkaaW8Y/fQq6s/xoRTyEVF4ky6OO+X+HFQJX4HF6ZnQUsQSyMw4KxitfC9
         0XSLU2hyQU145m1Mf7zTMIVYhYr38zLWxFymQMwUfu0HRmWQ4pcyEu0OTXPHkMVYkJuo
         yApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621968; x=1795226768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
        b=vwXOCnZpb9y1THfpe7N9BWSeyMFfKmeZ6nSlw8GNK+NR8oVOi0HYHNG3e9EKKUS6YJ
         M86/kbOeePvK/Fa+jCZqwvFqZgcTFxjulmVcPJDskJUB73SUXZnfnp7zA7cXli4blL15
         ftVwiVOEmiHYvb7R9L+7KmEk/xJ2IC/nvtKIxU8wzGC/qecI2RBKf2szlAPueBn5Edst
         qb5QcJJ/0RYdqmuOxVmoNoGggvT2vdgFswC6jKaKCyyhlNnTkkyBJ7wVcz3G/NO7WYyr
         CkhjxvlM7YDbIoXIg7eVbn8yQqSfoAlFsFg6zE+nlLyEO6YdWVj0XZYbY4Weddja/4d3
         em0g==
X-Forwarded-Encrypted: i=1; AL+hErE5dwi1gzQTZMGWcUYWpEX3g4DSn6u1bxBJOw8NYIo1v2A3vAyos+oYNWVw24IrOti9Gubr9eFebxihAI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nDuJl2Ih4QsBcXZDZf0k8gb1yZEB8hYWE8VNj58K/O+daiAxl
	2cChf+I5QT2S1DedRh5PWgLufZAV7TAdYvAIqPsM6DYabMHK6LMu+W1c
X-Gm-Gg: AYBFou2wQpW4Kchue2R0VgiMc6/kdW8KE3HGFAzGeWCS2uRrsbZsDp0ybnhuPKXIdfE
	vA6GERiQkWIP9vnwUr0nlTLRt18+dTEEuUQmYzTqg1IT/50v2YEd6aZdnQYyaoX9TWlo/aZrg3V
	TxcHY7rTUNnpZg9kCNRVHim19x/o98zPY6nAmEZwpVgqdw1qQK13BDHJ2yndTd4k4ptNZr5j92d
	FGoK49DNqADnN2bQPTnlYfn1vUidwwDfWmIgrBIGEppsxSkgfSYTNDi9d85/My7OZxwdABHmW4I
	MFOszfbA+Zh3+Lh/2O0FUylHqvy6n0Icaoix+GelGGdKt+PahOaaDlbaZrGf35TCH/5bRW+hB46
	gcSRBBRMDpK0vYoh5YmHQACg00ccnURv+PM2FUPE5DPfWJnm8vEAzPJ43Yq0itiNHPdKP/WfJUg
	LY0LnzWjmMkwlOUANGvBPixtJXZ5G8kw/0Kek9S06kx6JbVl+A+q/dhLB7b6MaPUOAMu5C/3Fym
	gggxmfG9ez/LGHfzVprgJ7hMdRxx+St9AWwIsCXRUG5FetbuzqgOLYWzGC5PL33lxjA1kW3XKKh
	Aq2t0ZPj8NwTZdTu59j/LCWyuZWSo9iXQoFhrxGAdLAZoUGl0xnFLQ==
X-Received: by 2002:a05:6808:2220:b0:567:e9b5:37b6 with SMTP id 5614622812f47-56e64f005fcmr3240210b6e.41.1794621968203;
        Fri, 13 Nov 2026 18:06:08 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc3f179sm3385433b6e.6.2026.11.13.18.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:06:07 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Date: Fri, 13 Nov 2026 20:05:07 -0600
Message-ID: <20261114020509.632311-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114020509.632311-1-jeff.roach0@gmail.com>
References: <20261114020509.632311-1-jeff.roach0@gmail.com>
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

Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
(Snapdragon X2 Elite, 12 cores) SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f6998..c3b6014ad6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -212,6 +212,7 @@ properties:
 
       - items:
           - enum:
+              - hp,omnibook-x16-cp1
               - microsoft,surface-laptop-8-13p8
               - qcom,mahua-crd
               - qcom,mahua-qcb
-- 
2.55.0

