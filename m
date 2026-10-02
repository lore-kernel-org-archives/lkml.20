Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3463A3E91;
	Fri,  2 Oct 2026 06:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921241; cv=none; b=l+n1aQlzk+FZJH/sVSuha+CcVSNDB7ol3vcAaYJYQWNYAcHz255hzSOp7lPMBuHOX7h9ZMd1tIe0/bOEMrqEzzpXy++oIMjUY1LV9Azdf7vstDEni2EXxHR8pP/TYe3whFEk2GOYBJ8WpoTXBtM73/Pp6d82wUfPZQqw6tzHb3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921241; c=relaxed/simple;
	bh=lLK7aoSY4Sg293LeirqbeeI6HcvoPtTDYLEOeZxTmVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+1g2NMmJ+GlgJlY8hpE/ALWN8nNI/rCbBIbNzyJRhBfsQu6JAYB13eRWd3JFYgCXvdkLr7VH/tdzLeFEEzp0elgPHekPkV8O6gQ9gr991gBkh9zSWMBLm4cMwlfN+RQmu+hmy4oEve4txQV4vafFECaflJu5aLJLw2f8p8Lfyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DLjRL8Os; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DLjRL8Os"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE241F00893;
	Fri,  2 Oct 2026 06:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790921240;
	bh=FyueHlKkgazAkeMMfoMDxJ6I+tVomyUGJb34b0srFmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DLjRL8OsXgBt+7fEQV+BNmBt5CeGZNpNTHM39JQdkOuis3J30++dvPX10KyMnX15h
	 khR69QrNXwUsV9qH7Xi9fOrSyFvtp+7VkF+hDEft6GIWBSyPLzztebWRxmtfSVeQaX
	 9UWock6/JguLjGZ1m4MSENvNow+fAI6c+U3NASNk=
Date: Fri, 2 Oct 2026 08:07:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Rename CamelCase NDIS encryption
 state enums
Message-ID: <2026100244-uncrushed-railcar-be19@gregkh>
References: <20261001194710.144114-1-marinela.selseth@firmwaredesign.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001194710.144114-1-marinela.selseth@firmwaredesign.org>

On Thu, Oct 01, 2026 at 02:47:10PM -0500, Marinela Tatiana Selseth wrote:
> The identifiers Ndis802_11WEPDisabled and Ndis802_11EncryptionDisabled
> violate the Linux kernel coding style guideline regarding naming
> conventions. Uppercase snake_case is preferred for enum constants.
> 
> Rename both constants to NDIS_802_11_WEP_DISABLED and
> NDIS_802_11_ENCRYPTION_DISABLED across the driver framework to conform
> to standard kernel conventions.

Why just these 2?

And shouldn't these be using the in-kernel NDIS values instead of
redefining them?  They seem to be just using random numbers, as the enum
isn't specified.  Or is this just a state value and doesn't reflect
anything actually sent to the device or network stack?

thanks,

greg k-h
