Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCA1502D4F;
	Mon,  5 Oct 2026 17:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220661; cv=none; b=W/LnZNz0FTGuTwEIU87tcmqXmFunukCLOEUzVS3Rwis8qmBRPPdLzz+/a8ZLFTeuxFI/J//K7Ip3Htw7IUFMwmME+WLjoMdIVprfwDme2YyHWSMk/r1kcgXdggTvGj85HFdkoWAgbc88rCl3fCbtwM71yucJ3X7L8Hlw8bjl9sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220661; c=relaxed/simple;
	bh=tZIxlDjNw6l3MRn2Lqz4AemzqxVTKOk5PddIewZVj2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b49ChkGKyJ2DLDk2I3/iQEmdvzj+y8J8jVOOULnMHRDiZ31tk2Zl2MCmXUefNomwMTypL5fR4IyHwXlzvOxI9iUMqJKUu+YwZkInGDrn0DC9fq55yd7IE1+4OvQjEjkWrW+gUNuGueDNwSE4PDWBqMcX42edeQn460b4LjH/33k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Og1IJ1Qf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Og1IJ1Qf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431831F00898;
	Mon,  5 Oct 2026 17:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220660;
	bh=mUGJit4NGFOCX/gRlLnj7Qx+ngU2dmR+OY1BemaQ2Rc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Og1IJ1QfgSQHuSW+fLGnnpGfk34nPELTPMGF5yUIY3yQf19ALnJ5vA2A+QzBN8mWv
	 YY2OWuGkEM+Twm9zdc/fkKxdFUHy9r3f6cHaVQamAj6goL2xZg4mAHLXQCX7lRxWEU
	 MzG50lsS24kO9TW3W+Kcy36TOxDSA0ljR2mKy12HwOQTL+05ld0/NWEQUMjduHWQQ4
	 A3dx+ZpoP/QteHVnxAeilG1K+3Y3bKNkF/IHSMfFkt9mEG5nKQqwnSmTIMS/NGRvKg
	 VpD7R0gXBouowlUOdVZdJRd0gIwqk56wPBSQDKTdyJRDFK0molvwxurJ8ILxkAg0un
	 TudeSn+6/xzog==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:14:03 +0200
Subject: [PATCH 33/74] media: qcom: camss: vfe: Add support for stopping
 outputs which contain multiple write masters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-33-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=bod@kernel.org;
 h=from:subject:message-id; bh=tZIxlDjNw6l3MRn2Lqz4AemzqxVTKOk5PddIewZVj2M=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sYIEKW4S+biLLFuomuZFZEDH3niRbyjYyC1
 jbloWkgxa6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbGAAKCRAicTuzoY3I
 OrpQD/9Y9MFkjW7XYMIxn8wh2lWoyTwSb0TsXPn4VmThza7WD4MVM0m6jniG8+u9UedITPRlUEt
 G2C0khtAhMr4VQiZMqlooJighjsRrPwH8wjGc3pLEivtS/ujb+cPfLDpavOpBzcmRrf3mZrb8vq
 kJ0TMnnKHagW0tgxUokuBYIO8ky7zug0CZ+ZfA88Z+D2Wd45ClL7tAU+Gi6bKX6um1YKuTS32Gr
 o2JQS/iJhoXnl/6aG89jk49d08ZxUXWkRp32ix/R1h4sa3FZ06ec6hnKCtf9Psi0NAGmSVqtq+v
 9iTI/Xd33FDVwHiISg1/IvRuzresS5vo/k88b7LBR7WpJ2ttn3zGJUjvvWK44+CRpuDqKIJJYdu
 aF9b8CFWYruFLxoMQL/JupeQBPUum1kOJ1OIfvsAvc8vucndBf7rRvTPyB6Fi2p2J4RvPWdWeTC
 mK3scilBgrE4RkHIE71Pv6gE5MiOeWktEmixp5sui9pN+UhLfB9rs3wnDJiUQnOv3xAeeArV6eR
 biJs8EgBJZMc2NiM176Btn1uUCAfJeU1YPH/dlv+14JNlS+6KIW5LVz0U/vg6cC3vtmBDVIWM5j
 ZAyIN1fG25+N2IVeOQC4iKHZ/36qc5Yb3UwPEmhpXTxhc6+l6Mq3jf4A61NBWX876AhgfQm1Jzb
 LR0k/eVFyxsBWfw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 23c86e08776ea..f7907287c8ed4 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -968,13 +968,17 @@ int vfe_put_output(struct vfe_line *line)
 static int vfe_disable_output(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
+	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
 	struct vfe_output *output = &line->output[0];
 	unsigned long flags;
 	unsigned int i;
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 	for (i = 0; i < output->wm_num; i++)
-		vfe->res->hw_ops->vfe_wm_stop(vfe, output->wm[i].bus_client);
+		if (ops->vfe_output_stop)
+			ops->vfe_output_stop(vfe, output);
+		else
+			ops->vfe_wm_stop(vfe, output->wm[i].bus_client);
 	output->gen2.active_num = 0;
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 

-- 
2.55.0

