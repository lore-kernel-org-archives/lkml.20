Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889DE3D3CED
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790548481; cv=none; b=WU0Ix+bE2pWCrlKokIKqwmKkV+FPDB2tw0064FXq7l4nL551dRlxZqhMakxO8jS1Wg+2mXPFSXOvRIfix30PMG0qWh4o9r4F8QfzpBiWGQZitHPBW+LRz3c0u3RY4HxA8uCBOxLuV+UucFS9MQDlnWMyRRx5qoFYZunHN7fkAT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790548481; c=relaxed/simple;
	bh=oschAN2lEnq8fNXOBOQSsNZIzFqKsnR3kjdIZzoSwbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjK8W8Th9AI6nSN6NJ88YdXEP9ctHvgVXSc+ewfnyXITT8UMkLJmLDgV30lYAp+uHtnz9jM7aciRFKdiSOqU0WL7Bpjd/memdBwNjfVXwpSCVqq0xBxcTUSresAFWXNSj59Eg66jqmahryBvcTQdw91DgDJAiWs+TXH5SGOBcm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=zxqOYY2l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pA/c2cU7; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="zxqOYY2l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pA/c2cU7"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 948101400017;
	Sun, 27 Sep 2026 18:34:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 27 Sep 2026 18:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790548478; x=
	1790634878; bh=kXdCDsj7PCz9tBxPu0AxVk59x671emrRsxu29Q8opC4=; b=z
	xqOYY2ld82imEa9qKNkbo1EPuz+ckfixBKhchxFDvDrKNxOuP3da0uRwuRuAb15p
	Fwa4iuXtBdQmU4a7iM3N+V+6xshR93s7CxQ5QrHFtZvz5t8rMKCg4zIspyJuYhTz
	/6LwdVETtBTAuDAnzu1Q1A/4Mj/aAEvmRn8OIvLiblYjmug38e/qmCc6pnw/eoAM
	Bd4ut0tJrOHPkps3d2t0TZofwXbGziTNwRPW3Zw/M4tBq8WJjCot8zYr4CLzAnfc
	rPdaW3qKod2DRvvZ1LaK9T/pE6CzRTSTIc0l10UyBes7X/dZSMcVGjx5xtTWXJzT
	Mg2DB5mRcEWpgArxvTJGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790548478; x=1790634878; bh=kXdCDsj7PCz9tBxPu0AxVk59x671emrRsxu
	29Q8opC4=; b=pA/c2cU7QhchvxTqUFTDOcnn6u47pQU/ZS2qVDTXU60Hk8+omaq
	OK47eY5JcptMgzUddmIH5edQgQDakK37R/CguCNB/8GL0IFLz6YHTdovvX9jD5d6
	3xoGRSbGIwQ90RxEeJ04hCE/6xVRKTJoQ+VdoEd2rzBg75GIndQshih8+GjXDlcx
	1NKJxIjsAYR7AYjLrjhx8IiDg9CnPzsT3NWD9rXJuJKIxOYjYW9OPkYjPeeupd9o
	N4/mwU6WOXWpCza38JeZq/3DcloXAM31ylIXHtUSfqOm2gaiDiPMxxyoH+Eb0jjx
	PM3RiPbaly0YFQFL0PXTJMXduyp96FcsBzA==
X-ME-Sender: <xms:_pm5aoM-K4LLWQRyoltvtGox22A7eY1DFBI9m4Oq1gc4PtzHfkaIgQ>
    <xme:_pm5as6YMakoRYg0tF1HcWLmC5OJs466EP1j8vOQHQhkNWr6Kn_BWUsrm0desJ3O_
    2u_6eW8tYLSB95LNdinNo6iEI_Uy-aC-CXfpQv6YZSc1Yv1px6izB3Alw>
X-ME-Received: <xmr:_pm5am2hFQWDRnPwo36RJbGfPZAO0WWLlZfn2-DGyTPEYwoskva0jX9awEndfe86WCCQ8REoCzgpjTZncr76kOWcmpRK>
X-ME-Proxy-Cause: dmFkZTEeNb0L0+0CDhiH92gfRMPGOjy+7Cf6o9i219ed9wCywrMiwE/J0pp107zGJluIe8
    KxartfzhswGn4WDM4NQzgJTyy5+J4rbUqF4uFGfh+LdNrSdSuZRIntAizuTBa0ari08iG9
    XLj+ESSAF7+hQsbr5nG1qnM6lqWKCCE4mizHHEUr11+GMUmhEIGIUMGJe8KL566m7Kx59/
    eeXQfGMaaWqktwUdlgNm2moyHkq8S6B1VGbE/A4rkpZ7cvb8RYlKJHsKE+bW0ZaamO34/m
    P5aq0CGaIcG6eT6mpeKFTVACQUFy50MknndeoxByFTjhwp/liPMH4DHcPQUZngp70jztL/
    Q1Z+GwJacaR5Z/YV4LppV94uruFUNmurB0ZidB+YCt+kacjbM/1zVDY4X1Is30ioGizv9s
    /7USFhreq0Ar2RjAS09fFkK1rlHoS4PFrF1rj2u+pjNwFh3lY7udearPDeIWkaa4KPH+0r
    ytU/GPK+vqz6/NH1DcJG2I2xJU7eqiciW3W36oTo0oUsY2wU93CuQFZNyLmp1FWOxu8ejW
    EyjwkP+blCIgbuWak40cmlOKZ8l7T6hFhvExBZfP75ByJBcER/O1uOPKZjsxVxIRIEC8e4
    jQVSjzx7mBL2nU6G4pVv4IWCMZZ0UsyMag0ApSeFNyIckHqvElvgnTxNXGiA
X-ME-Proxy: <xmx:_pm5ataUUY1sqFDaDQWF2COQC_thObB1SPGESwMYK-hyaYW2x4tEOA>
    <xmx:_pm5auBVURx8QzlWABf3U_r92HbHLbMab6hTpBpWwegyngIyxLeQDw>
    <xmx:_pm5av_HGj5Re2-WV3YDa4hQyXoUN41l9P3VWjQFSvEzEf6TUNg8GQ>
    <xmx:_pm5au9JqDYTYkSTo8hPD8X2bdM0vOu7N86nM11IieQi2hqldtr6VA>
    <xmx:_pm5anjTEYC_8uV38mDzub1Zxmz9PCEI3s0mhAUUEcaYPIzAD448meGu>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Sep 2026 18:34:37 -0400 (EDT)
Date: Mon, 28 Sep 2026 07:34:35 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] firewire: core/ohci: misc fixes for transaction
 cancellation
Message-ID: <20260927223435.GB90046@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20260927044407.65497-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927044407.65497-1-o-takashi@sakamocchi.jp>

On Sun, Sep 27, 2026 at 01:44:05PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> This series includes the misc fixes for the transaction cancellation.
> 
> Takashi Sakamoto (2):
>   firewire: ohci: remove unnecessary branch for timestamping when
>     cancelling transaction request packets
>   firewire: ohci: run work immediately when re-enabled in packet
>     cancellation
> 
>  drivers/firewire/core-transaction.c | 17 ++++++-----------
>  drivers/firewire/ohci.c             |  2 +-
>  2 files changed, 7 insertions(+), 12 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
