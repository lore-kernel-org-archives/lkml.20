Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5572527A47F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.77.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787947151; cv=none; b=Lpoocz5vXh0AJegQ4/G2u2HH1qVEpKXczqoyQR8FbbxV2HvceMQSriB5rlI3tSjgsfJMKOJR1+7gdkWtkKclZzu2nkUm3DrVMxDY3U8hLrKjWjvaUhD8W/4YrTtGgHduJ51AOfGQBpgK0qqEBsOfmKP2GJj/xs2CQQ2C/eLKGRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787947151; c=relaxed/simple;
	bh=S9qjmQkt+uL+to3pOu1Ot8jtLipfs7IsQ/YB0nY0eZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cudfCEMpdnwmVWqFmxyq6X8MD2DhhRPHLpWolL2d3HtO7YbxgDxGjdKm3QDYYhZ3BBJyDL3yvp2f36ZkOBDFcgsxsCa8SmGW/dBFmowbXIg7I9iMcJwPgawIHqg9HMz0KEtkHNWYFPEMIZZOBkb+V2OQ5VJqYulkcV7OpnPV234=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org; dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b=UnQtN+j9; dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b=UnQtN+j9; arc=none smtp.client-ip=140.77.166.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b="UnQtN+j9";
	dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b="UnQtN+j9"
Received: from localhost (localhost [127.0.0.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id A5424A04F2;
	Fri, 28 Aug 2026 21:50:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1787946611; bh=S9qjmQkt+uL+to3pOu1Ot8jtLipfs7IsQ/YB0nY0eZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UnQtN+j9/9rT+6aGuNQHJFNPukdtv5oo4UKDefJuQhCa15YtuFu+6bsilqeuNyA9x
	 urdzAGOo1bQLyRBwhbmXKX1YkUsrkPQyuMBM9xof+ezk3DkSiAjs9EGTcUENzYLiIY
	 JeTGiOxXZvd0FPkddpJ0FlbnPjhjY1sqI9mbmhmED/b5mtND+3IH6nyqvhxMQh1dvp
	 EgqsjtvfdDL3qnY8XC4VZa21wMIG31Gb3pU+NvPk8mYNbvOjW8tHDiBlzcKHKqD6G8
	 Dbp13Jh691SUof5O2wFOJm4mSVTHkrW0tfWULSMDD3SxgA0ZYhakugQ1X0agAviCXn
	 mgcRn+t/CVMuQ==
Received: from sonata.ens-lyon.org ([127.0.0.1])
	by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BcwQtZwzCOTa; Fri, 28 Aug 2026 21:50:11 +0200 (CEST)
Received: from end (aamiens-653-1-40-48.w83-192.abo.wanadoo.fr [83.192.199.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by sonata.ens-lyon.org (Postfix) with ESMTPSA id 04204A03FA;
	Fri, 28 Aug 2026 21:50:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1787946611; bh=S9qjmQkt+uL+to3pOu1Ot8jtLipfs7IsQ/YB0nY0eZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UnQtN+j9/9rT+6aGuNQHJFNPukdtv5oo4UKDefJuQhCa15YtuFu+6bsilqeuNyA9x
	 urdzAGOo1bQLyRBwhbmXKX1YkUsrkPQyuMBM9xof+ezk3DkSiAjs9EGTcUENzYLiIY
	 JeTGiOxXZvd0FPkddpJ0FlbnPjhjY1sqI9mbmhmED/b5mtND+3IH6nyqvhxMQh1dvp
	 EgqsjtvfdDL3qnY8XC4VZa21wMIG31Gb3pU+NvPk8mYNbvOjW8tHDiBlzcKHKqD6G8
	 Dbp13Jh691SUof5O2wFOJm4mSVTHkrW0tfWULSMDD3SxgA0ZYhakugQ1X0agAviCXn
	 mgcRn+t/CVMuQ==
Received: from samy by end with local (Exim 4.100-RC3)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1x02aY-00000007cM9-1WQM;
	Fri, 28 Aug 2026 21:50:10 +0200
Date: Fri, 28 Aug 2026 21:50:10 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Mahantesh <mahantesh9789@gmail.com>
Cc: w.d.hubbs@gmail.com, chris@the-brannons.com, kirk@reisers.ca,
	speakup@linux-speakup.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] speakup: Fix duplicate word in comment
Message-ID: <apHmcokWeuk3yyIV@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Mahantesh <mahantesh9789@gmail.com>, w.d.hubbs@gmail.com,
	chris@the-brannons.com, kirk@reisers.ca, speakup@linux-speakup.org,
	linux-kernel@vger.kernel.org
References: <20260828072513.6589-1-mahantesh9789@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828072513.6589-1-mahantesh9789@gmail.com>
Organization: I am not organized

Mahantesh, le ven. 28 août 2026 12:55:13 +0530, a ecrit:
> Remove the duplicate word "the" in a comment in speakup_soft.c.
> 
> Signed-off-by: Mahantesh <mahantesh9789@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
>  drivers/accessibility/speakup/speakup_soft.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accessibility/speakup/speakup_soft.c b/drivers/accessibility/speakup/speakup_soft.c
> index 6d446824677b..6549bfb96e7f 100644
> --- a/drivers/accessibility/speakup/speakup_soft.c
> +++ b/drivers/accessibility/speakup/speakup_soft.c
> @@ -446,7 +446,7 @@ static int softsynth_adjust(struct spk_synth *synth, struct st_var_header *var)
>  	if (var->var_id != PUNC_LEVEL)
>  		return 0;
>  
> -	/* We want to set the the speech synthesis punctuation level
> +	/* We want to set the speech synthesis punctuation level
>  	 * accordingly, so it properly tunes speaking A_PUNC characters */
>  	var_data = var->data;
>  	if (!var_data)
> -- 
> 2.43.0
> 
