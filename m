Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CFB3BFAEE
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255372; cv=none; b=coaShGTeYm94NFEpQFKCsLBgnrBik5ZbYhJF0j3sqKDbx09vuU0Vcw3YptwwVc45GOhiYuKz3FPwS3JIOrcwQnnJJLOaM31LSsSUyE48H/nr1CCijK3Pr2gwPBXJFcMzkl2S6pN+dTOW0Rbv1//SZ+t5DBmUjonbSQfq7HVv/rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255372; c=relaxed/simple;
	bh=rTrbWI5rSQm+EpHypyvlpEvi/M8L4lp40c78faRU1Nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sM4JYYHToMGZXMl8w63Ys4YCme5P0cNxRFfLeg69TKKbLPKceW9gsJiF86fMJZqXRodbIhDxwf7VTLzI4eb9/sFozFjNDGQOlJrVuUBZVV0m93abU1Ilm+oigzv1p2PE+5PJLoZpxjZHwePwUD8hKj05iCh5Psv/hAHIDNRyQbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdeQwKrN; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdeQwKrN"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e942864693so4042335ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255370; x=1792860170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F4xibtJE0TG41iQco+r4uLl7fC1ynCkxCGcMxo66dpc=;
        b=fdeQwKrNa425zVk/tXc3j2vnw41qOSJdCJO+s9FhhOVdI4xhIl7wTK83GJHkHpQUJv
         3Lzdh1vudZxtkq+Exn+fhCOMSYV4IdPCijE/RIiYCaxYvB7VUt186uD1TEHDDNvoxvOj
         oAKjhmAbBMA78lHzT12gAmZGqFZTEXmqvSxnMBc+/wnAEELjXAIAy7fSf4wGtBsGdPPw
         /vazXjFtgPzSsMB0JxIEoYHkLhaOTtucIUd1a8387cVx08/bk0DpAY5o9KktypIIr/ZK
         rqxld+xBLzFE/FLujBTAxHoEU6tH6ruTU4QUNlWhAIao9tdec0d7HH+MKAsQd8mqxbX3
         Gdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255370; x=1792860170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F4xibtJE0TG41iQco+r4uLl7fC1ynCkxCGcMxo66dpc=;
        b=dXcg5iy8ZDjViAl3DXDy8/OSmY/PgdQbcrV610UJByK5GmNDRqxSwP/vBCbT+zpoVa
         O8d7ufDuUziXeK6BZ+77YmAotomX9J/E6ZROniIcOpiAVnMD7rurg2YlKZtTbBDMtUCn
         yycq9kQDZx+VKddmHH1nF9ZZXjT6FcbWDn9UIjLO6S9r3aN9diCpDJQMBVpr4fRQxdWI
         O4NXyGToGi3KpQ9YJ+p/K1qGQLDMS5P/jgK7+7KLtNkWQIL/dqrUUTLNzrkDAmgRVv9p
         6t/0HQJvVzQDPPW2XSsZuGf2p6YIpClT2vlC/tqB9x62IU+uxmgX1ArbXay7StwNPTwH
         mFMA==
X-Forwarded-Encrypted: i=1; AKwUvBx92Xi+Vg0q8/ZboGM7lDr7SxVIxGo1jFdnr7rrLe9u1dcvkET1Z8fP/CbJEIcgyWXzg3u1KJikCbW43Fg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN4FSnESeYaledRSHUC4bBg0ZQQDljmLKR9OiCOCtR25j8r5QC
	AFO6ZcLaudrABicS2q2ThqsgxVsDOjzWWi4nNVZw8GfwCWWjU8dkaAwi
X-Gm-Gg: AYBFou3oFj08uAGNlX+Nfa0PQs07oKSerg50i/8qN4yqL+SeoUuaRkyMFTnGBWHEeFE
	O8TlQBhD5tLSTD/TcBEiMbccBYwHH4TYTmECmB/qqOqSn4kov76e26+1ggMxisx3/FO1eA7AGe/
	H+A9f25UbT2gU0z2LLO7/8h+hr+op8C3e/O9mbvx7pNz69O8mVfwa6hVWxLYUbEAPkguL1EDv86
	O1ImhbMaaM3F0F0NLTkXcE8LnZwKkAIx/gE2TzonmFdsI5LRps2DC9CxfP1avldiA5GCz6XMNYV
	upauVbcuizB1lN+nb1T3prHF8C2xrwq3fl4IAkAwsALZzJImBqeNB51p8fHM33w3gXzejJdDE8C
	XHU89b7nRuPBTsgkyt2wzw3Hy/gALS1riCP6rFYM4Y08ewGcDJzPQuFpeWxl2P6fioF8mGnsbMc
	AjZzYHb5ChzlJ4myVIRg89wcfrb3BSejzECA/dQex2IDwk+z02kpuwsEsDa7P4Ug==
X-Received: by 2002:a17:90b:582d:b0:3a8:5d1f:59ad with SMTP id 98e67ed59e1d1-3acef14c8femr2733506a91.43.1792255369994;
        Sat, 17 Oct 2026 09:42:49 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:2cb7:b2e6:ffb7:d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm13816164a91.14.2026.10.17.09.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:49 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 17 Oct 2026 23:41:24 +0700
Subject: [PATCH 2/4] cpuidle: psci: Allow skipping the suspend mode switch
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-psci-fix-v1-2-dedae27e4a31@gmail.com>
References: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
In-Reply-To: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
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
 the property]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

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

-- 
2.55.0

