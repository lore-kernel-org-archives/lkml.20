Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C604A262C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070041; cv=none; b=K3HzH6hR9KyKsBgAlcayEWqLH35zMJ6GH16j995DSsCvuEUeMomkgii/stSdi82tsCCbGPwak8cgQj3iQzcomUnLVO/7EIPtuiI0JBFgeAo7CYjK6MJByeLV1jck1tt7d0bHhdiVsS7sUsslJdLTl9J3DEF5kqgxG/1DgG/nxd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070041; c=relaxed/simple;
	bh=618lZEj4J6PxaEmGpFoPKRIGN5uod/rBxdxIH2fNG/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4mOwrA62Y57LGq4ITMr69opXq/Eld0nyLHwiymKqVwSBsNi7EK/c5lbUdmugFiQecZRWbattRkrk0pBfoxfh6vrycpRl0NS2NZwEl6dIndptUiSsm3VFUE2LgiR0EMmKrBfHbOZhOc33ahUG67YC/NzLPF8ztizdoHVBaXOIAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=rTXMjPAV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="rTXMjPAV"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4d870d54so3374255f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792070039; x=1792674839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=rTXMjPAVDiMJIIdlMY1xLllVJHpnSoA5g8D0+0Z8KEzCjiQlPlW1waEnoYpyRUZxev
         hyllSBDJiBl1q4vPbUgbMFUTe4l8g9t9XQkr6RRhsTYiSu9M1eB8iOJtmlnpNrEzAAoL
         6XI+wRha9U9MWlwqXxUI2rIo3OiDOr5mowGp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070039; x=1792674839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=ya2/d/YrjAPeOcpeAxUyPBGqQoRWL3BvHv/68V8KewWMsMe0RRX8SxLPS67MAWr9k1
         I3hOS53fzYuYEZLEe5GrdnAYSyqaFxu2otKOct/VKdRN93YerFrzabiEDI3gUtMA9RCf
         MxdeQs1JiGtqU7wZdksRJvkmNlUpZBGV2If3Bjf2yXGZ4PmV+JM5fdHzjUqTT/eZJlkC
         OJS9Nnfd7RFkT17w0dODT4guUa0IKlOBLPR85LTgVGjUt3Wv5iCNDBDdmFRMY+qnjBPf
         OS2e9ZTxJJR+phqUltrHIFw7x7VUQ5zmT/yk6qsSdixPSZQ4Xm4gaLk43M6t19ykSt9d
         hWMA==
X-Gm-Message-State: AFq9FYJbhGw9INxATUP5sO6Ta/lpvzlBc8GqalKleXNhYmW6Evr9EMGK
	iYR5yOwGApqud8W9vmiWlV3voPodzpJ+KTSGQ2TZuCtxytKgM01XrfGOG3lP35TSMpRr/1Lf6hv
	6VZ4i
X-Gm-Gg: AYBFou3sdj0FeMbY2SYNP6ZN2DX/VDloklMJoU1KL1Y4pxwThRegVuie6rzXpE6bIgA
	E0Vy3B5BlxaQ0rzZrMg76W2+pYkSsh+u47f+UvYQANrtqHA+y6HXaiCJmwSGF0UYHtSL657YN4y
	EMH8hPxLnq11LQ9Mx82RFaONBHOox0+fAXLkkLHK5CQ6ipl2qmG4TCmSsKYLmEJi9izUPTEgdtv
	44Xv8LVQb/7d83/4MX5BqaY747ebKyepnE5wk20Jz7Tha2c6QQgvqOSBTfWYeFowNgjb0r6HApi
	kZ+25UltDIcsEuSHyG1fku2Hc1SKTSwVnUF+CT52ykk0eKd1NhVYn1IqDhssPtEeZxawswGkcOY
	ZgMUSxTA2C6HpaIYrJrR+POfq0t/ITK7UOLvOk9WwUFVIWyub4uQ+sk6TgCGKZsYYYNPj8oc3FU
	fT5meafcvllTIF9RV/JtOgt9ETnCX29lW3HZscX0wBnUGVH4FVHSG0bz/YFwGoMhJybK4Unoaxo
	PtTpW06XSx+N/k=
X-Received: by 2002:a05:6000:230e:b0:487:1f7:f506 with SMTP id ffacd0b85a97d-48dbaadeba7mr34203897f8f.11.1792070038514;
        Thu, 15 Oct 2026 06:13:58 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm17807433f8f.36.2026.10.15.06.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:13:58 -0700 (PDT)
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
Subject: [PATCH v10 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Thu, 15 Oct 2026 16:13:49 +0300
Message-ID: <20261015131352.3624327-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015131352.3624327-1-petko.manolov@konsulko.com>
References: <20261015131352.3624327-1-petko.manolov@konsulko.com>
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

