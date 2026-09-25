Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3033369203;
	Fri, 25 Sep 2026 07:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790320747; cv=none; b=JJAh3Fxn2lIVaad2XbfrorFaycgjBEbBUSYjbc9d9ge5fv9R3jGja5F2TlhuY5IbEc8t2zJs/E9VVgNg7WqbA+LcRUbfv5j7oWGdaO6IPmOaKXFYsFnj6N/+nn+fZ+TH1izYvcGdB56cdNzOQ0xl6syKcNNWQ547hrRZTFmkQLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790320747; c=relaxed/simple;
	bh=hyCIdzMe5cFRUeQbDr1a500AVEKKbWIWBG+sczLDz1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtTTUwOIZweTYUK7nX2wXrvfFm09u1xERwae2/XGPg2WzITLV2VtYMPW4BT9txuQjxtayHkkgs93x09b5WxR2Pn+0qRA4vx7/xHqszAy5IdLLz6Blv98CPSGvQi91ALIw3XFL1Wvr7ciOONUfZsf5uYbz6wMCdBxSmBxevgVTKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o3DX3Pp+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o3DX3Pp+"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C14D5C1;
	Fri, 25 Sep 2026 09:17:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790320628;
	bh=hyCIdzMe5cFRUeQbDr1a500AVEKKbWIWBG+sczLDz1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o3DX3Pp+ZE8i3nhJ/qjMTkDL5xKpNn4X8+XqX1z8IF20J6O5cu/XJArHFAWn2oqul
	 MzPXAKptWZqMrXYInqOp423Yqo1UaAaalDLatqotjT854NmFxLJJEk2XTdfXVSyQoF
	 EdP+TDmykA3e7LIfLTcpmNoDKSACiWrE5NXJSf98=
Date: Fri, 25 Sep 2026 10:18:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kees Cook <kees@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
Message-ID: <20260925071856.GH135998@killaraus.ideasonboard.com>
References: <20260924134945.3095661-1-sashal@kernel.org>
 <202609241709.8B710211@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202609241709.8B710211@keescook>

On Thu, Sep 24, 2026 at 05:12:15PM -0700, Kees Cook wrote:
> On Thu, Sep 24, 2026 at 09:49:45AM -0400, Sasha Levin wrote:
> > Add a top-level AGENTS.md symlink to README, so agents load it on their
> > own and follow its pointer to the AI guidelines. This keeps a single
> > entry point for every reader, and avoids adding a separate copy of the
> > policy that could drift from the RST.
> 
> Yeah, I think this is fine. I don't want a separate file just for
> Agents: we intentionally designed the README to work for them. That
> there are Agents missing it is sad, but okay. And the Agents are already
> trained to deal with for-human docs, so that it adds more tokens
> shouldn't matter here since it's tiny. (If it reads the contribution
> docs before every patch creation that seems like a good thing?)
> 
> Acked-by: Kees Cook <kees@kernel.org>

It won't come as a surprise, but I want to voice opposition to
encouraging users to use AI agents for kernel development. This patch
does so, so NAK.

-- 
Regards,

Laurent Pinchart
