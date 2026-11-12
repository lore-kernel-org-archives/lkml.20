Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464431;
	b=gjnKmsFNCFQLYPgJZkNMqZrInejSqwzNSIMjAKWwUnJGKemWKOF+rvmyGnigOTeN+084
	 NQkk4S4UlIPaJ2CiRjkvtvS7vChbCOiY8JaAInSuUaKYKGCNfmyHXM4zvvqlQXDqhnRM/
	 nDlQ2pUJIvTgBgPfcXhGPpdPBK3yOu0M+DSCu1ZVKi+hmHpYqEVj4Z+i5MP5UtaOk0P1a
	 0Yu7GszTLHqVWAFvV8S/uqoVXFYJC+iSA22k0NDMi/hSvGmzVx252e5R7FTHKtE82E484
	 UcKamjHpGG1uqQIuDPf2hFVzXOy0UKya4ND34i7900S0/Ligy63A/Kuc56izqGb1CjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6RXE7MpOiitHrkFdvkSuFI10OAvTxEYbjLQMQzqwPMU=;
	b=NB7c52tnE2yfXuVKMWx2IRXt6lnxRbChlepNK/mQ4HQBACQ/frVZqBDRpt7mwdNHG4vj
	 DbTJGk49SYe4Y7ssZgdHKpSWMM+a+Vefnzx6KuPEmTVIFaPKnoY3in0hitkY4nCbgnFeh
	 kmMib0qORFKbpBoNldok944o56oA9w9T7bWTY9cUEWYc3bsIZRVoJ6ZecMM2homjTqx7x
	 1rYqSJiy4h/OXNHozBJaFnpJoQXVyBo95zp3ZbEGxjiBHIC17NbLrztFrh3lGBnv9Y404
	 lGkI6d7Gj1cAw2A/Apf0CRvcH1HW06/32kmkjSk8U3n9R4arIuGybxcQjui3Mcgc6Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tn3YF89A;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFD8606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFD8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tn3YF89A
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8bd6ac32564so76855b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464430; x=1795069230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6RXE7MpOiitHrkFdvkSuFI10OAvTxEYbjLQMQzqwPMU=;
        b=Tn3YF89A2O78gka8b8IcTXQagBvYm8NStwBvLNhOWWTtaqlnIA7An0Do5Yy2qlzX81
         DZnJQz2o9zjYh7vhaw2wkiT8vL6lQqEvRxncXuRZbBd8qvq6hAwC+gmv4cCGzCtoaruu
         ZN2CP780HdJqUInbJ2DDdj7tgj7RY6X/WGa/wFm9S5Cgsm19rU43VhWw6u97u9rq7FIX
         IZwjVIN4G2CVQidzd1SCvztbMUFot6xndRhjqfpyT+PNr/MkJIe17DGfkoQeOF+RmFBx
         jlKFW98pgI+NURBPqVQGHDhvKody1G6QIVZypdSbQmSDNmT0P3/FH5rRJYWwsrFoG3S0
         zbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464430; x=1795069230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RXE7MpOiitHrkFdvkSuFI10OAvTxEYbjLQMQzqwPMU=;
        b=aloe23nL/D7YYOisXyP1E4YL8cfFWsoAljnuvscrSM/XKNCIUiSyL4PH/DOsBa2YDb
         ridCw5MD4SyXeJedSxC7Rqctfci2Nz9EKOjcWmXkQCE7I271EDz5576V2LJOlvpJdvue
         IdI7kmojPwMxeuToCTpjj1iCfpZD1h+iHi9tOdiZCF8mjmUrA1a2qJ4Efj1nysja1MCx
         LcypaU7vrwIEy8H/Cfzr36NjFJumvyr68l6jtwmebrlvxgmrnAC/ITFl8JLp3zGZcuCK
         bbhLn+v3Qv81xX08jEw8kCthqsO8RG+kswDelyYfyDjbdEoo2zQV32RUvoj4mETVxZj3
         14dA==
X-Forwarded-Encrypted: i=1; AL+hErFbOHOOP6egXv3aMFrnHPpWd1FBTsUS+oN+0HFNkspozYaRCtGKOuEqCZl1oK8/8qIhHk65lzdIrJCuYpg=@vger.kernel.org
X-Gm-Message-State: APuU4Z//MHLC4F5jYUpli+KNwORQsE51LPJCWP9Kefu0bIx7GqF8JDAa
	FifhsRigpNkdvIA6oVC1ZBiarARab91rbHaju5Omm3F4yk7oW5a+cfEl
