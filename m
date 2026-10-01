Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6172323504B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 03:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790823774; cv=none; b=Yx1CXQXzftBHT6SnvWOPK5MFnwUygWY+cxZPWxizRvEDVI/QyTih+s20EVy1+BcPRaMvBa82ZLcVPd3jMA11qKUlSUSzg6HhgGDrzu2yftjeuLw2b53kFQbApURYIn16K5N9uehNN37zCuBlWiKIEt1iTuYZUAQ4r9aduyHvLBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790823774; c=relaxed/simple;
	bh=aRy8Rd2rIsFBdpjUiZUn/PWPdq6YV3tMrLibOkP3RME=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nWJzGioZQQXudOdym+BDM2U+Nawmkw3HlpRMXEs97BDPeczrQKS7GNpE3W5Bfm4SBcrKkEruTS0VeF0VXbo3BNUBQBfMG6zm7BE06VSDKUeQ/TGZhcUWhC0ZOY1A7vhAMgmZiYvGcxhFp9uRinMV7mshGx5JRD/7rjRDie0656A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzN2KcBA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzN2KcBA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCDD1F000FF;
	Thu,  1 Oct 2026 03:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790823773;
	bh=UO/EZ+4mK/RfywN7jxK0ju9lZ4rxM5xI5JsuM9aYX1k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=CzN2KcBAxFhJhVSEPt9BiT/U4v8A4huAm8aAKHOcncmc6vb67yzz61gXMdLQCMBZA
	 0iEN8r2JujkattLoXvq+AwdLLt+d/Id9ORSIlygLc4q0+1CF3O8DDhnM/5OhD61Xlq
	 0HvlErMuEHuI7lCb0brpR4V1IVlOLUzNodnY/L8b7n9QARj4e1XSLSa5DFveYbug5z
	 0rXtvOheeHRWJCEpR6zfKN7omfKJ01kFdoEQfSqvGpRoGZRXoVxhX7QDrMjz/iJDfI
	 SY/GCsuCCTTKh9EiySmvejbjIrsDSRh+15CZL2QyUfZ1KE6vJhN36E6svD+j1OZPw8
	 ip59IOlMKrWzw==
Date: Wed, 30 Sep 2026 21:02:51 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Samuel Holland <samuel.holland@sifive.com>, greentime.hu@sifive.com, 
    vincent.chen@sifive.com, zong.li@sifive.com, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: errata: Add SiFive MAL-9092 workaround
In-Reply-To: <20260817-sifive-errata-v1-1-6a80f1a2743d@sifive.com>
Message-ID: <a26672ca-adb7-a715-37d3-99da4a28403e@kernel.org>
References: <20260817-sifive-errata-v1-1-6a80f1a2743d@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Aug 2026, Yong-Xuan Wang wrote:

> SiFive cores with MAL-9092 require fence.rw instructions around
> HLV/HLVX/HSV hypervisor instructions to ensure proper memory ordering
> when accessing guest memory.
> 
> Note that HSTATUS.HU is cleared during KVM initialization, restricting
> hypervisor instructions to HS-mode only. If future changes enable
> HSTATUS.HU for U-mode access, additional errata considerations will be
> needed.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

Thanks, queued for v7.3-rc.


- Paul
