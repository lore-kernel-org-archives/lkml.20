Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794479471;
	b=48fzZmXcqCFnEIzNWy8AmnEiKrxzKR6IMl9VC6/8PDZQKubghDD2iqZ3HYebYj141XjO
	 xrEfPI9h/ooQb8WoFmGublBxOdXz715wOQhJLIzJsibxmrz3WKcs1mVc4EUp0gNn0fB2w
	 1v4NshFlKSJDBcdZxRfzrpolAfC8hDYOS5djPoFDB09LLSffumGCJrtbpFGqPB3EdMULi
	 c56w7YvlkELnaP8CK2H4OoHMNbWW/knQJHrw+rFkKGAwqyEowUq5n2LLThcmYwdFvPt0v
	 +9/rRVkOEKxoEMKhnwA7vy6qCFT5BWju0GuzLsSGG2+bjlSN1POXTQ5jLFNJYl4xwgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479471;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=4KfdMUr0bPwc8VtvxyNDRh1IINHwENqdzjn1PxpkJbg=;
	b=PdjZljefCCOsbrqKiOl2JtO4Mnc0WA3BabNbPSmKaTGaAgi3sPvKPqg3Xlq37/+ARk4x
	 OJc0RqDFynoxvGVtuz6U7LXDEfMbtsL3cWTyJHNGQZ+A+i+ioU5Ca4Mp8lrHxljQU0Lyc
	 7lNgfYFS3KD92vCC/6DD8QNlfCOXWjKvtUXlKpe9muGBQZCWc3GpDembY9ZGhQstRsEIL
	 fhr3jiXcQp2Ea5utHbcMN+/9gRgeCQt6ubi9hYdOBiwuX3L84a+MNsqRTrSpnWmWH+Qcu
	 6K9/Np60q3KoMXuDTMfJNEnEF5IGM/q+IoKFfy3MqHcmdXsgqJzXWCCKAVd/Mi6xfvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=inferno0230.in;
	spf=pass smtp.mailfrom=inferno0230.in;
	dkim=pass header.d=inferno0230.in header.i=@inferno0230.in header.a=rsa-sha256 header.s=zmail header.b="J0DO80/q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.53
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DF4606A32A;
	Thu, 12 Nov 2026 10:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21DF4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inferno0230.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inferno0230.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inferno0230.in header.i=@inferno0230.in header.a=rsa-sha256 header.s=zmail header.b=J0DO80/q
ARC-Seal: i=1; a=rsa-sha256; t=1794479448; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=cPHA9vSDBeTRqTKA7vWgM32BII7MKoaqrVNHNbWQeMNz3qM3/jfG5LlmffjWbZJGkU+NUK1inYiTnucis6sGuPZ9jEpHd+lagdIKsTeoa+u9xIx34YuUNTCV7WqsyjGOpAb3BCJ31dOjKNXsijpqbPoOaLRkWJoq8UqnFvUGAvg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1794479448; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4KfdMUr0bPwc8VtvxyNDRh1IINHwENqdzjn1PxpkJbg=; 
	b=BChv+R/sO2JKe3r6iusNzUmYsWW/VBY3Knnbr9/wRl4sxReppZqDnuH3aYQm2Bncws9UVNrDJNPL+mr41F6mEcfgOlHNR7J0zeZsbtF4KCl5Fzslhed4hF9W2k9OQuHMZl47R7xPzzf27cg6BR4GtQNpoztRe04/6w4xOmNuP64=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=inferno0230.in;
	spf=pass  smtp.mailfrom=mail@inferno0230.in;
	dmarc=pass header.from=<mail@inferno0230.in>
DKIM-Signature: a=rsa-sha256; b=J0DO80/quyqTyyQvf3oAmqF/CTPnt2gGZQ2MScDorBRLESlkZZMUdeHXqAKCfItR1O2MALOvENh5bULC/8CUr82ykmKGb58wuNNHCoIOGYgJTjL7D4EzppGcnRcKX1c2OkyBEypFF1CKfcAVwCc/ZBtV6cnFDCEXZWQ+ZXS7rhQ=; c=relaxed/relaxed; s=zmail; d=inferno0230.in; v=1; bh=4KfdMUr0bPwc8VtvxyNDRh1IINHwENqdzjn1PxpkJbg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.in with SMTPS id 1794479446828880.9676755061306;
	Thu, 12 Nov 2026 16:00:46 +0530 (IST)
From: Aditya Choudhury <mail@inferno0230.in>
Date: Thu, 12 Nov 2026 10:30:27 +0000
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for SM7550
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-sm7550-soc-id-v1-v1-2-57299906d81a@inferno0230.in>
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
In-Reply-To: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aditya Choudhury <mail@inferno0230.in>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

Add the SoC ID table entry for SM7550.

Signed-off-by: Aditya Choudhury <mail@inferno0230.in>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 68148defb508..35a9a98f39bd 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -524,6 +524,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ5302) },
 	{ qcom_board_id(QCS8550) },
 	{ qcom_board_id(QCM8550) },
+	{ qcom_board_id(SM7550) },
 	{ qcom_board_id(SM8750)  },
 	{ qcom_board_id(IPQ5300) },
 	{ qcom_board_id(SM7635) },

-- 
2.56.0

