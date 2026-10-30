Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383878;
	b=o53g1Fjd1Avx2306OXuQpPBoeHfMUno12XeiJV+R2ZtTDrPfoWx7chmcriIRSoa1zvb4
	 s/3VMRORFNEaq/euP92RVeqdPiNQn0cPNIIjuhh2USGXrN2w5wMmGNpcrZv8kuK1MILUV
	 gX9cdipzxNG+3Kuh3kPRpf7gGTHYNQno//NfaAs50edC4Ez5gDm0IN5GAIT8rS+rpY3Ly
	 eUytwyRfGDeiEOU9Bx0X9GSCDW3uFBRNTTPv364QQnxYuegzwWHVRD2klaqB/BHUqHU2F
	 BMyJslxOcO9MMibc3cIc22Wl/dZQ4xUl3TSinF41AtsPIZUYOKCeTnh364Ogc4aXdnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383878;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=xJErFKYPU8d+wmmwqjpCjFo6vbn7aqgwgH2UyvNH/5A=;
	b=JE3fISrUFdszQqGOg4CvMOduhlnGf0GeGaTRzv8+aBouauIvhITjPcLYg2Zer4uQLGQH
	 sLnxu8lsy7hHmrkyHz5+rFMRz8tp68ScGaUoJ9/ByIVKoPXrBjqif/nVlbHo5YdVaRAZR
	 dbxAbgGiBJOzO6vEreYANiIbMGoBFluKiukh+Xl3JYN7bnnbOLRb4yzDYsocqOOwuwPoI
	 yssamg/uN6TWA+J9WdBa0RjcvtLp6NBF3PyeoZet8G/4tzdou+thqNwU6zkGM7YHjkTLl
	 /8OxqIwV88dCdfnbAl7L72/C0pC1a6Z4OCPT3lIscSBEGkrGnmJ7DiVehMbyYPjtsgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WXuArCAN;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CBE606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96CBE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WXuArCAN
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so881079a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383876; x=1793988676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJErFKYPU8d+wmmwqjpCjFo6vbn7aqgwgH2UyvNH/5A=;
        b=EZKDqJ39LhYivBCCAcMxyKRphKmr/AWMR8B2c4w9Im3ZWHkt6+w3f1aYTnXPgSaHqS
         GJXvMnDRkXlSS9TPWYc66P5UJdn1HzW71yG/6gci1azzmJJHtIqRLpbnvQu9YWe8pVsn
         9gvaG+iQAjC1b3CdZ8e2wZ8P3yaGZO6aRqsv1iBSKP81m/KCw+xFu1acnBkIdK9F1iRv
         o4DunCpsdbdcTl/pWMCb/8c95/SF2QgQE/ynXx/BUOnjSNxz6wcmYmmL9W3rZxv2IqC+
         m0epc1UUT5jgOdxSii3U/CO2ITR0p8i0NGpadLlFDG36G+sKkzZNilfqLF/OHjJ33K5p
         j07w==
X-Forwarded-Encrypted: i=1; AKwUvByrYhr1Pv+S/ThJEe5GwtZGFwbixtvCUA6oUvV+/QTSM3a5K3PqGkffe8sz4vqynqIlF/oSe/r2kUmrKqA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJpmg9NLeioa23Dt79fO3KKLCkzONPpzS2mID4ceVyEHZxxRtA
	Bit/sAYlpswJXz1iYoYMuj7Vc9vTCLLlvvbAfcrrgMrCqgSf4U2zw6aN6bUUHqS8u7l0aT5s5TX
	pcuuweVzDcBdNbCa7HdN+YpQaOvGCgKj4JhHYCVZT4z6EzUPycnPQzYSpz+fYwcotS3zIV37IjK
	Bo7C3N7Wvqvpz/R20GCrg4O59618vBQ3r8tJNVU+B3UO5E/YskJsprjgeWsO34eKPM4XZZIWVvD
	CByp689+8uRZ74L
