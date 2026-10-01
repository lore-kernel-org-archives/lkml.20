Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5FD36C588;
	Thu,  1 Oct 2026 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862534; cv=none; b=IIkeJv3XJfUgWqsXhTl0TmxQHZJpQy2CUGy8wwrR9ybYee9WoOFmhXjl3+6QFqCRM5D/6D0Io0LgoI8gvzdsT34leDL3UZk7ydDTh2f2x5d5K7YpD0SHOiXvPTSQ87DcEt/J6NMxEwyDeCso8fsrmiimHv0NTEcB45EYrfp9GgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862534; c=relaxed/simple;
	bh=B1rxy8TbVmXuqYzgDge7z8hpWPfLzd9ctvzN+FupuI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+mH9fCuR7gtJeYIwC+utk/sZySmV0VNCsptKzROPDOoIzVi8v5Da2ImJmtGWhOHH65TxhgACdH3ISJJh5sPc+K5oAcsr6EYLVNnBPfeDPz+xkWSKKKgqWlq1qUnPTA3zCaHIOqgU1byd1YHHvTMtcX0mTi4SkVLxT8W6b062DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DgdhDDEZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DgdhDDEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337981F000FF;
	Thu,  1 Oct 2026 13:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790862532;
	bh=EIM+C+e+4PvWG+cZY2v7W/4I+OMjOleN0U6/nEFQGGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DgdhDDEZmx8sVLN50ggx4JcPt2De2Ofo8Xa1VZ6DMJT81jKEAuMiArWG/PLR4b5eZ
	 KWSUictsWzejoJZ8uotLu2UEiobWcILeQqtsiQLY95A+/y32InALIrutE5fL7Ykk64
	 7U9MGO0xQzu9S5hYaxuNIa3IjBpfHhXXBPw5TXkI=
Date: Thu, 1 Oct 2026 15:48:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com, guojy.bj@gmail.com, error27@gmail.com,
	knavaneeth786@gmail.com, dvdh12707@gmail.com,
	m.steinmoetzger@gmail.com, fliegbert2@gmail.com,
	enelsonmoore@gmail.com, nikolayof23@gmail.com,
	khushalchitturi@gmail.com, samasth.norway.ananda@oracle.com,
	dennylin0707@gmail.com
Subject: Re: [PATCH v5] staging: rtl8723bs: Remove manual ifname allocation
Message-ID: <2026100131-nursing-goldmine-3122@gregkh>
References: <20261001130127.3655-1-nsvatoslav515@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001130127.3655-1-nsvatoslav515@gmail.com>

On Thu, Oct 01, 2026 at 04:01:27PM +0300, Svyatoslav Nikolenko wrote:
> The manual ifname allocation via dev_alloc_name() is redundant because
> the networking core handles interface naming automatically during
> register_netdev().
> 
> Remove the ifname module parameter, the corresponding field from
> struct registry_priv, and the rtw_init_netdev_name() callpath.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
> ---
> Changes in v5:
> - Rebased onto latest staging-testing to resolve merge conflicts caused by recent tree updates.

Still does not apply, are you sure you are using the correct branch?

thanks,

greg k-h
