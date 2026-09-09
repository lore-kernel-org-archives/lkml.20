Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1622563FBD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966901; cv=none; b=DbbLUDjq60iDmbhFc2+1XXqv/v0wi9Up1HPOsHw1iIhdRJpAhWYlFoQYG1DaZ2BUgvHeAL56FcThE1MESaQN4aIrwC1SmMtCY4ELV7j5cGLDYCsPB/B/A5SltP+DJ2FuW/sRmSgnwn3uOmxgnqlzU2QxVmBd4qO26Dni30Mj5Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966901; c=relaxed/simple;
	bh=f0k8e1Um/2ur8NWvk6H6Nte2peT/Kha5SrTEFCWanko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbeahMJOMJgzITOuRQeG8Tk59bDNEDgLNggpABAPJSukcXNYgXUos6fVYZxJNJKvtDUVTOkM0sR7TBC193oMqOmf5PI4diTnDf/2sC5WJZsit6Id1uPjMGbbcHpQiX1DoRFvgtsOvE/MB0OAsR3FA9TCDZiQlkfkWYbOgfREB14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGjDr6IZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGjDr6IZ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so83477575e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788966897; x=1789571697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMQlD/kvEb1R1nr991pm2owfqsmrRszs+IoF8p64UKQ=;
        b=pGjDr6IZSRWBB32IhejURDsJT2Fkm8+DHgkzpDmCweN3rcBjg87v6l/Zi0yLnBQskf
         3Y8UxcNSuRJ075RCpxQea9XmJ4mmyAVxpF0NX6QCIuCwhd3DBR6uQMrWcE9EOB7S9LS5
         eXo2bVMdezg4RQKOPg5Yhf5tGi50wY4r4tIyPIdeITP5+c6d8Z4tcf4lzfc+GmARPDCQ
         ulusZh0Qij3nti+FCsF1XlWzi/IkHjrr768yJsWzpsimBsT2CUSNItDzPbe0QQc+FCYG
         fswWaaBhQyxXNGgv5sdnHSGvc+AJUe0obA4dtq75zhE5CFmJc02KVa6R8qKQshyJQsl3
         3j9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966897; x=1789571697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMQlD/kvEb1R1nr991pm2owfqsmrRszs+IoF8p64UKQ=;
        b=PafGwQmDL3r8rQTxZ5PsUZMpJvpEwlQRRLn3qoXX0EJpLUTbWWYaGnT2bUIPBMX5b8
         pkYAUPDlwbELjREkd2DJuhrxh3iakqfOBW70xL82joigWjqTa0FGKCOD60TWWqeDZ3B+
         kkCGWL6cw+5yV/JKbm/PyTgcISdhzTvCj5LpwuL7M6YE1SQw2Nb+1bpcLznuoBEV8+KJ
         dAOnPbzDjLe4XVsuE/tfLGUZGyXwid+lEWDYYI4EUeyr0+kkwjCQ8sb8iFM3cmyLco+2
         O25EDDxDKdNM5hvKmPydSOpMa4vF2eTF4wv62X9lrIE0D/vdDVQzI2qy5/NTGHRCXhwk
         gkFg==
X-Forwarded-Encrypted: i=1; AKwUvBxo9kIE/ohBDT4YLfmR7UCN6DbGQehYreQ32z3FrzkAMLrRU0beQtHc8l78SAxcL+cURZyU+noJpU1CqEo=@vger.kernel.org
X-Gm-Message-State: AFuF++mIh9df1Ftx0eAmCzyIgcUcYqvJU3lRsyxfazYCkSgn91BvuqOZ
	ZZK1IBudvzubk8qpewgzzhF+TjlXD1i6IqFlbjz5f+azIL2/rPO83ca1
X-Gm-Gg: AYBFou1UaFXpDobvLjfu+ympeUO2JQmhhARIVC6azBzXDJx9lhllmMAeJt8Xn13/uSd
	T0S4tck3ZjO9VtOjrZ1R1ReFpVKXWltBxkvrvrZSwyxyOvmhcTyjj6hs93PpGdkks6hPujauIW7
	o9iukrGinN31nntqFc1b35r1DOYRN6TuhRHU1PXIcQCbbnyc7ogxE3u/9ByhlAo0c5eQerB9wxO
	x/jT1oVHMF13GiB5XW/eRogcxW5uwb4ScWl/ViHUUf2N9vYBZV8UG04k9wOMSCMrPXk/n/beIKV
	zr4NsOfSjZCi5kBYKwZrzGpP20mfgsJsXjWHU/gJG7HfSfONxU6qBJnsYzN2yLh4clqWaXpFB6j
	d868r2fzHKy8WTHfB9Z3bFCDJxajRU9UKl0nXJOGbuKjK8KyvN8b39MEg+/6oG9pwOt/3+ZhXTT
	yRaFCUQ8lngI0tnpeoODuV/RGiBX39EREz7cOebktAE2/YhA8oMn5l5K+Dwjp+J6wHstHx14yxl
	VsjRyG2FHAaHN54tUh5fL/p1pbgRG+lAuBYMyamMr0=
X-Received: by 2002:a05:600c:8b48:b0:49c:fff9:f684 with SMTP id 5b1f17b1804b1-49cfff9f6efmr275799555e9.21.1788966896538;
        Wed, 09 Sep 2026 08:14:56 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm483644155e9.0.2026.09.09.08.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:14:56 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Scott <mike.scott@oss.qualcomm.com>
Subject: [PATCH 1/2] phy: qcom: qmp-combo: do not decrement init_count on a forced init failure
Date: Wed,  9 Sep 2026 17:14:42 +0200
Message-ID: <20260909151443.10276-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909151443.10276-1-okerixx@gmail.com>
References: <20260909151443.10276-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qmp_combo_com_init() only takes a reference when it is not forced:

	if (!force && qmp->init_count++)
		return 0;

With force set, && short-circuits on !force and init_count++ is never
evaluated.  The error path decrements unconditionally, so a forced init
that fails drops a reference it never took and init_count goes negative.

init_count is a plain int, so the damage persists for the rest of the
boot.  qmp_combo_com_exit() then sees a non-zero value in

	if (!force && --qmp->init_count)
		return 0;

and returns early every time, so the clocks, resets and regulators are
never released; the runtime PM callbacks only bail on exactly zero, so
they keep touching hardware that may already be off.

Both callers that pass force are the typec_switch and typec_mux
callbacks, which tear the common block down and bring it back up on an
orientation or altmode change.

Only decrement the count when it was actually taken.

Fixes: 2851117f8f42 ("phy: qcom-qmp-combo: Introduce orientation switching")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index bf4d29fe1719..7d740ed0ce16 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4253,7 +4253,8 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 err_decrement_count:
-	qmp->init_count--;
+	if (!force)
+		qmp->init_count--;
 
 	return ret;
 }
-- 
2.55.0

