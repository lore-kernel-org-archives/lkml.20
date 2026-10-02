Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5C23E40E0;
	Fri,  2 Oct 2026 06:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921383; cv=none; b=alhyleQXBpJKbBE3DUu5OZNRlld52ZLdCl+vXoqDsto/R3TY82V3peqJIb061gNvGuf6B/FI86sp+bxhWmBq0jvZHsxhwlhywSNkLXdesbxPv37rUOqru7kRXs5M3pd1IW/YcQfIt/Mh9v/CD0fDgDHsfnrQxYY7rt1NxbeRsk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921383; c=relaxed/simple;
	bh=G8TJCO/fD4M7WoQnUVeq8qp3uNpt4LscgBPnx+GpZuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGj5YHvwwXaHA7OzsCQjq7l4D8+mNOYSEGg7U/48xHDN4uRZ6p0gNTMB8kmPTzsd9Q+IRnujATSLf9TEymqoNRGykG+Gsz42Pqf2qIU6rL5kQQccgtSqXGbLQHVhJeufxtCWt/Q7063lnp9yTCv16BhR9CsOPO7XQzI2mO804j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h0Wn8VF7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h0Wn8VF7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5602A1F000FF;
	Fri,  2 Oct 2026 06:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790921374;
	bh=QMKTYk/hj0PeeGrqLGSe1AjdtJDgHAFvazp3zKpMnoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h0Wn8VF7P7le8CyqYbfA4DeFd537EjYa9Ojsqm7cme9AgaYuyXksNf0P3hVHFom6V
	 b00anEcJy8BuyQGTs3pjqEzhYaQTJbVEmqSSOuBGHE3g7NZaCXGguAVC7ob/OfL+px
	 HRSJNxeSY8ujOCrbSbmR02PyDCAx0WnU/8Sd23aY=
Date: Fri, 2 Oct 2026 08:09:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: rename local vars in
 phy_tx_power_limit_to_index()
Message-ID: <2026100258-probing-reactive-1191@gregkh>
References: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
 <20261002-rtl8723bs-tx-pwr-limit-v2-1-48b180fb6f7f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-rtl8723bs-tx-pwr-limit-v2-1-48b180fb6f7f@gmail.com>

On Fri, Oct 02, 2026 at 01:07:35AM -0300, Leonardo Martins Martins wrote:
> In phy_tx_power_limit_to_index(), there are many mixed-case local
> variables, rename them to adhere to the linux kernel coding style.
> 
> Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
> ---
> Renamed Variables:
> 	pHalData -> hal_data
> 	Adapter -> adapter
> 	BW40PwrBasedBm2_4G -> pwr_base

"power_base"?

> 	rateSection -> rs

What's wrong with "rate_selection"?  We have lots of characters you can
use :)

> 	tempValue -> tmp
> 	tempPwrLmt -> tmp_pwr_lmt
> 	rfPath -> path

Why isn't this in the changelog text?

thanks,

greg k-h
