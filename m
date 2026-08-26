Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEA8424D46
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750653; cv=none; b=Nprgjd+Ts32TUA1L4SkAxX9b1r+BeV7czAAFlnMzziTJ21Qzl02gJGUxXW5AmpI6V81w+Ek8jhot/DeGvPs8y8D49T4Z/Q1NjZY1yIMkMC11NP3ev2V2YTTxjP8iGN+oVXNWBV7tWKNcYx1LWre0NlcacuhDBpBpM13ECvHD0uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750653; c=relaxed/simple;
	bh=7SsAgJoIalGSvSLdZnaVUuWGZzMJ9E7I+1z7fmpbci4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jofevf1MjzqdpatA5G4PQpIh0cGy3uCq8WCksLbsFcCwxUF6M2fKEIw0QDz3MkaFMtcB0QOC38i3mpXR1MhPFhvKv0JSMXz5smg55mo0uxPhB+MfHkfRkdNpGOPiaYDLy5742HDcMCFT0XxBgCM9Xv6XyYAyxqjaR+pWfe+bp0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NANCi/AR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NANCi/AR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF1C1F00A3D;
	Wed, 26 Aug 2026 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787750651;
	bh=Cqd5rlsTxLaedU9aEgEh2zTTHv2aryvw/tfpqEpns7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NANCi/ARJj0kpSlQWpB06NKXifUcRwurJI4/eytsCGqntcl7nIx33U0nHQaA5wHjU
	 v4WIpIyoKOE+7CZAta5JzftUI9NHRhIfYkSi/zkDqfujmKktt8jMK7oCN8UquhS+gj
	 CtzZLR7hc2eDAtxumBaj0oZ2031GxhEZwviG8ihU=
Date: Wed, 26 Aug 2026 15:24:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Alex Deucher <alexdeucher@gmail.com>, alexander.deucher@amd.com,
	christian.koenig@amd.com, harry.wentland@amd.com,
	sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/amdgpu: Remove is_idle method
Message-ID: <2026082651-collected-algebra-26c8@gregkh>
References: <20260815180033.8958-1-linux@treblig.org>
 <CADnq5_PgZx7aDGFD5pPQ=1MvF9_N_omVojNiDQFHjs0Tqasv+A@mail.gmail.com>
 <2026082644-monetize-tingling-0abd@gregkh>
 <CADnq5_N0AxaDZswgEQ7BEcKw8mF2hnSbAQp-w9U2Fy-MaEw8Rg@mail.gmail.com>
 <2026082654-gangrene-support-8541@gregkh>
 <ao7l2qRUJpomS6Bw@gallifrey>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ao7l2qRUJpomS6Bw@gallifrey>

On Wed, Aug 26, 2026 at 01:10:50PM +0000, Dr. David Alan Gilbert wrote:
> * Greg KH (gregkh@linuxfoundation.org) wrote:
> > On Wed, Aug 26, 2026 at 08:45:29AM -0400, Alex Deucher wrote:
> > > On Wed, Aug 26, 2026 at 6:21 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Mon, Aug 17, 2026 at 11:27:41AM -0400, Alex Deucher wrote:
> > > > > Applied.  Thanks.
> > > >
> > > > Any hints on where this was applied and if it will get to Linus "soon"?
> > > 
> > > It will show up in drm-next after the merge window closes. 7.4 material.
> > 
> > Sorry, but this is hitting me now, pre 7.3-rc1.  Booting and getting a
> > zillion kernel warnings isn't ok, that's a regression.  Please get this
> > merged sooner than that.
> 
> Hey? This patch doesn't fix anything - it's purely dead code.
> My comment about the log errors I saw were about the head of drm-next
> I tested on, not about this patch.

Ah, my fault, my search found that and assumed this thread was the fix
for that.  Nevermind :)

greg k-h
