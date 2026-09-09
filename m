Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3783D3CEA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990906; cv=none; b=d77JWzmVxKxIRD9cgLQ1f8WZAzmZKCfAgKEXy1GiTmd4mL7Cf4tmdmWGrGkpL/lOV2HywudCBOMfBCUGY9cep5ZFQKpCHUGBbYQuSGzg/ho36Umod+MaOH3Nngwg/wSPwHhHgaSR6PsgAf9t1V8y5MJDOFGnRYmtTfut8negUok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990906; c=relaxed/simple;
	bh=J7oDJUH3k9iIoteQbQ2pJDjR62h2yoTA2sgKKhziIZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyVtJN7MoPvnUMFrq9rMR6bzeS6lKA+w1Nhb9yypQmWhgGF6meIkVOa+fs7btcQpeGV8wgc6DkoP7zEzY8GFMqgnQ3rLIjmKpjqdrzPStgle08NU6ZlRlt+Ig/X9xKMkyqC/6oxyXuKBfpwXOZomz28jl0bGrmkt4A6ovcYjCzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=7Sr+9CA5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RFvkYm7C; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="7Sr+9CA5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RFvkYm7C"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 9FF0D1D000EA;
	Wed,  9 Sep 2026 17:54:57 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 09 Sep 2026 17:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1788990897; x=
	1789077297; bh=7WVzwQm1CVnNFUjqCIKX439AEH1XbJaF9sGF6SsNBL8=; b=7
	Sr+9CA5JnXa8t0FlyST7zsX6wAozqQwB2GF7t5Uo0hABBXdG8EdpGT85AVzZHub4
	5lihlPKDqtTyXhLNOOQazoa+0g6tTUqGrCZMPy4jm/M9Ai4JzaiztIV242/LW//+
	AJRMUUsW77sy2PaTRYRWMsbD0iC3/nhZFqZnNHrf2/sIt2J9dTviYTeoGB+HKupC
	uSm8+Yx8PhIASALaeLcERqwPWO/CFpklRg9kERhuVZrqN7mB/mE8kyxbHXPVpsg+
	ygSimBz9T7oJt3zPrdN9YBELRfsZWBv/9kVyqRG0z5e5lZDMwZFgMSv2LnRbNREq
	5WeR6vwgQEIiyRjNG9ZJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788990897; x=1789077297; bh=7WVzwQm1CVnNFUjqCIKX439AEH1XbJaF9sG
	F6SsNBL8=; b=RFvkYm7CNsCEYMTozeNAWr9LiWfb2kupjmm3Zr6V1+o7QViHp90
	VWFz2yAC+FM173+ONsV6+KqRNFgKbwDW4aro0yfmqj9egAiFw4RWKvS+Z7ON1k1z
	IkBfDmlLaThPmyE3BrpOPcdDRmwFxPes9AzeBT9m08z6e0GlYlXCotExNF5SmHAO
	YNrGm4zER+s8o+We2Wv0jnyBbAe2dAsxWIxgsezbvb/VXptIe9zgugXJfsBRS77w
	bI5/nBo355sEBw+1LrPWFFw8CIAkoX1i6sDkKuOEeTYwWdq+jRry2GBlTz7AER48
	g40bnGdVAfFhMkwZQAaX3WktRagkY4eOR7Q==
X-ME-Sender: <xms:sdWhav4KPOIpvK_Q-9AuDld5iSMIEljmgXSJ7WdaqVlU98DovpiGDg>
    <xme:sdWhasplY5QzeeIyAbDcuvYrGmHTzc7-FrHxEpKWVDftRARXfBfaeOVYaV1DT-jxz
    ppJ6FYuctFTUvRg3np_--rMtz2mnc-LI5rXwk3tcrA1d-vZzK34DdHz>
X-ME-Received: <xmr:sdWhaphOX-ifRMQiFwQJy_l86H3uvZZS9I04LmymHsKATvlMzpLYf_TokOMejY7dp51r-VmB1N4JyD8qc1Cyoj8A6qVVxQ>
X-ME-Proxy-Cause: dmFkZTF91JdF+XDau9R/lJ7ErOGNdyshi+siK6Tc/Zz4hSJhe2u1KlD1UvV2kpBTXWB1Z0
    zAd2GwBf/Fs+zxj0pkYpMLwwWNPi17QaXdVWLhi5GbaxiJGB+cDn4uq55oG4w4SCRYHZLA
    bSzTNQKz4OVxHoY6bJCVyC+qpJPJng389+jXyxnjF6Qcz+wVMFy/lwuTRPJfanlyRwt74X
    D53UxwgglEo86n02elILiJc7b/LgpFEYaRgrKqEZkZMxtZZlKUd8dOdT6BM4DdEj6M52GD
    YV3zCyaqyIgVr/U3UtzM2EgwIp5cQEkvQxpy0401+b7NVy2ZGrgLs1F++kas3hN9aLAPpy
    sfe0v81TTiEVs0MQzMV7AP+CjEDryQ5IVkenVLqJXl4SSVrZFjR0eFznnvQaah9PZTCifF
    tMscZuPO/ZXA1hHG9eWBwsAUCGiE2YuLX4ynnzLliRh+zn0Kk8B1kVYg8w0dsEt9arHyNh
    WpjF+zawgOgpr7DpY0hEpMH3a86DQjek7k4RK/3UUBc2HmSDd3/77LlqNsowVfafd8bsNX
    xyeTe7O6tiQzTGnKEssnNUZcJ9V0BJLctmCAA+kEMeuZJ1V0KtQ4XROJr9NBGmnb/eyeQj
    sQDZUNv18pIzHtM66lzCuO7J9Utw4LolO3tHq03JWp7wLaseK06yD18Lnong
X-ME-Proxy: <xmx:sdWhauKH4t9Kr2cfSd4wV_IaiLHvBJiCN0amO8fV5oI23ilQhOC4hw>
    <xmx:sdWhahDxs4crdERhpfXven7Zdyu2J-_jqw33m5H6Wd9uRdjxJ-axmw>
    <xmx:sdWhamjEIPAre2EfEQMrvOHkOSu1_Pn0hdLPTwO6AaR6dGnMok0yiA>
    <xmx:sdWhahkeM1zck2XCK0FgWd6U0E1vcYZSVz3-95Aj8-fwxT5Mi0oI4g>
    <xmx:sdWhaiBCj0XUvsEJ7hM-1Po934iY7ePeXkvdUFENIxZICh5TVggZkBKf>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 17:54:56 -0400 (EDT)
Date: Thu, 10 Sep 2026 06:54:54 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] firewire: core: fix type of transaction data in config
 ROM parser test
Message-ID: <20260909215454.GA2981831@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260908122929.2886698-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908122929.2886698-1-o-takashi@sakamocchi.jp>

Hi,

On Tue, Sep 08, 2026 at 09:29:29PM +0900, Takashi Sakamoto wrote:
> The type of transaction data should be __be32 in the stub function for the
> asynchronous transactions.
> 
> Fixes: 23e0d2e849eb ("firewire: core: add test to detect irm-is-1394-1995-only quirk in config ROM parser")
> Fixes: f8e5070bf292 ("firewire: core: add test to avoid excessive configuration ROM length")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609060257.8wQo9w9N-lkp@intel.com/
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/config-rom-parser-test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
