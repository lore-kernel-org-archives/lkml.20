Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661131;
	b=YagGWDqqf0RxaKOfVphD5Eeso9GAY9+DO3k9VNqPVEjuPmjG4ltSDZexttRVYqWnWTrm
	 MPq7TKxgfUDs7969U74s+pL9LxMAPBeniJ5H+gBloSKZ9PUtB8wlhOfYFH11pEC3btQmS
	 vAYMbIssX971ULnHKBYr10iMtn+qPQF00D5SChI3/RIGz932mvT7IHA2qhRtEuHo86zYN
	 vYW13JAjoUGEMr+cEL/Idd2dQcNGSnpiTQxu8nQmc0XGorreLTtULfdzsei6P9mc9gzrJ
	 91BpqFDajKB80FT6MjxKo0Ht7QjDqMWjOyAMA26P+2UiwVMk7XhoZ+9G6WRZ10Rad+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661131;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=OY9FTv/AvctWLZDApCrQmUFwQcwrOLKxAT1EsTTIWrI=;
	b=te4uCNOkH3Au5n+bnrKo0v0bsejUPCkA8K2FYdDi1wlLTTfMyI/jvxCnoarS3iueJ85F
	 2sBR+MVlUeB0UOyuG4tBIKNaVVuORdwV/ZmyjsixfWwtZpEI++shCsIgrn34pjyV3eJsB
	 QGTzLqKKwpPXNAYXo4n5LXvImBlXpZk2Cp9AGn40PE8a12qW3ttwCjcfuZyUO3Z5QBRAs
	 vW20s7trl1AOMFMnlhDFjOwFfyoT0NKz5gAgc80NcF1bH/Xysno1bl7B/aSQl2zyKuziC
	 z60SS3mKd8mzlYIMWQor6smmp1AEIV7paXniE6tiO+ObhPYQpCQNGq6ugJMXlWR4blA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=g6Zg+eeM;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AB1606A324;
	Mon,  2 Nov 2026 23:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33AB1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=g6Zg+eeM
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A4535E;
	Tue,  3 Nov 2026 00:09:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793660991;
	bh=vHySpEKtesQOMdSfDVj2G+Gyass7cQDAg/jsibHOdhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g6Zg+eeMIaXrp8XSyh8WuSS61ix/6hpHi7PuCqm/H+/70991ng/qWD4iw/2D2gERN
	 IAX1kdED+CXE5FvldwjKICieRV1OVfBNe1kHlryUdOu0uBZZjtTsVgliqI6QFOtvx/
	 lDYNbDON1hnXguKZUkSNbclYzYw91+KM9XPhyzRY=
Date: Tue, 3 Nov 2026 01:12:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Igor Velkov <iav@iav.lv>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: Depend on PM
Message-ID: <20261102231206.GA3559911@killaraus.ideasonboard.com>
References: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>
 <20261102223316.GB3548113@killaraus.ideasonboard.com>
 <20261103005500.rkisp1-pm-reply-1@iav.lv>
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
In-Reply-To: <20261103005500.rkisp1-pm-reply-1@iav.lv>

On Tue, Nov 03, 2026 at 02:55:00AM +0200, Igor Velkov wrote:
> On Mon, Nov 02, 2026, Laurent Pinchart wrote:
> > > ARCH_ROCKCHIP and arm64 ARCH_MXC select PM,
> >
> > Why do we need this patch then ?
> 
> Only COMPILE_TEST builds reach PM=n, and there the driver still binds and
> probe reads RKISP1_CIF_VI_ID with the clocks off.

What does the driver bind to when running on a system that has PM=n ? On
which platform can that happen ?

> Nicolas asked to close
> the PM=n case per driver [1]; rkcif already depends on PM. If you'd rather
> leave COMPILE_TEST-only configs alone, I'll drop it.
> 
> [1] https://lore.kernel.org/r/8aafdbbf04a0d939c6b4d7d5577d97bb58d1c439.camel@collabora.com

-- 
Regards,

Laurent Pinchart
