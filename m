Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E233F1AD7
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749862; cv=none; b=rMFFLgxfxn0MRxZY5LC2qAmoR/jYH8R3kHEJnKsIDI0FYvGrtksG16iRhPDfn7ALk/6l1lo+Fy+Jpydu37V4IlQLkMxja26jRw+ZB/mV37l9i4JXyUwbmqH4WmXouIZ+mRcI/SGOOxmsIR5CeqEkteRdMPRjqM/Mzt2X0R1y77E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749862; c=relaxed/simple;
	bh=1mWVz+TVSBJQNvVh4DzDRuzy6jS3kY2TxBr7kkMO/Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReD57vmgnEXZJ79t31/Bqd5ZEbGR1qvyiqd7iEnubYiGCQQ/VhIViVjWH9qgP8cIbGEbd2g7zWXqj5opaKvrK8LCN0z2WFeoM2gWNK+H2uptj4B0ONpVSPlshIjy0vHRNDyn6mgjzMz5hHwpiOd6d3y+3+UhMn6bwvs2GFJ6LbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=p/e1CLPZ; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="p/e1CLPZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=tRnztHud4pjjk8xSOgMv8kVQN9nuJzUsR1szd+RCmic=; b=p/e1CLPZX9o3k1P+
	vckKD1ZJhqBOSmfW0/1GFIWjf5DJrkOFurKOQ5VkZ7OV5EdOYGZY0yH79B0b1lSVNOUcb3l6VRkxT
	hVxSgLzzVm3qxLBXqGOXJhBwYvzUG9alhZZrWQVIStf9ZGscCjP8IJWzprf/Y7MhFDNP6hPStlItc
	E5RC/Dxtz5ehw1XAFYh7vc0YarTE+pW8QtaGhCcc1BJEURCq/Ko8Tx46WoCXMbt7naSuANlFoGyTY
	/Tz/TwgevCaFgxiQ/4fg/631cCInRm5apHWtRyPZUGvujYL1Xn8WbMxr2X8dQcv48bqalkhiuGwOW
	/XrwFQxHndyOr98rTg==;
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
	(envelope-from <dg@treblig.org>)
	id 1wzDP1-00000000Asb-0ABM;
	Wed, 26 Aug 2026 13:10:51 +0000
Date: Wed, 26 Aug 2026 13:10:50 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alex Deucher <alexdeucher@gmail.com>, alexander.deucher@amd.com,
	christian.koenig@amd.com, harry.wentland@amd.com,
	sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/amdgpu: Remove is_idle method
Message-ID: <ao7l2qRUJpomS6Bw@gallifrey>
References: <20260815180033.8958-1-linux@treblig.org>
 <CADnq5_PgZx7aDGFD5pPQ=1MvF9_N_omVojNiDQFHjs0Tqasv+A@mail.gmail.com>
 <2026082644-monetize-tingling-0abd@gregkh>
 <CADnq5_N0AxaDZswgEQ7BEcKw8mF2hnSbAQp-w9U2Fy-MaEw8Rg@mail.gmail.com>
 <2026082654-gangrene-support-8541@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026082654-gangrene-support-8541@gregkh>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.105+deb13-amd64 (x86_64)
X-Uptime: 13:10:19 up 16:13,  3 users,  load average: 0.10, 0.04, 0.01
User-Agent: Mutt/2.2.13 (2024-03-09)

* Greg KH (gregkh@linuxfoundation.org) wrote:
> On Wed, Aug 26, 2026 at 08:45:29AM -0400, Alex Deucher wrote:
> > On Wed, Aug 26, 2026 at 6:21 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Aug 17, 2026 at 11:27:41AM -0400, Alex Deucher wrote:
> > > > Applied.  Thanks.
> > >
> > > Any hints on where this was applied and if it will get to Linus "soon"?
> > 
> > It will show up in drm-next after the merge window closes. 7.4 material.
> 
> Sorry, but this is hitting me now, pre 7.3-rc1.  Booting and getting a
> zillion kernel warnings isn't ok, that's a regression.  Please get this
> merged sooner than that.

Hey? This patch doesn't fix anything - it's purely dead code.
My comment about the log errors I saw were about the head of drm-next
I tested on, not about this patch.

Dave

> greg k-h
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
