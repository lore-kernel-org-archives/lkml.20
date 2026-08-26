Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5F03368B7
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749777; cv=none; b=QrEMcFzCgIIUs0vQAKqRXmxeh41F49E3ssztxgTdJA2VLn9UFNNxxni4fXezXgyE8EbgJQ0S/ggtXUM1mZV9JyN132HT61SYSd/yhZLuPx+ifVlw4+oey+LrCO3NUenWJxULXZEgcqA6phwRrc6VaXGnZqsPpPNYFKZLMfs9WLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749777; c=relaxed/simple;
	bh=Kpjq2htP6qIKbNpbfIN2Cqg4cRClkWfeZZS8KVjbvcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRVnEmtjg3dT1pb+eCqTihvoyf2WveAUue0+GYSSHEbjHnXBSfu5y5mLr+rlhDHnt8lVtgRVTZZFqytVktexKgrArnrgLDT1V1E6vtA1jjM/DBsWpkCN+uC0ITKIeoOmIkpcllY8TD32tU5hwY0nMAKoowclQyU1K7sEFizrEvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dwpXPrRF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dwpXPrRF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538E51F00A3A;
	Wed, 26 Aug 2026 13:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787749775;
	bh=Rpq2VUykNLOhiF907HuT93uBpOBN3LddAuW7oe+sRik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dwpXPrRFMd32s6F/iqNGbSQKN7Pxp9uvEybEvqAFxmpLgFoBWLmTShvRWFdBVIKc7
	 cKdFVj9WnHAnZ1RvI/3Nqkc0Clq8eUgs4BtpXACTGIN3jFMctTIOyP1dTbcs05L1zm
	 EuZDG7vuL9apSUyD3UfRaRKfC39d9coYnlDwKX5Y=
Date: Wed, 26 Aug 2026 15:09:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: linux@treblig.org, alexander.deucher@amd.com, christian.koenig@amd.com,
	harry.wentland@amd.com, sunpeng.li@amd.com,
	amd-gfx@lists.freedesktop.org, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/amdgpu: Remove is_idle method
Message-ID: <2026082654-gangrene-support-8541@gregkh>
References: <20260815180033.8958-1-linux@treblig.org>
 <CADnq5_PgZx7aDGFD5pPQ=1MvF9_N_omVojNiDQFHjs0Tqasv+A@mail.gmail.com>
 <2026082644-monetize-tingling-0abd@gregkh>
 <CADnq5_N0AxaDZswgEQ7BEcKw8mF2hnSbAQp-w9U2Fy-MaEw8Rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_N0AxaDZswgEQ7BEcKw8mF2hnSbAQp-w9U2Fy-MaEw8Rg@mail.gmail.com>

On Wed, Aug 26, 2026 at 08:45:29AM -0400, Alex Deucher wrote:
> On Wed, Aug 26, 2026 at 6:21 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Aug 17, 2026 at 11:27:41AM -0400, Alex Deucher wrote:
> > > Applied.  Thanks.
> >
> > Any hints on where this was applied and if it will get to Linus "soon"?
> 
> It will show up in drm-next after the merge window closes. 7.4 material.

Sorry, but this is hitting me now, pre 7.3-rc1.  Booting and getting a
zillion kernel warnings isn't ok, that's a regression.  Please get this
merged sooner than that.

greg k-h
