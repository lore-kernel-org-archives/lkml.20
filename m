Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268474;
	b=zYycAediXlQWVsGLYq+dVYXg6IWkUECVE5us6tvysTeoL6cxEBeyERpQXJkJhU74+Jvk
	 Q++S2PSJDWpotXuMfKFc2JFJchF5u/xsAhr5YjYVwrY9HIzxcb2KQynRVaHo/PL/yF6cS
	 wh1WMixFkDp31ogaRaaupjPJG441HdqWKrD7ne2xhjrgnrwZy9TWjN57Mmk8I0osXYqmE
	 QSU8heLnbZiN+WddWEc+IS0+5KGyWMN/gBygaaK/6ep0wN/Dfdc0VgtHSjZGp42ynn/vf
	 8Yvkv1haLQQsfoktN5Wm3sUqDz8isNt9rOik0JUePDhkX3q5FgWpppjISuI2/bmd5HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wgroa5qxrEZgRV1TzlPeAteJauIXp9n4MbPCfUIQ4C8=;
	b=fzydEmj1EYEmZogqd+Xm9OOrwr+jsc7E+9oFKqHs025deIdkGMw4NzEH0Eb7PfT4dimv
	 +Kw+MLZlnZdRUQ12gHokCf0SKDQTfj+1QHKmtWnhVr8L/rrC16HMal74psf3LIawuTw6m
	 M75kANDO+VLE5VoUkv3iE351connnlY+hxYcsECL6L/Q89g9L8rXv3poOi42lie61BzRU
	 h2NQMGrP8TmEYEukzJDX1fEYoyUQW4Pq7Dco4s88CNiScNf5jqAbH310mDfBGuXl7DM9L
	 vosBRPHqVmYefhS6wOASK2bDiGKu2fhwPVaW0VSLVr+JqkgX8htACnd7NqkiKmmNvfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b="MCGV9df/";
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD65606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD65606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=MCGV9df/
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c49df71182dso55392166b.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793268472; x=1793873272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wgroa5qxrEZgRV1TzlPeAteJauIXp9n4MbPCfUIQ4C8=;
        b=MCGV9df/7k4ajBlFLNzpnpiyVP554R79li/56qz4JFgvKSV4eMPHTSDzDtiO+v0OXG
         amQcqEYKMIKb06gnn3dwytNvTkYChDHgYHuD1GcIs6YsflunLHI2CEtw25RALpdQtNDn
         5Se6m2V7pofQQZhstlbmMVyRNnXfrt8FDQidCK2DCySntXp3eXIjMIwGd3GBhkoA+M+R
         o/hwUoFTvZnV2wRrJeYXyGpoR6GETTnHQqYkHF1me+YT7LsyP8KIuGgUQ5bQ0SaQ8CmY
         I+L4iyO5i6YI0hE+HABSCmQHgKTuOcQH2FfxU2YTP2MUN3qxImSYhWmC5V41uQuPOFab
         nvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268472; x=1793873272;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgroa5qxrEZgRV1TzlPeAteJauIXp9n4MbPCfUIQ4C8=;
        b=S4yq6BTCooubuosxqxP+rWsIbkSL6AzvsfPY2j3Yh8bir7YyNGpfuuKoCg465AIfS3
         9iNnqb02YsZDX0z9wGhwkU1hnfzxkQ5GUKcaoltYnatJxEDeuyExvCbx9FtAZMGCgTWH
         zV/JarzlRLD3mi2B7DeYMWmQ0BZN13w9SjVLmdoYN2Tp1eC3+P13LnEHSzx3J8rpRg8o
         IVE/wkbRcihdsXTFEYxsKIZegNoWEUhFn3HvFHGYEXPjbL532185ylAMVrC7OHR2rNJo
         PHN6iPB83ghM3VO9ze9w52cEHzXFLi5X9j6YtTrCq+PTvfhFLI9JA5+I6/FOKQ4eq9ug
         12vA==
