Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792522062;
	b=I5xeVutOwBs5Uhss1oGtlfYzJNCRrUgbW5KSMy3NldPSuidHJxzKTY2bfW+3bFmnajgo
	 vHXLmawjIGQlOXu5GkZr0gjyv3OKnUcG/3G+wrmH5EzTH/NBQitmI9ppqt3t1ZsPydtL2
	 UbfcCpaH+ZYgkHYu5InywdOV6jLWuonGJA8kCXyBOINAyRhQS2B01bSkj7LaQKQxYBPH7
	 n5HWMzvW1mznpEZ0nvbnj6NoczmW0DUNev7+e8Oc7yocfkjiuuc2Td4qF4MvBKAaZTP+C
	 Po68PGiGgK4q1xzZxAfc/oCOCqmASxCAgdzSTwUbeAVnLcASTmwv5Z0z1YbcykqJg1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792522062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=NEVIAWxa+q6sbG3Bq/x2CA113pzvbMJrwYJBK5kHkqE=;
	b=3GNF/fQz/c7mlCzs/F3zqQOfdwSbQxEanbVv/OpEy1ixDqOqrhsdWaW/vpr7yv929y1M
	 2PHmaoSvRV3uxEbOXSs+DSrlwBdru5UZeVHydPVDdJA9xH9pO4lT9ZbXlxsRAstYamVP4
	 Pfv+p6J4SrgQY8iD9jKnqjevUItFjFI+wXekGT6Ga3dp0Iw0rKACrt0F3CUPO+Ep3ytSx
	 wvBWxVjm5x8SEtY+Oqo37prnSDH3s48WTL+l9wLcNSbpaRAUDD+k6MsqbAeb+yVAHOvM1
	 iVI8KcFZlAIDfjRHFwXVa+FrEH5yc+YhUG5AIV22CCuG5BG2F1cZ3QcU3N6SRudvw+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Sa5NXzLZ;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC26606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EC26606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Sa5NXzLZ
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-535179e995bso148801cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792522060; x=1793126860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NEVIAWxa+q6sbG3Bq/x2CA113pzvbMJrwYJBK5kHkqE=;
        b=Sa5NXzLZLC5cl1xFp6GpVEMA9olp832CfbB6VI6WfjZthAIjfFaha31rnOLtmDxQrP
         Tqmc26+JG+x654yj0+nWvtCYOf7YXrj4nhwPMkHiSN3snHTSGkFBj8sExLpFsweD392P
         Th4lphLYZanW72sbY44dkj1vE2guWlEU4enLxSi5cU4HRlqmDEXyuGYrohOonjllHp/f
         X6C839DMt2gQIGX0/yoCr+wFi1WELclFxhSC9u2YdLkDa5H49OjE3ctEuxOEaJztQPOq
         /O4AQC3J66GegucPpgvcl9q8Rc7L23eGZVs6QPwesiC7Xj8PLO1sfpH9xB+zeHJ6hDf8
         R3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792522060; x=1793126860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NEVIAWxa+q6sbG3Bq/x2CA113pzvbMJrwYJBK5kHkqE=;
        b=ghfXvHfqzEafWXZMkBGYDdUrc4ARGbMZ5kEeyzcYd25zjjtwinyf3oIlUEqW0T20HF
         QisFXiw/BqjaofLYB5Je6qrlJaefxUMlDTNwmpwqp8QwhfA1nNj8TgkWOI0YxOp3+QL6
         V6XOGm9j+aB1BIBFcbpJ3xSrRLDOHscGDJ6C+P9rBz9CZxtet8pRLncp4eqwcFI52wCu
         1oh/QqUy0Rd+sn2E9c2G486Nsk3kKjHzIeeKMTQXciKcDGom8zRFpoIUGRrfW6YbhfSk
         rO6hXR3Hm7ZLwX/YtlgYXS0C0MiI/e/lHaD8V3QFqbpZgKh/bKoAHXDCIkwbtsPsmA+Q
         oHrg==
