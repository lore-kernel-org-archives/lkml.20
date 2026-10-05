Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409A051616C;
	Mon,  5 Oct 2026 17:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220682; cv=none; b=WyF7JhjBfU5GcrAFkaNgbdVsKIv2ZRmkg19cmQ3faID78w60N3jdh7eyy6kgTw8cJRxR55Vca0LUb/pvr+BmxkkEyyJl8sVpA6zu07euqd1oj6Cv/KZ71wmTkssuhrKj5A7eFGCmCHhjuWqOW23rwtaurnXunC1ryJnDucCm73M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220682; c=relaxed/simple;
	bh=TVptcZbAue7LCcNv1tnF8H9YQ0Yk79KzMkicFzSAt58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hE+WyQmoDNaoZpy2phjTZ6rkNiPgUWTa8IqPFAXm3eyrqI5RcElvfumovvOkL4E/VQubbpow5ukPJY9YgmdcJV1bpIeIjJq9cOi3091nEFBbLl7G4fdJp6m3uYH1xjZadGJuLa002iWXuPKITHDLeO6Iq7c6llz/ECwCxs2SSjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efjP8Q+Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efjP8Q+Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214501F00899;
	Mon,  5 Oct 2026 17:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220681;
	bh=XP+A94BAz+z1f4vxkxptHsF8jaPsZwkeDbnBtq96maQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=efjP8Q+ZzE8nbmTcs+r9SoKiDbG0D5uJu35niZIcFTlswxjSjHmhKRuCPGtMAwGuz
	 r7Km6/D8IZTMcgNv/LngzLWjpalryO23OYclY5lgn2DJVlgIXcmWDIu8S59H3OhX2j
	 j4gVQVDGODJqDCBcWZbIdVg/p9Mj4UPLxzLanR8jukWYB4TlCc3dMhAuWKQ/b6R5dH
	 OE/6QZMvQ9jZHaTFMX6f0+U/3SHamQAXGt7WfWTyR+qT+GGdpEeU2jo/tiC95rv4oP
	 U8Ph8Qn8nWDiyV4pqdRiSZRL0f5De2ji/cw5Fnb7Fw1a5z2RJgxhaO3gyIc7+bn3eL
	 pfZpEBtR0xsVA==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:14:09 +0200
Subject: [PATCH 39/74] media: qcom: camss: vfe: Add Bayer to YUV conversion
 switch cases for PIX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-39-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1870; i=bod@kernel.org;
 h=from:subject:message-id; bh=TVptcZbAue7LCcNv1tnF8H9YQ0Yk79KzMkicFzSAt58=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9scubt/cuDGoCvZgD+2odXZk3ZT0YGiUws9+
 vDyiNArdfqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbHAAKCRAicTuzoY3I
 OjI1EACweciP5vJeBE+h4b7LHa4jwiAtkg9S6br/3KkkpCii8VIXbXdn67CbI+o+1HTJL7ABNhB
 IMbch2dJvcA0rWGoQb9NZnpiAZnvRb5PjefrNkXFpv7iCS4i3fD921GxLBJow0UknCNJO0CTjQQ
 EMvteA4RTcT6ouliKvFq3uir6LIhtRv13QysE+04gKd/gqWQ/q59fxe0vdXeo+nsVZGex3cSMrg
 ydfqel5gh/cf3FAo6ctDKiqLqZe4EjVCqlRA6lVZRt5X+9ZYqwuIYhGjAeKli3k42JFiWShsz2h
 inow5zh7eDlVCuOq4C/bFIqycFeNiWOSAAx2QjnhVY4UORI5wbyzPYEDbpUyUetlIjmzsIbApOu
 41YIOeoE7FxI5YZfQPSHigpv5J1UQKOpmHbBifs/aViYxl+fQpTKPgiBEcJmH3V/ji/E4c6HZWs
 26nkOK1utLYYx6UGgC72WBEMSCWCl16mPq+v4QuD28LK0u+/t7FXpwSExaJg72ugtt6tRlmQNHI
 fMkUVMgGwXh+KGjDR5f2vEQl9WQBmfLmWJDCs5dp/302KFwH3rgfn/COEkdz7v3R+xJzm0kyvjQ
 k6a5O6NYogyIAQrl/XsV6t6V7fHdQXuzRnfIJ882eNdHjRqpI6lMKb6TuA3CRU4CvKJGfZbpb8O
 dBQejtjt3giSG3g==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 900f8ec79c8dc..926cb7559f78e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -551,6 +551,43 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
 						      index, src_req_code);
 		}
+		case MEDIA_BUS_FMT_SBGGR8_1X8:
+		case MEDIA_BUS_FMT_SGBRG8_1X8:
+		case MEDIA_BUS_FMT_SGRBG8_1X8:
+		case MEDIA_BUS_FMT_SRGGB8_1X8:
+		case MEDIA_BUS_FMT_SBGGR10_1X10:
+		case MEDIA_BUS_FMT_SGBRG10_1X10:
+		case MEDIA_BUS_FMT_SGRBG10_1X10:
+		case MEDIA_BUS_FMT_SRGGB10_1X10:
+		case MEDIA_BUS_FMT_SBGGR12_1X12:
+		case MEDIA_BUS_FMT_SGBRG12_1X12:
+		case MEDIA_BUS_FMT_SGRBG12_1X12:
+		case MEDIA_BUS_FMT_SRGGB12_1X12:
+		case MEDIA_BUS_FMT_SBGGR14_1X14:
+		case MEDIA_BUS_FMT_SGBRG14_1X14:
+		case MEDIA_BUS_FMT_SGRBG14_1X14:
+		case MEDIA_BUS_FMT_SRGGB14_1X14:
+		case MEDIA_BUS_FMT_Y8_1X8:
+		case MEDIA_BUS_FMT_Y10_1X10:
+		{
+			if (!line->is_pix)
+				return __vfe_src_pad_default(index, sink_code);
+
+			u32 src_code[] = {
+				sink_code,
+				MEDIA_BUS_FMT_UYVY8_1X16,
+				MEDIA_BUS_FMT_VYUY8_1X16,
+				MEDIA_BUS_FMT_YUYV8_1X16,
+				MEDIA_BUS_FMT_YVYU8_1X16,
+				MEDIA_BUS_FMT_UYVY8_1_5X8,
+				MEDIA_BUS_FMT_VYUY8_1_5X8,
+				MEDIA_BUS_FMT_YUYV8_1_5X8,
+				MEDIA_BUS_FMT_YVYU8_1_5X8,
+			};
+
+			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
+						      index, src_req_code);
+		}
 		default:
 			return __vfe_src_pad_default(index, sink_code);
 		}

-- 
2.55.0