X-Forwarded-Encrypted: i=1; AKwUvBzDVUUeue9NqaHmPJlc5V1cil5CCqscLJhW3BddKcxYvfeGxoVgMxqVidMdA1lB7H+pKSkx0ebGPrRHLL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKOK9lXRigac6pgUYDdb7OaVR7T8gs5wMjUjX1u7GgsL7ajbsW
	UZzTs3IXDai0w/OyyKSyYZAlEqkIXtxUqQ252PntXHno2cIYNHuSv/bk/K3tIipwA1U=
X-Gm-Gg: AYBFou2h4TOfK4yeDcC0VfVgTeR1JMjAvxFyX5RHXeYP+Hrdl//wpJpCjc/1lf0c99G
	YKn428QdfFAbSJZh1GdCUC//QDibWZynp5RQ7rYO9U/6908MT7Qz4Bb5GjZcxw4x8tkqEd8ib/j
	jGLaLHWaGMYiDIn3GrLhwyb5KWHM1DRCGTDz6XFWV7vXUC2PqAAXxhyzeMfOETgGd/QFlkRyMTK
	C6NyLAF9V8tTNEjT7kX0/xe6UwtrWyauzQfVToDNmYQrEkZAdX2HO/cEdygGwiakVRzCfaeNT6S
	RA62jWChTF2Geax18mNEKB4OrQDWaZdQA/cF4XrQ2DEGCKb6c1S0SrUjOrTD1eLrT3XmxuxpkAs
	/yg6LCU10q9drD6RrMTIiYfvasu6GkZayEJGPX0GyJEVr37Lb/jj9PGLcipzC7Xx+CabOcEcHz5
	9ac8oXqhk2vcBq0CxLYB0mFVulS/PM9Wj7T3hSilvxpQXXRUdlSlY/oNaOVuDmo6Lhb5HPsgVZM
	jVoC8QFMjzeacA0Fj+AEQ17Sqm08Jd9PTuAohi3jUfCaqGB2arUnxb27gelxRrf1jF+ayWH61GP
	m31NXdn7PWvUSLPoroVnNX2Qtc/PHiUGWBcYdA==
X-Received: by 2002:a17:907:9405:b0:c49:8d28:73ad with SMTP id a640c23a62f3a-c49be020e3dmr404569566b.49.1793268472113;
        Thu, 29 Oct 2026 03:07:52 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd520838sm715397566b.31.2026.10.29.03.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:07:51 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:07:47 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Dave Jiang <dave.jiang@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <auMahpRIeL-Dkytk@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>
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
In-Reply-To: <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>

Tue, Oct 27, 2026 at 07:43:04PM +0100, dave.jiang@intel.com wrote:
>
>
>On 10/15/26 7:50 AM, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>> 

[..]


>3. Jason asked on 14/20 whether anyone needs a variable-length challenge. I
>   don't think devices need a range. A plain read sends an empty challenge, and
>   an SPDM GET_MEASUREMENTS nonce is "NL = 32 or 0". Your TDX provider always
>   takes 64 (attestation_tdx_evidence_caps).

https://lore.kernel.org/all/auMX4kbsflE9kK3Q@FV6GYCPJ69/

>
>   A device needs exactly two lengths: 0 for a plain read and 32 for a refresh.
>   struct attestation_evidence_caps only holds a single min/max range. It's
>   checked on every request in attestation_evidence_request_decode(), and any
>   range that allows both 0 and 32 also allows everything in between.
>
>   To work around that, my provider declares 0-64 and PCI/TSM rejects any length

Perhaps just omit the challenge attr in that case would be the best way?


>   other than the backend's nonce size, 32 for both backends I ran. Could the
>   caps give one exact challenge length instead of a range, plus a flag that
>   also allows an empty challenge? A device provider would set 32 with the flag,
>   and your TDX provider 64 without it.
>

[..]
