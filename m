Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218851;
	b=EL2MeAvxo5Lfvu5/Xf8/Th2Z/fF2BxemT5yj6m3lbE5kKG+BA6o+ywasgcs1pJCKbsdc
	 /3vdyyiCQZqZCGN4nLIQFrm0e9w2PaK3cGO+UbFJeBij5w2+QWZgdcUhUghG8GHswxnZk
	 K+AORLQcO7vrsdRia3sa68kLCMkOjqbL7X8OLpAelkGXLDxqinC63pbc5LO01hwiEiiRh
	 L0A2qh4P/geHg0yuEdHnfbF08OA3sxW0J1W79pSOVwG4uTh7e/wjDCghxzh6f5qjdEdQl
	 5m2npXoztAbUUFJa87qv5W9F6hfLhYC+TSs++zi5r0IY39xH7sZ0tObqPWc7Ub2zxGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218851;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=HU+qXfg6wycCYQniedMIEmjTS1Z2726jpgVHTUVK7ng=;
	b=m3qlryQGLfKEL7wmJRv6LpYJD0q8vlSo/QY0YxM1PGfciwP3k0YdlOhWKgNZ7rAbvcLP
	 60XPU9/YotnhJGG6/IyYusbZWty2cgLZNSBoOOUl9bX6KpPl3wdB0rpDkV10oSVp7uwwe
	 jcQ9epYzXUVkIQGk1tVoqq4fXP86xoSTXL1E0cP282pig7im1ID9bbq4MV7wyrC431vMK
	 LTQZyONJwZvFnY5OHn5QnQC6CKIGDldBYTxw4muMYxI9UJe31D0wHJ2TR559vDamgzcXF
	 2I03nFXQVFmXAujHIIolY+X4SWfLy3swMLwT5quy+9OjtkIuTYEHOpXq+xHz3Xmkn7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=CirN4+QV;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=EBN+KCVn;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EFB606A31C;
	Wed, 28 Oct 2026 20:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80EFB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=CirN4+QV;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=EBN+KCVn
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1793218844; bh=HU+qXfg6wycCYQniedMIEmj
	TS1Z2726jpgVHTUVK7ng=; b=CirN4+QV351ZyXu2HTuYKRSaqkmkEF2PHzX9UAQ6G6xouh/VPf
	W38u1VmBkC3hMDZoMGlxezDoPqqOdmPnATvE89DFcCPavvutr4kKdJuzw6GtCslSzfOJ4f9ELVW
	V8hhZRtEavbMeNwRL3k/y6mX2WexLUIYws9DwP8HgKUqXaOom4Vrq+Nf6lMUSMWFtSAC8FwOhVY
	yVYgHC2F2ZcOWR5+2THtIo5+4Ao+LoMzL4B6eJNdtKKFeiUucj2LUP4m0fie9JVvPkqJGJE644G
	SrF73tQCtKAH+xiU4+l7vOkPdPoroLWst/8uLajZXNyC/xyNsYKtbOiR8IsDrhkPdXg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1793218844; bh=HU+qXfg6wycCYQniedMIEmj
	TS1Z2726jpgVHTUVK7ng=; b=EBN+KCVnR1JtQjyLx1YCHgK8n87kTvLIhbrQbzuMLuQvIOGkzT
	ieva4F948/mbcdxK0LX/we00wk46Ji1vAXAg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 28 Oct 2026 21:20:41 +0100
Subject: [PATCH] soc: qcom: pd-mapper: Add support for SM6125
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261028-sm6125-pd-mapper-v1-1-af9a645b4b8a@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDtgBuPfVUoXaRx1BDVkqhTEu
 zfV5bd47wDlKKzQZgdE3kVlXRLMIwM/umVglC4ZKKfS5FSjzqUhi6HD2YXAEYueyfqGnC0qSFm
 I3Mv3Wj5ft3V7T+w//w+c5w/878OndAAAAA==
X-Change-ID: 20261028-sm6125-pd-mapper-4fe25c92a547
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793218843; l=1209;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=Z0hCoLpzXP7AJHenSbzeikQ5TFkrunfRaaLnnVerLOs=;
 b=+KV7hynXIA67RaOsf4PHf/Zx++NyOXPLTnB++nR3dPkXvJfjzGctARzjadtT857z48Syx4UYY
 4A3IdJvvjH2BDuh4SL0sg5rFHeqxykuEq1tWWHTHXwAnHggN+r/2+/C
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add support for the Qualcomm SM6125 SoC to the protection
domain mapper. SM6125 shares the same protection domain
configuration as SM6115.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 64ca99d7fad9..c1b7438541da 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -652,6 +652,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,sdm845", .data = sdm845_domains, },
 	{ .compatible = "qcom,sm4250", .data = sm6115_domains, },
 	{ .compatible = "qcom,sm6115", .data = sm6115_domains, },
+	{ .compatible = "qcom,sm6125", .data = sm6115_domains, },
 	{ .compatible = "qcom,sm6350", .data = sm6350_domains, },
 	{ .compatible = "qcom,sm7150", .data = sm7150_domains, },
 	{ .compatible = "qcom,sm7225", .data = sm6350_domains, },

---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20261028-sm6125-pd-mapper-4fe25c92a547

Best regards,
--  
Barnabás Czémán <barnabas.czeman@mainlining.org>
