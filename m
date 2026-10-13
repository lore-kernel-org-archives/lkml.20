Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9613F412B;
	Tue, 13 Oct 2026 14:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902477; cv=none; b=CbF4VF0ZP3r1mtjSkSn9RW9vIu4dnmwiWLevO5AirdQ7qqhM0Y8GWo58bVOzzfcFeubQd4kq65j7e9OF4akwzcYYzGP4gbHWsK3YwrCqd2yNKZwSuojkshao11I81YLeLJ593nU+t7esT+LYGXuKRNM2h0B8uyvTbgBXjLF4f28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902477; c=relaxed/simple;
	bh=27TSi0nLOz0LvyRq/j35tTEP2Khi9Pc00fz3GBL2r+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OlF7vpfcaMukTPWdybtlvJA/3uXAZvKHK6Rcp0Fz3wvyzsWSfhTrjl4qAKg2+BgPRZgzLTnIukkJW8lcis3ZW9CqWJ+iOmp7AFjlY4jKm8QzlENWb4H9jztaMS7ZvYMvfnmOcuH6Xi6pgumeycasVCxNawKgLP4FhTNV3z4XhZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwoXsJnS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwoXsJnS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3FAEC2BCFF;
	Tue, 13 Oct 2026 14:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791902476;
	bh=27TSi0nLOz0LvyRq/j35tTEP2Khi9Pc00fz3GBL2r+M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nwoXsJnSos3CWhHwDX5oKl0jOwj7AhIu5EKzLhir+FkkDy3WrXXpRCFXYIFlhHVpJ
	 NO+WNXfXD/6UNjnSbVlukPmgacN0CjDnfN6KsMxhkxJSrzFv3SCm+HfS+zMtqvDtnO
	 8u/9YP+xaqjTcJyD/GLbHjyiq5a9S36luN6JkH+3FO2AHpkDwovPi3d4dqtm1Uqtvh
	 ii1WUEoe9oXAOwXR4B7NhF23VOwhUNLwjI/WV7ZOgXq1INcp7hICBYeOBpxe2uSnbL
	 q1lehpNyeCYyCO1iPb1PBAt0DlyxOtZ4mixOcSnHnZxG3YANQzgUS5ouP92QHV3BHi
	 PTvvMbhN/Tf+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB18CC6B08;
	Tue, 13 Oct 2026 14:41:16 +0000 (UTC)
From: Juerg Haefliger via B4 Relay <devnull+juerg.haefliger.canonical.com@kernel.org>
Date: Tue, 13 Oct 2026 16:40:58 +0200
Subject: [PATCH 3/3] firmware: qcom: scm: Allow QSEECOM for HP EliteBook 6
 G1q
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-add-elitebook-6-dts-v1-3-f22e67fc7f9d@canonical.com>
References: <20261013-add-elitebook-6-dts-v1-0-f22e67fc7f9d@canonical.com>
In-Reply-To: <20261013-add-elitebook-6-dts-v1-0-f22e67fc7f9d@canonical.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Juerg Haefliger <juerg.haefliger@canonical.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=881;
 i=juerg.haefliger@canonical.com; s=F9F8B48C; h=from:subject:message-id;
 bh=KYbEVq00guskfIjy0MSjHHL2QSUlUedgJpB8ExE0VPs=;
 b=owEBbQKS/ZANAwAKAQ/TiwkLpkK3AcsmYgBqzkMKYh6PXrlTRmQda7nhBHwbiNm0NELmVwkPx
 g+TLwPQ6HGJAjMEAAEKAB0WIQSFl9T3oi6mu+It14sP04sJC6ZCtwUCas5DCgAKCRAP04sJC6ZC
 tw9MD/wOPWrwtaXGmBEAp8LlDKGpT943O94e/jSUYCK0StG015uJUd57f+yc1xRgYPQXlsz8fCM
 ebLI7LYRDRhO2iIzKUSabZlVyhX7Gr4voFEDrjdWHOU9ekm6khsTeQ52tm7D9YWzggfbz1gqHhm
 8gLZ1kfRK8liwFXqoI7Om0pqTCwCN3kvKPbRgdp2vFGDlIF+iD1BQxqr6DOurA4wXDaex+VqZI9
 fc70BOXiD2rjcXqUpcNpzBbG0b4LN5OJ48gZqy85E+7HrSslxuUNseE+dw41hqFbha1Rx36gsIR
 u957GAKbpGMwBHDjCM+lbr1LhYw/X0FT/KF5ljSFtqxFqdZG7jLGWtNfB7RrKf+kpTJ2w3gIF0f
 LsfEPHyof52AX5T0uq8eVlfvSdlktzaa4GtJRQuteAp9Zqa4Ie4vY4y+4GJLI4zkk3QfnlomyMy
 IwLSIPs35uP3JiwpxVKnsE/gh+hLUH/eGaQ/nXsdIUZtIUEk9/oVaRsn5eZ3mubSgX+9ZaDupCw
 ou34Oh+HNNPFfBBN9P9jDpqBhp7fZ71EqdXRt1UarTECFHmP95NNHRFyhdmDA+P9eWPpQFbWWCC
 l5kWtmkkwiVWHg6VxO8dH7omH8ozRLz/6s7I0vKK9kwa+At13vpOD54YUGbKwQex/HjSvQC0l3u
 eY0sg4Fdr7jaSPg==
X-Developer-Key: i=juerg.haefliger@canonical.com; a=openpgp;
 fpr=52B5BDD2A6EDC76A0FE0AB4A754C3A96F9F8B48C
X-Endpoint-Received: by B4 Relay for juerg.haefliger@canonical.com/F9F8B48C
 with auth_id=1135
X-Original-From: Juerg Haefliger <juerg.haefliger@canonical.com>
Reply-To: juerg.haefliger@canonical.com

From: Juerg Haefliger <juerg.haefliger@canonical.com>

Add HP EliteBook 6 G1q to the QSEECOM allowlist for enabling access to
efivars and uefi bootloader.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..da809c707510 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2236,6 +2236,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "ecs,liva-qc710" },
 	{ .compatible = "honor,magicbook-art-14-snapdragon" },
+	{ .compatible = "hp,elitebook-6-g1q" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,elitebook-x-g2q" },
 	{ .compatible = "hp,omnibook-x14" },

-- 
2.53.0


