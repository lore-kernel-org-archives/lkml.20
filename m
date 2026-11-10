Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301224;
	b=5IVnGTxUaQL2T9aONwlV8DYq2p+dtGhvJeLEEgmby9/8Fc8Bb+0WtU0HQAe0LeIcfSZ6
	 YYxjmqEyh6ycd6Zedx3wWWScRu0OhyGx9wbQf/hNl7PLKHyUTSUFICTqZjMHjVs+UB0p4
	 Ep3AnFqkOBvV6uGUtNj4fZZ3aRJZNLXIbX4ww1u5drTYAWBb1quFBZKgifzqDW19yZ/Q8
	 4fNdfsIXlrxHJz3U5EhwyUmw/+CfQ00muBKaF3ThdJq2mgqc4s1rB0LtgPzTeQ9LTZpVn
	 zyO/+M8lu3EMcaGh5k2OiQ5bJaY+cQxBURvsXWYgNj/0Am5cQqkh0hILOxKhkfnjllQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301224;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=lQtZOpUfiYCTJSBMFgdGb2GeoFfEdKFJd20iCHb6o+M=;
	b=hB/12sLZfkoN3W4Xsnqmmgt6O6tOhSbM6slGABfqSKU/t1DdeYFQGXZB8J3MLPFlijt+
	 wjQpEz3cToKkmNEFZPaLK3A45w/HWdL3gik7qQjO4yf5xzhLAZ94T664vQCsShfMEq52b
	 5lM4DRBPmo1biiLfbWmbukoGcstjbVa4all2V/mtSqz9Z1S2fGPDjdkYssILX7XPDD62C
	 xOZOC8U/TmqxtfUrIFn9rlKj+U/59uakY9/yaX6XuIboIflYC6t6KOBp3eUqOCbVWBY7J
	 FkIgkcct2iHIUvvB5LdU5i7jviGXwz6jthp3+VyqKuuhZ1oF/45JCfhLmQNv3Ne0sKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=irTTzZ58;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE76606A321;
	Tue, 10 Nov 2026 09:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE76606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=irTTzZ58
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA5CAC14;
	Tue, 10 Nov 2026 09:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794301079;
	bh=lQtZOpUfiYCTJSBMFgdGb2GeoFfEdKFJd20iCHb6o+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=irTTzZ58ctngpld/5PbZUALYREhgVH75GSxEArM0asIzdV6GUBIteZmbasJvaVRQl
	 dZRo8ZdfV/iF2cetbmAUNF3MPflHmaxY64wO2cAKG3BPccZFj1VZiSK6ANovZFXYFa
	 P0/qRG8k6VKpTgQUVPBmcYLwA5gtYV2IWDXVooGM=
Date: Tue, 10 Nov 2026 10:00:18 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David CARLIER <devnexen@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	dan.scally@ideasonboard.com, nayden.kanchev@arm.com, mchehab@kernel.org, 
	hverkuil+cisco@kernel.org, linusw@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: mali-c55: Require an enabled link to start a
 video node
Message-ID: <avLYoCrMB_L3gTPT@zed>
References: <20261105231626.7152-1-devnexen@gmail.com>
 <avHo8IXKwjsWNzO3@zed>
 <CA+XhMqyKNd2maRXmmpL=aOMB-z4X3JgCD5ofiHpMubtFHuS_0g@mail.gmail.com>
 <avLQuNJ_KPOH7Ao8@zed>
 <CA+XhMqwfK+zoXb2_9XBUnjd9cLY_D0WwykbSccQR6kKqriZezA@mail.gmail.com>
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
In-Reply-To: <CA+XhMqwfK+zoXb2_9XBUnjd9cLY_D0WwykbSccQR6kKqriZezA@mail.gmail.com>

Hi David

On Tue, Nov 10, 2026 at 08:32:00AM +0000, David CARLIER wrote:
> Fair point, sorry for the shortcuts.
>
> > What does it mean "rather than through the graph" ?
> > enable_streams() is propagated by drivers along the pipeline by design
>
> Badly worded, sorry. I only meant that start_streaming() takes the
> resizer from cap_dev->rsz rather than from the remote end of an enabled
> link, so it enables it even with the link disabled.
>
> > Is this a typo ? From FR we can't go to the DS resizer.
>
> Not for data, no. I meant the media_pipeline_populate() walk: from the

Ah ok

> ISP source video pad it follows the immutable link into the DS resizer
> sink pad and, through the internal route, its source pad. A
> MUST_CONNECT on that pad would then fail FR only streaming with the DS
> link disabled.

This means (and reading Documentation/admin-guide/media/mali-c55.rst I
think it was intended) that if you link-enable the DS-pipe you will have to
start streaming on the DS capture node, otherwise streaming will never
start due to mali_c55_pipeline_ready() returning false ?

I wish I had a system with a DS pipe to test with.

What I'm after here: I'm trying to figure out if your change
introduces any requirement on how pipe have to be handled and if this
has any implication on how libcamera works on mali.

A use case is continous capture from DS while only taking seldom
pictures from FR. In this case I have to link both pipes, start both
of them and feed buffers continuously to DS and only sporadically to
FR. The key here is the requirement to call STREAMON on both capture
nodes if they're linked.

In other words, if you want to use both pipes you need to link both of them
and call STREAMON on both capture devices, even if in a session you will be
capturing from one of them.

I think it's fine and matches the documentation in mali-c55.rst and
the libcamera pipeline handler.

>
> Thanks for the reviews.
> Cheers.
