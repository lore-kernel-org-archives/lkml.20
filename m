Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794390979;
	b=2gdgFI1seudaFtutDLcsyV2V7N3bGIvBQnPR6CKpZ5GUg83bwEPYdehJKKTzulFws99q
	 WX4GEg3CjoB/tmJs3Uxmpj+wkptFA8nmVQQ51hwG8fFqQ4RfHl0uFRpxmUzPIHA009Mrs
	 nFmAPlN2S1OGwGCtA9Fv6OjmHdZXfaLfYj0tcLx4TjBJm4xTsAjwih+Ho08wTok6HDn0d
	 wQLCd+HkH2/+SWawQjV6hR9Tj4XIHtzxMJcCTNecdOTBA2IJqkx4YxaxtdOEsUut7VeER
	 JX1ePd4Uh2TeClSnoLRXPuSGJovKtj8fKyFDOH9GAE9Ry/5ZsP3m+Hcu955IcvHNE3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390979;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=LJaA6HtGKmrxTdDdOmAvwarGqI59rOjtDYGgfbVCI0c=;
	b=Wu3YzJM5pna4tNbnMkCQ5CJ16hpECDXjBuvZai5DOQWVGRmkx1dtVZIetuJTla799ezD
	 5+3jDZkogJTyxLw2Ufh+D1VIDw27QEN03oITnuRY1SVpN65CNgWMZLcIj4OqyubDEWG2q
	 5m9MjvkyhkQUIkY15NxI0GeRCVmIFlpvI5Duv2v40LGXt8y2WfkCzuoxvSeRQTWL6Tfso
	 2rTtjbczll05TmTfu7f2qXAjCuofHn5+DRQ6VUlHXwbmScEr27imJzl5QFmZIPmDGlOVQ
	 yJLwtMy9KtBTVaJ+0SdibFgVvrCwDoFzLd15FJcO+UCeyElfmwVUxKp9197oKm2Xnmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=NPO9Siu5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B7D606A335;
	Wed, 11 Nov 2026 09:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B7D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=NPO9Siu5
ARC-Seal: i=1; a=rsa-sha256; t=1794390959; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=af/0lRDissNzwJALOr/P1m/GFsSM74WEEz4Cm4KkV7VVzRmKU5VNWaGjvZfLocobjdKpGwRe4hBP66jYNTaZzyWNZOnpfCsMGuEqhu48dSBM+tL+UeyBNMeKtj+7gKLaWgI7BiPg6lnZCc51vi5zb2yP9JfCWMdcPCuRQ6qhZps=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794390959; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LJaA6HtGKmrxTdDdOmAvwarGqI59rOjtDYGgfbVCI0c=; 
	b=SIrxzL+TMeUZeg9ZuVUj9Itep1BPqVpRmdyJ9IAtZmh/sW6IOqg/mfpuvf2278wrN4Tt748BrshkVn0U8WS14l3489aoOVQ2c6UVgM1A6wZ55o32r+VJbiCG1Xs1HZmCEtKqFRySGjTGPBbKUe7VLT8MBt2v/D7gMmrc0Qklf+M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=NPO9Siu5VR34VfGZ6i7tUOjD1JcuFY6w1SejwYzSb81YgEAvz2dPhKUmWrpPmGb/BAv6lPJ6IXG+G36YhxgTvoJyyTn1yKMo5n49WQNZfMP2rHcXnOQeD8LlS6IbnGx0eHampwEZUbJz4qtbtdhLSjJeav5SEQAA6eBFGrWS2lQ=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=LJaA6HtGKmrxTdDdOmAvwarGqI59rOjtDYGgfbVCI0c=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179439095914522.51825314890425;
	Wed, 11 Nov 2026 01:55:59 -0800 (PST)
Message-ID: <e76c2d98-b543-4a3e-bfa2-c0e6e27bfe4f@collabora.com>
Date: Wed, 11 Nov 2026 10:55:55 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: rockchip: rkcif: Filter enumerated formats by
 media bus code
To: Faizel K B <faizel.kb@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org,
 Robert Mader <robert.mader@collabora.com>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-2-faizel.kb@gmail.com> <avG782VCMTWTNax0@mdjait-mobl>
 <7lkixkkeumy7l32usxweltclro5tqhgiio6xjyiyx45jnsq3lz@dx43ee4u6ffq>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <7lkixkkeumy7l32usxweltclro5tqhgiio6xjyiyx45jnsq3lz@dx43ee4u6ffq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi there,

On 11/9/26 20:54, Faizel K B wrote:
> Hi Mehdi,
> 
> On Mon, Nov 09, 2026 at 01:27:34PM +0100, Mehdi Djait wrote:
> 
>>> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
>>> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
>>> @@ -395,13 +395,20 @@ static int rkcif_stream_enum_formats(struct
>>> file *file, void *priv,
>>>                       struct v4l2_fmtdesc *f)
>>>  {
>>>      struct rkcif_stream *stream = video_drvdata(file);
>>> +    unsigned int i, n = 0;
>>>
>>> -    if (f->index >= stream->out_fmts_num)
>>> -        return -EINVAL;
>>> +    for (i = 0; i < stream->out_fmts_num; i++) {
>>> +        if (f->mbus_code &&
>>> +            stream->out_fmts[i].mbus_code != f->mbus_code)
>>
>> what about dvp capture. The dvp_out_fmts[] does not have the mbus_code
>> set.
>>
> 
> Thanks for the review. Yes, the DVP case is missing. How about only  
> filtering the formats that have a media bus code, so DVP behaves as
> before (see the change).

This sounds reasonable.

> 
>        const struct rkcif_output_fmt *fmt = &stream->out_fmts[i];
> 
>        if (f->mbus_code && fmt->mbus_code &&
>            fmt->mbus_code != f->mbus_code)
>                continue;
> 
> I don't have DVP hardware to test with. I can submit a v2 if that's ok.

Looking forward to the v2.

Best regards,
Michael

> 
> Regards,
> Faizel
> 
> 

