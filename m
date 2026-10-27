Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793117743;
	b=NPYGo1VkzbV4TrZ4vymtJDndi+OW35mkP47djHEpYrKdnIWCN64KAjY4xzvlcYmETzGl
	 wAnKKInk+W1ZETPdesdfWe80Joooc0SmSC2YTUwV4QRBSc8AHlS4xy/RvKNM8tMRW8LbR
	 fVOqXVGWtHaNRkLIJg88FV2Ag8Pm8Gv+qBVGYSd4wmhAc2BZwXlqV/PiCcceeGf67Uxqm
	 qSMoE9vJ5/y346bBQdN7RlVkRRdR+oevRuZxp4sue5CC5HEoJ+8w+8PhJ/NyMsaVbAg/G
	 iA8+q0DP5LEqYDIC1koD/IcsTfWtQo0nSJjBITlldEQNokitBo1+AShEWMP4KiQVkmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117743;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/1+qVb57zvLsyGfD3ibPABn1ocLm+f+LfQNxDlA5Sa4=;
	b=AV74Hb6txwbNAR/f0HE2Dm5HnAH6IHmPb7OPyiV435rQ5sbWs6Ep7QByXPbLMCExY/o5
	 oxxsBCgOjyyVqtP+sD84Ie1zHIAlZ9oREQEp5k15f5vM3chqQ1Sh9RG8iW4LClLW71XFg
	 WSJePeIGFeWjpkzqsSxfGuwclhsvS5YOCxJwec4FJkkGgE6y1wfTCM98RJ9DboVR90Lsx
	 V0oxsbEX0pe/j8+qyVPvB3cExm67vc/O/Ce0XAgJvImyDLOGda+vopiqAMLMdMxLteAKI
	 D4ApdpZmf8HW+5c53QxdBG3qlLGqRaacnWwlnce/npewLhcxh7iBN0pD/Iq02F39OFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHaksePs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF2D606A31A;
	Tue, 27 Oct 2026 16:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHaksePs
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793117742;
	b=iF6S0g6aFF9OklV15d6JH/oEqZr3oWuk+3KAqV+FAfxOUF9izHQOqWPOckECC7Vw//Oy
	 mYPyxhuGahHhpqM2EAoGHohnghIdMoN+Aqc5BKAJU8fFSM5lFYkDMP2znE0P6NLUfLTLA
	 MbTkfDA7h6oCbw2gkJrdYBqfZ2cZOOSHQraVS01Yd4CGjC4oLajW11kDQtfVLGRnqJQr9
	 XZprXW3jLGg7WI5TrS1SEg6GbaS/bad3zVwbw9FD9dYq9sAmIuiTM6EbYPCtv6sKzU8nT
	 /EB4tzILFVyL9FNCnholu6c0Bov9LqCJgdVv2dRvVegxVI3AGZcPwjQlog6wZEXwOkg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793117742;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/1+qVb57zvLsyGfD3ibPABn1ocLm+f+LfQNxDlA5Sa4=;
	b=w81KB7+f0OFR6veUC6B22OUG83Qo3sDYmayqpOLXWCLRjaCHFQpZxSgzKQWi3qpiOEXF
	 5BOmGbP2dYwl+0pmxoafZfLqEjm89Yrk8wwDIidAWVtnIUx/PpsvM+6fSiX0DnCeAFtvx
	 UOv8cUVaAtnJ/IGDjtb6P+rtyBT/7DKGOvlxlmkZo62+LAmsdpj12boi7ocEo1fcfCeE9
	 giVj4lzHVwvyViE7+MGkKbA3Yexpk5r0zJq1Ws14ZDMFfw3si4HdrsuaUO5ovT39vSere
	 EHkUDqOfX9bgNiphWduN31Al4DMTJ/H6+HoZo9WL3Wxiu9zz19zhyjAnvZ5KFD3cfUw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EBF0F1F01825;
	Tue, 27 Oct 2026 16:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793117742;
	bh=/1+qVb57zvLsyGfD3ibPABn1ocLm+f+LfQNxDlA5Sa4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=KHaksePsMes3VvIBAzpo/Vewuvon9PnUhpFXHRp1Ycr3iZK6d3/vdXTS682Awbd3a
	 jNTAI3wHNeJPCqdSQUbTlcPTEGT/1vBHbsiDf4jHJsLXvYpGIriK8eNi+AbuFggu4c
	 YHgtHVvtLiy7/OybE1UDlssf4QX0ISBHuzjsAd9DV1tGt7uMdt/5fvgsg5fwU8eQrE
	 Fj8k+iiWBYP8M9Dn6gzhFfyZwPAwRx30cS+vIM1MRZ6AdMo88HOj8MNdpIw9fZZzv7
	 4Sc2qsTMn9FAGzJWbwreTVT3s21VdpIon3VAqVWdXkE+lx08OpMABMsyC9+r0m7VW2
	 t46EOEfZdmRSg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4E35745153;
	Tue, 27 Oct 2026 16:15:41 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 27 Oct 2026 17:15:37 +0100
