Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792721384;
	b=BjZXO228+3nwNT1z96nr/qbdk6pmF0CB6tF49dcxbFQFp4O5zkAOaXTsueypCwXG0iH6
	 KGadJECRUu9XKg4y9CsFkMU62E3wZRXX7RZJkyV1YEUhjz33mt35ZyHm/ogGb45S61QH+
	 bIZk7vTQ3v6KkVOq3hnGodcbD2lufmsqPjpgXEOUkDYLV1+p4wcPBEARguOp+Pv9erKVr
	 htToU4QFEmjnwfGripp76+BNWCEsnPZFbl8522tSxOuYxhpFrpFyWLb5otFcPFRwD2WY0
	 vQVBZPkpNOtJRMSbik3boVdqzqLq4iy+CxroU0c6FMxipcePkMtsIOWD43Jcnu6wZBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nCEgrGMpts002PKaGu2tXyuX04mpb/j8xqv0L7WHiNg=;
	b=zvu0swLUvV4kLdzz/kfhVuVK5EX6eii2vZqJJ2IJQXKhT9xfWkCAJVQscA0M17SIXUvt
	 LG4SgkHZL3GsrunES4sin/Jsra9rDZoOcEBbFcgIJU+m2x7g/fdcat9RPhG89MGq+wtlz
	 6WrnQCaAYKEGOaVbRMyRRYXp+tFdHX/ZUQwLVM8EDEvnYf91T++pNbb7q39FwQeMlyTAo
	 64r6rpkLhH+cjDJncMfjieRDE1R1bLIPIxpFQI2D1/rxdH/eOsx4uMgMRgpM33FcdjzVS
	 VGbJf/SrkwtCUUg7V12fj9lXSTKV7by/t19w2/PtnUXkZ64uExG1AJpblhPDT72uhtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ajy5gVdz;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482A4606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 482A4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ajy5gVdz
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so361112a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792721383; x=1793326183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nCEgrGMpts002PKaGu2tXyuX04mpb/j8xqv0L7WHiNg=;
        b=ajy5gVdzBO5meo7SWQMrbQWJtJdCzL1//MFKia84+VmiCEwkpVsrYbtg3P3ECvPbIv
         ZU7C15JYfKcqk5CFUI3GPJiGsXYXRccf4+a7pAX14b/C3mpAgIgdqeEHthMNxFdB6dPJ
         OsBB58VAqhpbjaBteX9r+qP88upV3+dOU2CRVfiXwrMZJn+KKZphwXPh7ZisDwAIGgeo
         MJDl8k2WHSuVfn0rpI9WMdHaLw6ocTAWG9PK2sHrmRcCsvC5qW6PjAKnl4O0r8lMhtPv
         eSm1yFdyui8bL25xIMF/X6/Y8fGbSWUkoIK/YVcQE6KRldKPgUEw9wt7V/CDVHlmV2ou
         iKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792721383; x=1793326183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCEgrGMpts002PKaGu2tXyuX04mpb/j8xqv0L7WHiNg=;
        b=yeNArvKdRkijAbkrybeoDYJzhyS/+2Y2LllSkKmMLUUdCKc5xVjs8K+9+2dCIgLJ0P
         iAMqbKOWp2/RXfxbr1c3q0Tyt00VHMuNDiujrYcfQKT3q35ymuG6BM8ylW5aPzovPUd6
         k551xvuppb6YVNjKmXKbDLqNfFV94eZNytqsF8676WyauvjzpQ+K6iKO5YIbCMFvATDA
         iIdPCo3F7OZVnm0/AYyXDhPPi4kw3oWGFd/6KLGQhnFUn/BnBEoV7SqT502O5lpEoB0H
         TTIN2aNIbDthi+XqYxPOOzt63aYJDoMzIO0/l2Db1ULAb7I0NwDR1KmV74BLhH4Ek/Wf
         6gXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXsQVEZ0dMvbNUDqxOW/DOexG6T3qMmw/WHFgIziCLFfMcTdeu1ZdjObS2W6M2l6Z/alUsVMuUpnAMNFs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF99RygLOmTERW/fW12GMVV1SYc9gKR/QXA0Ny3nIROY7+9qRa
	Wd7xQYGH2aeSdg1LZ7Q/CTUIP0a3ZU2lRjEYJ57W56gUfgDwEL5AXAHj
X-Gm-Gg: AYBFou1wIMXUBu8G96iBBXA31wE3Cw+Kk6MQHPQ0qSyvygQZA+6ka87Gl+cqewvMoPA
	+0qYyKWXytOoMq/eJ+XvNesiFKGUQy87fisUW+BE9Rd1AdsxlCaKJupyzZJjozyXeio0Ha8LvBU
	CKlZlxP4h1dApZQ7Yri/b4WALAI49K9eeLPEVQeOQUWhSVWqDob0EAyvRsH6rzIKaWyBpLRuEZ5
	wx8RpKDjCgHSxTb75KHZPgFzCa/sYii78wqCv/QmE1cv8OkAKeoCZOD397EtaBtbmO45kA/Jrjv
	JLPBkNSyroEEFlj3kzwIl7w+4kszyi44dthi5EP8PSdaGWc63brzXG3kgkNrwIDnJj5bEvap8rN
	BQUYJhQ3FRgCo+JAFOUQwRAnFJUgwk4p3Is+I22ezo0oaR75vwpYglD0iWPEsDNQ46d1T0HlklV
	nAL/BiG8Usg5P2qBQS5cOcsFE0simmt2Qlii6DHWcvx43JrgLieYfwNCuS2PBDNk00L4zj2d9QO
	2MIdLHpcCXUK0qsHFQ5LAiWaPBZm3eKyt/2+CmeW6q1MDs5WhN1OxwnPc7VxNH47aIqTa/4kais
	wnqcK18CkSRtaAWK9mqo72lKakKz5khFn7I=
X-Received: by 2002:a17:90b:580f:b0:3ab:884b:65b7 with SMTP id 98e67ed59e1d1-3adce7db6d6mr477154a91.25.1792721383412;
        Thu, 22 Oct 2026 19:09:43 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb1b256csm1199747a91.10.2026.10.22.19.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:09:42 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: daniel.lezcano@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v3] dt-bindings: timer: renesas,tmu: Add SH7305 support
Date: Thu, 22 Oct 2026 20:09:32 -0600
Message-ID: <20261023020932.23836-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Add the SH7305 compatible string to the Renesas TMU Device Tree
binding.

Exclude SH7305 from the mandatory resets property, following
the convention used for older SuperH TMU implementations.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
--- 
Changes in v3:
- Align SH7305 YAML comment with adjacent entries

 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index b1229595acfb..263f60b950df 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -51,6 +51,7 @@ properties:
           - renesas,tmu-r8a779f0 # R-Car S4-8
           - renesas,tmu-r8a779g0 # R-Car V4H
           - renesas,tmu-r8a779h0 # R-Car V4M
+          - renesas,tmu-sh7305   # SH7305
       - const: renesas,tmu
 
   reg:
@@ -110,6 +111,7 @@ if:
             - renesas,tmu-r8a7740
             - renesas,tmu-r8a7778
             - renesas,tmu-r8a7779
+            - renesas,tmu-sh7305
 then:
   required:
     - resets
-- 
2.56.0

