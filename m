Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220364FECDD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649094; cv=none; b=bLiqKMp5NC3xfKMnrc1XTIT9tdJYqILwFjQ6fXuRLmu9kNP38sZQsa/g2Ypnsgieo32HI18RIvIRwfEqXH/ury2OJpdEnDevpUOuWK6oKtOpJsT3USACTKZgXHmPoU2lkMhqQGQt1dVvhOvidd1N0z5orh8kUsb4rRzzfVDC3Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649094; c=relaxed/simple;
	bh=EsnZ1DK9B73rdVZvb4yaLlND2bYXmTNqpeEfyhoeu74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o6RTVDx9BaRPaVCSPucV7tY+mHhBU5jNKD+cYiT109k4qhaWOKb9OIb7YORo9HObpJ3xp1CzfWQbuWbD1ZOpRVWSRxUcSv7XwRtwzb+D5bBv9Y8dKGNeCTYgJK20xcdmAYht42Xbwovl1iOgBrJAW1+7qfnFAPIDY1kNCwAnBVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=iHb8gPWJ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="iHb8gPWJ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874aso631037f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789649088; x=1790253888; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pdehwlkISRfMSm0XKDXRgBO0xTq2wH3UxOwDNkTmaec=;
        b=iHb8gPWJxUx8/sgflbjIr4OZ89/8fIJwqAi1c9u4Mcv3JKtYNWf+L07jJzKQcAhTtE
         zlRk1+AaQiKyHTHT+AWI9jgY88AeVvrF+ont0sABoPVLwDArzfXIgWCwByWITeJjuSzd
         alhTmnm2O/794keM1XGDG4bpjch10eiug5HakfJtI6UyJNDnwPEpE5UnAzFBw7wONmRu
         oDgH0M1/6TNzjTsPRw0UOa6HM2wyFt30WhBjsQE2GmjKY8ku0ZRmOBI+ycNm0bkSTa8w
         TqsyDvPItudrynyJzW1BtQ16q75FYTIHmiEojjg/nKLgTyc3g2JbgjF/2uH6C+Mha8vn
         TmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649088; x=1790253888;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pdehwlkISRfMSm0XKDXRgBO0xTq2wH3UxOwDNkTmaec=;
        b=QVgWzfduQAqyJ3uRcTFomuAfzNerBDiBuIAMDfSh9JiQgMbtCsH9f0uBu379oHi64j
         koPaQEayvDM2W7Wog8YHm8iNsL4NpTFICJOWShn38ZUJPTex3YW66v5G1k0vaHsEf7TW
         8MGpQqBjvfslIv5IGvSXvUp9uDubEsQjQkvdCX/pQD/N4CERT9gdhckhiOvQFs6JtW0b
         RFgGff0Osf6oGz4nHs0qCd/ZfBDXtJ14OLJEWQSdCKEadmoanLDA7NZPGFlPiNTw+FK/
         6RGjnyG+4sDzrUO8cprVKpVXFKJtcZmc32bVClZji1uyPIx/B8Aeo4E6HyyxYBJFBRwM
         tfiA==
X-Forwarded-Encrypted: i=1; AKwUvBwCt2ltkDJ4LK7U98bPfrYI/2XwIyOd6DLViVUxcM8IDvNr9KpEpEnYYp/ESYt2XTY9JrE/CpETUOgVyFM=@vger.kernel.org
X-Gm-Message-State: AFuF++nXeIa4XJasr41usOdUTccoXN2sD20oTd8Z+CKHAVvmhb6+hu0K
	9aLE1TzvrB1GCYZUT1PreuXXZMCdV2KfQtAXtEefQgVEQaCbDQlQn+njpd6vevi82bA=
