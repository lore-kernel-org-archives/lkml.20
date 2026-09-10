Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D844E3B813F;
	Thu, 10 Sep 2026 12:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045001; cv=none; b=OKBQ7CZUzy0P7ntYQgTMeKN5p6jPx5KvoLfimlqeoun0yenKwUkXndPV56o2sCkwRWRrRzkL23NXYv6xkMwy+9lDfG9azb0pBNm4S1U6mK7EArJ1WOqfxLWK2Pjwjnl0sRSLD7QNoqMMydDmwzFtwNKTgxPEfLZk/24UVK6DR4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045001; c=relaxed/simple;
	bh=0ffkRHgfVc20UEzyJmCQECyMqcjK7YFiNEgWRJC43N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzFcvDLFGE+Npyxmhc+FOjeB8J72zVX0UVbb5yaZ1U1oBCNB2F20FaHnagx1erNraWYYQAvZeFtjM/5bWy/N7WHlc/nfpyglbcCUHf/U+F6PPrliin2S4uMduh4+wSTHdJsfIsj+o5fxCnCqCQIzK5kXD0Qi/o7EJcFk0u+l6z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mji4jNZ/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mji4jNZ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755C71F000FF;
	Thu, 10 Sep 2026 12:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789045000;
	bh=0ffkRHgfVc20UEzyJmCQECyMqcjK7YFiNEgWRJC43N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mji4jNZ/cu7xwVotUPl4o6vDM0xIjLn94Xymv3B+uLCdUZaVjmfAJyZ9BIFnBksNo
	 0OcnnbBEwdfBglnOORZByy3V/iYuBDk9hvayvwq4Wokkblppca5s3SF4TNlyQ8qQil
	 xQ2pJ67qh+3j3D45ndkxrxrM7BiB9fdlwPFswsOZwrwt528ZtE2QUyUM4+282s3Qtd
	 Qjqb8w/duOZ95oxOjdBU8ABnPS61FbFST3GnDzGCCHRNRCc0UHenQed5ILWoM0NlzZ
	 mbzccAc0Fkcdcg8GUUyNe1nmNRWHx64RoTAw26GCwe2q8lgusyisp4BUWqcd8hGiM5
	 BqAYvQIJJpzqw==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1x4eKU-00000002gqG-1H9H;
	Thu, 10 Sep 2026 14:56:38 +0200
Date: Thu, 10 Sep 2026 14:56:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	FangpingFP.Cheng@moxa.com, Epson.Chiang@moxa.com,
	EddieSY.Lin@moxa.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] USB: serial: mxuport: add MUX50U support and
 updates
Message-ID: <aqKpBqAYm7HKg20H@hovoldconsulting.com>
References: <20260811060501.2307836-1-crescentcy.hsieh@moxa.com>
 <aqId-z4u65j7Szqi@moxa-ThinkCentre-M90t>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqId-z4u65j7Szqi@moxa-ThinkCentre-M90t>

On Thu, Sep 10, 2026 at 11:03:23AM +0800, Crescent Hsieh wrote:

> Just a gentle ping on this series. Any comments would be appreciated.

It's only been a bit more than a week since the merge window opened.
This one is still in my queue.

Johan
