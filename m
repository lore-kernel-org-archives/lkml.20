Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4C046D2CC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.77.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813882; cv=none; b=UvhZA6byZ1U6jXs2oAQD+q/78vleWHDH+DFrN0bUoFfCsB0kkH56QATWJ9dKyj5zaGXd5GjFoxEcpFuE5EapRo6k5YKjX6DCS2S9N6Vto9idAIdfGyJSRzm5jt/jszX5uQOLMbBY9X8WkyAQ1zWbz/kGST4ibdB9wPPBAZZuxzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813882; c=relaxed/simple;
	bh=b/OP7UO4QI5EAz0MF6AstTK9qK/7VcOlLA68qfIzhUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9LF+Wmin6pZJKntloHrHhndL+TjqBq+kmUCGizTx9uG6x1bTymggRtcqtjg1P8Xf9tlkfyalXW4IpBqdet3Tiw2HV+Z3PyI4XIY244vm0Vy96yvxP1u9ViH3mLGulWuvJyT7xZLLilpLonAVvu0k0luepp3JG1SlaE3PdG4k8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org; dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b=VAhCavLs; dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b=VAhCavLs; arc=none smtp.client-ip=140.77.166.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b="VAhCavLs";
	dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b="VAhCavLs"
Received: from localhost (localhost [127.0.0.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id D4964A739F;
	Mon, 12 Oct 2026 15:56:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1791813417; bh=b/OP7UO4QI5EAz0MF6AstTK9qK/7VcOlLA68qfIzhUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VAhCavLsbRJaFUjNNJdI76YjuqJW0GQTsGz9ImVsYzLP8tVhK35tZLA2FjOwLk4od
	 xMR/TNL+zpQoozImal6YiXfz7iU/qMDQI8xnUut9uSjUjcIN0TQI4kjN781Ez16I2T
	 WKdQPfkUetF2NlP4P9gTrmePk9W+bzl987LSpmCoj51LtvDOfjjL4JiioSJVWYCLHY
	 kzcrBB2KhubaOmrKZuCisLTqYiR1n48l3wY4ViYAR7q46VU1sDdp5IxNXnw2p0IoCe
	 6KTf/mtbG+2Oo799JYBJ6iiHwSwnl2XaFGod1NyKw5Av3oE5fxp2cWcJngxr12IvXg
	 Njgv/z8Uk/j4A==
Received: from sonata.ens-lyon.org ([127.0.0.1])
	by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kKZECVPFRM8J; Mon, 12 Oct 2026 15:56:57 +0200 (CEST)
Received: from end (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr [194.199.1.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by sonata.ens-lyon.org (Postfix) with ESMTPSA id 5A474A1E47;
	Mon, 12 Oct 2026 15:56:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1791813417; bh=b/OP7UO4QI5EAz0MF6AstTK9qK/7VcOlLA68qfIzhUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VAhCavLsbRJaFUjNNJdI76YjuqJW0GQTsGz9ImVsYzLP8tVhK35tZLA2FjOwLk4od
	 xMR/TNL+zpQoozImal6YiXfz7iU/qMDQI8xnUut9uSjUjcIN0TQI4kjN781Ez16I2T
	 WKdQPfkUetF2NlP4P9gTrmePk9W+bzl987LSpmCoj51LtvDOfjjL4JiioSJVWYCLHY
	 kzcrBB2KhubaOmrKZuCisLTqYiR1n48l3wY4ViYAR7q46VU1sDdp5IxNXnw2p0IoCe
	 6KTf/mtbG+2Oo799JYBJ6iiHwSwnl2XaFGod1NyKw5Av3oE5fxp2cWcJngxr12IvXg
	 Njgv/z8Uk/j4A==
Received: from samy by end with local (Exim 4.100.1)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1xGGWO-0000000BnOF-0TQP;
	Mon, 12 Oct 2026 15:56:56 +0200
Date: Mon, 12 Oct 2026 15:56:56 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Thorsten Blum <blum@kernel.org>
Cc: William Hubbs <w.d.hubbs@gmail.com>,
	Chris Brannon <chris@the-brannons.com>,
	Kirk Reiser <kirk@reisers.ca>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Jagadeesh Yalapalli <jagadeesh.yalapalli@einfochips.com>,
	speakup@linux-speakup.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] accessibility: speakup: Use isdigit() in handle_goto()
Message-ID: <asznKOvUGKWBZKub@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Thorsten Blum <blum@kernel.org>,
	William Hubbs <w.d.hubbs@gmail.com>,
	Chris Brannon <chris@the-brannons.com>,
	Kirk Reiser <kirk@reisers.ca>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Jagadeesh Yalapalli <jagadeesh.yalapalli@einfochips.com>,
	speakup@linux-speakup.org, linux-kernel@vger.kernel.org
References: <20261012130805.345080-4-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012130805.345080-4-blum@kernel.org>
Organization: I am not organized

Thorsten Blum, le lun. 12 oct. 2026 15:08:05 +0200, a ecrit:
> Use isdigit() to replace the open-coded implementation.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
>  drivers/accessibility/speakup/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accessibility/speakup/main.c b/drivers/accessibility/speakup/main.c
> index e9b7c2761f6f..a7c14531f2ce 100644
> --- a/drivers/accessibility/speakup/main.c
> +++ b/drivers/accessibility/speakup/main.c
> @@ -1980,7 +1980,7 @@ static int handle_goto(struct vc_data *vc, u_char type, u_char ch, u16 key)
>  	maxlen = (*goto_buf >= '0') ? 3 : 4;
>  	if ((ch == '+' || ch == '-') && num == 1)
>  		return 1;
> -	if (ch >= '0' && ch <= '9' && num < maxlen)
> +	if (isdigit(ch) && num < maxlen)
>  		return 1;
>  	if (num < maxlen - 1 || num > maxlen)
>  		goto oops;
> 
