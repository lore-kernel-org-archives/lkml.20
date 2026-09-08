Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FB7398911
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855167; cv=none; b=Ky1GKXr/wp3JIfNq/JbKkhNIwiQP3SnGK51czz2usQ+FKq8XQGXdpoSaPDfWrqq3dExjHxn72IYfLSK9pSKL2LkWTXC6gpa9v7MuoOSW0VN/CxEbRagk9HBRaaGMHd3oWCRXd7ipfuu048kJ4bbKBGwiAa1katpvbzCt7k/XRUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855167; c=relaxed/simple;
	bh=Gm5C8qSONcdskQsXTRsvDJUcMqRHB26auaF/H71nKoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqIrILh/9SLL8a8lDpXpOeK/Nx7DDXF5/dHaGWO2Kf5oT0PM1G9/FDUTeUUZ6yTifRMWMc1V0/+wbg7SudYcp3/6/Y5Pw96zT8/RyMwtEFf3sLUIAXPNGx6/CFFEPEcEamJULhhhK9q3BULslOL76UYvbjb5u1F3UjDuI/RYOFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbNbwePl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbNbwePl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C968A1F00A3A;
	Tue,  8 Sep 2026 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788855165;
	bh=9hCQgMwyEOZyiUh4T4kOYxQD+d75PSrouVNDs1twLyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LbNbwePls9dqJddjkNQYaM8omCK2Sc0hc9gs8D9ioGXi9uBOqHYOGyUhgpruhPiug
	 hEe2k4zFCgA0iEQR79vX8/l8aDSKQPWGU6q/5fmhNdbhcowMVYZfGelWbZZvB73aLT
	 BcG3WbUNRLY1BKsH01wYDzWsNkMU4aFYwpDWG5X1gGiCrE/QbZhzsATDjwfChE7cP/
	 q+0TbIcG5CiJeLO3cz5oLh68vJjGKhwfyTp8ZGeozH/FBuyLgTFU0rxa+RYi94bKM+
	 FU63emFHCWP0awMjk3ZkEL+jaCQG3NmeTxXZBfDUt1osObem/W4h4kQ229lNygezLc
	 MDYV/IXRzmHaw==
Date: Tue, 8 Sep 2026 10:12:38 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Justin Chen <justin.chen@broadcom.com>, 
	Al Cooper <alcooperx@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH] phy: broadcom: brcm-usb: unwind late probe failures
Message-ID: <jwi2ylwxy26swxvwnwhrbsre4luzikatpzjbetctlbyz7gvvc3@zwwiu5bx4bby>
References: <20260615070123.51155-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260615070123.51155-1-pengpeng@iscas.ac.cn>

On Mon, Jun 15, 2026 at 03:01:23PM +0800, Pengpeng Hou wrote:
> brcm_usb_phy_probe() registers a PM notifier and may create a sysfs group
> before registering the OF PHY provider. If provider registration fails,
> probe returns the error with those resources still active.
> 
> Track which optional resources were installed and remove them on the late
> provider-registration failure path. Use the same state in remove() so
> cleanup matches probe progress.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
