Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2038040EB89
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185112; cv=none; b=NcgqbGG5vpVQXciN51QJDuadiOIy56oLLvxMHl42Ggs0F10xPr+MDAozdDStSUitmvGSvzMcLlyZwnlEyTR44tC3LfwM/ysJ9ikQxm2YhivslDZoNks2sl0HE2tHsHUFFCk0uzQ0lapx+cBRMXsZdNiN4zn3nSuVDsqjG60s950=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185112; c=relaxed/simple;
	bh=pV+1D5vSrpBEiPdYYCuKzOStJttNKVhJ4dZ4A9bnN/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfIajNG2E5PBtBKVpIBDTVhWpAXKxXkilPOFvDnbn9jzXyEP4bJllTumAQfH36zAXUOSLQM7hG69P5Hogmxmn45Js8xv6j0XHSeTj/YUSRaM7QeaDDsrhhp9gBqJBYBM+LcjtX52yzo08E3daXzUxhbUvs1Oi6IjZcquzqimn0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EXpzXTtC; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EXpzXTtC"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d8facae850so6645ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790185110; x=1790789910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D1AquzIApwGo2FvNhSKw8uhRmWAtNmW1t7wHGg5rKrs=;
        b=EXpzXTtCj8ztqUvIft+WiLrzGaKaHL1NXJ0cS8TtZePNF9Wjoe5TiNES6nZ1cLIaCf
         C4DgJgKP4N3FlFL3ANoU5RWJoWlRmWp5XxHVHSj9uHuoxDaVIeEqAdSWJbAJilENn213
         pAtayeMHjOk57biEwRw43UiAbPXw5+vIhA5nAqDdI7zmD0q7qcWHMYrj06LdWuniqhmn
         ogo4zlPHwAKXXgv9uvSsH2wf3o6iLNTyJDRQt+jPE4+gfnq+omDTjUkqmOVhWhfK2J8Y
         4O0adTAXUgpibLcTcqXYlbq5EzoxaLPUmrEd8PQjJ+W9QnnJgUGX2/63VGkn2GlNgT5j
         hfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185110; x=1790789910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1AquzIApwGo2FvNhSKw8uhRmWAtNmW1t7wHGg5rKrs=;
        b=MWxzjNFgpCK23VDe5SFyx8Rpy2d7+msRGna8LUZxXEPudYafpAs2LRSCZ5jCiQHgs7
         tPXyJ5WKaLhrFPtWA5m4SuP+vkzQkR78yKWaikoBg1Kl/jnp9iPw4gKzw0G1ayxWGvmx
         JX7aPk05Rqy+hztYvsFC4UjwljBrTCYLVxoxLWdVrPiH0jR1TiqBnBwdxoWBXK3+D13C
         mp4APy3jgEvnLzwkJIFhUNz6MFXSSl8WPHF0cVG9evLunCOg4jNNZo9ejzA8CnaLeTX+
         C/xXSWvl0Es03b9BAkLmK+de0ZL7kw0S1rDEx5a/C1ZWnec9Ns06pJQGSz4N3QaXaI2m
         D5dA==
X-Forwarded-Encrypted: i=1; AKwUvBzUT+kOewtAh6alnBdk9aX4TR1FcOQNiKTtRXNa64bezQW6zZgGEUnlIqYjojqhfmy5++GwAuBUbvIRpE0=@vger.kernel.org
X-Gm-Message-State: AFuF++mifM/6QU66FLi6LCSwR+RlhRi5KzcDuyqJsD4LeraXTa/UJSMg
	UlZU2Ggm1IZqRXL51GpTN1p0fHkunFOTnAXYdg7QIQD6CmrQGvW3ojebF7jDmTO6jw==
X-Gm-Gg: AYBFou23taR8Q5T8DTQHWNnWeA7KpaqNNJle3eeJ4pBQrsJ0A4F6yiH4o8srNyj9H8Z
	9GICSMGU5+eMxJ6ZrvhparQLwGBV6vVMsD6NLOd2UhpsPTFOAnxn8Lkobc4dGGP/zeLhWCPqpLS
	YPOk6ydXAv1A6GeV/udliMGqN/lEH/pHAGRS8Fh4mJ4ww48CHbc9AV7n54P8x19tW1kpQaIuChU
	O9cDnz7wuZjX/3TYt+RLqvSf3qnKNOvBhAhkxg4HrlRtHpuv36VhPRpVfL1j/LM6wLmF4Yh6RGB
	h/LzYb1xUWjdB2P/8hpU2MOTOmg81PQKalrul2Dr3zJe8BLQT5ETQJvITC8RQyRBaq/5srLtV7Y
	b3ExP2wOiCKSG0M3Q6Rhg2mdp7Ojhd6MbFi9CpTARLHD0pmVoBd1dI1h2yfTCf/gCKWVPU9M+yv
	dthopWMFhTEjpAISV6YzSV2J1YRVU0NTTkBrNjGCEwuxF25434qQGQ85P299zKiJVgy8jPXHB4M
	6rU141eOylFRIXoTbvM6agYrj+F+F/exrWX3ItAv36zycOVVTAgCwtDNA/aGlMpvo49ByKProcZ
	9GJgsqEuSBUNv2Q794mikn9o/cUbbI9t1Fqpp/ydTMuGFak=
X-Received: by 2002:a17:903:90d:b0:2ca:4bb4:4bd with SMTP id d9443c01a7336-2df7bbd799fmr625835ad.5.1790185109816;
        Wed, 23 Sep 2026 10:38:29 -0700 (PDT)
Received: from google.com (99.95.125.34.bc.googleusercontent.com. [34.125.95.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5c4sm119346a91.5.2026.09.23.10.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:38:29 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:38:24 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Sagar Taunk <sagartaunk@proton.me>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Matthew Maurer <mmaurer@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v4] rust: net: netlink: validate attribute
 length before casting to `c_int`
Message-ID: <arQOkOAcTTt6dCyr@google.com>
References: <20260923120504.9100-1-sagartaunk@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923120504.9100-1-sagartaunk@proton.me>

On Wed, Sep 23, 2026 at 12:05:17PM +0000, Sagar Taunk wrote:
> `put()` trusted an unchecked `as` cast from `usize` to `c_int`.
> When the length exceeds `i32::MAX` that cast wraps around to a
> negative value.
> 
> This ultimately resulted in a kernel panic when the reinterpreted
> value via `__nla_reserve()` and `skb_put()` became enormous.
> 
> Validate payload and header both fit together in a `u16`, rejecting
> any payload that wouldn't leave room for `NLA_HDRLEN`.
> 
> Fixes: 5eaa5fbb6e6c ("rust: netlink: add raw netlink abstraction")
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
> ---

LGTM,

Reviewed-by: Carlos Llamas <cmllamas@google.com>
