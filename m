Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E72E49E150;
	Fri, 11 Sep 2026 05:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106390; cv=none; b=ekzukmi7LKwljyNgA1o0aS4UWuH/GEVC0wKKurfnXdFvJ6JJ+rT+7unlDDDDq7E1aO/VJ9s+TI8Mm9El0D+H5hIfi/O/vpC9Wlf6cNziQpQvoksF3LvcMHVf8GWQi7mJGj2luKQeSf6s/dVHkxFRvJJZC06mjXir3FCC6vB1X9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106390; c=relaxed/simple;
	bh=qfZ9WuDmhDepa2vK5KEtX89x+O1mA2Bimk/JSjDaAvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXyI1U2l9qCTh+Q2YUm6CkYh/ZgnVaMpNRiSYif366tR7LedJhE8fa7azGdKIY93Aag0TcS44IBl0gS2hra+ZsZVtJjwsaHLzORYewr9D4SaV4aT71ZShjw5wUTxh+rXgaIcTQcJ/grRwe+3MnKT3znlGNr3Dr0QaITzsb+qrRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pFd+Qbzs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pFd+Qbzs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636121F000FF;
	Fri, 11 Sep 2026 05:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789106388;
	bh=DAvdHo4esE2paXOUsMYX5v6CWwX+C3Tqkkc/L9+ZG88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pFd+QbzsYxxGGCAKMQ2Zpg2SuM2apDZsSID3SM69JhDYu3P5INpCUePOI7silSfaW
	 85ZUgZR1q4xnL9GcDrZCVL7R984FNw/n6nrM7yE3Po4Te2xUy9iEBovLHVa1vhWhUo
	 ue0MGdReG6qB/TojzkN8mPbllM+Q1Uk52jPcSFcU=
Date: Fri, 11 Sep 2026 07:57:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, falemi@asu.edu,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: hid: fix off-by-one in SET_REPORT
 allocation
Message-ID: <2026091129-substance-carded-79c1@gregkh>
References: <CA+0ovCirfyOhrXdxmM3ri9-cShD0mzPptO1qtsaboS1xscaM0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+0ovCirfyOhrXdxmM3ri9-cShD0mzPptO1qtsaboS1xscaM0Q@mail.gmail.com>

On Thu, Sep 10, 2026 at 09:32:47PM +0000, Farhad Alemi wrote:
> gb_hid_set_report() sizes its request payload as sizeof(*request) + len -
> 1, but report[] in struct gb_hid_set_report_request is a flexible array
> member that sizeof() already excludes. The buffer is therefore one byte too
> small, so memcpy(request->report, buf, len) writes one byte past its end,
> which KASAN reports as a slab-out-of-bounds write. Drop the stray - 1 so
> the allocation covers the whole report.
> 
> Closes: https://lore.kernel.org/all/CA+0ovCgLrz4WhPKP5LGW5HZa8VOodgeo6pWuyQGgHE7UY57Oog@mail.gmail.com/
> Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>

Did you forget an Assisted-by: tag?

> ---
> The device was emulated.

emulated how?

thanks,

greg k-h
