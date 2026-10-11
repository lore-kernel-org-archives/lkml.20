Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FCC44AB78;
	Sun, 11 Oct 2026 13:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791725995; cv=none; b=i/CyXUgEZZh/2SIwpfsNw40Ka4XaikNkY304f9GDWPkRB1O1b8cpkJoJanNGEUXrxrcJHG9xQV9miUYf/0BX0upUif8XuRYwAb67ryexN2iEVq57830Y4RzkRkc6XtwMfN4zQtD7lBPEAjZB9eJ9dC+ppSo8QNCtJL+6OURufWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791725995; c=relaxed/simple;
	bh=n3GewQUbyzy70ku/fUJDA5nq+aSK12ua4w2Gkizpi/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y64QiA57bjtfj83Pm2biDlTMFiamBd5oaOo+izbCtfGV4P7yQa+L6iJFIVXe5wC9mbcts/plKJsBhLeIeKjIjvh4jVyfxi53lRUzVJP8zY0hydbqHxqAMxfEX4xCkOCm+OMgjLb/NrOAYgpquhp7QNyQ+MALa3MxbJsQ2LnWjgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iUoiQEk3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iUoiQEk3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E90F1F0089B;
	Sun, 11 Oct 2026 13:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791725992;
	bh=mQoN1loBfD9Etgy5hhu4dhWkhi7iIx0sHjGmF1Gq0k4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iUoiQEk36OYPeEo7VcAgZHsoirOTrbKrGQ8C2JIh/FDLbiTwWG9bS5ELr02swILxF
	 XxnrymXJG1D2JrkchcFDO+hDXHqT6iLaPkwcH8kYIgtggP4sPLBPHHybbvtUEaDZ8q
	 paWzuVxzvPGvHX6JtYte78Ne0BoU0W9gcfa2Pz7I=
Date: Sun, 11 Oct 2026 15:39:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: hanzhijian <hanzhijian1991@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: octeon-hcd: fix kernel-doc comments
Message-ID: <2026101128-earphone-shame-d4a4@gregkh>
References: <20260821173455.2219619-1-hanzhijian1991@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821173455.2219619-1-hanzhijian1991@gmail.com>

On Sat, Aug 22, 2026 at 01:34:55AM +0800, hanzhijian wrote:
> The file has 31 comments that start with "/**" but are not valid
> kernel-doc comments because they lack the "function_name() -" summary
> line.  scripts/kernel-doc reports "isn't a kernel-doc comment" for each
> of them, and they are silently dropped from the generated kernel
> documentation.
> 
> Add the missing function and enum name lines, and document the values
> of enum cvmx_usb_stage, so all these comments become valid kernel-doc
> and are included in the generated documentation.
> 
> Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>

Full name please.

thanks,

greg k-h
