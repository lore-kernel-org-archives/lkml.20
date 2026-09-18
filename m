Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C568E4D9F67;
	Fri, 18 Sep 2026 10:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729142; cv=none; b=EVjKdhPdpQY19M0O6hVkvweZpbmB667qxZFaAh77F0y9U37QmZiBGitPNpSGrelRMNydHdmsnxZUOd1/inqKrJg6KCmJh/gCO52BF4Fp2jntMnMv7wVcBouMGSSC3hPgWhy+qicL23x8HSue+3vPb+eO7SmFVk/gKfv+AcmOsxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729142; c=relaxed/simple;
	bh=SjXUbPsiVwlp7m6xMbqXwevtaXlpT+PW3YMCgiZRLNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=to+uP8gjJjH/cwXG6Ic8qRXef4vjnnieJ8NGeKLn4/EEO4U2DmeTVxgXI39FtxZ4BOlaE+nrGVOEabjHTRVCV7udmkG6oaK0WuMChQYiQLOqaHUkG3wpAE+uPaFDlAR3tSzuTDNMLNhDvdDE39B1DLT604XXWqE2DAt2UF+IvXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C5XS60Pd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C5XS60Pd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F111F000FF;
	Fri, 18 Sep 2026 10:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789729140;
	bh=WBoCCq9qMgQXPbVes0bE28WdSdE94XkOuxnNbIbO05Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C5XS60Pd4e1xyCJxDWXOXHydo5VwTCEALCDQqL5rObG8lW/N8oOAcm6dStRFST7Gk
	 lQWAQi9LmXtbv6y5aAo1E++jT8fSXa0G/045n+AiyVQGTKi5FT3XmJPD6gC8yklJMv
	 sVb0acM66oN8sehPTHnpqlKua9JID3XF5Zi1dhPc=
Date: Fri, 18 Sep 2026 11:56:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial fixes for 7.3-rc4
Message-ID: <2026091848-squeezing-outlook-0093@gregkh>
References: <aqzjMWHGKkiL02Ob@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqzjMWHGKkiL02Ob@hovoldconsulting.com>

On Fri, Sep 18, 2026 at 09:07:29AM +0200, Johan Hovold wrote:
> The following changes since commit ae0e61d95677efa778379853e495d748e6efbf95:
> 
>   USB: serial: fix ioctl hangup race (2026-09-08 11:00:48 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.3-rc4

Pulled and pushed out, thanks


greg k-h
