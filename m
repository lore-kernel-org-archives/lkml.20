Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBD04DAF94;
	Mon,  5 Oct 2026 17:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220679; cv=none; b=sr/aNCSSkRIQSgX+e1UPNVvZV3z7Rwp67K7Mjw3yPeSVVDT+Nk1hInIElUI2Y3clvHW6TB5ZvMt5Su4SnzUCJeOG3dQb8MsqZBNt91bNz/zrxcVp2MD6Wkk9peTJcHVFEaeiNyQ01OtuBEEDfiFXgxejNR2QmhF9JftUptCfsok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220679; c=relaxed/simple;
	bh=2cZcgKkfsQbkOXwaMt4k90Zi6V/nWPZcB+V13QFbODw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kN/xC2t4CFophEBt4G33DzcyftHSxFT/dhRxSkiX/zRyVACOS3i+iR4qZlziIaKkBLSr/nWCsISdircMjMvw5MzKxNJZ5EiG80BEj1DWkaRNmpbneCzAKjdiFBdEO+rL4aE1vkUEmeqwrFMGJgi5S0oTjSTKkC67V5gFZ7S1fzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zm0YlwsS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zm0YlwsS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E7E1F000FF;
	Mon,  5 Oct 2026 17:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220677;
	bh=7axvUWutQI7fPXqC3ye42YIGb18Rc/osyVYJdfNQ5c4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Zm0YlwsSpKoaVW1vmDYKYZYyyES4g8ni9kiTQ8d3SMxBrl6XW7qOsLS88S3Et4QwI
	 eW8xa3746sgYRwf9apDGhq1PIsGNxDtWWJ9n4jCWDahtm7ve42The3p4dKGazSsYA4
	 xrvdaYKAoi42OoqAyzlgsiEkuNO3q5Y4ronKZYdYLov1M9ZUuy4/WRLxIIrUJn0F87
	 npvP/qyBBODbElcX1MH+Tk3pVw/WopsEjiZdmKcJA7CVEAJ4kgHUoddZxJP0ueEsof
	 UGEUC5bDfpFDtnBg53Gw0bALE2Xpr5pxJjGEqF/Av/tw96g28e3xUqXQvw/b35m1Pr
	 rwhVLmrBsX2Ew==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:14:08 +0200
Subject: [PATCH 38/74] media: qcom: camss: vfe: Eliminate ever expanding
 src_pad_code switch logic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-38-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256; i=bod@kernel.org;
 h=from:subject:message-id; bh=2cZcgKkfsQbkOXwaMt4k90Zi6V/nWPZcB+V13QFbODw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sbXCAVeIkuUE1KIe9jm6uPKU7VWoHWlTifm
 THOCqxp6PiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbGwAKCRAicTuzoY3I
 Orv2D/95baZvL7oIh/eEZbxptzBzbi+FB3ZuS6qq6fF5KZRTtTy8JtCCJ1fy+ys5Z1P2KyAuDHf
 DhQzsoGNB73ajMGPELHg/djFCOHI9nHXg16LAt7e4o0+Pkyd+Fwm2xlOAMpgfTKtilvlRrh70zp
 6nmQJlQ0Kh/Y7Eax7eF2nSeTmhb0hvtR55kWHxX4r9XJ4V5eXsuChXB7PXM10Rc5mTTTvtDcGuW
 6jCRrqUa7JJtUrG+UzlbbXPEKN5Lv/aKezuKL/4lPlOyggSCeSynHGDsX6T/+m3vyeWeLNGGz6P
 FIHGMkkWDhhQwbCD0lt9+RMOaqzF0m4yA47y7pWss+SML4hYqUCQz4QT1eFsnhTOWLL1tS970dq
 dO7dGB6e5VF5KavmFCNaMg5sqZZWvsF8wrToL5w2jOTCD/SCnVN+xsRY0WifOQhPhzXxJioSYkn
 fSKr472xEhZy92sC+63N7Qpd7r+or1PanNMfZd/vOYPBkmaKvT6RKH1iatWn5ppaQ/IYkNWglrL
 6DqpffPxMz+IaYL4sYlgFn3mOm7vk8ntXEPZ68pcVRzQvQDc/pkoSY6UYKc8JMfGQbsnwsPP6ve
 2cyV0JSzkQUUmk6Hid2p52E3qjAH0c+/KrXlIG1lCvJ7UoT3/iuHNJ5zS/TP0Zv/HGtBKhetJd1
 efjusq+MbQ4o7GQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index c8ab5e124ad4b..900f8ec79c8dc 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -497,20 +497,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return __vfe_src_pad_default(index, sink_code);
 		}
 		break;
-	case CAMSS_660:
-	case CAMSS_2290:
-	case CAMSS_6150:
-	case CAMSS_6350:
-	case CAMSS_7280:
-	case CAMSS_8x96:
-	case CAMSS_8250:
-	case CAMSS_8280XP:
-	case CAMSS_8300:
-	case CAMSS_845:
-	case CAMSS_8550:
-	case CAMSS_8650:
-	case CAMSS_8775P:
-	case CAMSS_X1E80100:
+	default:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -568,10 +555,6 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return __vfe_src_pad_default(index, sink_code);
 		}
 		break;
-	default:
-		WARN(1, "Unsupported HW version: %x\n",
-		     vfe->camss->res->version);
-		break;
 	}
 	return 0;
 }

-- 
2.55.0