X-Gm-Gg: AYBFou3WoKqvNv4hoIcyP83Ix9WlO5IsiUvp7eG3jN4ayjXD3oQ34j59kEBE0uOs/bA
	uYHhg2NexdFhY7MtehZ2utvq9JCdqTR08i2zEwLTP5ybqAnH/vaob/I5kIzT1axi9CF3Wdrg9kd
	nt+OyTtIKWILL42VO/1R4ESH5/hl1B5a9sBjM/umcpU2vyZiE3U+e71c32JZHhJLwotGgq9GC3M
	GhsKQMwUHbsCB1iC8MBBZlLIy9mJ8BK+F3dSJTz4eLq9dRDFo2XP+D2x0Xx368Gpn2kRdNYfO3Z
	MwWLQ6wDGK81tg0A7f80mmvTKG343PnQ36whWBavrzeHWlHI3QkAU0AxOOhIP19QDTGSeQMJ+pV
	Jd9C0vm7MnSFKR+gmbZuay52ZxRdMxf031/BUON92xIXnS1RWMcroENsyptVMObGB98vPDN6/6G
	waF3n2zzHkqElOJ1kg57GB04K6+23Jsy/Y
X-Received: by 2002:a17:90b:448c:b0:3ac:a7ee:6766 with SMTP id 98e67ed59e1d1-3ae8980ed36mr2624830a91.36.1793383875874;
        Fri, 30 Oct 2026 11:11:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae845baad9sm2349477a91.5.2026.10.30.11.11.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:11:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso1898520c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793383874; x=1793988674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJErFKYPU8d+wmmwqjpCjFo6vbn7aqgwgH2UyvNH/5A=;
        b=WXuArCANuNRrlQXK1MvdXaHrH1tToNgzIMKsqHm0o9nSqld9JthB43PP4jJoGpmmOQ
         LOBjmTXh5el8wW78viuBWgDnH5yF03eZvLT4XNrcs7VM852QWZiAoIrLpDLCUn3SD8Gs
         k7l4J2GBoX9q6cfm08HdVzSK5mRAgNa9rFm6s=
X-Forwarded-Encrypted: i=1; AKwUvBzZ5EuiAiyGUAuIts4hZFzNea+AVJ6QOLdlIzppns3TQY5KSZss0Effoyxm70tKGX5LgKt6GXtBhWgGYXA=@vger.kernel.org
X-Received: by 2002:a05:701b:4181:20b0:153:4a27:4ea5 with SMTP id a92af1059eb24-1ac5b7e02cemr4125473c88.28.1793383871462;
        Fri, 30 Oct 2026 11:11:11 -0700 (PDT)
X-Received: by 2002:a05:701b:4181:20b0:153:4a27:4ea5 with SMTP id a92af1059eb24-1ac5b7e02cemr4125437c88.28.1793383870764;
        Fri, 30 Oct 2026 11:11:10 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm9974062c88.11.2026.10.30.11.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:11:10 -0700 (PDT)
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
Subject: [PATCH v11 2/6] dt-bindings: mmc: Add reset-card-at-resume property
Date: Fri, 30 Oct 2026 14:10:29 -0400
Message-Id: <20261030181034.3811225-3-kamal.dasu@broadcom.com>
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

On some platforms, firmware or other hardware accesses the card
during suspend/resume, before the kernel's own resume path has run,
leaving the card in a state the kernel can no longer assume it knows.
Add a flag property so such boards can tell the mmc core the card
needs to be reset before it can be used again.

This is expected to be paired with keep-power-in-suspend on boards
whose firmware needs the card to stay powered and live throughout
suspend: since the card is never power-cycled, nothing else would
force it back to a known state on resume.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 2fc8e06d5ec9..c824b95f2ae2 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -303,6 +303,13 @@ properties:
     description:
       Preserves card power during a suspend/resume cycle.
 
+  reset-card-at-resume:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The HW/FW may have accessed the card during suspend/resume,
+      leaving it in an unknown state. Hence, before the card can be
+      used, it must be reset.
+
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
@@ -371,5 +378,6 @@ patternProperties:
 dependencies:
   cd-debounce-delay-ms: [ cd-gpios ]
   fixed-emmc-driver-type: [ non-removable ]
+  reset-card-at-resume: [ keep-power-in-suspend ]
 
 additionalProperties: true
-- 
2.34.1