Subject: [PATCH v3] media: qcom: camss: Don't reject sensor links faster
 than 4x the CSIPHY timer
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
Message-Id: <20261027-csiphy-sdm845-limits-v3-1-c58917e14107@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNOQ7CMBQFr4JcY+QlMYGKeyCKeCMfkUW2sRKi3
 B07FKkQ5UjvzczIGwfGo/NuRs5E8NB3Cfh+h1RTd3eDQSdGjDBBKsaw8jA0E/a6rYoSP6GF4LG
 khmtZ21LzCqXr4IyFcdVeb1/2L/kwKmRXXjTgQ++mtRtp3v1JRIop1lwQaY8qZewFRggH9UY5E
 NmmONHih4IlhWBMy7IWRlqyKZZl+QBo78HLCwEAAA==
X-Change-ID: 20260822-csiphy-sdm845-limits-b1e3dbaf5d38
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3007; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=YngNkwq0tcL9PzNnoy5oOuxivPBzZW+yX4YIxcz9VjA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq4M4sHysknjH4WTsZyWkGpInzz0sse10LN+oGu
 LzBgYQacXGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCauDOLAAKCRBgAj/E00kg
 ct0GEACJ8rn600wBR0k5Z1JbaLYFD61PRSQA05cvG01mbkv3yrDyjRxDJSDoLU1Hud9eZh0PlmN
 g3V0sUmz/i6gzp/bgieRRnXGLj7gTElwpYQORX04ggzT/Q+HB302jsvkuxuBUf2/Ly+9Zc9Uu3x
 2ThAX7a0ufkI7KlDtKJHtOTJPPNZkjxrErGYonI9bHNCIh6oifO4J9DUOew7lRnF0/UtvhUvZZj
 jonRCzQQOP63yxrS80V+uZXHrCfcnXaC6tVRBxpN+d9GrFCkjGNbAa+nkK+pP1m+wapQ5lyxODB
 Cen/fMp+IPA7zlXN6iE73Vf49+gHNnCvGZGOOE5hDIEdpaNsEg1BQQw3LtYzcPTJWYemukMq08s
 uqacGib7nDzC0lFq5Yj6VdipZhgf6R9df2pWOGYzZmwGF2FE7nwI8WHNiPc0YmWNNHZkR3C9X2b
 RIq1Dfl2CebMQlcpsNnRvbfhSI0+SI36LThMxKjlIa3eH9tanNcg8lyjJioC6B2YCxmnejl1+eQ
 U/70CCqLTn7UFWiHBmEUa8/Qoh6kZWiWREIjN4RWB3bJjYhZozCWwHr35DNC2ckI6hB4Tvy36oK
 n9glKnmFI77jx3URR4NZmCeqEwfqsYBAHf0x/zrkirs/4xSEtHQsQRpS0guLfxwdyDkHVoTwjkd
 Ln2CQ+ROZ/2mvxQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

The timer clock has no such relationship to the link rate. Both the 2ph
and 3ph code use it only as the reference for csiphy_settle_cnt_calc(),
where a faster link makes the settle count smaller, not larger: at
269.33 MHz the count converges to 16 as the link rate grows. The vendor
driver pins the timer to 269.33 MHz for every sensor (it is the highest
rate in the SDM845 clock plan) and streams this exact link with it.

Clamp to the highest listed rate instead of failing, the same way the
unknown-link-rate case is already handled.

Solves issue on sdm845 that caps the link at ~1.02 GHz,
so the Samsung S5K2X7SP, ~2.3 Gbps/lane, link 1.15 GHz) fails with
Pixel clock is too high for CSIPHY

Fixes: bbde31047434 ("media: camss: Use optimal clock frequency rates")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Tested on SHIFT 6MQ with sdm845-next-20260820-9.
---
Changes in v3:
- Added R-b and Fixes: tag.
- Link to v2: https://patch.msgid.link/20260914-csiphy-sdm845-limits-v2-1-622db5a6ebf0@ixit.cz

Changes in v2:
- Drop the camcc change entirely; the 269.33 MHz ceiling stands. (Konrad)
- Fix the check in camss instead: clamp the timer clock to the highest
  listed rate rather than failing, matching the vendor driver.
- Link to v1: https://patch.msgid.link/20260822-csiphy-sdm845-limits-v1-1-d360bf7cd38f@ixit.cz
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index f99eea2ef2289..985171276ce47 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -159,25 +159,23 @@ static int csiphy_set_clock_rates_legacy(struct csiphy_device *csiphy)
 			long round_rate;
 
 			camss_add_clock_margin(&min_rate);
 
 			for (j = 0; j < clock->nfreqs; j++)
 				if (min_rate < clock->freq[j])
 					break;
 
-			if (j == clock->nfreqs) {
-				dev_err(dev,
-					"Pixel clock is too high for CSIPHY\n");
-				return -EINVAL;
-			}
-
-			/* if sensor pixel clock is not available */
-			/* set highest possible CSIPHY clock rate */
-			if (min_rate == 0)
+			/*
+			 * The timer clock is only the reference for the
+			 * settle count and does not need to track the link
+			 * rate. Use the highest listed rate when the link is
+			 * faster than the table covers or unknown.`
+			 */
+			if (j == clock->nfreqs || min_rate == 0)
 				j = clock->nfreqs - 1;
 
 			round_rate = clk_round_rate(clock->clk, clock->freq[j]);
 			if (round_rate < 0) {
 				dev_err(dev, "clk round rate failed: %ld\n",
 					round_rate);
 				return -EINVAL;
 			}

---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20260822-csiphy-sdm845-limits-b1e3dbaf5d38

Best regards,
--  
David Heidelberg <david@ixit.cz>


