Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C9F3B2FCA;
	Thu,  3 Sep 2026 08:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424336; cv=none; b=LJ6Y1F5+5p1w6dw5qs1lh0WAIBjPmOX2odc1/fDFclBZqjcciN6aiL3w9MtTLAcDykxZ/4rT4mnVkZwksLPFyq8fLVNhhYwLOx0g1nPoMHd2/3r7E9IiVC9WPx805T/cNNG8oEQZqE0jOUstnBcXmCDMDfSmhMI3Im1yRiheTaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424336; c=relaxed/simple;
	bh=Q8KlTWF3C17uKxZalEKB1p5ZU4H5EjYB+j+PMRX7tJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOTE9mkx+0nwcKTfIC6+KGLdkg0H1H1l7QWAd8mRBgBSF93iPqk6YNMFk5kGTVGn28ZnD1aj8jLD424nisckvDtmkro2/zutS+0I/Lnvrl81GwnTtwc5unKDR+ZNoSt3HkFHY/RKzOJiGLxmWIK1D+Um7udvA50oSjJEvFP/Rsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HRh8J7Th; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HRh8J7Th"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4856E1F000E9;
	Thu,  3 Sep 2026 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788424334;
	bh=Q8KlTWF3C17uKxZalEKB1p5ZU4H5EjYB+j+PMRX7tJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HRh8J7ThutgFWsNxqOjDKsIdAUe3jLuRCj5RtTwL9fazKHAbh16lJzOnAOIjLEvGI
	 NIyPRsSnIkNskRykF5Kr4e+0vjjEVh1A8dOSIs9AzNSaG8sft8coWfe3YdMySrADR7
	 1F/RrcrUeKovpBcx2lf23tZ1zBRdyEowkAYQKX9Y=
Date: Thu, 3 Sep 2026 10:32:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 0/2] staging: rtl8723bs: Changing two struct members
Message-ID: <2026090349-simplify-snowsuit-43cb@gregkh>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
 <20260902150542.2746-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902150542.2746-1-fliegbert2@gmail.com>

On Wed, Sep 02, 2026 at 03:05:40PM +0000, Dalvin-Ehinoma Noah Aiguobas wrote:
> This patch changes two members of the struct adapter.
> Two additional patches ar made to fix some checkpatch warnings.

There are only 2 patches in this whole series, but you mention 3 total
here?

confused,

greg k-h
