Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB6D366054
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150226; cv=none; b=VTeX59GrB14Whb4XWbqX6dsQOx+0vp+fG137Hb50X+hh1HlmaroFrzr/DD3iC3s6awi02JkpPinfzmx7PEotC0pSWiCOq/uZeHTtymfAKhPUPjN+wJiQF1/PjEwjOPjqOQ8JjSQLjhTvnp39s44S615MFVS4nBkfdeDzYz2rWwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150226; c=relaxed/simple;
	bh=pFoLIhtHfUm14OpIGSbvqjL40AJBmN4Y3fFmZiUfOIM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fFZjoudWbZKfsAIHglrwMki9DadRPIspeGJRQuk6KYscH+YLyRLmNh8X0fmrIWoIfGnow4rTWa2fRA30qy8mEqbFtqB0ihavEEcsV/E6v3+RXb39yOkkD2tzKDIMAV4KRfQmsaDkGHvwZWVKq1XnNQyJ5RBF4aS34rXdz+3Iaqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9egalCr; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9egalCr"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c3304784so261121a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150214; x=1789755014; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3cxa3dW2rb8gMN+b8Efg94ssh5+KCVrUeOlRH+bN32g=;
        b=Z9egalCrHikkPZ/IcF01BEvdZ7/DMiTGNGDHvO1rHXBqHb8OLhjzBISaAYl0JeF+/Q
         kP4CjbE5uEyV4m/pVDLtkJqusJSxspRP6nSSqan5av3EpcV0WiIbVEnyWmwNohMW57nF
         1OD7CymakQ6aDYC3po2sxLxQVsrVTJhb7WnNrPKYXdGBm0xy1Ei4qLHiV2+XeqQybIgj
         yvT7Yv/T1LlKZRjnfc5XA806RAHFKvpyhl5+6FSRwkmlKDCW2H251YYYiXBvIHFZivBr
         yeWpZNeclqUw0SZ0JkO2vreDD41vzQbdEHPW52MhuKecI3RiXF5JU07BZ0s+lFvqWyd5
         yPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150214; x=1789755014;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cxa3dW2rb8gMN+b8Efg94ssh5+KCVrUeOlRH+bN32g=;
        b=IhPMdZGNWJ7GLqo52MN5sLGEthfHNfoVgGlAxlKkUmbkkbhoLxJvMILx6F6Pk7jMXV
         u50yeny49QN79ZXibAXXOg9Q8KQ3R+zTZ8MvuvvG/QFPCGaqPOB5EDN/IRqhZP417WVk
         8axybkJNWL0NXQNiQFQud7c64pyzxwCmzVSJBF1c0C2uqHAXsMc4/5lPJKxvJJUMd7JO
         cik0GAHfIxkOZNowy8iOMPHXZJrVGe0M6i24veF2hFYk1HOF8LDom74RcUeGc3z9q/fy
         fRE162D66Y04V4q2/DHYbE0YbryDm9TqnbPwydsThJQDyCMC38rachdcYIsg6MsbKsYt
         eDRw==
X-Forwarded-Encrypted: i=1; AKwUvByyB7ekENJBBBOacqAtf81ejWJEB5FZf7Ek1aehcSrq1zd49DSUiQR98cg6Tw5qqIkwOhPZIKnUAn6hLwI=@vger.kernel.org
X-Gm-Message-State: AFuF++kUl1APRFx/DXwBUxX8DJ6KnytksQs/ZRjrPpnOMT+cu/9eg6a8
	fu+xPkP13BnqhbfBtkyNR5lWJ5FqGzrSYvf10xFy4VQTvvPRh/HVMc0V
X-Gm-Gg: AYBFou3JR7lgjwihuS9F7CfX2lfqgOOqwPW5hQnpZkHwfR0JHRd6c+7fNSBIC5TIH6W
	17wAx4q6lfGcnKO2D7E8zH+8D2IrcrOWQOCFcnoQjni/GSqlvGOXXAk3hseiUA/06CB0hqS9ZE5
	L+spCcycTIm2+WGOdGa1NOo6BMDVTEEh6RGYHMSgf4lj4oPov9Y4KHw2vi45ewPxZwQ1vqe2ozq
	GAf7fnRQmngKaVj1gy/7+plBRfFwtNJqIYdEmqFTHdm3P7D2EO02pVvtrx5HZFodeUQxxO2gIMn
	kuNlrK7Rf1l4x5G+Qk1jY770O4m2T192vFaPFNsnXYXOjF27NXXSa/5DPHKNEu+fZirQxASeTYh
	N47yoJdRNIHWxqizJaYqY81Pt6QtrhXWfsr3dVQvC2p4DEGK8cmd86WcP1EMtkLcvuby+TGrilY
	Zpd+CzrCMz8+VFUHQj29VMZ36WYokMJkuBy2F8W72KDvqv8Y2s3Pv9ZD7nxP6E/Gg3+qc9OvVrP
	5bwDP6fpolYdBjfYu2PywW+k8NzKYYUNaPBYw1ZG1e6D6PCxps5DwOdjBshbIIax1jd52m6Rx4U
	Q4fmTdb5pz++v/nJyoxIwZ6/zwkBkr4vVhpZBfJxmUWP8T17
