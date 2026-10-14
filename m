Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4932421A17
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981490; cv=none; b=ixXnNMT0qlnx36SX9tvK3GLgmg297ZmbJ8dRXfHErQ9T0/wcoOegGPjUMi7plRH3bvOnH7yVLj7q8oevvOyDFzAVq+E1VDu4yrunTzJLV5DJY0zR5K/Sl6ipgcLOqMbo4q80kz//9Vux9EKKFSUsmNzSDFpYoaKoO0v0jmFK9BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981490; c=relaxed/simple;
	bh=imqDUGmr65GUF1T+o7984DBFaghgFubjK8p2xLCv7nM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qemcxbhSVoYoMICANkiU7+Ea53i6Z4+BiAa/qUbrzZB9pJ5PjntvWfrL6rzJzu5iXWmBfD/aqoOcYiv8Xx3FUdl0nAxvm+ipqZCy02/P3IFbnIXvoIJ/ZRqfRc+ykXH0wubcLUpchnCOFEtOwx3y80mcbY0nrYH26HG6cPetlsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cioc8i14; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cioc8i14"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-486e70f2457so212913f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791981487; x=1792586287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JOBDQN5H1feIqCOwoVj/nHLz9ur/yVVbcQeV5sIjhlg=;
        b=Cioc8i14Fg1oB8+QhPAZpxw+jovCOpFTXIKEAsxb4oqywI41BkEiIv5k8pul3wGasI
         E8+3pPdMHjehJgooJlQ14NciAzRjQbuiv0XliH/idgh5fiM7q1Tz9kMi6eRuCIGG4iqv
         lwaLlY7r9HSxzWsjSwJyoCIN1HC/JnpEz003G8qIojwAoEKZpHb8rK7Oou+dWlS4wYcH
         PEYf5wPQVXIhUYQGnG0nLiPR7PGdzkIVG/sWYrUji+KkJkZsCARxWV3tWHtOql6i4gK1
         SSEgNfDx/ReZ+eB5NyyPU8HzXioEKlZNizOCOIhQ5GFUzuvmDolLW/CMJzgFzsTOtFq7
         K5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981487; x=1792586287;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JOBDQN5H1feIqCOwoVj/nHLz9ur/yVVbcQeV5sIjhlg=;
        b=syHj/xH1Zlw7xT3bd0iuuywnXidINkIPwHV829wLTaqhAkUyOvr7dczzmpow39bZ4i
         j82t7l2Qzv5pWNbMVwuZJ08V6G36lb+UhjK6uq/67+xQeRXWCHp8C4O9W+MPSV4Ccjqm
         Hu6EnE/KmsiCpoc42BXF6m/sanJdCmA9P7Scm+9yRKrFqOyDhWo5pV43SWSNBD2Jsvj2
         IoG2+tf7KNzO0b7hjdra4kmS1eAi2lEeLeNdkfXSz4hSgSJxd6FNY4de5yvSUxtovwJQ
         sHGf5HTKQch7zYBk8TJeMJcG2CYTeL5yWqWjmNju/WIK2a/h6jKLlzXjbzvuAbqtzw/q
         ARpA==
X-Forwarded-Encrypted: i=1; AKwUvBzOanLeYY+2fYfKGRgnY3s9doUMmT0CqLI0AV6+sAIrg6ZoW4zlFFonDniRtXJGOwT1bxJCGh1WIzDkPqs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFrQIKQw6t9b3gWx+RGRYvXFSsgnrfIlPdVpcCo1If1suOFvwI
	3EmRao3E+8LBOTry+L+HbC043phFy0uIiUgYYQR81BpeEQpqHpalhk9G
X-Gm-Gg: AYBFou1pRs6sHSwukZ+Z2NfIlFBbC6mhp5l0EQBjPdDe43CsLh2IRF1JRINEsciwflS
	AgH3NFZOWZ/m121cIzb5RYryTIoXHQEAoNCDVYajf8gP8LXItCu++rwt78vuoZJDlLYrXCvuwdF
	yGfWo2yn9KxZrnmUBSwBXZM2kcivo8sixZItuR/uKZnxfEGYfaDZia3cXWjVUx4axojuYela5NK
	5Rk7uKbgXOJuMb/Jv0CR7d/spybBDPNg6cFzIYiGuZiXrtR9VTEyRismz1wsCe54hctSigsgQNX
	W9XDLcEbNY2o8y9OF9iDAL7AHg85Pj1ph7mR1x0NdCICqPgBHLLFDQuyFb3bfZfYUclom/65Mac
	lLfHkfMWAPZZ1KTTwdfM7HLyNMWkgnBGNASqgL/BMG4mBpZIkWriTo6QCQsTKcEPmW1vFmoicC3
	EqoNCQhlL6HXa9usfGqLfhc9TLCVfCAzFYR87YGobFVCSBGQKEupoW8cHvxvPgDV+iirtpnUIZY
	DuSxCeyBN0EEtxyWjJtEJeUW5eDQsamXWbj
X-Received: by 2002:a05:6000:454c:b0:48c:69ba:77d2 with SMTP id ffacd0b85a97d-48dba77d170mr22270118f8f.4.1791981486598;
        Wed, 14 Oct 2026 05:38:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ebbsm11395288f8f.45.2026.10.14.05.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:38:06 -0700 (PDT)
Date: Wed, 14 Oct 2026 13:38:05 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bill Wendling <morbo@google.com>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] overflow: Match arithmetic in both parts of
 __builtin_choose_expr
Message-ID: <20261014133805.47afdb0b@pumpkin>
In-Reply-To: <20261013203146.387344-1-morbo@google.com>
References: <20261012205919.4012405-1-morbo@google.com>
	<20261013203146.387344-1-morbo@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 20:31:46 +0000
Bill Wendling <morbo@google.com> wrote:

> The two parts of '__builtin_choose_expr()' had different arithmetic
> expressions. This patch corrects it so that both parts calculate:
> 
>   COUNT * sizeof(*MEMBER) + __must_be_array(MEMBER)
> 
> In practice, '__must_be_array' is meant to assert if 'MEMBER' isn't an
> array and return '0' otherwise. However, symmetry is less prone to
> subtle errors (and far more satisfying).
> 
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
> v2: Don't use 'size_add', which just adds more complicated macro cruft to the
>     expression. Instead, just adjust the parentheses.
> ---
>  include/linux/overflow.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
> index a8cb6319b4fb..d0f04436343e 100644
> --- a/include/linux/overflow.h
> +++ b/include/linux/overflow.h
> @@ -418,7 +418,7 @@ static __always_inline size_t __must_check size_sub(size_t minuend, size_t subtr
>  #define flex_array_size(p, member, count)				\
>  	__builtin_choose_expr(__is_constexpr(count),			\
>  		(count) * sizeof(*(p)->member) + __must_be_array((p)->member),	\
> -		size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
> +		size_mul(count, sizeof(*(p)->member)) + __must_be_array((p)->member))

Why does this use __builtin_choose_expr().
The types of the two expressions are the same so it might as well use ?:

Also doesn't this optimisation apply to all uses of size_mul() (aka saturating_mul()).
Presumably relying on the compiler to report the compilation time numeric overflow.

David

>  
>  /**
>   * struct_size() - Calculate size of structure with trailing flexible array.

