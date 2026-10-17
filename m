Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A099340F720;
	Sat, 17 Oct 2026 08:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225094; cv=none; b=qgQDPbxqNQ1hWsJGXtlOeGWYsT9zmA2AJY4KU7cNka0cUAFPT2PH+lYNVJPFaJNLhwFEpK64Qe1uqUbpcm+d/MvYjl6Cx1iVebHigyi9st0Z/c0zeDIQYNOGlWih6kz1A7wSn0vG1q7EWbLVrBaosShs51nCw++q3xSsQDhM4hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225094; c=relaxed/simple;
	bh=M/51o1zweqT5WJBM2Ppa5X6TXNPsAStYlp3kcfvnzFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cu+Ifn5ydkUN39jIlEpcNqeMshQValJJntRg2Ybn6jywZVdcaSuPbvKCfonyxfE5Q4DJ06J45SMNC+08MiQCDvdvCVi+aZOen/dU5Psm5bYPCVWusAYs5Y0iH9bHDgPIcCqxWeI0n6M/CETcZKWNNDc81csDtR0ZKjzw4i5hrkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dPwDJuax; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dPwDJuax"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618F61F000C4;
	Sat, 17 Oct 2026 08:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792225092;
	bh=UCbJcsLbS4TEKsEgAHlfHKo8QwTST/TnasGfxkninjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dPwDJuaxBJ6bJzL4LdG+GNIrG2aDQMNcfAgdokZMIiQDUrKReMmyg4q6/0V0EVcNl
	 PPO/t+r88y7YbMp/eLp3djWmShIuEaqqZBB+Ql+wOrJPRKkPvvpC836xjz1hyXpATu
	 3nM8JWkITbXU5qAO2w7Yhboe4pydQv/b1NxDc1mM=
Date: Sat, 17 Oct 2026 10:18:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: core: document purpose of interface parent reference
Message-ID: <2026101759-charger-elite-39fb@gregkh>
References: <20261015074831.1418677-1-johan@kernel.org>
 <DM6K85ZAWSUG.VCF8TRYUDHJ0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6K85ZAWSUG.VCF8TRYUDHJ0@kernel.org>

On Fri, Oct 16, 2026 at 10:54:17PM +0200, Danilo Krummrich wrote:
> On Thu Oct 15, 2026 at 9:48 AM CEST, Johan Hovold wrote:
> > See commits:
> >
> >   524134d42231 ("USB: don't cancel queued resets when unbinding drivers")
> >   af61396a992b ("driver core: fix parent lock use-after-free on USB disconnect")
> >
> > for further details.
> 
> The last one is now 0f554506a3fc ("driver core: fix parent lock use-after-free
> on USB disconnect"), and queued for a -fixes PR mid merge window.
> 
> Greg, please let me know if you want me to include this one, or if you will take
> it after -rc1 ist out.

I just grabbed it now, thanks.

greg k-h
