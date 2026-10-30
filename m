Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383872;
	b=U0rufzdBIoDxW7X5QW1Xz5jJK9xMKYuCBXwtUUyj2oh/dUR1euYdMSPV6CYrqLYLb8M6
	 0sLQKRfT0LA/BNAh3APOp7zkBMfpRuyDEoJwnCa+sxVyx6SZp/3kqyKqVL+P0qTt4lwZp
	 pMq7nT6Og2+Muxk0KB9Ph81MzUv7bR97nzUca/0/WhNm4rHmSuUOxoALQ0xJlymqzK9ad
	 nMtsWjRii8mpvhjhrk2m+KvWyEqkkljm/BK9s6NOHD8CsTn5vFPiGbcdFNfeYMiDQty+l
	 FoLsK4HM4vhBcrrGJOTu0BYJtUfFcIV/gQp1I0mTL9SqgkPUiy+q12GkW1654dTVp6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383872;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=yBI12lOTPjK6azkSJoV3g3WBDvgCLjEWrbWWzUZMmOM=;
	b=FTjP81FwFhKcwOI6NVKTGZ+1oxAp+iIyax4mZ1I+goQfpy8yLMazwAajuS4LY3JmSWDF
	 13g5tzqJXOjYn84wLNZ7qo7Z1dqjtXt9Hr4DsZyF8kwlliAjdgaSkxKj0p3KvAd0HARRU
	 tLYepwfq2O+Kputa795LmFJnCqrfch9msGs7hLe788Ox8im7Ytz4+zPdYVySiKsa5GJy0
	 fhpMTHKhmjaVM9FmJ2mHVDvHhyabPBnP2fE0GrgO3Kw+x6JSYDD0egy5VbbeeGy97XDpV
	 wj1gkzzZnqt54EjiJFWN3Q2931zjOePgUudWjyPuo18yM0Bc+XxPe4ZF7rZxM/pRX8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CY0LjS0r;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0C1606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB0C1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CY0LjS0r
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso482744a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383871; x=1793988671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yBI12lOTPjK6azkSJoV3g3WBDvgCLjEWrbWWzUZMmOM=;
        b=l1ydTYv3pocuMNtiPh8s/9Q/qwELMN+nuOVbqSJ2D0a0eqth/6ssI8d5u6iN5F6Fth
         9bJCsE1Ad03G65WrpCWqTbs9y9AulGthidO/K+FW4TNx1c/zZ9oypGKjFpSppAo9MKIx
         Zp95iTUmkdHuCEc3gsFMsbAEgH5K3FlGqlf1cgOZgbdlQcUNd6hhPoeLKDHBivlWwsvf
         GRm+fl07T1L6eatspvwgiDdTp64Yv4BnipOAFbbfMGh2PTgTLhCnvYGzkYO64cL07QkG
         VPB9fblMmSO7N7hyDo7Qkkt416mD1DxJDYfTh9PVFVRniry7V9XjTyybQJY/DY80dAKh
         bccg==
X-Forwarded-Encrypted: i=1; AKwUvBxoSkfzdH4SjOVYbSwg59uT70mzyD5sFkt2vMGMK1TeisKAcyIgy/ls2TdPTgaeLd59jW34Vz+sgtoU4d8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIo/WOsK9oR8IwAgITSFU2yQF2HUswXhivp+jNzNWT7WNErz00V
	w2GK7BK6y0UIHF8WEqtA9atlth5q9dZ6AwGrPshv+7A4jASyjLXVZd+/N5BA7LmsqHtxRN6H6le
	BCXn8C1NMhsAVZcT/hJTNPPEe+V8JgzhwiGPPMomfUwH1e7HQ9z2OZHXTiygOmKeLpAmiqjLdMR
	X97fpeHqdhjuWiBXyEeYgOYugD9dHTo7FaDwAuyYaExCM/d179v0VCzhEs9ia8/L3ZbmcTs+l7z
	vzx0FgLRT8aOMs2
X-Gm-Gg: AYBFou0DpGub5WWsIXoTNaYLMUlReuLR4INIOK4jr5TcnX4k2DUXh3x9UZ5VcSfftVb
	LI330tfEwprJpR58sCw1as2BKozjgR9iG5T01On9YdipD0y8reImjv83A1YcqPNxQMfQ9v/j/pw
	nZa8C+6JZrSXBgCCLo8Z+iA463Y9N5LMUqYS/rbOrvG3zdU24Ee5M0/rArElp+dsp6OAfN2gsVq
	83TnzJJz7wzP9UpCdwGSBtPj1bU6Uejg3j4oRpSlwpyvt5BszQzOlOdRJT13JqSBfZQ5Cs7rHT+
	RKN6XfufZzVRWyq7R9Y2zWyMbTPZn8phAK63GW3wStWgfOHHAR+P6iEYnUWC9LwwkI9chzujRcy
	Ct+PBRFCQ8NBIMpo7K5ER6xMr0yyHstmWjhDrHKeHPTNpPAw9l+rB4TiyGwXPxU0EbgrHyUOzZy
	NQC4fD6b68bA34eOKEI9pxA5mr9MWdJyOd
X-Received: by 2002:a17:90a:e7c5:b0:3ad:5c64:c7ae with SMTP id 98e67ed59e1d1-3ae897b67cfmr2454468a91.57.1793383870983;
        Fri, 30 Oct 2026 11:11:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae8444ce5esm2410146a91.2.2026.10.30.11.11.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:11:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36637676140so1486451eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793383869; x=1793988669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBI12lOTPjK6azkSJoV3g3WBDvgCLjEWrbWWzUZMmOM=;
        b=CY0LjS0rkZkMEpQjof+NwCtbBP7KoZH1FF8wFbHVpoAvkwjFy21WdKd9YTD3Sf7W02
         HATSgJ5ovAY47I+EOUtKg1M+1xsnvsvuQO6gpXHkFo3wk5YZlnWCYlXGn7CwhJxwdYlv
         8T6diZeP5C/OaFK5pIaPWNjY2WruZwvW8f5T0=
X-Forwarded-Encrypted: i=1; AKwUvBwjMcBIc3F53TMOnP4YCHiMTETNVNYfLZPV6Rh0elPwDpkLLT5QMuExUYUEw8hrRikYsTua/3i8RSqOaAA=@vger.kernel.org
X-Received: by 2002:a05:701a:c907:b0:16a:1fa:58cb with SMTP id a92af1059eb24-1ac56d95460mr4158709c88.1.1793383869199;
        Fri, 30 Oct 2026 11:11:09 -0700 (PDT)
X-Received: by 2002:a05:701a:c907:b0:16a:1fa:58cb with SMTP id a92af1059eb24-1ac56d95460mr4158658c88.1.1793383868479;
        Fri, 30 Oct 2026 11:11:08 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm9974062c88.11.2026.10.30.11.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:11:08 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v11 1/6] dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
Date: Fri, 30 Oct 2026 14:10:28 -0400
Message-Id: <20261030181034.3811225-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
References: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

keep-power-in-suspend is currently documented as SDIO-only, but the
requirement it describes -- preserving card power across a
suspend/resume cycle -- applies just as well to any card type. Drop
the SDIO-only restriction so eMMC and SD platforms can use it too.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-controller-common.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 8b9b3b036129..2fc8e06d5ec9 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -301,7 +301,7 @@ properties:
   keep-power-in-suspend:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      SDIO only. Preserves card power during a suspend/resume cycle.
+      Preserves card power during a suspend/resume cycle.
 
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
-- 
2.34.1

