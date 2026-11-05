Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884306;
	b=dovsv4sVp4jbEuLfo+a+mdHBoF8Aa4sF4eRtJNbvM7QtC6da3fLHEFY0lEHgSLBFmACJ
	 SUWfT6NfXoJM5+pe1iqkVMbQduFDszlVRBxLJwhlj+jsX6poEPFqTERuPCxMnVySn5hph
	 Ppbl7HlJ264Wxw3HEsjZ35oz96A555hmSmOMDEv4pZxwmc/s6LGXlW8e9CZ6E2qbHI5mm
	 oK9UQTXhGQIpDc9/Mm09yVOEGE0hkvZJaLT21KpnBBW/QcyLPlFEgaO1k5NC8ztkOpBMC
	 jQaZPdPGDcfHTVh0bLq4VsLD96sSq/HMsk35vUTBWIDzyaeDJKd+33LgQboIvA5l4mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cFWG6Sga3Lp6k+n+muTvwPlAdm13M1aYQLJn0cvv/Mc=;
	b=RCjXmmkRGD/5UogvlxHzfzdtDojQu9soXwZH8HIXioWp9g38zygIa3Kx/8Ev0tfX5xLn
	 emQLC00FYM1E0Yw/R4OFGgdpPWuEazvw3E/vCzttsqGt/HO36wcWWrpEV7QgY1nmfvGcv
	 Yh46mvrvdZYXHPdlQ1HvbEOpc9wYk5Flq85wNeCnH7ledkGODxGAPwK64pIHY0JbneLe/
	 uPST0GUSI8rtp+B083WYA5XmPeklpE5cmaPgoziGL8NqDpAvSQM+driz4uKHmWDlwvZuu
	 Q3Z+sCwrkMerPtQMbvHlqhpKCvWTpY8ISgUCcT2en2OSlxlZmQgomSQ9SktxpUezKqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591E0606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 591E0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso2172983e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793884298; x=1794489098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cFWG6Sga3Lp6k+n+muTvwPlAdm13M1aYQLJn0cvv/Mc=;
        b=O/WK73xDQgKKqiq4d4hHESILJFUUZ9SW6N85AxaK3rE7ZySNU3qEhKNIEYD1O9eQqI
         95fjFpuc79ZuTRElQ+h02Wj9E5V0JdSNQuaGTA2nDcJfjwcR6SkYbmUTwtS+3MD4FVai
         ypADZ2qW/Q/jvYffnvPAfE4QHI637QdVgl4zoT9tCL8MI048zRl+q75E6+KPj4p4A6Zx
         8ziMQe+vSfe4gTBqJH2XsnQLmfKmDFpDC5GOmuyWNS93SOEMOgYVkUvZ+fTkwWIqFQh4
         8Bfsje7zWlYV6r9bYcca0QX0n264DtY3WiqEOGm9x9Zo+Y7muxa/sL0dJGq9PlVpHr6A
         gqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884298; x=1794489098;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFWG6Sga3Lp6k+n+muTvwPlAdm13M1aYQLJn0cvv/Mc=;
        b=mMfGiU/iftRsjQVxvc2i81rPAM2RWhOx0AXeykGpBplNatrEuSHKv4LAlKDuBsauuE
         Jy+wIEGvtIygr0R8jYGCn1/kkOJDK1T9DgetAryQFAdB9RqJXwcIUTBdMECI7w6kRmhk
         Ove9/P8tUXIcqfvBZPeWzVe6rhDBA2RGOPRtUA88LME+UCVG62ZFXrxLO1D1LPtev1Td
         dKlG3UkMxg5+eUxW6uvQuRg2PhHy5SoPDaIpaua7XJVMRX+pjqeytjGpDxzEbR9H1kSE
         YwxJ4twNpjX4pqYIz5ziZdpdNyIBK/93tgcPccLCCBtCXhaDjAzV1j6I7cPNHdP00TNS
         MWJg==
X-Forwarded-Encrypted: i=1; AKwUvBzwYgj5sSuFo4KSMb1kFEfqxQIw6H447V8aYI+Ygi4DrqWiaGqHAZzYr15QLqbXip9+LE/kar8pb20z1pU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BwiFUQxPd0C3Qox+ndvhSLSixdLlCpN9+vCfZC3nvJrO2J8oI
	Ih7sGWMSGofu0sa5X5QFqicx5yfSZvbCi8td/mOX8hr6TxOZ91KTnGUaKuiduwErko4=
