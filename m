Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700610;
	b=vWl5T5w2wmhyaK8bn1gWvsS4k9QBs3BxVqvB8a9nmQYTXc05rHeQ/utRjSyLJzw6IymI
	 437GECAqBbyVlDGzw9c3hTjMi9/Qv6DmVRVhHKYt4MAIfS0t7SPX/pzJjpHT+bEaa5nGG
	 8uWOM06uKbNkDZ/QO8ndvrra6Z764ad2A8M2BaOKdT3Ub0iZJsrLa1hZorPmAqA1sTu7Q
	 5EC0RKMG+fDWyNAcOM68m4KQztew1Ufn0g2iMUQTkaIXw1vf8hfJmlxacLK3tUxkT1Ft9
	 IO2N07kcDk6783Sh5D25Ji0awwOQh3oMIG9+kE4JtLkdDV5kwzh1lzkGFcIUusGspLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bZ+dC6noXl55QlVCt5BZLTKiK5g6wFPqaNKr4aU2duo=;
	b=AiWqMdEB3vuXh/ytvPsRbW1BMHzhtiI2kmyH+4lt/sxFK3IzWP/AEi8O8rbzhl0nGc3C
	 v8NafSvjGT13rCuss30EHid4rqnmPa6CY2SWTA7XQMWgvFxZSp4su9vjDGTiwXrTm7GQZ
	 R7s99TPkr4kApC4q1oITfYA0LoMe1maz1gdQNjW3bYftxqstU8rK6uQG/hvJF2x4cj9Wr
	 YOFGixqCajXIKU6WAJjDRS0zeKDnlZQExzZXAh0CD9uuk3x1ieoSe2UgxSmP9LAhTE/h1
	 T47YtCVf663CaExRkJdU9aStdiD7XndIKGgP5vA8zi6ezNRVgi0GVUDbtUJ15eqvbsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=RZvMrKPb;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CEF606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86CEF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=RZvMrKPb
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35ef6b49813so314161eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792700608; x=1793305408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZ+dC6noXl55QlVCt5BZLTKiK5g6wFPqaNKr4aU2duo=;
        b=RZvMrKPbBFnx2yyTosWZ04aFqIkL8Ce/WGIYyuZqTADisEr63CdZ37DebuMQCINTfO
         csg6+7j4vMkjRDPV6N4jaBU4NUssCs7RBPlM+ionoNfAG9CiBcWOKRa032cV+jil6Bvl
         AHBRFarAcS76VSGbf+L6p88zW4JoQA3R5NuOW5eBDln5EyVYa1x8pAF+/8f94GIyYzlh
         HlRIOI5pfHDJs+y8opigZZsI2FcoTByBzNjAIXd/+V1di4APMvgpIMUcKESWvMseCbGB
         P2q+6uRzDgBdJ1QhN1elEt7YyHAnCpEPqx5bt+wmHhUOY0D0/4iiR8Erl/fqWu4bSv4c
         b9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700608; x=1793305408;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZ+dC6noXl55QlVCt5BZLTKiK5g6wFPqaNKr4aU2duo=;
        b=ieVXbywWF70XQvgok3r9I7zV1VkBh5fi1KZVQS3UYoQPWvooVkfh4Lu+iz8/CQvwMf
         SQtHfFO7SdEO+v4kpW/0uSFkVnER25a5/aZGTB7fZTqu2Ma7Y7hBNLHUu9T0aXL3K4gK
         kHjwygH3yOyGFTZzCFzQyA4iUJGENaiFz4QpsOJnRgvphCSIBUCorJeOGM//acfRAUtF
         Mm9xvDSK7S7qN27vLo1BtsVNClA3gIN9qsElwoP9o3aupo+zzTEGH22rvJW8YFEckskG
         cDT9BMG1CaF2t7yMOlcgnYc4Fa8V1Eg4UM3UVHdz27FFwKt6U9jPruKRzVRVE34LMLLG
         XSBA==
X-Forwarded-Encrypted: i=1; AKwUvBw0F4dKciFBK4duhnvYwODeKqdu9ua+tyY890ERVEPCz6LfeDmCXq1AaQFv/oA+YzlyNA4qz6kbvHbzHNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhyRA7zgSRBqwJD6OzZEa43Ko5TY3eLuswri4JOaQnJ18i42gS
	pvm4AS0BybeJHP7wUe2MHIpMC034GLDGt1YSHg11Wln5XZ3eSd5VQBFTs+f1EfHPZs0=
