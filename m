Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6474F798D;
	Mon,  5 Oct 2026 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220636; cv=none; b=T3irbYm3w7kCz4Pp2bijjHz4dUEhS+5p1WgjAbIgv6UGoZ7F5MFeN88SZeJLF4/kyBsJw3LpBj5YB54NqS+6IgpHwvO1FncED91zNt2pQWXjxCsKViYORw4F9au9eWDJ0jeKI3kiI6Th7K0utkPyO+HTLfpfmHV//O+XyWyzMq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220636; c=relaxed/simple;
	bh=I11+8BUSPf0c35MX771UTQRqm0ri9NpCCDMXCrcqZ5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lhvfnzVrvIeDhln82T1ygXWx3hkczml5D4EH51faHqAXFIMHfn3ZqRaOYx5MnRhofaiwoCEIsdSAGl5S7xEei1ZM8VbuWLvZl0UO6+5O9r90XrvHg8AOaihCfUBAPUUKsyvUdf9hqQmxSVfO/kBJ6MFg5BY/6NuYUAxAPjQNSO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmmArTG+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmmArTG+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8111F00898;
	Mon,  5 Oct 2026 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220635;
	bh=KyP4HM1CHZoKh3fWtF1CjwWY6aIgzEtiYTNaVE3oJXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OmmArTG+SeVS3WzKY23K9yoQv6NgQraBXy6NoOlmy0fDJmlC28b64AV3t5SZSyr/l
	 Sb2hzSbBPIZQdBTWb/YA7lIYg41ioLQXFV8eL9NckLt+iSD1M3cPqdJVVku8hw5up2
	 L1W80TaZc1FiX2zoMdhmf1jOPFoOtRmZpZdc9r0CcZW+L8ygBv0RFUaiCSjP3AgPCd
	 18hfI8zaDdD7lDavNFNKqPjwWn+2VbcAYFxu0vZt/dtuyc80R28Rz+kRyVHLwYLDcE
	 KJt3QhIUk89wIUkCwelu9DqxYYbJbsHqE7Uz9Ag14hBHdbpgLC+fUQ9HF3S5Jhwx3T
	 SpL3VTzi+QF1w==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:56 +0200
Subject: [PATCH 26/74] media: qcom: camss: vfe: Call vfe_subdev_init after
 not before significant enumeration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-26-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=885; i=bod@kernel.org;
 h=from:subject:message-id; bh=I11+8BUSPf0c35MX771UTQRqm0ri9NpCCDMXCrcqZ5o=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sTkilnX/dCllpSx5gInYiHMI1XKqpKKqA8u
 OobufluI1KJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbEwAKCRAicTuzoY3I
 OtmSD/95wU4ex9unt+XnGaEwRgA2BDIMk5AomDK0zqRs4Sxrrcs/GYfyjLf02eT03hvmh+WWszE
 M6PgKVZp3EuzHQY21Ce+nhcbz2iJTdzfuJ2Yqh7T2ADfQniZBuilmTSh/zqeehLU9v29cMs/Rjt
 wGvfh3/zq01pgWHSzT8x31nQQzauqDxkKxhU4ftmyru2D8qEWa8kzRZjURM0HXNVX7miv1JW6Li
 JQX0jtNAA0W/BEJk0Irk5/HKOyUFXiQPE9tMT5haE2tc1GbPONDOnoSJwHIil79aKSv6Xr/3HMZ
 UBhor6mgaaOzSKCnHL6wR/bD7wRB24bK42PzgMPvgGxPxE4F8idVMmYHbOub1HBBef903ukD1jE
 REdA2aq4pBvX6a/zxwmjJKAK8Nu3nxvD7oOVH3yoDT3tPJY/bncNvPC2usJKCwGVJPMcKrV+Hv1
 fALj+/nRjqR6pRVsjUk3VU3BzIhFF3L+YZGHJeF662xrKC0r/rQBpAImAQnrXNsXezATHt4ObCK
 YHcNeZJNTctYaNjc2Dfc+MBHnQYdt8OKJadUW8pzZ8G8o2Ok01yfXmlTQEN4wW5m+FGOSD4zoU/
 zqwz6zBRhlSKxYMKnBYbh/38iTtatssBuH2fqgEOKUMigf95Wz3+vhBo1KsXtiMRBmTlbc5J0fW
 ajQ96mT1CWDv77A==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 8899f02ceba02..667cda379be44 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1930,7 +1930,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		return -EINVAL;
 
 	vfe->res = &res->vfe;
-	vfe->res->hw_ops->subdev_init(dev, vfe);
 
 	/* Power domain */
 
@@ -2067,6 +2066,8 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		}
 	}
 
+	vfe->res->hw_ops->subdev_init(dev, vfe);
+
 	init_completion(&vfe->reset_complete);
 	init_completion(&vfe->halt_complete);
 

-- 
2.55.0

