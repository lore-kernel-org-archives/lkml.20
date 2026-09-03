Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67BD4F6474;
	Thu,  3 Sep 2026 17:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456043; cv=none; b=GRURh2yXPGpVMKh2STfJsSoig1MXcw0dwz+pCkFZJbu3ystEgP+XyR4O9kjALaG+c5d4Lx7crGn/PVoHoa86Ei6XxbX+GkLnBjb966a1GAPUTz7HxBygZUyYy8ZDUJ0Mzul53U9dAZTVmaVn9F7UOqSncbEBZ1o4P/fQSmCwxlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456043; c=relaxed/simple;
	bh=hRXKvH9w8fISNmtd8U712PReZgp3JmN/t16hyXivYHc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b59K70pp8hmclU2CdYMn7wLWioQ9xBbl0cQt1YPB/lSxa63TIHoVdwjXJeHiO2OjBp2WaZwXOqTuCSUKSNwjG8DJE/LJ9PvYcwPsRYrnPqrlzpPwsqFtBhg0f5jctQs5Z833qCgNjJcJ83ZCOQAS1OtAI9PPdwrkjoQxcsWuBrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPuykotb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPuykotb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E7B1F000E9;
	Thu,  3 Sep 2026 17:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788456041;
	bh=z+5fcCpSjPGMqWPcNM7nTRCPg6aIZnG4K3zil3JFU+w=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=EPuykotbXXzm3atC3f7tbd9ORtpvwjNjJ5xmdTUb/RmEbBfDlBCbgprXpO4DWDXe6
	 dagTDG31d3Wwp6oJVFmFwVLia70QuXOoqFkV9U20pfNsAahSZK3Enl3hb4wkHG44Wy
	 LKs63P45xYdW+uruP2j+gDM4hiUBoQvCCkJsxUMZZ/cd0/OKO6nrTWL+id5JQqvZ2n
	 rLlm1f3lwfZXZlnf/2huDqGXQyBOhVDm+DN57bXhn+dAs/1phEzOZL+uRzqRGCov6i
	 1H2OtetVdjuPFylVoRHZ0nXYrplIBJKwTcqmfNYiaF25JShGMhe1ksv0HwR2aqnsxr
	 dTxOTvzGbtFdg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] soc: qcom: smp2p: fix __iomem annotation on entry->value pointer
Date: Thu,  3 Sep 2026 12:20:32 -0500
Message-ID: <178845603567.348193.5253103235451005367.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623085931.589735-1-ben.dooks@codethink.co.uk>
References: <20260623085931.589735-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Jun 2026 09:59:31 +0100, Ben Dooks wrote:
> The entry->value is passed to readl() so should be marked __iomem
> so remove these sparse warnings by marking it __iomem and do the
> relevant casting to ensure no further warnings:
> 
> drivers/soc/qcom/smp2p.c:280:64: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/qcom/smp2p.c:280:64:    expected void const volatile [noderef] __iomem *addr
> drivers/soc/qcom/smp2p.c:280:64:    got unsigned int [usertype] *value
> drivers/soc/qcom/smp2p.c:318:34: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/qcom/smp2p.c:318:34:    expected void const volatile [noderef] __iomem *addr
> drivers/soc/qcom/smp2p.c:318:34:    got unsigned int [usertype] *value
> drivers/soc/qcom/smp2p.c:446:26: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/qcom/smp2p.c:446:26:    expected void const volatile [noderef] __iomem *addr
> drivers/soc/qcom/smp2p.c:446:26:    got unsigned int [usertype] *value
> drivers/soc/qcom/smp2p.c:501:33: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/qcom/smp2p.c:501:33:    expected void const volatile [noderef] __iomem *addr
> drivers/soc/qcom/smp2p.c:501:33:    got unsigned int [usertype] *value
> drivers/soc/qcom/smp2p.c:504:26: warning: incorrect type in argument 2 (different address spaces)
> drivers/soc/qcom/smp2p.c:504:26:    expected void volatile [noderef] __iomem *addr
> drivers/soc/qcom/smp2p.c:504:26:    got unsigned int [usertype] *value
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: smp2p: fix __iomem annotation on entry->value pointer
      commit: c5b0ca559afa50ce4ab39e85da927261814373e2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
