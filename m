Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539184DA9D5;
	Mon,  5 Oct 2026 17:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220675; cv=none; b=lU6qy/0rvSvK537Uo039FHY5xYzTdj90PF9zsDmvS5bsD6IdMkC2+EWuyDb5fvOH1ciZp2D7IbtXIVnQEoSOKW3HkTNaZzOVfdKiT9PivqJg8NEo5AaqrlSIJdxcMl9EpNfkHD2pIv2o1+QuztiZ0LYdEuZD48Bml/L1Z9nY0Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220675; c=relaxed/simple;
	bh=u1NVzaRJ2vTU9eMZZv9lm+tsbQ4+A2jK4wjA3MDRpNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H72gCOpoI3/tlFflTdKl+ex2oyc5kBoxJ1Wg93DaL77ercL9TgHOehJKTN1kkF3u9e4clf6dg0zmKspi+rWuuEobQBVZIQq34TCS5FmvEYTGqFQQEEAX5ldpnLMVZilcIxvJd3zwvWUi7LAeZb9w+C2WvleTkNf/lGUqZd1uh0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AV4wG4tz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AV4wG4tz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC1C1F00899;
	Mon,  5 Oct 2026 17:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220674;
	bh=4gvZ0mNp28B0IeGJ5d1Ts4t7ZcljCx6RsUEjTCNLv8k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AV4wG4tzEMFKRq5n4UCDWmM5KJ20+W4nTAXDpChmmtzFk5QpvYz6TUkSn952hSCPY
	 KG7seo1JgVvfIt68s329/fOb/wcTSjX4MBX0dqnZ9XeMy4CqomksE9o8gCxj2fAYd9
	 9auB0VQwxl5UFMPf/OjWeTifaR+yRArWoDnmp3Umpqy0b9tg7MxvvVd9TTiSDoJD6Y
	 AbfPBdxFfmcK5N1YSzCwFO7lrBIwKka2x5YAHMWQJU0E2eTivLyiOOZ2bOmJ/He6ZQ
	 3P6c8Yzf8HMNIse/r8WJVwDmxcuxGbT4/zQRvc2nXK7QZ9xLRk1NH/3mMwmpTbexJB
	 l59TxJtLvUL4g==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:14:07 +0200
Subject: [PATCH 37/74] media: qcom: camss: vfe: Decompose repeated code
 down to __vfe_src_pad_default()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-37-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430; i=bod@kernel.org;
 h=from:subject:message-id; bh=u1NVzaRJ2vTU9eMZZv9lm+tsbQ4+A2jK4wjA3MDRpNc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sbF2uobvBMbG9T9jhfFvrcciLf7mmef0RpU
 KAXmYB2c36JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbGwAKCRAicTuzoY3I
 Ok+TEACIqc+sf4hXlKdc1XA31wbs3h7N6cJw0dxBOjKcMYCEOSrJUyhhlUZvvJhSWWf0Cg3rFR5
 7xykX7afdATNRx0XT/6HUXtOJp0Ni/m/PfI0NeTiVJ6MT4eI1F/kOj5qeYKEZ1LuV7phJKgvOQX
 7M445ybwJg9zWa3mlQklPtaQl1V8ViycOjhJ0/6PO3ObO1ZDVb21cBz4brh8Dzx4wOwP7QsQYx+
 R1qwxPxCMMztKPg6JSzmmRJsxXUXNJeeJOgGPWjnzgh5BNLMTHXYl5oGd4pBdzvGsB5ZbjHv23v
 5tbFzgMFBHoK4S6uiLz3PmniwYsOS+a6BanGE9gEe4MA8CSRELh/prQwc/GuVGGE/3fZ+PggRrT
 CL7DwP4W1GMajj+7hByu3G/IQHXiRYHYAlbEHMUiu42H58rIKXRN9N49cQ/Jimlg0Fn6gHy5FAB
 QyKtHfeJq1TERbOzU9/ARN6iFojvsg3FHdtIoGEOtmWY3KVCVmW0yb2t1RKe8Foq/MdBRmuT9K7
 8LkthsGKjH2do7cmkilOXfdcJVATwbHaj6V5+9emvWSmugtBOgW3kOTLk2X3tGz3+KKs1Sj4dup
 XMzgPXlFbRjYU9vXnDlia/1Qvh+/02U+9/aKreZgN5lyS8Z5Dz2PNr+ipTyShDgLbaYtk2gLvBD
 IwzW78/Kslgds7Q==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 43c91ec8db494..c8ab5e124ad4b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -435,6 +435,14 @@ u32 vfe_bus_v3_packer_fmt(u32 v4l2_fmt, u8 plane, u8 align_shift)
 	return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_128;
 }
 
+static u32 __vfe_src_pad_default(unsigned int index, u32 sink_code)
+{
+	if (index > 0)
+		return 0;
+
+	return sink_code;
+}
+
 static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			    unsigned int index, u32 src_req_code)
 {
@@ -486,10 +494,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 						      index, src_req_code);
 		}
 		default:
-			if (index > 0)
-				return 0;
-
-			return sink_code;
+			return __vfe_src_pad_default(index, sink_code);
 		}
 		break;
 	case CAMSS_660:
@@ -560,10 +565,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 						      index, src_req_code);
 		}
 		default:
-			if (index > 0)
-				return 0;
-
-			return sink_code;
+			return __vfe_src_pad_default(index, sink_code);
 		}
 		break;
 	default:

-- 
2.55.0

