Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE425012A4;
	Mon,  5 Oct 2026 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220658; cv=none; b=sJrdpyqG85dkQ1yvkBCrq8y1/OXMsxmCFPg+wlq1J6kj2Seb3TxzOkLoPp0UuKXnFpi6/Y3Gf5CcEkd+RYqxoI2W9pmQhiTDD2PiSxhgd345t5IO/HTkzI9zslRDQ18ucxKoD6kra2V8O+FHM93X9+9OaMWrLlcjVwhXFRXOsPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220658; c=relaxed/simple;
	bh=3LKbZzJvMlkyZ6XIb70OrMyiPpk2LCkQWOFdBhGInU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qsNhlR/LedEkEqfjTy8/+QZCPX66e3xPtKk7NIAdZR18Y7kUarU+ips6okRBxjDFqG9hXO3Y5JXLSwvGKZcbQiJy4iKXZlovxpxn0Oe31QgVf5YFy2PO2u+1D4E8gXpBQ0Nx35A5oVKuWVneESpk1JQHz5zyFP/QvWn7p/TqRGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwkT7LCT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwkT7LCT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AD71F00893;
	Mon,  5 Oct 2026 17:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220656;
	bh=aeomxX1QGtnD3U5IUgaJbh5Zhqt+z2pbZDdGXbfDXRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UwkT7LCTVUXfJhH43HPqKId5zK69xhvwuY1IFOt3XkICp90qcmBroaksEY2fiuPM1
	 6DtyuVMMQaykwjBO9HpmrKJuEXwhuvJgEpymBcTUKe1WaUFSr+rfRLVkr1n/bAE47o
	 3StmjNVVgimSNWeOF1d+tNSFFaDH8UoaYLgy/Fm3+B8fv5RivCnCVW0gn0xFPfTZ+s
	 nR0YfyhdfQt+BmI4DnVYtT3LTvxEEnGhqXm9QWYQFz1hYlq0uWWfIXyxrsEO7HE6Hg
	 9NuFWluSzwQXDfjiooD9TyuQM9HkJ8wykOcF87gQThHTOCG+mcqBpFZ53HAJySsZJ5
	 p31o/0aZk4LCg==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:02 +0200
Subject: [PATCH 32/74] media: qcom: camss: vfe: Update an output group's
 write masters on buffer done
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-32-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=bod@kernel.org;
 h=from:subject:message-id; bh=SKwvb3ZPmeegr2BsX2YLuxpYjLjRVFd0XaOCBdgz2vU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sXy7v0c+M+K3qckDWm/sWoZI84d/fTbeYJE
 f1bphGtmN6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbFwAKCRAicTuzoY3I
 OgM/D/9Em9DvYlKsvSyrHWr9ilbdZgFbvTH4BLlUS5bGHAIGt7e+RMIfgmidMw52R96FA5IM2KT
 xMqEeXRc7gL8zXgn34SxI8oTal5iYM6UitCGA2ipeGgNEwmI5MtEGlqvOHNDJVWLXRcKDYS8CbP
 u6pOFRSnSPAnxy3ixAuHpLQv1wSfPEZsxxrpDavaAToIzH7IbwRC/iltOi7bBg4TRTo/cr3Cz6b
 Z/8a1bF6so56Iq7qvGh0f8s2VuFbwrQkGnz4toYr0jxV5I2EzCbUf5pfn4j9/qVjRJLm9D3DFhP
 /Nq79RZIeoA8SPQg4n4wTf/eN0WEUqm3AtqwYno93gVPx5NhZRPMBguuzOWkhkOlXN59Y2xwf6/
 PRCgf8qh9goqPkSQSfz1HDwOUwO/ceKVjnriHUqQBt73F1y5D3qD2UNku7ptKpyMdYUkWXXyHtW
 YVWcLL5YzwwEj5nia0YVvoJLQa+LNng2/HeS9MSNbcb8VVnoyUHW1mHqy71LxBvcY1sKherP2K0
 /sFEaRj8ludGjvhX2eElTWMwZd9hwvWtguIBfDadacfcCHI61kxJaKeTl865TSvHLRCzfezMXnj
 tQLDga/yvTKWj14Fh96uhRz5DUer37drfwwtO2hg4wZaA7hwoUZKTEKws7mExWIqb9kBp7cQGmg
 w0gFy32YEPXp3eA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

vfe_buf_done() hands the next buffer to the write master directly with
vfe_wm_update(), so an output group never sees it. Hand it to
vfe_output_update() when the backend provides one, as starting the
output and queuing a buffer already do.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 20d8b3e1e4459..23c86e08776ea 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -624,9 +624,12 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 	output->buf[index] = vfe_buf_get_pending(output);
 
 	if (output->buf[index]) {
-		ops->vfe_wm_update(vfe, output->wm[0].bus_client,
-				   output->buf[index]->addr[0],
-				   line);
+		if (ops->vfe_output_update)
+			ops->vfe_output_update(vfe, output, output->buf[index]);
+		else
+			ops->vfe_wm_update(vfe, output->wm[0].bus_client,
+					   output->buf[index]->addr[0],
+					   line);
 		ops->reg_update(vfe, line->id);
 	} else {
 		output->gen2.active_num--;

-- 
2.55.0

