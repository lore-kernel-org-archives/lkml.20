Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27C953D0D5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662727; cv=none; b=gLYPIzAk7jqVQS7xOk74V7Dgzf8BKpLa+FwhHfrkfJPOwCH0donsAM890I9ifFQCaBzSUmIztt5mxzL61l69DEgR/AwOsOq07oMRCSC7723cCqvAcG0hthtcc7Tuf2YQ4KXZ7McJU3SJxhB2wTV37JrVNzjJLgXeoETfOdqv4VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662727; c=relaxed/simple;
	bh=RJcT5M95T2jnV9ADCJmfNmInAz0xN/iROM2rgbAU0rY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=akdM+0NnB/qy9k/KL5w0Fn6kyE0fhxRtSRi6ZAkRmxdu0+rTTbtiAs8B2hlqhw9Kq8DoGSjEIz+gRq+yCgSyLlf9CXxmQQ78ebI2JNpYysddmqjRIgU6QQvheX33OqwHeSMZqhNAGrumV63iQCpmmx2y9SMzg8FmH9ukqPItv9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=ttGnrZ4N; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="ttGnrZ4N"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so573277f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789662724; x=1790267524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voDA440p6Op7KU/bEfmRYCCSMgQks04lI9jGZ54I4b8=;
        b=ttGnrZ4NgRomwknDZCUK77ZxI5cFSKnUJ024623hRKVw/n9RAizD2zeqJSlP+2yDkU
         HoUU7eaUSSiZPyShCuhamqsnezLO9n+U/G2SqKGHnA0d8WBJWSA5/a+IjIbd4/CulpBe
         6YMgph3eljzofP0x+3XJATAjQrmTilGc0JDrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662724; x=1790267524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=voDA440p6Op7KU/bEfmRYCCSMgQks04lI9jGZ54I4b8=;
        b=EhOaqhMRVAPJd3+FSW8qotfnuzoZ6Ed0wfCdqRZ1vaWFZGTu/d5a5YH9eYeebBINUh
         xsdzlT8PwIua8c23tcnP+ShFSo0+G3Ph2vE7ZzhOaKXG/BAaZcXpgpvuGl5aav61FDuK
         amJP7oJbQNY9hzeG7nHjnrGirNyim54VHZoBl+Ffj8lSU2xIpHxahU0hvxWed4blwUl4
         D+iOKWynJtRlAFazCjqd/MUbe3xzzL3XuLg82Q9N9KhLp/oXtsfEhh/IGLRCUcSuo+ux
         OxJyFCUbCMgIiPYWebzN7n4gnouCZvZ6bwSkZph45TLo4fygMB8SFw/jI4BZm4DtPYJR
         4u0g==
X-Gm-Message-State: AFuF++lbNDO1vI6uzaIprFHn83RJbXpN5b9o/6pccC0RExLM+Esb4msw
	DkwgRTuglcbcQN1gNmkRnIE7UlFA87R4w4ustRCf92Huazm93Vb3R565zgKpLGXTRH7BQzSOipF
	KD7eW
X-Gm-Gg: AYBFou1p65id/SgrTftek89ZN2J+UnDzeYuWiYx/GNOBf6ROwmdfuvfaH/xgO8Tez/S
	joKNerOUlLXFI3v+ttwUQbZPjePu35FPyz8vFMT+v66y0BCzcW5Az6JUxArD1ZGzWwzGHMjEaXQ
	+6Ehn4wIF10NOLsCH+P0fqZxjR6WnwmXq8g88cIw49t1EvS6JDJCR7/jlb2FTE/5ZBm5ep6Q+ut
	5BC+m9IBNz7S3tUqCcHk4n/rqTIbVy+yoyytdyhcT7vE7IdpQUVtnRhXlbIEo7UKsLpV+/ocAFh
	m+5Ex50nmk8Ts6/XDq0YP/NPPHchunJY70qHbyZ/5fxMoE3UOnGnb0b4pmMk3yDPeN0iy0JV/+6
	qwoXeSOUdVtCtk52AoEO5ij8Ebod41cCkQ4uK20HbIo4+GPLVldPdOQ11LjVO3se7gdNIMUF91U
	ZlnNbW+a5osbiryOfUDl0L0+TkyshsY3KgbQ9FH3P8FHsWcUPMBQVhJRdXLovyzuYGS6vmDTWYl
	Sj3DWYdDD3SGlvmp0wrmFZXYlsw
X-Received: by 2002:a05:6000:41c5:b0:487:725:8210 with SMTP id ffacd0b85a97d-4870cef394cmr8958734f8f.21.1789662723755;
        Thu, 17 Sep 2026 09:32:03 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm16842652f8f.35.2026.09.17.09.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:32:03 -0700 (PDT)
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
Subject: [PATCH v6 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Thu, 17 Sep 2026 19:31:54 +0300
Message-ID: <20260917163157.1380860-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917163157.1380860-1-petko.manolov@konsulko.com>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA
Link: https://www.draeger.com/de_de/Home

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

