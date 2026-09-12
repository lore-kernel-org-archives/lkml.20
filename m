Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E3247B42F;
	Sat, 12 Sep 2026 16:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789229549; cv=none; b=YiOpZaU+HP3XbyeMA5ib1P+R0ZLtfP53mcH2Ghq6g6LnNpEsCgHKgaof8lWy63aP9MhXPKeJs8H1hOE53lDE21Hrh6o8mD4lO/Gc1wo/CNJQ12rGmsu09Y0GVK8wLtxoc8l2+S2V+PoDPgfHGh25gMuGUqMJUV8olbhd7U3i5y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789229549; c=relaxed/simple;
	bh=zk19l8ef2t9JFQnK+eWAGlSj5kE5UIz7oNKYU9CfXRM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cRXw+Uj0yNXTOCTbCFcVWuezOprSA3qctINMskrGwfZGkXpH6tb8XVH8EcFSd234e7x7qc1klThxa3EU0IMfHMeY8FYWkR2ZhWOTRDAtqRkgqZJYKtfaoXVItugQMA8HseWqMPeWvQNgD4BlkeSqS/q4sqCcTLiQgO5ZSS5rK/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn; spf=pass smtp.mailfrom=tju.edu.cn; dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b=cIytBO0j; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b="cIytBO0j"
Received: from tju.edu.cn (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [183.242.150.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d867e24a;
	Sun, 13 Sep 2026 00:12:13 +0800 (GMT+08:00)
From: Yibo Tan <lhfff@tju.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] soc: qcom: pmic_pdcharger_ulog: prevent work requeue during remove
Date: Sun, 13 Sep 2026 00:12:10 +0800
Message-Id: <20260912161210.1683266-1-lhfff@tju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa096640a8f03a1kunm0f5d962121d6c8
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkMdVh1NTx0dQhlPTklPTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSU9JVUpOS1VCWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=cIytBO0j/iHRYYOOdMAdbsu2uOvYi55QjsK1Z3WeJfffRYyDuHRfoAdzRqZGhHWeVdCT+1kI3eiZ/5o7AYJIWKgCp7LIddmqW461uppjJ0xFo+pUZr+gSjlqOcNtUzTvevpe4RJB6e11ZWuZvh6lPBhIxlZughRl/UXWvw9xcVg=; c=relaxed/relaxed; s=default; d=tju.edu.cn; v=1;
	bh=d91C1al67b2L/hoNOOlGyT4FH5684EndnPjPgy9Ety0=;
	h=date:mime-version:subject:message-id:from;

pmic_pdcharger_ulog_rpmsg_remove() cancels the delayed worker while the
RPMsg endpoint can still deliver callbacks. The RPMsg core invokes the
driver remove callback before destroying the endpoint, so a response
callback can run after cancel_delayed_work_sync() returns and queue the
worker again.

Device cleanup then frees the devm-allocated pmic_pdcharger_ulog while the
requeued delayed work still embeds and dereferences that object. KASAN
reports a slab-use-after-free in pmic_pdcharger_ulog_work().

Use disable_delayed_work_sync() to drain the worker and reject queue
attempts that race with removal.

The issue was reproduced in four of four runs with the real target driver,
RPMsg bus removal, endpoint teardown, workqueue code and devres cleanup.
The test provider delivered a valid response in the window between the
driver remove callback and endpoint destruction. With this change, the
same late callback occurred in four of four runs without a KASAN report,
warning, Oops or panic.

The reproducer uses a test RPMsg provider to control the teardown timing.
No unprivileged trigger or physical Qualcomm-device result is claimed.

Fixes: 086fdb48bc65 ("soc: qcom: add ADSP PDCharger ULOG driver")
Assisted-by: Codex:GPT-5
Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>
---
 drivers/soc/qcom/pmic_pdcharger_ulog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_pdcharger_ulog.c b/drivers/soc/qcom/pmic_pdcharger_ulog.c
index 39f412bbf2c1..06cd9c4411c2 100644
--- a/drivers/soc/qcom/pmic_pdcharger_ulog.c
+++ b/drivers/soc/qcom/pmic_pdcharger_ulog.c
@@ -143,7 +143,7 @@ static void pmic_pdcharger_ulog_rpmsg_remove(struct rpmsg_device *rpdev)
 {
 	struct pmic_pdcharger_ulog *pg = dev_get_drvdata(&rpdev->dev);
 
-	cancel_delayed_work_sync(&pg->ulog_work);
+	disable_delayed_work_sync(&pg->ulog_work);
 }
 
 static const struct rpmsg_device_id pmic_pdcharger_ulog_rpmsg_id_match[] = {
-- 
2.39.5

