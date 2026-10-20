Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500686;
	b=ju43O0rxg78rapyWmLFFtEE9BbKbKeJX3AmnL6xfI9aSI0EygxGCEgYESJPY4eWFP8cw
	 U+QdT/niV7J0sFC0F3D3OX5uJFZphLvlmHX6eVIHau4P+UuMPLAl9yVE5CLSRjPqlZhk3
	 /dNb74kkMp7klnVNhDgld6LPzXYe+y5vU/4SpEdDfKae6Ibo+BguOp3Eh1gd7dIfrgbv9
	 sG10u2JWzW3laY17A1MdZezJFHrcXIv7AfvKfVtno9YJhgkq3iIVUWVkjKT4i+2DZxXAB
	 dNArv5Zj7SIgYLBCi5SBrgqQQu+6LYZMJIfAGNooN73Wzq3Tx79VcjPO1yr2Sfg+zFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rB0mddBSqsDlweoJ61uwS1PJuXMjqqw6Y6LVGosjryQ=;
	b=RvxJRxuDcpUsgjJPrj/XV4nmZT1bxb9rwh8+sXNbRg6yDrwZ8uNgYx5E7JIWzFGvBw0n
	 oA18DeVuReQPAch/sfXKAnYIaSUV9bO+xTb200IPxYcfbl53CPJI+e9/LkOqcuVXLRgHX
	 HMRjwK673TIKptuXWROKFC/DXpbXVNhCUmvCKKJHhwRbQocaO6HFfDoFnzGYWZeNBiBXU
	 cYcpX/ri/N7eaxJVdcN1pBPtEgLfjDi9iXRUbOWY/OWOc7lDkP5e6eV0VNsEh/jMG9Cvc
	 SgWL2vM7Cy0sNmilam8B+Vdb1wIEVXib9YLRRR8HeNlP5HcNaTZlTZq6WY57oRBTzVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QvPjYHvZ;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B13606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B13606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QvPjYHvZ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514b90bb89so8458077eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500685; x=1793105485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rB0mddBSqsDlweoJ61uwS1PJuXMjqqw6Y6LVGosjryQ=;
        b=QvPjYHvZJ5dYn6/iEdlxdaWAsIecFu48u8rOrcAApkyQ5hXrymlR0ZMV+8Ok78gUVj
         RDvM6FxRCmdR/K5V07s4VLJNqOOtSa3grFJCrhSHJnCcXzgN3Bi0IF69icDuicxAJ1Hs
         LsN054mIt6VDH/IOLQUmzdVPrrih4WQ6rblXNO+j+4cBYiHJ/29CoCoagL3CSqKoCQ0G
         JGIfwiD81BEbP5ZhZINX0vrKkYPbADiaiGK2Hi4IePyH0SaGOaeIHyW/O9SC1CJFXJNg
         4hScpqWV9Fm+vFI8qtGMk1qRtqwJ8qkNlL7pJWDc9AwJraB8gH4wsRrp9kmpU1k5TX0U
         go+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500685; x=1793105485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rB0mddBSqsDlweoJ61uwS1PJuXMjqqw6Y6LVGosjryQ=;
        b=LFc3jtm3A1jd4XWkUopsM1HVWV34JulGyjTJ/jG6QUpUFa0jv6zCZBnC11Tsg/GxK6
         kUoqgqFX5iu0jztgFd8vMz9Kmq6751YqoBkBsgS7AYT7+k686BDhC18Gq2/+hiZBc5I7
         FKBaKmltoHpQ8qSwgOWXkLLCarQdfkX3D/SBJ5TK06vsm7nZ1JkWrTfSq8uJz8yk1unA
         aASiodu1KZa1OgOcZ1mRMY73zyMMJSulK70Elqi8+d+bFLpVE7mIbZJeOdmHGSYQrWCy
         G6EKMn1l3N7E6ZgGsqZDIjXy4X/C5bFWaKJVsjIV1qmve0bL2HbbiRAfWXBW5NqQZJ7t
         IEkA==
X-Gm-Message-State: AFq9FYI3KxMsBP/5jkALWQfYaJwa87+jqiHjoyClEwWWgwd+dZNdSA5N
	ZxSbUyUmVUnrxaiYk1S3wcJ1RrThhewrtFwJq71Bo1ATYRDgwHLB0tYUdwXlRtAt
