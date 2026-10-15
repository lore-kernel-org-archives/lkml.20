Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892934848BA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055057; cv=none; b=qSia8GXBX9jhNprTwxZo6aGau9AugTXb8Po/C7AyyiUjRGd395cnCJheq1MX6kNRBk+N6TB2yW9fFcQhQVZvyY6Wkqw8iPKq8t18yPO3f7mIXAQLEAmjz0ZiRHT4dwyKnLAXN4HwKWFjWO0RmNHEvdvIZYOVrwFrG6HnZx60LTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055057; c=relaxed/simple;
	bh=xoSMGcPrzf+w4ikyCB84AbmV6Jpjst1FcJWplTx8esM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBz9/Q2wk91TFbFvM8+DbajYZDqEuoi1CIiNRqmQ1dkcJjnxDQZsLBgeYFPefq0NcoeNTiqEvlssMEcctfkFtCkwcBiIKo+QDMOVSxzjqnfrDcOkvH3ToJRWQEwnez8FvPsWN0zyzSXnOi4Y5tdOEH3r4UP71uDggBUHdf2gG0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQ3Samn+; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQ3Samn+"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc751eddf25so3077674a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792055054; x=1792659854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAp8nRUf9PkjRjYtrHFE+R8uyBzEHqKOUymE8wD/INs=;
        b=fQ3Samn+P858XwzOXIVfDZwxT/bskJ2O3BrrkISWkWOuh4248zlzPX5zxwI2qNL2F0
         4QlPqYj7LP5mJAD41wo4k51wicG7L7Y9f1QJ2ykXeqw4RWayUrMIJx+zE0qXGRQMfKso
         ZoO4MObKUXhmOJtU1QJPZI8q9Ww9SiK89QN0yhS0oCaPdBkUIotyieYKiBaB2or9uMvZ
         hURy2YOV/a56ZDFwEitcunTJEGqQ7W8mWnzmecZ6srUB5xUlgCh7R05N6d9KTAPhFBqF
         wEzM2PFnBOkVvuIwmnJHOhK1ypqsTAlMmw2l9gYy/Pje51Vfs/6RiTZJ7V6MYiwGJzn9
         0Guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055054; x=1792659854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAp8nRUf9PkjRjYtrHFE+R8uyBzEHqKOUymE8wD/INs=;
        b=WghrFjUpvRbfZPkKBnhoLwz5FSMFcLzPBxy7moV822+rZz7U9wW5l+jO646iwdMosR
         Szg/oqNeRCUpwB1GCmWcSBHQOgzg6LYMFwpxmSYUPc7S783/zZzsm97gTWkbPVj7hbQT
         RbQzUYlVdfhHiEg/XG+spOpgjFEcF110PgoIpqlPTNOR9MxMhZS3TDJ04AXAJlISgsQG
         uuQ9fKit4OHFzbnQRls5JANeg+f7GDDbBQC09NQAOGn+DbfDojqkgAsInmHhKMsC+t7W
         PcPHHvTWIfjE/TVY7ItUKr2rXlRlRc9bhDazaLCsx4bI2I/7a/8M50Jn/G0mSEsBQG0A
         LL9w==
X-Forwarded-Encrypted: i=1; AKwUvBwQKn2HoDERKFgPziPQ6HNoOCGZ1y9+eJAVI6tfEqMzSJTkI6G3SNdaBaBGuSOo2q2cSSyJczAsy9g14RQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQCT7lV4UtVEVv1hmkLTCpJPU46HF3ySUzZL+N+mz5ra0QQu86
	UbpaTfa7VYni1cfr1FooCFQh1GBEw78/lq1LDamMDn0rwHf0xDilNB99
X-Gm-Gg: AYBFou1+Sch4FEN2S31FMvhyV+bq+MdsvfvBqioITczQA418RbLNWDHF6IWSb1/Bc8Y
	DIjxGLDF/0DylYaPPwmQSUMOmXafMxMOgmKOm/CGWb6fyW0g4ZF5jBO5ygJUXlHztxg7CsBS4v7
	ZmWDjzxhS7Edi6YeDr1/oBOmZSM8ZSJ9E9ma+8srr+zY8wVQ7cQ5nz8R7Lc9qhpLvqpSjFLjzhi
	6hxrUbgQt+OJMccwJNtM4QREuw3AcmobO9n2sCpY1opG4JrOxH6kS5E+EDa+eAIibv70MkolnN8
	X1oMoWzkwjyZWshWb2Rx881Sd8xgoh1aUJAdnoEymBHdPOKWHp/T/wfzwSZ/wIDo0idWtC7K4ky
	cKGGDtfbPY4CO70IzDONNzxTkZ7vn/gHcgc2DT/HEUgwINeqXtP6ajbfy4NQ3LxWSbgLX+G7K1X
	X9iEM1a9SfpdVNNVF70hJ6w0c4uAPWSX0B2NKDdz3lPMyXOJpLPVBCclPyHEe8WFJ9/mwX
X-Received: by 2002:a17:90a:e7d2:b0:3ac:a521:959 with SMTP id 98e67ed59e1d1-3aca52109eemr559134a91.29.1792055053807;
        Thu, 15 Oct 2026 02:04:13 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9474b52fsm3869119a91.9.2026.10.15.02.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:04:13 -0700 (PDT)
Date: Thu, 15 Oct 2026 17:03:41 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
Message-ID: <atCWzDzmknrsMNNQ@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-4-inochiama@gmail.com>
 <20261014-romantic-pretty-petrel-36c7ec@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-romantic-pretty-petrel-36c7ec@quoll>

On Wed, Oct 14, 2026 at 01:43:50PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 03:45:15PM +0800, Inochi Amaoto wrote:
> > Add eFUSE controller node for SG2044.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
> >  arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
> >  drivers/nvmem/sophgo-efuse.c                         |  1 +
> 
> Review code before sending.
> 
> Best regards,
> Krzysztof
> 

Yeah, I forgot this, I merge it in the wrong patch. Thanks.

Regards,
Inochi
