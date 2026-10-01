Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CEF49DBB2;
	Thu,  1 Oct 2026 09:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847087; cv=none; b=tUtQ8c1NbVai1Xypc1d87nHRpf1IcMVOMoCmuZQEnVjVg/qjEK5QjwsShJjKqJOulQeLwsyZLtixNIvEILPHDGR/pApt/Nh1epyS6IYpus/W5+ppiJ9u0lmpkcIdukvbQ+imb0T7PiUpyc39b053auPh+AltccxZhbyT+ykvdIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847087; c=relaxed/simple;
	bh=65lL1wYWIwDlyxGA97ycGUuAvhjTeM2gb40albS9xUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnMNBa9Y7c3XNdtHO8hLUX7SVpgBens++FWfkPasKDlOFsjBefLMzVNq7CcSZxaRwXIvuM95YnflZkBztwI9FhC/EVDO9Is/4zOEaZpxlO9wy25eRgSBbMeWlVQhCVM7ohPGMofsWcRDWTqV0tpgi81Bz6F2tpO/ONMjUNptWIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FiQx4rE7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FiQx4rE7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708BF1F000FF;
	Thu,  1 Oct 2026 09:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790847086;
	bh=GXPAsgEv8IZmJBRFR5+xiqNkMdKB+SzUTnDc0SBcdqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FiQx4rE7AHIJEG/AJRfJH33u4tOaFJpU5m1hDQfZLlbIj+24ilXrIVTWgFVfmZo3E
	 8xbaKI+ATvP9PYMKq1gUgEWd2PSW6Eqs5XtxCPUoefonO7hNUypj4wRvhaW9IUrjS2
	 DSyztJ+oqi/71sCwfxDaPTYpEp5bwMZ9r7TETk0E=
Date: Thu, 1 Oct 2026 11:31:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] staging: rtl8723bs: rename local vars in
 phy_tx_power_limit_to_index()
Message-ID: <2026100140-pagan-dry-5dd4@gregkh>
References: <20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com>
 <20260926-rtl8723bs-tx-pwr-limit-v1-2-989dcbc113fd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-rtl8723bs-tx-pwr-limit-v1-2-989dcbc113fd@gmail.com>

On Sat, Sep 26, 2026 at 10:12:25PM -0300, Leonardo Martins Martins wrote:
> In phy_tx_power_limit_to_index(), there are many mixed-case names and
> needlessly verbose names (such as the iterators, in other realtek
> drivers they are shortened like in this patch, by renaming them,
> accessing the TxPwrLimit_2_4G table takes less space), rename them.
> 
> Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
> ---
> Renamed Variables:
> 	pHalData -> hal_data
> 	Adapter -> adapter
> 	BW40PwrBasedBm2_4G -> pwr_base
> 	regulation -> reg

This is ok, as is:

> 	channel -> ch

and there is nothing wrong with "channel", please keep both of these.

thanks,

greg k-h
