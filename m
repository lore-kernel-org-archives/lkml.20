Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8193021A42D;
	Sun,  6 Sep 2026 12:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788697367; cv=none; b=XU6bjLtQBdw08vhyO7zmsN2Sh+t80hJazGmz0zJ13CISzyVQnFvON0SKVp9m1r2zo5qvWDyuiQyvP/xCGr0JCVrDaHDz0VHXAMcK5HOUgKn8jujLUEX0ZVgdhkJ5Y/NJ2xT+mZn8fdqbUTtL9QKdKl8X2BhtTWnx9d/9MjFFjAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788697367; c=relaxed/simple;
	bh=rirg4RbJMaNw/xyRM9MWShgHab1xsYrkfVgbAiLL/MA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Btw5wq2GZScgo3UcCxYHz32PjMBVgbh3Anf3zxivURvY0CFgX9LqytKqtpinBEtMOZ9aU+HSF8n2Yabzl0THpwyo6/QyYSL4PSv2WNxSAFdVN91HMz5tVFfy3pBY5KBkpiUjwP9PEaMFR1+Pyob+QWQAVUyDLuhBZhTsTCYzHPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0b8Jv4A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0b8Jv4A"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36304C2BD00;
	Sun,  6 Sep 2026 12:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788697367;
	bh=rirg4RbJMaNw/xyRM9MWShgHab1xsYrkfVgbAiLL/MA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V0b8Jv4AiU1oYE8Gs1qfpvJR/gHRXWeCOWaI96q+HkziBZl/x7jQGYroq5ZzH9OE+
	 MmECrU2pC+Tz7Foglo6MN3WgQbyPqs5eM/F3S8QT7UMGV+d7lzrkAbXPirruTsfGCP
	 jmAL1Rw4wT4ty04DJzNT9VW/WunoXY2z1yUp7gvHOKsBKGJThnyjKCxKH/iU34twqx
	 LidKP4QUoee2wiEnAJ0CUcwRXGaFmHXMmGriXoq2KbM8Iccojd+RPRALNiQM1BPeOE
	 V0+vS2wqwC+dDvJqL2qAKVZoW5qR1FOT8QtLZjlcSOhDz9Xj/7UJRpMMI1vOSrGExH
	 fuaV0fMmcBjmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18570C79F85;
	Sun,  6 Sep 2026 12:22:47 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 06 Sep 2026 14:22:37 +0200
Subject: [PATCH 2/3] firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaPad 5
 models
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1-ideapad-slim5x-v1-2-7ccffbe6bc4a@oldschoolsolutions.biz>
References: <20260906-x1-ideapad-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz>
In-Reply-To: <20260906-x1-ideapad-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788697362; l=1000;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=HV6obzoJQYZkI0vGnV/Lh7ePRT9GR5xSbdXa52p1wu8=;
 b=m8Z7Cyp6fYI2Nz1xWm0aPrBchpnVZQtFM57i7sZxvzH+cAvvFggOq8flWa/8r9xgbzMUIK38J
 4lU2AlvjMfhA8PJfCFNiQBSDEhWMwAyBqqUlz02y8GLBHKdcaYedzsn
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

QSEECOM is required for EFI variables on these machines. Match
the generic "lenovo,ideapad-5" fallback so both the LCD and
OLED IdeaPad Slim 5x 14Q8X9 device trees are covered without
duplicating allowlist entries.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 882d1865f3a4a..a5f19c5dc089c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2231,6 +2231,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,ideacentre-mini-01q8x10" },
+	{ .compatible = "lenovo,ideapad-5" },
 	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },

-- 
2.53.0


