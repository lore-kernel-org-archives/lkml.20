Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087511;
	b=EmYXKGqxWguGxeMPSYuhfO+cFW7VOkrM+CxTIlI/3q79CAiFeyur5kzB0R/9pUKbCQie
	 f3ino7YcHImfEaaKhWTpfWWYcIlU4Wh+R6K0em9o1Ya5uNX3+nwJOCmnj5/D0fTkqSg+x
	 Ajw0/Qpx3eCdzHHDe8yvZHbGYE6hyNUq6mjZ54SazIBWuwnmqhAFFuqlU8IAJ6dbKgqrk
	 B1FEVHXyZIvfHRnAaQJv6t1XqQqRkQ1LNW3GREdbYJB4bzw8VqPX96XkoGLViNUmXYvEM
	 i3wbzrulrCazpHz4zbk+4RYXoTEqniM5yYAuW04oDoNx0BMQ6UjtF0uOwJXgBjf94yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
	b=ju3WyD7tm0T+1ABjol+tibsh//tPgiIwaLr+/WMdC8GVfYYjOVEZyHGHsACSfXBo9H51
	 SKO+TqfHScOLg/hTpnszrr7ChtnQZ2CVeF+dB47QfcXVyOxE8Ekzw/wadDzux+iJ0o/Qo
	 XXLK3/UhiQimTz7vEJIZx4n1+HwndRECigX4cP+DfSSkFRU2VvOGRels9w0vVipaU6MZ4
	 BYNxSDT5UuuTWJkuX4RI9t6GQn2jethdu+bRS4cHkL+ko0LRhTtPLDspLpXqOwj1Gfpr+
	 gXQ8HU3anbF2E6U/NfYJ+C5MjM1L2i3C4zuiBUPPCLwCJXtFczouzCj5QmOQETE1gIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Th5NzQaE;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B51606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B51606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Th5NzQaE
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab98332238so2140556a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793087510; x=1793692310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
        b=Th5NzQaEUYOBrvxS+t97ujyJ6xOSEnTatgCKODt3mTYxgxQXhwzVuSyc10yg7JsvGl
         0KSn6LlWG+wu0eJmO76dVr3pid9UXbQMAPNYvi2RXhW95Gyu7xL1VDPrtYBOwZGuB757
         4W6PZeiP0hzZMNIvb9v7uLNgH8EbH9XOCXIjEqOpBMJ4/6Aku0habhJPpWeIi8K9fzcb
         wdbW7pKb+qmqea+6E2ZNOXzCqxaVeYMyDDTXjLdh3Uj8YwmL5zcb5ghSEOtcznibSOiw
         OM0sA9DFVlaaMZXUSGb0B2kAPSaD2HFuWMiTb7ZCwS31qdxVH8CWuyPw1Ci5moglEebd
         xw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087510; x=1793692310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
        b=1zECe12JuzPgkwccRqn2YhrvzIqdaUW93kPRGsamya2IOhDWBoA9Dhx6tqp7IPi2By
         z60W+mDNpS1FI2AGgUCsZcOw0yBSjcIXwUwzwKQ1GS4ItkKcMJXzoLw0GjCGtR3V3Rkw
         inYIdM/G9x7O8+nqpk5AZAtlp5Syee/7W/jJ5w8BfdvZEhQc5XY47tjYYG84c4zEuAXh
         EA02O5kdEHJ/yqSMK0MujSyiEaXXGG0mH66p9K21fugEGANCjiG3xF5DWtW+ggbTJI8B
         m1BMwDe1d2K3cuMERtr8CKiEnGuN45CCNFWVn33rZnKySahodw5XLNcR7vUjoNmdg9zy
         iARw==
X-Forwarded-Encrypted: i=1; AKwUvBy5Ce5AxyWNAUsGtARY2Dj70Gkpi/UPlLJhfhgzy//pQKnmCwFkTgayU9/PD2yvvZpkF/9tONTajlhimW8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg3crWVSMgV8pj2PykflickXgWmnRe5lGgYqhkNPYfxezGk4pq
	JE0nVOYt1eZpv035kfCSj4G0V00wHNxx2w+CKE/uEmy/Piv8ChkDdGkc
X-Gm-Gg: AYBFou3OMBNJO55gbL2WboLcAmkAWDeuy47S/GJE1q+6jeQwe7lvX5D1ztBmWCd0BuM
	dvWN7dOV61RgYpRSvao7SIUcXeugdNL+lLtgJNDDpjVxR1JPmB0Pibgf+w4sLHabqB9ccnlXj/B
	akwX4bzAd3qtY/Do1mGx4TSu6AflyVmAlFjdU5GpslMsyKMJmrTHZ2hr5J3aa8dEbt2jR5tLShf
	atyHFxMi4IlXxvIAdrL1zvhpMuOzE/cVj5WnIT9S4ymsX+ZH874PRuFebnrgpTAnHzqcz0nI3L/
	FxiiTvOoA+UPcsO5kRphRlClHslkcNv49KXM5ZSqmVT/ZlvEOHTe1BNIz0w2nhzZmL9OCidDFsx
	WGTYX9G7g8DIu3ou6kFeRi0x6SzYd6jsxhIGvnu/fgHOHST9feFX3sh9DjIcVB5dGsxaiNUujKa
	ow5WcHepBuRfZTiVjGYI3TyKtNeoCQYr7pfP+0RIVb/3AJJC9PUf+Ilxw2ZSvp6JsZVRZAc8kwk
	R+Tju7+7JK5NEtJAqQ48h+0wbXdorjjZOMV7P7MPMDSxxxbTEj2veyg1Dk=
X-Received: by 2002:a17:90b:560d:b0:3ac:9ed8:f30d with SMTP id 98e67ed59e1d1-3adeafbb160mr7153902a91.39.1793087510014;
        Tue, 27 Oct 2026 00:51:50 -0700 (PDT)
Received: from debian.lan ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614d7dsm2542311a91.3.2026.10.27.00.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:51:49 -0700 (PDT)
From: Amir Hanip <killdeath104@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amir Hanip <killdeath104@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: qcom: Document Xiaomi Poco M3
Date: Tue, 27 Oct 2026 14:51:15 +0700
Message-ID: <20261027075116.41673-2-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027075116.41673-1-killdeath104@gmail.com>
References: <20261027075116.41673-1-killdeath104@gmail.com>
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

Add compatible for Xiaomi Poco M3 codename citrus, which is
based on Snapdragon 662 (SM6115) SoC.

Signed-off-by: Amir Hanip <killdeath104@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557c..8d2e4f0e3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1068,6 +1068,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,citrus
               - xiaomi,lemon
           - const: qcom,sm6115
 
-- 
2.47.3

