Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937EB51DAE7;
	Mon,  5 Oct 2026 17:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220713; cv=none; b=A+lv6Z90n+s2NFPaOBLF7AXE7u36S/16Nl6kQxG2IjoxNda2CWj+VZgou9F8/HKEXKjskXzZxKXAAzrkSsUQF4xJtI3Vv3IQsOxWt6qvRYY8IUORcEEumhzVlfruJsmZ0TF0YaN/fpvdJRCmR1QusSO4kXsWGUUvfdudOp3JT1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220713; c=relaxed/simple;
	bh=y9yCk9Ob/VLfcyF98+h/pjoQ0zBWw4Ef33Eh6IdNFlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SxeGOxK/1g8VoWPsSaQuKWl02yuMvVXyzsOLUNNodXQaSInIm0W45Uj+czJoCjyhPTgtaWbPN6kqVh4Zhn3ymgcjssSJnKSZM4kJjmR0NzkJVOYV/xRmSF4MbZLRwJPijMYDsUUf7e+HbwRmPfboifHqxe3vfQ+Dz4ZvB7cK73Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzuD426Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzuD426Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F86C1F00898;
	Mon,  5 Oct 2026 17:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220712;
	bh=4flhVu8MoMEDfBMha5/MXWAkTN/Ya14YWsMfw44UWys=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JzuD426ZB1YcOP14Qir1rwHJbaTSvjH0pK6xKhr1Cl1LyglWtq/iFm4OmwsP3UCJE
	 rwQ4PR1pF3dfpDAfrI+i7hycZcagkSeIoTm3bfk/TyQsykXjdd+nPpi8HhmYDcmg81
	 HHiEq0aaAxve9UHEPeB0/RLaqTnN6ryOZcbGqjKJca4dBR0cTLuHajK46euEQwgT2a
	 MihaOPxikAx2BizCJfIu1lrstRrQfR0VPNKOIDcuvnpBF+7P/vU+OyLDUVsP6Sivk1
	 83Mzu82FSY5l27oC+EUS5M6JcrXPKud++OpmRRl8J7Ax58i3iQ1LOliUROZg6K0+d3
	 7ymM4UC6DLvPg==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:18 +0200
Subject: [PATCH 48/74] media: qcom: camss: Add a status field to
 camss_buf_done_info
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-48-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=743; i=bod@kernel.org;
 h=from:subject:message-id; bh=FlXQZjAVM+ZYvTzB7YAOeOQvsXMt43NeFMOiLsFqmYo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sjCtqNT2SEsdcckgamjDaw2Qr1WiVAj0Tis
 NxADaf6LzCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbIwAKCRAicTuzoY3I
 Oq1SD/9nKUzpRCJYOkFHVT7iBE0KYaRTCkOty5ZJNLh0Fyb1bqBaIU1etCWVv/9VtjdRWyNKOH8
 6VbHWJo+0h8BOdfQFZ8heDAd65sk3o+IgybA7opNJI0sAogCCGDz5YObErP0qFSHsBxkyj1n00t
 PridOnYjzTOfbQTsS1sPyEeAQ4DotAFBMLUNgrX6l4/uNOILok1ob7zvm8zrulS0azFNkCv5UV1
 NyK9p1sth+zCRAIiE9TEXmVD4rNEEGnmtxPl0oyglDV0a3Yrz10qnaUC7pU/NWcQnvkz7gp+MwT
 T1ZocQVa2ailvPPLdn5erWtUwhuVezrzZ3kClxq/bP7rHmtoAQxmwogBkQnOBWEG83DN0b662xo
 jxHSSd3aHc12d1+lOIcd99MONO0GRfQM5F+1I3IWh3UG717HI1sngeG+bBFg2y02Yls0/RdJiXz
 kVICWeO8131N5ZOe6AHUcR3ek/Tm4oSBOrahn4RJS9vrUd27ET+uAKK2dujkTVglS25x3PKYA4B
 3jEoezx/BJRN5YbcAgSPGdwt/PMjW4c3OZbqF/XXSr+Qw1Oewn64LvTEMIbVUcH60O/f5NkwOzP
 oXcKrUh0r0dxrlr2xAwJLRGGN/bofltSN6/6chP44iMq4FXpmWWMUbvNJ5KUu/+LoouRG9LyPxZ
 zKzGUfL8f46eG3A==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The pixel path completes several outputs, each on its own completion group.
Add a field to the camss_buf_done_info descriptor so that VFE can
understand which output finished.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 6a0d781ae7951..2974532401c81 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -143,6 +143,7 @@ struct camss {
 struct camss_buf_done_info {
 	int hw_id;
 	int port_id;
+	u32 status;
 };
 
 struct camss_camera_interface {

-- 
2.55.0

