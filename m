Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF8A4DBD61;
	Mon,  5 Oct 2026 17:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220563; cv=none; b=CojxBVEkDIi7WkwD5uhPuJYSIZnTlZy2J7eEiLzAeBTLHEccrDDfk9ZIpOoh5qCIlv5SQ473pCIJYS9TtxYjB6yiY8vqCjorLfxtxqVEsXCbzoCwZjVsPR+jhPWsBZNgEsSCxCCmd6Jz55/UJNHkWInLdEz4e0S+fq4n4CvvKzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220563; c=relaxed/simple;
	bh=NGHA/rNHIqlTopHnVoSAELHvfO9cwp3XnK9G8dzOqpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ScMWqXMdnffvjLIqNdQNYd6VSyGwCwgdtEdhnBxDV0rZ7M5WMRqPRYkObG4OBAeyTaQZGmInrGsYGt00CMsGJDSzambrT89gFtGIS6BUu/eTlyVyVTmp/GBJnxBAzxT2sOC3veyKtbNQm22OYno23e6TMD1Cnpl8LbkxyhBVXM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvyDlRbt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvyDlRbt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFB51F00893;
	Mon,  5 Oct 2026 17:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220561;
	bh=bvE7giFvJlbRPf/Xnoi7r4d9CRUJz+EQrhVJe5NU1w4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KvyDlRbtCAho0yKhj+Ijt7lW6a4qMj1i/4sZaY9G5JuBHggfbMsRvDP+p2IaXpwzW
	 E8dRvhDy5rlfljV6HYtFa0AeSTgk2OIb6KuE9jd3eZIPsgBPlv/JAr0TABUb0Eju9M
	 8DdaBebOSvcK0FhzqTvT8wTP7dpmGz85m7Sy7JCglOl1QXpBiVrPsWhzVuMMgH7TZc
	 3ruz692a6Xp7KKKYIrqAIyJGv2dWM5R5BRewUk6XMHtMye9SgvHsvPHQjDSknq3laW
	 fdKWgWjCDkkXVPwBummC4uuTvs31tU40Oik6kK9zHtHG+cezG+RTuYULGyYIhc0yFs
	 t53doC0ZdZJpw==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:13:36 +0200
Subject: [PATCH 06/74] media: v4l2-isp: Add per-block validation callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-6-ed985aefd611@kernel.org>
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
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2897; i=bod@kernel.org;
 h=from:subject:message-id; bh=AOFr25UTI0ye3/7dZcD9cbdaIYowieZ78ryzSCtxtHY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sEiTkNSh4En1MnMK7NRanbR45CAEd9PRHQN
 dhBzYnu2/mJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbBAAKCRAicTuzoY3I
 OnU/EACOsmTBE6VJ9uRq6Mhr+tv7cKRo8hGS7QrbfxghvhqVvkWHLcavXjIatYhsChCoe9EMEta
 nvk1YJV3c5pmccZ85WXuRobdjc5RBBuhmm1UfCTWCHq0wDM35hmO3eNBOrcXZt4PLsgsQzh4TjZ
 4BxaTIimSo6JoIIq4u4RMgvLVBDW2yQOVute0nhbhY8l7rWCHoIjijQDh4MKUA4lvp4Tj1zubPJ
 ILLuCr+d8yx8DGwmUEQVAmQJqlIbG1jRXZztfGe9X03seqiGZk0CyZs2GNO3xrbN7SH6+pN29Nh
 3Nbr3+ZinxR2ZzWi6ohWg+yHjoy0oW2Qh/NjN6QPdDPJZZAnpEGErhqSjr908GXgd3c0l+T/Tv5
 A9n9ssAc/5FS21PQrdCbKOG2zGHW79n9zQrLOixmS/kBR836HTmsu3s944m8uxGgflsWwJFsLPn
 vBcVgGNnTqemlVUmtO5NkO/95APZk1eSF9qmZqfKDlcEZU/jpiVJBeHSlSVhlhY+4Ur7ayb24u6
 zfF+PsFjqo+MMAq+SEz5vljsEk9QQ46tkPM57LO3RM2+8xDwBt2+D16261x01x8HuiB7od7ni/A
 UUtFNjxBarbJArGhfsQv3kYlXtN11C+ynPMWd8EUDWnazNtOf2fvwOqRbPHtEhQEtUAJ+DWHMzc
 AMI/vYKO4xJ06dA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Drivers are expected to provide to the helper function
v4l2_isp_params_validate_buffer() a list of 'struct
v4l2_isp_params_block_type_info' entries, one for each supported ISP block.

The type 'struct v4l2_isp_params_block_type_info' so far only contained the
expected block size for the core framework to validate the declared block
size against the expected one.

For some blocks, drivers might want to implement more precise per-block
validations. Add a function pointer member to 'struct
v4l2_isp_params_block_type_info' to allow drivers to register a callback
and call it from the core framework during validation.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-isp.c |  3 +++
 include/media/v4l2-isp.h           | 11 ++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
index 29831f7032e94..f497471e9f18f 100644
--- a/drivers/media/v4l2-core/v4l2-isp.c
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -114,6 +114,9 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 			return -EINVAL;
 		}
 
+		if (info->block_validate && info->block_validate(dev, block))
+			return -EINVAL;
+
 		block_offset += block->size;
 		buffer_size -= block->size;
 	}
diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
index d70ed6b431e7b..1f35a52f978a1 100644
--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -55,17 +55,22 @@ int v4l2_isp_params_validate_buffer_size(struct device *dev,
 /**
  * struct v4l2_isp_params_block_type_info - V4L2 ISP per-block-type info
  * @size: the block type expected size
+ * @block_validate: driver's callback to implement per-block validation
  *
  * The v4l2_isp_params_block_type_info collects information of the ISP
- * configuration block types for validation purposes. It currently only contains
- * the expected block type size.
+ * configuration block types for validation purposes. It contains the expected
+ * block type size and a function pointer where drivers can register a callback
+ * for additional per-block validation purposes. The validation function is
+ * expected to return 0 on success or a negative error number for errors.
  *
  * Drivers shall prepare a list of block type info, indexed by block type, one
  * for each supported ISP block type and correctly populate them with the
- * expected block type size.
+ * expected block type size and the optional callback.
  */
 struct v4l2_isp_params_block_type_info {
 	size_t size;
+	int (*block_validate)(struct device *dev,
+			      const struct v4l2_isp_block_header *block);
 };
 
 /**

-- 
2.55.0

