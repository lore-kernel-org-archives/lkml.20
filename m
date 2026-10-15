Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981933B5314
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076296; cv=none; b=VIkJ1x/VfCnLSRN+ZoYEFNz2eOUN2AXpMJmSQemDejF3/9WjMIv+m9gFqociWvfzznuuid3WW7mhczhHWoQyeDbyxzzCq9/k/5DrhHJunOW8dMLJcJzT8kKNRpA0f2ggKTNzME1u9E+GlrMFWrzZQuoqIfOGNRF3rzavXBNipzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076296; c=relaxed/simple;
	bh=618lZEj4J6PxaEmGpFoPKRIGN5uod/rBxdxIH2fNG/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uoFuHFggI/WtK+8m6tI2d+f9m2VtIXZgOFcU1V1LcSQUaptrJte8x3ujbpnsGe3xbD0PpE1eOQ0fCFjCAfEUPw944YpNEg4l5IvYfbueBaSZ6q0EMJj/xkyny7pNjWjwwbnQcTtyxGt8tFrd4wbPj+kRtsCEcXj/YYtOIXemCgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=RZOFHwxc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="RZOFHwxc"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so47858655e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792076293; x=1792681093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=RZOFHwxcl5wivM/frhSzzW/LCl6azaP3euEsLTahtSLEjCnQKr9G4DeKls4BOScV9k
         DFix4BBh1yA8U+AM2T7mwPEvTFho8HdqZ7nwfA1d3k4GwNHfEWt9nnzoqZsn99iVxSXZ
         XBK4t1+Fkz8xMYTXmM3Ukt1hwERx5dHtGi1+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076293; x=1792681093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=F+zw6QyVonJ7qoZtNN4zCQHk6U2Jue1jlnx8TjBcCjj0rHvveeqZX8zGBk04zpKNSo
         WSRd506SqAf/PfWFbIVvrFcVyGqZX1Br9xQBZ5bPS3uz4IbUEyNL3Bc6c4AW+R/Kx1+e
         rZu0y6jDb1d1OWuYxJjAPrdjJXx4YAWs/KRjzejC3OvkC5J+tjsPP8vs1hmKZDeJYiIj
         jOXtwUfKrldVolFZx81NjhVtvfcviXEgsfB7N4EZ1NEQsk0TZPM55nim5ncwkXfGzlqB
         HTqCrAOdz/9P3y677nbQwobwKsgf62E3AGA8PcViJPM9sTVKSbgDo60Oi5P7+oanhKOA
         cPYw==
X-Gm-Message-State: AFq9FYINIWwKFdWN9ienCmfdS5wzds0ghirmMlCghvk4PK1mg/bzTUmv
	DwG2sN0R2CdY7MkzFjy36B6qwy4/Y7BAKwY/VzQchgOyhnP4OWzkICcX3ko70lF3cZuXikNWkX+
	EHQHe
X-Gm-Gg: AYBFou373oGdNarRthgY5Xh+8IlhNZpKq8lT7qXEj9vO4fLpg6Rd1zNvNqsOQqz+ps2
	JlIejmqGVlVfWPGUpHweatDuQizGU/yy5TJpxPDQhPl97wZlfk+MRu2n9hgE27kEb5lxZiWiqb0
	8MA/L7lLM8V9Zlnc2bvzbGbNAPMbJ5xVonT5kyWKeSn9zqVYrlwHjBd2Mjpz7nefyKoMDL91JZr
	PX5/YwVADQrF+xbflIn2S25KsCDdJmaKFnOdUZ0HG0L9cNEo1hPw1nRuiqh7V6v91lGpOIq7Ag9
	8lgKEcabQSN8QQdELN3psi0LQnjh9KsuoOd1bYM3V083CAq8hsI2gIpGBPa73DgscUm0plBXpVn
	luex1SQd+LnYSzpiMNuc0ukljBpqjQlsbufnpZXYaebbfLnjb4xRKcsXwzrRvj6Ef2CXfCL9VUT
	2WuIbTWghUhJj2hwDWRFwemvMR21rHsA/HtznApN66sZCMWNtFx/BL0uvvv05q8Z8eqWITAs/rr
	KerIHS7Atfmf9c=
X-Received: by 2002:a05:600c:19cd:b0:4a1:80d8:aedb with SMTP id 5b1f17b1804b1-4a18e49d9eamr395054165e9.11.1792076292071;
        Thu, 15 Oct 2026 07:58:12 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd97ed33sm88053985e9.5.2026.10.15.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:58:11 -0700 (PDT)
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
Subject: [PATCH v11 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Thu, 15 Oct 2026 17:58:01 +0300
Message-ID: <20261015145804.3632839-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015145804.3632839-1-petko.manolov@konsulko.com>
References: <20261015145804.3632839-1-petko.manolov@konsulko.com>
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

