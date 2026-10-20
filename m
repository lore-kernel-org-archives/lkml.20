Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496279;
	b=nuPOaZdkBKDGfCYkVCBwRmPTxyVqmzTcSAg2O8fW6CSvNzO7vLe5agjvxXKDe0QCB759
	 YagrxJ10xdbEiNR+JmzM7pMMznXCsnfEqUN/ZOBt57P+9j5laI44Gea87zxoo0V3GsWJv
	 8vp21XwYGpzBk0XX53995iwcB5wYMd0Jt0vNKE4DwVi4RPYNgT7BJma01xcqBKn05lDOD
	 L3AgrZDzi52bmS7YNL8UoftpdqqZlXidFcWfoccD3mCIH0OyV/7gjC/T7294s/sEg7eG2
	 b15V+qra7VFzsSJ2EO83b7TfkVmNqMj/YQMbgBFMgoqTzUFUzNKudncDqbOsU97Y8uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UwtiDq8akIpNUxZs9Wt9YPgQZRmwy3QXWky9nu8dZQc=;
	b=CkXs3OMWDGBnvLhA2ljolFAnoTKj/SfUK13fHc8wPab5xy8G3bBd96r7OoKQrZxjzUXZ
	 d4NAEotOF1AKsksNASdCGiBZ/HyxXMNRXNHmOzTgWn9WJWup7KTOjYwvN5FIKoLyO265w
	 QXNgk9nHfMOsN9DTQSUnLj259yxOVtrOAeermWBupEu4WQp+MJkoJvcOR9D1uVZ86gStD
	 wvAhdKGsxlt3KgCm38mxVoqwJNKvCI9dNXTsCTWLhggD396RRvsJ3dGOW2n1EKduE40kd
	 YTC1FrMtQwpmzFqEjOda5lwJcGVqYITccNiPxTqm7flofOdU/DI7hQvX7kFdaEHxfUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=BYTXsqgT;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9330606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9330606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=BYTXsqgT
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1996948f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792496277; x=1793101077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwtiDq8akIpNUxZs9Wt9YPgQZRmwy3QXWky9nu8dZQc=;
        b=BYTXsqgT9sz5M+uneTF84d4El9GL4n0FdWFfmq6U8qugiiHTGYeBkUnYwja7WwYPJ2
         WsoiPwY/5oHFHfFONcObV1bY9hfws073qq6CjvCyhjAyfWAZO2fCFidm7a7MmuWgxElD
         g5D1OLe7JxnB9+F0rOIU29jWfAyC+BF7Mvc9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496277; x=1793101077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UwtiDq8akIpNUxZs9Wt9YPgQZRmwy3QXWky9nu8dZQc=;
        b=B+tvrbMxXx5CYXf7wPUpZbBlJy7dBLZb58w96cx/aKSBSZLQ4Liqc01U+UD3bULOsc
         7bggYD63XDbAECba1dzl3nFq00Rn3wM+2FDbdQjPx13RxMdxCkBS5etZ/ZDHQjbEc8k7
         ec7EAARGA3qN8Gu2bbneLRBHG7WYDH4AlteJpBbyhFkNakZkHacNxVxXo58fOKyBtcfa
         fb8b3Fe3QysxuwYFkWZTYQQ956fg+Z+VVXsuYUQex5N7DlV+xUyJ6iDDCHe38yB0mt8y
         2yAQZeeiJJJgZAGjbWvLRRB7o+XCcHne7BV5b8myHj79EUCwR5vs/z4oaeewOWB5UuuZ
         YTgQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8vBrGST9J56psAsLM4rv8ohrow+2RMWoVvbera8s4CFabviS2wZMVLcttA0WTLTw/lG3+iSWeCgLXNTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaU26Vytz1dfx3mIEnbZCey5XUmrJ4oXr3jY0F5wlxAWO73Z8I
	VbkCQDKTPZNN9fCLHmtBUfShuEZtmigiPVXBOwI7LPY9JwkKb6qNV/NhG62UQZ1vDdE=
X-Gm-Gg: AYBFou2udeLEpfCOeQs6U5SnYcTmNcwMleS7QaYbj1jTix4hUIPgmkXjAWKbfWD6sNI
	pvXAP8Bsl8DL3PdK6vmFgZovEHmFsZkvUiSM1lmeInP+tqdChY/Kfc/d6FKrgRtivp3VAWOGfwA
	EPYmJQLI10ybeOmOuHk8lEIhArvCLOcgFF2n5QipsfoR5LeQXLnOm3g7HWF6YD1qQw8P2b9CfLD
	ts8oeE7M6wrlPUeOattvkKAQx9DGNC0M8/KP9dxhJ1wlPSZ+Xf5UUXMKfJf/ZOX6bsv1LtElOxm
	Ps5O87KF67lOHa7+gvaiHI8I5w7W524kixGe1+5HTtg2ProItgetlu8/7/zohIDh70avwnjQJuU
	0GFIQk1wgxoHnWHY5ypsUpF8miN12DEa2QgGeiU0QxEEdY1dEcr0Nof+Acam9FLh2pY63tvlJIl
	kjC7HBMkXsUTFl5IbSMrMEDjz0rOKQ/RufwXZjjibvv7Se7IUhJcC5EQUSdamSHomXhjUOFlPZf
	y2sx4xOdPdsw98CHocxpGAcL0s4rEK1i8fu6Itrhk1B+2tlJLH8r7hyrAcN9JTZY9kfwsUWRunL
	1QW8I0UO
X-Received: by 2002:a05:6000:470f:b0:48b:efb:4a66 with SMTP id ffacd0b85a97d-48e07978c74mr22040347f8f.6.1792496277013;
        Tue, 20 Oct 2026 04:37:57 -0700 (PDT)
Received: from thinkpat.amarulasolutions.com (host139-112-32-195.dimensionesrl.eu. [195.32.112.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d83a099sm4709728f8f.57.2026.10.20.04.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:37:55 -0700 (PDT)
From: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Axelera AI
Date: Tue, 20 Oct 2026 13:37:15 +0200
Message-ID: <20261020113717.189082-2-patrick.barsanti@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020113717.189082-1-patrick.barsanti@amarulasolutions.com>
References: <20261020113717.189082-1-patrick.barsanti@amarulasolutions.com>
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

Axelera AI is an EU-based provider of AIPUs for edge AI inference.

Link: https://axelera.ai/
Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v2:
- Change name to "Axelera AI B.V."

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..1267d9e2d859 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -219,6 +219,8 @@ patternProperties:
     description: Avnet, Inc.
   "^awinic,.*":
     description: Shanghai Awinic Technology Co., Ltd.
+  "^axelera,.*":
+    description: Axelera AI B.V.
   "^axentia,.*":
     description: Axentia Technologies AB
   "^axiado,.*":
-- 
2.53.0

