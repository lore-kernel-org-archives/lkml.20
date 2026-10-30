Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399409;
	b=xRomKtA/fIw7GGqa13j6Dc2YU58RfrEoqKldracMmNbfZaMUPywYziXk0ROSfVdn35M6
	 1vbBqz+pbIxZ0C9zMd6NcvpSP3yjtsVOf0x32DhURhuzZgcFhpKmqxRNcCrY5WHuOeMeZ
	 DzWc4B4smO15axWvd51J9QUqfgCeUu2qL3SymI1jQvzZ+zMfjcySlpK3zjI+bWsXHiQTs
	 onhWT2FQQvW2FXljVexcwd4NtxhQZQhKPz7/ZPwy9YKdGtK8x7RpVJGjMCSj5/xgTfUf0
	 GZRX6/hemn4/rQW+6vXQO+Vm0nVAeyGYU/YS9/ewt+Cy66cUqWNIvqgXtAGHHm+t/8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399409;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2cuNjmvZKnPvPjsqg7Q58J8xu19bFXf2Ow+4KUERHXA=;
	b=ReVwNJJD5Yg8widQQHj3hRDXPCF6TZqrx7sX+GsBz8TLY8zkZYpqwOORH7sHSvrQuPya
	 GJN/TdcGntFdAJhyMwWzgZkCm7YH6mI8VpMa0UrndxFQpnQLek8EQr4GSQYbfgNiHZlSr
	 K5blCZ4DbvEfG9EHoYSu4Bjxp85epSGJv5z5WdelN8lB2Od4pArzMj5gwRG2XfXMfCp4W
	 9lsi9qO/PWzlPQOilhKJ2sVSW7vG6s5h4m2W48kJy65bg509ycn25c7qqbRFXOP4JTAIZ
	 LhcVFrcF+oCXhalbacuP2yQ7hAv8KG54UEaJzPCgV8D35cc0AScFhQ0gJYz9QDY90mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="UXHY/z/M";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087E7606A31D;
	Fri, 30 Oct 2026 22:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UXHY/z/M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33F01F000C1;
	Fri, 30 Oct 2026 22:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793399408;
	bh=2cuNjmvZKnPvPjsqg7Q58J8xu19bFXf2Ow+4KUERHXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UXHY/z/M6VFNnMtfA8LYA60iyd7VvgLLXhW8V5aypu2KaLPOGkQnceylC9GITthBx
	 LEtO2P/xO8ACR22Z3CYANzt5B7rqu4G+dSYj4yuB1or+wEtcEmUp1NaCKnhWwa/BaW
	 pCvTFtRFtD2pur1/PqyOP0sV+gFJTVXF/7WkjebQ=
Date: Fri, 30 Oct 2026 23:30:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial fixes for 7.4-rc1
Message-ID: <2026103057-wriggle-unclothed-f1db@gregkh>
References: <auTTUf8alxj9ay6X@hovoldconsulting.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auTTUf8alxj9ay6X@hovoldconsulting.com>

On Fri, Oct 30, 2026 at 06:26:41PM +0100, Johan Hovold wrote:
> The following changes since commit c339f4010dea8b0d754f84ace70cd1b089878ef8:
> 
>   Merge tag 'platform-drivers-x86-v7.4-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86 (2026-10-28 07:36:32 -1000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.4-rc1-2
> 
> for you to fetch changes up to ab89a9dab02d9553eb0cc27fd3e4a4998acbc8e9:

Pulled and pushed out, thanks.

greg k-h
