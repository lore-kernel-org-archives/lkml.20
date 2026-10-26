Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017267;
	b=1hm7izTcSdvzkL61H9Y/6TjaUV34d/wqFa6gK9Wit4M4KiA+KwF595fIULjFkxjIhQVR
	 rPAyDTlTdKLAorUFYXtis73PtpMQkzG38WqcBGR/NXsmTzCl+D/q01UfWQsmyHZZdubHK
	 O6keqWoXY9Nx7tgexpOgmsB9exQ42Kb5VGAVHI5G+OPILblvi074l40oTJkillxk/zn5f
	 OyaEvHlMdOFMOM/icdkSVlvQKX+iGu1bPW0Ie+vaYNmc46vOJCp/+Azj4K9V0BM8G/RUd
	 4kraaDykzuvqeEwTMnEUpTNd7ZExlK8slcys367cNWDihRjWssaymC/iQGjcs6AXBUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=CyuTVqrEGPeDy0Z7+MBAQ6iLsoLVTf0+QXG1mFBmti0=;
	b=nsxXPP/zpQr/mkBh3mSAF9ZIGxz1L0PTaEXYuj6h74Y/3XRTdPkZVr4mdN70sN9qpS+9
	 PAebp68YHyo9gzBDmx5W8BsduwalHybbbghBaAnUkY2IxzCuciWfoz4LsC2dY4fsZBwl1
	 8MUmI9R9UcoO6Ia0WfZ9q09lbYtFcdZ1aZnev8B8DbnueW/L69cxU2R+Dh08oFmYgdO/1
	 4rX1xPIU2Y4elAdU8xI00UeEQVRSGWh9sI4YZ6OzH0Ca3PJmcNjjnRJaQTQuKtkA3ldH0
	 ZIOCb6gmmV1Bd1crUZS8dBMFgywnr/ASBqooNlT5OWw3GOoK0faaTVIR4+PlU1qwq9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GKciuavA;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EA8606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95EA8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GKciuavA
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-990703f817fso1645792241.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793017265; x=1793622065; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CyuTVqrEGPeDy0Z7+MBAQ6iLsoLVTf0+QXG1mFBmti0=;
        b=GKciuavAF+9leS2pq0kl1jIr9oX52ttnm9N1rV9iURmgf518/zVSA8zUYlPoprBnMK
         1CrszCrIMVII9ic073c1/eJv2aCE+U/Ml9z6Gz7AEJahOEylEDSAEH3beRgS69ZBCrtq
         R4g5STi5+xS+Jwxw2v/MoYssQO8mpt6wLkM3wB06CgCG711zWCm0cDD7umPR7rffrhuv
         kYkrfvQLiKMCjcyv9RuThXlcJ6aRNYJwcpOnjP+q6LpVmO3mInaelgOWVD1lnryXu2De
         xnljQYB44FkjlVF4h4HsUZjtwuy9mgEatHdqitcrdvHYuC4AYIgDU/inCZZYNy9opN+Z
         J6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017265; x=1793622065;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyuTVqrEGPeDy0Z7+MBAQ6iLsoLVTf0+QXG1mFBmti0=;
        b=ivaZbzkTvK87bZ0m2Z9RSr57pHnm62iZjVLXy5XB997oB2SckT+RtxJjhXWpXPZuhH
         Fzk0RP19m32AVUHr1lDYLe7+kYZMnsm8w/oHUiVFT64r2mtESQPzsgSfJkjYm+xHsyYn
         piZkGpwEjYBuXiwjKmtKnS2f1tifQbIPjdZikocq3ZWhm2R59bq/4p/bNdqktItwMZfp
         2Q01TJX3rInk81LsohWBHLbpT62/hxuHUb4HbCdrf5njEgLV5ICH8UZ+Rg/1f7crxAof
         drnxLtj0PJQF4to6B3LFE94+EpiBLjxI4UcUsQuavxIxRM8eTMWEL3NAsRRQUMV36gGa
         sTgQ==
