Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DEF38AC6A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770078; cv=none; b=KsV/uKVxda1Ub/Z1pC4l5l4U/5pHfmVcDTylT3iOo3Eu3TSeZaQknkFvkK5Y0iKWjNBBUKv5sGnd6QjdtU9+TlItGDI4nFVMv/kbmnOUTH0PouUKOqg9vZV0dZAz+nsxYwwXeiTT/5mv+a4ac8/i3feqwPz1Voqvare5fvxkH/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770078; c=relaxed/simple;
	bh=+FwJtlfrM0QgaoS3zhsMAFRd0dW54ltAMUamg6i/wMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duhQehmag/l3W/ljZLXcLTHgyCa0Voi51u2HY6zOWPOB+121TsI1NDMDE5okuhA2PGXTPjoZAthLT/FBxYy0tLzjYFpG1ad+/nA7xf5hEV9NuS0VXsUw63dqlU7eKo3nxlyXFQVOIW4endmRhfnEOJGyrbUE26UwkIs2ASaJZn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvAe87js; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=V+389A5F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvAe87js";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="V+389A5F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789770072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z7dezM5jMkC2kVacafvsV0OwTH65W5JtT/fFjd8EacQ=;
	b=UvAe87jsIJP1Ozh20NDvwE42lX0OoZ3HvOXyJSjVj+rhxDKn0eUxF7NvuOmFczbJkdwOIK
	SAuKGpNCavrKFksFoza3ewQBMeYLjeSi8pDlDuVCid0TaDfOQWDdfGiobtB40zy3PxaieI
	mK1sspzKfnL/2WS6Y9KIfSfN5pWvqE4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-nQ8qVCODMauIx1B7petT-Q-1; Fri, 18 Sep 2026 18:21:11 -0400
X-MC-Unique: nQ8qVCODMauIx1B7petT-Q-1
X-Mimecast-MFC-AGG-ID: nQ8qVCODMauIx1B7petT-Q_1789770071
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so215564785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789770071; x=1790374871; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=z7dezM5jMkC2kVacafvsV0OwTH65W5JtT/fFjd8EacQ=;
        b=V+389A5FUoTXwXXkSzzwSQsnFjfvqR7Iy3aZ9b/YsDc0lwvFQ4LbAs3jtyfYYQwKZD
         VJG4zw7cPQFhoa7H1Cf/NhSdZfd3J9lEIbmDhS/RrJon2nEFnqUi+qshF775woaZuzKT
         0vlttLAkDW200B3J9fzPe0G+AuuZLsuoCIOGIZnChG/Dr1B2rZmKz8cg+gUJghzdoh4L
         wQLh7ZbImLP3pk4KW/E9HSKAb2ccwtKLmcOR7zGoSjvfZkw7EJcVf6sk08iHIvVrKpHD
         OcgFJR9ac5fsC6ExJuz3erJBZzRPPGXyi9dHpAdIUogWhBPHWfhISQSGNnPfjk0C0c18
         3RzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789770071; x=1790374871;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7dezM5jMkC2kVacafvsV0OwTH65W5JtT/fFjd8EacQ=;
        b=fOdgDrugm6l+EVINNJzbzTEIKGxAYdtet3Yl7tDgA9xr7n5E/9c2rbIlTGoTmSUvqw
         fejxC75uNZjHZvvP8Xu4egAeJfKhNYDj0SL/0vldEy7I7SoxRnlAe3aG5bF/hYUaWuw1
         Jc1dbFw1XEN95Bil2w8MaoAhNEetltVms9x/OhVP7rW4jvAeAGkN5Ne07eQi401l5o6B
         XHaSXmduhSWhhM+Azwg70+2oE1Tg2nU8klYmNT7HcwtG71zAKubCVYQNEfMkSGamQh4N
         IAU3qKshW/UDwByiihC+AXk+ddy8US9F3ChS3ymdmATGNPhojG1MkeTzhPhN/L4EOgw8
         VEnw==
