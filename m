Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ACD3B6370
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788017897; cv=none; b=I91Iv3s9CSAUHXBoKkPS6KjquWbtcHjIMLiY1K4XqkVIpdqFtKgQodDuAMbgjvQpfM4Snb1GFfxko15QTfywZudtX5LEVW31fEF77wpuKflGO3wCTNzWo5tElSLqF05EHvG636D2NvAMzJI1O89JT2u+1kBbwYuOv20ICp+pizM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788017897; c=relaxed/simple;
	bh=xxpR0ksxkA/ONSsugSlrSih0kyNuN6ltaN0MKPNAGsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cn1SNEK6mv9n1Lkvx2uaJz2AKbh+tsC8uNte7mg7LG7StymoMOBr22IZl6qXKVGTr7f8mrG4LF4Wliq7b4e7+6l7BafyuvoyOfdSqz1B3AS1PEwnEF3dbV1fbXmK6liHABnVPnoay8/MULWnNMs2WT/GBK8qD4RvkAMPpYBlBxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Gu2zFIuG; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=0ifOm1MR; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Gu2zFIuG";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="0ifOm1MR"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TEekD22274143
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=TFVW
	lDwfNWxgPSj86otvED5lH0a6QKBTMoQ7ChKGCcU=; b=Gu2zFIuGUDCk+rJ2VDBk
	70a9GXKIRmd3CKMeiyckWv/D5MP7Zgaj/CA+sovdSkrETK1IrJb2qFnGnQEaNT3S
	N9KtoDtS2aWLMgdaZS8EG79pcfDMQu06yKTxqcmPhJVJAftER9ykGtp1pbja1UeX
	kUFeO1YwKQdpDr1sZdsz5l4M5OOqmQkrZTmdrHduJ4FxpamhWS1IQq9E37/oh+3q
	nZtzyUcZ5SRVAnnPNjuAJxQT4FXqYOGakyKLjlrLX5KwZ+Imu1kdoq89hPFZ5bjm
	jEkOlYV+J6fGeVEAdtwq+7wZe5VJJ9mAqHAPx4qs90lyy6hcLcj/IAjQH5/0tLN2
	0w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gbree28w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:25:58 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d827597fbso23363551cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788017157; x=1788621957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFVWlDwfNWxgPSj86otvED5lH0a6QKBTMoQ7ChKGCcU=;
        b=0ifOm1MRHIokQoCLKKln9UwJX05fY5zGsha7JGzt1uRIj5LpHZaY208S+c6YLJrhmW
         7zrHiU5LzWrRkkA/u0CDLUIIUes1o41ewruui/mSKmFAscYE9P3IHGUVdfgsKp0ipRj5
         fdTKzjRzuzmVxu3M/5aRTmreeesVBV3CmhyG5O6whHEq7AXT0CPHEQASpMdpsBiVtTyz
         sgxEKXbRINQ9Aq2hb5ZWOFuMqQErL7V0DBSbyJ5peU6qQHMKBSu5Uz3+e49r/ygyzSP0
         ej37DLE+c3+tw4I8GQHTxKtbyvCqGVSAlHIHptqSklT3T7M6Jg8WVnu7DSs4MMF98xk1
         zkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788017157; x=1788621957;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFVWlDwfNWxgPSj86otvED5lH0a6QKBTMoQ7ChKGCcU=;
        b=GSQ77UeUYXpIed0Uh5bIdqu13b8qw61jK8tfL3EsXIMe+SvopwPlHGgfQc+pveA+rZ
         1Afk/4j0RfYxk5212CUwzZNyU7MQ5JoV4/0VE2oo2b5b5r4xkEbXo/yA0kmEP8T6pH8r
         hKrdFYXB2jJw/Y8j0iaYodqwfJ8pFvBUYowJCwQmZ77AyP0gIGLIn4vNLfnhq9Kp80IC
         +rLTEs1xGtLggRjiCUK0j64Y23qpaRLtxfBCVxaa9dXYch7IdvzewZdJGVQ1ueWoxvwc
         fq4nR6q5t59II+A7gR4W1ZDbidZ4+1GBA7pNYdqRVATCGaFq+eJp9LyqjT6Mc5jQYefT
         UnUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTjKu41xcIvvPdXznN6KzB5atyPGpMntbzUjcPC+yv+99dU2a+FF8inTH9mpg8YQ4APPiSVV6y/+BWgYI=@vger.kernel.org
