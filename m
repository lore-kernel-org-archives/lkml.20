Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523A22DF156
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789170847; cv=none; b=PfscXvSikg/MA3JJlYaQzkURXjSL3u2m+1TQjHihTJ3CYngGodf2iGGni+GNY1Lczgp7E0eP4SCyUGLwOMJc3gnhhQWce/xtiDi8oWJjdgn6xwg4+JKTPdkqcq9oCZUI4Ebh4MlAGuHv7LhEK2iJza2sfLetnn9MOIdrY1U4Ffw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789170847; c=relaxed/simple;
	bh=AhGRne8scMnXdCsxDSbn1g1zYM4uSCys9RuLljGwmns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APevUw2VUcG26sQy7pT/Jv5ooWuNRNhKN5LYhLAdBVMa1qMkch002OnaZEdG/kl7PBTMOz9zs6GDx2g4tsI8sG+Pz2O0dh4uvY/wdGqBipQBCD1C1qfQ4gf6TVyYaQ6T/o9S6UOFSSWIrSi0Zv9k5wpXYJlbcjM4SghMFWjQrKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fZ5b8Uk9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=thmv0Lpj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fZ5b8Uk9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="thmv0Lpj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789170840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P01ICaDhB6Y/9B7lpP0PK4Bgc8sZGn3B2i3qpboQMSM=;
	b=fZ5b8Uk9pwtbuaCxOXiQ2Qe/AkY20wCy26fv6vWrGvIKQVPKb9PwQVyoCPRnXMdoWCr9eF
	/iUmXM5p46n7U8j+GLv6mpghniOpaMHY5kNoDLNHmGGI0UcA6Kiw9ZPhAcmYD2krIjYBRF
	O5LD7HSLwrYsLwi0abd1DRxJSTknnVU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-82pUv1nxPKGgIGXCGblmYA-1; Fri, 11 Sep 2026 19:53:59 -0400
X-MC-Unique: 82pUv1nxPKGgIGXCGblmYA-1
X-Mimecast-MFC-AGG-ID: 82pUv1nxPKGgIGXCGblmYA_1789170839
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9394ad7f64aso225411485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789170839; x=1789775639; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P01ICaDhB6Y/9B7lpP0PK4Bgc8sZGn3B2i3qpboQMSM=;
        b=thmv0LpjZ4EPz3NKWTkjlsEUzf7NLGDs7qbH5MCgrgE4Eri+01i31VuVH/iFmtKSrO
         FvMEDcnpyQB6co7pVDGOaHxUWXwqmpv+LHaym9kr9hNRvNkGrSBg2PTpMmkZMpYXHRCj
         QaO5qsPTnhs3DddmBGTxJaIXOvWzPfbbf+eP3/QzcETIjfcBAzLnI78ZS257T6ITQUvO
         SN1epTsv3A1Yi/lHCvit+1D6Us2uUnS/SeqEvb33ojDL/f2wjL1hzladhnSLC97aUAEN
         hvP9WAvqNwsm9GZxToIsVWsL+Ks478TcYTfl4w10Kq9mAwaZHI2OcO4kt2LoF6cEOxv8
         2BHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789170839; x=1789775639;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P01ICaDhB6Y/9B7lpP0PK4Bgc8sZGn3B2i3qpboQMSM=;
        b=eYx3mag0VyWwR0f+Pa157ekEX8fCYjqjl0+6bd+Z/LN2iYYat/XatijYEV9+MYuEIF
         ZJgJRw/mGH23LtM9DzpB/b+6bAUhUp7TcHbPakk9FqeRsi+Jk63vZ7eKEtG4JD8ZzJqZ
         1J2z3mSlDDxUWU4I3rZcYf/Qe6fnd42YTjkjCo+fkxLoWkztypWJ1DIpQQiOAAPfd+iO
         jFFQ32altn5Ed/d/hYNhEfVYEX5Jpac0d5rF0X3y8EZ7HCjR5k33hHytFXVZNzYH4r14
         WE59MwDmZDYqLimhPAaCHe5hFMR3BspomW0ryQMXHdd3hP+63pd/lSXMuVyzhOOc28dn
         yHXg==
X-Forwarded-Encrypted: i=1; AKwUvByGyUao6/4+xNHb7JEsjWsmrR0XgrTxviso/WDo4aQ6EKpQ9t21yP6RV00+CWQzv7/hTr5YdkXS0+lxRzA=@vger.kernel.org
X-Gm-Message-State: AFuF++kwlRTbyYbRIHi+s3/OaE2NODE6WtDLSE214S1uWZxeeMt52/aC
	r1GH/wX30yPFlit/LJHOBiEaQE96yH0JM8mq6ZgHnR96sWIpCjgMmacGDEyDlq71M2dDDOV7Arn
	CWwQqACefWtMFlHJ1sIATR3KtqHT/xJhMmWri0DldSruFoJo+as+inVGDu/u0p8bvO+da2nyH7A
	==
