Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094C1261B71;
	Sun, 20 Sep 2026 14:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789913034; cv=none; b=Glaa4lDEweQEMfH8nka8BwHGmuTvIsD0UxkJdzxCaCOEGGR6ixJGabT/hth8nksDOJx5O4Xy3ZwVYb4wvn62FJExYOtDq2NqrtkXP1uHSflYeaV26anfY5/GOOhXkw3IJkIeeQlWgmbXtovah4+mJ6o7VtB+F80ZjT08fNdowbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789913034; c=relaxed/simple;
	bh=+dNyQZr/hF8TCcMxVYJcqLu1xYsWzf4A3phWn7ARN9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHtbPcDfLzjIWKGfF9CdUcSd/fIK5dodswb3y1nwh6zmoxNDwetK3y2mYDGZoLljx8fDtOyAGFjFClqR/YzJJcmZvu5mJQ4n4lpDbBmh4nQRu7MOypu/EoEICjjg14AZDZKRgM5BrzTUqdhsadn/EyfvOcbCbwyW5SLI2fm/sAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZCvdCqBE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZCvdCqBE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C3D1F000FF;
	Sun, 20 Sep 2026 14:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789913032;
	bh=R9XNxNb+W0NnslLs+eLtQl213DHz5FWWD2WFeRoeAGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZCvdCqBE+fFS9WdiJR2stXs/DKlz7Kju17IWmu4y75Jm5ZYnVGED2fsdRVVaMTMQ0
	 gA7G9DbWS4sI5D7o60xORjllAZVakCggwqJzQG89OXK/xwomA0BiloEr+fJL1FhR0j
	 r1pXTib/AFSSa8JNH9ZLnUt2T1fo9EozrdMZ3G0M=
Date: Sun, 20 Sep 2026 16:03:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Park Tae-sun <ts930@dgu.ac.kr>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: light: use sysfs_emit() instead of
 sprintf()
Message-ID: <2026092047-dubbed-gracious-154c@gregkh>
References: <178991148304.29938.6850889942806082479@naver.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178991148304.29938.6850889942806082479@naver.com>

On Sun, Sep 20, 2026 at 10:38:03PM +0900, ts930@naver.com wrote:
> From: Park Tae-sun <ts930@dgu.ac.kr>
> 
> The sysfs documentation (Documentation/filesystems/sysfs.rst) recommends
> using sysfs_emit() instead of sprintf() in sysfs show() callbacks.
> 
> Replace the remaining sprintf() calls in the fade_##__dir##_show()
> macro and color_show() callback with sysfs_emit().
> 
> This follows the standard kernel practice and existing use of
> sysfs_emit() in other Greybus sysfs show functions.
> 
> No functional change.

How is this different from past patches that have attempted to change
this?

thanks,

greg k-h
