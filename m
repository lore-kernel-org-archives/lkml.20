Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821609;
	b=QDeU0bPBLmuoEfyzcXsQqzr1iOOaq/WINm86ayfQkmarXdL4wEjhkC+C2VD5utwSX+rY
	 wRizaCw+W48LGrUTMVYFwfAZeKdgK336K5KO5/grGpdYAvmGmHRc5HcwOnrakruJnVA1E
	 ctxhDB4to/esqzxlbWV8P6FJ1rj6ESWMWU+dFk9Rl3OyGOdGU2d66oFn6HlnAMkcENAgU
	 X4BWEBhRU25/OfYenJNM0YmeRGUwwiQUt+FR/kT5Jrqcrx6hEDtOAqY9ZtGBAcM7d/uXh
	 BlTC85Qf4MFPpNkrS7gdy1VCvCWT/+bprlTshPsEblp940zaN7goFfl3gkb1LQznApA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821609;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=boT7pAH8z874buE6Rv25OQ60U452A5HSti2k9l22jks=;
	b=zZeqasKYxTImcN0u/QXheVN+MQ4W0g601RjJWcRtnSGvheS7mk46/jhWDCNbT4yGrrS5
	 0SPR30EpXGaG4uwVAJTSd3bB9Y/gLoYX65BCc+r/vlDNO0gGM8Cv5HdVhKbqyedbpkLYI
	 da7bLCz3qDbai60lyqdklYe5Ki0FYgK4v+jLhZMgku5nnJ3yXrd4YMiujDsxPxjV3K7E/
	 NF8M+1uRDRmsXngwVMcO1kyAZNWTYXaW2w1srHqddZIFxC4lo2ICyNt/gmCmVS+e32tl7
	 aZwQTDFd+/48Ttmw6LbOAKUCinZcwKul1PjFop5MnqOWvZER+UPr6Y9NWjADzMRPPWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tC2AacQt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4E4606A31C;
	Mon, 16 Nov 2026 09:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tC2AacQt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4706A1F000C4;
	Mon, 16 Nov 2026 09:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794821609;
	bh=boT7pAH8z874buE6Rv25OQ60U452A5HSti2k9l22jks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tC2AacQtoKZ0wjn2gIauXxeHc49ND27EZXOoH1SRFDNtxuD/fknYXZxznoW0uMC+9
	 wk4GuJ2HtooadDEMq2C3Ld+kl1TFpSlbSGXNVT6Nj7TvQ9NKdqBMzUUpCLnrlhelMw
	 MmBm78cHWfdMlfl2GfA3PEKIZ04e7UvXS+uJkSCg=
Date: Mon, 16 Nov 2026 10:33:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] usb: core: resume clears needs_altsetting0 even on failure
Message-ID: <2026111636-snowless-pacify-e2f6@gregkh>
References: <20261115163654.226373-1-teel4res@gmail.com>
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
In-Reply-To: <20261115163654.226373-1-teel4res@gmail.com>

On Sun, Nov 15, 2026 at 08:36:54AM -0800, Cheng Yongkang wrote:
> Hi Greg, Alan,
> 
> I hit a corner case in usb_resume_interface(). It needs a device that
> fails SET_INTERFACE(0) both when the driver is unbound and again at
> resume, so it may not be worth fixing.

<snip>

As your "tool" found these, it can also make a proposed patch and test
it for them as well.  Please do so, don't just send "empty" messages
that claim a problem is found by a static analysis program.

thanks,

greg k-h