X-Gm-Gg: AYBFou3TlrOKsYLeRrZKf2driDljsYFi9gHmBqEeW89KBeQ9IU6SWExwCQGhrcuxqyj
	EnOUAsSqbZaFW/oXhBR4YRBWi4V61azAlfj2ZSV9olzh26u/BUiuDtGqV7QGGUY1bR4tqAWWp8J
	CWPRewV0dDeEEpq7Nz7UTWbA6QEajDHz5YS9//5VlzyiESpsqb6y3vHc40gF/OYT+L+R+onBKmJ
	iuCGV5tkzXVs8b6bovVpAbc7GJEJw1fz+hcEnlf5WifAap5FpwTmK/NYAj27mrhDmAvUXM7ahQq
	iTs3vJnSWI+dv/Dhp1G5qbZVBMiJqeTeLGhld0QY44y/UVYhfBpMlEhhg3N9JpLojYEG6gwdkvJ
	fc2r8IzxTIuBVXNWXqoRBVbXU0qaWm334KYeiGNKcpsu168sLZXY548zcmMS/ZqDij9AjK6UhRZ
	EmUrqf3IjllYaQFtxv3v5Nw9sAARvBBL95oE+zru7hz+NfXbsNWMpXKo6auOFOCADNq4cECTi07
	jTit5Vt2l/kZQ86FzLZTtqqQuQQ6U0ka9MnO2ltlkgXcIUGP6I4Ii1xMxyFomjqfDR72KPYCLjx
	MXKpFBwiUJk0m+QmsBbB0j/gyAToLBEr09AFrphhVNUmnXOjzLOzWyiR3yQ=
X-Received: by 2002:a05:6512:128a:b0:5b8:fa05:e49c with SMTP id 2adb3069b0e04-5bfd9569d40mr7209047e87.34.1793884298157;
        Thu, 05 Nov 2026 05:11:38 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38ab798sm817490e87.23.2026.11.05.05.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:11:37 -0800 (PST)
Date: Thu, 5 Nov 2026 14:11:32 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 02/20] ctlv: Add the UAPI wire format and family API
Message-ID: <auyAJ8OMWHUTCFKs@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-3-jiri@resnulli.us>
 <at-iEMxN98nie1Qr@e129823.arm.com>
 <auBaROC0XdWpILEI@FV6GYCPJ69>
 <20261027141524.GF1685504@ziepe.ca>
 <auC5sw9YMC9NO4wl@e129823.arm.com>
 <20261027151729.GG1685504@ziepe.ca>
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
In-Reply-To: <20261027151729.GG1685504@ziepe.ca>

Tue, Oct 27, 2026 at 04:17:29PM +0100, jgg@ziepe.ca wrote:
>On Tue, Oct 27, 2026 at 02:48:19PM +0000, Yeoreum Yun wrote:
>> > On Tue, Oct 27, 2026 at 09:02:14AM +0100, Jiri Pirko wrote:
>> > > Mon, Oct 26, 2026 at 07:55:12PM +0100, yeoreum.yun@arm.com wrote:
>> > > >[    3.856919]  ctlv_schema_check_attr+0x3dc/0x538
>> > > >[    3.857105]  ctlv_schema_check_indexed_nest+0x788/0x958
>> > > >[    3.857301]  ctlv_schema_validate+0x88/0x180
>> > > >[    3.857482]  ctlv_msg_test_as_deep_as_the_core_allows+0x11c/0x1e8
>> > > >[    3.857698]  kunit_try_run_case+0x64/0x188
>> > > >[    3.857878]  kunit_generic_run_threadfn_adapter+0x30/0x68
>> > > >[    3.858086]  kthread+0x10c/0x140
>> > > >[    3.858245]  ret_from_fork+0x10/0x20
>> > > >[    3.858398] SMP: stopping secondary CPUs
>> > > >[    3.858630] Kernel Offset: disabled
>> > > >[    3.858720] CPU features: 0x0,00000000,00b0802e,9f190bc3,2affe72f
>> > > >[    3.858872] Memory Limit: none
>> > > >[    3.858976] ---[ end Kernel panic - not syncing: kernel stack overflow ]---
>> > > >
>> > > >[...]
>> > > >
>> > > >I think it might be good to configurable according to architecture
>> > > >unless it's not good to reduce the CTLV_MAX_NEST_DEPTH number
>> > > >otherwise, increasing stack size when CTLV is enabled seems unresonable...
>> > > 
>> > > Agreed, will lower it down. I think we should be okay with 8 for start.
>> > 
>> > I'm surprised this ran out of stack though with even as few as
>> > 32 levels.. Is there accidently something large on the stack?
>> >
>> 
>> Nope.
>> 
>> When I see the each functions stack allocation:
>> - ctlv_schema_check_indexed_nest():
>> 	sub	sp, sp, #0xf0 // 240 bytes
>> 
>> - ctlv_schema_check_attr():
>> 	sub	sp, sp, #0xb0 // 176 bytes
>> 
>> Roughly (240 + 176) * CTLV_MAX_NEST_DEPTH = 13,952 (around 14KB)
>> consumed.
>
>400 bytes per nest seems pretty big to me...
>
>Do you have debug options enabled or something that increases stack usage?

KASAN is such an option. On arm64 with GCC 15, the stack protector and
zero-initialized stack variables, ctlv_schema_check_indexed_nest() takes
208 bytes and ctlv_schema_check_attr() 144 without KASAN. With generic
KASAN, which instruments the stack with GCC, they take 432 and 304: the
redzones around every local whose address is taken more than double both
frames. Your numbers are in between, I guess a different compiler or
KASAN mode.

Otherwise there is nothing large on the stack. 96 of the 208 bytes hold
the callee-saved registers, the rest are small locals and spills. It is
just two frames per nesting level.
With the limit lowered to 8, validation at the maximum depth takes about
3KB, about 6KB with generic KASAN.

