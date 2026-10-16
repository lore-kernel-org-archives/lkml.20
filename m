Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B684E50AA;
	Fri, 16 Oct 2026 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166820; cv=none; b=ZE7eq7I+KuIGJrUBBquqY5X++1dwGpp17G8H4B9f9p/2V3S8pSfB75roMsbHGfyWzJiYKPjxXdUj7olf+k3okNytabv8hetgIPlH/qQsin1L/kE/IGSNaINhihoQNPC4PKENxcZJK2rwNwu/b7mGkObaVKjJiJWMhh1fJ2j40q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166820; c=relaxed/simple;
	bh=P7xoi/48OfUGfYAlKLcJ3DIv6/5hzGyzBD5CtlEccLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crIJnqcYNzm+nVbmL3Tj9Kc8J0AjvimHwCdsI0YXkcNMVjr5y2wY5F0j5y8rra4foAbB3neTYL/zIgXERcv8U4pGRWuOEfjWHwbdhKrh68vgwbjCdmFV1vQjAOM1cV0yqf4jfZqK/aEpNAiUe9JXFb+tz9qoCPkqz48DRqoGlWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O/sufW3G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O/sufW3G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C621F000C5;
	Fri, 16 Oct 2026 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792166819;
	bh=aaVBUD2PKbkek+Fd/f96Q4HKVt+s1ljkp4Vo6Ejr404=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O/sufW3GGjcFCYrgwQH05z6vC9t5tJo8nJ3FjJAMPBgY8z8YDeM50+5OebBG0M0vH
	 arX3qdz5tRa0Mn8KCflBCT3ZmYBkQMj9Q10d7OSlCm/WJpCfCut7X2tT9fJH0HOx5k
	 7Zfn3x45vAD8/wOZqxgYxfoiI9n0yqBViuSSUQUk=
Date: Fri, 16 Oct 2026 18:06:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial updates for 7.4-rc1
Message-ID: <2026101631-doorframe-purge-17ac@gregkh>
References: <atHfPtcketplfkrd@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atHfPtcketplfkrd@hovoldconsulting.com>

On Fri, Oct 16, 2026 at 10:24:30AM +0200, Johan Hovold wrote:
> The following changes since commit a90ee4305c4a5df72c11b31dacfdc76e00fcf78a:
> 
>   Linux 7.3-rc6 (2026-10-04 13:45:25 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.4-rc1

Pulled and pushed out, thanks.

greg k-h