X-Forwarded-Encrypted: i=1; AKwUvBwLFwAOuyp60kKjo7JZ4M18JnlrJYjGlhwvljWD3v2sPWTwSKJjvb9bHg9k3nU7DnTd71CxW2ppHKpOUvU=@vger.kernel.org
X-Gm-Message-State: AFuF++n8myD/hOMNeYa0umVm2ONvjryHv1fqySR81MYcw3GHI0K6WUjX
	nyDR7Tr/ImzeS+7RPddaUb0SN2h8WAaVX9CIL6C1RxR9W6Ng9gR5cR4IM6hbvgr/VOKhrKtRlVc
	6MLnKkTM5PM/maFr01avmBzNrLH6vFqelmKW9JmXToYF9dwhWBrqjkpigcPrMgbr2tQ==
X-Gm-Gg: AYBFou2WbwOq31P35Hvx7XPndokYjjylMJgl82Ak4ZDT3Y7rCUV90kXt4jBHk61zxFf
	t6ys/QEsPzJ/ywhYGOWFJw7ksAtUdyAZ7K6ghT/wILZn/5NaRq6sx5UdpmCI+K4r/2mLVno00yq
	dmoeom4UKbdiodlwIxrCp3XTO1nmXbVpnPgPSCOfsLTGtzzNRA62seyPWlV/EcNMW+/8r8wj3zI
	IveWiP6gLmeFqo47Ez6xcc7/+Po2+crDXeNDaSTNR3LWixEuPCXosEmNWrPhdE3B7oO8tQz2pN9
	8xIgnOAu9EY8hNjWDi2rJw0dUcJmagXrqEFwvpuonmGIY2EoGv/4u+PP2xuzOkrhWBbO0Ao=
X-Received: by 2002:a05:620a:4505:b0:93b:d7a4:9d51 with SMTP id af79cd13be357-93bdbc7bb10mr618657685a.36.1789770070964;
        Fri, 18 Sep 2026 15:21:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:93b:d7a4:9d51 with SMTP id af79cd13be357-93bdbc7bb10mr618655485a.36.1789770070577;
        Fri, 18 Sep 2026 15:21:10 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedb6759bsm49189185a.43.2026.09.18.15.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:21:08 -0700 (PDT)
Date: Fri, 18 Sep 2026 18:21:06 -0400
From: Brian Masney <bmasney@redhat.com>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: biju.das.jz@bp.renesas.com, sboyd@kernel.org, bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] clk: versaclock7: propagate all xin lookup failures
Message-ID: <aq25UlM87_UIatKW@redhat.com>
References: <20260911060918.94343-1-bolin.liu@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911060918.94343-1-bolin.liu@seu.edu.cn>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Slavin,

On Fri, Sep 11, 2026 at 02:09:18PM +0800, Slavin Liu wrote:
> The xin clock is used to obtain the APLL reference rate. Handle all
> lookup errors, not only probe deferral, before clk_get_rate() can see
> an error pointer.
> 
> Detected by static analysis and reviewed with AI-assisted source auditing.
> 
> Fixes: 48c5e98fedd9 ("clk: Renesas versaclock7 ccf device driver")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
>  drivers/clk/clk-versaclock7.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-versaclock7.c b/drivers/clk/clk-versaclock7.c
> index 1340d2f512be..5f32d3fb807a 100644
> --- a/drivers/clk/clk-versaclock7.c
> +++ b/drivers/clk/clk-versaclock7.c
> @@ -1117,8 +1117,8 @@ static int vc7_probe(struct i2c_client *client)
>  	vc7->chip_info = i2c_get_match_data(client);
>  
>  	vc7->pin_xin = devm_clk_get(&client->dev, "xin");
> -	if (PTR_ERR(vc7->pin_xin) == -EPROBE_DEFER) {
> -		return dev_err_probe(&client->dev, -EPROBE_DEFER,
> +	if (IS_ERR(vc7->pin_xin)) {
> +		return dev_err_probe(&client->dev, PTR_ERR(vc7->pin_xin),
>  				     "xin not specified\n");

Could you clarify the error message as well? Perhaps 'devm_clk_get failed for
xin' ?

You can drop the PATCH RFC on the next version.

Brian

