Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BE8361959;
	Mon, 28 Sep 2026 03:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564407; cv=none; b=RR2X/U6eTJxdyf5Jz+qPpMhQBjbYgTgLuHEpzDpFY7wRdhv9B/w8rh2n9x3wuapRbGvQt9TxPvXOwMD7rOr1nyYPeLPkUgVAofjv/Zw9PPl7nI1f8+oI5XJSIXzPvkL9tUEpy55+W0HFS61CnxmpqqihV4g0pZEbJNKCH2u/oyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564407; c=relaxed/simple;
	bh=4CoyWi5b3vpb2xq8FBEWxGnXq17PaGB4AcpwuS/hVlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfVCSEPGebAVnpYP46iXmpl58JhEGA87rrL3e1WwyWjAWZrotmXRxKxSHbXpRjleSRC79rP16Qql0N4fexDpy47mp7xZAnbW9/f9mnx4PCrdJXJYeWsWVkclnQpxnhsq4FxiCQYPfKsklOPIZ+XKhkSxQ/31WYaiF2j90M1/EBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8dh0fY4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8dh0fY4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA3C1F000FF;
	Mon, 28 Sep 2026 03:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790564405;
	bh=cdWwE3UKUQnwdemy0zeKITbuQf3uO0e8V2Xexpqfyhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X8dh0fY4bYQBCQAX1hlQ4m/bt90ZtEQ08xvUYFu2V9KB3OU9xuCHCkI7WWpVYzgWZ
	 IJYGbk7rCx7ede0AtEP2hNgUgoqjYpoxXvIONYNtEBCqnJxa15IyL6kQVCWXN1HjE1
	 tyr4ZrS3M4kKaEF/q87ldI8t1/cdDP0z9HTZRnBM7u8hJoM9EgS9tDA2xiQ+keelcG
	 3TZ52iodD79vaglSF8iMrfL5m2S8z2ZPyVkFAgW+/E4ws21Wdoes1JUIABNslaxVbb
	 9o/4miZyKA+oKJgp91PW6A8V/SlnfZgZWzu5jSbybG1spbMS/3huEqGJ7Kx2TmaVAZ
	 KtKJurU7paf8A==
Date: Sun, 27 Sep 2026 22:00:01 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>, 
	Anandu Krishnan E <anandu.e@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
Message-ID: <arnVNhV3DYnvt8Qu@zenbook>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>

On Sun, Sep 20, 2026 at 04:49:14PM +0800, Shawn Guo wrote:
> This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> initial device tree for the Nord Ride Embedded board.
> 
> Tested on next-20260916
> 
> Dependencies:
> - NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
>   from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt

Is there an immutable branch or something? I would need this commit
merged into my branch to merge any commits that uses the constant.

> - Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/

This is v14, I merged v15, now we're cooked!

> - PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
> - PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/

Please don't send patches that can't be merged and thereby sign me up
for the manual work of clicking a bunch of link trying to figure out
when - sometime in the future - your dependencies has trickled in.

Regards,
Bjorn
