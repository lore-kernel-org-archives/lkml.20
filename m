Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3254A92F5;
	Fri, 25 Sep 2026 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345722; cv=none; b=LuNT6jeR/KxMo7MOp/KwrVkxZ/R5LZIK6Wct5kEWsHHtlku/HU2opAAkUS5WZ+qk1anJHpDau6X3NFwvc+F6oJ/p81zqSDBcp9bRDZzDvi1t2s5cH+lB+wgtg/5DpTHN5bAR2y2Q9fwfR31YCRn1oLZAoP8F2BSZ2SnKIKVeBeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345722; c=relaxed/simple;
	bh=yXd9tihnSqkBZfm5hO40PE6JuN4MPvf9pjMEQFp69Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n94+HraujSSb6HNGJUYSCGrRCfwGhA/5ZjwODzVXz2ZNdUbeQMdFNz7eI1fLhxOMYCzY9+YKyp9xM0zTETaGno6JrAZcuDxh6uwp9u/c7fYQHSP/A0+ml2+2HVPTiM8iautR408N7k9WCRGdufedDDjg67YqUkmCnJarbftQCRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKhRgNza; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKhRgNza"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFFE1F000FF;
	Fri, 25 Sep 2026 14:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790345720;
	bh=QNRVE08XNL8weoj1eMUxrm7F6SBjcvdZ7aMdfsSYIbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JKhRgNzazg80gXnNcwfYPIEaG8eaufiDcySi/j+rptYuyEURmnguC01YnD1UAdBke
	 EWXQHeWoLEutirRq7X2uIlqdQbnQqJpc63A7yBc3YTfKYdRcPO4C1FqWA3ijYaj5md
	 d66NzZJ9EST9Z7KVoOlbcf15B1FTUmQ/aQmr7gtgQUqcVOdyKUMrfTOy7tP1IkBmw4
	 TxeBEgUiZ/g/bEhsV7YLBp0dEKvDZrPx5s88b79RR1aDRm/o+jlGBJqvrptBYgOY9z
	 8F/plfnZKRGkCrMtPkTg3bwZjz3qHA16sKEuwpUmZhs06HrPTHqxA8q7MIgLYY0Wgx
	 t4vrjgTyttOCA==
From: Bjorn Andersson <andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	zhangfei.gao@oss.qualcomm.com,
	shengchao.guo@oss.qualcomm.com
Subject: Re: (subset) [PATCH 0/2] nord : llcc : Adding LLCC dt bindings and SCT configurations
Date: Fri, 25 Sep 2026 09:15:04 -0500
Message-ID: <179034566352.1095282.333876260413307604.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


On Thu, 10 Sep 2026 18:30:42 +0530, Anurag Pateriya wrote:
> This series adds Last Level Cache Controller (LLCC) support for the Nord SoC.
> 
> Nord is a multi-cluster platform with four DDR slices, each containing four
> MACH9 LLCC banks, for a total of sixteen banks plus a shared broadcast OR/AND
> pair.
> 
> The series consists of two patches:
> 
> [...]

Applied, thanks!

[2/2] soc: qcom: llcc: Add LLCC configuration for Nord
      commit: cb85751e5e47ecc68806f6d78b0bbae6e699ee09

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
