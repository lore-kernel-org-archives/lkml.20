Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD9A4772BA;
	Tue,  1 Sep 2026 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257096; cv=none; b=R3IveF3lf/RxPbmvqFxKpRLvZKoYcseraPndZMjIryJUsftE1OqbcV/vsG/ywXdiLVIlE62Y0pIhL+goTmDTmbZZ8/0SUcJpvMM24MHebfHy9LDyybFiXNLClEsht26pRSKndS5BOcKPEBo5oFbmZ9xV9+BivhrtQfmHTJTh+SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257096; c=relaxed/simple;
	bh=ayyPaW/tbrFUSrNA/nS1C8CPFAn5gDPlcaYZV3tBSC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXGh3qEbAEYmlNG42DWulVG9DbmP/VbPm8dQjXtwNHU8AAvcvPMtl15CD3YNmYQh1v0JzmjU+nPQFusPdMa/x5NiJF+SmdS1ofuSCSr6IFYnr/9bxHM6JTBchA8PotZGBY4udqaeoxUwh//vaaVxVRVTqZkb6LxQ7cLo30YnZTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BW5Df7Kj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BW5Df7Kj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CD61F000E9;
	Tue,  1 Sep 2026 10:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788257095;
	bh=gIb2AZxfTBsD8XuYX7U3KD8rYkxYjknP+WGolFWcncg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BW5Df7KjBQR5Vib2184nYFv69787CSFV3usWGFBw+WDYTAAZBbKLAdKkNyvylnPeb
	 u7AIto/lFIRN2CDSZJ4XHxu/RXW5egnOX0ipe6KTmu5Y3m+c/HxOyjBT7ik0U6JtRq
	 6ixlk+JmdzE6dRVQ6Pc19EJ/1uacX/5rKS73jm54=
Date: Tue, 1 Sep 2026 12:04:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Avhi M." <dev@avhi.in>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Mark Greer <mgreer@animalcreek.com>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager_module: add missing
 newlines to sysfs_emit() calls
Message-ID: <2026090136-unframed-antarctic-2647@gregkh>
References: <20260818081535.68198-1-dev@avhi.in>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818081535.68198-1-dev@avhi.in>

On Tue, Aug 18, 2026 at 01:45:35PM +0530, Avhi M. wrote:
> sysfs attributes are expected to be terminated with a newline.
> Add the missing '\n' to the sysfs_emit() format strings in the
> module attribute show functions, fixing the checkpatch --strict
> warning:
> 
> WARNING: return sysfs_emit(...) formats should include a
> terminating newline
> 
> Signed-off-by: Avhi M. <dev@avhi.in>
> ---
>  drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Please see the archives for why this has been rejected in the past.

thanks,

greg k-h
