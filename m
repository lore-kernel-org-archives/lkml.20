Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0813BB9F1;
	Sun, 20 Sep 2026 15:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789918628; cv=none; b=RVt7aH972WuNhQW9hXndzSZHTCI0r/VKbQKlTP7w/kV44xoQU/ylEN90z8SNCpV/uo+fB1ADI7/M+u8Sd3UPwsli8gyz6kMJRGIlROd6EbJaBW1SdGZ8Q7zzdReQ31glC+wpanlMxnMgXwrv0mV/TrYjHeHEh3ikDsB2jn0si3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789918628; c=relaxed/simple;
	bh=VidfwaPFsSyks/+pYY13Z5vs/IgiVMGodw2BX35Ux8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wk1Q/AUICkhqws7W/UAiViczpsNE9XWScTOIleqgSEz6p6Y97gv6ThNFvivZGqKrSq368XHxuRb6P1wKRuRoXkCxkCo43aHOjVPsLCzlgSZ4TceRuXgB8nx5MqmSbU+M+6kvIMONgrBm6VsHefcZovadoOuGK1Y4UGao8DX6uwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D7PL89rC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D7PL89rC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B181F000FF;
	Sun, 20 Sep 2026 15:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789918626;
	bh=VidfwaPFsSyks/+pYY13Z5vs/IgiVMGodw2BX35Ux8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D7PL89rCzc/JQw51mB6JT68Q2gDREZuNbcPqLNt+S+IEThhZld+tevxnLbjbf1k8x
	 XtDSn1ekPOelKmJVYebatGrQ9QvGgUKEAftbKflziK+Qe8ue96H0KAjtct7/pvqrf+
	 4dwR4HZCxCxr2D2XMHrVAmUdSUO7HPVBa1DmbU6M=
Date: Sun, 20 Sep 2026 17:37:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Adi Prasan <itsadi2409@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: fix ie_length bound check in
 rtw_cfg80211_inform_bss
Message-ID: <2026092053-rentable-affair-bfce@gregkh>
References: <20260920142849.294162-1-itsadi2409@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920142849.294162-1-itsadi2409@gmail.com>

On Sun, Sep 20, 2026 at 02:28:49PM +0000, Adi Prasan wrote:
> The buffer bound check in rtw_cfg80211_inform_bss() only verifies
> that bssinf_len (ie_length + header size) does not exceed
> MAX_BSSINFO_LEN (1000 bytes), but network.ies[] is only MAX_IE_SZ
> (768) bytes. This allows ie_length values up to ~976 bytes to pass
> the check while a subsequent memcpy() from network.ies still reads
> only 768 valid bytes, and other paths that write to network.ies
> consistently cap ie_length to MAX_IE_SZ.

How was this found and tested?

thanks,

greg k-h
