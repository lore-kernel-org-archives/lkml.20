Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792634820;
	b=Bf9VxC1jHxxY99gDriNuJr+UT3tlt93/9EqAhCp+QV4TblPfaUjpEAJk4ha9KIA33Ubf
	 u+ZGwx9Cnu2Kvy31hPVUXSFUMeAh376KgWLeZLT5hFS/p1z2ptEJ2YCdt8vhuti0d+h81
	 ZlomCRYw0RhAa8rQoBLor0Xy8b1Exs3S1vYTLk+c5HvV8MPuaO32KDPfkcT/B1U5UxEGg
	 R63FvHkWz0UzxmhqPc5tAnYjTU0htGyIkrIRS3N0//cQaDiwL9A7n5gz6PFon/lWXV/EY
	 0W/ebus047R2dGeBjfzRIwvz5hyWP4/Ev+nFj9GBNI8coLffN0nnA9XlROo8l3Eu51g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eQ915uMcXwm+HIjz60hdmKSaQ15t6ZjQjfLrkfmZVJQ=;
	b=mtnGb2EHhhD+8y9b3g2vd43Fb8ICOtfHxI6n0yUpTf4bG9ILznl///V4jfPBSTr6ewbn
	 itI5BpjU0iwhyuv+hQSzHe1Sl5b32EidhARB6sOG9+ky5NvQ4CUt2PhVsmIbQG/cAGtAN
	 8Z9Pwo9Qw6UqGaHP+G1lLya/4SrA5P/e0011rqrDUDiFr/8I2EfWOK/PFoEwPLa9IOXUi
	 3grARxzsxivjxNE+m1JAEMnfDFbP/9mucTEWf9pViIIilbQKct2ayJTyqWRDIj6jFlR89
	 iFha62JcUZLBeiKQsE9+ykLIVDprqYbsPW2oTCy8CZTvwx62K87flPXeT+6q8ftzcZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O3+ZIBOC;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E55D606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E55D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O3+ZIBOC
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514b90bb89so3715712eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792634818; x=1793239618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eQ915uMcXwm+HIjz60hdmKSaQ15t6ZjQjfLrkfmZVJQ=;
        b=O3+ZIBOCk1wCPp9waZxD2cBeYr4Abqb+o6rfsr1DcTVjiU4Ni2wmp2jM7GU15l0H4E
         IKPJQpRb/LcroSa38zbAWWYhhELXRxyJLhaJ8l2xt2iJKQHUAxaOWVKIbMBGP9TRFDbW
         eqOr+vOlVzw2FzOrkrkitxjDx9CTlhbbJyMjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634818; x=1793239618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQ915uMcXwm+HIjz60hdmKSaQ15t6ZjQjfLrkfmZVJQ=;
        b=BFVcvmo93oHsNuorbWoMtWsVEqq1y33wKQGRCv9+FGmW8tTvK6O8e3fJUGDWqSEtYe
         XYTHUsiAJNEltN6VXAj6JXjhlqy3j9rNoMVrcNEo2y39lHj+mtrounBxuhJJB42lc8bk
         LshVyk7mU0Ay/H1/bcPxwJzZrUVfnhk/rF1cvuUw/TaYWWx5oU8wClLVltaVRUJ3kbav
         f7Tiox7NQPebFPgZB6MwAxr5UkzvzQrKeYh3MiYAsHQMVfUaxh/1UCSze3aGX2rgT5oK
         V4ehvRkss9G+Mw1CVVGMri5sRV2Z/uJhH6TE3Jcv+S0dprE054B9mcZoiMp+53EksL8+
         hqPQ==
X-Forwarded-Encrypted: i=1; AKwUvByhe4YLHlwbDSLvRITrJ8wgH2cPV2ZiHruA3gVNtnH5hBwwSqffQT5hDQSUQsW4Kcsfi33Nk6X2AfgVTLU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIO4sJpIey9ngUmQ1Hh87bbJD7Zf5VkHzWu4SU7mqDXnFojP+AO
	OMfSS5eVnHhwxSPRLIvklnyAWWv7CtCtVNfFLHbcYxjx1t3lX2Hz/h2YHd+z/rx4TQ==
X-Gm-Gg: AYBFou1xgEN4Y591iPKIdcKh+Vakbd9vtisqvTTAPm6D6uvCn9vpi1DtkGGZQZWwIrX
	7n/vKkEqQbrKwBHo4/s41jNlF1t1sBpb0EU4VQTre046zttFt6buOMgWWgzinO99IY4kKyPLgl4
	pTKtca47ChC1VuY5+Snp+EHwWGCwkkDzvzExQ6hzOjMhpKRhq4FrrRkhJVnYrORWSAFqHBwBW0J
	ItK8zrsYMY266BNu14p0CbzaSPFp2C24+svLLEQaA31Ri+cfnO+op5EoUCN46ujdcThsm7A6u4O
	bge1aDACedlG7AurX5aSbuRbPtJeFPPnrXdI/s5tlKN3+23vyRFtrEXLNbhcDEt7cv+i+c7UjM0
	8ZrCvrnZoHYvlbSMkLVLNTSPwupLusEF8qxs4kVusOdHbc2ByQ9Aqi1XCIf9uTaHSSsh0FaFPTG
	eDGliMr2unf/tWv+aV+11+MTNVgwdHWkSyfHdaO5rNaRMBjvYkHPVpsAal3p5lrS7HLa+Q7upYz
	dfvgDUOUFKWgvOhGeb0LjNt5Q6qfzsEqiaZnWpU1j5+yfwqufQAkLJGnc340To/UIZlIAcGNAc0
	5SsIpjwWDQS47jC34+wS
X-Received: by 2002:a05:701b:4308:b0:14f:fb87:cf62 with SMTP id a92af1059eb24-190a5d6f6famr4655442c88.27.1792634818203;
        Wed, 21 Oct 2026 19:06:58 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:5145:5add:2df6:4671])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d3ae06fsm10318111c88.19.2026.10.21.19.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:06:57 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:06:53 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Hillf Danton <hdanton@sina.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Brian Geffon <bgeffon@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v6 09/13] zram: split zcomp into separate R/W streams
Message-ID: <atlt8YGuSxgRb5uE@google.com>
References: <20261021075322.923-1-hdanton@sina.com>
 <20261022000822.938-1-hdanton@sina.com>
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
In-Reply-To: <20261022000822.938-1-hdanton@sina.com>

On (26/10/22 08:08), Hillf Danton wrote:
[..]
> >>> Given lock like mutex, priority inversion happens from Monday to Friday,
> >>> but I wonder if you are inventing some wheels in 2026 if proxy excution
> >>> works for you.
> >>
> >> Reader-Writer split is a foundation for further improvements (like
> >> singleton recompression stream and so on).
> >>
> > But that split is not needed at all if PE works, yes?
> >
> 
> When the number of locks and tasks grows, I have increasing difficulty even
> describing the lock chain that you in combination with Brian are unable to
> handle. That is why in general PE is prefered over whatever wheels you can create.

Hillf, if we reinvent the wheel then I'm very happy with this reinvention.
But we don't.

There is not a single reason for compression and decompression to be in
the same context - they don't share a single byte.  And there is no
reason whatsoever to serialize them against each other.  Compression and
decompression should have been separate contexts from the beginning.
While serializing decompression with a PE/PI-enabled mutex is cool, not
having decompression serialization at all is way cooler.  In addition,
decoupling compression and decompression leads to a much saner recompression
stream design, which saves considerable amount of per-CPU memory.
That's what this patch does for us.

The commit message probably can be better, but other than that I'm
happy with this series.
