Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA60D3B27DE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790872094; cv=none; b=nt6+ckFIGae4tR5UvgYwrMXIlzvVIJQa9yM8UokHGIdLtiRiumjpeE+NTWzfVS/jOl1SXdD3pexMchQVC0DzNMoTLdUyIdyuwIyssfe+TVnd5MeBV70Oqxj0IGHFFY9YPcKtZE2QlU5frzJNfpMEIQ6lGtFS11mmUWlgLR7iumA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790872094; c=relaxed/simple;
	bh=tG1TLUxM50Fc6ERYAstbHPygf9Ktpow2w1vRm5VRnjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gP7+YZYRGJoARt7pmiwoJgmh7PSuGEMojFD0JUM12TVUw8vNsc52Bua7JhZOi96r0HRkC/aeXoIS49Tc9c1/eoO1mrvLoXWMu4PaDmV+6og0ZGhE6pe87y7pR1PqHneeKJedBfNdl9coDCJLDVUWiuMpivKnoM4dzmH5qDgKNPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVLc/A8l; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVLc/A8l"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-821ff9f018bso427290a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790872091; x=1791476891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1upg+k8spX2bUmtfIe5RHFhSTkILh8SV8rlR73FFnE=;
        b=IVLc/A8lK3ySaC6uPovNxZij1bNWLENAae5KATWvvDiv3cranpqOY7HiiuI/0Y232s
         weeKL9F5Jr61dqVsShwMOPtbn61rzdg9g3CPlAINDi+7coEXlJs04sKqPUcSTJzOrIKQ
         UK6oj1xFLtX0zn9VV7OsgwWiXlo46YoVIvrtL94xQZ6kxZPKtJl9TvY+TYY/nilg3Pti
         qhrjwUb2p2lL2uN/MMymIvwnGvoG+WLh2C8EXrdHRnKAX2Yue6E5Jz5cTVLMh1yuVODJ
         591giDvO5VO6DjACVmrCWaOK7jdEqpflTpJa5lkalRejrutBxHC+KwyqRCJGP1HCYQk5
         TSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790872091; x=1791476891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1upg+k8spX2bUmtfIe5RHFhSTkILh8SV8rlR73FFnE=;
        b=QFgxhNY08LJp4HVTvvAC8xUYhYLs6YDyGWMkRuFlq2AnVS7wVZkRYe+mxbkOXlAZ3j
         D5jlbUzULG0rry7tJlIjebDfRpGqr4efBLIF7MpEZ3fhW5Ohu3QctdcZ+sCtq9q4FZnj
         DqlWVMSWr51JiCqLEVJw227/E3dFLMXkWnohcqD6chr9+FGquFGCPbsutqQHwYP5beok
         4ay5FNMfBgxRP8EMnD14qWipiZSeKggFsHSI+Iq4e3wjxtUXKDAqKZgp70NCKJfPtzhE
         U4/XkXVN9oYQfasn3Nlcy0YwvP7ZVZ8xrhS6h/ZgS4FMKOcTaOx9y28SsJW2LvXy+mjG
         pbPA==
X-Forwarded-Encrypted: i=1; AKwUvBylwpRpdB2Uw8ZV7wl9YXCy12GuZfplCBdVzqdRb+iY6AcGMAR244PyO4nUDSNNQH1VeyCMM14fvejLPMU=@vger.kernel.org
X-Gm-Message-State: AFuF++k/NdHh1m7COAPF+WxveW3CEt97X6CONx1QHxZRBzMWW+XlHtUs
	4bHSy/x5GT777sydM6Gt7e5Bb3onSIpftfAv59uKx9pe/42xBhZMg5hs
X-Gm-Gg: AYBFou3o0i0fCIdk7S27FP1OkhEF6uRpWcFCCyf/7JM9NMkUMstwJc90DUjNu/21wh2
	MHwhJhVgbsVJv6DXgGv/qEdhnvjQrgR+ry4qG5UPzG3C1q3B3GDPG9zcN6paiQV2o59ysfQHbFy
	pEOOo6/F8CxmG2C0T3TIvZCic/4mC+l5MqBfSiuKiBSx0XRTTEpyPjfERjU9j0md3MnTMdOwoip
	TJYaqr8W3RRpQJqwhUukloeZTb2x3FCwlDzQ0otj4MGXr4FqanAW1/G7b0PHLcz0G/o4rhrF6eM
	W6LCGjg8yLTs9O/H5IeRxHfotQn0sMaR6Z0VveQpl6BBucVkhbY1vdAeV0smaWy7Y38lQZLAQ2P
	KFp3dflp62CzTvzrKSsPQhyR6fk3Uu0IevYC26wTot6ujagSNkg3uW6sBZd0j0lOPFCItW3GlAJ
	D+3Ig79hS5tJQKuYe7Ehm9x51Z2icBAJYA1GZP8A8p6z2SjwrxGIEgTGoatLxE10O5Y0DPRvhYI
	EKh0QbWKXLNSGaHTp/GOxSpXLsU0c4NwUAMYZnWBsB4YAV56y2oQzlCt5ab1+jCnAEV5lGk+g==
X-Received: by 2002:a05:6830:270e:b0:80c:6371:21fb with SMTP id 46e09a7af769-82282a72582mr154136a34.16.1790872091352;
        Thu, 01 Oct 2026 09:28:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:a4cd:e25d:fdef:4a3b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8227a66c6dfsm219239a34.23.2026.10.01.09.28.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 09:28:10 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] pmdomain: ti: fix device node leak in probe
Date: Thu,  1 Oct 2026 21:57:40 +0530
Message-ID: <20261001162755.50666-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

for_each_node_with_property() takes a reference on np each iteration
and drops it on the next one. The two allocation failure paths return
from inside the loop, so np is leaked.

Put np before returning fixes it.

Fixes: efa5c01cd7ee ("soc: ti: ti_sci_pm_domains: switch to use multiple genpds instead of one")
Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/pmdomain/ti/ti_sci_pm_domains.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
index 949e4115f..9cb6133fd 100644
--- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
+++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
@@ -262,14 +262,18 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
 				}
 
 				pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
-				if (!pd)
+				if (!pd) {
+					of_node_put(np);
 					return -ENOMEM;
+				}
 
 				pd->pd.name = devm_kasprintf(dev, GFP_KERNEL,
 							     "pd:%d",
 							     args.args[0]);
-				if (!pd->pd.name)
+				if (!pd->pd.name) {
+					of_node_put(np);
 					return -ENOMEM;
+				}
 
 				pd->pd.power_off = ti_sci_pd_power_off;
 				pd->pd.power_on = ti_sci_pd_power_on;
-- 
2.46.0

