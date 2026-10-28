Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176195;
	b=2g7QV1EtGUq7zZfaaxv5xDjQSzhJuPtiLzh/aXrQKoD3ZHPRyakrAxVCtgu9Ld12Pslk
	 WCkMIeL+UWT3vDxJugC9dSy6bdlx67f1Vf7ZLQGZ0EicOAQlHyd5V2KS+XiaLe3pAu5XM
	 za9OA0nCmiRzUF7a4LMer6YMZju0cLpzkhbG8tQcnbRELnamOupjUqICL/E2cMktGo/H0
	 J9wZ+Lw/w78ZJQP1xHIXcvUmjnXwVQg4sIjhz9TuY2S4PVqftuA0EHfif2GDL+pL5cLnn
	 Y2anV7SNiwKTn2jw66+8QWjNfJW2f0mhBBd380dB9Dnf/7p0Ww+eAtr63qK8WBPWkgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176195;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=phov0yx4/iWFGJSHvqREaKJOsHR3bBycQ5pnM0JKxhE=;
	b=yK8PXrE7VbhvFOp0NzHxTnkDvmY2BgscdTJKh4vZXDzjnVmvw8pZZrPfMv/KVKZESLkJ
	 lDNN3dcoToyH1aQcN/L3AK+eJ7QoBcnRumpuPVd0bZgU8baSje7Ctb6quLRY41MX7oI2S
	 VNJ1+ZZJN1a946XNRiw17C4/BkVvULHlZVsgk6N/cgCZiVpKRIGQolucaELSMZ4m7j4q7
	 a6tPgKeRJ2unEZOUUCEOl5Bl1pH+vYojsg8vBdhBLlwEh4PPg6EfcIpUmXlm1PzeEbTvm
	 l+YzqLenbB2n+6DNrWdlbxxiMXMIYaPdWwqNoFIEjvy/UFuyNB8a9A+fzw8OLwMaWXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MB4AYznO;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZvAc9nHM;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3922606A329
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3922606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MB4AYznO;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZvAc9nHM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793176193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=phov0yx4/iWFGJSHvqREaKJOsHR3bBycQ5pnM0JKxhE=;
	b=MB4AYznOUEDvYIZNqKIwk+zgeXx+3SGMWTtHmqy3ynHlAPe5qknsc3rRjwTFmSt7UPMWp6
	NIlb8vdP03afTdEp5EL0jlIS5+V33VGH0xS9DDUX0PrELGoIogv6hbEFl4ypmaIknp+mUN
	vCy/aF44pLGiR1aCfzeZiPX7EX0fu14=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-RSiDeoxYPEeA-AnlsWBOZw-1; Wed, 28 Oct 2026 04:29:52 -0400
X-MC-Unique: RSiDeoxYPEeA-AnlsWBOZw-1
X-Mimecast-MFC-AGG-ID: RSiDeoxYPEeA-AnlsWBOZw_1793176191
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48b01a74792so437642f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793176191; x=1793780991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=phov0yx4/iWFGJSHvqREaKJOsHR3bBycQ5pnM0JKxhE=;
        b=ZvAc9nHMlHp4WGyWUmvgA7gFATCXQ1Xlf4bFz+FTyQ1j460Qq/d+jJ4B3uTHhvFP/m
         +xS0qx+z3CNVN1WvPSi4KVf/MznA7zMvPEkaEDtxOHIXqyIp0K1zev8JXD5sgfysCQ98
         NweuZ5gd2FYHn6XH8GR+OzeM0J2CQ8vAeu78ze0sMFkrS/O4lfNB3O5n5raWq5wfuVlZ
         4X97+GNd6U8KeYd8lsS+DgxkT1a70enF6qEGTsjcfnCp/dTpuq/2cOstBpd8I28qltAV
         j9sgaRbFeCdfLpcJWu/zydgzVGsZLoUVcMs2bbJJWMk/4Mixrvz8e6X6bnUCl1Adafj2
         zaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793176191; x=1793780991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phov0yx4/iWFGJSHvqREaKJOsHR3bBycQ5pnM0JKxhE=;
        b=iIVK7YCKDL1Z8MmE91XYAO0JzNTG5nXOv9WbT01BTm68PZJLcvsO2G3TtLkpfyXrP5
         +DtZiOHDRWOHGoD01ChMRDM+6i7Xy+yZopcr+hcW/hDVvEs+nK8f9DA43WoKqvLDbubo
         ZuqZX/qB+KjMuDWLM/uXjzLzK+FMdS31Y6JcAzjBG+Vv+qysaqdD+itC1kKNbmuPSOUJ
         ItNWSjCEpKdnYkxXY5AuMSZZj+I8xSQHAYRCzr7I/6nJy9sQGdC/G6qjQy0BsxnLOu/d
         vIwqoGqvhiBRO/pQHkpqlwab1SNN7sdcUJkrTenGJd1T4bA82W22Qw5bB/LLrdla8Np1
         lT9w==
