Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0362165EA;
	Thu,  1 Oct 2026 05:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832914; cv=none; b=fhvxk45fqtxhwZEsdyEmOtXeSikHxIeNhK6FJ66ihXcqVh0I927p8nbRI5hUQyBLqUHhcanSEAco6m4qfZYvbd+MS6dSWNKnM6JC8JGiHBqeLwkcJFxSU0c6o+D+TwCAdF+vs4QMxGcbeT19EfS6eP4zpUssRb85OkTHZSLkmhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832914; c=relaxed/simple;
	bh=bRDw1wOgxh2eSp7LkLa/QOl9kS0c2jnm3ihbhNKk0jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9VVXYJu4PdfxWZAT0/NCdoqGHefvP6DFiUx6xC7eJvCqLL6qYyO0H+0Au5TuRg++c1X4uogEx403c2nIgd/n/lBzhK/hzT2bb2JTAGwF+TyNij3axhuthzYHVu0Jwk2r7a5plIQF41EN27uS74stcMY3H1dPb11wA5f8MnayZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jQqDBoj2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jQqDBoj2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F881F000FF;
	Thu,  1 Oct 2026 05:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790832912;
	bh=bRDw1wOgxh2eSp7LkLa/QOl9kS0c2jnm3ihbhNKk0jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jQqDBoj2o4m/mITfDr3y6taWrhct4nRDMfsFYja1vBZiNDwb4lkGoINVVuH6LJd36
	 KnGUIj9klL2PHy78SyE5VT3ysl39i92Ha/jcM2YXlTQ0OqJrUhuzC+Ul14S8erS/5W
	 4BkW7I6M5KPJCyVOKx5cQK8dwBXmpsNE1/5CamCA=
Date: Thu, 1 Oct 2026 07:35:06 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Kaden Vaughn <randomfnp@outlook.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fixed formatting issues in
 rtw_security.c
Message-ID: <2026100147-boxer-railcar-0ee4@gregkh>
References: <PH7PR10MB66522A228CCAA372A4F0820FBFA32@PH7PR10MB6652.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR10MB66522A228CCAA372A4F0820FBFA32@PH7PR10MB6652.namprd10.prod.outlook.com>

On Fri, Aug 21, 2026 at 03:15:50AM +0000, Kaden Vaughn wrote:
> Hi Greg, this is my first contribution to the Linux kernel!
> I tried using git but it wouldn't let me send the email so im doing it through the outlook GUI.

Please use git send-email, we can't take patches as atachments.

thanks,

greg k-h
