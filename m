Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F234ED1A5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674117; cv=none; b=tYFRsTuQFcVjkdL2R9ipstlGc/O+o5tVKa+40ZQOY3apZ4yVI0Bl7RDzClBt6+qPYOIGu2kfLCPXFk0cBUsUM/mJfkFHcWulb4R4InH2XcQjWTqrNgmIgAXD6VfGOMsep3KCyIUwqmRisH+FwcNhIx9Im7uHL8dQB8ZKPyZbJzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674117; c=relaxed/simple;
	bh=GGKmCLiVvtDvmlz0XzH+SIxoxbsri4p6O5niGHjqVvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=njNZly/L3xSNiSlHx4O9y3JDUJ28RULw+K2uZeaLjC+VzMc5iHzhjhkt2yqZ2wyorTLnvEKijC/8uGEZjE0kvueQMoacuUUgQfa6gGpzR/RoUNBxofAYTBI3kTLvLO5eLV9vF1htn01VF3ZTz4wHdwRdQWJUzQXksfw/O7PKvl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TupxW+Cv; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TupxW+Cv"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8e6ec4e0bso3574182e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674111; x=1791278911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cUcudjbNeMYMO4iQc1KVeIMhr0bUMacxk1kl609+CK8=;
        b=TupxW+Cv0fWO2GSrILruXo7jMsq1efBBhH1qgxFWkmnTAyv4rjyVPWfCzPpFlcV4Je
         lwJe9oQ2gdNqPNi/qvoY2bzF0iCnmOcxa63vLpLFzerKoPv8YNqb7f+hfwemu6sVgQor
         qWn3aqx7ObHv/juUrbIPG6dX9qgvVk17oN2xfJ4bKMkv21ZiSxX+vKbPeVmW6q13/x3T
         w0Y1ZCUq2gbpVAVmUls+aqYu/bXwvRUZLO8tIG8Gt4RcWKjUxMB/gDy2vnSQxGO4ElTi
         3ewvhwXgtNoj+Hea67vqc5G+5pt/KOs/1tutaoEVGbjLuCVQgr/o29JwGa+TUZ4z/i3g
         QAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674111; x=1791278911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cUcudjbNeMYMO4iQc1KVeIMhr0bUMacxk1kl609+CK8=;
        b=dXIf3xAKVJ2+Ljk20Hct/Grm71p9MzLbAg4op97q9DnyaV8FLmewBVQkQvF0si9JRi
         n2s6LXZMaINEaCHdk/voKacKfbuvJP/diixKXmrloAszyyRVV2IdNaodqO1WUvf/7jEU
         2N4CLVh2UAcIiOjBse/9QaAGTI4m+hacBRl6GocvsBHiMagT3QtTfzBjMNFyY/bCTwwv
         jj+eUOqjMI9ZdBrMuXkgC13z30ezFFCIU0mpk7TakL6YeYJq+ussgPFGacbSiBS+AS+z
         XhSAeCuXQM9a59FldnfoaQI17WsBtLSFc/wTGVaYk7a+PT6URCG+pHCXC7pcKJ7HPnTs
         tbaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzLh7GALWL+AJztf0rHM2e6z8HuyW+plWM3tn9lRIbpUkBaYy8YdcszG1q9ZE6y4fOkhWy7OVaabl/cdY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDxZML6JITB1+Wnntn4wcowhfrCMFMiD6LS5PU8ln9AtLztV04
	GYJiih+72iQWt1NhAoEadI2UMWsVjuNTRXflDvMKUw7s8v/5P4o1CvrS
X-Gm-Gg: AYBFou18FAGDTMiKsLTiYmMk/BobxuOHd7lKpvMVeFqtmdGIG5Mg8bqkN23dR5BGgnd
	PHM7RU13FrZOsStzsF6RXKC5LIEAoHcctW4R3jjFCZIvZBSK7WvnkgAXrPdAEEQQDWXDq4oUI3c
	4f3bgOrhFBJQM1Gi4WVmeutkVJmQR4/3/hsL8ss07X0GIuyfn7ckmgk6whk9xem6uoqXqQfO9BO
	nksAJipo0Gkc9yvLWbbHfErL+NGVv8sIh0lZCfIdewRnIgSQF2OqERpU6CI1+U2gMh/seyNf5RD
	Nmv76aqGIx4f+rxv3+WrIpTC0NZao82w9cnxhgGkzmaup27RzrtkSMh3fDQ/yV4UIq5KhhiOV9Q
	HY13Wb/UXRyZ174EVjaRmW/4igyTkTrOB75ZW77BCeK8YXH4rzjmoB5kcVw0BJnD+P2ONN4PtyN
	ZGdcYiMcEV98VyRfYvnyfDv5dELjFHPYgezhsvzq8kwJfUNoYBLdmQSe2NNJgwzE4RriJKHQgbq
	fjGVnkC4oM=
X-Received: by 2002:a05:6512:15aa:b0:5b8:e83d:6c13 with SMTP id 2adb3069b0e04-5b8e83d6c86mr4110653e87.56.1790674110672;
        Tue, 29 Sep 2026 02:28:30 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb0bb2sm1216403e87.37.2026.09.29.02.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:28:30 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH v2 1/4] platform/x86: int3472: Map the VD55G1 power enable GPIO to "vana"
Date: Tue, 29 Sep 2026 12:26:58 +0300
Message-ID: <20260929092700.1776966-3-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929092700.1776966-1-koreev.r@gmail.com>
References: <20260929092700.1776966-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ST VD55G1 IR camera of the Lenovo ThinkPad X1 Carbon Gen 14 (ACPI
HID TBE20A1) gets its analog supply from the power enable GPIO of an
INT3472 discrete device. Map that GPIO to "vana", the supply name the
vd55g1 driver uses, as is already done for the imx471 on the same
laptop.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index b48cf1b7f..b19ea6ee3 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -131,6 +131,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 static const char * const power_enable_hids_vana[] = {
 	"SONY471A", /* imx471 on Lenovo X9-14 and X9-15 */
 	"TBE20A0", /* imx471 on Lenovo X1 Carbon G14 */
+	"TBE20A1", /* vd55g1 on Lenovo X1 Carbon G14 */
 	NULL
 };
 
-- 
2.55.0