X-Forwarded-Encrypted: i=1; AKwUvByZx6ZAHfuqrW6k6ea0cK3DaS2Duj/NRJL0qFR3suBbp9LZdHhDIqz006Nnl0/ehGmGYJ2e4LqUPJEGD+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOa/El8GbHnrj0olwswEU24cmmZzqUFTisfTYFcvYPWngxbN7V
	PWXZN/sgA8tv5TRMbbI3URp28iYdOz+idbtR9varoHqECXOFUA/UcnGU
X-Gm-Gg: AYBFou0onJevo9dAkjD4eFWsHYmXcCQMFtdmRG/XGn60uZs7AozZUYqIi51p46F769W
	WW6bp18tLKIrXc9U0gQCeQs7P3D24KXPzwAwa5fOPzcJjsYIXcku93tqlTI8LaEs6FHY4kLHRVk
	aP65WnBayB16uUX8v6M4Yu95AMgLiwgsQV8hq9l0YkrJpJ9IAN5vzymj/J4ty7fCnAFDA44hev3
	cNsLxy1cZhUqdoFENtlPoyuIrdMspzX4tJiG4SZ6/q86953pnqM6FYI0i4o/JxGw3U87XvJX9wi
	2dd37m7gjgAO+ypZfiKPMAHff8xHMbk0xT76JKRVUy4GjzN9M0guJWQpN+BbIEHPmZxv9ifsSnG
	begUUz3/pM/mYnT2HmPTL2tz5sROoEBSU4ZdQpCjSEQPGs0KjjrhweVBqtIZluiikrHTS5eM1m1
	xEUstiBPcbdred6s0oSrUlphdoHYl2TSI+X1iEVUmElWYZJe1kXli+DAumZtjTmVpiAxB/j6ZUZ
	TumfG4aWvV2f2UMmxqC99Bia5QtF7oeloct1PxW0+l+cuQLWc+H/Qa9YAf9Qc3/DEgh00y2Os7M
	D0MhoN5JPhYtJoKYASDGUNuZWEFZaVacFToR5UTEgM/jz9atnxbi+vbxNp15uGg1IBFbyhKPyyw
	6SZ+CMXilFrhZ/zlGJYhjrNL0p6t+ely31sVi+2Cpvg==
X-Received: by 2002:a05:6102:38ce:b0:7b4:879c:bb8d with SMTP id ada2fe7eead31-7ce5cec4393mr1848330137.37.1793017265352;
        Mon, 26 Oct 2026 05:21:05 -0700 (PDT)
Received: from c.1.0.f.7.a.5.f.d.4.6.5.7.e.5.4.d.7.3.9.0.c.2.a.3.b.1.0.4.0.8.2.ip6.arpa ([2804:1b3:a2c0:937d:e94c:8101:376c:4b55])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e16eab4sm7408804137.4.2026.10.26.05.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:21:04 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net] net: dcb: initialize PFC value before calling getpfccfg
Date: Mon, 26 Oct 2026 09:21:00 -0300
Message-ID: <179301726001.91878.13970924707743684105@gmail.com>
In-Reply-To: <20261026073235.3huvz6o5h6psyv76@DEN-DL-M70577>
References: <179289284460.50470.572724041164324949@gmail.com>
 <20261026073235.3huvz6o5h6psyv76@DEN-DL-M70577>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Oct 26, 2026 at 07:32, Daniel Machon wrote:
> I am not entirely sure, but should this patch add a fixes tag for a driver, when
> the change is only in the API?

Fair point. The uninitialized u8 is in dcbnl, the drivers only make it
visible, so the driver commits are not the right Fixes. I'll drop them.

> Also, if this dates back to the introduction of DCBNL then I guess its not a
> regression and maybe a fix for net-next?

Agreed. I'll send v2 for net-next once it reopens.

> Why noy initialize this at the declaration, like getall is?

That works. In both functions the PFC loop is the first user of value,
so initializing it at the declaration is enough. I'll do that in v2.

Thanks for the review,
Joas
