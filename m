Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E368B54774
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020185; cv=none; b=iWZpgc4MNlcPaik/2CmakrlPUTxj57buTaG/DKevnMYN1D+BcyBUJvxCdXQKYTUEp7E3UPgwAJUFeAUgIvVYpp9hAFxbVILZkrPOZma6FeWS1YkCh7pHDshQMy++33J1rue1iFQIe//IE3NRm7luQwPab85WaJ/VWVbRiHZo3J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020185; c=relaxed/simple;
	bh=AyCr3feRqErh9LNfQTl3QIWBcUXjJ0kO6uvzCrYtN8s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X7NMWiwxcSmaDPxl/mthFK8MPQkolVizH16CZzzDBvqTq2CKSwEWudSEZO0awNPO0OlPSJNw7HdJUDGXEwr0CBwKnRjDlRkuhdIK9Q535ApHq54WAvKc5EzSAifGJMMX/lnmg76ifae7PJyTlITEy3p+bJJ1i/9nmfXqIwwxAO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENoKWe8y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENoKWe8y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B001F0089B;
	Sat,  3 Oct 2026 09:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791020182;
	bh=FWcGi/CHS/a4B/lMqSn+qerEcKaHZX/sUv9NmysE1Hc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ENoKWe8yidcvyJffyu1+2Qy3LoB4l28Rb/Llq6oZuvybneqkCSvo+13aX5ryXsdoM
	 OxFMFXJ2g3fIUnQ2wkQsvWS5qJXzzJF3N4KUEKdZT/xn8oYOKKImIr6MaSrzX7Zd+D
	 KuT+yzeZU1wpW39GSWveU0zmdSF+pNaAr1TUq4unKmVeqg5/sKQziZks8PPSV7JDZq
	 BKfpz3Ltewwvn1lE5CnjwzI4V/Y+/pnGp4Tg1HLtKJrj6ouO6HAhOCnWEXLpHjtdYr
	 BJ57ih1PnBR6URXx8ZaiUS0Kxl+yWCtWGawKBaeEV2aPKOKqJSZUGwdQbvGl6QomUE
	 5ty+Mc3oX9s6g==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Akash Sukhavasi <akash.sukhavasi@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260708-b4-hi3670-v1-1-f9236f3e585c@gmail.com>
References: <20260708-b4-hi3670-v1-1-f9236f3e585c@gmail.com>
Subject: Re: [PATCH] phy: HiSilicon: Fix error handling in
 hi3670_pcie_allclk_ctrl()
Message-Id: <179102018033.199361.1412125804515687799.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 11:36:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 08 Jul 2026 16:31:00 -0500, Akash Sukhavasi wrote:
> When hi3670_pcie_pll_ctrl() fails, hi3670_pcie_allclk_ctrl() returns
> -EINVAL directly, skipping the close_clocks cleanup path. This leaves
> the PLL with its power-down bit cleared.
> 
> Use goto close_clocks instead, which disables the PLL and propagates
> the original error code from hi3670_pcie_pll_ctrl().
> 
> [...]

Applied, thanks!

[1/1] phy: HiSilicon: Fix error handling in hi3670_pcie_allclk_ctrl()
      commit: 7540fc0a4f667b6773d10753a602a42a3113087b

Best regards,
-- 
~Vinod


