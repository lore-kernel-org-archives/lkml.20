Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562475;
	b=OkLN8WxOzTsL2DcT30YCaxqNseR4/vmXSmQDOfetAWJ0U5gzg3iMMhWfRg1MbGiXINKB
	 Z4pnrq2zQqVWbKoSzhMm7Gj4jnzhakkytU/dfnnosPCVinpvMACLt/sm8+xZXjVJ1sei6
	 Mr1GBwvcZdMeHgxru7bcdjIVUUCHk0WNsNZ+OiX9hos6DvRst2P+6/V45C1yUa2jOHVZF
	 xbW5EjE2mLIiW2LRbG8hk53+Qv+x7X7lNbDJpXiI2XUvegBDzx+sNr78HJrtHkQvnGwLz
	 kqUKsveOtpJGzf1tcQMGgDHos9JkrnnpF5wegplqgW7qeIZgQmR103qpAngAYtP5+gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I6WEPKgW1axx4i+p1+sTBf7I2PMiYFAR/OFTSn3tv0c=;
	b=i11nZpeg5NLXqUP72crDeKY3wml8HH/dPnmSHdw0XSsLUYPj1wYpqtaelYll5YP+1e5g
	 5MiWH68IJiZeI+h0jA7m2PwLMMW8gpmCCp/ciJQYNu8XqziNlgfFuugrU4RhvVB9Sqkfv
	 M1Yd6DDDp1wM/jyK8PkWnAioW1YnY7QTW3WvDfpWnJb58u9cxpaInbKLqr0cLn8tMiDE2
	 H9MHzXlhyFNYWgHNCxHZolDS02qlHyiDWMdDmmX3qCbPR0r92bYxChh8QrNwXczY2RcZc
	 FvUt1IavG02HSbOpvSOOxYsAaNKvcg7hPLXrk7Oa5rKyYIXdcen0NL9jVj5dwJQsX2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KBRqZ+IJ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D304E606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D304E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KBRqZ+IJ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso2583425e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562473; x=1793167273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6WEPKgW1axx4i+p1+sTBf7I2PMiYFAR/OFTSn3tv0c=;
        b=KBRqZ+IJJXI+G+QxSWnfZe+IvYF5glY8s82RwpzKDpP6dLgJ1mCHjEsofSwQ9iSVC+
         XP25rL1RSkimtSmht1xVJcX75u5TonGbEi9tsfX4jLoh3eh2rl20JwRoc++fqjbWei2q
         WfURcT4MrRKVCir9UiE83sR3sb0oqpDgYUMH8uSml4WP/fYGTuI3Zq+3t+JnXCsVUUJS
         J1/J10GjSuoNaNzZrk4lCqYsHmE+ka3yPro0Fz0IwZsqVgoZ0J6PrtfbGNZLeNb2dyGv
         PRmnO42+lMNAc9alUMrTgsjejAGvFS5kj8CReg5S2EPv9W4g7ESbW3TEWFjtR95Dy4R+
         gAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562473; x=1793167273;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6WEPKgW1axx4i+p1+sTBf7I2PMiYFAR/OFTSn3tv0c=;
        b=rN8ij2pca40yziZz/4MCRkwuPHASMFsOUrC13xxeDIHXM7RcGY7M2eR2ucVPfjcjR6
         hox/CRlw8wthX0LkWD9In7C4cfj1VWb/9Dn5ijkPXkIHKK5LQNvEpx4eNNLLgDYBUyQs
         hnU0O9Ix2SrV10a4Jb3UN3/f3IuQjhGDHFzhi4NDkDskcVche5X1dQq7PtL2kgr7djt0
         H+7IvMQ9K4Rr3iYrqSJOm0IxkEkMRQhEAbwqZM6R6RHMeTEQ1iPAnz9yvBlF3co+XAZq
         lWvC1hTW5TWVYYPq8hna6G5zPrtvzUjLrCdnpkCm/4ov5yhSya72aapPKqIfQBSIXESx
         PPyg==
X-Forwarded-Encrypted: i=1; AKwUvBzSxkG3oRT+mGWqM4TsKawAYWOUJ1HzcatzPFn1o6jI9grrm7vxFb79YiSYEY1K7U+bsX7jJV2pTJSfPAI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJe5pj9J53g3kZLLhZuqOYzXgAu61JvSjfCEVHbCGwYK3NQKZDR
	RytPAa0sjAn7nm3Rmsi18YN0TPHJwh9g0zkBY8ILaVR/aVwCdQ73f3FA
X-Gm-Gg: AYBFou2wltcjMk1g/OoxwmJaEcXrmgiGyXB/DlJphUYhsSEWtSTVZpSPDpKOjLt2Hy4
	VC5e8FK/RsNK1iZVNVfAh0+eHRIr24n9aTqs07OjrUe8msBHGJ2zcdxDzy7QDSs+w3aN0vjRyHe
	XmARnqbnL6jNy6mA7yKj9yQtkSaDLPYC1J99rEfA6QhmcffwYX41X4mw2MxDotRlnYIuJ07j9Ub
	VxRpHhIkN+4blYMFIw06vS0eAjHN+m/qp2o4bJq88NWU55zcNiohXBoZnWHcN/lZGrATNB0cm0o
	ZQDjsI9pI/BrDBdF0pcQwev9fyXqY1o45Yh9GqREkPeMk7TjQy6Md4cZcrXCFIrBGTCkmqKWiJp
	/xZyp7AkXfU6TePXsFa0ueU9HT9GRYaIi++tv6lFG26tvEvbmVs4wbgkcjc5MQ1CswLheEkrzvG
	SZDhDP8u4SPgkIsz3vrxgWMFsWqJKeE/fe76bR4f/rD0LvI0nTJ56dsOiwZW7IZx7rb7NknZgJD
	mdhJexQOSKWOcrIY/FAEXgIeZynOrYc+Q/GzORbeuma0A/j4Z2i
X-Received: by 2002:a05:600c:3b1d:b0:4a1:d41b:5060 with SMTP id 5b1f17b1804b1-4a1fdb1358bmr16212135e9.22.1792562472909;
        Tue, 20 Oct 2026 23:01:12 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm63841515e9.7.2026.10.20.23.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:01:12 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:01:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: LiuJunyuan <2058432396@qq.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: use scnprintf in tsi148_alloc_resource
Message-ID: <athVJV7ZbRM16Vd5@stanley.mountain>
References: <tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A@qq.com>
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
In-Reply-To: <tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A@qq.com>

On Wed, Oct 21, 2026 at 11:13:49AM +0800, LiuJunyuan wrote:
> Replace sprintf() with scnprintf() when formatting the resource name.
> 
> Signed-off-by: LiuJunyuan <2058432396@qq.com>

Is this a fix or a cleanup?

regards,
dan carpenter

