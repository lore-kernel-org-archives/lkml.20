Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D4B547071;
	Sun,  4 Oct 2026 05:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791092042; cv=none; b=fmdABv9IrNQbykXnVUiseckfwVXTO/FqSjphbqt+3I25IuotnYtGZgBr/FY9qjY3/iD3zztuY38Vww6mGSkIAsu6l0sazNWogOp6w0ekHPK9vYa1Ede7qhPlENHYGj05kWsYy++ZJQOxd0ucq25hb2Xs8Lrp32NpgYBPBokFpNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791092042; c=relaxed/simple;
	bh=GwLEVe1RrVwLs49+pK6BKIbY+Q1dpUzRv7oRx9QwLvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ai9cH2rAZCwd4tFg2r2VD1A+UXYNfj2WZQMqlMM/xtgRHLIMJ7MlpKviPxp3I8N2qQBpLc1IjpthLZiXevIcjsRZrUBAITwV1Tmxjwe3pxhWuqldbKPvEq0KFqf0JO4Q75HNxWYDmiUbVHqTLjCfnt6pEQi5360iMfWiS3e3jDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ynccKjLy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ynccKjLy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC8361F00893;
	Sun,  4 Oct 2026 05:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791092041;
	bh=PQigHBC+VVtsaMX7Wy82+NzmYLCdjBeeBnQzFsFmLc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ynccKjLy1OG5KBKSxMhdVrfwFuVHk5M3Kgp8rFTSK7Q+HRmZeCNFLzA3ZJHFWbgTd
	 195n1KwplUvOZ3lxw/rmCsQGMyrQt1JKaFCNHU9xy9Nqeq6JXy+U7EX+G+8xjJNr85
	 f5/+btRY1l7GGW7kh1Ce9CLQB8XEz4tYI4YfjcBU=
Date: Sun, 4 Oct 2026 07:33:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Gemini <google-gemini@google.com>
Subject: Re: [PATCH v3] staging: rtl8723bs: condense NDIS encryption status
 enum
Message-ID: <2026100434-empower-scary-3920@gregkh>
References: <20261004044516.277444-1-marinela.selseth@firmwaredesign.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004044516.277444-1-marinela.selseth@firmwaredesign.org>

On Sat, Oct 03, 2026 at 11:45:16PM -0500, Marinela Tatiana Selseth wrote:
> Address maintainer feedback regarding loose anonymous enum constants
> and redundant naming aliases. The legacy driver framework contained
> multiple duplicate definitions (such as mapping both WEPDisabled and
> EncryptionDisabled to identical tracking states) alongside several
> completely unreferenced, dead tracking properties.
> 
> Clean up this subsystem by defining an explicit, named enumeration
> layout 'enum ndis_802_11_encryption_status' inside wlan_bssdef.h.
> Consolidate redundant aliases down to singular, uniform variables,
> purge all unused legacy elements (KeyAbsent, NotSupported, and
> EncrypteionWAPI blocks), and convert all remaining active states
> over to standard uppercase snake_case conventions.
> 
> Update all internal software state assignments and state evaluation
> loops across the entire driver operational baseline to conform to the
> updated definitions, ensuring code tracking clarity while leaving
> hardware execution behaviors completely unaltered. Fix associated
> line length violations and remove redundant braces for single-statement
> conditions introduced by long macro names.
> 
> Assisted-by: Gemini <google-gemini@google.com>
> Signed-off-by: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c       |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     |  8 +--
>  .../staging/rtl8723bs/include/wlan_bssdef.h   | 19 ++----
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 58 ++++++++++---------
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
>  5 files changed, 41 insertions(+), 48 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
