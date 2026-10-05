Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDC14FB9BE;
	Mon,  5 Oct 2026 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220644; cv=none; b=jSg3fNv5eIDkQgU7mOM19ZsOtP28nfR5uKvtMvPJfIUwARcuKDGM2NM6HO14DDtiTxTsT4HzO/EbM+tn7s/F2WLwREuZkIScLmjqJhCcDZvrIF6E2gZHIX3ekZ54429AsBmtSl7M9syJ9RiUZHy+C1i8CcZJNpSwQAvLvKie0ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220644; c=relaxed/simple;
	bh=o8MxbL/JbQtl/WqKdtj+rtSFA5b49H5FzjutT+jslDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aQyAqZwwhWrThAUeXHBHP0D/ijmC4g9Xf8Bth22pHnNEqg+2gLBMFtRDV0fnYK7ehSPlo8GFtOyvHI4CpXu0AZ2Wj+BtTigLjsWaC5kVGVsk0b5V+TVd6T2SkLsaacn9T0Ks1iKbiiFfLkHeeGoqp1xAjZ/q/zTZntmiBeeVkCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezYuxjMr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezYuxjMr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE461F00893;
	Mon,  5 Oct 2026 17:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220642;
	bh=KoOFUHy0lDq9FrBA5DtLkwBr9stg9yB3HzObl0sOqQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ezYuxjMrSoFyuUBTLBbItfourQctXOJEITIz47xpqIpasst61uU+4tNCkurP+hn2C
	 pKU8ioEIhRkCs+V0rMYKV//5TGk8+q8LqycrCjmteQegwxrwxvde9ivXHsVw1mkoCf
	 K6/KTzyaBqlB73infGPAk+O1rSBHZj/j0i40AKdTxa5Ok3IciOMOYqc8awONePrO+c
	 rk7OQXjNVX/5GlbIhWuZPkr1ndYzHaHOcUyH9HPhc/0c5pkdViGPNK0ENUFrBeGwu6
	 4ZCNJA4VLZZ+y8o9KuRIr+tuHi2YRrkS9o27m+qB5s5HsjM32wvzDsYQ+APBgolzdk
	 FKL0knwWoidIA==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:58 +0200
Subject: [PATCH 28/74] media: qcom: camss: vfe: Add planes identifier to
 struct wm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-28-ed985aefd611@kernel.org>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, 
 Robert Foss <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=661; i=bod@kernel.org;
 h=from:subject:message-id; bh=o8MxbL/JbQtl/WqKdtj+rtSFA5b49H5FzjutT+jslDg=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sUqIFB+FlVXYGXZUye9MA59sptq3XxNww/a
 oYT5Z6p822JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbFAAKCRAicTuzoY3I
 OntnD/49bpGrppH/h8Fzp1T1qn0VJYPc+GVlr7iM+mvjDgJLuh98/b7JVcVY/WDQb4g3KdJlr77
 aUYfZuTWZbr6hktw4p6KlzeTK/aV94OydtEwP7jo8nISnMElBvX1k/e2CMzCGC7CcVdvsrQS9OT
 muyXQkzoK2qV5rvS2wXAU+9x8rhlFK1Yi9gsrZfpioiDPn/06qiChgOyGnBQrEVhSF6jR4e5lo9
 JZvxSfffBc2gC6fGZBDtrRILf/qipGKvVDKlULN38QLowruGlgi0IlRUuYx0pwtKlrtzgQ8+avL
 QRs0E2FKeBU/amhO9TCQtsm6VPi2cuOrxob4in0324NC4uKWrTIFdjJGUog60eYSjLNZc5UoE0c
 /lEmJDdOTna+0FSQ7FzQGdr23+Pc9G383rA01uOcF/oIRztusKR/ao+yyHjet0xwlR66FpXbazy
 ChyOY/Gezpn31Z/h5ecIEFGNwInwMUCjRY4m/q0FCaTer8NV+VSwQcc1gWYoMHDQR6IrSw/+Qxs
 iam8EFGRUCBB6ZFglw7CExT2LLzBvSjF8bs7v7uNJn/6/QKSQgrE8ljyNaB1spEPMv7GyYzOv2o
 7PtvW8GmRJEQKodfUMODTS8EoEc3DQZM+irAvVYI/0YRHx7w2kocBlP/DxmCZOUREnUwsoW0B9m
 HdzXloZfh3m2kuA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Define the number of planes a given IFE write master will write as a
data-field in the WM structure.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index bf8dccf4c901e..8bc07fe7798e1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -101,6 +101,7 @@ enum vfe_v3_comp_group {
 
 struct vfe_wm {
 	u8 bus_client;
+	u8 plane;
 };
 
 #define VFE_MAX_WM_PER_OUTPUT 3

-- 
2.55.0

