Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2482EEE80
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787810700; cv=none; b=jnEcXe6thtSGB6HWwq1PgOsf7EhyAS1XNh2h6AicNpJuuL/uRAKRxrdjYvDr2IczZ/mZtabmtNIDoQ2UOWgw4pk2JfFiNpY2EwX6jVr3Xsy2f/YN7TgPgwiVh+ln+h5JwkTTQ/QJ0Xrt6OwjURm3S0IdJa1nzsOPnJ0fDzflMb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787810700; c=relaxed/simple;
	bh=qFZLQRD7PNlO6ERr0JdUZJN/uRpEbK+NRnISGh6djjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoMHL7EZDgH5ZrhqrNQqRZhpJqn59AppmfgavWW5HZxBbVQQV0IzqRDCgRrNHPkSBoNB42d37uNgAW7T5si4EEFvpaWx7PsGRyPaHBuEv5WPT3NoQELSpOgf8qA0Hh5+vKSEdfKyAW7W7JgK2GKt3U/bneVhFYerq2vls/MDPNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tVRNyIW/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tVRNyIW/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29101F000E9;
	Thu, 27 Aug 2026 06:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787810697;
	bh=qFZLQRD7PNlO6ERr0JdUZJN/uRpEbK+NRnISGh6djjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tVRNyIW/eMT1ej45GFfbM4Y4vy7dY7kMchUmZP+wDsQsgsme3den2tbktQwhHFgcm
	 xJ28ZLhjTEKO2wBYUZfQj/5kp76kG40Yb20Y46WNDwVj0K2hW5f8yKu6ogZV/yl328
	 Ftt1ILCz+LNlBD6ZlTB0wgn8uUojLjvilL44l2DE=
Date: Thu, 27 Aug 2026 08:03:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: 3237174131@qq.com
Cc: linux-kernel@vger.kernel.org, tglx@kernel.org
Subject: Re: [PATCH v2] scripts/spdxcheck: add friendly error message for
 missing ply module
Message-ID: <2026082749-statue-outsource-472a@gregkh>
References: <tencent_4F73DEA0B9989946C80BA28272DFA61C1F09@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_4F73DEA0B9989946C80BA28272DFA61C1F09@qq.com>

On Wed, Aug 26, 2026 at 10:50:51PM -0700, 3237174131@qq.com wrote:
> Changes since v1:
> - Remove email headers from patch body

This goes below the --- line.

Please slow down, there is no rush, you should wait a few days between
submissions.

thanks,

greg k-h
