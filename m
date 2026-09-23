Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A06E2D8DDB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123139; cv=none; b=JRMFXgpb3v4OK7UKw9EwYRaHiAb+CD+L7nfTzOralkI3RDKZNTO4f3cre4lWSJ5p7qmoRspND/r1CRIoGYHqI56pbeLtrKSa+dKhbYNC2oGYH4ix8AD+7YH4ythW1vxpON1LypZPqDJBbeMTMoUpQjbGuP9fF084Bzj8kwMixEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123139; c=relaxed/simple;
	bh=BCPVoCvCWKLb03Vun8puX+rxmdgrGVLnHg/YsVSPa3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHLI8YxNp84Kmo0YHsEeOF3x0AybLeUoOq/OSD1epQcVkiUIARwCDlzChgSuP9rYKNHDiqtz7JzCCvH7/kpFrh4KdmW8wfn3JZNqK/TR0RQPn+OR0BVt1qzaUiwBFyOitFaadrBB26mRbk2zKhRwV6eMmVB56OV2+YE/v6i9gC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=HbUPLaPA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rf+s0mFD; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="HbUPLaPA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rf+s0mFD"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id A07681D000B8;
	Tue, 22 Sep 2026 20:25:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 22 Sep 2026 20:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790123136; x=
	1790209536; bh=rD32pQjoJzFtX1cBTGLOqVH0lYC06X3QS13KHoaydX4=; b=H
	bUPLaPA5jB/jTqgbnm8Kza2EisX/N5Ouc1OWn1kN74m4bAW1J1PioEQO3WOijavc
	iWyj3n38ngdhYsXryFkBGpoQNgT/ygv0DkKICF01P0Lct4oZ/Wj0vSAuCLNvrdlk
	Mh/Dq6cnNHYVVMy3yp6uZL81zj7hDovcli+4IJ/6seY3He/Z3E3cNkIv/s8GD1R8
	Ch+ZR3b6/exioAMQ4j9Tbbz7c1/3HbF0FGmJOorRY+zlHD0kb0gZwEqPy0G0KiTE
	JRw7waiKZV38F2zRCdVUcVmSjzGnJaBtYIqJb3HwD0EksD1g+ngOND9phVZmGTMg
	WRUpnKSOQK4XD9Pv/ALFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790123136; x=1790209536; bh=rD32pQjoJzFtX1cBTGLOqVH0lYC06X3QS13
	KHoaydX4=; b=rf+s0mFDME7+u3ST46hfMVc9usfo1viqcS8LGPrac6hxbnns3Wj
	JLlCGd4156wxXycCVNubvdvn/2S6pbVTt5HwQM5DowKtuKJTsnYn4IHZnyS9Yb2Y
	H7jzgj11m3qmHCzIcuoYBTsWUjzjnfIlzNw0iybNCP+HUjI870eJruW5rP8NcKpI
	HAYGZDSU0IZoYOT5LoOhvxLXVyS1fc8KhV0EXpHakMaE/7GfsC2ARoH8SmDcGert
	U6axxkYtxdkt6FiUVNbtdn5bqawHYseuvQQJ7B4AU+7P0S+v1oAP9xa2nmtIchu2
	vqeun0ZNZypwz1phUFRc2DC5u50oVclgM+w==
X-ME-Sender: <xms:gByzamibqpuAhFa-nsxlr7w2yevHzxkxrZorfTsh7SBHnx4xHa8nzA>
    <xme:gByzak_k_Sq-MCts-5I0bT-ypQlA83cg3ocSrr_sZvRyKnyHt5UFJ2zkaBjrkuyLy
    -v-zQsJizNc667nEhHBflfxNUTQDWfKn6LcCqFiLDRfRRg6kEqlKAZ3>
X-ME-Received: <xmr:gByzalqt0012kLomDodI-i5aoAJuluz4TtoVhVFKRha5TNNcjKYDxb2s5SsjrqZDh_dDtY_NOt6qXZvXWzzxKHlD3jA-yA>
X-ME-Proxy-Cause: dmFkZTGz686MJJqwVQ4CvegodskQfSJMZecpgfyUDCwlqL4iMsHflKjFeRLDNzFGuJf1xA
    QlpCzK4ljQBd9+iWBiDLV4/zO2RJPp5iWjybK+459ZbOz0LLLRdGBVVOJMOFOIYlH9cTnf
    C9gN1Kq1wL6JycAvS/OHOkowo5ER72tEBXW++rXrlDKLxByLelN1BMP4MYPtHOg5LCLF2M
    NyYXZy7iX/U3OrmCB9VQ+d6xvsMUix9irhHJLmaQYYUi/P406/tQUDwg3MdGZ0/POIHnan
    vVPWOG586ILwKMgtzysLgv3BI91pl89OmeKn1b59yBmy380g6n5ji8JypBja1DLGyX5ojV
    iEsUhYmHGKIefjk2o4mx/RxZg0rsc0Q8We0Qh9m4XiIwWEiflt4/yJW0T5amkZODWid9Ig
    CASOjOZzqRc8nJ/c9apqfVt8WcrV3+5VPALR4j1p0Af2okbO9sWbNUIrMjElqum5nqf08b
    67uWV/jmmkJnYhFTclxkiU4FO8/wjWywsHud5a7evHx1IxIYkLH3RC1LjDzS7pnWRLTp2G
    6dWtiobi7ZRHpN7a7G3pKtYJfBeccO9MQ+GBrgyvEH2ibrczUjjRZ7YAY0g+20C/i4fOcE
    dAZq8Mghv6d5nXSvimsHFln1xKZp/lqJEM1mWCal1Q71fRstEc/XnWjGi9SQ
X-ME-Proxy: <xmx:gByzar-Wb8k3EBJ9-qcwbo28T0FePHLK75qbCOxpvz6aEbVvXI5Eng>
    <xmx:gByzahV8m3vi3nX4x6lHxKakvuXX0dxThiibWx-rcVDJOGZ16Jx0FQ>
    <xmx:gByzapCq3J2Ko1Vv8g7ztZ0YgO-XEck-lO5n8vnUwKYYXkDkOv1fPg>
    <xmx:gByzaqwHcMkFr_rpwMd2qctllfChcvZ60L-HzYAYzHTNx8CAL452Fg>
    <xmx:gByzakXNxgH7MCYGyhbfXTTgSvKuTlhW8xggZ8JrX3Q9uWiQ32G7NLvT>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Sep 2026 20:25:35 -0400 (EDT)
Date: Wed, 23 Sep 2026 09:25:33 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: cdev: fix back-transition for
 iso_resource_auto client resource
Message-ID: <20260923002533.GB199647@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20260922132639.191593-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922132639.191593-1-o-takashi@sakamocchi.jp>

On Tue, Sep 22, 2026 at 10:26:39PM +0900, Takashi Sakamoto wrote:
> The todo member of iso_resource_auto structure represents the state of the
> client resource and normally transitions in the following order:
> 
>     ISO_RES_AUTO_ALLOC -> ISO_RES_AUTO_REALLOC -> ISO_RES_AUTO_DEALLOC
> 
> However, concurrent access from the work item and the file descriptor
> release function can cause the state to transition backwards from
> ISO_RES_AUTO_DEALLOC to ISO_RES_AUTO_REALLOC.
> 
> Prevent the back-transition by checking the current state before
> updating it in the work item.
> 
> Fixes: fcabbf40fae5 ("firewire: core: move allocation/reallocation paths into specific branch after isoc resource management in cdev")
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/core-cdev.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to for-linus branch.


Regards

Takashi Sakamoto
