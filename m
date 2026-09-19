Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8A345C6EA
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817753; cv=none; b=sMcaDvd8/6aDuT7pRPVyg2c1OGFlPCeauRyEuHqhQVFUUzXWzTwELZdWRbAfMVAq1xe2uiPdyxv5iBZrp7Ark+kIxSXBRh4ncqg9l8UkCztQhjgyypgMqZ+Z+eAH3ebXDba4k+mnK7fxDH2jGd1b/feQK55S4RCS6c54q/ojb5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817753; c=relaxed/simple;
	bh=db6RuuBhwMozGXCwqVkwUYnmsJM3LcJNboRTL/tXiaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVa58SuUuNhiA6DgVVBmKi8HC78olc5vSuk7v/P3f4gNgdnDK+7M+WQ1rLrBXDQhFkwLpsp1Zjfhge+wu02ilgU+Y+q8Hw7KpBZMHUm3GtCBM9Sg2SyZA3lOtIf86OTlLFPFwQOOWmv3L1BJR4PaoSCuKBAugv7J5O7dEfZQOGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAmVntU2; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAmVntU2"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso1296225a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817751; x=1790422551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LB+tpTvHTK46vCvYu1SsitSoCwkJYe5UWMMUceYuMuY=;
        b=aAmVntU27V7Jpb6qixRHxQiRGEsiv+SodGwg1szoBCVFt6t/ecYo6AWH5xGNkRZ4Iy
         m6Gmy6G6EWn6HzihBt8Nw/liMpAkm4ldObabO0dzkNka/Qks6cVuBMQglWzt06E/ovKG
         /lEvq/Y0ZVwuEwjGsEu5ERW1XJozljGNccr4YF41/MLhZpCqNnFb3TpfI0BOe4r3z8X7
         6Jsjs0qniPXYmnetIqxiw6xsj/uKiHDsMy5ZkSvxFr5ahm7Jdp8NWHg1dzKBZjGZGwt1
         ftYbNLULYxxeQto3aho2mHCOq6Nw+D3N70ieZOxqImynTxitGkM5YDTxKcklJVUAo1A4
         QGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817751; x=1790422551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LB+tpTvHTK46vCvYu1SsitSoCwkJYe5UWMMUceYuMuY=;
        b=hgR3AoNUsZEDan0eg+7PIBpUfleSa4qsqAQELFnBk3DCMll55Fgr+1fdBhG8r2IP+7
         6D94ilYVXOpgS5OTM8BdTEgeTBd5gF+uStndAI70blz7ozJKWgezT8fFu51bQP5xYrof
         RV/ORrTp80M/ajTJ5EiU5sSYxGoUQclYSkny5ws8kGx1jzsQMfbfxuusuUK8NLzJKRLp
         n4plij1bw5MMCVaz4qD5H3TqK2kth19x6IuVLniqBDsc1NUuqOyxngC++SZ2FZ3LYswv
         sbSfO7p9ClnFEm0hTi/Y2PB61GCxGXpOD1hjbfskxvrT8YiWzibB90RIUjv3scT1dXNa
         Xcjg==
X-Forwarded-Encrypted: i=1; AKwUvBy/B8rgDlDamiHaL2D11c715ZyydMl+cxHj4rnyjwp4drH9skkGO+b08pf7/lg2jmapH0VzwSbNPqvuKqo=@vger.kernel.org
X-Gm-Message-State: AFuF++krJB2hNRl9Sp/Yxs1AVZqQusrYQy+E1AFArMjAJ1s6WLbb8CXn
	KSJH5IN8RnFjM2M6Gq8M/hj0beWhonuAiJebk1rVdjVZvFL9lSv45ix9
X-Gm-Gg: AYBFou3WiXUbk35iHF1cSadjtUKjUu7SwDkFCTw73OMAJ2pDLK6mVC98o19x6wPo+DC
	xnG3O1DPzc3PSoq5sHOO5jEaeCH2vSlhuU7HylD6d8aKFIrJ7fDKju7KFOhH//Bmkpk9jiiRwtH
	Oox5fqa4DkKpWIZL74wVCNPadx6Jcmt3Mc34JZrqIzigE7oWP3aGrzLjqyUFTYgpZjzpuF3/Tku
	Q0vaKaDMub6zeeNNx5kov2YKJIFQWs36m1ox7ZWYH/kc+elgZcyHG8evqECIpUasr+8AUpWppUN
	Z7tBjHwSkQ0PhT1E3z6q6FjKIvP9ZfgU9QJu38ndeHSb+C70G9FY+L1nRZ96XJBu1TjRd9MOzWG
	5ZQUKwKabf8IWqbfGTlbHj33lFZw4tUAwvQbONiVC4J5cP2E7LE4sFHgoEQd/4I+zWzKEbf4f39
	Tvy+b6yYrtcpyeXd+K+MXmd+FbxQn2rlM0VLkspXLORT6ST58qL1MsvplvpCh2lITw1OCeqIfpW
	T8qggqYCDtl
X-Received: by 2002:a05:6a20:20c3:b0:3d8:1f68:59ac with SMTP id adf61e73a8af0-3dd8c529902mr9848155637.23.1789817750774;
        Sat, 19 Sep 2026 04:35:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f17d77sm6091435eec.3.2026.09.19.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:35:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 19 Sep 2026 04:35:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Message-ID: <d815627d-b03e-4ea3-b8d3-52bc3448c798@roeck-us.net>
References: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com>
 <20260918-add-tda38740-and-tda38725-v6-1-a8b11018d850@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-add-tda38740-and-tda38725-v6-1-a8b11018d850@gmail.com>

On Fri, Sep 18, 2026 at 06:23:54PM +0800, Colin Huang wrote:
> Add devicetree bindings for the Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators with PMBus interface.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied..

Thanks,
Guenter
