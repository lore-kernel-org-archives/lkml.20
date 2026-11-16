Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814802;
	b=yH+qcx4OecAw1a5ZI9KztY8o3J0j5WF43zmx+/RYADTqs2sGt+ydVu8ZPyMGKBIA2Lfk
	 1zWsEL+TqIQF+Tm0JNquvuIYlQrZjdPjV2Sg3xx7x52yg6vwCy1xYEUbiemh6+UVL5MA+
	 IT0zeCpS9orif1vlfmnfoK/nc+WfDGNS/ogDaXZjVg3V8qYta7bDWtVzYkKlpP8OBI8EN
	 vsMKhO2QOvihGww7AjcRmW6E5fxF1c6NNC8bxFQLzIqy8jXK+oI+ES//IXc0rQ8+xsoBp
	 ZDn7ZzlxD6PcJYCzy8KMSzmA/Fg9VjfjuX6vKHAzzfPI+p9vmxlfkCPlAJWEj5Oj68A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814802;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=z6QUR+NwlJqRru+D5qV2ydy1n40ozGDA3J3wvWF95Pw=;
	b=DjTqxXv6zYz8/sR8cKUMUoxdUSUu/97/m+pSVHaTJqE+G51ltEe/AwNdI+8rk4/1tFv2
	 BcRxvVNu0T6jVM+T1VFp+mmnP0tz1xRVr3ueRaZVWCHxtqy8ou3Iesgpf/37cUd9pkozy
	 hbNIgZgYmUmtSChXEQb5YpRPs8BBN4KMDQ8foSGKnJuCtuzTZc8XszxsHe9nQ3OkNRduz
	 VtkN38cqFUhoTJQLU8vzImzeKFHg5ctsiBoNw2SsloCuhOob3U6NbnCgypWLB37iq+ZOT
	 Cq1VHVp3Zp3gRomYT4uswUC1N22pk+jNKYGgCOu6e6o32GGEdYaUOTFfk29sTgzaytw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oYg9tP5t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE165606A33F;
	Mon, 16 Nov 2026 07:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oYg9tP5t
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814801;
	b=YN8ZCwyIoK1CZmqL19/XndJgE0lU3Cq/uUNo+EMUi9Xefwn2+bJdXAO0NJBlMPNu0YQC
	 Zi4ewrTGkmu7k2aZhRBl5QP13XYamDVRounAa0d7k2F7qTp5bvTJsIAGBj/aBLkHedliX
	 eZSFKgXEW/Uqc1QaUmv2YSisiLc7d6EnYgNXylBRtUJlqM2wNsSNk1vJIW3wIkPSwFErm
	 jB9PTgjMP2wGqYhTQqOjP5yMtZm+mlGePGqvodp79kPRt+S5v5RJnAgzuJbqrEqRauyVl
	 lRCVFFmqweXJi7s57AsKDaYCBKnB0CVWaWhZwcTcrZfP4zxyWL7kk1Nuo76DB0CWuLg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814801;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=z6QUR+NwlJqRru+D5qV2ydy1n40ozGDA3J3wvWF95Pw=;
	b=hH39Haf3A1a4Ydw5d9hFJ9qXOaY3FeA02OfgIwyuZr1ocrF4DtEgcJYbH3pVTCDpAEh9
	 xF2FLZOfwE8DOb/q1/2+FI/XDaNFwWWVtmMRxIp2CvxxSV2S0LHj+MEb+bF0Gsy23gE3t
	 bN5L0ejAnZ7l92cm4nZyG5+n1xLYGCgwrUcStf/qdyvOzDyCooJDhyPFVgW7tF6OxjkAo
	 be0gaWNVq653Har3si0YL2O4D2X6VCky7FtuQHgmRGr4NH5AsIm4UURdjRiBe0oKpCwO0
	 mVLuxjBXoQnJ8RgE+wWcGyxTgP8K6kIG2AgjtvgkUSUyIEc7pJycBvg7njkGd8QTtdA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFDBA1F000CD;
	Mon, 16 Nov 2026 07:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814801;
	bh=z6QUR+NwlJqRru+D5qV2ydy1n40ozGDA3J3wvWF95Pw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oYg9tP5tsi5UKJv0LsLLDPtVMbnu7/1PFv8/m53ugfQHcB7R4aEuQsTE5FytuWB6V
	 dUVAoFYRpcPbqchHxQCOXGoVTYAw34O7RCdgaljC5JtIABSajQYCOLSHuiabSllHvU
	 bBoPn1cCdWw7qia2s0N/IfJU5NmSkTdTPCvC4gDb7He1iWCMl+SsSE0U7ONUoF8cJ0
	 KYARkl1hJn38+/mhOtBxrFiqDOgkDZcDBxtJwXtibK1sIP907sdAsEVFjelzwoHvEt
	 g9GoBrZLoTDEQ7BQaOCzqe9AdK43Gkr4Y5o6kN02TVpzNEML2kfY1iBpPwg+06v834
	 wPw9ZVxUsIQag==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5B8A34A37D;
	Mon, 16 Nov 2026 07:40:00 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 13:10:02 +0530
Subject: [PATCH v2 04/11] soc: qcom: ubwc: Add config for Molokai
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
Message-Id: <20261116-molokai-soc-v2-4-9dc4dddc4e96@yahoo.com>
References: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814798; l=1078;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=WP1Svqpj7tR2Cxdu5FZ65Nb5M45+JGuJ7myetv6wWDk=;
 b=jWrd2iS4Zx3skYnO2A11Fiueyr08Um9BuLJSQIjEiA5kdan9SpZGW9gLP0rRdg4XDEiWJeCO4
 FgKT21Q2NekAII7I7lmx2Q37AlYyc9gS4nQt1HQbwCUcGVl5WT86UAs
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Molokai (SM8845) uses UBWC 6.0 with a highest bank bit of 16, like
Kaanapali. Without an entry, the display subsystem fails to probe on
Molokai based devices.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 456995699fdb..7c1166c68551 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -130,6 +130,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,maili", .data = &ubwc_7_0_hbb16, },
 	{ .compatible = "qcom,milos", .data = &milos_data },
+	{ .compatible = "qcom,molokai", .data = &ubwc_6_0_hbb16 },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

-- 
2.56.1


