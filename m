Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662111;
	b=UTSm1QXetmTEID74YJ5BTMIu2CpwgfNktIe0JGot2Mc3pe21T5iahYAWFp1Ij9Lg0VKS
	 4PRx00G5AYoIzF6UMyvdnmoq9QSOed3VnWOINSkq2fChHdUTQcR1SQAQDXFLlP80PDJeH
	 ZTM+MY+g0eEqft6QHa0ibnJCwPKYYiT2ekRHVQtvKVqwGCUj2VhAw85SbnQtsEYcWeKuv
	 Z8WaAD9qrzmkQnRtaEN8PXdj/xEZ0uDrM+47jQZm42V17Cz55XI8SFaq5o9Q9Tf4knAMP
	 fQv/0NekWOfULGpuONw5sW+wk8cbmGQOEJ4xeXMJoCoShHYHFkLQVyqFXUL7uHX6aPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YzJYBLOEFNhZEUyVt/ZR8mdxY6kWFw5Zp9fV2xapAVo=;
	b=hv4MQJNd9fy7bn2ClWu2/T2DGrloQoUkieLqP1+7r3TgFMsUrBwLz6PqFoHCNRaQJqE4
	 aj67mQ3SFkn6hBZHEcOH7Z9+EoCZs8uM2cgC/4dZ5NoNbvrMOO7YowA3RSln6jkvTD1J8
	 L44vGT7RuhjX0RvDN8gQ6n2G+hd/3//MMKNC0q4HxY3h+Q9Sbe8I5RrNZyVa50y2zMGX9
	 KcGu238Kh2V4bI0qCAC9oDgTz8sGx4ibUt33loJhWwLHxGYMrhmOUX+VvlqeIv9QcJOaa
	 lHik8Oo5EnWwueoqT0iqa0F4dXH5tH+sNFPhWoMXBrDIblhUvhn+0xAuQHRGez0FBJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=flCHyNcv;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B58D606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B58D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=flCHyNcv
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9e53d011eso10235165ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662110; x=1793266910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzJYBLOEFNhZEUyVt/ZR8mdxY6kWFw5Zp9fV2xapAVo=;
        b=flCHyNcvGJEetWmU9Fiv7hcFWMZoXVM96GmwYbc/esmM7l6NyCJ6g6yfq2Xo8ADIBm
         WR8A1EGGX3x65G2pGZykeolg+tZa3bK+YX3TyyQ1mmiZkpI4t5U5PSwce2vOe97r4Kta
         gKv6S9DKcCOuvdhB/8c9PnIsoVM+6RqrRiyL1++GTusOu5MoqmeVn3wLL5bmTt88XYO4
         Y0bBe5ExlE1YXjThiDtpKE6OlKb5w1jSlSDrg0FWuA7hQE4hIxefOfadY1mZJ2zikQtt
         GOK55gc4j5V6xsPAMZ0lldPFxAy3gPcU+a+2DS/QdZOlP0jc9Y5bfuGkES3kLpfgr29l
         YjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662110; x=1793266910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzJYBLOEFNhZEUyVt/ZR8mdxY6kWFw5Zp9fV2xapAVo=;
        b=HrvaCD/g27UnejfY9NiMZgFWgT+yW+lxyuQAOYj1/gNjOLyKLoWNiDkHBBw/s/Fvt7
         etWa5xJF2egA3h6DltVLN10KrmhFXmB5U6M5JY0sqSZ18cJ8REg6st8d3rU57GcSSpDg
         FVOMwwrP4mz0/VYd6z+fkRNpVWj6R6gvuLsm2dy6gfjEoccV8Mpv4PpJMnsPlj5mHSu2
         G42LgQrwHj5yLgNf9YrzDmRmHxvPBsi1xA9G9aGe9nkZ/HS1pvyccghxjUUOGPqIrWbG
         BTHdVcSbXte8DJuIIro8sXkJsOVoqGz2GLU0x6v6aGMcDOMv3yPghOvCK4klol3Ezq0r
         jPlQ==
