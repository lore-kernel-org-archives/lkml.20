Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F242493648
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859703; cv=none; b=juJaWdXa6v/cTzH78uXlG1SlGaoy/J003VHRN6mcbfCMVnYt7FPol0HmOWkdGiBHONBED9jEhY453f9Fh1C/G871ePgfxv0BWXkKE2LoTM7JkSMG8A16R8r6r5jDk6dwBEO2zSOUafojky+2dGZHH8xZi421LYSxOBJ+oegGESQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859703; c=relaxed/simple;
	bh=oU6/det5HUK5KqN8EsKJpwaVS2VjH35it2kXFOkWdyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbgkR7355wbx2xepitEWpd+BhXFOUu5FsVtOY/oG5xik6HC0dP6lq1LtzY8BhEwM2wHoo1UPLLKTNoP5sDUFrmspnbQbOB6H+pMNxZpb+sYCMEE7n4hm1o89h7uMPyBSELUkp408/q09QBHtSB4mH9jynAsBcojZYUBM5onewt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fx/OO9Pq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fx/OO9Pq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0841F00898;
	Thu,  1 Oct 2026 13:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859702;
	bh=qsG459SeAnIYQeFjgHWg4kx9TumJ/vcmHPElH3Y18uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fx/OO9PqfpUUewoq3irvS3bQJbplJwC+e/h0a7O5QQcdI6zVmb648EFULIQFRnejm
	 6tNtbDz4jwXcCVfjVGeRRj3P7W4p/NHP2wFeAbXUJ6xdM5FhQBEPosSvgl6lsOcZRZ
	 B5oaJM/XcDoY0W0c6ZQn3sp/mmr1MnrOPoXvM5A0/jiH8f5bYTVSgfdD4lMARtRLOU
	 KUfyCtAMkfXZTUEoTWrzUcw0qM9QWUHTR8xAP9mVoFVMGXRMhG91uJWVyGpctblNeN
	 k3+IKg9i6BaI5yayt8OEAQ++BVG3B+Q/LPQWN7rFPtJjfh+vbApmDZFt5IgYgGUwxF
	 RHTmg+5YMc9GQ==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xCGPs-00000008Qnf-1XIG;
	Thu, 01 Oct 2026 15:01:40 +0200
Date: Thu, 1 Oct 2026 15:01:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel-simple: take i2c adapter module reference
Message-ID: <ar5ZtMgav9YM6ciE@hovoldconsulting.com>
References: <20260716132334.1565183-1-johan@kernel.org>
 <anx_MPm2Y0RVwZ9h@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anx_MPm2Y0RVwZ9h@hovoldconsulting.com>

On Wed, Aug 12, 2026 at 04:12:00PM +0200, Johan Hovold wrote:
> On Thu, Jul 16, 2026 at 03:23:34PM +0200, Johan Hovold wrote:
> > The i2c subsystem currently blocks during adapter deregistration
> > whenever there are consumers holding a reference.
> > 
> > Switch to using of_get_i2c_adapter_by_node() which also takes a
> > reference to the adapter module so that an attempt to unload the module
> > while in use fails gracefully instead of blocking uninterruptibly.
> > 
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Can this one be picked up for 7.3-rc1?

Again, can someone please pick this one up?

Johan