X-Forwarded-Encrypted: i=1; AKwUvBysxwtCcWXz7tyjzzWnZ1GF40ahsjSKvuMW1IgEqQExjSJ4IFLWEWAZNQIyf30kUho6zpNJntQ98g5Jl0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4Edl4wT9eVwnrFUKB47KP3VjLmoc1tkVo8B0zpxcBLQym9wU8
	IOVE1hXqqfYOrPKK9eZk/wd25OcWpFlEv6O6FjcBAg6+BUUbAXEV8qxnRskNKlZdqmdEL3Tjclx
	2P6JKHsZL9/39bI8ElswldeokFDXvWGb2t50x8Wc0n2N7GESWaqvXDLhZagXqi838SQ==
X-Gm-Gg: AYBFou1st5Pn1WquTxqN0mjqKMAjNOHLpA9w6hk7hjPuvkxmijlfHCAYxwl/Or01OjK
	6rF+lUprKjy3vcKVC7VpxwXcxy6cDuiHGGwk1IbjnREtOdA8OtGizp7SvuufuIFakKYwrW8C0+G
	vWzpfqRs3xlo0CR+X0xFUGJW9tKPQ7jXSe5c0y0Sk7WNP0b5MatpGk6RA9ufUjWKfgMIC2TQmS6
	32+b4TeOn2XV18hvrh/oGSIHfNUgnwcCn7iIjViHPMB3pv9fBIICQw4JZtr6v7b7xA8cT/sjr4J
	yQp7Aq48XYbJ5IDgw2SPPRnS3dsKqpkO6/1++R3B4xuydua7bERfySz2pRzQMcGuVppoveprP7k
	PDi5oXM9p/1JKY9NjRqPKZAnf0sOpt350IstXBFAtHt4=
X-Received: by 2002:a05:6000:25fd:b0:487:342:d141 with SMTP id ffacd0b85a97d-48e5d5986bcmr4042052f8f.23.1793176190922;
        Wed, 28 Oct 2026 01:29:50 -0700 (PDT)
X-Received: by 2002:a05:6000:25fd:b0:487:342:d141 with SMTP id ffacd0b85a97d-48e5d5986bcmr4042016f8f.23.1793176190533;
        Wed, 28 Oct 2026 01:29:50 -0700 (PDT)
Received: from localhost ([139.47.30.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm27541537f8f.38.2026.10.28.01.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:29:49 -0700 (PDT)
Date: Wed, 28 Oct 2026 09:29:48 +0100
From: Albert Esteve <aesteve@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sarannya S <sarannya.s@oss.qualcomm.com>,
	Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
	Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/4] soc: qcom: smem: validate private entry list walks
Message-ID: <auGyfKTc9QnREUr3@aesteve-thinkpadp1gen8.rmtes.csb>
References: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
 <20261022-port-smem-v4-2-b0baf39c6e01@redhat.com>
 <abf21903-16ee-4d3c-8bd4-84ac2c4623f8@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abf21903-16ee-4d3c-8bd4-84ac2c4623f8@oss.qualcomm.com>

On Tue, Oct 27, 2026 at 01:45:26PM +0100, Konrad Dybcio wrote:
> On 10/22/26 11:47 AM, Albert Esteve wrote:
> > From: Sarannya S <sarannya.s@oss.qualcomm.com>
> > 
> > When walking private entries, use the uncached/cached free offsets as
> > the list bounds, require room for a header before dereferencing, and
> > reject a next pointer that does not advance.
> > 
> > Skip the cached list when the cached free offset is at the partition
> > end.
> > 
> > Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> > Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> > Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/soc/qcom/smem.c | 52 ++++++++++++++++++++++++++++++++++++-------------
> >  1 file changed, 38 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > index 36a4a10f3aec..a6732832e2c5 100644
> > --- a/drivers/soc/qcom/smem.c
> > +++ b/drivers/soc/qcom/smem.c
> > @@ -422,6 +422,7 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
> >  				   size_t size)
> >  {
> >  	struct smem_private_entry *hdr, *end;
> > +	struct smem_private_entry *next_hdr;
> >  	struct smem_partition_header *phdr;
> >  	size_t alloc_size;
> >  	void *cached;
> > @@ -434,19 +435,25 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
> >  	end = phdr_to_last_uncached_entry(phdr);
> >  	cached = phdr_to_last_cached_entry(phdr);
> >  
> > -	if (WARN_ON((void *)end > p_end || cached > p_end))
> > +	if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) ||
> > +			cached > p_end))
> 
> nit: i wouldn't break this line, and otherwise the next line should
> start below where the first condition starts

Right. The statement fits in one line so will do that.

> 
> [...]
> 
> > -	if (WARN_ON((void *)hdr > p_end))
> > +	if (WARN_ON((void *)hdr > (void *)end))
> 
> LLM noticed that before this patch, we risk overrunning end, but with
> this patch, we now risk a corrupted/malicious partition ending before
> 'end'. A valid walk always lands exactly on `end`, so the fix is:
> 
> if (WARN_ON(hdr != end))
>     return -EINVAL;

I see, makes sense. Will do as suggested.

> 
> 
> Otherwise my clanker is reasonably happy and I see nothing wrong
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks!

> 
> Konrad

