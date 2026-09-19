Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2844130F7FA
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789778835; cv=none; b=gPmFgZPWxQWWu1DU+PbCuTViNvN1LtbXWKwLhulCFGr99kz9l7omhFcjesGla14xlRimUgOxZeWpWSOe4Ry3cRkXGEOQlczIl4uanlUoMsO6xc1lGjlNZeoXrrTD77C5AwKAhY55zrBVaJb1lMPSFt9NcSi5TN1F/YG3AT/DQSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789778835; c=relaxed/simple;
	bh=IDt6riC+ud1vWZdY0rkvd8nqlYoEXC9R+MXprbYJAhE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fIkYR9hbdK6tSF7MDgM8qs9FrScVRRjtNxq63iPSmjoROUG6SKf1gHyXb0ngxcLJ+iOHmRAFoxJDAq+/kbLQqEysyPLfXeBkIK3ntVWSq5fItJ5klC+1FSXih7qSpyKuqV9yGuQOknoG4Fx/WHKt2ZA8Mv7ptXSitGk2piA4U2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUIfR5GP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUIfR5GP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B681F000FF;
	Sat, 19 Sep 2026 00:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789778826;
	bh=0+tRIUSk/vz1y8ca3AElj8USwRZtbN01B6VHqlMiGYs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=TUIfR5GPGnxk8JG0Y0+CMgb86/tByNuCgghAHDo2YgtZKCh6Rf8mHSb/oOAk+V+5A
	 IWM9EBnSpzq1+jQCedXGyY6nb/9qAUv/kYyZtSIikJuvdGLDkaURny7YsTQsCkt8nF
	 QtknLanwlcXaSv3qhj4cOGSoeliqqAly6FqDBppJSvaGWa9UAbMwMJrOy+jDVNX/vx
	 9gJmgYW6Ln161BJ78d6m1qLVjjErl8tjCvdW984+GujP0YeAtuM0jjxD/wzCK+rMrJ
	 8Sptfn1eiXBvR65P79iXCIl3NdoiY6DWjNU2naQnND/+CXgb4ph2Q0WYOzxmUGRYHR
	 qg/IhqLwabtwA==
Date: Fri, 18 Sep 2026 18:47:02 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zongmin Zhou <min_halo@163.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] riscv: hwprobe: use _BITULL() rather than BIT() in MIPS
 vendor uapi header
In-Reply-To: <20260917062306.46978-1-min_halo@163.com>
Message-ID: <795bd810-d382-3b80-bd3b-041b6742fe93@kernel.org>
References: <20260917062306.46978-1-min_halo@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Sep 2026, Zongmin Zhou wrote:

> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> BIT() is a kernel-internal macro that is not available to userspace, but
> the MIPS vendor extension uapi header uses it without defining or
> including it. Any userspace program that includes this header and uses
> RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL fails to build.
> 
> Use _BITULL(0) from linux/const.h instead, which keeps the value at 1,
> so there is no ABI change.
> 
> Fixes: bb4b0f8a1bcb ("riscv: hwprobe: Add MIPS vendor extension probing")
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>

Thanks, queued for v7.3-rc.


- Paul
