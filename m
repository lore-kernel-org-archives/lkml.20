Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430452D0620
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790473064; cv=none; b=WxxJVt2TG75suAlrON5OMIZrDj6Jwyz/dgVLNDGPQQvhMYlEVRQyoQR8UDHGBBDis4yW5aTVvvvm3ZwE1eNxXjgsboGvavY0roP6uvrcvXd5AJrxuadRWUmnX5nPOfJkW6fuLBVA4X+uHXqwUV9iCrLfF55dxIbpaJwihsUAsU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790473064; c=relaxed/simple;
	bh=F3TiqgSqTb/McRSF/sec1QVKll9PQapWubq5ldfg3uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVmA0emOiUJDpaJugw7xYLerHO5y4bPwCVtQ6/mvA4aSBlQQ2RhTbSTpWiVDPjMyabxNZa4h6OwOEyYufrh7D9Zc/3JjmEDYZE08sy+sOjrs/FsG9Se4fXWI8ALV7x06fBrkiI9eMtayN22tagSuj5BgXahCRB6w4dJSqfykwPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=k5Qk1pA/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=R112BIlI; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="k5Qk1pA/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="R112BIlI"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 49FCF1D00085;
	Sat, 26 Sep 2026 21:37:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sat, 26 Sep 2026 21:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790473059; x=
	1790559459; bh=oqM7F0AQ7HJKbGzV/tMCbU1oVEFTN1IFEpiOJzgH9wI=; b=k
	5Qk1pA/h7QDK9L9GPFbAFPCadG+aMoNuIDfx1dMkgKJ3UKb6xrCdOBOcO+9EhKzk
	1+sQHia7j9L7mXxzdMZC5g/dxWyPPFd9Rr+/12JY5uxCecQ3ams2sjXGEjLXsAdg
	XWYRAARwikdfsJYKG/dHAfuoQXHGhip4/i0ifTeec42Q5NeXF6PMiMEpYPToKBBy
	kLQK1XyHX0efatjQb3ePCdqKRnQaFAmmOBt8cW88N0phkPsvix9+H/ykAoO6XRFD
	vWgW+AFqLfUReGryXCd+mZ0OzW3UekZGV3QVIoPyXa2ZwlUGVCdgcaZMQTxETbX7
	cTZViHhKOlZL7jh4UVrTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790473059; x=1790559459; bh=oqM7F0AQ7HJKbGzV/tMCbU1oVEFTN1IFEpi
	OJzgH9wI=; b=R112BIlI+OnGWrNhtJ7QsguVKlZBUPjlE8Vp/dAVbLI8pmO6Hpa
	paLFPYYuXkvowBXqyhwPBp+vEEkjxlEfbGJp+HdIF2ZUJSWPTBOP1J+V1JH/mQ2n
	Mp6E8oZpIChKswEzagT9pgkYoVNKI1HDBL3VE8GgjAp4S3fYUXp/pMCPZn0sUbol
	4h06CssMbBtn1SihaLMm5F4w5u0FwaoNIz+tOIhnLHJHycs5aMJK9UKPaGV2CaxW
	djkAqsa74VQv/x5QzHDP+n7LJKPTGaUajlj5Au7ZxaW8KtpfNaxR6oVhKaiUIRJh
	FYh2uB2+BO0CqjWyfTsW4fARf5kyiCQc0Aw==
X-ME-Sender: <xms:YnO4aoFByvUoVnQ4Y0IfcZVq_G0pF5UKLK_6MrqAw2f9oY38VpJbWg>
    <xme:YnO4apFNrofXAcd1CUTdPaM4hy6YxwdQlgXs532KooNv8Vp-zdEh2uq2mywMTzS4S
    FX9H8UKNFIFlmrKIxJ5stLNCFP2WeBACLtgBfqzUYtiuivJFFLdFIne>
