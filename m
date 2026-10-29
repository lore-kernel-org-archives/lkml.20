Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262367;
	b=SlZg7IzYGUESDoGhWroKJg+QXJKzSmnF09CB94qa6URiu8xem8VJe1bo8IcG1J4mjxPJ
	 9K/P2M60SzKMXeTGTtAQ9ovJvMZaMz4+7jur5Ka5YQmVaA607ML110Rrdfea7y+SnwDiq
	 FwdwKEcmveeltT6Y8qIGcuHbBC1VxzmIIGIw4Q6WJXu+oR/85FVjWixjITrmSI/AT5BBl
	 w/GhNVULcakFb+6vHvH8/FDndZ9FST6p1akAVPqmxUIXRxWO7ThsgX8i1xUaw/RV9j3rW
	 zQwCD1h0tUCRzX0NCjjd+XRYCf3aktPN+HG3gpfUBsYKacjsSi2hMxnVVWYuuHmmiSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gfPizs4g3ul+tUe6lyiJ2ER/McCo/d24uO1muqq6200=;
	b=NRFCJ09JcdnJFajVjjvDXEwkGS0QxdVWmE+bdJtwt3PVtMP1x2AC0qxtcIdQBHhLPSAI
	 SkfaqY0OZ7hfXhM9PMzZPXnnpfhW9JYFB8RwBzNNue1XiRmwdQ0GlFPdu+Kn2MibF/60V
	 vwCmAGTSjP+/sLWtmgvwq25S6KKL+siz+WINRowVDy4raUENE/JEbrKRwG9/0drzfNpV2
	 gIYAjgTsuNoC6HyQa5+3FMIxt6tInqpiHhVw0Be8jKAMxMSqHsPLqzJKl1kWJi1eqgcxm
	 dREqXKcOpZIysQ3ClRPFQrA1B2pFiW9ghs4J5PwPWl/XDIBOt2s1EFF2aiKise4QCXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PKd5sIYI;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640CE606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 640CE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PKd5sIYI
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so5444435ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793262367; x=1793867167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gfPizs4g3ul+tUe6lyiJ2ER/McCo/d24uO1muqq6200=;
        b=PKd5sIYIRx7xlGFCaBUh82PNHaJUss05t+o73G1nEuehVRQ3xFK07lfDrx8RTEf1/6
         hjPHuew/+YKBs15zIORKdfjtpMfeaHsuD41javufFdCGF6JVMQtmwIEtg5vVh1mdUXvN
         n9MB42NysuKulvdSk3MD+N9YVz7pXLbv5xufDap3tjjtVyxFb5kUAL4MT8zNqcfj2sKp
         984s/GXG15mFqWEFGTLj4bBVjwiLE9rlwBTN5XNmCLC1Lf8T+vJA11DKZp/9H4Op23Ob
         oqEHsa1w27MxpGTiHY/Ezn5P/4gozVrChnlR3IfRnL4r4KGMvosgUWdAeHCzbeYqzrH+
         SwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262367; x=1793867167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gfPizs4g3ul+tUe6lyiJ2ER/McCo/d24uO1muqq6200=;
        b=Chz0vSN+2MOHk3+pziaw59YnO46gjMx56RvtezlOHB1nGEpEW7PcSuCNyoEj4jqRbM
         CsFuVktrUN8Rgw4WlLsoPMDaIlIxPz3Ffz4TQNMB6R+Bb8bU7RTfEPgFr57OYVjX+3eT
         zP7sKoovduLBNTsBpEQsqDctv3SkoHZcbNby6Og48ICoVPlhHBezWUEko279WWekSdJs
         Ohovl2vX3sLFWjr0+LkGG1kurZkHRKCRFpxSOYsQMH0E83uIu55cBAmFEoekQ6CD82zS
         hzixwcVg0bXRsU0Ajjvsvvb/OYVs/ADmgzni0YLUyNnr1MAsodaUN4tY7J8N1X779+PF
         0J7g==
X-Forwarded-Encrypted: i=1; AKwUvBwq+VRjJVpzBPXtE7Uhao2Z09vlVRdpwA2akczAbtm9k05jFHRSCX/cGzjkdp8RMeBKRA7kcSZtfU2V/Ho=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9duvSySlplmwK/4+FREveSFmza3naIPmskzE/n7L2kP8sqEdj
	zjXvthv5xBDIc4r0GQ4IyKtYtUOkiFNvB13JdTpvl932BiCUXx9KMDhy
X-Gm-Gg: AYBFou3lBAZ1iKVMe278wdKtdXpouQZCkDLJ6MM2ITsCqHayCsomeY5C9C6QmWe7Aue
	mel3IhtYRaElnhd271fD8B0kyyPjD/p6MFKpp4e+YQd5K1tCb3ZhYT2ASUqK5u2vCOq6NWs7l4o
	rIwj5vy9suVOQ07karvIkHaaLP387ARCSyaFr6jYxf5cFIcS1lunhvz18vI9WuyfL2knndfpa32
	gk4KRmmnJ5htI79nZjv4bqH9vb1klg9q821gPwzI68EqvwTp/f69JnHpMdCcKQniMSWEAfXuDUO
	xCO+4OuSVT9sd6ia8t7caauWX4f16QNsg6+0YjEfEydIXDvkW5HLgaRyzdFAZr/5vl9mi1BpceQ
	8JOaTz/yiO9lgvFoMj/XGaIQwOHmaRTvClmKlhualkI3ka5lxVYXXyE9Ea12GBUufixckXe8Irr
	9ef762X3Vs9cX80wg/lQlO/iO+fiuqTEJSm21oW6OWVPTReXbKVZr1tRzNX+oBZ2qrgERrdrIq4
	IfP/j5+oBccWRUCImMpUxDGQCO81ookSpD++hFxh6LVZF79jBWuEtP6YkOOdAYNIf5u04YHDJpM
	SjaD+LrOsT3h+zh/+lDxYK6NtNkg1S7n
X-Received: by 2002:a17:902:fc87:b0:2e9:6468:1ff1 with SMTP id d9443c01a7336-2eb0052ce41mr73031425ad.2.1793262366708;
        Thu, 29 Oct 2026 01:26:06 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a216sm30031585ad.16.2026.10.29.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:26:06 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Coia Prant <coiaprant@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Thu, 29 Oct 2026 16:25:20 +0800
Message-ID: <20261029082541.469999-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029082541.469999-1-liujianfeng1994@gmail.com>
References: <20261029082541.469999-1-liujianfeng1994@gmail.com>
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

ArmSoM purchased the CoolPi 4B hardware design from CoolPi and confirmed
that the Sige7s uses it without hardware modifications.

Document armsom,sige7s with coolpi,pi-4b as a fallback to reflect this
hardware compatibility. Keep a distinct board compatible so that the
rebranded product can be identified as an ArmSoM Sige7s.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>

---

Changes in v2:
- Clarify that ArmSoM acquired the design without hardware modifications.
- Explain why a distinct board compatible is retained.

 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cff..1b905a7af8009 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -99,6 +99,12 @@ properties:
           - const: armsom,sige7
           - const: rockchip,rk3588
 
+      - description: ArmSoM Sige7s board
+        items:
+          - const: armsom,sige7s
+          - const: coolpi,pi-4b
+          - const: rockchip,rk3588s
+
       - description: ArmSoM LM7 SoM
         items:
           - enum:
-- 
2.47.3

