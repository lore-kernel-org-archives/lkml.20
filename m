Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599929;
	b=y6HXYkQhXqaYiAB/fHLxD6cfVRQl787f9vNGWU1of0ia9TodZKP+7wHY9t84VQUQ3M8N
	 6kfBFcXrvJug6xXvfgMfpoMDnDV7ugjSSSsUKdKb0WJLC6exdywU+f7rXsm0nvi9OJ3Aj
	 yYz0nzJ/1WdtqO9DpEQuE3o116F6f5Srpe1PkpMijVV8ulFpcY1DJ2JG5nLw/4umQMV5+
	 6/TS0UW5DjqBItB0GgsFx/gW5XKWprJTy6LzK4pEHdxAcB7jblBETBHeXanpIt/TIK2dy
	 uoEJgH4MWBXtCVXQmOpg5aGida/s+rHHDcg7aRYgGCISyFHHk2qXC9bOjAJLtwk85iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wTPDb7LIMtyEiz+mqYTBrrnJbHRN01tnFVsBBXNS8TY=;
	b=Uhfv3WC0tZwVDvpn+p3KhsELDLk2cTFQyJe2VQY9cW3gPdcA6Mxmp7JWIAWrF6bQOL69
	 RVAdcwquKb8J6xpFHTrxAqtRSsx2ko3c8sQnL7PFt+4IvaLHWqyEjM1p+LbB2g3UyDjDB
	 LJZVyjAzF1VrVY8PJAaoVSO5O+x81qq+fPxGnh3FLkeC3dnJHoDxv4v+8jCw0p9XijhMs
	 8hF4DCVlyaPM10XTS3+xv2kZUB2fLX4H7NS/tOU3PEsh3F85uHIxwyKavy6WGVZCRzLOp
	 80atXxf550nZdnokRSEkbVwKu4cdL2Y+hUXqih7mbUG1BmQjDbI5TtWvMBwj10Kxa3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=nLldAXVT;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52179606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52179606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=nLldAXVT
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c445c95d553so121140166b.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792599927; x=1793204727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wTPDb7LIMtyEiz+mqYTBrrnJbHRN01tnFVsBBXNS8TY=;
        b=nLldAXVTDBPyUo5rQiH6wJRPeyGlMCQokaHib9EKVjff54+owMFh/Qp6vjiMk7Qk9j
         Qw+uzHSbcliTiERA0MKT3aFKpoekS12Hvsh9Eu61qJtAeSbh076VpqH6PzpIANmxvzvR
         IIwu8ZpXtSEz2iLmnRTJ3wC8qnPTWFM9COcSV9n46v+qVVAMc8C5NPsKz4iZiJl1gqxV
         d/kjXe0ZI1uEOwAcqMf+EadGjSx7dDpqLNGDKteo8my9cQRM/F9j+a6JqhC+sRPFku1G
         AyWSyMLmA3aLlvzRGRLhsZOdo/O5HostYUr1lniO+arQMkLuMwMSMkVgsTPBAI9MfX2y
         6stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599927; x=1793204727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTPDb7LIMtyEiz+mqYTBrrnJbHRN01tnFVsBBXNS8TY=;
        b=uUYM4n4YdGZLnwdOecNS88P2EjHtjASNJAFndEVYy3JUmb0R7oFJ6nMMBCkyBkTeO9
         dtqgtq5JoCC081bUpdjBN8e8TM6qINw9DY29TAjiM0fCUsxtH9YDlcdahVgjqHww0i5i
         9+RYESr3g/45+5nOKN+CN7iLs9Kn7OyK7PNUS39Wslatj80YIncYo+gq0W8AeV8Vpp9g
         HH6G4YpsAI9HUSQ85Fd5o6EkX9UuRA4zgmj64tjzYLNGJTV8qXp0J8y95wn2ZAwGPa7F
         dd13kNW64KSEyL0RWBah1Uuk34sg3G6aG/Nj1BQ0qPxku+ykmV9U3rGJv6V2CeaRVaUN
         ol8g==
X-Forwarded-Encrypted: i=1; AKwUvBzqyRg0tkjbtgX52ePDq0vUgdKUB4r5veXw23BiP44JVf/ggv1bIztrcX2P4EfMIrNGtMvLJdtOzzjvBiM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGu98hpz730n1JCYr/yQisvh090EHkGNHtTfuQ7OkryuRGxh+m
	WisCvU6AQfkF+TqyOwJ6gEjFkEmI//uWdV43FA78S8ajMhQRpPqGQfaAxgazg+WUpDY=
X-Gm-Gg: AYBFou1fxqk0Lk/vDPjIQnMXjJxbaSSFcijNpk5B0JDNPJ1TvnR9p1/e6kFFd9LXCEZ
	HozaRFXjNaqN/CPTsN6IDKe8jNdAGfPsZqxbs/Hs74BRi3EHZl23GUIjwj0Y+3uioTzxbYOjeFy
	kLy6lpAmubVAZb87KUVq74/NoIfZwxBTZgprKbD3qdMGA9DFNVzGiyYfvFvMQS0QohBMparmtQZ
	XMXlXBIeXvB8aILk682S1r2FrQOWS6vCR6hPK7ZBZJd03d6BxnFXsttvngz3N56Rur6y8c2a22L
	HdFtF8nAx5DuqPkVcjyORmW2tTfrNyHuCSazzSNK4dgcRwC+B41klixPSVMJeJjis3QHmRuvi1h
	S4fQQVzfzYCEQzI6jR6mkCKu5V7xSDni5z1vQ/FXQzqvkCOO22SeSggTOi1+afDd82BpGB1kz4O
	32NO9PCDEdarn0/TrIyeaY3kJ+QZMIA4At5goz4v5OhderXzAQO6voU/MiWwVjqMev8XfR5td1U
	2UtpKNVjw/yKD7dUfYuEH8RdIKNcB8wmFPGnEz0Mjns/DHGmYzttYDISnXzSIEnuv9r
X-Received: by 2002:a17:906:dc91:b0:c27:420b:7c79 with SMTP id a640c23a62f3a-c4679a40b62mr221295166b.48.1792599927374;
        Wed, 21 Oct 2026 09:25:27 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a6182e8sm17768966b.81.2026.10.21.09.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:25:26 -0700 (PDT)
Date: Wed, 21 Oct 2026 18:25:23 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 03/20] ctlv: Add the root family specification and
 generated files
Message-ID: <atjnZ9oVYZN1VnwG@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-4-jiri@resnulli.us>
 <20261021003056.354a40ad@jic23-hlaptop>
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
In-Reply-To: <20261021003056.354a40ad@jic23-hlaptop>

Wed, Oct 21, 2026 at 01:30:56AM +0200, jic23@kernel.org wrote:
>
>> diff --git a/Documentation/ctlv/abi/ctlv.yaml b/Documentation/ctlv/abi/ctlv.yaml
>> new file mode 100644
>> index 000000000000..fa11bce98f46
>> --- /dev/null
>> +++ b/Documentation/ctlv/abi/ctlv.yaml
>> @@ -0,0 +1,186 @@
>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>> +%YAML 1.2
>> +---
>> +# Checked-in ABI snapshot of the ctlv family, written by
>> +# "make -C tools/ctlv abi-update".
>> +#
>> +# The checker compares this family's declarations and inherited stub fills
>> +# against this file. Updating it is how a UAPI change gets reviewed; an update
>
>Slightly confusing text: 'it' is unclear, checker or this file?

The file. Will reword.


>
>> +# that removes or renumbers anything, narrows a bound, or makes a placement
>> +# required is an ABI break, whatever this file says afterwards.
>
>
