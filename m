Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E92E3F54A0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055015; cv=none; b=EfIqk/PO+fcy/Rv6JYB9TQEICbifGio3dFcxTeUMdpf5o1REO4IStkyzId3pc3ecqJqfK8P+NYOPUuPAHEVFHiXcqJXi3VZOwClNBSZ14HNhaq7hAe/qmOi3yrrXTVkcUJtOSauAekBgID9QyMdY15Sl6GYnPWFwBGn7bc4CO/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055015; c=relaxed/simple;
	bh=UdeR4k+OIEWzRfcj2vsrG7FM4TjcNSgKCI10q+XC2l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QshWqV+MYiI8c99oZNNfEkwLTIPzwW1uhodW7t9Vp9WYs/AXGtHgNU88lDdKrjeA+ra2mTKG9AzWx/90pSOsz0lci5NQafQtqRos4VgILz+mkllDeiStbOptaCs/Hagx+AtQ1FDYRshEP7EuwAz8ZORkffZjcXQhnL7qp3JNTPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqcQ3Ugv; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqcQ3Ugv"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so3194845a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792055013; x=1792659813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KUIkGkj6B9Tv+hZUqi/sJY1ZKDxkj40BHrOHpN+3Sz0=;
        b=UqcQ3Ugv8mgmwWMyroq6I9Mdp2gjn9EZprdilYupFEtVyFWfipCv97EOyDulToDYOD
         0xR7uTjDx7tSJ0SxUccMfTZxV4sjZafimseTDiSrCKWYdMtV2zNwdweFFcoFDxeuKXtE
         a0NMtfZ8z+m4i6XKzhAbC+SDz2U3AA5cKBjHSCdKQawWwxzLI/AsoSZwUARTKvaW0Zrp
         E+lPuJLExNxL3scbhUDXo9UNUFydGav1fmQX8pahIaM1OI5Em9Da5nksavev8tgxCVWs
         EAlRQarOha1ih0rAuOJVb8wiq6iNIWFee6SYtPl0L77aOngREoF9XFl5UWs2mOfIZSjD
         mwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055013; x=1792659813;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUIkGkj6B9Tv+hZUqi/sJY1ZKDxkj40BHrOHpN+3Sz0=;
        b=ZctBdbYZbAIyQOnXnIEUbA5/O0q001sN15Yble0O8PO729WyNYLG2P+gYud6sKQcAK
         FjONEts3/aJwcdyhOFTcX/RLQ0Az13deL3KC6wCxbd4rIJWGnWwf5IElecoE/BCbXJ97
         YN4oNUfksGMtRl0zMHPyd8gJZ1s0CUccX72w1MZ5vg+ZwsoDRMnE42EiGXaidtZu3FEk
         cqy5y3mFy3DCG6S69byber+/MDVSC4TgDJd19d5hsDGu6fN/gS8BeciC+YwunjHvcabg
         0lfQK6kIJI/k2mef+Md6xaOvrIrOyDhz89XEt7NtCfBJo+8kGNfYHM1sKBVMx6j06u67
         3ISA==
X-Forwarded-Encrypted: i=1; AKwUvBxUpLIz6FxSth45FL+VQaxRRw6o6+gbRTHaMn5u+iLn4wavjFk9KTvqQTAShpn/xLLnpBWc3WwMsy0wyLY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLwLXE0og0Ci4zTmDkykwgCFg/C5Qvq2FjWI/2puwkTEhhCHe8
	C1kxKctr00lGGTxeMqCMk1LE1D1gFYGIrDzJx/4FuBOeDogRVe0qat4E
X-Gm-Gg: AYBFou3BnvlBhrK8xxTYe2d9c3E3QOOfpqThUYF9BDUjrtMNq7ufFMdKJdWq9aSo85K
	IHZQ9RrgjRBj0Vxt9wszVuHpMGmIkFbJyYmChqWa9cWOHGsje9FXcl4+OHccNqDz0lyGOnruvhR
	QkWvC1hCyy5W4S/mJaOaGvBLudx4Yw3n/rD5zR4ZMHRg/fkWwTugZ3vK1FnrhBIZ7qEDYJYw1LX
	3d193To12lSWwhk2I9S8QaWquQjWsiN30+K/+Dg3VsHJO/l12FEhfeSMz5g9IJDopx8gtyVuXRZ
	bi4Txwy/uD4k3HokN5JbzoKa6YaDUGM6EfcvUwUuAlUsatkb7Lbx5y03VPbPD8FLTYt+ZRRXn3B
	B8i4sADNSwiZCZr/HBP8mYZsQNLfhhPaArezvwLBg0i7vHlWrjBOuV1+0SXrtVojcWr14taZAOe
	nSMYapGiM7RVBHO++e25RXrMTHgYXJHj6h7s7zSs/bAtgxzjW0de8ewKdY1ENl1MFqbCE7
X-Received: by 2002:a05:6a21:3944:b0:3dd:a196:3091 with SMTP id adf61e73a8af0-3e16bef498emr14329973637.65.1792055013262;
        Thu, 15 Oct 2026 02:03:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635cd3b34sm962553a12.28.2026.10.15.02.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:03:32 -0700 (PDT)
Date: Thu, 15 Oct 2026 17:03:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Message-ID: <atCV8NsJc5Oatoo0@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
 <fa4253c7-3b17-4b20-97b9-eb37f218a4c8@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa4253c7-3b17-4b20-97b9-eb37f218a4c8@linux.dev>

On Thu, Oct 15, 2026 at 02:43:40PM +0800, Chen Wang wrote:
> Hello,
> 
> On 10/14/2026 3:45 PM, Inochi Amaoto wrote:
> > Sophgo SoCs such as SG2044 contain eFuses used to store
> > factory-programmed data.
> > 
> > As for SG2044, HW automatically loads the eFuse content
> > into shadow registers which are organized as 32bit values
> > exposed as MMIO.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   drivers/nvmem/Kconfig        |  12 +++
> >   drivers/nvmem/Makefile       |   2 +
> >   drivers/nvmem/sophgo-efuse.c | 176 +++++++++++++++++++++++++++++++++++
> >   3 files changed, 190 insertions(+)
> >   create mode 100644 drivers/nvmem/sophgo-efuse.c
> > 
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > index c36c2a4c2a0b..a7936dd65bdd 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -465,6 +465,18 @@ config NVMEM_SNVS_LPGPR
> >   	  This driver can also be built as a module. If so, the module
> >   	  will be called nvmem-snvs-lpgpr.
> > +config NVMEM_SOPHGO_EFUSE
> > +	tristate "Sophgo eFuse support"
> > +	depends on ARCH_SOPHGO || COMPILE_TEST
> > +	default ARCH_SOPHGO
> > +	help
> > +	  Say y here to enable support for reading eFuses on Sophgo SoCs
> > +	  such as the CV1800B. These are e.g. used to store factory programmed
> 
> Why is "CV1800B"?
> 

This is an old mistake, this patch follows Jishengs's patch in the first
design. But then almost everything changed and only thing for SG2044 left.
This is the thing that is left to change.

I am not sure whether it should keep this generic name as I see it should
be compatible for most sophgo SoCs (at least it should be for CV1800X, 
by just change offset). Feel free to give if you have some suggestion for
a better name

Regards,
Inochi
