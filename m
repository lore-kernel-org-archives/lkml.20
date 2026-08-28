Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCF531E82E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927792; cv=none; b=I7t1CoxedBPQPn9zuAa3Ndzz02XXSH2mWHdfvJ0SL+BPBHXop2V/AXu+WKsIxO9n2NnwnrIfQIiCJ57n9pUvVPegvVDZ93sDHZEwtAdRKU7+zV8ACbNy0BsjSYFYARuyNFyIld24YT0u/UPw6UwKxFTVDcqfU+4QyDrRg19v63Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927792; c=relaxed/simple;
	bh=4JiDX/yubXfTIhjMav9YvfmI0tVcsBWXL9wlEHdvhAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l2HVHOJIKVP1i4htIE2nQ2MFK4U3RjFU/Lnqqt2FGiPsLgqNu6COD+9b6ca6GEjiWRi1wwpcjP1fOqXlZa9wTmC05yseISPw8Ou7whCsYNMIKMZpCk6OTGtedzIHwbLM6VpFjgmFeOPoPDEof5xHIffseLX2gVH2W4rCTkh1vgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=F12H2c2U; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=BgkaPEJS; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="F12H2c2U";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="BgkaPEJS"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SEYQwV2228612
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=598u
	fPSbILHNfdSaKUhv0/mnqSbYE6cS+Ejd1n/aDFM=; b=F12H2c2UtXrwM4aiV8RY
	T6eQfL7tPt9zJqQ0qDMpHJTRIQx7uGaXr8PNXlYmtIP4tw1xsinsanB65kvwh6yr
	cJWEGlHk7hbi0+jCkEw+P/O34iplGmfv49C3D1qBwP+Wwyl+lcaVjXbwVYyCayZk
	qyIlyk6Gia5BIiB1ESl6zKVrwigefZhXwWUTyxis/IL0bPrfDUvT9IC9t+p3zqnm
	9dsIKRbVfZ5zPwf//UZ/woAuXC1Z9hwJS8+RkgdjQ5NeqiZH1tvUQUWT8nAWoryf
	aYCSICh+wUlIkDYoWFVtNBPlhDVehUoa1Fy8e76aK0yqkmYKCfhPTrWp60RRKqJZ
	Qw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbb430mdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:36:29 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f0f45415cfso12332226d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1787927789; x=1788532589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=598ufPSbILHNfdSaKUhv0/mnqSbYE6cS+Ejd1n/aDFM=;
        b=BgkaPEJSo1hxlb0zXY0hE+q2wv25R1sExia+G3E+vxBCYikXiW64MFmXlqEbBh4VpN
         5EYkzH+7IWfpvCgcpSyqdkPU5XvDpGDPDFsWSyKxC5n8eADpE8LUZ+xHr5lcN5faC7+D
         kZxpevNKM99Mo2ctCpTQ7KkwbNQ3qe4vxMH2USUU574uKSVy/sIz1iIj7Qt07FoJ/ljN
         RVTjF2kujjYAcE9rsze0xb3gBNRtKOl63bI+keFynD/03vfQvs6l41MH6mbNiYfz+4js
         B3gd93htJIS0zuKxFN7Df63/O1WQc4SxZ3wRIBjmr0E2KpmTMVvXEzsZpvdTav1RAyQP
         3PiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787927789; x=1788532589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=598ufPSbILHNfdSaKUhv0/mnqSbYE6cS+Ejd1n/aDFM=;
        b=o3xBDSD/Urmp4VboqXJgfudKxajJeIpw/TzcaNEgt7M/lS0fwbC0UeghW0Xik4aA2H
         oCjmfIZ744gN/pQsq7Au15EI1wFZMBdCZ67RFVU/uEy/UTaRuTjTPM18Ob/gWkKp1Iwc
         7LE3KY9u8w8AR8QZcjneLtWWs5fXU7KGaqe/moPstdABalUbm/DwriG0nUuBevVtDrtU
         XhTFZ2wb35exxYpKoi6LhawJYl7AyD/l5A9wVoPpMlhl0IZvnNunmXbVTDAz0NCQjx3S
         rTEmB4e9frkD5t6Rcu/KPNHzRd16EatPp5IjxAulmUkgt2Wn2GYLanA2xiScq+RvrrYo
         ryNw==
