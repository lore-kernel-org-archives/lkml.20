Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45728427FB0
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750692; cv=none; b=QaD2GtU0AQLFHMkp8mPtpDziG/4fDlphvAoqksZH1r0oCCQrEUdkX+M3oT/mWYDF9+QxxVK3ohb29WfPNI8nmrRuAgGj7nFkI7Sfc/qc91iDD8mev30KSMfE41k1jHzo8WWIcu3vokXaxKWRqHETkxFhTdc1XgTJNTKDGVnIdTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750692; c=relaxed/simple;
	bh=YpbyP22KZen+xQZw0gFmGCBECjwsC7T7L9VZRFBkzKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DK2ONkQAbjc5IDS8eL23olgNvy6qT+b+BjbGa/M9VuQYxGUpf3KI/pZVsHIm0uVtTADw16BWPqLedSON173SN4pV3Lk8NGdANlw4ujJL7/dbUScQpU17qjOW9MGzJSOxS3DTViE6sFYASwJP4JbZMNRcz6dQvnG7p7Fv+m8FHKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oATMkiFP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oATMkiFP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7F51F000E9;
	Wed, 26 Aug 2026 13:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787750691;
	bh=MVP0EPkKNDW2dWvhW3j8ACNrTESSJX2Su++vyE31fZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oATMkiFP1WoVX5vpqBshYrUpDmi9mqHTaBCg8rHG7UCqUPsEdMTDLu8W4QYS/iAo2
	 vNywpTkGxU0uZHl1m33o3MM89IyCDUcm+e3P2X5raqQ0rusyZfDAbhOWUuHDj1Abss
	 XcDacxBSaZwiBSp2fZwa6WpZx6xsXiuM0VKklGjI=
Date: Wed, 26 Aug 2026 15:24:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: linux@treblig.org, alexander.deucher@amd.com, christian.koenig@amd.com,
	harry.wentland@amd.com, sunpeng.li@amd.com,
	amd-gfx@lists.freedesktop.org, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/amdgpu: Remove is_idle method
Message-ID: <2026082641-captivity-wrongly-ca1f@gregkh>
References: <20260815180033.8958-1-linux@treblig.org>
 <CADnq5_PgZx7aDGFD5pPQ=1MvF9_N_omVojNiDQFHjs0Tqasv+A@mail.gmail.com>
 <2026082644-monetize-tingling-0abd@gregkh>
 <CADnq5_N0AxaDZswgEQ7BEcKw8mF2hnSbAQp-w9U2Fy-MaEw8Rg@mail.gmail.com>
 <2026082654-gangrene-support-8541@gregkh>
 <CADnq5_N+bXX2cFjxr0xHX9Yso6+OHh=9i=61boEsRedYwid9aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_N+bXX2cFjxr0xHX9Yso6+OHh=9i=61boEsRedYwid9aw@mail.gmail.com>

On Wed, Aug 26, 2026 at 09:15:00AM -0400, Alex Deucher wrote:
> On Wed, Aug 26, 2026 at 9:09 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
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
> I assume this is the series that fixes the warning you are seeing:
> https://lore.kernel.org/all/20260813143605.106104-1-mwen@igalia.com/
> We are working on picking it up now.

Ok, great, sorry for the confusion, my bad.

greg k-h
