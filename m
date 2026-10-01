Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C12536E468;
	Thu,  1 Oct 2026 05:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832987; cv=none; b=LWWRp1IrRWApqcFMfiJ0k6f3A6aW/ER/PcrjzYf6gTzSjzDAqsjL0+VVCUzYSY3WQLaq5AK3XSQD+Ja0g7TcsCIkCK0urE8QzFwrECpqYHfpZMQNL4iENSmGZM3HDmdeUFDgjBCFibicGwyU75MsEnQStAXZyQXiUI6ScF2k7KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832987; c=relaxed/simple;
	bh=qKwI9Kshf1ybQ2X2CNtp6K5Xj8njpOqEjZpvhvw83hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPWA4HkwHie6EQpCxNW80zIW8zNTQGlDQbwwSLmV25Bryug4RSrN4t+02z5eKWYYRh2BHRnAbXPQHv4fwUjhbCUeOSCjEoeTMjQJYvYE4/6nQSb7RuYTTVd4OfD0+DXbFJjk1JAcCNc6BtQeLJa0/86AA75VK0jYyZLIEsn1qC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eEOpR/ah; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eEOpR/ah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192FC1F00898;
	Thu,  1 Oct 2026 05:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790832985;
	bh=MdjbezUf64HYf0RaE1hWKpAx7HR3PMPbz707UTcnqK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eEOpR/ahZEiF7FwsGtdJQSCRId7Q6qCK5QDWa/O3YBlPS81QDWe3Srvb2cr2PNGOs
	 hlwTHN7vPVBmdL0UEqehPMVCOtGVykSfqtZr1auIO1tTkCzwyMOd41Kcwr5kjz5Xf9
	 nBcnL0tT5iBJfzCMkpdgnCG8neoDoLQWSf1Q5xME=
Date: Thu, 1 Oct 2026 07:36:19 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: William Hutton <TheWilliamHutton@outlook.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix checkpatch whitespace and
 indentation errors
Message-ID: <2026100158-cranial-net-4aba@gregkh>
References: <MA4P292MB014947C54E25163A32A627F9C2AF2@MA4P292MB0149.ESPP292.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA4P292MB014947C54E25163A32A627F9C2AF2@MA4P292MB0149.ESPP292.PROD.OUTLOOK.COM>

On Tue, Aug 25, 2026 at 09:55:18PM +0000, William Hutton wrote:
> Hi Greg,
> This patch fixes checkpatch whitespace and indentation errors in the rtl8723bs staging driver.
> Thank you,
> William Hutton
> 

> From ac17f2cf6f9f0dea36c10f0e039d01f5b48aa31b Mon Sep 17 00:00:00 2001
> From: William Hutton <TheWilliamHutton@outlook.com>
> Date: Tue, 25 Aug 2026 22:37:02 +0100
> Subject: [PATCH] staging: rtl8723bs: fix checkpatch whitespace and indentation
>  errors
> 
> Signed-off-by: William Hutton <TheWilliamHutton@outlook.com>
> ---
>  rtl8723b_hal_init.c | 2825 +++++++++++++++++++++++++++++++++++++++++++

Something went really wrong with your patch, please read the tutorial on
how to create a kernel patch again.

thanks,

greg k-h
