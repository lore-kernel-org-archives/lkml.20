Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998DA5328CE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878512; cv=none; b=Wguaain6SyCYEF7LYtLqpHnkyQrYLPL35XaK7LocU8iG4fqiRLybq8rINRDfOQ/0rEwwsq2UYlPjbzr2glBpy/MHqjtnO4EKht7+tjBH66Q/4B54R5NCrIdWJ2fvbx3F1bsYTFQD0o0/z7SQstHLLle/fqXaypgP4laRLeCORUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878512; c=relaxed/simple;
	bh=q4IrRH2JrxpQrUM+6fLd8M1/lAbknHqV3erttKrp1Ww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dt3V2/YQNeFIb15jRfO5Hu9NsPkDE0SyEkZGuR9pqsz4IBSM8HW2GcOFx//OZ3SBUPVFUFMtUlWthnz3twE2MLVEPeH9Za4ka5RAIP3texsLKrNQP6u/GHAKel0+UdG5R28TUrWSdx/n0TDAGrkTUDGnfYCccWKe2C+PjrVHgP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHduo7eQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHduo7eQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91661F00A3E;
	Tue,  8 Sep 2026 14:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788878498;
	bh=P4yh1YDa4qiRjpDachno/HB36e4Qt5xuQs83HwxTOPM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hHduo7eQv5j+ztzaIcVG8nJCXp0XPqgsP0Fb+a6enp4p+AETZeJizNLvVVS8itmQ0
	 ug7nma0B6di6xwKZB2Ubqf4byVXEfaN7Cz1w6o6WRYtKdoQhEylD5WSZCV/JDhy19s
	 bGm+StHsqhHT8Nazla1hfJqBlLvHSMei10domrUT971C3wFk72Jt8ngas/29M3KkLr
	 pE+d/KpBp6l1NjXjuNSSHN7WETevHQwuy+IRg3cizl2bzKu9RSaT77rwVFDUGDpnSU
	 +BvDw1e/YLGvFMYqcB5i5Vm/nH2H3VhWp9+jvh35vCkHW4lJb0D5KDOqKlvVD3C8JC
	 V7vxdmwryXmPQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260906200304.36932-1-skunkolee@gmail.com>
References: <20260906200304.36932-1-skunkolee@gmail.com>
Subject: Re: [PATCH v3] w1: fix spelling mistakes in comments across the
 subsystem
Message-Id: <178887849748.386322.9144479832345130217.b4-ty@b4>
Date: Tue, 08 Sep 2026 16:41:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Sun, 06 Sep 2026 14:03:04 -0600, Ivy Lopez wrote:
> Following up on a prior patch that only fixed w1_netlink.c, sweep
> the rest of the w1 subsystem for the same class of comment typos:
> "loosing" -> "losing", "deatch" -> "detach", "messagse" -> "messages",
> "continusly" -> "continuously", "attribut" -> "attribute",
> "deactive" -> "deactivate", "determing" -> "determining",
> "discrepency" -> "discrepancy", "rerurn" -> "return".
> 
> [...]

Applied, thanks!

[1/1] w1: fix spelling mistakes in comments across the subsystem
      https://git.kernel.org/krzk/linux-w1/c/813a5b9a3c9f6cee830b1e23343fbd2359683557

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

