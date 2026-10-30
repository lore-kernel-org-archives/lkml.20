Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373675;
	b=nKkoFuY5ETjE8m6YGAV65YJfu6g1oVrgyusHVavzFKZGlGFqC8foxCebS6yRBy+Bkj6J
	 hEYdoKqeeCvussiDExObRBzgVNmsHjKvoFfZEsZsy8GR+S++GoF54WptTnxXUI3cUrR0+
	 RHqGNlmvaxvYPmMu/I6KRAOoVMOwgsli/vOXHp6O6VEIxaVV6dksWV0sKaEPE5zTCpaaG
	 ilDIxEFepbBbflUEmRTXG8sfYUBQbqz6Ud5t5ZYB0qhYUagjHhVfhNNIWsIaFHbukgQ3x
	 m0WdpmIXprBAGJEr1e2HgJNAUhOeeVY7fUmnrUrGNcPfcuyzy9wEI5C/vvekFcQDmxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373675;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=s3tBKlM8TfPzO3ItvJvt9Ntg99BZ+e49p9hTsuEuRl0=;
	b=OAESMhz2ZvWA3Buu8D3XSzXns1Nk3mQOa/apG+dsxdSYqWfXwKA8oGYyjE+QAwqaMM7l
	 06BfRFTobbWp4kR4czwcx83LW+4vNdgOiFz/fF1fnX1k6E/LyfZYC+pXG2WKWrXZXz5IC
	 /WOmU5TYR80oJwc8LXNrBNFkEjaFlwFiTbsH4Ud6LUQVHFHJQnz0XR1JcXoPoDvOZN7Pq
	 8uIdeoAVkXcu7pJV+iBq7BJYL8mfCkZrpQtK5DGYsIb25q/Fy1KuDrHevTRV/wUI5qlwn
	 9KG3Aog42WWslwFxAWljZfP8kf90S16TOrA6Ye7oLsLRnMWVDmY+dV4mv6xgYTOJwlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YrPQUtlb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76483606A31C;
	Fri, 30 Oct 2026 15:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YrPQUtlb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE011F00A1D;
	Fri, 30 Oct 2026 15:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793373675;
	bh=s3tBKlM8TfPzO3ItvJvt9Ntg99BZ+e49p9hTsuEuRl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YrPQUtlbR169WkQJ3Cru1D2WexrhUqRqT4ms268LNMge7HEGN5+Pc+a6Xn+NJSZI2
	 9WIMJBIWrTQag5VFOuBs8zAxRrUuMkcU5ut7BMJM2t2PGZlXcvi5Fs8awNSwGd7A+x
	 7JpHK+IU0om22SqVfW9jxDrtHsYbQfLI1KsneMJY=
Date: Fri, 30 Oct 2026 16:21:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linfordWu <linfordwu@163.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix use-after-free in dump_module
Message-ID: <2026103057-famine-yearly-6276@gregkh>
References: <20261030150355.1809319-1-linfordwu@163.com>
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
In-Reply-To: <20261030150355.1809319-1-linfordwu@163.com>

On Fri, Oct 30, 2026 at 11:03:55PM +0800, linfordWu wrote:
> gb_audio_manager_dump_module() drops modules_rwsem before dereferencing
> the module. A concurrent gb_audio_manager_remove() can free the module
> between the lookup and the dump.
> 
> Keep the read lock held while dumping the module so removal cannot free
> it during the access.

How was this found and tested?

> Signed-off-by: linfordWu <linfordwu@163.com>

Real name please.

thanks,

greg k-h
