Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF097493639
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405045; cv=none; b=OnqXw+b4elsI0kB612UarZQlT/L8qe2ZMQll/q5SpIokAH8vDoEGEXxiDylSGJkBoEJ0vGi/5Dw5YUFwBzXqCJy2c66ilqQrjuHzDTzxYYT4wv4UdpRFo+6k0CIb5Z4m//FgTZw7LZOzx9T880UlfE2zUc5BEEoXnra9oWbTOb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405045; c=relaxed/simple;
	bh=uVw9vIxjDeVFEUcpIkDbKMJ3BRJ2DCL3fmL5T+0sdyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcfQtYji95D7Hpd9I49dbc8RuBw/JhffjyjQdzIWb27kaiy7oEhXEM7oKLaSIGdZjwMlL0y9hadstSMkhtQDEJ7Saoz38lhb+d7T6lVPJEv37F3S0yoLA2Y4BTRc4trd7aA4Ru7BIsoRCsqxt1X1VoKheP9tFOnTbH36UH+gGHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=byNSo4NK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cZ9hIzcQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="byNSo4NK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cZ9hIzcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789405041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/S8qRxofUNMQ9OSgKE55n+W3yA4LSkLugFr32CACvBY=;
	b=byNSo4NKVpFxhJCf2Aqg5A1MVyWjex2PMUqZ+ciLIVtuiE7SCa3PP5nwWH8294jE1aDP1r
	sXoQnQbpBeKlrSx3go/+6k8fQMSeJ36apuDmZvnVhOtw8rhZMZlJ9ffN8vJCpygUbndm7x
	7n+1yWWxhyXgNWHo1wKhlfrrrz/DaOM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-PbHEuH5FPUi8gMx1SIrRTw-1; Mon, 14 Sep 2026 12:57:20 -0400
X-MC-Unique: PbHEuH5FPUi8gMx1SIrRTw-1
X-Mimecast-MFC-AGG-ID: PbHEuH5FPUi8gMx1SIrRTw_1789405040
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390a2c895bso810290185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789405040; x=1790009840; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/S8qRxofUNMQ9OSgKE55n+W3yA4LSkLugFr32CACvBY=;
        b=cZ9hIzcQZJSVKN+cSh+lRPy7U/fyCiTT2te8KWy9k6biJcTIzbFj33P41KrRNr6IQE
         QSz0XBMNdfU1m041VDDMdNe7mQEW+IKgRWtcmL/XCAFgT6GAFmyVNc576nv/+M1XxmEx
         LOb4EFxWjMipTr0dyflE0zRPv1/boSjVC9+gV/SK7CrzeGTyrTjZcSapQlzaEZ3xgdVd
         7xTL5JOfMAqHk4K5IO9ZswFPYgTGbPrHEjSWWdJW+y6ogpH0aTHeN3gKeF1mFjeuLHsm
         Nop24QSmkaSvZw+4mxVl5XoQr+M8V/eGfcZfVhhQD8w8NtK12KCxpJpVFOc1rBUo0+fz
         Nb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789405040; x=1790009840;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/S8qRxofUNMQ9OSgKE55n+W3yA4LSkLugFr32CACvBY=;
        b=YNlr1bQhDsuGBXdsyMO216R8vDY499hUP2s/ULSDgD5KBFsmoN5YH/+5Tl2f1pPS2g
         fQg3hJ02O6RoDxg1uejoftpbKSxrL+TTBgdJE/fN5AIJPf1Ndpu+DnvHN0Q0p5L3WRJG
         2VWkN/di7D6oJh613i1oqpfpClPAtVZJ7xPqVs2PfG3zrdY0T+sCGHdzDTi+LFYL4iD/
         O0ctbeoK6dt6PFi0nHppIK+pTdo4y17qGir3GllzO204OoqJ5Ne7wX4Ac2N5qMNgJQLt
         6AjWd/evdET9cKJn/hDigaxdu2KKpRlcOprlpUCglXc5oa4sWK6HvvCHYPVd7eSx1vbW
         EjFg==
X-Forwarded-Encrypted: i=1; AKwUvBxXyoEoCdB7rnC/x2OnFDTqrSlD7jiUEV07xpe1rzb7J3wML3Jk864QGdLeAwrWNbXWuGguUQYP9nc3Nfo=@vger.kernel.org
X-Gm-Message-State: AFuF++kM6hM8LiJxn9Q7hermjPWzbPV5g79EXGkSm0uQifgGjsgnwYFJ
	w7LMQwGlRG2pCeqC5cUCn3vn2V95EmdWAlWaBxWgB6YVa+uSmshfX7Z5c+rLMIZJaftjebFtfQZ
	Ia0WfmTTwnMqP7MBIymcoEzbReWJCCWzQt/EQoyI347VgwJh0EoSNu4fp2XF/eJFUFg==
X-Gm-Gg: AYBFou1iEkMOolUtxpKJ4fTi3Jn+uq69dsUzNe6WR2aRzuczc5UhAp4kLGAIIDgzeCD
	3uuS2xfcCYpyNqgewG+xLCO6Dpu/jpqmK2A7G+O5UCXNuwOov2UnBj9a19Iz45lxXzynGiv5NZz
	986UjYMwhw2b4ml6oTYjY4S53YJyAm3YdnmHcqmnPvR4QDO2s+aF749rbYPFTR98R40DD4AwkYi
	MS8pg/o25a4vLT0zenhtw7vj9ZpEIyfZFKvfzt3cLXaWv4S0zdvGAXWHZq/0G2n26dCv9KkvsU2
	OmPNlLvHAfEkADvqw3H4F008N0F735HNWf1lC1JHCimaOJwrAe/kdl3iuMNBexi/xhmGhmZy/Sd
	Z8cvflfvMP793j4HWF0adphElDx6h42pt2QM=
X-Received: by 2002:a05:620a:4802:b0:937:7836:1501 with SMTP id af79cd13be357-93a2973a2c7mr527199785a.10.1789405039649;
        Mon, 14 Sep 2026 09:57:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4802:b0:937:7836:1501 with SMTP id af79cd13be357-93a2973a2c7mr527194085a.10.1789405039208;
        Mon, 14 Sep 2026 09:57:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f19291sm1072082885a.10.2026.09.14.09.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:57:18 -0700 (PDT)
Date: Mon, 14 Sep 2026 12:57:16 -0400
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
Subject: Re: [PATCH v2 1/2] clk: eyeq: Use devm_platform_ioremap_resource()
Message-ID: <aqgnbA_yMRXczyao@redhat.com>
References: <20260914-clk-eyeq-res-v2-0-687e5de3aba7@bootlin.com>
 <20260914-clk-eyeq-res-v2-1-687e5de3aba7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914-clk-eyeq-res-v2-1-687e5de3aba7@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Benoît,

On Mon, Sep 14, 2026 at 02:16:44PM +0200, Benoît Monin wrote:
> Convert eqc_probe() from the open-coded platform_get_resource() +
> ioremap() sequence to devm_platform_ioremap_resource(). Besides less
> code, this requests the memory region so the OLB registers are properly
> reserved in the iomem_resource tree.
> 
> Move devm_platform_ioremap_resource() before checking for device match
> data, so OLBs bound without match data also get their memory region
> mapped and reserved.
> 
> Suggested-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/clk/clk-eyeq.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
> index cf37feccc734..3662e6990bf7 100644
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

As Sashiko pointed out, it would probably make sense to just convert the
rest of the driver over to use the devm_ variants where available (like
of_clk_add_hw_provider).

Brian

