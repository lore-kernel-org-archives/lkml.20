Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058D9448392
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185968; cv=none; b=NG13Z1yRjQsS3WEsv4LziSGT3izBlspCC8ciz+AlWQxWdtuX8XsPAz+QAStzUBY5YDZHy1V0p5s/4V2zHi8CMWpFzL/Uvqj+mwo8deHgGYeW91wChvTFE6A3kap8QcJckrOX26uNohYvtDwX/KmnewjPL3TPLXKBTkW4Jnki9ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185968; c=relaxed/simple;
	bh=Qmr5PRkRveQXyFRTmgPD3NHjkLBN5Y9uiUOCrCPijdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pX6h9SY1+LeK4vaqv7mkm+XaapkCeibDnNLlYtI4bkluW+6OUMI/cFtwXwmk1/3iOVdo0JXHbu/2Jdmo68BS5eURGrK+ruIDQM0deikZmnAf9lDLlq7qoaITkT3zdEQQSeMkVywfqx/LtYiUan+u/7FBak5v4t2MmzViWnrL7u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=IXRzkVV/; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="IXRzkVV/"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0d126f631so3425507b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792185965; x=1792790765; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/9EvAh0DiBmuccCLogZQl2FRIGsKEe6kxcC5UHFlPI=;
        b=IXRzkVV/uzKOA2aJ3Z85YAh5HXCbdIIlktCjgKxUJgE1ILFp56TPoEeBue44VhsTUS
         LdEIBlxTzHfZ2yKPwCkSmmxPq83vn3nnhREj7uDenGHmUJ6pRLIzhluU5Fr7X7jJ0Af+
         vigUxiTyXIq9ojtIMYJH/GHFr+WCyXry574vF0LHmv5364q9pcMyDEGwWbfxLPjnf84Z
         loX+aQ2zexMIfFJBVCPp61AuT/sVZc85OC0JenfUNafa+WARLUEXDp0sDMKP+HgPwUp3
         VAAyPYW5axwx3qr9UFEcwt7wD+57Iu5UsqoORMnICDw3gwSBT5H0DtoaLqkSIC6Zpy9a
         Nhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792185965; x=1792790765;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C/9EvAh0DiBmuccCLogZQl2FRIGsKEe6kxcC5UHFlPI=;
        b=C1tHFEpNf/wwCBaI5TNM97KzRUbed57bmS0cvplUaO8zrQT5FrvB9C/Q8dZYlRWw3A
         TJUlTYsAEVYgluXAGoYnOhZB2DyENm26WIYZvINghAB6+WJy+wog/WxDxI/hgjiOf9hu
         AisT7YKcRan6MPd0GlOqmMlAQ3HPQrUX5tN/F2WiDuFJ+IPKPPMtF8Z+ge7psq7lmqFh
         GnaZVc6KHdZWuXjSvsY9oNsAMYRApojnj3iiU379qHNocHTlT+EI7LPQn/rgdIAsgDa4
         4qfoQGgmRE6ZlXV9nqbjPOeqDTbdAeFOGym2OX+u4WdcY3DZ1d70mXn6XVHmtjsuhU/F
         9KpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU+L2brPz905N90AmIXA68peXVfjVRg6u/aZepycP/J8mJHNPelmR3fbNiY0uBwHwzvLutd1I2mY6HY/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5IFP0HutbjlhZQA//vmyvxXRKyPBXUqBWBOXmoQRNEkZDHxe8
	2kZGkFMKQjGfZgMmYb10c+wBadvOci3XZtGG9Bwcf/I/71aAb30QicR+2/+EzEG9WLI=
X-Gm-Gg: AYBFou1Phm2guxGKSCeV87e3QK7eIuB4PzSi3oqVCZjQmFDcfPmcX98f/INRlWR4QLi
	H28OltS7qseY1oTMVk0ge5WTUBmSZDdFZXvmd8CSv+qnsPt8zC380Gvg0kvUJFXBLqGPeo1Yepa
	cMGAuWhEmAsV6DFjTvywZy9EEzueaTcK6CseatqQ8s2Y1j5M2fj5hGwnuY9nNs9hrvy3ZqSiv9J
	btEkGXNM6is5qS8eD7tIz82T5fLWDp1kJvCyXq9Tx4AaXkUpWmLUeSywmxj0sMiIBhuegqlnWNA
	yDSCSN8UcDs3o4sOqDB+gLvNdnO/fux26vBnER7UfbkhTvx+sf0t3pijjRdtGRnJtl2eVQRFb4/
	dzgSs/is9ZXfo4qgvfQgkQTuRdhCaXWEa+Fl/B5CN+eJA350M7KM6++i/Ue2ISFtm8H6fm8FbTv
	+dywG2s7+YnipJVijoFGpOIiqfym8kSIiuhG/d9iaPU1h2qxpkS/Pd78p+ChYPBVSVdyLHksPKi
	PTjRGtnEkJQk4YVYy4z
X-Received: by 2002:a05:690c:5:b0:8ab:6374:5637 with SMTP id 00721157ae682-8b0f216acadmr6613397b3.28.1792185964930;
        Fri, 16 Oct 2026 14:26:04 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e5728d72sm13958567b3.5.2026.10.16.14.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:26:04 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:26:03 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Radim =?iso-8859-1?Q?Krcm=E1r?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 4/6] riscv: hwprobe: Report Supm only when available
Message-ID: <atKWa5PU2ECSgocI@Tao-Chiu's-Mac>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>

On Tue, Oct 06, 2026 at 09:53:01AM +0200, Radim Krcmár wrote:
> The RISC-V ISA defines Supm as
> 
>   "An extension that indicates that there is pointer-masking support
>   available in user mode, with some facility provided in the application
>   execution environment to control pointer masking."
> 
> Our facility always returns -EINVAL unless Supm support is configured,
> the pointer masking ISA extension is globally present, and the user-mode
> is running in 64-bit mode.
> 
> Hiding Supm in compat tasks would add complexity that doesn't seem
> justified as 32-bit code has no reason to look at Supm anyway.
> Reporting based on the a global sysctl toggle isn't done.
> 
> Do not report Supm when some harts lack the extension, because it's not
> available on any hart in that case.
> 
> (Reporting Supm when only PMLEN=0 is supported isn't great, but doesn't
>  violate the text of the extension and we ought to have Supm7 and Supm16
>  extensions if we care about precision.)
> 
> Fixes: 3c2e0aff7b4f ("riscv: hwprobe: Export the Supm ISA extension")
> Signed-off-by: Radim Krcmár <radim.krcmar@oss.qualcomm.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

> ---
>  The compat hiding and global sysctl toggle better fit in Andy's series.
> 

Sorry, I am not aware of any ongoing series that does the compat hiding,
but I will keep an eye on it.

Thanks,
Andy
