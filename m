Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE7F3A5433;
	Mon, 28 Sep 2026 18:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790621606; cv=none; b=C0E5WczQBoxLiu4ZWP7PKvNK2mlvz6CZh18sIYNvTehTMqx/LTzUxDq86BVpTQ+vie9P7Z/fXO+IFGudr0dbdVMtPKd6KBbWrX6OZJcneYCEKS5SJBW8xlSIa4AqhA8Vpyv4nIZAZzXpg+a62Tq98z/ByWCZXMEF2mq9ywTIREk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790621606; c=relaxed/simple;
	bh=FiUX5DtQeuhq6jWcWYW7DKewva0ApmdYNc7Is1bnzyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtem1pd1GrOhi8U6Xu4x9CeyMdICw7wSPi2D7TjIAeFU3JCW8rraIovbv2rxMR3qkPg/0Dkrroc181GNMcmJKuQX0EnnBDHt8UGiIx2/cUkxmE1wziDcRxCl3zeYNtiv7AA1fBmFbtELnlYYfJbZHkx3u6Xn/j2Fet0OUdPkvZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H6dqDaak; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H6dqDaak"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A5C4493;
	Mon, 28 Sep 2026 20:51:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790621489;
	bh=FiUX5DtQeuhq6jWcWYW7DKewva0ApmdYNc7Is1bnzyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H6dqDaakMQuKDQNM9GWpDYzqyOspLvMCXri1yqHoj0KLY0YDWCqa1DbKUCv82m9ca
	 SxzPnCsSPbkdH8GnTQOr9kO3/atP4hbb7cRuc4yZzKkel6c7HAIpTOgrpNvF5v4GvI
	 n+c+CwMoWbUrzV0t7CsGgwuEqNTxuNeEUr9sd+TE=
Date: Mon, 28 Sep 2026 21:53:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on
 the OBSBOT Tiny 2
Message-ID: <20260928185318.GA171869@killaraus.ideasonboard.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com>
 <20260902002553.34839-4-jordan.mymail@gmail.com>
 <20260928115713.GD157191@killaraus.ideasonboard.com>
 <20260928143448.757683-1-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928143448.757683-1-jordan.mymail@gmail.com>

On Mon, Sep 28, 2026 at 10:34:48AM -0400, Michael Jordan wrote:
> On Mon, 28 Sep 2026 14:57:13 +0300, Laurent Pinchart wrote:
> > The device implements an interrupt endpoint. Does it report control
> > change events for those controls ?
> 
> No. I checked today on both the Tiny 2 and the Tail 2, with the uvcvideo
> status trace enabled (trace=0x200) and a stream running so the status
> URB was submitted. Neither camera sent a single status packet during
> commanded pan and zoom moves, or while its subject tracking changed
> pan/tilt and zoom on its own. GET_CUR reported the live values
> throughout.
> 
> > > The vendor has been asked to fix the firmware (support ticket #8220,
> >
> > Any public link ?
> 
> No, sorry. It is a private ticket filed through OBSBOT's support
> channel, which is the only way I have found to contact them. I have the
> confirmation email showing it was received and is awaiting a reply, and
> can forward it if that is useful, but there has been no response since
> 2026-08-04.
> 
> > This belongs to the commit message.
> 
> Agreed, I will move it there.
> 
> With the Assisted-by tags and the shorter 2/3 message, that makes a v3.
> Hans, let me know whether you would like me to send one, or would
> rather fix these up when applying.

The long commit messages is a part that bothers me. Not only are they
long to read for the reviewers with a lot of unnecessary noise, they
convey a feeling that the LLM outputs are sent to the list without being
truly understood.

I'd be much happier if you shortened the commit messages to focus on the
useful information, conveying *your* understanding of the issue by
ditching the LLM text and writing the messages yourself.

-- 
Regards,

Laurent Pinchart
