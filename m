Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98033CB547
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789170719; cv=none; b=vGIBTJsklE7psACwbZd8Ti8YW50plDkTOKroX3vqEPgVYdEQdGV7yfDyGeONs3w13RONoaHgWNtDEBdqeV+C0zWDzzs4SzWF8GgIkU3qQEA7byYlbAjTebtYksBRmqAPnZhYodB9Awj41F5tbshj63nssn+aTeW603uQ8WRylv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789170719; c=relaxed/simple;
	bh=XPq6BfADx1ElVj8ytsKER2hBIEkZl4JR+xJu9ctwaFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAHEqsr2tVsLaD9Ngq32KqQ4zaozMDG1fhKZFU/QI5Ot1fevXXasFSqRCN6EMZFPw7YJ/WP7bkS7WdKmpIoscv10OqeYnM/Hm3kwQE3NTFuaZvljXtLnFQtFnRRMS6gR8lQ/FrepI1VdTQGqK2PE8dGagrRnOjTtSrdUdpNSjQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=zjw7SXq4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=d7X15+0T; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="zjw7SXq4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="d7X15+0T"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E337C7A0071;
	Fri, 11 Sep 2026 19:51:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 11 Sep 2026 19:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789170709; x=
	1789257109; bh=wTCf3pQIlmHNkn+hV3YCEkmD83sjXepHw5nhJ0DkRL8=; b=z
	jw7SXq4rc5FFlplwgHvhdB8PL6nt5QirYfRENx1wzqzxJ5oOr2l9qtNN+53mksRj
	XXYgzwiDm71gE0/c+Xkz1fYD2Lito5xZG57/4PUu51WGNl4WgAUEs3v5vOS5BNfv
	0EP8OSL8Bs0G/tAD0n/MbIqKxExe52tkMySe1ONYe8OnTAoa/4bEhJDXLHjApLx3
	WUsv5OcrmsI2eVaHy0G8wJ6nRYsTWwuN3mRNMLpj8H5XCRTTva3AToddKO2KRyRt
	0ZpcfDndVrMHIGktnMB8YLrTqXngFDMYsjmO1yZUBVb0AFStQX/tqwUVNfNul1xJ
	eM8LxekK1MV99oupALW/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789170709; x=1789257109; bh=wTCf3pQIlmHNkn+hV3YCEkmD83sjXepHw5n
	hJ0DkRL8=; b=d7X15+0TgCTfNnMZhow3a7fh4ClftNBl7+H8DtHquk0J4sdDMGj
	KOP/pJuFvhLjyPAojQXNKjpfYclE6bglo8zam9OwUv7lFHkGLspmrc4P7BrQ/MA1
	U/Hy/Tsl7KIc5YhE/Hti7tXOzgCqfmZxbVn4med7OErBlG2vmH6ZmzqoAEqpl5Wp
	hZGu8IeyAtO/4tDGKkf79Na1SRdb9/DQ9u9tHcBPOKeXQSfk5u+E7Wzz3S9nElR7
	o/UXtR/yVlltr1xS81K/XZKaf5Usxer7jFB34PiExHIRF5SFra/uLYNDm8yp+PQo
	4mNgQA+Fdv4k611qhNbGhDPRmSBsJO9TBkA==
X-ME-Sender: <xms:FZSkaoEP_K_TSDqJMbTiyXYaW61FpVFcwJ0ADzeqNbC_DDoQYipYig>
    <xme:FZSkavTIBrX6EYbVD721PkJp7oq81y-kCghQVZ-H2gbVVYVGpSlI8EWMkNjGD43hk
    0griPfKi_pLVQLSoc0ufbvYspRmIOqRLGmUmVg1IigF4oqMbQ-b41Q>
X-ME-Received: <xmr:FZSkaptFJe-2K4wKhs21RDX2ObsIGtT5EdbbgdiYZeBFFWBmeOtxr6WF5GQgVyIyooCdi7VQVFgu8Rga8XpirZiJz2_a>
X-ME-Proxy-Cause: dmFkZTEERluSEPL5KMR9Jf/YUix/bXzdjDLGUhnD7/F6DZQF5c+gYUkG/llrqbwWX3lZ0g
    u+JsBaOTaq2p/xM/TeeERG+mreqDLdN2pTvKduivgjSuNytJueQa4CT2i72DBa1ZRV3FZ1
    YjdsAe3F0Nt19Ha97lEgtwDIw3fQfvuMvABy1YW/VFxyTZTSaG4erINbXoVODsiTK6f6wN
    0NQOlar6HeQJuTCoPOXcUJnnbPQPM0wbLIPktNQOHhsOwqTJzFBilZHkq70hHdqusPFPon
    lis/M03qvt5BAvFTAiHOm1PCyPwiP72pyPEv5FkBMco0227JF8JgPlNfdWHKovKw9+MutE
    na48uKxebljfyf4udSpR7VSEtz34kX8NUF4IK+YCgGZFlHBKhzg7VleGL0gtxrRQH8lo8M
    kWm9QFsATs6qJs4APMEgldpA77PZDlyI+HcLChtxKjLJboRr64UVCHyFLiVmTc/nVdavwZ
    5WEagXvOvHTcoseN6/O1H8iTqn5G2oTZ+VG8K4Ujx/3wpoPkE9qKuEP/dE7zWtqhEUi4QC
    8ZBRcCTIzEmSMAb142g8QIgptFpSGvATh87vqDowkvhQZwha/j1WnCZMtLrLM5tlnJjmVp
    piAPje9ndTasA4S3Mc2J3BZg3pGs9boSxwC4QWNq8yjqNadqE6PPkvj9B/+g
X-ME-Proxy: <xmx:FZSkamzQ44FnY9SbFqwPLshzttC6Llwv2KO3XVQZe7uRF_IkIQwozA>
    <xmx:FZSkar54ZaKB37V22-JzyXu8y88ZVa2d5ewEAqBsF1nItrqv4c_S1w>
    <xmx:FZSkaoUUqRQXjSeitFINQh01W4Iu7ufMgP9JetCYnJZzb_servtwvw>
    <xmx:FZSkav1ChylfVQ9Qg0Es3odpbQiabl4fMcLFmTSKLOh4mpcrp1iWng>
    <xmx:FZSkauZms0VnLsnVOzq1QRXTybzDsRKXSS9A-_z1sNuyRHR-93Z98pDZ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Sep 2026 19:51:48 -0400 (EDT)
Date: Sat, 12 Sep 2026 08:51:46 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: core: remove unused link field in fw_packet
 structure
Message-ID: <20260911235146.GA3309171@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20260911141602.3288806-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911141602.3288806-1-o-takashi@sakamocchi.jp>

On Fri, Sep 11, 2026 at 11:16:02PM +0900, Takashi Sakamoto wrote:
> The link field in fw_packet structure has never been used since it was
> added.
> 
> Fixes: 3038e353cfaf ("firewire: Add core firewire stack.")
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  include/linux/firewire.h | 1 -
>  1 file changed, 1 deletion(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