X-Gm-Gg: AYBFou2I8BrTD3wtCJ271Mv4a6Z/LrsnBJ83H3r+Ffo/APS+uIzAMSof346j8YLIPpf
	Ts2i3/DLSpWIQT/DIXpm0w/z2eQt565tmm0AMzWOpeEt66Az6WuGdl6FX7wEd6s97Dz68/VYgSW
	CFtSpx7JSsCZMKnCbXfvHgAYHv1Geq+mQPUy26I1xFNS7Be46C0V1Kyd5e2A1mufClIARMdstUa
	BrQidpW/RkNsa69YPqqWqWlP4ilEKSONZuOhG6WnCej+HD6hbtKoGkcCUPkriyB09LGL+eTaKGm
	W+ufgPYfwfzgkFnuX3aVDmpF2NKkD32i6khyTTMwfrQTQU5C3p2AFzicRM5rQbbkftVfNI0zzei
	L+52gQyAKeryu6IzgKbL1oJwPQXXkWgyeMrjthLPGVjo2q0351yOw+GepEkCAvXdunE0NF5qiG/
	EGJKAp50R90+vFBYsfgBD7TZ2Bt8s9QkY+DzGiVuw2fVO9DZUA5+1tUi72vR/2pcXm18kbNtU1O
	SWaFdRlEZtLrFniZqevOgukhwxDlvctQ+W7AGQZA0awNq0CWgXZBSYjA1yCSXCjeODrLSW2dXx+
X-Received: by 2002:a05:7300:2a9c:b0:365:b147:b458 with SMTP id 5a478bee46e88-369d90c7547mr323249eec.3.1792700608112;
        Thu, 22 Oct 2026 13:23:28 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-369d9d8978csm426450eec.13.2026.10.22.13.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:23:27 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:23:26 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Md Haris Iqbal <haris.iqbal@linux.dev>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: Re: [v3 for-next 0/3] block: delay support for error injection
Message-ID: <20261022202326.GB2931-mkhalfella@purestorage.com>
References: <20260928221634.43239-1-haris.iqbal@linux.dev>
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
In-Reply-To: <20260928221634.43239-1-haris.iqbal@linux.dev>

Hello,

I wanted to use the delay injection for a test case that I am currently
working on [1]. Are you still working on these changes?

1- https://lore.kernel.org/all/20261022185920.GA2931-mkhalfella@purestorage.com/


On Tue 2026-09-29 00:16:31 +0200, Md Haris Iqbal wrote:
> Error injection can only fail a bio today.  This adds a delay_us option so
> that a rule can hold a bio back first, to model a slow device.  The delay
> happens above the driver, so it tests the code waiting above the block
> layer, not the blk-mq timeout handler.
> 
> A delayed bio is marked with a new BIO_ERROR_INJECTED flag so the rules
> are not applied to it again, even after a split.  Christoph asked on v2
> to avoid the flag by allowing a delay only together with an error.  I kept
> delay-only rules, as a slow device that succeeds is the more useful case,
> so the flag question is still open.
> 
> Holding a bio back reorders it against bios submitted later, which breaks
> sequential write ordering on zoned devices.
> 
> Patch 1 is a prep cleanup.  It moves the rejection of an unknown status
> tag into the parser, because patch 2 makes a rule without a status valid.
> 
> Tested in a VM.
> 
> v1: https://lore.kernel.org/linux-block/20260827000115.128093-1-haris.iqbal@linux.dev/
> v2: https://lore.kernel.org/linux-block/20260830012002.80275-1-haris.iqbal@linux.dev/
> 
> Changes since v2:
> 
>  - Patch 1: return bool, rewrite the commit message.
> 
>  - Patch 2: drop __submit_bio_noacct_nocheck(); the flag alone stops the
>    rules being applied again.  Log the error when a delayed bio is failed.
> 
>  - Patch 3: trim the documentation.
> 
> Changes since v1:
> 
>  - Add the BIO_ERROR_INJECTED bio flag.  v1 only resubmitted a delayed bio
>    below the injection hook, which left the remainder of a split going
>    through the hook and matching the same rule again, so a bio was held
>    once per split instead of once.
> 
>  - Patch 1: tag_to_blk_status() returns an error and passes the status back
>    through a pointer, instead of returning BLK_STS_OK for both the "OK" tag
>    and an unknown one.  A delay-only rule has no status, so the two have to
>    be told apart.
> 
>  - Documentation: a delayed bio is held once rather than once per split.
> 
> Md Haris Iqbal (3):
>   block: Reject unknown status tags in error injection rules
>   block: allow error injection rules to delay bios
>   Documentation: block: document error injection delay feature
> 
>  Documentation/block/error-injection.rst |  39 +++++-
>  block/blk-core.c                        |  14 +-
>  block/blk.h                             |   2 +-
>  block/error-injection.c                 | 167 +++++++++++++++++++++---
>  block/error-injection.h                 |   1 +
>  include/linux/blk_types.h               |   1 +
>  6 files changed, 192 insertions(+), 32 deletions(-)
> 
> -- 
> 2.53.0
> 
