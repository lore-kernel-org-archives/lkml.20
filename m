Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059ED519911;
	Mon,  7 Sep 2026 16:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798923; cv=none; b=N0yp7dGbyH5Ux8GRHwKJLs9SJHhPqecMRZqi49nMdTh8lH9bMgsev5LgXLU6PhhGh8WwpHlbaRhrQRg4PqbsvoGB+bIlt3KX5ZNpi81zckIa7umwBtotb41t4bT7pMRIX69T9eJTdXLcx3/o+wUue1kQ0RATrFiJZxqO1an8n4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798923; c=relaxed/simple;
	bh=2R4Duxrc82unDSDFyDHaSPTI7wpj/vmuf02OoKJA+H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ug7H4Ij9P7TLf3URaFk2+OJWR/ltoJfFXhfq941whOEuqr7YARJFwlJJIATxt6Pmx7BQDcZtgYI0J1IFAM8pOM4Et55rLdjtnpclJZ6el4FOAfHzjP/7pVQEwMuw2yVhOjZ7nZkJkYRFxN4D6ZUf1jVNaD7cGcQDqyfepzXGe5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xZgOQf5q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xZgOQf5q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08741F00A3A;
	Mon,  7 Sep 2026 16:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788798921;
	bh=tEhSXVseIby0wkA2SB/062DM3+hbFvu5KPw00K39le0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xZgOQf5qTC+mOMj0xCPYeM6dxi2NnDlaatXqq07sk568Sm9Z1gUlupLoR55VE+s7k
	 L6JeXQ2iDeLHj3cuGGadbrks4gomZk5bMuF5XwvlixgiukHvnlzIPkTMR8ZSmRe1AX
	 z0qe91x4TqzRQE+bO/GWKUKykovsI3rXz8hEO9xA=
Date: Mon, 7 Sep 2026 18:33:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: tuxdevv <denizgozen61@gmail.com>
Cc: linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
Subject: Re: [PATCH] staging: greybus: fix missing newline in sysfs_emit()
 format strings
Message-ID: <2026090758-conjure-parole-ccb1@gregkh>
References: <20260907071525.43505-1-denizgozen61@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907071525.43505-1-denizgozen61@gmail.com>

On Mon, Sep 07, 2026 at 10:15:25AM +0300, tuxdevv wrote:
> From: Deniz Gözen <denizgozen61@gmail.com>
> 
> The show functions for the audio module's name, vid, pid, intf_id,
> ip_devices and op_devices sysfs attributes pass format strings to
> sysfs_emit() without a trailing newline. Per sysfs conventions each
> attribute should return content terminated by '\n', and checkpatch.pl
> flags all six calls as missing the terminator.
> 
> Add the missing '\n' to each format string.
> 
> Signed-off-by: Deniz Gözen <denizgozen61@gmail.com>
> ---
>  drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Please see the mailing list archives for why this change can't be
accepted at the moment.

thanks,

greg k-h