X-Received: by 2002:a17:90b:278f:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39d9bbe47b2mr10254399a91.1.1789150214007;
        Fri, 11 Sep 2026 11:10:14 -0700 (PDT)
Received: from localhost ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95752809sm6212701a91.13.2026.09.11.11.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 11:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 11:10:12 -0700
Message-Id: <DLCOTGSJIKI9.2U1ISL32HW8C7@gmail.com>
Cc: <dmaengine@vger.kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Anatolij Gustschin" <agust@denx.de>, "Yuri
 Tikhonov" <yur@emcraft.com>, "Dan Williams" <djbw@kernel.org>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: ppc4xx: check dma_map_page() errors in probe
From: "Rosen Penev" <rosenp@gmail.com>
To: "Frank Li" <Frank.li@oss.nxp.com>, "Rosen Penev" <rosenp@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260910214334.86689-1-rosenp@gmail.com>
 <aqQmw0j8-s5DEv9v@SMW015318>
In-Reply-To: <aqQmw0j8-s5DEv9v@SMW015318>

On Fri Sep 11, 2026 at 9:05 AM PDT, Frank Li wrote:
> On Thu, Sep 10, 2026 at 02:43:34PM -0700, Rosen Penev wrote:
>> In ppc440spe_adma_probe() the helper pages are mapped with
>> dma_map_page() but the returned DMA address is never validated with
>> dma_mapping_error(). On 440SPe the mapping goes through the
>> SWIOTLB/direct map, which can fail under memory pressure or with an
>> IOMMU, returning DMA_MAPPING_ERROR. The bogus address would then be
>> programmed into the CDBs used by the async validation and
>> mult/sum_product operations, causing the engine to DMA to or from
>> arbitrary memory and corrupt data.
>>
>> Fail the probe when either mapping fails, freeing the pages and
>> unmapping the first page if the second mapping fails.
>>
>> Fixes: 12458ea06efd7 ("ppc440spe-adma: adds updated ppc440spe adma drive=
r")
>> Assisted-by: opencode:big-pickle
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>>  drivers/dma/ppc4xx/adma.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
>> index 279a431ccae3..89e778896d7a 100644
>> --- a/drivers/dma/ppc4xx/adma.c
>> +++ b/drivers/dma/ppc4xx/adma.c
>> @@ -4156,8 +4156,22 @@ static int ppc440spe_adma_probe(struct platform_d=
evice *ofdev)
>>  		}
>>  		chan->pdest =3D dma_map_page(&ofdev->dev, chan->pdest_page, 0,
>>  					   PAGE_SIZE, DMA_BIDIRECTIONAL);
>> +		if (dma_mapping_error(&ofdev->dev, chan->pdest)) {
>> +			__free_page(chan->pdest_page);
>> +			__free_page(chan->qdest_page);
>
> put these to lable out
Problem there is this is in an if statement. It's not as clean to handle
here directly.
>
> Frank
>
>> +			ret =3D -ENOMEM;
>> +			goto out;
>> +		}
>>  		chan->qdest =3D dma_map_page(&ofdev->dev, chan->qdest_page, 0,
>>  					   PAGE_SIZE, DMA_BIDIRECTIONAL);
>> +		if (dma_mapping_error(&ofdev->dev, chan->qdest)) {
>> +			dma_unmap_page(&ofdev->dev, chan->pdest,
>> +				       PAGE_SIZE, DMA_BIDIRECTIONAL);
>> +			__free_page(chan->pdest_page);
>> +			__free_page(chan->qdest_page);
>> +			ret =3D -ENOMEM;
>> +			goto out;
>> +		}
>>  	}
>>
>>  	ref =3D kmalloc_obj(*ref);
>> --
>> 2.55.0
>>

