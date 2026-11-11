Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426283;
	b=mmf5JYVxUI9pkckhXGm8ccm0js3L/M+Y3/RPGSkYitUzHsI8n8f47KkQVxR224WenfQ/
	 O/+3T61eTbfdmki7Gc2bZmHSHgS3eut+jLmNCHoUBsGfEmwR3GnLQuFDe1V8Hftsi+Dfw
	 gW3/vm0wMF9wpnlZb/nSdmjE+AAtPt6Wu7/hpHPyS5LtnAUP3E6jsKgUm5wNtKD1sxAXd
	 bBGjwuTwz+UYU0FgOOoZge/5dFiw8a3XuzqVtIrSrLsXYXlRJpXmoFbZObRk4Sv8QOTI+
	 FlEBAuzB3eHdhJx6IRzBf7el8nIFQL2+d7RsXsB4Ym9XCvBNMr0huF/eWB98zBVq0TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426283;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=6b8iqkpAnic8aYFUTWit4E+L+/N2cQqDU3rU0AhCuwM=;
	b=NByrR8k5ZlbLXpzShIqhZbBUO8jQDcKsbffXg9+kz46rXeEhEq0zNlZ2dTuwYy4KLVx6
	 3YzlodV4rFxC7CLpcceWUJtEEGNMIFmW4+5h+u1xQrbId1cLTyCF6p+lSDnhKYZq9PBx8
	 ka8AynJbK5tAVcNH2HMWwtodfFxM7Hdk0XrM+HXqfRaNtohK/0DgqVb7zfYuGBTE1Gv1N
	 w53zJK2/p0bCdleyXnVJ/XzCEBlnCmyP3laMRm4xLHecgZbxrKtKIN94gB1xuawyghgBh
	 FHCDI34S/4KRnJ1rZIGvCZBO+ltkr5H4hc049T32qv9lNbclzZ4h2X2QBf3D0CycS3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=guxa27zZ;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E82606A338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63E82606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=guxa27zZ
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso2626163a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426282; x=1795031082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6b8iqkpAnic8aYFUTWit4E+L+/N2cQqDU3rU0AhCuwM=;
        b=Pb7VOM3wQWOwmuyfZjT/A3PtPSEY1x53kow3t+F5WHKoj3hcshIbLyvvMvLmin+vTA
         dZ+F1AqZxP4ynPdF0hhfd4ZHfP6a2qto5d1DPQ3IudBk/ufsfZ6z3//eWpc4y9PqeyJ9
         w9b7nMYollWq1Xv8vBWkNdweCwFVXVOJt4R5EMMlqU+tcCnbKRbwAs14O0rk0ZSgTCqo
         Bh8JeajUcUwW9/gp0TTTDv/C+BCWXKZhQKhKGfMeqJK5QIrWKjUl2mMJgau+mtfuaf2+
         0UGz1HdjIrBYUYavIclX5XqYKfeCoe/mhNlY4SrVS/5T8REtmIG7MqCVNVYN69ZWGFFg
         RKWQ==
X-Forwarded-Encrypted: i=1; AL+hErFAsWDeEFG3HWouzt73Fb6fv+Lt1JEhsBJ2HnS51qP5abr2tWwOa6Fqjru83/wmt3kQa/DmSan/JCeIQ/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/icaYh8yVvFNU4D1G/M01S6cBKsKTziQB8nzE7QlPmXO3Sb6qd
	UJ71pABBCxvECjo2U29YAISSOx4LjnOIx6SIedd0pi5q9+I33FZT/ApagXs9ykk1VCG2DuBEgQw
	kIcjowDnF/yUVFNEq/nMOGp/srUtyqe7unzQVarj1iCMKgvPhkoQsT6AVZT+g0NJ9WX3bt5jhK+
	5oCn/h/tseWhQw+x7axjuVCzBBuxq8akXLGJZm7vC1dl5eUMGo70YfpcYvv1T+IpYxVabNOZg0m
	1ZxVwmHFJr1Jv9E
X-Gm-Gg: AYBFou39eNECU3G7Je4gRudKOg5W55HMMaiW20bcBC/AxN9kqk0AP4XH6LVVwaE5i51
	Md5XEfkF9BBDxuhEtWLCeZMGNet7S3+fGkl3Dwbf4WVrqUbbHig86Xt9sHodaBQ8AP0MlZVjKw0
	cZUxwcoDB4Xu9sptIxyD40jUo/DjhUgrtMTPwEdj8ay8miDoqG2ck2nF37a2Ut0KTU12cBRBiVy
	8eO4nrhwsV15ZNK+EtW/PDUyEDCrKYHqUAWLvsbBlccNaRB95BhMsrgTmLDLPlQzekVTihYMSQb
	8V7JTs5axFbx7WfygcUiKs3z66ggjNJ9vIIKvu7ZAY8Mpop4Mvfe1UJLz3b0ty9YvEeo73Uqtr7
	r4svnyHj6xegkDi73S8A+aqi3K0qimE0J9r/EKq5tzOVzT2SOVZx5MICWRebvrbMllTGhm/qZCk
	fznwPIPDHOXElTXOhWiW4E4eMka+O296rz
X-Received: by 2002:a17:90b:1d09:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3b182e9429fmr3298275a91.23.1794426281672;
        Wed, 11 Nov 2026 11:44:41 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b182e191cesm1126505a91.5.2026.11.11.11.44.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:44:41 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6679826eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794426280; x=1795031080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6b8iqkpAnic8aYFUTWit4E+L+/N2cQqDU3rU0AhCuwM=;
        b=guxa27zZRfTWtWfW1S/JEPoAe7KOwlowtFR/DkAOtesHHpBVawfWXxsq71ZQxihrlK
         PAoSAOJajUeRNgmwNGBLjmkvzr5WcLLpub1a2o6PE57Rc8gD0iAjILcDcsgje1yNQA7o
         oNIrKV4AIdOaDFiiHFxF3F+uO6XFQsHVjniL4=
X-Forwarded-Encrypted: i=1; AL+hErGs+bNhIGiXCf/KWwyYisdo7UNcHDDjCLNVx1yio7D7rSgYHqygBCYQt4gYI9ChVORWGGRwkb4OyatYpk4=@vger.kernel.org
X-Received: by 2002:a05:7300:5621:b0:36d:7feb:8bd3 with SMTP id 5a478bee46e88-376850d00demr3734268eec.11.1794426279668;
        Wed, 11 Nov 2026 11:44:39 -0800 (PST)
X-Received: by 2002:a05:7300:5621:b0:36d:7feb:8bd3 with SMTP id 5a478bee46e88-376850d00demr3734228eec.11.1794426278882;
        Wed, 11 Nov 2026 11:44:38 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm17948013eec.11.2026.11.11.11.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:44:38 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
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
Subject: [PATCH v12 2/6] dt-bindings: mmc: Add reset-card-at-resume property
Date: Wed, 11 Nov 2026 14:44:22 -0500
Message-Id: <20261111194426.1652644-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
References: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
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
