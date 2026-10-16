Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A3F4825C9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154065; cv=none; b=ckyJYjePBOdVP7c09CfEsixkSpEJUTdnrZCIseyUJJsRK49VAH/8DPON9P1Jgfcp/+spC7Va6cprOjsgNdhALbOn2EkIwEdCmVDfTMW7igwLs23t33A/H7ylyoy4gPdhT6a/06EL255arZG07CR2iKfSRfF08166hOrp7dZJ8as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154065; c=relaxed/simple;
	bh=618lZEj4J6PxaEmGpFoPKRIGN5uod/rBxdxIH2fNG/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcnW5sTK4HhoaK1Irt894TdatCHXQTdpZ9Ag1zjFCkd2zQ/3C5ptq9NFKtWt0/ClVbAFqz2fnaU8UoKh8OKIRlCteZlvTRuDDLWsbKxdSPwF5FBaXbVWJEtenLeTzI/9kSyu9KmU8TS8uBpTjCbL8/9X30KjAU8xzd9oo6aa9Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=f08JKKpU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="f08JKKpU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so58281155e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792154062; x=1792758862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=f08JKKpUZy5m4A8XBxVUMrcjJ/UZlUq5mAnCgdotTXtwCPET7tUVmBZENlYjK0Fouu
         B+n0am0fjG+e45dG+4NMmiWJZEdOcr2JyW+TTQONTlNd/Zu8ASrC+4TsUWFI9gfj+7aI
         OVlSVghk+So5WtaBKBTniQQt/4EV404TrXhFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154062; x=1792758862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=bp1U9ojNCwFaoBDsy5EwZBIRQsMrqx6xtqdlQ1Ov6MLaPDRdkmI0+nReVYxkh7150n
         FH5tbOGqiWahNPzX4MC8U6/W/RtK77JuRY5bew2mJT0sgtlEiku9PiMYptmgLZZWc1ta
         TlhxpxIOK7uELS+8HRjx89qajCrNJIssA5pkuus+oEgkJnr0Nl2C1OcbinAF76Ij5uEb
         0x55bTFKWflVNNl4ATze9/LecVR3AKSyE/NrLlfiGSzdIrYvwgw1Kdu0wbo2it1QTJzt
         c0FHnCGBJdkYUD3+WYjOQaPydZOUy5O8KzAgbEHUGK4gsSRfu98TpWxYxtTN54Sb6K5j
         GCOQ==
X-Gm-Message-State: AFq9FYL3lFwqnrEgZyVHt2aXhUgxjLciX7aqHVxwiw51/sNQ4PMHqjsu
	v/cuMwL40yUFpw7cyR41VurC25DIWIb1U4SLn6mbEBV9sz8xbXclwWq/en/+yQLYqcZgEyJ4XVl
	eye0Z
X-Gm-Gg: AYBFou20daWsT3c+/klrGGqwN0JI6MTOhr70P+uiOGbCOUw0zefka0rDx3CMFo7jtVP
	sZvEetdn5bbbUj3DL7x9sF8hPmREwfFWHTZ/kcqVmzZRr/d65C058WiV6a4b5ZvNq32JgUpS/o+
	0+0o9/Zv8SsPhJEqHVyujY4ZErgKD15rEHOV4bEQhmHilfdsyBfHgIFwZha4muoyfIwlrNdahI7
	0I2HglNajNNc1BCc79dZj1dXULYRT/S6Be1DX0Atk3OikaB3DJoOrlMneh9w+d6C/nQ6SdPxyTJ
	qQOz+NzeXtvpFgOWs+giJ99ggM8oF3zxYx+yotsNwej5i6VjnOR8kBB2aNvjJ0GQCj+e11KGYeP
	y5FYFela5CVqXwAFagfmTaJLnaWPD1OVVubEB9QFcO4BoijTflUChFfV1a4zfcParFct/Q3pHK7
	1ssdU+VLBW8sg+1eGzCOU2VaBjp+COA8xGavqlfO9x5uV8bf/Cv7j6H0BrGZSuLSWrVzZgbhAci
	sldCbglww74pgMlRSpzIKVYSg==
X-Received: by 2002:a05:600c:4689:b0:4a0:1cfd:321 with SMTP id 5b1f17b1804b1-4a18e4a9b31mr474493465e9.12.1792154062068;
        Fri, 16 Oct 2026 05:34:22 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm110564045e9.1.2026.10.16.05.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:34:21 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v12 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Fri, 16 Oct 2026 15:34:12 +0300
Message-ID: <20261016123415.3272046-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016123415.3272046-1-petko.manolov@konsulko.com>
References: <20261016123415.3272046-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA
Link: https://www.draeger.com/de_de/Home

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..276d62b848d5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -467,6 +467,8 @@ patternProperties:
     description: DPTechnics
   "^dptel,.*":
     description: Guangdong Dapu Telecom Co., Ltd.
+  "^draeger,.*":
+    description: Draegerwerk AG & Co. KGaA
   "^dragino,.*":
     description: Dragino Technology Co., Limited
   "^dream,.*":
-- 
2.47.3

