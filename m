Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4114FC8F2;
	Tue, 13 Oct 2026 13:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898807; cv=none; b=YmTon/8Sc8h6i/hi0LBZGryNMu9xE+kek9P6D7F0FMNkynJVdEIC7JPCglqfPgD8Mf6L4wQfVRo/CGrLmhHFPDg48hgm7x6D+Mm+1PKRa9XandMv76gIR+JkUEeqQ7lTGLCV3vR5WQvyymdH/7jlqyDn8WuhxTKWbMH5OmqHGwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898807; c=relaxed/simple;
	bh=hC+eyAEMPXXoicjSQkdOeiy1O4LGS7ArBIrqHRRTx7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3NTZjPgalnKFPVkcF1NKU77Z5rJJIt6NOvUfw8ntFUjg2RCVNBnkFLO+eQj1socjZ5CtJmr9mnc/sAZL1DNzyYCVqUdw/KqdMfLlNDDr+4IeGuiL0xYdVwXA/o+99Y4jzU0bCsWIZvSzfvlnWxu0iveAs8IjmcxonAIng7HzDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=duqsNo04; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="duqsNo04"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1641F000FF;
	Tue, 13 Oct 2026 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791898806;
	bh=ttDcRRb3pf8u4Sh3G6WqJ+Y13cq57a+ii+C6ISaLZXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=duqsNo04NydNxSn7CFniOCfifDuYS5qsWrB+YTmDvIsmisVXOANYdw8tKfM/4EqSW
	 6Ep8Ln2q+3cb5s1/euU7y7+bmPu/JWuDfnmUe0GS3cGXXbG6OTrvDerJoi/sIZK/xR
	 0GPT9P6SYeNRQh3tXXqqDp6Co4dXSX2b/7VcnPEc=
Date: Tue, 13 Oct 2026 15:40:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tianbo Fu <3064575448@qq.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: remove unnecessary parentheses
Message-ID: <2026101355-ocelot-buckwheat-94af@gregkh>
References: <tencent_41FEF4B2AA27128459C679783AD4D039F207@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_41FEF4B2AA27128459C679783AD4D039F207@qq.com>

On Sat, Oct 03, 2026 at 04:51:29AM +0800, Tianbo Fu wrote:
> checkpatch.pl reports multiple CHECKs for unnecessary parentheses
> around single conditions. Remove them to improve readability.
> 
> No functional change.
> 
> Signed-off-by: Tianbo Fu <3064575448@qq.com>
> ---
> Hi Greg,
> 
> I removed some unnecessary parentheses and compiled this on my
> x86_64 computer successfully. Please let me know if anything
> needs fixing.

Please see the archives for why I keep rejecting this type of change.

thanks,

greg k-h