X-Gm-Message-State: AFuF++lU/DlLhkzdY5IlsENoQJuLHCkmtuQAQ5B4+IIY9Dzy6+qifpN3
	kPPeA4bCe6uPhPSXetJu7SUtRT/OVQSrFUaw8CfZ2oLFbvoEMUfCQbommDg4YurtoETsluYWVhp
	jGH6b98S7voaLSLkTYCn+I0VLgJ4I75+y1ntQ1NACKlaLO/ft8+PzeQIvDnKifw==
X-Gm-Gg: AR+sD11jYlDTxRSu6L95HqLo/Qq/ZzNRNkcePfFoVGH0gucNduAKbq7WBlwhirxrsno
	BL6xCdCORRQYCWW/5zNyjM4BMBJU9Os5AcpnRum/sT9lmkyOzLRfkA+jTsUBMeDlRh8gUFXVOeT
	uqtuE7A6gcKQRZpH6eDy7O4x4/FmOKk7ErEZ11gSOc5boCMMSpYThOEKnI0299S/VGmjtOHI72W
	oRKCbQJw5Lr4dDxrD9NoD5b6RT780Tyapa1GG/Y49k9CPIOA4LDS8GNU/YiLHt5j4IqMwXJd53W
	N9hydn6pnTY14Hk9kqP0N+22fvPctXFnbeVVJ/c6bwyJfP5oM0vaDS8Zc3/uk39gdYYFTVDALR/
	jcJ2iLmw/NFjV07nDh3CbMxObsUV+SnyZaHzmv9AZi/BeAuE=
X-Received: by 2002:a05:622a:95:b0:519:8998:661b with SMTP id d75a77b69052e-52fb9640d64mr173116461cf.20.1788017157655;
        Sat, 29 Aug 2026 08:25:57 -0700 (PDT)
X-Received: by 2002:a05:622a:95:b0:519:8998:661b with SMTP id d75a77b69052e-52fb9640d64mr173115921cf.20.1788017157157;
        Sat, 29 Aug 2026 08:25:57 -0700 (PDT)
Received: from [192.168.0.175] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca1ed292sm84339685e9.8.2026.08.29.08.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 08:25:56 -0700 (PDT)
Message-ID: <6672b30b-427f-45ed-a172-4c47a63d2c7c@columbia.edu>
Date: Sat, 29 Aug 2026 18:25:53 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] block: add task-context bio completion
 infrastructure
To: Barry Song <baohua@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong"
 <djwong@kernel.org>,
        Carlos Maiolino <cem@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
        Christoph Hellwig <hch@infradead.org>, Gao Xiang <xiang@kernel.org>,
        Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
        Jeffle Xu <jefflexu@linux.alibaba.com>,
        Sandeep Dhavale
 <dhavale@google.com>,
        Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>,
        Dave Chinner <dgc@kernel.org>, Bart Van Assche <bvanassche@acm.org>,
        Hillf Danton <hdanton@sina.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-erofs@lists.ozlabs.org