X-Forwarded-Encrypted: i=1; AHgh+RoniL8zzzWrdz9L7pZ3E2mnSmn6WzQ0YTHlozEhX2Kd6eb/QOL0KExTEDts4javENuMkbLhEHP/x8OxuAA=@vger.kernel.org
X-Gm-Message-State: AFuF++nL8FDLsBBfvUPiJByNP80dGbs8/xmYGSM0Y3P1kyw/xsu5HEwp
	mHh0/NIdqJvLXSDYKsN4YF+S0aTzcKskHhurTyf+6kyf6cUSUEGm8dVSzv2AvJxhPtUdVZNSKvg
	9gF2mH337WsXLMME/VNezD+0SDf7Nf+9xeNrscDZhmpX3QXL7bVhv/3bTu9IP9A==
X-Gm-Gg: AR+sD10n3eAfvFJlLD9+/P9NKs3LPmCcu4foBcPZmd/Vsd/SfWCbNwyK4RSD6RA8FXv
	EDssedNgFsdvJ0NfuHmRhzR5iwQtCcmyf+b76CC8pe/+jYyBVUK+l9/EQcPtJM9QoDmMOSZ9q5t
	EnJ9T3n2Fv5Y61wIQIyIBmg3XE2GY8lOcCmtrIRHtSlfReg41jM6IrU5C53r2O9qXim0VtdKer7
	tCsvfklLRC/HsetyTjdJNkvZnKbTVHJ1AGV5EWBN3y76M4QHJVSMfVDwNFLzJrhVda4UA1zGbfl
	xW6u6UVkXwdyRJG1Is7oBbTUnItgXpO8Css6WmwhneOyvbLh0oo1O4lhRS0qR4HMqvADGPd9eiR
	TA2yoDkWdSQPQLuNZVZd885saG1T+mf/B3n5x0ydXWpRKBHIpV8AeRVYms+qV6LQ=
X-Received: by 2002:ac8:598f:0:b0:51c:805:1be3 with SMTP id d75a77b69052e-52fb96ffa65mr81226551cf.31.1787927788782;
        Fri, 28 Aug 2026 07:36:28 -0700 (PDT)
X-Received: by 2002:ac8:598f:0:b0:51c:805:1be3 with SMTP id d75a77b69052e-52fb96ffa65mr81225571cf.31.1787927788195;
        Fri, 28 Aug 2026 07:36:28 -0700 (PDT)
Received: from ?IPV6:2a00:a040:199:85d9:7dc6:c240:3de1:e554? ([2a00:a040:199:85d9:7dc6:c240:3de1:e554])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20793sm4116286f8f.17.2026.08.28.07.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 07:36:27 -0700 (PDT)
Message-ID: <8da4a2dd-a4ef-4a61-888f-60c611d3f911@columbia.edu>
Date: Fri, 28 Aug 2026 17:36:24 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] block: unpin all pages of a bvec in
 bio_iov_iter_align_down()
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>, Hannes Reinecke <hare@suse.de>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.g.garry@oracle.com>,
        Christian Brauner
 <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
 <20260828-blkdev-fixes-v2-6-32f3f40cebed@columbia.edu>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20260828-blkdev-fixes-v2-6-32f3f40cebed@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyNiBTYWx0ZWRfXye7BYVBLM6Td
 eAxZu7nBmu7okJzo+dTZ7zcM6qwf3O5+abIc2o+QxtzhEsaQPoKL0J0P3ngKb+1N9bLUuZKDSM+
 idmxmBj3Z9KdsWLc0aQEBLF8m3JMN8e29xTgWbX8D2YDB9GKynDvnELItDjC2ZMSa8bOL9cqXMY
 0hL0+EAFCC1YJizpuulDct26YKZcMMlFzZmfPU5ehuq3SaoOHA4l5gKu3wW0y8+E/wf6c2wqVc+
 WcxOVAxhEz/eIqtEDb7dtZj9M7xu+FS0U6tNJYlChdFzV3UpxnpBdOkDgn7pfGypoq4fiH+Dvkh
 Esmq8q+ma8tRh+aXwPwfDjS1b6KBAqPC1GMIVRXCiV/W4f51R4Ku+b6BawyFYCDkc6Ls3l19g2h
 Vm9RC4ipLWPrQXdHd+7UMggYNCChHoD84u8FGlzwDdoRGAhE50wBoRLAIwBgA10BHUr1SVR5igl
 X3XsbNXEbviSZg7TgWg==
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a919ced cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=8X_uEV4oKehs6EEG2ucA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: yoD8jXOcPPfHtxz0GBVpM4BecIiVcEEW
X-Proofpoint-GUID: yoD8jXOcPPfHtxz0GBVpM4BecIiVcEEW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyNiBTYWx0ZWRfX/6ZsPWNTUMSN
 uVR1yPwN8AYK2D72HjgEtiv/EZmvlwsNl5rmRh9Z7T31QoHmfQ0AFmooM9MkiMqQgT9oHoKpMtG
 paY+IYHxkI0xOx+lu6pYybiodP7d6R7E9QWPWtmN+0saBMtnUvrH
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11889
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=10 malwarescore=0
 phishscore=0 lowpriorityscore=10 impostorscore=10 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280126

