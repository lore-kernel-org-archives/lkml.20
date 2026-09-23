Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A026623E325
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123104; cv=none; b=ngAAsBOlpGZbnC7ShIGfzP4BONmdcmLTPa7OMVsfDWvi5D8RyySAvXb0CyGUaHitkLxmJyMIxDuCydu8zj9xdvI9Wm87xlotsz+5Ozo83SCWeQiA6ideb2o08gBaOkYJhn5UlWnm2KQTVET6FJJWVY+GD+VdwXa7pxyBzAOijQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123104; c=relaxed/simple;
	bh=cVBs7YtjK9INuXYSXFkbM05iOY4EBDJIN7m3X4SVyUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbfdhTBvmXfj1Qzk9HOHBw/Ks1jCqDO2f7ct3sApTrTnn97/Wx/5kME14QXnb+b44BljUOMKT1bxstzcLh2QIHDVx/69llvR/szcSZj5ZaK8XolnVXH6kSMf80KCkCQ83wVD/Nxc1oWDvKewt/MHe3VZuobOdfGCrK7UQ85Gbgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=iJ4W7pTo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=V/ZqnV5T; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="iJ4W7pTo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="V/ZqnV5T"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4A4FA7A0011;
	Tue, 22 Sep 2026 20:25:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 22 Sep 2026 20:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790123100; x=
	1790209500; bh=bkaDrUIWsLb8xLmJcxjIk0I7BX/VfZQHL28+zFhYSAY=; b=i
	J4W7pToNoiOiKTU/T/TXQBFb9t+Y7wuWRRMKUhDrweTBFNazM4q4WWt6QqsviODw
	ezZi5h5XJiDUIjapVQrsdktGi6c+CGUUQE1KVgRfZdPHxn8lrMDBMZnPwsz5KcUZ
	BXGdkyqUV/DxgURV1N/oJVgKcwui/p9+jku8dTzI3sWTK0gIPBvHHKzNIr75HfX1
	JDCbY8s6ETZIW0romjkdQVB8gKyT+3DEr2ll0LAzuFrQyx38hty9JytsOgl8r8tr
	NTfrJ398D+ju6Tc08bgcb8+0mZR0VcZ/Lv6+rlFEV8gtGW9OHSbGmcnXzBC9q0V6
	dHQWWODj3JBnougx4QPeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790123100; x=1790209500; bh=bkaDrUIWsLb8xLmJcxjIk0I7BX/VfZQHL28
	+zFhYSAY=; b=V/ZqnV5TJrli/gPayEUgfaFOkdni3ZbrqEPVhQW+agYdPY4xCYc
	A4dmna2g1hsdm47NDnjpBWkfxIDVeAkNuatRe0Wd2NikWUJWgOCjmOyBoEfV5uXu
	uUriAB7a7a2J+6JHUBQU8zcsetcYDHgZJ/XYGR1jHRRwNZ2hBzFtRcGZUHwo8yqt
	xmR5E+rLTVeD081yEeEOj0FDyijLTdghMhS//SAH7XHBn3A4ORO3uXdEYffZYWEi
	qrmLf3/oc2B1iPNGLUG8kxMD+lalCmY+bbHn5SMN52ypQhNHYKqG6CJr/frHhrIu
	fsGMXB5gEcsXXN12dLwe0U1Jz8mfYerNvEg==
X-ME-Sender: <xms:XByzaptQ1mC4UjkNrh_aVx6MbLE76YIJDYwb_hJEzI4ziSxtz2pn-g>
    <xme:XByzagbdaaip6cCSmUepcEOh3qJQ2Vhxq7ylEWwYPVUMjKaUsTX0aJQMWT_E0o6aj
    FjyDHwl8rrJwVtg0zQ6PVyFzCnTivLtfUt8-4ad7l3oWHknJ8ZV3SQ8>
