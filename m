Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12144217F27;
	Tue, 13 Oct 2026 13:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897178; cv=none; b=jKHDJW6M/V0yJm4XV6zHk4ECSnd7Y3/Rzm5/oj3XGUdhntXjY8MUKT/gqP+ow8VCuClIbNEGc1dBzI25vYkgzSfF7LdIgdkSL7/y6Do/JjM51WxcWs2V3TaxP/NWWJJziWPbaWMZdX+0J7ptAwiCi0aOiD1+2zWPk4bIX3G+OPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897178; c=relaxed/simple;
	bh=1RcIksfKLLcVcMYCc4re/xaG6ukSz9/3jXmI99fHVGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xkdw3egQPRqu/3iuQKeEx/d05iLgskcTQIFQAtG8ztwjc3v5Qh0whJ1fC3WKoSqvir6ewd+xVpaNWjTppefAjPjLndmjnncsyXgP6H16y4PnfSb8rmTNApmB0NJE60Awkh4XYXwE59f9CHM4ooJySwjspuWyoACm+0MlHbG5AYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H/YSs450; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H/YSs450"
Received: from killaraus.ideasonboard.com (unknown [185.104.138.147])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7579C230;
	Tue, 13 Oct 2026 15:10:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791897053;
	bh=1RcIksfKLLcVcMYCc4re/xaG6ukSz9/3jXmI99fHVGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/YSs450+AU6bCz7muMQncdn7G5ulSa//iGMsZahJBeki3yQFTCT6D8Llo/LATWd+
	 NErf9vtKFJthvQUsrUJLuMLZKWvdkRG/pmJoRj07hvsLMEqGcba3PL3HJO8wXRwjwn
	 lAKiWga03WGZfMrIy223AGKRV3JSrBgat4Gq/zMI=
Date: Tue, 13 Oct 2026 15:12:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <20261013131243.GM56180@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <as4pAEnLd4H68W4W@gremlin>

On Tue, Oct 13, 2026 at 01:59:33PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Oct 13, 2026 at 02:31:32PM +0200, Laurent Pinchart wrote:
> > On Mon, Oct 12, 2026 at 04:42:46PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > The tag's useful for push back on review,
> >
> > That's the point I raised during the maintainer summit. It's actually
> > the *absence* of a tag that helps me push back on review. It allows me
> > to ask submitters if they forgot to add the tag, and in many cases (so
> > far) they simply don't reply.
> 
> While the tag's useful for pushback, pushing back is the issue.
> 
> The asymmetry between submitter volume/reviewer bandwidth is the MOST
> CRITICAL issue we face.
> 
> If reviewers are required to reply to all of these people, the project's
> dead, AFAIC.
> 
> Ignoring is the only workable long-term solution.

How do you decide which patches to ignore ?

> The issue we had before was a lack of a CLEAR and LOUD 'yes ignore these
> people' from Linus.
> 
> We now have that :)

-- 
Regards,

Laurent Pinchart