X-Forwarded-Encrypted: i=1; AKwUvByjAnaA0A07sU8AGJunbFSJiKCwtmOiUOfL1yAd+ix9m/LufOjkImyNjcd2DTqLkLLuVQNh3FtgJybdT1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFEaaESNst9IQHe3LuKc23l/AdicfLU/SzqnVyPK9tkkCESpxO
	gat+u/ah+6ayp0RfP4nyf43UwuQCsQhNAcr0WgukwoeVvLEr0Y2iBDJJY3PUfA==
X-Gm-Gg: AYBFou0Y7J8LyPlNzuvC/+fvj/GhnVlUTwPNrqsYP04eftJboz/uVVobpxuVTEMcarm
	M7eKDH3c05kgv+jtima0ie3+Fv42tlW2LEj0ZCWOMbxSu+/uQLRCf94gnQH6PIljDm8koue3iMZ
	ZSyk1mJlsu06MhFcLWynG6snNxXIx6i+aEp/gkNzfeRDo5wJp45iNASeK50wd2qIu3r7xQ/8YLA
	R98IsKqSGad8Qw5yF31TG7Wzpv30W/Rh8BE8pg6gug8r1EbxQmURhGJS5koTZwQTCeqkq0QMHo6
	Os5xbGSMDoD07mwqFVDQbRP/kbKmb+PCeHwJ5p4uHmfQOsTMpZDSoywXInW0AGhnkS5K4MyyiO6
	eM/Nmh21BaNtm7FZL25ICgK4KSHJSlGwNdaS/3tYKxyVDOF9lcIcgeaBwcGWA7V+jivajJgqCcE
	jiLRUdFSCMTIFp7+qJ6NTXeuH0D9Q7FbmvfKxTpmRjFX122NmxVA8hSW50x2ExJkXizI1/8tgdL
	B96nebeYZjzyb79sbWZy3qVlGG9uYJeCuhYquT5VO2EJ4a4
X-Received: by 2002:a17:902:da8e:b0:2e9:6788:9369 with SMTP id d9443c01a7336-2ea43e17bb3mr40452615ad.34.1792662110457;
        Thu, 22 Oct 2026 02:41:50 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:41:50 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:11 +0000
Subject: [PATCH v3 2/4] cpuidle: psci: Allow skipping the suspend mode
 switch
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com>
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

From: Alejandro Tafalla <atafalla@dnyon.com>

On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI reports that OSI
mode is supported but rejects any PSCI_SET_SUSPEND_MODE call with
NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and the
probe is aborted:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

Add support for the "skip-suspend-mode-switch" property. When present,
do not call psci_set_osi_mode() and continue with the topology that was
already built.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
[Reza Kurniawan: split out the patch, added log message for skip case, renamed
 the property, added property check at PSCI initialization]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
 drivers/firmware/psci/psci.c          |  6 ++++--
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index 5722365b94..cc9f14769b 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -159,13 +159,17 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_pd;
 
-	/* let's try to enable OSI. */
-	ret = psci_set_osi_mode(use_osi);
-	if (ret)
-		goto remove_pd;
+	if (of_property_read_bool(np, "skip-suspend-mode-switch")) {
+		pr_info("Initialized CPU PM domain topology, keeping firmware-set mode\n");
+	} else {
+		ret = psci_set_osi_mode(use_osi);
+		if (ret)
+			goto remove_pd;
+
+		pr_info("Initialized CPU PM domain topology using %s mode\n",
+			use_osi ? "OSI" : "PC");
+	}
 
-	pr_info("Initialized CPU PM domain topology using %s mode\n",
-		use_osi ? "OSI" : "PC");
 	return 0;
 
 remove_pd:
diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb2..3226af6d89 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -791,8 +791,10 @@ static int __init psci_1_0_init(const struct device_node *np)
 	if (psci_has_osi_support()) {
 		pr_info("OSI mode supported.\n");
 
-		/* Default to PC mode. */
-		psci_set_osi_mode(false);
+		if (!of_property_read_bool(np, "skip-suspend-mode-switch")) {
+			/* Default to PC mode. */
+			psci_set_osi_mode(false);
+		}
 	}
 
 	return 0;

-- 
2.56.0

