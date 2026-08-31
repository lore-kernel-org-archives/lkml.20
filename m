Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7F13876BD;
	Mon, 31 Aug 2026 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207696; cv=none; b=Qyy6a6EhIILch6j7iVTI9s0Aj9tvdM6fq2ZSFUh4UImd6Qz9imak1qcCcEdIKvGWp0rAlXPCVSdi5cKEetp3si9LGZZ2pXQsjomDdwfpmIc9P7Ay4LvHc++0fp9kF/ew7OLBe3kDvdFf+0wKlBevui8En+zZ2juLc8pw+yaT6og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207696; c=relaxed/simple;
	bh=OIprr36m9dfasPWT3T1GTVsOsI15WjptSwPdavZv4z4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LH4Sdh4d2fFVQkCXX3VPEmD3iBJv28BDzP/Z4/B/d2hD9oYOCgor/CudfpLpNRxxNxs+sDLfr3xwYXlphFHZ+9baBavlKwrk2hKjo7wQpxYBqYHZZwT3SZuY98IWuWBx9yxbrQGTntOB+hjANkxfLHWiKJqRr7GVyTpQyKWWSdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TirW5Sz1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TirW5Sz1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E96D1F00ACA;
	Mon, 31 Aug 2026 20:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207694;
	bh=nQKNa1GtkKF4OLAudxXAy4RkCMbz81YKifvGwr+Lg1E=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=TirW5Sz1zgyj5MaI/qZyieaOWP6iANZI5copH0VZCuYSnKiQCmPrjjzjrw8UKOgkn
	 ml2hJhOP4SIWsDw17htY0CqEr8xSWLainPE6XZf/Cm3svGlPIXijyoyOapeZohrX3h
	 G5PnkNzcWwEf84Ii1Sq/SOu+JddaLIxeIRrp+cpcm4Eew4WNCu/ZBIxIWertbgKqk2
	 FyRQMwxU7mzRqUQf/Zgj6zi3RyflRcaXNqDNZH0+IwpQ1Y9hITOLZHYYTr7j64LqAY
	 0IdNVpnYaITkk1jMS2NKV7H0jnQ1E2XyoTVETBLffBtWjNdEsTcFOnhoxsxZbctTVP
	 jAwXod7jA6Sgw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] soc: qcom: smsm: fix __iomem annotations
Date: Mon, 31 Aug 2026 15:21:13 -0500
Message-ID: <178820768637.1699313.9062409495494007745.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623090954.620688-1-ben.dooks@codethink.co.uk>
References: <20260623090954.620688-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Jun 2026 10:09:54 +0100, Ben Dooks wrote:
> There are a number of points in the driver which miss out
> on __iomem annotations, so add these to remove the following
> sparse warnings:
> 
> drivers/soc/qcom/smsm.c:159:32: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/qcom/smsm.c:159:32:    expected void const volatile [noderef] __iomem *addr
> drivers/soc/qcom/smsm.c:159:32:    got unsigned int [usertype] *local_state
> drivers/soc/qcom/smsm.c:171:25: warning: incorrect type in argument 2 (different address spaces)
> drivers/soc/qcom/smsm.c:171:25:    expected void volatile [noderef] __iomem *addr
> drivers/soc/qcom/smsm.c:171:25:    got unsigned int [usertype] *local_state
> drivers/soc/qcom/smsm.c:181:48: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/qcom/smsm.c:181:48:    expected void const volatile [noderef] __iomem *addr
> drivers/soc/qcom/smsm.c:181:48:    got unsigned int [usertype] *
> drivers/soc/qcom/smsm.c:219:26: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/qcom/smsm.c:219:26:    expected void const volatile [noderef] __iomem *addr
> drivers/soc/qcom/smsm.c:219:26:    got unsigned int [usertype] *remote_state
> drivers/soc/qcom/smsm.c:257:49: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/qcom/smsm.c:257:49:    expected void const volatile [noderef] __iomem *addr
> drivers/soc/qcom/smsm.c:257:49:    got unsigned int [usertype] *
> drivers/soc/qcom/smsm.c:259:49: warning: incorrect type in argument 2 (different address spaces)
> drivers/soc/qcom/smsm.c:259:49:    expected void volatile [noderef] __iomem *addr
> drivers/soc/qcom/smsm.c:259:49:    got unsigned int [usertype] *
> drivers/soc/qcom/smsm.c:280:24: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/qcom/smsm.c:280:24:    expected void const volatile [noderef] __iomem *addr
> drivers/soc/qcom/smsm.c:280:24:    got unsigned int [usertype] *remote_state
> drivers/soc/qcom/smsm.c:288:49: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/qcom/smsm.c:288:49:    expected void const volatile [noderef] __iomem *addr
> drivers/soc/qcom/smsm.c:288:49:    got unsigned int [usertype] *
> drivers/soc/qcom/smsm.c:290:49: warning: incorrect type in argument 2 (different address spaces)
> drivers/soc/qcom/smsm.c:290:49:    expected void volatile [noderef] __iomem *addr
> drivers/soc/qcom/smsm.c:290:49:    got unsigned int [usertype] *
> drivers/soc/qcom/smsm.c:330:26: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/qcom/smsm.c:330:26:    expected void const volatile [noderef] __iomem *addr
> drivers/soc/qcom/smsm.c:330:26:    got unsigned int [usertype] *remote_state
> drivers/soc/qcom/smsm.c:635:47: warning: incorrect type in argument 2 (different address spaces)
> drivers/soc/qcom/smsm.c:635:47:    expected void volatile [noderef] __iomem *addr
> drivers/soc/qcom/smsm.c:635:47:    got unsigned int [usertype] *
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: smsm: fix __iomem annotations
      commit: c84cdd308471d6ae4f8121660436a4fed8126709

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