X-Gm-Gg: AYBFou0r6sOahN+JlXQ7XPNWX3tAqad1qzjwR0vD+YKF45hWjfPFm6jIcIZLd67v5tB
	QGOEuGg/LAdV4JgGP7SA55Zzt1sF6OcFMSDDwwKvFX0/sLphGzSkQOEA3HVrU8H3nza2JbMVv6n
	/jK9JdoMz7kiAyo4eMPHhcRKh+4thoveQi7oSETeZ3wIQf5k+4/Rld+bN1/ErICtc9P9rPoizv5
	mIXBxgfqKYRASgZGB+5LDMzYP1vc0F/6LFE9Q6xFmWxFlGZ7Ok1KhU07gYwmIMnoW68X+7qCwrU
	DXIzFkg3qRdv5fgIY3NwXiwxyPLsx5KCL54E086fkjl1g8qX1yH0mTtKJJ0guHyGXGRNZbSbq/U
	t24eCECnwhrmz2jFURGCEV7u3EHO86bxDeQk=
X-Received: by 2002:a05:620a:6188:b0:939:5c62:fddd with SMTP id af79cd13be357-939ea134eb5mr1100339985a.19.1789170838701;
        Fri, 11 Sep 2026 16:53:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6188:b0:939:5c62:fddd with SMTP id af79cd13be357-939ea134eb5mr1100336485a.19.1789170838210;
        Fri, 11 Sep 2026 16:53:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80e0c74sm368993485a.41.2026.09.11.16.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:53:56 -0700 (PDT)
Date: Fri, 11 Sep 2026 19:53:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: eyeq: Use devm_platform_ioremap_resource()
Message-ID: <aqSUk0DcPB0WlorJ@redhat.com>
References: <20260911-clk-eyeq-res-v1-1-39b04542db38@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-clk-eyeq-res-v1-1-39b04542db38@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Benoît,

On Fri, Sep 11, 2026 at 01:48:47PM +0200, Benoît Monin wrote:
> Convert eqc_probe() from the open-coded platform_get_resource() +
> ioremap() sequence to devm_platform_ioremap_resource(). Besides less
> code, this requests the memory region so the OLB registers are properly
> reserved in the iomem_resource tree.
> 
> Move devm_platform_ioremap_resource() before checking for device match
> data, so OLBs bound without match data also get their memory region
> mapped and reserved.
> 
> Add an entry for mobileye,eyeq6h-central-olb without match data: its
> clocks are all registered by the early init and it has no auxiliary
> devices, so probe() now reserves its region and stops there.
> 
> Suggested-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/clk/clk-eyeq.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
> index cf37feccc734..bb680283b6f2 100644
> --- a/drivers/clk/clk-eyeq.c
> +++ b/drivers/clk/clk-eyeq.c
> @@ -513,21 +513,16 @@ static int eqc_probe(struct platform_device *pdev)
>  	const struct eqc_match_data *data;
>  	struct clk_hw_onecell_data *cells;
>  	unsigned int i, clk_count;
> -	struct resource *res;
>  	void __iomem *base;
>  	int ret;
>  
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
>  	data = device_get_match_data(dev);
>  	if (!data)
> -		return 0; /* No clocks nor auxdevs, we are done. */
> -
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -ENODEV;
> -
> -	base = ioremap(res->start, resource_size(res));
> -	if (!base)
> -		return -ENOMEM;
> +		return 0; /* Early only clocks, stop here but keep resource reserved */
>  
>  	/* Init optional auxiliary devices. */
>  	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);

Can you make this one patch.

> @@ -1175,6 +1170,7 @@ static const struct of_device_id eqc_match_table[] = {
>  	{ .compatible = "mobileye,eyeq5-olb", .data = &eqc_eyeq5_match_data },
>  	{ .compatible = "mobileye,eyeq6l-olb", .data = &eqc_eyeq6l_match_data },
>  	{ .compatible = "mobileye,eyeq6lplus-olb", .data = &eqc_eyeq6lplus_match_data },
> +	{ .compatible = "mobileye,eyeq6h-central-olb" /* no data, early only */ },
>  	{ .compatible = "mobileye,eyeq6h-west-olb", .data = &eqc_eyeq6h_west_match_data },
>  	{ .compatible = "mobileye,eyeq6h-east-olb", .data = &eqc_eyeq6h_east_match_data },
>  	{ .compatible = "mobileye,eyeq6h-south-olb", .data = &eqc_eyeq6h_south_match_data },
> 

And this a second patch?

Otherwise this looks good to me.

Brian