X-Gm-Gg: AYBFou1/SDa5Dk8ii978831XoRbP2PKncKEHxaDAxHldOzqC0sgAxf9VGMm4DEiUwXA
	mgnETqpNVUFSV8wBeL2ebUwijQnlXBB/gHSopC0a7sM8jiJZj1h67W2qYQO9UqoibOxWJCeq3+8
	ToGSfNGtR+o7YCjX5xsnfF+rMSv2lHwbvTspGkjELx/+3aCESqKZ9Qs9ztVCesiKOBjUQBMGbQd
	slPzCZtwa/WcT4UmijV/br1FIrkEMujC/8J3L55EpWuJOnXu7lDrQrRTJ4Llq7dn0Dr6RGLSckX
	Eq4c7kAJUVO5suvAa4UFKgyblYC9ecuy+v9PQcdY68745Si+HZq8QJEAwbWTcbvPLkidVMPcRK3
	VKH/LMt3cRhpX+GfWr4H7r5tIFNIwOZrQb+b7bpKoBbGaB31AIWG9W4wZx9R5YEYiEYvpykaylZ
	TQERzn5oOz/RTy0TK0qYW+7+nyKAE8hvXX4CJqGBiHxXNNAD8LC9gKPV8IpUk060iO1vgy/ZnbP
	6yDat32arwOtUOBboVr0MQEu4+tuxhcctu1uZcb93iefpe2QnTCpCSJJd5xpqj6prtphDCkyS1S
	Isi2VLLIgceKuU1OZ6rVfxzdrxCkZDtXfCrfnQfO4qVRRhXw4Y6MuDSRjBk=
X-Received: by 2002:a17:902:ef4c:b0:2df:8ab7:fe3a with SMTP id d9443c01a7336-2edd78c45admr80762355ad.4.1794464430262;
        Wed, 11 Nov 2026 22:20:30 -0800 (PST)
Received: from FAIZEL-KB ([2001:569:52f5:4b00:3fec:b9ca:ef85:7998])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7bf55sm28202185ad.30.2026.11.11.22.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:20:29 -0800 (PST)
Date: Wed, 11 Nov 2026 23:20:27 -0700
From: Faizel K B <faizel.kb@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org, 
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: Honour the requested
 bytesperline on MIPI
Message-ID: <fxrwhxkzgihpiz52rbeuomtqkzz7izgdfcbux7osamqruc7w7u@qhvh3nkqypro>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-3-faizel.kb@gmail.com>
 <51b09428-9d10-4f36-a811-a681e479e45e@collabora.com>
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
In-Reply-To: <51b09428-9d10-4f36-a811-a681e479e45e@collabora.com>

Hi Michael,

On Wed, Nov 11, 2026 at 10:46:43AM +0100, Michael Riesch wrote:
>
>Come to think of it, TRM p. 2111 says for e.g. VICAP_MIPI0_VLW_ID0:
>"Virtual line width of even frame for ID0 path(must be aligned to double
>word)." which I would interpret as "it must be a multiple of four
>bytes". What do you think?
>

The VICAP register summary defines it.TRM part 1 (V1.0, page 2081)
"DW - Double WORD (64 bits) access". So 8 bytes.

>> +static void rkcif_stream_set_bytesperline(struct v4l2_pix_format_mplane *pix,
>> +					  u32 req_bpl)
>> +{
>> +	u32 min_bpl = ALIGN(pix->plane_fmt[0].bytesperline, 8);
>
>Please add support for the bytesperline field in all the plane_fmt
>entries here...
>
>>  	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
>> +	req_bpl = pix->plane_fmt[0].bytesperline;
>
>... and here.
>
>>  	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
>>  	if (ret)
>>  		return ret;
>>
>> +	if (stream->interface->type == RKCIF_IF_MIPI)
>> +		rkcif_stream_set_bytesperline(pix, req_bpl);
>
>Why is this restricted to the MIPI interfaces?
>

The MIPI formats all have a single plane, and the MIPI path already
programs the line width from bytesperline. The DVP path uses the width,
and I can't test it. But I agree it should not depend on the interface.

For v2 I would:

- take the requested bytesperline of all planes into account, and use
   the largest for all planes, as the DVP has one line width register
   for Y and UV
- compute the sizeimage of each plane from it
- limit it to the line width field (20 bits MIPI, 15 bits DVP)
- program RKCIF_DVP_VIR_LINE_WIDTH from bytesperline, with the current
   value as the minimum

Does that sound ok?

A question on the DVP: the PX30 TRM (Part 2, 5.3) says raw data is
stored as 16 bits per pixel, even from an 8-bit source. This matches
the width * 2 in the driver. But for V4L2_PIX_FMT_S*8 (e.g.
V4L2_PIX_FMT_SRGGB8) bytesperline is the width, so the buffer is half
the size the hardware writes. Am I missing something?

I can only test the MIPI path, on RK3588 (Radxa ROCK 5B+). Could you
test the DVP part on PX30 or RK3568?

Regards,
Faizel
