Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3306E379EE0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511547; cv=none; b=lJzuU6yfTNv6DHIN9F54EdRONCHoZeLAcSPlkwszREA5Tgy1ejp2soMbDMVM9okpxdnLzy+t/QWRc4fIswAwonSSNLSMunNeOC1TxEPbEqT93HeZYdv3i23khVGwgtUggGrrwfdI56zjzCz92LBgrt2sQ78GSXXcUAZ/2i99GGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511547; c=relaxed/simple;
	bh=NBo+/xR832ndRTQ4AE5gv8kPnfnQeICy0oFsGwIaIkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCqgBMQXcn8jHBa4dD17zGgh+ffOkh7P/2xpRmVT2lAKJ6f0V51mKyzRWFDjmwgAi6WFDMaSZajfF15s10GG5+k4tKkSuiBf3C+U7BahhFUl3+zv8WJDZSX7O4d5KFTHCWvAY8LJs4pGRemRqKrYF9IJ78lyk77DpVhfVX8K0+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=aLbF4El9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y+8ty7Du; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="aLbF4El9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y+8ty7Du"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 2C944EC1375;
	Tue, 15 Sep 2026 18:32:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 15 Sep 2026 18:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789511544; x=
	1789597944; bh=KbYtFaVMqtRTGoklLXNRSyHMTMXjKH4gLdMDdD5uyYY=; b=a
	LbF4El9I8N2muZ6ma+d3klQ1L+1kwFMJtLXru8LIjJMaOmSS4UEVUJGpuRhHyTDx
	MpuPvD60p5ejs+vRr8sK1+a3ZSzvAWtXbOUKVKnZE2wKqF7IBo37iYu3c3FqVI9m
	oNEuabqUczImUb0NBEckGrFXJuY7kX1G9Z2if/WgAXxicW7Sk879Dbq0mWNDzyAY
	jaHA+xPdeFDpterEgov7bXWOHgtSIYbQwO/JmNsa8LSYGKguwDb2eoD26y3axr/B
	+JNWZtTfAzHh1buObklo/BmiJck9nvRDVWEiIZZjUeYTtD1f/VBugjGQEbiLXL5q
	h/ajZH+qPPzz4nn4MT5ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789511544; x=1789597944; bh=KbYtFaVMqtRTGoklLXNRSyHMTMXjKH4gLdM
	DdD5uyYY=; b=Y+8ty7DuOhwDHaFUD2ROZkSIzQMTozGE2BwwMOBDWcQjhoRl5Vm
	T1tLBvTmIY9h4mpLC+en1+X/3zvvt8late860RADxINHRmfm1+2M29FvE9mvEHqA
	wSOf6KRHgi3HHYCQCztc4FVOmvPcT/R/JLB4w215LhJS8Hod17VA6rHaBBm7naou
	N0ZFed0Z/04abw8BJBQ6NGSrU2Gi6dLP3TyzxssuiAu3CCJaKIqL8qG61RcHc/2I
	sfYAmKtgWG0nuE3SjX4cvX0WITHYopf2/5YkTeHSqxKvJ6pX1T3E+mn+z/WMXrox
	nstAK9KECet+ny4UAk6d9BdAFZTYPPdXSAA==
X-ME-Sender: <xms:eMepatNjAJ9BzwvtNGhD0GlQu0j-H7Or9tDI3azl99tQNVSWp4YyNw>
    <xme:eMepat5bODVi3sksA07jDiwgo0N-qSBeKhrHl2-KAbdE0rhzjEjPWbBR4HijuIuZl
    ITOYft0Z8KjcwPMqAlWSpKtS4-IJnN3tCZkujR6xjU0YIBtfxKZumY>
X-ME-Received: <xmr:eMepaj0P92lw7ayAaKCQSNk3qpnoMvgXkNywGK0bDCR5UDgPyT-IUKdczdmqKmAsOK9AZMsG9amYgmqkiCkxfVFXHzPQ3A>
X-ME-Proxy-Cause: dmFkZTGY9z8Lzz9VK7gla9RwG5feXrDnpnVSKQw0O7EPfO51cw1A0VC9rr6PVhSoalKGD9
    Sdc5RHjVdng1vuVrTudZSfEEdKuKIz5nT8NWtfohaBJvKuo8SYchAk/FPABIeBzC7iSsJJ
    hQRMJVu5xNl57J3oRyDifsni5BdhojmLGVO3dO8NRXC8dTKBwHVbcM1W2W9/fVG/Q/aR7b
    uRjsRSgz4qM1GOZ8xsxMu+YhiT7joMLrT1bmSTv8VDj8bnWWZOv/JLicRoiSSSGtov7Hr7
    NnmAfhBYZgwtrDlJGwNBQrP6TmiJLDjHlMvj/7CQC6aFnTkIr0HEbmCKjzp6oE9N8mI3tl
    ZGw0Dx/rhod8+bKQeUcwpWGmf9cSEZdJ7Dp4a281MQ+MSOmeXPUgrmSckuej3RTzUdsRik
    Q1mbfHII7wsK8rnODCi/RavSZlMS4YSPLqA6B5nzqicl5WoVzGSKX971iUURDuOsjEmtXn
    E4aEgzZEzu7gDDVZXEw9ae54VIQ5ytAaYloCFHAKrWtEaTM0P7BwaLBOgGmXHog5DbK9Hc
    XZeQiCGbSy6ZsFbB84mIQqiO1lSkuj9OS3EaG6g25o5ElqLu3zAkZ/4q8/f4Y3XE1dce2t
    1rF1q1KjW5/E2S+JLy5qdYYQShe4dMb8JhBeYZXcSDz1McTGbxxA4uum7DCQ
X-ME-Proxy: <xmx:eMepamY2tqWFRbU91GdoN75hy3WpSsApmtg-oNKc0Glr92E9c1Z4hg>
    <xmx:eMepajCAEbmW_4P0dW7SH-_TjygUoRK3A9Uu59lXU2ZAfKsot0JBPg>
    <xmx:eMepag-ssAO4lA8WU98hfG7tqrydeOsHENLHpvpZMIaPkZ26gxbe1A>
    <xmx:eMepar_EICGfBV0HEzXTYIGxgcOzC9VgDh4c6hleLHGDZbh26yXLAQ>
    <xmx:eMepaki_KtmYXqXdt0dqoOkFK46UAVVx-OwC4YR_VmejaCXmLGz2I-OM>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Sep 2026 18:32:23 -0400 (EDT)
Date: Wed, 16 Sep 2026 07:32:20 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: core: correct comment about execution context
Message-ID: <20260915223220.GA258508@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20260914221434.213633-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914221434.213633-1-o-takashi@sakamocchi.jp>

On Tue, Sep 15, 2026 at 07:14:34AM +0900, Takashi Sakamoto wrote:
> The comment for fw_address_callback_t describes the execution context,
> but the callback has not been called from RCU read-side critical section
> since v6.17.
> 
> Fixes: e884a8a0c573 ("firewire: core: call FCP address handlers outside RCU read-side critical section")
> Fixes: e8cf6875005b ("firewire: core: call handler for exclusive regions outside RCU read-side critical section")
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  include/linux/firewire.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
