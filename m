Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501816;
	b=w0XcJSU1YrBKBx2CMEXfeLar5quQs2IiT1iCIRj+AcARnITy/gRxne3LkrsvQuTGDKAD
	 XMJnytk9QpZcxJFCXN7mqVBGZ0Oeb+mIV78f5eaHfLOfmrRvKgnMdbG9ELeAH1YAZLkAG
	 4LCGIjZXVic5xyNGkyCEWGQ7kcRjFPPsJNxRFSRwe/6edDgKLDSft/800eQgVH+Bo+Pd3
	 o24wuMfeknIIEn1DFoy8kKr4GtU0rD9mcTh7c6jczP40YeMFmRv2kQ235EzqYZWLmQokZ
	 qt24TLECkpbkl3aqg6zCMkUb/VKxbItZ5SPJsJlxWFzsQ8VBHpjzYJvRhuNJoGpbq5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a3wab0s6dhrFUkyhGEe3zCPYCSlTDeQMk/+nJqV0/iU=;
	b=f8Bgy39AbbjtJdoM+WK7qja8x/KzgDKu6nf94jdP6dFj5bKkPTakiZu1dQd0GoruUpiS
	 fVJUHNkx3iDy4Zuk6HDL5+QCqBb3JgHA29CfZOPAf8zEQPslPza8FWxMVrie/1SsYpQ9x
	 xRz5Mo7qJB0f0hDpoo15XieEhYtsOAMRvmesdSSiql1yVCyeHsPqzoKJu8kt9JAh7iDcv
	 Qd04fJ5KkQrPGEHm2Y57Dgh102yogMPUJRgxMCxpOo+UxcV3IplEuO3tvzulPCAsSiRGP
	 4KWgeDX5340ixYEftN56lfm9oA6U3/KAQKGtdCqVkM8txtTA5FmIDyrQ9ByWLIHipmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zrc884Vx;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECB2606A339
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ECB2606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zrc884Vx
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a0a87595so1924281a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501815; x=1793106615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3wab0s6dhrFUkyhGEe3zCPYCSlTDeQMk/+nJqV0/iU=;
        b=Zrc884Vx8hE37RySKuKkWJcLSafje3jWzziDhdYKRQInp/ZhGPLhcvVDWzRnKk9tXP
         URiNtnIWux7+2Sjzp1Mn9H6mRwCEHkB/gHbcVyfxRY16AMcb47bCZKn02GS503aorfhz
         aXVjdDL7ik4eAcYVkCkOAu9uckkopsX3EYuTW26fEId+PiygzTj7rgNdP22MNRfMzARE
         Rlf4whewPr6qBuiyW+df3uKY20Q2zbJvT3oxfCeDgP+rIQFEUeGwZSaA7BkWo9e5IUoM
         To1Oni5IsoJkelBPpWuT8+POZ2BtcGJvIQce7zr4hwggTlCyVMq1eK3b8tJdkup3ne1c
         14qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501815; x=1793106615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a3wab0s6dhrFUkyhGEe3zCPYCSlTDeQMk/+nJqV0/iU=;
        b=SVO1UXlKNXbXb7znT4lG03OimXnU/hRr7yH1Ion3mcFX5jrlSUsiS7u9QpsJfCYRc+
         ofGqTxZjhGwhkHbs9N6VUrs4vuFoMK5P2RSUx7ooOxvB3XzFpF/o67wofrb4ui2WZeik
         IQMeBr5JJfkElPYOFtCBxTtkt1ArLjmq63I8JIGECn5wacdIKdr2ywXYBK//rRhF8aUJ
         TXiLP8i89prhBxfvTXZXT6IIcci75an2znWLU6sT8upyYyDgIrsWklIVv75AndqXbJvj
         06c9azIs6G5Y3Ywi9dLlga4g/ox2OTl9UmQ+Gu1a3/582mm8B6Nga660+Ut0leog4Tnk
         iv7g==
X-Forwarded-Encrypted: i=1; AKwUvBw3jBqA2nw0zXz/Pj1s/HnSmOkdlqvKpyyaGKWASNcfSqudiY7RSZyDubyTdt6F6FDJQpARR6i3B0kYTGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2qKF0AE4BQOj0GO9i/gh/hzOpxtzMvgFO78h8VlSajuQv5QMs
	dN9VcaqkoxsEahcrLxJOsNwFip6I6dAlTcJ/3xk42KacY2Rpu//7/Wpc
X-Gm-Gg: AYBFou1oftT1YadCQ6yOSG32vqkbMVI4kh0mHGfGU7nVpbXvFLnxZEXzCcvL6U4poT3
	hxIZ+GPpzwtTyVavpkOPYX3F4/LoGJuNuL9svPOK266aHJgSQN2ki5QfJZTeIA+Q+9p99wzWI5T
	bVomIaz7LylIobhfEChF9I1zZbJ713/WJODDMpXMCD5j3MfgxoS7XbMTNm84vCd2fIEHrV4RbOB
	jQc4rSxg6Wflc8YXfi5NSTxjHdQxe1IhyQXLt6qjFSSqzX3FCJYGADcglbpp/7AJr9nWvwEMmXn
	STO5r+sMEjXdYzrNeUxvps7IMq/dnp3pKc8N2sCrDtcWcHjWADRKQIVE7hmX8jtemGqcBlytK05
	e4k9+cAJgx3g9HlJNRIKJ3KegW+ks2T8biLUCwqNOOURrmcWkjRcACKxSIdf6gmlWrrEG3esv3V
	90QR/2dAwGVMS0XYu2vlXZfNEgg+pqcvxYabLFC5XH8bRC4W/N78qS1Gqm2cGyl9T8vAzArTaoK
	q+TIKFb/GaYm5qRo7D9O5p26ZyTS2jXyXtdmHJq
X-Received: by 2002:a17:90b:510a:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3acee279708mr10434846a91.6.1792501815386;
        Tue, 20 Oct 2026 06:10:15 -0700 (PDT)
Received: from Linux-PC ([2a09:bac1:1980:20::1d3:a8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm10131496a91.4.2026.10.20.06.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:10:14 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add smartisan
Date: Tue, 20 Oct 2026 21:09:32 +0800
Message-ID: <20261020130934.2289011-2-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020130934.2289011-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261020130934.2289011-1-tianshi12127@gmail.com>
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

From: Lu Chen <tianshi12127@gmail.com>

Add a vendor prefix for Smartisan Technology, used by Smartisan
devices such as the R1 (trident).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lu Chen <tianshi12127@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..6ad8d3499227 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1535,6 +1535,8 @@ patternProperties:
     description: Skyworks Solutions, Inc.
   "^smartfiber,.*":
     description: ShenZhen Smartfiber Technology Co, Ltd.
+  "^smartisan,.*":
+    description: Smartisan Technology Co., Ltd.
   "^smartlabs,.*":
     description: SmartLabs LLC
   "^smartrg,.*":
-- 
2.56.0

