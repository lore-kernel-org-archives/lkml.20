Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA16638E8DC;
	Sun, 13 Sep 2026 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789296997; cv=none; b=NhjpvUglDSIlpanot7KazWnDnNb0q6mD0+b4MevRCAzH47GYOSL9/wGaxliB5PXFWagauUIpm4RRByLa7WiwIn0pTeOlmTZIbgyO9L7BH9Ib6Q4v2p6aBRZKVhxzAizMJtPJPE7bmk/+KpL+PATelVnzTs/xiZOqjznLwk2ynpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789296997; c=relaxed/simple;
	bh=YX38doKEvJOKiDfwzNG/r4W0a+cm/z2ipZOYrFNrrZU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tL2RbQID5qDmJ4SoDeU7MkmEdZtgeJGMYBZUv6cm1yj5PpmqHG0QQzW+0VNQfxiM+7f+dNRpjQ33nuPeHwZ2rwrIkwfDC0LFnifz9DTDoxCATJB2K4dTpGOGyTUIOw7rUTTi5Hrp7de4olA4uijdv9enWArR0J3ioSEJkbHLnfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5nNfUGL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5nNfUGL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BAC1F000FF;
	Sun, 13 Sep 2026 10:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789296996;
	bh=pF1niYnfjh7vJ+1BiQA9FjBf0i42IB7zTZsbxD/S+Pw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=P5nNfUGL7en9tXW4alxr9D1WgfEzOH92KG04BpOntcpvUHyr2v0rtqFXiS/7wUO2g
	 cUOMSPBP9sDBJ/bzyfXkycwdDIqkxWcu7nHgeDeo8MinUfJ28ZAzaOs488K5ESqk9A
	 qeqOcAa/jQVz/QpOLcv/mTv8xmazO1HL6uSfNjsbpeCxdj3DU+sjL7/sC1p5R1fQQZ
	 KNPpMO089TYNtrPzCTCPwpQ5BDhktj28/iSB9qFDqhwd1+BepRI9fBwrpS0u5KWcYP
	 FV7oP4+7OH6BmdT70tHZigQdAm9H96h3R0v+g/PqVWunA5Olh6EWaOauObPAuZ4Pwn
	 jmSJNRcuhcTFw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>, 
 Wenbin Yao <wenbin.yao@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260910011500.659353-1-shengchao.guo@oss.qualcomm.com>
References: <20260910011500.659353-1-shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qcom: qmp: Fix alignment in pcs-v8_50 register
 header
Message-Id: <178929699301.215437.10095052705588925527.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:26:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 10 Sep 2026 09:15:00 +0800, Shawn Guo wrote:
> Fix up the whitespace so all offsets align. No functional change.
> 
> 

Applied, thanks!

[1/1] phy: qcom: qmp: Fix alignment in pcs-v8_50 register header
      commit: 7773e2d88b87c9e7385a5b8edc466360edd31d8e

Best regards,
-- 
~Vinod


