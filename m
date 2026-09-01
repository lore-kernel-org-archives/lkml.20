Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F159E4CCDF1;
	Tue,  1 Sep 2026 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256127; cv=none; b=ePxxEZAKq24Vt86C7eQo8u2Elo6MaMGZcFP9Uy6CDoVhy9G2zUACkTkE/QiAxTtn3T2ZiWa95nkOO62MttCkFbt24tnCdApeIUac3EntzaaeyE7/1jbsrqpnRhCyuadqBSb56WiUjf49dKwxjOiD2t2Al4xp/1cXo5L1ePIhJiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256127; c=relaxed/simple;
	bh=F+j0s4iJmLFySdaMeQkw1zbg7flj2RIcHNI1zcd5Xc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMe8kPIGon1QOHQnsUuF09nCgMjU/M+rpCqbmsmWG/KBbiJ7uHkSuQt5ASgrtjMaQzxutEkPOr3yT/J6gBjrImcAU874sAbYhRvACdx3ZoR+WzXmWio9WEvBZiPl9GhPimax5kUJMNL3av2YhJy88yqje6XG7ziyJxKgBuFHLRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0yg6hbVJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0yg6hbVJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F6B1F00A3D;
	Tue,  1 Sep 2026 09:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788256124;
	bh=fwsfZlvbFu3oLiO0T6cO6r4e51+Rgi0BWcgcf5/KuAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0yg6hbVJroJbi+vj1hHQ/cHO3cqCGtD8kJwTC9w22c3Ao1E8iB0/d1euWk9SJn/jI
	 Ep8AJnz0EVhF6A+XQ3XQTOK7guBjHCvtYae5TDc/0cGM6FWJzmFAaKdWSuhRpakXKh
	 T4pgFgvLKNJ5ilrOWQNch//87F/3/7+3FR0ZefCY=
Date: Tue, 1 Sep 2026 11:48:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Luka Miletic <mileticluka2001@gmail.com>
Cc: Dang Vu Duc Hien <dvdh12707@gmail.com>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: use usleep_range() instead of
 msleep()
Message-ID: <2026090124-bunny-bronzing-15d4@gregkh>
References: <20260822205427.74562-1-mileticluka2001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822205427.74562-1-mileticluka2001@gmail.com>

On Sat, Aug 22, 2026 at 11:54:26PM +0300, Luka Miletic wrote:
> Use usleep_range() instead of msleep() to fix checkpatch warnings.
> Verified both loops exit on their own condition, independent of
> sleep duration, so this only changes timing precision, not behavior.
> 
> Signed-off-by: Luka Miletic <mileticluka2001@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index c15056ee2..8b793680f 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -986,7 +986,7 @@ void rtw_dev_unload(struct adapter *padapter)
>  			if (cnt > 5)
>  				break;
>  			cnt++;
> -			msleep(10);
> +			usleep_range(10000, 20000);

Please see the mailing list archives for why we can't take this change.

sorry,

greg k-h
