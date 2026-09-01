Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19481472060;
	Tue,  1 Sep 2026 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257421; cv=none; b=uq07sppuBnhUichS+XmG6vJ1bbieH1swLciwn59TlB4JEp8FL8ZYDiiBtoFSQImS2UbeZCC3596fMnNapj7fZCSs9FMV6wdGBKUHQYUMf6EHJsuLztckwH2Z9ctypLNvn0Hycj35fLTs7H+ysWJaKCq+NUz+++4DJZ7jyNiA3wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257421; c=relaxed/simple;
	bh=BWCF9QSTJMzo9A9eXSJARZ1oQzdlhmFV0WPucQkAGfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0VK0MNJTNvzx2DDkRKTeP7H4j7T/k3/EYGlfZBabOmMU+JM6fhp6fVuXxcADEKUyYkhVSOqc3tyzHDF5Nei8QZe2sW7H3xq70z7KQRWVwtwb4PSPrYpIoLhtFiMG/2uFa/9/pfre+OPMGkc3L4shKfjSrbA8zSlGVF5NHqxi1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tCEyzJZU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tCEyzJZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D26A1F000E9;
	Tue,  1 Sep 2026 10:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788257419;
	bh=nX8JLnIiJ++V7L4jNzuu4BSGqmktna7dYgKbCpet+QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tCEyzJZUAvqhfJJjo7IpphdHafRXaViFVSQ0/A63K+j9ZNAciXVqzE7l28XkogrDB
	 LXq5wXwnG4wlkLSH4eGNMOl7WaczHttad2Lz40FKOXaMTIMjUjIMQ7NrED7YEk34+t
	 hNjzfF7ctqN6V2sWSg6pqWrq4lBRy/ESonge/Sx4=
Date: Tue, 1 Sep 2026 12:10:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hank Yang <s950343@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename CamelCase variables in
 rtw_mlme.c
Message-ID: <2026090159-snowy-worrier-2974@gregkh>
References: <20260817152947.53607-1-s950343@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817152947.53607-1-s950343@gmail.com>

On Mon, Aug 17, 2026 at 11:29:47PM +0800, Hank Yang wrote:
> Rename several CamelCase variables to snake_case to comply with
> kernel coding style, as flagged by checkpatch.pl:
>   CHECK: Avoid CamelCase: <iEntry>
>   CHECK: Avoid CamelCase: <backupPMKIDList>
>   CHECK: Avoid CamelCase: <backupPMKIDIndex>
>   CHECK: Avoid CamelCase: <backupTKIPCountermeasure>
>   CHECK: Avoid CamelCase: <backupTKIPcountermeasure_time>
>   CHECK: Avoid CamelCase: <bHwLDPCSupport>
>   CHECK: Avoid CamelCase: <bHwSTBCSupport>
>   CHECK: Avoid CamelCase: <bHwSupportBeamformer>
>   CHECK: Avoid CamelCase: <bHwSupportBeamformee>
> 
> Signed-off-by: Hank Yang <s950343@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 64 +++++++++++------------

Does not apply to the staging-testing branch, can you rebase and resend?

thanks,

greg k-h
