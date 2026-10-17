Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF0A4315A;
	Sat, 17 Oct 2026 08:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225716; cv=none; b=iYRaLJaL0JZ2DUCPvjIFZjPG0SxRwdwY0GUMwJW5wrjdbyvfb9eZrZikjf69FkJVoKwOO1Xhxa7zfGDF6MuLAcGLgUQ9ss5lwTxlkgFk4v+iFTJx/xJg+jT8hn4+K8MZ6dGluRNUDd5DPydZdKPo0a2SlihvsD6v18qh5p1oBok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225716; c=relaxed/simple;
	bh=npP5We5Sc+6PQqtL35FwW6878E//ky/qrizCpt6+1+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CM51qtQKS3qpgFwumaSBaNDqv2VlHKDUu6PvjkA57Tsg9ZM3krwthmfgh4IAmsd0R4FhHK4IkuPmdgIL50YuBBDlHfGjKMXEojePPwdR/zbDpBiukPPkloUkvXVyhYl7x8BKktiAGnzyy3l5cEBkyvPmyQODuGy2iSBiFb13nN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDUx/hVx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDUx/hVx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234591F000C4;
	Sat, 17 Oct 2026 08:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792225715;
	bh=LwLorPSe724HZx+5PJ864MJ8jlDMnLPHctQKpfCPoa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VDUx/hVxdSjOIR7qydzxjWh0teC10+hxzqyXK66CwIQXjgum5li7V4QCrhU9tZaRd
	 yjXUu8mt1NmpRXtm792rZ+K0OJ0rOFip1pTFDBDJyXuSU+6CFilDoH9Ghu7zU5wBov
	 6HAkpTTMWSjHyOYBCLg8UmJV135l0qOv0xyOoETkWhj4xCceoH/WE3I/xzbL82ZF8n
	 Qiv4GNVSsT68Uy8BDzHygFK9tZH1FNgpAQybYwqBJ6s7PtEeweadeZHZ5195LRFKDC
	 QkONjyMgE970BT0eptPJ/XBT7v/6OTb2zCdEz9/k/FF1aFVRzv0vh6uEhGjayjdz53
	 1lH8FIz/jyXjw==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xHzmK-00000007El0-365P;
	Sat, 17 Oct 2026 10:28:32 +0200
Date: Sat, 17 Oct 2026 10:28:32 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: core: document purpose of interface parent reference
Message-ID: <atMxsLDLjo9rVjs7@hovoldconsulting.com>
References: <20261015074831.1418677-1-johan@kernel.org>
 <DM6K85ZAWSUG.VCF8TRYUDHJ0@kernel.org>
 <2026101759-charger-elite-39fb@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026101759-charger-elite-39fb@gregkh>

On Sat, Oct 17, 2026 at 10:18:08AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 16, 2026 at 10:54:17PM +0200, Danilo Krummrich wrote:
> > On Thu Oct 15, 2026 at 9:48 AM CEST, Johan Hovold wrote:
> > > See commits:
> > >
> > >   524134d42231 ("USB: don't cancel queued resets when unbinding drivers")
> > >   af61396a992b ("driver core: fix parent lock use-after-free on USB disconnect")
> > >
> > > for further details.
> > 
> > The last one is now 0f554506a3fc ("driver core: fix parent lock use-after-free
> > on USB disconnect"), and queued for a -fixes PR mid merge window.
> > 
> > Greg, please let me know if you want me to include this one, or if you will take
> > it after -rc1 ist out.
> 
> I just grabbed it now, thanks.

I should have waited a bit with posting this one.

The commit id mentioned in the commit message above was changed when the
driver core commit was moved from driver-core-testing to the
driver-core-linus branch. I guess we can always find it via the patch
link (or commit summary).

Johan