X-Gm-Gg: AYBFou2nUlcPKQ26uiVbvmbR6bLMXOwLiqudM+nqVsetv211IkrOCiLe5Fsw1PYQSbn
	9x3Ty6pdECRfmPArlPSrQyFtuUMSJUA7e+dT5lsP60GhgSvwrBW2TXiVWlO8EO7roskhmqJjomt
	43fTbngMj5jf/bmHJJIa9nKE848fEsQ7j8f5M8nMz0myL+PCWJzeXNVJR9xrgq8UJSi+NZlAPp9
	Jd7WfyICbawFi8cTHpsp1C7b33ivE7WS/OyohXFsb8ztZaveMo6UjyTa4kSH1L/2LXqBOh7BBzy
	Pobs8EgZup2k55zJjHAc9bhV9LT9Qe5ZGlcjyvfp712WIyxdxVOiAOP2TQoEYV+OPH3BN9iw9DP
	Kuq2i/zz9vT7TmEBbmsof3ZctHnPQ1ZXT3aBBdZhqwuRUW6VsF13qG+lpSHTOW8PA7PAR5DzXoE
	TGulh3MDHL1wSwPXKo9dxyBFIsJb7ALPPLd2tmwp9APOYAcraKb4PBTXUm6E3x4TKJtKx0y6/0N
	7BwExFzcuFGct7WV4KOYfcwbT14YLqsyv4W/Ad1pr2GtsiNoPc=
X-Received: by 2002:a05:6000:2502:b0:487:88b:4681 with SMTP id ffacd0b85a97d-4870cf037d3mr14945921f8f.10.1789649088231;
        Thu, 17 Sep 2026 05:44:48 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm15274665f8f.35.2026.09.17.05.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:44:47 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 17 Sep 2026 16:44:39 +0400
Subject: [PATCH v2] dt-bindings: mfd: ti,bq25703a: Expand to include
 BQ25798
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-bq25798-v2-1-5086845cd3eb@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNyw6CMBBFf4XM2hpa+gBW/odhAWWQMQZqi42G8
 O8WXLo8ybnnrhDQEwaosxU8Rgo0TwnEKQM7ttMNGfWJQeRC5xWXrHsKZaqSaWN02cpccYOQbOd
 xoPdRujY/Dq/ujnbZ57sxUlhm/zmuIt+9/2rkjLPeKhRoC1lYeRke5Bz684QLNNu2fQFunRjUs
 gAAAA==
X-Change-ID: 20260914-bq25798-67768a40517e
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2190; i=alchark@flipper.net;
 h=from:subject:message-id; bh=EsnZ1DK9B73rdVZvb4yaLlND2bYXmTNqpeEfyhoeu74=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWStfrBbjF3UbNcxjrlsm05yfEp9LPl3TcqEJzsbO3bPz
 J1dNuvT9I6JLAxiXAyWYoosc78tsZ1qxDdrl4fHV5g5rEwgQ6RFGhiAgIWBLzcxr9RIx0jPVNtQ
 z9BIx1jHiIGLUwCm2kaXkeFH9fsdFxbpvgztXfrwRpC+nLayzx7RAn+5u3lf/F9tyelnZJgYGlK
 suCdAeHuK4SRdM4vdct0qsYtrOQwZ5SdfyU/N4wYA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

TI has unpublished the BQ25792 charger variant and pulled its docs from
their website.

BQ25798 is a pin and register compatible replacement, which also adds MPPT
tracking support (reg 0x15, added in BQ25798 and reserved in BQ25792) and
backup mode (reg 0x0f[1], reg 0x10[7:6], reg 0x16[0] and reg 0x1c[7:5] on
BQ25798 - all of them reserved on BQ25792).

Expand the existing binding to include BQ25798 with a fallback compatible
to BQ25792.

Link: https://www.ti.com/product/BQ25798
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Fixed the conditional to ensure the constraints are applied to ti,bq25798 (Sashiko)
- Link to v1: https://patch.msgid.link/20260914-bq25798-v1-1-dc5e2ec343c4@flipper.net

To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: mfd@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
index cdce83f05804..3bc07f25d063 100644
--- a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
@@ -11,9 +11,14 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - ti,bq25703a
-      - ti,bq25792
+    oneOf:
+      - enum:
+          - ti,bq25703a
+          - ti,bq25792
+      - items:
+          - enum:
+              - ti,bq25798
+          - const: ti,bq25792
 
   reg:
     const: 0x6b
@@ -103,7 +108,8 @@ allOf:
   - if:
       properties:
         compatible:
-          const: ti,bq25792
+          contains:
+            const: ti,bq25792
     then:
       properties:
         input-current-limit-microamp:

---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260914-bq25798-67768a40517e

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

