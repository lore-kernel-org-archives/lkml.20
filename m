Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254044;
	b=hqnuxYEDZ62320lsEP+ZL6fCckcLLt0KTSXkNFWaFa+0ur9bk2JX7ZBC2if3VYgCY/KB
	 1pGV11gkO8hFRyn3qJn3WsjP5uWzraiPkrB658wuohYSOG79RMIc3rJ67/4uZ7Ub1BW4L
	 i6aQd/Xnuh+vPZ1ss9A1UcbdWtxuUE6vIa97ystxBOrpSwri0vBGcwtWv4JafbXlxpCPY
	 kenUlngQ3SbpBmmJor4G8wXKEZtXWv2nP02KzrXzEioI2mSyeZe4h97aGgcB0Rh4djP7j
	 VxcNkBwAOzKU2wc3uDWJXK7790q9nJrYr5RKDkpS7w1dq+PLGJdXBq9e7fisDMsd2Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LvIr1VbcR88AmSo6q8l/U1RONWTkl4N/HGRhgSELxqo=;
	b=dcunm580KQ0BOgSEdtS15Wjr8VbDTreku7E0/2+2VzAsfaNB8v8JiSE7xPLrdv7w3TfU
	 eM+0bRu3jIZn2WjqqhtbR0Z7LiJCa2Prx7zTPnouyVIr9F+xsaiE4w9S5oLVTSb59vvnZ
	 5BRcT77wDi+l26syGSVWhwUzmdvp29nLId8IwI0t6yVHKMdC3PnMlOjZy9MfbYnNWFTPj
	 ahu5QiiRhZ+dsfbZB3CEb9dIASSsv3SVH745u4DCSPA//k337SR/ByuQD01epHeyCqbg/
	 aZ7UB4hHI26HuTuVXqIWGykEjbYrijPFwR1dfC/CxUJAZQtYn1s+/GjIn0IcU/ch79g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vU2RbX1K;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F62606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58F62606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vU2RbX1K
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b094fb376cso96946a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254044; x=1794858844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvIr1VbcR88AmSo6q8l/U1RONWTkl4N/HGRhgSELxqo=;
        b=vU2RbX1KNB++JRS8PSAZh4kT9w9Owg+rjol4q5qGNZTgT9AqxmmgP3iLx6IOOIHbbj
         o5RlkayUmRlWx6cnrnbBamZgM8Tmv//ZnZ7Gip2MPZy7AJchFyOwLUdrjNUKWtbXIIz3
         Xtf3AA5/8faWZKm2ExNFgFl8YQc4wSPLkDgh0XvF15DV2fOmh5sIMiv2eMuFTh4U6ECj
         qycNtxv7xy2HitKfxZQWmO6GPeup/o45hhDBBBMSs31Ep2DplyOYhVJ3Gw6xnYRrnwM8
         dpakWMX1xmVb4EchONT4hXSkkfjg4VGCsfzI+TWXPcA4y4bragEF5Y2OTVs3zdySs6kx
         yLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254044; x=1794858844;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvIr1VbcR88AmSo6q8l/U1RONWTkl4N/HGRhgSELxqo=;
        b=JFYDyu/fXbMR3X4UgtHmMiaITROSnvsC2XXcNzIdGvPwwtk8FTe4f5PLum23dUHjDJ
         FN15/pNbanrMYwwBGccImKikHJVQQsmeyR2rK+Aw0xSvUyKFsVSPE9MjH8EqnFV1soV4
         tDONcdBkyV5rxXa3XCm7w8KLyaLm0VNAZOx9uxK9Q+Yg31ZeBLS/k1BJ1QsgYCc6uOIT
         y3d4esZBkSqfYFAMw0fKXQxmegeBoGEK9xpYsMBTe2uHCtQn4DLxto1NLZOLcBUIrDEh
         vRb92hUNNCjNNkVx1PfiOY9spQyfejHlGmDAnGPSEwnd3bljzl2hTol/wBdEIbtDh3WB
         ziNQ==
