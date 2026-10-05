Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA31509F1C;
	Mon,  5 Oct 2026 17:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220668; cv=none; b=rfV8hf82LCXYaZWsmg9UN6sZC+iRHnDRZCbwHFu7eMcfTPcd9jLLXIUzll1OHX8YDXM6JQLldzRwYYK/20LSZMEiHR5SDwpkZY0sbDaKyXyIgtgFzjLQ6d9BsR3IvILRwDGZU+2KH51CqxlfrRQcEQ8DZyw1OAclOpcetggiA8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220668; c=relaxed/simple;
	bh=zvszjEEC4dKifOeLcw9fhOXXgqfWLdRdkA7+aISnGjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MxSaouVsxhhpXQ0U8c54GNqH70wGYuHuqTxXC0+vyVquwsZkJs2dN8brorxJ8abMLeFjNaH6QJixMC8ldZn1aGb87xY2zvNjeddh3HiSBuqJYARcmcFIQpYn84sHrJtFWpIowGGXVDobiTv6AzNUN8iChT0Ni165Ro0iIMX+1so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Re93TNw9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Re93TNw9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3795D1F00893;
	Mon,  5 Oct 2026 17:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220667;
	bh=CwEqAlCFgEr2Q2kRw3AvpHntDI47knDvo5I0SJBonTE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Re93TNw9CRlvwX8MYI/WUPp/1Q9HmmEjk/KE+0ICtSdMCCbtdQqx7fhLOzq8pkWNl
	 TDWfEKP6oQ6ox4n+Wk/xwSg7ZLnM1TPBAjZp47eTaNkQ4B6BMZb1FgCqbXkd/cPPvA
	 M4vjn21Y7nBYeo4ely3L0hLOVwQJU/bDLrjSbHjOEtQmrpuwCvJzndWrWKGS6Mt9+q
	 QBRE8NLkSm+FAeVDGjhBOPOUZLu86m7EshT5GH54mjbvjl+FiVz5sURo8dZt/kOROZ
	 V4wHllfV6KhKCW35HHpBfjCo7YNoz2H3MxRy52V0wHv25mesC8KQQpRRQVcls8Mj7t
	 9qEOBNYSyqNJw==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:14:05 +0200
Subject: [PATCH 35/74] media: qcom: camss: vfe: Add helper
 __vfe_pix_format_is_raw
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-35-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=bod@kernel.org;
 h=from:subject:message-id; bh=zvszjEEC4dKifOeLcw9fhOXXgqfWLdRdkA7+aISnGjU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sZtsmVY7ZrYpbFKbk/tz0XGqtwUrCYvEYTm
 3Pl4UzHRLiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbGQAKCRAicTuzoY3I
 OlrmEACE61wGV2ZH1SrbQL1zyOIXx0A5LMjFHpIu7i/u9ioPOTzwOWbwWtJULHpCqaEwsUlWI1m
 dpsxr3ywfecwhUWTcnkljpMJfNZr5Mo9B0JSMdcTqskodQ43l0e3pISgo3x1kO3eVmVtixeHZev
 ZdYMs/F6BHhY702nbEV1iUDmWSJIBSkNeNB/2rLZSsdjcx4IJ0ByL2A4lPbRPsNuGuYLZUNFRoh
 49gbcuqPDVjct48iNX5tXGOYKyqaMyULzGxjb4NNKsK8aZ+enCWD1Kr9y9Sm/z8BErXfCgdMWGh
 ice1pWZfngfMzpANSJT/1CWEacpP34gbvf5h3fvwHj7dLQOn+0ejg+0DvJvC2gaaCU7M+XOm5/w
 /1GQWnli7RmukPiUZYk7DQemiKwbutkT442Z5gZiPHnPeIF85XJaRguinSYSO89VqU/oa3Xj0fH
 O6QsqvR+CbQg1O0PjOgJ5iVj4t1MWTaYu+YQAuDzEMZeeZS+uokqJ2RUQMUzoG60bA0QKOkd5Js
 qpOQ7zYHtj2EM7TD5wss4BP+OuMXfRxLutEpAl4dizGT1OdK2L/j5xR+Cp9Ihs1p1ig6LTBUrWm
 JKA9wKL4nVLqVJDi0sV6TTsLFeN8uHgRBReyqW9zvguz7skm7GURKtDxOGRxx97O9z4pQry44U8
 FnIia3flnSvddmQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

It does exactly what it says on the tin.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 9793df66b4149..43c91ec8db494 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -340,6 +340,18 @@ static const struct camss_format_info formats_pix_8x96[] = {
 	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
 };
 
+static bool __vfe_pix_fmt_is_raw(const struct camss_formats *fmts, u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < fmts->nformats; i++) {
+		if (fmts->formats[i].code == code)
+			return true;
+	}
+
+	return false;
+}
+
 const struct camss_formats vfe_formats_rdi_8x16 = {
 	.nformats = ARRAY_SIZE(formats_rdi_8x16),
 	.formats = formats_rdi_8x16

-- 
2.55.0