References: <20260730-blk-dontcache-v7-0-3e8e6850068d@columbia.edu>
 <20260730-blk-dontcache-v7-2-3e8e6850068d@columbia.edu>
 <CAGsJ_4wUvLoKGafR3U-ji1kUUaz6K_QdN6QxMT-apSaO5tXp0A@mail.gmail.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <CAGsJ_4wUvLoKGafR3U-ji1kUUaz6K_QdN6QxMT-apSaO5tXp0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDEzMyBTYWx0ZWRfX6sxrTTzLmv5b
 QsZJR7amEFdnMavIYCWUfZQsK691TOP3fiWeY92N8u2zgp/YQMo3IPfYzEL3FOJjgJ6ugq3JXKS
 5yLixd/ROicWh8aQ1xpnBrIpedhfAWq+x4NLLMJ3TuAFPEmbDajW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDEzMyBTYWx0ZWRfX10WxR1rCOBKl
 5tH3SFb9M+6pqX+Yczp3K5R9Qd+g/LZprlRjRzRDc7/JBC4MtRn4kUwFqPhU+jjxOn6hSotGtAA
 aDA0F0y7hpgd/vnaCG1XV0vI2cVNm8cqgXYa7Z9v+NyrAFzvHvLGh3UMMztBjSakw48C4z993Eu
 2VBdCHfWkzc7pj1w5+rFB/vpJ6KtuTPKXWUXMEu3pvRosAhBMW9p/Sx7IMRIZDJE3rtMknvRbqH
 41dNtrD+BiWn+ZLlgcw6Jn4gjh8IIMYpTAOt4X8rkytOuCpYAgnzWJAuGroOc5qtTY+LEIDLGL6
 yJgTNdOD5Y2+/nJZw8afPu4VrNXFwEzauna16k/tMsRmcKVD5CqGy9ul8QQyXeS7NZPoJ8a3S/h
 eFsQBGlFrXvMrSKSKBDuMTDsX9t4XFVxpwJ3qSHfz2aLud3A0uxB/q5CLCZZP7J9jxwhTSbaJIh
 1U0b84EnEjUYAlRxsZw==
X-Proofpoint-ORIG-GUID: mpwLiUKnXs7E_s3jj8uCBh9DiPGtuW6D
X-Proofpoint-GUID: mpwLiUKnXs7E_s3jj8uCBh9DiPGtuW6D
X-Authority-Analysis: v=2.4 cv=JtHBas4C c=1 sm=1 tr=0 ts=6a92fa06 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=bN2RZfqcuyHWyQBaeeoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 bulkscore=10 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290133

On 8/16/26 7:11 AM, Barry Song wrote:
> Hi Tal,
> 
> Thanks very much for the patch. I’m just a bit confused that
> folio_end_dropbehind() only requires in_task(), and nothing more.
> 
> void folio_end_dropbehind(struct folio *folio)
> {
>          if (!folio_test_dropbehind(folio))
>                  return;
> 
>          /*
>           * Hitting !in_task() should not happen off RWF_DONTCACHE writeback,
>           * but can happen if normal writeback just happens to find dirty folios
>           * that were created as part of uncached writeback, and that writeback
>           * would otherwise not need non-IRQ handling. Just skip the
>           * invalidation in that case.
>           */
>          if (in_task() && folio_trylock(folio)) {
>                  filemap_end_dropbehind(folio);
>                  folio_unlock(folio);
>          }
> }
> 
> But we’re applying a much stricter check with bio_in_atomic():
> 
> +static inline bool bio_in_atomic(void)
> +{
> +     if (IS_ENABLED(CONFIG_PREEMPTION) && rcu_preempt_depth())
> +           return true;
> +     if (!IS_ENABLED(CONFIG_PREEMPT_COUNT))
> +           return true;
> +      return !preemptible();
> +}
> 
> I feel like something may be missing either in
> folio_end_dropbehind() itself or somewhere in the
> filesystem/block-device path.
> 
> Do you know why they don’t match each other?
> 
> Best Regards
> Barry
> 

Hi Barry,

Apologies for the delay.

As far as I can tell, the in_task() in folio_end_dropbehind() wasn't meant
to be a generic test for if it's safe to sleep, but rather filtered out the
known unsafe case of buffer_head writeback completing from IRQ context.
In contrast, the bio_in_atomic() check needs to be stricter since the bi_end_io()
callbacks could sleep or the callers could be holding locks, RCU, etc.

I see there's some more discussion about this at [1], but I suspect there are
other instances that are (incorrectly) using in_task() as a proxy for being able
to sleep (like f2fs_read_end_io(), but I haven't looked too closely at it).

Additionally, it probably only makes sense to use bio_in_atomic() when there's
some deferral path, since with CONFIG_PREEMPT_COUNT=n, it'll always return true.

Thanks,
Tal

[1]: https://lore.kernel.org/linux-fsdevel/20260829121335.3491374-1-qwjhust@gmail.com/T/