X-Gm-Message-State: AFq9FYLo1BGDWhjHpFO8t7AW/MF5Z8TSyvdS3ebZJpZGroFvuMVstGSL
	bjJmUehgtCECvKG490A7SUkD9zGKtpi00monqzg8ZgevwrvUCl8L8OFDJ6xXk+6nnCY=
X-Gm-Gg: AYBFou2oYh6hEphc6DZzy3KsROJSgDBhe6N2N8C6SLlSBg7F0kloXmvHULhyqs79Sbx
	M5STqcIg3h0Qxnm0fp9MN7NGNopBjAMNplEgw97bLnUwkr27wRc14mwOsIMcGRuU6oY7AfY8TT7
	41VcJLy/DOIeoZElATu4L+KPQvx8PBPLdnwNojSDikj+4M7RKEoWNxQ5H8Zh/fagZ+IHx5RqJzu
	Sy2MVckMt1qNjMqmTBfvZ021sWXx1VwAjWA6tEBD4WLJtCWOToI85rUw0ZhizVMrqZbI5/gkzNu
	30sVbP+MFpvRxtDzk4GTSv8OeHroH7Vp3mcv2DwQDFmirl5S+rX50JLhmUNaFGwqgfAQLZgYWf+
	tX1SUT6KTiJn7/szEToKFOaQUBVy0R/YShr7DO/Rd1ul82gH7AHtHYK9KZYw6Xlar84i4RzNPDP
	9x+rlmntr8pcjf0d71MiOZa9/t0kPMOkmmSBxyGiLKdFSr3/66xXHI+IJdw/g6oS1b+XILNx3qR
	RzsIPKCosfwqZSCHIKMWb5ySLQPMOxR8UwLvZcUt2QPVa/CGtRMaDBdrk+WoLjG9Wg=
X-Received: by 2002:a05:622a:1aa5:b0:535:232f:ca25 with SMTP id d75a77b69052e-53645bfef7emr161704501cf.7.1792522060406;
        Tue, 20 Oct 2026 11:47:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698b427f5sm2545661cf.15.2026.10.20.11.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:47:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJEs5-0000000CtNP-0Yiq;
	Tue, 20 Oct 2026 15:47:37 -0300
Date: Tue, 20 Oct 2026 15:47:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Message-ID: <20261020184737.GS14213@ziepe.ca>
References: <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
 <20261020143620.GP14213@ziepe.ca>
 <atd-I059nHAwcZFE@e129823.arm.com>
 <20261020145806.GQ14213@ziepe.ca>
 <ateGVeZmDcOSxaOD@e129823.arm.com>
 <20261020164755.GR14213@ziepe.ca>
 <atefXz-0cD9viNHK@e129823.arm.com>
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
In-Reply-To: <atefXz-0cD9viNHK@e129823.arm.com>

On Tue, Oct 20, 2026 at 06:05:35PM +0100, Yeoreum Yun wrote:
> > 
> > > If we implments this with library, are you thinking that file should
> > > be located at driver/firmware/arm_firme or other place? though we make it
> > > with library, I still think it should be located at
> > > driver/firmware/arm_firme or some place in arch/arm64, but as
> > > perspective abstraction to mange firme helpers in one place,
> > > I think this design seems good.
> > 
> > Will has indicated a preference for driver/firwmare
> 
> Okay. with this let me make a driver/firmware/arm_firme as library not
> a module format and make this library APIs (base, attestation) to be used
> attestation and other. This means device / driver registeration with
> smccc and done in driver/attestation/provider but use the APIs from
> /driver/firmware/arm_firme.

You should try to structure it with a firme headerfile, and some
inline helpers to invoke the smcs and then a very small set of out of
line functions that *are used by multiple firme drivers*.

Don't put attestation in driver/firmware/arm_firme..

You can look at what I did for DRTM for some inspiration

https://lore.kernel.org/all/11-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com/

After some feedback from Jonathon I think it turned out fairly well.

Jason
