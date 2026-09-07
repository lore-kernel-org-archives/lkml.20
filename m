Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FDA51476A;
	Mon,  7 Sep 2026 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797867; cv=none; b=D0lefjNIIMjEoPoDci05FycQrVduZvtKWx6Q2zmEGp2yjzZUHs0iYXvmsh7TZYakRPaTxVkmtRpkeF2GH/5NN6U0JIlWmL03oLxUVobJpKFfnFNKg6Q7GDRekdTf4clO9/onL/IUO/6/C29SNsk+JaL6+R+ORVyjwx5PkGyuPqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797867; c=relaxed/simple;
	bh=SoQn4wrxqRt9hMp8QFkX2bJJp9eT0+mxpwhCPrhOaNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnqDWSMv2g49gnskFw6XddRKM3YPd9sGBowZM/1p2j0kcd1tGOOQKzRSrOzFnEUPLs7KnAPXc0PV8mAf5awQDJbMoIwo52/l0IeITBK5oUvgNY2VD2XBkyqCtN5MZu7jExuQ1oDN9mhNLW2hsrvd1lXlHcBp2xW8No3bQl8e3Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HYf2pmfe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HYf2pmfe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677AC1F00A3D;
	Mon,  7 Sep 2026 16:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788797865;
	bh=AnKmLqKnKzBaqG3MPPgtEXIpFd5O8oxNp4vCZqfcNtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HYf2pmfe2QMpd3oeQmvKqT0TOhjvmXJR+GsIJSTkrbtTh39i1XWE0yZhwIHq8Nklq
	 cF5kyn++W4+qclKAY4jzwPdO16B+Leyyef278KrDlJ3J4vivQAb9jLHTlIAvqPW9mI
	 cUInBu2EDC7ElzEfAxphgXAZKxEFDojQh8yq37fc=
Date: Mon, 7 Sep 2026 18:15:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Godana Emiru <godanaemiru@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: document the locks in struct
 most_video_dev
Message-ID: <2026090743-vascular-theorize-45ab@gregkh>
References: <20260901172055.53889-1-godanaemiru@gmail.com>
 <2026090351-trickily-churn-6635@gregkh>
 <CAKODxtuWpgpXqS5N6SS9Qu4Ng0gD83aAVCbg7J3S0ojXrGn5RA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKODxtuWpgpXqS5N6SS9Qu4Ng0gD83aAVCbg7J3S0ojXrGn5RA@mail.gmail.com>

On Thu, Sep 03, 2026 at 04:29:46PM +0300, Godana Emiru wrote:
> Hi Greg,
> I used an LLM (Claude) to help trace the locking and draft the changelog
> for this patch. I reviewed it and sent it under my own Signed-off-by, but
> I failed to add the "Assisted-by: LLM" tag required by
> Documentation/process/coding-assistants.rst. The same applies to my
> earlier rtl8723bs patch. I apologize for the omission.
> 
> I'm happy to resend with the correct tags if the patches are otherwise
> useful, or drop them if you prefer.

Please read this:
	https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
