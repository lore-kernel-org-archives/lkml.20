Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0D5497383
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856495; cv=none; b=CmLAGyAYY0mhaLsHOnXsguE5w3X4UZYapGfTtBCEoX/ELawgQRc1o2gFG8uwYixZPyAxMuMfFAI5ux6g1z12CQSrEczzI+E7DEaOrfQHWEsTLVOCRMOCrgd2z41M8bAFIKuD2KWjn2IYAALRqfp9D7HmFDuXQJ/2mVo1F8qp5NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856495; c=relaxed/simple;
	bh=Ww+o3uqoFw0FYm2o5bgbwp8hRac7JhYN27bZv7V+dJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jw5RBbuPYTMgb1tykvbIGgKvdlnFuBEy2C8vIXajtI8HumPInL5LxGuTjJCnnecOtmo79kWiwU2Ca8VIeU2UPqPUDlLmrKjdyEa7xUQPDUP6t5ANORD0Oet11mMXlVdEOsa4qF8ufA+nYICoAM5IGBv7RaCqnNwpRawvWFVB4wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Wg+PlKLJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Wg+PlKLJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA03B1F0089B;
	Thu,  1 Oct 2026 12:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790856486;
	bh=N4tPIKTui/UNe0sCph5xuwIv9Vdr8QPkDdwD/Ytw81k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wg+PlKLJS18q2yktDuJQLMRYi5FKT56nZxvFFe9NB/6vLI3o89vBQbT8sKryRrNpX
	 GXP948783jXcYeXebib6n4GUimRpS7GnvBRzM0S12C1HtQYp8aFe9V025cu8BL+M54
	 F7gwTqTK3pKB7H8fzU9Y9a/Aafsg8yLHrAP+/Tus=
Date: Thu, 1 Oct 2026 13:53:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Frank Haverkamp <haver@linux.ibm.com>,
	Bryan Tan <bryan-bt.tan@broadcom.com>,
	Vishnu Dasa <vishnu.dasa@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: fix typos in comments
Message-ID: <2026100130-uncombed-false-7d82@gregkh>
References: <20260904113843.21367-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904113843.21367-1-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 05:08:40PM +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/char/lp.c                       | 2 +-

This is not in drivers/misc :(

thanks,

greg k-h