X-ME-Received: <xmr:XByzakX99LDoWrvPB9GtZuuYX8fB1zf0i20bGQIMG4lPkKBDYgzxZfx5fCSZXHO32bLiRMXFlZDgA_3lJprOV1VQGw7rVQ>
X-ME-Proxy-Cause: dmFkZTGz686MJJqwVQ4CvegodskQfSJMZecpgfyUDCwlqL4iMsHflKjFeRLDNzFGuJf1xA
    QlpCzK4ljQBd9+iWBiDLV4/zO2RJPp5iWjybK+459ZbOz0LLLRdGBVVOJMOFOIYlH9cTnf
    C9gN1Kq1wL6JycAvS/OHOkowo5ER72tEBXW++rXrlDKLxByLelN1BMP4MYPtHOg5LCLF2M
    NyYXZy7iX/U3OrmCB9VQ+d6xvsMUix9irhHJLmaQYYUi/P406/tQUDwg3MdGZ0/POIHnan
    vVPWOG586ILwKMgtzysLgv3BI91pl89OmeKn1b59yBmy380g6n5ji8JypBja1DLGyX5oBa
    lJY/XPBwqrSJY1Re3K8/7Q68cuanGKZYjCySqw3ISZOu0bkIPz82sdsnKYXJKLaXPkmtKa
    A5eg+/QTtjZynWHzFS967sl0ykWHgDGYgNlXWW351VZpIcKGc4pSnbH3S5e0kVCE/LOcCm
    8ctgw6AittYcram8J6qEeSwBe+9yQb9rBXgOZWSYVer/1bT0nR/aWgHoU05dzwSj9CMHTL
    a8qBRaQdvk0J2KZgSlapvw1xGgqNjnmZKcEK+wQSQ/kky0D1/T0e4KN/riutELA3jCvdfT
    YSE5fqXVnp+4uYBH85h2MrAmIlEYXM6b8mJbAWYajNGyM0ML4rqvLLJ5Ub9w
X-ME-Proxy: <xmx:XByzas6_D2Oe8iGHj4xKOa-0Mlp07qiwDGd-tzuuhNJRtoogb1oX2Q>
    <xmx:XByzanhxhKUT7eSjQ2sJPa5nxfdMXJqHaGxDHR7YRIgRhPc8H-2Dtg>
    <xmx:XByzarcXyNOBOZSuyVQi7g4oiPHIeCmuTLzd40xSaq_6KelFVcFucg>
    <xmx:XByzakeLsrR-9KOAQYYhSdELeKKY-ZbMWIZCVkEbMl0oyjRvqT9jSg>
    <xmx:XByzalA4fWlXuKZHvKk99cRu_AQcBnCao7ddnoiLAkfaHH7senwxB6gG>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Sep 2026 20:24:59 -0400 (EDT)
Date: Wed, 23 Sep 2026 09:24:56 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] firewire: core: invoke transaction callbacks in
 process context
Message-ID: <20260923002456.GA199647@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20260921031931.287429-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921031931.287429-1-o-takashi@sakamocchi.jp>

On Mon, Sep 21, 2026 at 12:19:28PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> Currently, some error paths invoke the transaction callback in the
> caller's context, while a split transaction timeout invokes it from
> softIRQ context. This makes the execution context of the callback
> inconsistent.
> 
> This series ensures that transaction callbacks are always invoked in
> process context by using a workqueue for the error paths and split
> transaction timeout.
> 
> 
> Takashi Sakamoto (3):
>   firewire: core: refactor invoking transaction callback
>   firewire: core: use workqueue to invoke transaction callback in some
>     error cases
>   firewire: core: update kerneldoc for fw_send_request() and its
>     variants
> 
>  drivers/firewire/core-transaction.c | 91 +++++++++++++++--------------
>  include/linux/firewire.h            | 15 +++--
>  2 files changed, 56 insertions(+), 50 deletions(-)

Applied to for-next.


Regards

Takashi Sakamoto