X-Gm-Gg: AYBFou3RH+srMth2C/7JfGfejYdn/hzeTj1cXqSCL7tztQEoLeuPuJ6U8WD5uU1TDMt
	EBCOlV0IanvF45FFz+29Wa3ej/nY7o17Cau/8CwJal96F7OOuFLrOs5lq4JYzRzKOVHH5cndDWk
	aBXgttEdHDdtiKxQkJO3Xt/K35ZcYpAFYbLKX+ccucGZ3hYHLwM3lUpj+t5PQc9m8WcM5Oq8RA5
	Mq9lFgG1ZU3yYyLC6JgDCpthBiAVCGwCJTOy7/zVghq/ZT7f9JS/lm4cLB3zbB/0SpAWAQa+y4C
	4JTL+D5aALLMwyt7KhCIGj04kjzKm/qM2bkMgoS6wig1QWaZrasIAw5avQ2sPPLP8YA0bxFyebp
	STg0ntNFqWpd7OjqcWrq7yS8ULmCEP8Bay4UJ4CIn9WVB5JHYw22Y0xwTGnuD2Og9IKFF0/RG3m
	rR7lydL5dN2fMJO31HgW3lvT0YZaPPEEx8Y6iO6DirTD40vYCvqEwMAFZbAU7Z/EEI5mxdGEZU1
	62fSYRTdPwxx6rAVgyOfL9x1Gq4bnzugFV7l1H5ALOT3P/z/iICnfS3QrI7+MfM4VOBcw==
X-Received: by 2002:a05:701b:21db:b0:14f:fb87:cf62 with SMTP id a92af1059eb24-18512f1d04amr14840107c88.27.1792500685047;
        Tue, 20 Oct 2026 05:51:25 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.31.netskope-rdns.com. [158.95.44.31])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314ef8ed8sm34558292c88.3.2026.10.20.05.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:51:24 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Tue, 20 Oct 2026 09:51:19 -0300
To: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH RFC v3 0/5] Add E notation support to kstrtodec64() and
 IIO sysfs writes
Message-ID: <ncmlzfubxpr2haygeaa2o7tauzvljstf555m5ej2rs5cu4nviu@oti3xkyqtooo>
References: <20261020-e-notation-v3-0-fd385c0fbf65@analog.com>
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
In-Reply-To: <20261020-e-notation-v3-0-fd385c0fbf65@analog.com>

On 20/10/26 09:26, Rodrigo Alencar via B4 Relay wrote:
> This series lets kstrtoudec64() and kstrtodec64() accept numbers in E
> notation (scientific notation), such as "2.7e9", "1.5E-3" or "1e+16".
> It then moves the IIO core fixed-point parser over to kstrtodec64(), so
> every IIO channel attribute written through iio_write_channel_info()
> accepts that format as well.

...

> Digits beyond the resulting precision are now rounded to nearest, ties
> to even, instead of truncated (new patch 2). This follows from the
> second motivation: floating point values printed by userspace often end
> just below the intended decimal value. "%.17g" of 0.3 gives
> "0.29999999999999999", which truncation turns into 299999 at micro
> precision instead of 300000. E notation makes this more visible, since
> a negative exponent can drop integer digits: with truncation, "19e-1"
> written to an integer attribute gives 1. Round-half-even is the IEEE 754
> default, as used by strtod() and printf(), it is unbiased and symmetric
> for negative values, and inputs that fit the precision (including values
> read back from sysfs) are parsed exactly as before. The rounding is done
> before the IIO core conversion, so IIO fixed-point writes change
> behaviour only once.
> 
> This changes existing kstrtodec64() behaviour, so feedback is welcome on
> whether it should stay in this series or be sent as a follow-up.

This might not sound good, but I have increased the scope of the series a bit.
I think it was a good fit and it would not produce anything unexpected.

> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> ---
> Changes in v3:
> - New patch: round to nearest, ties to even, instead of truncating.
> - Amend kstrtox E notation tests and IIO channel write tests for rounding.
> - Link to v2: https://patch.msgid.link/20261013-e-notation-v2-0-d4adb5e193fc@analog.com

...

-- 
Kind regards,

Rodrigo Alencar
