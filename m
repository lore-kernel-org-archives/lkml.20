Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379386;
	b=Mvwpu508FCWLQU41C3jzdw/3J4tAf/lvnLN08KuEsDu0bJu05k3YigwYxDQFWG5YqdLN
	 lUPV2DMa9piQ0SScmeWpEjW5ON5Ic3r+hFaodL3/40yj5H5c7MMAJYf1Ank+MluCwXIoi
	 NGE5Atp0ZX7rzHXQ0Wjurnqu5Py103EN6hywayIk/50rLMf952+LBqNvx2y872H5XS7Fo
	 oZuhULCJp4tjIyz1eZ6ZGyql0m6zzSsAvGOIJWGWKINQH3U3THvERbGCvigpzs/M6YZLL
	 e3ohcDiDI38K8mgHb4A9mGt2U8589YAQZjAQW+wl4mF+502Ga0XhYVkCbQumotrrjyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379386;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=PLttY8nE+sGyh5SIhXQOOD815EzYHKLgvNSQzefiAEE=;
	b=XRfL81xOi8f2V+Yzkr7twwaFvR/Q6snlPk8B7lV5FxR0neWI4bvNMI7QS+zH7X0GNhFM
	 Jg5Gw0BUHM3YoxYLzC3N5wucXIxH46QJ0Uq0ALR6/Ey/JptAYDpeM9YBhPMUQTBn+oWXf
	 M5rFOyo9WuFRvqmcPxOqvRKbAlXzqFCqWOSQ9kkM83wJaf7sQcaTE6UyCP7mT/bTQwIgQ
	 cnLYuL7d4jxsX3H4esaSFB8Alc5LNQFaUy5O0ro9XuZSsXuGISjkHiluVuS5bRL5OOzRa
	 3ZgEx73LzzL51I9tx4XtEk3z31Zm9B9jodEdnLr8ynDPBKl0PEk6gd6rdppQAxk7b2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=amS6LCoE;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79050606A31C;
	Wed, 11 Nov 2026 06:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79050606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=amS6LCoE
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C7EADA8;
	Wed, 11 Nov 2026 07:40:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794379240;
	bh=Ihyx9K3Xp75id2X2o2rP6Zvt+CPGhW6/P9+os5jl4fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=amS6LCoEqNOkpsJNIpQ7PhsMSH3g2QVmxPz3G6gv/49uKnuzjqLINDWtuzx//uOdi
	 PheykHoi6Q0AWxuGiTGsexpzx7GcqPRZiRyKlrLt/QBFyPXGj0ijMT8Bf4/lrwMQS3
	 OqjSLK1WZqusKZR4tgf2IQ4NXdXTnmliRZsj2WcA=
Date: Wed, 11 Nov 2026 08:43:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH RESEND] wifi: ath11k: release the rproc reference on
 teardown
Message-ID: <20261111064301.GC86558@killaraus.ideasonboard.com>
References: <20261103102915.1341148-1-vulab@iscas.ac.cn>
 <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
 <179430684554.3011466.3431045638041318447@iscas.ac.cn>
 <20261110122714.GA3809@killaraus.ideasonboard.com>
 <179436839700.3055208.16759622808608708086@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179436839700.3055208.16759622808608708086@iscas.ac.cn>

On Wed, Nov 11, 2026 at 03:39:57AM -0000, Wentao Liang wrote:
> Hi Laurent,
> 
> My main goal is to study how to find bugs in the Linux kernel.

Why ?

> When
> that work finds a bug, I also want to help fix it and contribute to
> the kernel.
> 
> Static analysis flagged possible bugs, and we reviewed them by hand
> with help from DeepSeek and GPT-6.1 Sol. Even after that review, many
> of them still seemed worth looking into. I got excited about the
> findings and sent more patches than I could follow up on. I regretted
> that decision soon afterward. I should have sent fewer patches and
> replied sooner. I'm sorry for the extra work this caused.
> 
> I'll use this shared address only to reply to feedback I haven't yet
> answered on patches I've already sent. I'll go through that feedback
> one message at a time and respect the decisions maintainers have
> already made. If any of the remaining patches are still worth
> considering, I'd be grateful for the chance to answer questions
> about them.
> 
> I still hope to contribute to the kernel in the future. If I have
> the chance to do so, I'll use my own email address, respect the
> maintainers' requests, and send only as many patches as I can
> follow up on promptly.
> 
> Thanks,
> Wentao

-- 
Regards,

Laurent Pinchart
