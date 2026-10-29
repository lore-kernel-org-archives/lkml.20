Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267252;
	b=QP4lID01Zn2hSDSA8cVmLs42Ot/t0xVBtclAprc4Vwix6YwrF1P4/xu5Unguc2Si/C+p
	 Dy/1FV6U0WMNUfaZGzFDtQCcN//dXHdcVOZ7c4bvrYzsVJnet0eAMd3N2rSFIRY8Gij8j
	 RZGIdJqj6yoH6My0Jc+Ga6tqrYCSDT0Ns4kTabEsW24g3GqjbnomRB3sO8ZN9k8Pk77Qi
	 ZOVnNzI+c3EgeMphraX3sNZUFug4B1W63MfKbgHdordXE05uQeHNbliYh8bNSzSqnp74k
	 ZmCE1x8Uw3AfM05XKfEwxA47Be2VEtHJEM59ojd2o87eFkrJEN1MLPSUVjSAHWGOl6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Ycc/PH2cYi+TSN+J+t9gob/x5tzRRSZ7oT2i12vrEeo=;
	b=YtCH7pmDjfbV5IxsjbTdxIa7bhu9a6luNAuSZ/o+IZHllzT2wr3SsBI5gp8iVj80J7K9
	 X1lpLugBS9PJ6mINTGZvoNm80avPVYvtEm+TrtPysQC07eeE1FJ0lpIIoH6n74066Uvmv
	 X/YNycX1PW2v3JxrpTVDohkeKoGsLyyEIvOglhFR7CIaxOhiiXEKBq+VbdMK4FFZEhI99
	 bNYSWwdIehjks8nsf3dPBHVAdLTardFFhN0KFOyum23Ye8osWFrO4EimCAlUoFDUvAsHD
	 9tZzMcpr7iQeWkjzdwuZMRFgrVlGODOAHVCGF2h3vD8kzeB6kxlMbv3BdkZateWvQow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lgyz8mcU;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C35606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32C35606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lgyz8mcU
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e20edd106so1482617f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793267250; x=1793872050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ycc/PH2cYi+TSN+J+t9gob/x5tzRRSZ7oT2i12vrEeo=;
        b=Lgyz8mcUhNcUCDD5IEgfORz4mjRCOlDMVVZwXGyb2XgMasHxukqOAIuKTL2qS/xJIP
         jgZapcJ0sUEYf4GVksTsDeJAqNs6EWdkm8X178i1GQbXOWqA8w8+46IqC0e4+fOnYImb
         1xhcpRSy2WEn5LddmoGNxnkeQz90AC1DU8lRmAbcT19a4zfE6Pr99gA/ZdyZMbarp68x
         DRITRdMplt4ZBZ29SiA3eVqwysyChFxjDrvS+njESvzAgLWWEZFfkZc/PDvU0QwbkcbK
         n+LLceh6Tahq7Tz+dEsN4thuPk7gixUoM9V1KFokDx7Cl6xACPtmGPaxXZirYufIAE9O
         wT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267250; x=1793872050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ycc/PH2cYi+TSN+J+t9gob/x5tzRRSZ7oT2i12vrEeo=;
        b=RCQZkYxisGEkGoM9PDXV/YpKDhEmM0LC8JLBLqIY7UIt6mVWw4dRVmPBBn1wiUSP6C
         roS+kn8ScH63GJQKTRRgTXBsXgNy4KePe6w5YZllLtEk53uk7ZvQj47IfGB+U/C0rFwL
         C54Dwzrzkn8w0ixov9WEt+8yAj7TvqjLn9AU+GEoEtYf3iI8bMgimGm2M55cJd7UztBZ
         oFC48h8yCaWmmJWKArTne45hPktmflYNANZdDKv9sqyj6Y0D2VVMIcYqzsw+fqC3E4x+
         Ce2yrIxqI1VIEinODw3v1cgiI0YetgdCWDys+241kJdQm/cCXyXNV3PHm1auojSwmbQ0
         OTCw==
X-Gm-Message-State: AFq9FYLAqe74dA8W9LdP4pY6qa6XcAzY4DB9hkb2bYsCbFxn0O1pcRMs
	n+2niFGGLX4mrsT/RDq+SuPIKWoT5qX63t/Q+s/42YyHojXxLFCOE71j
X-Gm-Gg: AYBFou3x1G6Kqnnp31hnU7iEI34d0kdf+dCK/23I+tEzqsr9ak+lxN+Q/9meYkYmNan
	snci4DkKJgj84Tu34V8Lp4Lrc9fYGEy8+JFhCLPY9cPL7JO+b8dhm+O9UloFp2o9izdxjy9mAGE
	3dfgUBolgKiMduYXLXOORXHPs52bSUa3fo864ZCWSOvbqcc0P6D47+t73DMZLegg9ynlyhB7V+r
	eMJAKSij8xO8bexKqaYQAMaHkwF89PeimapZQcWL1jrFnw+BaIoXkEMKtbJ54vA2mDH13aW3kv1
	DVE4QqBXdxG3UMCI3g79kUj4jKzKCXKg7Q16WZnFaZa+VL1aL2rHev9PU6zWQgGAbtXYAeKsjiF
	6dQkqEQPinTqEop7byt7gB3IIAx4C2MxGHIK+ZKHFXND2R+3JzSGtm3i+9oBy4VrahCj7AGDwKF
	UTr238xX3nLCbjpy39vwBmBgeriBd/2sZA7Mrse2Jk0dPHv5Um3/IAzCur1JLWOMjsLH/He0yWt
	4FW9OcDEy2kIo879qQzmS9ieaC5emtqQI1P668kJt9SfK2zD3QtnYru/lACrEg1ZJ9PcdKtqq7g
	sOpBw71rrvfPjHez5cQa2cDArlpJP+3Yhu1NHPLkLNLSowC1Rrva8dwGwlAjcFJXVafxdOdSO8+
	GV0+OJhu5VhtglAhkzmp4fqu92eFFSGVzhOY+5G1JM+3vvHFwfJp74w==
X-Received: by 2002:a5d:5f92:0:b0:48e:69ed:cb51 with SMTP id ffacd0b85a97d-48e69edcc52mr1562250f8f.38.1793267250355;
        Thu, 29 Oct 2026 02:47:30 -0700 (PDT)
Received: from GLaDOS.station ([187.13.215.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb851sm28853779f8f.26.2026.10.29.02.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:47:29 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:47:27 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org
Subject: Re: [PATCH v1 1/1] tpm: tis_i2c: Add reset delays for ST33KTPM2XI2C
Message-ID: <auMWL5d6gkdRvrks@GLaDOS.station>
References: <20261028094504.4256-1-stefano.r@variscite.com>
 <auJb8drL7rpvNMyK@kernel.org>
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
In-Reply-To: <auJb8drL7rpvNMyK@kernel.org>

On Wed, Oct 28, 2026 at 10:32:49PM +0200, Jarkko Sakkinen wrote:
> 
> "Pull the timings from the matched device entry. If they don't exist,
> fall back to the legacy behavior without delays. Update of_tis_i2c_match
> with the timings for st33ktpm2xi2c."
> 
> I.e. the last paragraph has the language of a white paper.
> 

Hi Jarkko,

thank you for the review, I'm sending the v2.

Best Regards,
Stefano
