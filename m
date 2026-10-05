Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED314F55D2;
	Mon,  5 Oct 2026 17:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220630; cv=none; b=eSFFggza/FkNbXGvOXFopN5DxyuyG5Axb+WJdNP2DHkIY6uwoJ7hAb+xmfcwR3wczj2F2IOW/A9U9gtdG9kuAGqDJ7jrfGrAOwG/LawYru+bM8bFRx+9U07mSZEY9U08KZrxGPAs/ay8zQyNJZzmvOSX1vrMdT706UhDpRVyQPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220630; c=relaxed/simple;
	bh=NnmQRSoYKTjc6awEY7ZYFxlkcA1xhmCWme6SYB+seYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uALAaRM3OiTjR/qE15gV1J+6vzT1bzy/goypVW7RmfQmrFnroruuEB5GcyJYidP/AnwqUE3sKggfcqkRwuo2W2y3/Iq2h68ITb1B27MZGeV3UVzYRda44oZSc9Dx1SxeK6ncz5h7LGi54nEzKn4TXddM/tWvK0+zz6cH/O3/UYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdJMsTyL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdJMsTyL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F401F00898;
	Mon,  5 Oct 2026 17:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220628;
	bh=bom9CUTZYMBX3AddnFZZCq1QTWeYd/Xu8/gPW/TXuQE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gdJMsTyL5rlES1Yc1RkMfUQpywKjQBibP8Z2Nr1izNjH35PcGd1nr39D7YMPj1eC/
	 bPZc3FToerbPcezsyUFOqtF4V7k9N3Mag+eyQDY7EQglZuoJQCrZopOhcK3CLNm2pk
	 +hDFDmaQM+bpHo9Ih6tUYU79N4rzomd7Cs4akCDkv1x5xwnM4ThucQuXMmDS1YU8pU
	 kXadcv7+82sM1W/cKE8bVbw7RfhenpXpJ2b6dPXmg+F51AUS2iWkctHg8MscPPnUwj
	 CcosP7oB9pp3LM8qSkMpbrPDi4zM5wLGd8heDHe2xLgpibn+Wj6/022oN55duX6fUd
	 /FoYS3R6IUcxQ==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:54 +0200
Subject: [PATCH 24/74] media: qcom: camss: vfe: Define vfe v3 completion
 group enum
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-24-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009; i=bod@kernel.org;
 h=from:subject:message-id; bh=NnmQRSoYKTjc6awEY7ZYFxlkcA1xhmCWme6SYB+seYw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sRemsCLyhupr9ogvsFd4jpAoP53yAyoMs2P
 CU5gsDdAYqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbEQAKCRAicTuzoY3I
 OpTbD/9X5FeOHM+dvwxYhEqIbhD4qVWh33adIlqWWEftU4r8W+sgwjjVfbSQqGx398Jj0GYLSBu
 Ge25rtCMHMltVosmTgX5qhPYRHRR/U2o4UGzbVK/vcXKcq/GO5dvzwKp6pNI+rZ0ZM609m6vfuR
 RhEjKHpSD+LlyKuMr0k2BQEKWxmMz4KlQmg+YgzQUsht3jTa3RSB/Zcv2TniGdJ0TDMNBjiqsG2
 pqTjr1rpIDVT8DcM2mJc6qOjhRT5uzcUFGkctkDHKJdwCJmfV3r+uC6ZBVhvyefaJsJuVFTDYdN
 xttqoxhOdseW5s131iRhBgqkFpTxFsZ7RDwFkwjJzm0Sv3S40ndPnSJ5CZHq0HzZzoKfmgKZcX1
 kNisQX8BU14Kdayl/sn1QrbB1v2MRobjaGjrVxsO373wfP5+jFMJCDcStg6sEfZOnBLcklcySEO
 1pV9uh4AngWv9kw5MYDHQ1qtYuZ3BQ8Lcj9T2PymX8Pgxj1WqgRO8/Ki+T4STUSt6T5S9n95OLR
 OWCk+hii75eCWkMsDt00Nb/W1rZtav/Ct+jB6iRJNUnoLzXEPZjcfD6+0XZODnCJSjnTZ7/blwU
 ZYf4zCAAYUTLMaBWaIHsSOCQyXfrD6WtqLGH2xBDaXFqYP7TcWf+vpf9ml3TgYanItiZaZQrtsr
 /48CYsCKQ/mOzag==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 925b0e59f9605..6ba0d0c7d6be2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -78,6 +78,27 @@ enum vfe_packer_format_v3 {
 	VFE_BUS_WM_PACKER_FMT_V3_MAX,
 };
 
+enum vfe_v3_comp_group {
+	VFE_V3_COMP_GRP_0,
+	VFE_V3_COMP_GRP_1,
+	VFE_V3_COMP_GRP_2,
+	VFE_V3_COMP_GRP_3,
+	VFE_V3_COMP_GRP_4,
+	VFE_V3_COMP_GRP_5,
+	VFE_V3_COMP_GRP_6,
+	VFE_V3_COMP_GRP_7,
+	VFE_V3_COMP_GRP_8,
+	VFE_V3_COMP_GRP_9,
+	VFE_V3_COMP_GRP_10,
+	VFE_V3_COMP_GRP_11,
+	VFE_V3_COMP_GRP_12,
+	VFE_V3_COMP_GRP_13,
+	VFE_V3_COMP_GRP_14,
+	VFE_V3_COMP_GRP_15,
+	VFE_V3_COMP_GRP_16,
+	VFE_V3_COMP_GRP_MAX,
+};
+
 struct vfe_wm {
 	u8 bus_client;
 };

-- 
2.55.0