X-ME-Received: <xmr:YnO4alPI9AgHSzFOWuct9K1hqo_ztA0xHMEw0Coz38PUkCTmlsD0d8TZf7JZ50zvF9p3t1d11fNIXXfDb34HPPATHCSqxA>
X-ME-Proxy-Cause: dmFkZTGdOo5oncFA+7C3h08R9JBTykwe/rhQIGIe2usItp86p9pCN3hA/ehEJ9c1yVnEIk
    7qLccJiPQ42OV073AJo5aG0oiUwvmQT8JhKB4LxdpEIuHvAni/GrouR8fNeQ0e48jtDu4S
    cWWWPHO9IhbiIcwrQiImr+kzAa1ho4LirGLn6apx52DAgjZUhdOApxGp5OUrmYQHji7VNc
    MhXYWASEotxnxJala4AifQEAkObhDf7KERq9KZ1jFzQB6bBUXH0LQVFUOt6B6cAdh2JPgK
    fTpJwmAIFFZ3ZW2QJSl6KzkDc01SJPEojTwHbqCcXLlBxY7kws4PS9hZEU/ERMWK6OeyWa
    +Ui/YicLN/MuV3nLTj+PVYn/HPYJaQ4QJiiLswfnW6eOnkIl1PawW08uBgVo7nQAbHrCVE
    ySYQYPwtaNky/kS2kSPzh/qkWCcNTVxtvKgeguKESBawUgnee53GZA7ibL4XixzGV9/zZ4
    9D1uz5u1V0O0xo4PPb5dCxXokFbXyZv1pK1C9wt3TLspbbrYYp7JCEE8pdT65HQ4rPBboA
    CtWN4IQImkc7Qi6mSaKjUYgkRroK/Vk5KPcNxzu4GINFzlcE6Gtem7/fB6EbHeHqHESJXp
    9zOQfb6ejC8NNrhuhqPWz698q5aNC0X7JQFudSlRawTv8BxlMkDLyIh4A7tA
X-ME-Proxy: <xmx:YnO4aoFeSW0LfwT2wYUis74JXdWg4RLviMGRjpm2R5VmjqtnokQ_Qg>
    <xmx:YnO4asMs5N1c79Xsno5FrbsVFwXtYIc55GOwqUzg2c3nwn4s5Nqe1A>
    <xmx:YnO4ap8BUTtTB72tKe9ix30_0hzhtiFhrlewFIaKzatgPLzkUb5siA>
    <xmx:YnO4aoSYcNcFRiaiL5HaCruu0A2AYs2yX7-_T3SvQT1BudPgUSYWYQ>
    <xmx:Y3O4amTRe4MWP7I6s7m7DtYj4GIYh69MB3YfkEI2IrS--VJkiuOSOI81>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Sep 2026 21:37:37 -0400 (EDT)
Date: Sun, 27 Sep 2026 10:37:35 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org, dingiso.kernel@gmail.com
Subject: Re: [PATCH 0/2] firewire: cdev: fix client refcount leak in
 iso_resource_auto_work()
Message-ID: <20260927013735.GA9201@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, dingiso.kernel@gmail.com
References: <20260923172328.277232-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923172328.277232-1-o-takashi@sakamocchi.jp>

On Thu, Sep 24, 2026 at 02:23:26AM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> This series fixes client reference counting for fw_iso_resource_auto
> objects, reported by Dingisoul[1].
> 
> The issue is caused by ad-hoc client reference counting when scheduling a
> work item to handle the iso_resource_auto client resource. This series
> holds a client reference for the lifetime of the fw_iso_resource_auto
> object instead.
> 
> [1] https://sourceforge.net/p/linux1394/mailman/message/59317811/
> 
> Takashi Sakamoto (2):
>   firewire: cdev: hold client reference for fw_iso_resource_auto
>     lifetime
>   firewire: cdev: fix client refcount leak in iso_resource_auto_work()
> 
>  drivers/firewire/core-cdev.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
