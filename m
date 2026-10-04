Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B422B2AD35;
	Sun,  4 Oct 2026 05:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791092104; cv=none; b=pOozSFy6dR5OymtW0aEF5ocV5TbDCoDjDvA7Nu7KjfCjEbL5YCBbwuAaZYvaNwbMXJjMcEs/pyzWBUxkR7w6Je/BaZtfP7tybUqoBrUIobxva9o2qKdmWOIdeIUGP9WZSAxiuCdAIOkmTLraFyH0cjluG5EveiagCcMgQGyASAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791092104; c=relaxed/simple;
	bh=H/DxV+CeQE64lUcPT1mVJOQ6FMlRpMLHEdedA1axUmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnq1Ojk671Ayp8JozU7bNTv6PiFF/Zpm56og4hk5rdQOi9CQj9lxfDlc0EnQVbWLwDVueeszTRxf+xu2GRONQ7KaIST5zucFd8DKkvCVc6bXju+AGcK6dwsG9p5zFPzsWVPXvk95RaVFaxG4IALBCfQo03JDYVoQOsZK2LpwAkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vJ5Sc9Ue; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vJ5Sc9Ue"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75651F000FF;
	Sun,  4 Oct 2026 05:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791092103;
	bh=oKX7skYzwFeeecXrd14xoPbFAO5qPbel9gVd4Z0IODY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vJ5Sc9UeElq+I+LzyrIaNlLRJr4Q5pKh01Y7VnPBy3jqsuWR9rtqDqWiVsD4/z/R2
	 2fexDtx8fleHJo7Oc7LZMWoJ/GOOOqdDh5PNnWZIoTqb9f4XIFhD0sefHdmy5tl5fk
	 6cEJnJG09dgWcDnCffC6uE2z6UmOX4Q74XJbeGYM=
Date: Sun, 4 Oct 2026 07:34:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Gowtham S Bhushan <gowtham398gs@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename dot118021x_UncstKey to
 dot118021x_uncst_key
Message-ID: <2026100430-disregard-thwarting-e172@gregkh>
References: <20261004031457.23174-1-gowtham398gs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004031457.23174-1-gowtham398gs@gmail.com>

On Sun, Oct 04, 2026 at 08:44:57AM +0530, Gowtham S Bhushan wrote:
> @@ -636,7 +637,9 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
>  
>  			} else { /* group key??? */
>  				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
> -					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
> +					memcpy(grpkey, param->u.crypt.key,
> +					       (param->u.crypt.key_len > 16 ? 16 :
> +						param->u.crypt.key_len));
>  
>  					psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
>  					if (param->u.crypt.key_len == 13)

This change did not have anything to do with the variable name change :(
