Received: from mail-qk2-f10.google.com (mail-qk2-f10.google.com [74.125.230.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99314F798D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 19:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791575098; cv=none; b=kFlr6Jpvzziv2eLBWmulepVgvM5roRbmekfF1ZEPHjXTOnkXy8DMpbH5mWNYeOc2hcnEPcx5bvZHASIRlh0/orGmsLcDX729jX/rVKoqznuYGuoFQdh5M1cXaAesBjlOJTQofDKGV06KuVN40d7FFLaTcVUnXwCPF5jWBkvvJBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791575098; c=relaxed/simple;
	bh=fXj+/b1tWQ4CVun24kWnp5+6QFowX8kLlyxSUkAjW7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KuuEHgy+PPpLZ1aiF01YGROZHOUYADpOXCWX2T8ZTA/OQIUYCPdwr50QI3Fy83HtJV+6RQF6QxwH7rVtFAb+arpili74CPb5s9ePYTcPPzCQ/FJAe1OLZLSiOZtP9XA+qCdVFUz/wHMnoj0bRFe6A8/g/RxX+IkMrZlujgaW1hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFlDRByp; arc=none smtp.client-ip=74.125.230.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFlDRByp"
Received: by mail-qk2-f10.google.com with SMTP id af79cd13be357-93e67431372so2451985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791575088; x=1792179888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nIRhhPwVEVzpUkFOiFr72TjAQ//RWYZjBPnhQP/2UH4=;
        b=mFlDRBypGeVG7OJrcmkI05ab09gAUbZuWnXxWIA00fsShdt2a2jbcfo5pjD6uJ2g9V
         JT1dvEL+bsypCd9IPjmJHGatXIPOnTg5GEaS5Mjl3YwJxFdKdqdkxZRCzWHMXPqJ0AX5
         JMWRvmBqxbuftnKETdI3Mud+wtYh3pFezoczxCtwlC9quXyUnRHo3iWJx9Yc7Igyzkh9
         BbfoefKrubV+QPEuvUBoqfWAXumAK0hZLPl7/jEDzMJi7dVApU0eprsVWQDx4jdyS062
         kqstlh7hTosKKL6EJAy9Vt5Gt4tTYh4hk/So9riMJv6yaQBt6k9H0NbQj02A85K20Fhb
         iWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791575088; x=1792179888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIRhhPwVEVzpUkFOiFr72TjAQ//RWYZjBPnhQP/2UH4=;
        b=kPzo8WiAsiOLjC+FNpZXHdfCJ386d7ucR1XW4ICN/Z+F4SE1tMovnMGhAQQ4mi6cE8
         8hjhYetZ6+v3b4VKabEk9XtyACiC74AjuvhzmI9hpHQNyyJ+eP3hgX8JQzt5Oq7QJdqb
         vdLoFY+Xvt5QLkFhpEtwD2faa0bJei8+CqgQPBiIsQup1G8N+5zxhR2ZPXn+RTXoCzWK
         mjhpLiE1bvEbGERXrBkrJRsBc5uUGcrK5ywWiqsySe4UDEI9YLvQcKysViE85kuu/Dz5
         1AYmpz3oNGhTx7H4qibXv2uFAT6ifOuzPRJgzIvGBBMO9egVEtfkneBpcCp4t9ArgaZL
         jWPA==
X-Forwarded-Encrypted: i=1; AKwUvBxFt2YaDzVQyGuIw21H7Me2lKZfOVlxqezgPxv1h/QdheViApyIDh+eT4Qf/rNmV164DzVx+uwc9oYh+R8=@vger.kernel.org
X-Gm-Message-State: AFuF++kcY5zDhSouTSWicH2Lhcp7RGZgnmbQqE+kbBxCTd+sXhyAzP6g
	NM6Wxp1Db9+ipehvKJXHIawtkZmUtaWgoXwqDkEQ5RKqch+Mnz1k5TfH
X-Gm-Gg: AYBFou3XJSj4oKsuGyb9Kdsnfpe7NWlSFxnY39AoDAhn11veCXUKWZQV60LJAxrpk4y
	WLq8pullxhla5aMskJDUZIMbq93bSq1yXJ29LoTkegJp4cnFVneAeZTRWKU2XN4SlSDP9OmcTif
	gEZ4t8qprcb6JnMXy/Gr79ohBIFBycJWW/UhTh2CdKZL8oIPHJwNivxiWssBBvSjA0uon6WCRva
	lKUyVz3p2NXYOFP2a/3B1z6JpxcG6uE/gCbofCILv+iXP+lEQJDgIuxW5nSf1iNucDMkpHYVctF
	LmDdcrVQ+OADehuyOGb9vF9PKKR3cEGtJPZpLXrH/+kG5/zf582OnYqbMMjleTJ+Sb7Z5YVn9cP
	ULric8+0UUNI5Uh8HVtQecHYPgjXSs8xIwf395CuxpvOEeGAILmxbNMci1CpW5uPz65NFinIks5
	OoV+EbSYC8Ngpq9cD18F2hQ2pbYJ+YweWvxNv272UdZ60DuRX+FYrLkqwd0qJi6yOftR0AKcy71
	yzK2ZMwPeLQEhXYzto6Ahs7lqjW8f9hrbpKDZXBaTsLyexkl7anG38Sluh3Gv0iNA==
X-Received: by 2002:a05:620a:4081:b0:939:f27c:7433 with SMTP id af79cd13be357-93ebd2838aamr439833785a.50.1791575088641;
        Fri, 09 Oct 2026 12:44:48 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98c5633sm259293485a.35.2026.10.09.12.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:44:48 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 09 Oct 2026 14:44:43 -0500
Subject: [PATCH v2 1/2] cpufreq: mediatek: Enter system sleep at the
 suspend OPP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-1-ba13f826eae1@gmail.com>
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
In-Reply-To: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791575085; l=1498;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=fXj+/b1tWQ4CVun24kWnp5+6QFowX8kLlyxSUkAjW7I=;
 b=CqC9lqTPvdYR4kD85dq/pvqLzd1/IPalGGl65+mjFDLrpnZOKrs5SCOfPH+nkdDqRTmBh7PVZ
 jArMCG90vxuBdEJ2vJ9iJkvSIaILZcIp/Ir9MeZm/bqwB7pplwroPxV
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

cpufreq_suspend() stops the governors at the start of system suspend, and
this driver has no .suspend callback, so each cluster sleeps at whatever
OPP it was last left at. On an MT8173 tablet (Amazon Fire HD 10, 2017),
entering suspend-to-RAM with both clusters at their highest OPP measured
63.5 mA. With this change and the lowest OPP marked, the same entry
measured 52.0 mA.

Use the generic suspend-frequency support, as cpufreq-dt does. Tables
without an opp-suspend entry leave suspend_freq at 0, which makes
cpufreq_generic_suspend() a no-op, so they are unaffected.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 052ca7cd2f4f..f9b1eca176eb 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -603,6 +603,7 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
 	policy->freq_table = freq_table;
 	policy->driver_data = info;
 	policy->clk = info->cpu_clk;
+	policy->suspend_freq = dev_pm_opp_get_suspend_opp_freq(info->cpu_dev) / 1000;
 
 	return 0;
 }
@@ -624,6 +625,7 @@ static struct cpufreq_driver mtk_cpufreq_driver = {
 	.init = mtk_cpufreq_init,
 	.exit = mtk_cpufreq_exit,
 	.register_em = cpufreq_register_em_with_opp,
+	.suspend = cpufreq_generic_suspend,
 	.name = "mtk-cpufreq",
 };
 

-- 
2.55.0

