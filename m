Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB062503BF6;
	Mon,  5 Oct 2026 17:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220665; cv=none; b=CUbyMthToSGQ/YNniu7oJvUaW3f7AOXNICTn9fe0QnVru6xurS2XDYdjDQ5s7GOQgrx0/slrOwoiHvTvJhoS2WaAbZBaLTplrS5SngpWUVGCbDnUF7tFRqlLZarCZk+W0r2sAPm+cGEunE6k/Cmh86ghCXXIPs7XHqF0nHZq8Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220665; c=relaxed/simple;
	bh=wUtdl28khs+0I+Z5cNLNJYVNLp/g7ZTBDa8t2iBKs1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMBxzKdwMRXiCcERC5vKuumHVdI7kAu45P1EKw8xcNwlOTBEqJH+6Dii/6x5MDSkvADUSrU2OFcWbHpNTM0ALD3w3cS1VQp8BMZVZQzAnni2Vm23w1Wd2PRr/zxFUSgbSRZoCthBzKOW5EJHhT1ItLVZsK3nWwJqH+QDdZiaMqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzlvFKSX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzlvFKSX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B584E1F00899;
	Mon,  5 Oct 2026 17:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220663;
	bh=yykY9jN6PhqnD8o1Z/And/V1/szY5f5sRDUanGcMcRU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RzlvFKSXTS6wHWU6iDnDLk50ui8xWAHSyArdwZSfG9NrEper1SxowkxZJ+4CXWj+L
	 GzherKB3hv5XGz5KdCr40gKyRuTWjqjcsYuX3zqJTrl6OEnAyk8iAStN3P2skUEsoN
	 OzXRBbuMy2CHfqyEP4FB/uofVj+omZ+59retbDTTTx0P5TinViEC/GhLq/PPfLxFIU
	 n0emO+uTbsRbb37+Mq8DskQWHr0CbgRuR8vjmcTnGA4GRXluO8dD5xK1UOrQFLw8Zr
	 4PLKiQ7xgSR+FqfdVHDk0d8NJ8hYkrVoWIQMI3Si/LbOIx28stcFXaUKaQZfGTOREt
	 EHJfX7yo043QA==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:04 +0200
Subject: [PATCH 34/74] media: qcom: camss: vfe: Stop an output group once
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-34-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1203; i=bod@kernel.org;
 h=from:subject:message-id; bh=LolIAGKSIPU2rCi1LlY4JcGpJKkMsUqJ3GvXe9vNAdo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sZOhE3LxhPoObaPdU5mHckXAz76nrIhrNCC
 kmwolgwzXiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbGQAKCRAicTuzoY3I
 OgmtEAC1R54kHjFNnNR2yATNa7yE6u/LsnPYnYa+iVYHkp7jFD5e5xTP2uZP+jKMbKHJIavsCU4
 54i8W66b7HRa2Gr8UBHN0Sgb4Qe+yzsJhblUjMqNKEBMkurkUw/+8Yybb5Y9k6Wr1kDsenMj/vh
 Tf/OGSZbaYhNZbkBt33PbUwPZYENkcsrZ6HPuHmjFwvtrqFyIv6PqQZjT/9ZmpEJcn5oGQgAusn
 V9xcr9ziVS/ZCdoAH7u+XxLuA0qRIRLJR3IED+Sk5iOiKTTtjq+oTbPAAqvcfqWB4oHBNhbl9w2
 V2qe2ZV9/wgEpRO+YmsbfG35wk4d7oxsjbcgFgW2HnlOfUyOw7I1CFC5oGnrhJLuLhX7iplkOtI
 1r4+oKYEIsCqWNLcpJTKWA+RmyRuNlsuOWTi/SvdNc0R7KPn+4xKQNCWyOeiAercs8fH/LMosic
 0mVQ3cMWiMeuLJ+ngGcJhnHNStgvCwrm/1yUSDi7LX2FkC5zQZ4gIoUQLr0wu6rOGKB3mRuyxXJ
 byY6KR7A29MqTE1Xazo7ElgkRv6VP0XfeC71f7/V9d78ZbcEURiY1e9cYDXFcAAWhNfAm0NMn8Q
 LtaUHUL6U+o+sSv6FYSiuGvWmtXIhD7XYpSo5PQxUYWfom1ADjypYGdE34DXz6xYvUxF4Tw2wbi
 Bk42UQ6ZV9x5STw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

vfe_disable_output() calls vfe_output_stop() once per write master of
the output, but the output op stops all of the group's write masters
itself. Call it once, and loop over the write masters only for backends
without one.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index f7907287c8ed4..9793df66b4149 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -974,10 +974,10 @@ static int vfe_disable_output(struct vfe_line *line)
 	unsigned int i;
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
-	for (i = 0; i < output->wm_num; i++)
-		if (ops->vfe_output_stop)
-			ops->vfe_output_stop(vfe, output);
-		else
+	if (ops->vfe_output_stop)
+		ops->vfe_output_stop(vfe, output);
+	else
+		for (i = 0; i < output->wm_num; i++)
 			ops->vfe_wm_stop(vfe, output->wm[i].bus_client);
 	output->gen2.active_num = 0;
 	spin_unlock_irqrestore(&vfe->output_lock, flags);

-- 
2.55.0