X-Forwarded-Encrypted: i=1; AL+hErFDes715Mf+ICL7X/8BSekYm26ZMLvKbCTzclMRXoH+YF44l7zMO9AosASywm5Tk36X4uHxxmXy6tkZf4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QuF2AxHInIMIAWb17KQ4cXwGMoe7DNu7wkvW2pLK79yEAdlRt
	/oLyBfUn93G9sVDXHV0+1oDhCUgdbabQEEXKWlhGsiJeixjwzXaI3BbLq6nwY7T4
X-Gm-Gg: AYBFou2+c5DAK+0s7OX9VVCP0wvXkbicWRJblIwLcHcIr/GuJuxxL+bNApUpocCOk6v
	1y2K6/xINq2sXRGtZ9yJOefkrGkG+7pFvfy/d3oJw2nEjIyMW8jSiO2C7e80u2yWG3+wTyR2vFm
	ShoWohubDD7auWzGYHqk6h4XCxSslK3sZviIHVdouLsnNU/2lDIQMkxJLKAUMGdIknEVOHbXkQ+
	vBVVdXzsiP/W7Oz56dNnbFJYkc+6Ksy+DDXUTlWDragHjOf2UQdCRxvKOy3mV5CCfuX4754lQeN
	WgsnjZf//yplGVxB9EI18H4kerkj1a8kTKKPF+ZwkHWsK2XnijYn+3NhmrY6no1Ne5sKSrTAguP
	bWxwRPvz8INh2kYWRkCUn+1qDO/O5geKoKeG71Y9FDdkXlj3XiF0fAataO+ZrTaZmTkLCkXKnS/
	b64RsmOJvL9ziMmZjoYGsmkl9XHRtoZ+VQTyQQH/C/8yXb3f6dw2Q8XZeg+YIxtnfMRnsAVQLQA
	2NJ+b4EfCKuLd6A9ZRm3yRHZVsnTBpmnWT66kq5BFv+iyWtbU/njyMLMfm0chgkF2CSPc7LDVWw
	owrs2LL0a+BFQAaqoZxSYwRNO+d8LiTrYupbPmQy3wBt+AWNpplzfXD7Ww==
X-Received: by 2002:a17:90b:3c09:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3b166add45fmr1297126a91.0.1794254043528;
        Mon, 09 Nov 2026 11:54:03 -0800 (PST)
Received: from FAIZEL-KB ([2001:569:52f5:4b00:4b92:5a54:3d6f:1e5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1690f4733sm134974a91.3.2026.11.09.11.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:54:02 -0800 (PST)
Date: Mon, 9 Nov 2026 12:54:00 -0700
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org, 
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH 1/2] media: rockchip: rkcif: Filter enumerated formats by
 media bus code
Message-ID: <7lkixkkeumy7l32usxweltclro5tqhgiio6xjyiyx45jnsq3lz@dx43ee4u6ffq>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-2-faizel.kb@gmail.com>
 <avG782VCMTWTNax0@mdjait-mobl>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <avG782VCMTWTNax0@mdjait-mobl>

Hi Mehdi,

On Mon, Nov 09, 2026 at 01:27:34PM +0100, Mehdi Djait wrote:

>> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
>> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
>> @@ -395,13 +395,20 @@ static int rkcif_stream_enum_formats(struct file *file, void *priv,
>>  				     struct v4l2_fmtdesc *f)
>>  {
>>  	struct rkcif_stream *stream = video_drvdata(file);
>> +	unsigned int i, n = 0;
>>
>> -	if (f->index >= stream->out_fmts_num)
>> -		return -EINVAL;
>> +	for (i = 0; i < stream->out_fmts_num; i++) {
>> +		if (f->mbus_code &&
>> +		    stream->out_fmts[i].mbus_code != f->mbus_code)
>
>what about dvp capture. The dvp_out_fmts[] does not have the mbus_code
>set.
>

Thanks for the review. Yes, the DVP case is missing. How about only   
filtering the formats that have a media bus code, so DVP behaves as
before (see the change).

        const struct rkcif_output_fmt *fmt = &stream->out_fmts[i];

        if (f->mbus_code && fmt->mbus_code &&
            fmt->mbus_code != f->mbus_code)
                continue;

I don't have DVP hardware to test with. I can submit a v2 if that's ok.

Regards,
Faizel


