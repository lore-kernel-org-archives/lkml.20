Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6945335A2;
	Mon,  5 Oct 2026 17:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220784; cv=none; b=PLd8csXaqwCnLIENHDOgXfLNAuBkCXDaTt+qa+e8UCaqLXA0vWrwWrFgZJUMNe5Rzsaaou6hL+up9NE93neEdpubb8Zp33ahdHT1zDiS5Lnmj3CglfdqJ7hnohzfVHnx9ajMINrn9HDHBJJ2UuLYE3B7L8YapNggQ3sRlsGNhwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220784; c=relaxed/simple;
	bh=EUtUN/D6N8g0lEaGg3wcy7vozbNtGtdVzvyrxmbhxAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r/BJfU6UF5XyRE8ot9VPl8zBGEC57oHOM0CnyloWTKfyL3oXWGCLlMJcEMfjJiAHt59N8FsAy3MtZljpTYpPEmqyu8ot+AB1DqXiC8dtfCBnqeEy+FXJ2prDwbHzRvSELXs5Iuc3nU/xXC623txdgf2XO5iHVGI4z5YJEEzX7+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPfDhUWH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPfDhUWH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7551F00893;
	Mon,  5 Oct 2026 17:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220782;
	bh=vyt8iWJjKd1ipExbLxFqgMsePCntQCjHgoRqyTUl04w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YPfDhUWH59ibaUVWHvXT8DK0dzgHUjvruLiIkrEG0FyNDf/IuPFekZPfh5QECzCmb
	 EUCFSyjd0KW1VJ3E5MAZEMss5rxr5NnN6ZuWqfYdhmYzcOWjzLlZeFAcTG/IJ9o+I3
	 N+KTpOk9WBcBHLSEV1gvMhrmGP0XXUuhzhdNwrNIHoBRa/oyxBXrtk6YUMNcXlHECm
	 nfuhxmbvu3PcYXcUvhEIgSG6WihB4BHlfS0UiaUKakjkBXgXLWy/r0F4tsmJIM70Lb
	 2fnW//j85j0kTPt/umJw9O4NEL2HuAR+yra3XZwd/PdHIki475PxmW02Cnw+dYSzDE
	 jYbjap7MQJxSQ==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:38 +0200
Subject: [PATCH 68/74] media: v4l2: Add the Qualcomm CAMSS ISP parameters
 format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-68-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1928; i=bod@kernel.org;
 h=from:subject:message-id; bh=W2aOatVIxFbn6GT7AVUGSow5lQxHyTmTaffBCRpnjws=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sxDs2FqngzObmI4RFhbGt6poLd7O/majAjq
 GUj3k5VnVOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbMQAKCRAicTuzoY3I
 Op5ZEACMNtR1buHLxr+EKwXsswUb1ubIPAj6gaJqp1RDuj8vIrK6AJwiE0gYg2ts1Xf/3nf7uib
 2bgRN4l4mRGChGJwvsyId5cOLMC9W8hEE/qLWj/BI4fTN6fLi3dckyCXLBU5ElIr4Pk1/OjriGm
 atZmxBiKyLPmzoY5vQLHibvMYpVb3Jz11YV44vHosHhABuQPlLqRRjEH8BnRAi2Irc/BDxayQkT
 dcnDPthDAp9pdpHXj819VEZ/ewRDlRQjfqyzmcvxAti1hoLsdPfIh5i4G89vHr8lTPY8kaHIf+x
 7tp9VnsQEmDayC2YKNf0MZVuPxKw0fkSyHLOojIQWrcZyfxcc/HEo5Na8GiYPj8PsssTD8EFV4T
 Tu5YeIEpj1cS5I3bLfgXsZxhaPRxLJRl23BJovEjusenZebpRoHw28n4QFhvin6T8AGM4XUTBVI
 ftxokyRn18WbUHsdTEYlVJxcS2tB/dlR36i6rtVHNer3gzOtV2UzkWJEBxqzXTjkQt2hr2krA12
 Vv63UTPO/mTxxcC5ebZtl4x1sbKQJtDO2OKAPSzvl0ayg0LBdwPfcBjB/0y4DuMyOo5suzQcsa8
 HbRLeNfN8DCemspn6qEU0p1GghaZBlvDDK0e3n8URjY9gE0nmsqEesh+6wKV8Jr35MgplEWB4ZT
 yM/9BF2vN/zDmnQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Define V4L2_META_FMT_QCOM_ISP_PARAMS ('QCIP'), documented with the CAMSS
ISP parameters blocks, and its description.

Drop this patch if the OPE series providing the same definition is
already applied.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index e5eccb62e76b2..f30eb50e4b309 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_META_FMT_QCOM_ISP_STATS:	descr = "Qualcomm CAMSS ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 700ea9b646979..21515f99e3d7c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -890,6 +890,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
 /* Vendor specific - used for Qualcomm CAMSS ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
 #define V4L2_META_FMT_QCOM_ISP_STATS	v4l2_fourcc('Q', 'C', 'I', 'S') /* Qualcomm CAMSS ISP Statistics */
 
 #ifdef __KERNEL__

-- 
2.55.0

