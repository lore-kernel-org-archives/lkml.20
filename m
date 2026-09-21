Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DE7496D5D;
	Mon, 21 Sep 2026 12:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993937; cv=none; b=adslgKJ+5SWxt5JWq7r9o6kHrRPc/xrpHAi9TOR2sUqU+s50lwNyjShNucD0id2drd/mEMyrQ5spdKYSWfV8wvi5Z2SdgwV1j9h8IG5c7PVZZaHinxF0XUyO9UOo5/av9O7xkLIh09rALw9F1+rqXybP7wF2EC1oHq0iYVf0PEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993937; c=relaxed/simple;
	bh=14qQ7L+ykPhFFwiTdzXnfFkHPLdKB9VLmhK/9hIJUMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBj3wlkgP1exyQWzLkgKeYpjp+LLbrYL5rNyUv2F4qUhWKLnBZGdYeeFHRvnAA7ualLK0h0CpvJf7SIMLgUYGf6gDqy+piLVDvSaU8caL2hWyhIods3SUffD2KbcMih0Ss8oEwsYaoRuwXdYpdAatxlu2atEbcUQmvn29wkrZIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=095nee9N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="095nee9N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26FC1F000FF;
	Mon, 21 Sep 2026 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789993935;
	bh=14qQ7L+ykPhFFwiTdzXnfFkHPLdKB9VLmhK/9hIJUMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=095nee9NzDvxFzbPGtPU7gx+k8M82xnu2aN5sbg75rTfH+n4/in8SoRhVznQR8z+7
	 419blTEpP5QRb0zygT2ESa6jYiAC02v7DuPKSk4ZAGzWdvm2LwWcRoP51oYJ5O2/6D
	 p/O0u9xf1O/HV48CaaUVdS1pPhTNP0UFARK1Dj0w=
Date: Mon, 21 Sep 2026 14:32:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?67CV7YOc7ISgL+y7tO2TqO2EsMK3QUntlZnrtoA=?= <ts930@dgu.ac.kr>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: light: use sysfs_emit() instead of
 sprintf()
Message-ID: <2026092142-macaroni-hybrid-c63d@gregkh>
References: <178991148304.29938.6850889942806082479@naver.com>
 <2026092047-dubbed-gracious-154c@gregkh>
 <CAFPGN2hgqTyg+jpsY_XzbNPijV3Zce3Drw3a_c8pDBZH1hXV2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFPGN2hgqTyg+jpsY_XzbNPijV3Zce3Drw3a_c8pDBZH1hXV2w@mail.gmail.com>

On Mon, Sep 21, 2026 at 01:07:08PM +0900, 박태선/컴퓨터·AI학부 wrote:
> Hi Greg,

Please resend in non-html format so that the mailing lists do not reject
your response.

thanks,

greg k-h