On 8/28/26 4:49 PM, Tal Zussman wrote:
> bio_iov_iter_align_down() drops trailing bvecs with unpin_user_page(),
> but a bvec built by iov_iter_extract_bvecs() can span several pages of
> one folio, each with its own pin. All but the first pin leak.
> 
> The partially trimmed bvec has the same problem. Shrinking bv_len does
> not release the pins for the pages cut off by the trim, and
> __bio_release_pages() only unpins the pages bv_len still covers at
> completion.
> 
> Both issues occur only with a logical block size above PAGE_SIZE and a
> large folio backing the user buffer. On a device with a 64K logical
> block size, an O_DIRECT pwritev() from a hugetlb mapping that ends 16K
> past a block boundary leaks one huge page per call, whether the
> remainder is its own bvec or the tail of a larger one.
> 
> Unpin all pages of a dropped bvec with unpin_user_folio(), as
> __bio_release_pages() does, and unpin the pages trimmed off the last
> bvec as well.
> 
> Fixes: 20a0e6276edb ("block: align the bio after building it")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  block/bio.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/block/bio.c b/block/bio.c
> index 898b2f5ef8c8..48fa6b9a6dba 100644
> --- a/block/bio.c
> +++ b/block/bio.c
> @@ -1196,6 +1196,11 @@ bool bio_iov_iter_set(struct bio *bio, const struct iov_iter *iter)
>  	return true;
>  }
>  
> +static unsigned int bvec_nr_pages(const struct bio_vec *bv)
> +{
> +	return DIV_ROUND_UP(bv->bv_offset + bv->bv_len, PAGE_SIZE);
> +}
> +
>  /*
>   * Aligns the bio size to the len_align_mask, releasing excessive bio vecs that
>   * __bio_iov_iter_get_pages may have inserted, and reverts the trimmed length
> @@ -1205,6 +1210,7 @@ static int bio_iov_iter_align_down(struct bio *bio, struct iov_iter *iter,
>  				   struct bio_vec *bv, unsigned len_align_mask)
>  {
>  	size_t nbytes = bio->bi_iter.bi_size & len_align_mask;
> +	unsigned int npages;
>  
>  	if (!nbytes)
>  		return 0;
> @@ -1213,14 +1219,24 @@ static int bio_iov_iter_align_down(struct bio *bio, struct iov_iter *iter,
>  	bio->bi_iter.bi_size -= nbytes;
>  	while (nbytes >= bv->bv_len) {
>  		if (bio_flagged(bio, BIO_PAGE_PINNED))
> -			unpin_user_page(bv->bv_page);
> +			unpin_user_folio(bvec_folio(bv),
> +					 bvec_nr_pages(bv));

And right after sending this, I noticed bvec_unpin()...

I think a cleaner solution is to move bvec_unpin() up, make bvec_nr_pages()
handle bv_offset > PAGE_SIZE, use bvec_nr_pages() in bvec_unpin(), and then
use bvec_unpin() here.

>  		if (!--bio->bi_vcnt)
>  			return -EFAULT;
>  		nbytes -= bv->bv_len;
>  		bv--;
>  	}
> +
> +	/*
> +	 * __bio_release_pages() only unpins the pages still covered by
> +	 * bv_len, so drop the pins for the pages trimmed off here.
> +	 */
> +	npages = bvec_nr_pages(bv);
>  	bv->bv_len -= nbytes;
> +	npages -= bvec_nr_pages(bv);
> +	if (npages && bio_flagged(bio, BIO_PAGE_PINNED))
> +		unpin_user_folio(bvec_folio(bv), npages);
>  	return 0;
>  }
>  
> 

