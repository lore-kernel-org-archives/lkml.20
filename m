Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E030F5335A2;
	Mon,  5 Oct 2026 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220788; cv=none; b=sxQZNgCoqAEd9aEfGlB3rOy8WV03yFWK1KiBv23tBzLPq/XLekifGjtluOdhcJrJGrn/8UTyoM2vyuEN4NNIIxk7p5Lo5oif9aaPueITLCtNFiSWciHEWIecv+sT6KQl8hXDl9GIXMACiVjquzWaap383BMez5VIXDLNZhyLack=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220788; c=relaxed/simple;
	bh=Ba1VcyejD/6BH6fTCzZ/2TcJS5EsesBeNPJswsCq7Ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfYRY1+/tcFjBc27pZrBJ7gWl4APVV30hHtaYakgCibFzALMQ1RIKOltmNAdcpPoJt9GaiONaDTCegQoWeOoFDdmQqdClsoc9Fkuxm2TSb7ln2ID6TQNoc9l5Geb+2E2QFjeJbZv99SSyifBSo4hkS43W1i+RjYI6YOeGh9dA60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+Pj8eyH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+Pj8eyH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4441F000FF;
	Mon,  5 Oct 2026 17:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220786;
	bh=Fv51Xo6DjpKrqbgHVByWkvK2kENfVDfNsXCDHJTkp2o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=E+Pj8eyH1qctdLCCojIITkWo0Wkgd0C5ctxscnwWblrtQJ4ELrCkYLc2/TnJ2oD2Z
	 Lcrpruw+m2fmSfltKkhdSzDs+4UO88ZGJYR+3U2viEP6UR8cVB5Wfz3TrYfwQrtafw
	 S/D35LUK6zhf+HECzxL7UpR+I6fBvSLaa4rm9rDjQ3YtQ/s9W45SLrnn0s2yz2ztji
	 twQsutMqDacLVqcg+45J9w45lVDWLIjLaB+5XHZEJ5o77WXc35/EzY5Sit5FMdgNGc
	 yL/Hjt16AeH59l9V22qRxh9DA1VTxzoD4m1WoxAL6DR3PL0s/AlKiMiML01vGfg/p8
	 22igAZjnDx6tw==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:39 +0200
Subject: [PATCH 69/74] media: Documentation: uapi: Add the CAMSS IFE
 parameters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-69-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644; i=bod@kernel.org;
 h=from:subject:message-id; bh=6TLnXRiWL9qA+UyLQFZOMFCLUJW9HAVz2P7g3v7xPD0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sybT1yZxJQtAjLIahDKIihEvqo/qvSjQqDp
 P/Rhbf/hLqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbMgAKCRAicTuzoY3I
 Oka1D/0YEug3CDpI7KW5wbKiWeeF34YS+5ynN0l7KCxBE/FP/S/IPIVsiRLrehcebcOvc1SD4cC
 V5hJ8IZDwIxS0Ics9mYSEQyo5CdNBG0ZYhbWXhyfqpr9ip5QASbRE/TdXXEn63huzp8cV234yQH
 IPI1raQ1iBof9j1qCkVXrR2paobSnf4gyilCeknYTR/tgpPA+XcSo2rzPf5qOnHM9nyt3H7V745
 ZC2YPaXRyQBHEGVDSiz0c669KTkYDt24d3piSruI3ogtXPR0IosgxghRSM2r5vHgHJ9zdiq8wee
 vhzVH5OrbiqZaS6xUiEDY5YAR08UUak7rnqmmnL/bTqOh94HjE1T0AjRZ4B0sixcfUUqkX0ry8l
 qOXE/R/pyN7Tly+2pz3YeM8Cju0pU0C0p1hlm4XtGqYTkfzq0mlqkr9TjO4u/LLw8Gl18xqZl0N
 EjQtojs9WzfGNLwLVGXpDNL/oKEZxzWHNRiYX+mH1716KpdUgqoK/lpl98lo8AbQF6rZZDeGYba
 +73NUN6eteQnygGinBDRZD3Ne5WrU+j+aq4YbKG3P/OaI6efq7rr+6ex0FfWk6mADuBSynIOh0A
 54nseZOxgpiTIsw5179C9lSuzGqusdJ4PXj+zuOGFFuvqH1IZnm8FmfpabPnLNQOFczhCSKQIXL
 fsxbEZilAJFPWVw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Document the parameters block the SM8650 IFE pixel path accepts on its
msm_vfeN_params node, and when queued parameters apply.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../userspace-api/media/v4l/metafmt-qcom-isp.rst   | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
index 77372b3a32d7d..0a7ef8b314423 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
@@ -141,6 +141,28 @@ and a gamma correction block:
 	for (unsigned int i = 0; i < CAMSS_GAMMA_LUT_SIZE; i++)
 		gamma->glut[i] = gamma->blut[i] = gamma->rlut[i] = i;
 
+IFE pixel path
+==============
+
+The pixel path of the SM8650 IFE consumes the format on its
+``msm_vfeN_params`` metadata output node. It accepts the following block, and
+rejects blocks of other types:
+
+.. flat-table:: IFE parameter blocks
+    :header-rows: 1
+    :stub-columns: 0
+
+    * - Parameter block
+      - Function
+    * - :c:type:`camss_params_aec_bhist`
+      - Region of the frame counted by the AEC Bayer histogram statistics,
+        :c:type:`camss_stats_bhist`.
+
+Parameters queued before the image node starts streaming apply from the first
+frame. Parameters queued while streaming apply from a following frame; the
+buffer is returned with the sequence number of the first frame they can
+affect.
+
 .. _v4l2-meta-fmt-qcom-isp-stats:
 
 *************************************

-- 
2.55.0

