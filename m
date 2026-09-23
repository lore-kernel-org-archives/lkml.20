Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B070C50129B;
	Wed, 23 Sep 2026 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166943; cv=none; b=maMBYJTXnu7Z8sumEfzWwcDiI8i5YGDU9ZMLD/YeR/fNYRRZKJLVq/eZXvrV7rQ593PLmQY4UO3etOKg5OvEWVALfACLmKp2XkinwDnXE21Sr8bub/0xFc9oH5KUNGe1dE32bHgP5ouPGDEuGsPwZZXi0tMKb8hgjEVYGwEgdSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166943; c=relaxed/simple;
	bh=qdQllLuR33TX7O6DxEA4AEdwEGu2TT2m7v/EdvW4NPY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iyW/2USrE0zpsE5uaHeYIdpw0gVvMDECiL2czvIkmSD4xpkwO+BU9IHdPGIJLH7xRgq2eljlvRbvdB0BILNV9p8pNbPkQvm6f/JIMPtDkOiKlvGvVnbblgOUHMu/eNTN1d/850yFyIfC275NFW2xxMcRh+QKIXZ/c/yiXPBS5gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBLZsTtU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBLZsTtU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AA91F000FF;
	Wed, 23 Sep 2026 12:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790166939;
	bh=2dK5VRSBMSPWEw+huJwtIt9dDztjXf6C2NVfcwHlD4c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZBLZsTtUzMVMFJzwwTuNTILX6MPQDBXuPdeNaK25DH970Oh6BnIBiTM1qDsvdIDAt
	 9yPqNztLZql1VgkRkzcYsn9orIP008MukFG8vpfLDcNbFCaGj9fCrGH2+EJxZ+aHrv
	 26M9JoGB+2he1EAWIbM3asH7YDMojVdIBrlTMcK6G8OSjbj7KwTnKdZrJ53phQ8n5+
	 nDquiKnPvrX2ib2NEY7kmweTu4rIYLgZVEduzjeM49/4DT0TsKyeDT688+iruWd28n
	 7e3fiVkB8R9Ncs/Mcdg1/nlMjJZeUqOsnh0YQCsETjwEeEagC9ODi2Cg378kJg18mj
	 g9U0RlD6Nes5A==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org>
References: <20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org>
Subject: Re: [PATCH v18 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY
 driver
Message-Id: <179016693496.140073.8850264206608452874.b4-ty@kernel.org>
Date: Wed, 23 Sep 2026 18:05:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 17 Sep 2026 00:58:37 +0100, Bryan O'Donoghue wrote:
> Missed last kernel cycle, received some additional asks on data-lanes in
> the meantime, reflected here.
> 
> Would really like to merge this in -rc1 so that a lot of other CAMSS work
> and SoCs can be unblocked.
> 
> Changes in v18:
> - Removes clock-lanes from schema - Krzysztof
> - Split-mode data-lane fixed to 3 - bod
> - configure() reject lane count different from DT - Sashiko
> - Link to v17: https://patch.msgid.link/20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
      commit: 3b0140f37d25b99cf4c881ce40bafd02d9781c5b
[2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
      commit: 772ff99404a101e8d216f869c606cbd0d1d37752

Best regards,
-- 
~Vinod


