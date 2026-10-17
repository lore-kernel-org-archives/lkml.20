Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39C63D411D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213165; cv=none; b=UujkDBxx4r/mW+YgaRMzAjziMnbFhEFNVVqqV96Zgm7Ud2fWhZPO/l9TRwM3rkRr6dmEsf6YvGZeiqvO8RMFc2P6jX59FMaZdNgLCWlO0APunoH6BKyHKa7gqLN/DE55HDtlktECa/esXq6fcP4IN66SrfR3K/+saAb7klzE2Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213165; c=relaxed/simple;
	bh=lw5Teo3s6coPvowUpqHSFJ8pRI7BaL3T+isC7Y9DyKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0RPSIF6jXhV6XREE6WOf61Mb0IYn+LDjEDJ/oRnW2nG+X3FBiPkoYW9x+5VoYE+Y5hXdLIdWG3ywrdjbOGB1JORyMeFVT7hDfPPut3W6DRQMNMTFp8/3c+497U88JPobnRh34tgNNT43A4Jv8QnBKUcO39nG8R2DmaoFUooLVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvzxmngX; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvzxmngX"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35c76e9614aso762480eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792213163; x=1792817963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UnAk8G/A+hhdAdk7bHYU92K3ZOqNeCV2RRCOnYZL228=;
        b=LvzxmngXmeBd3X8AAd7yagE5JeDSkdkarVLzSEhorhpAZY2qnE/43cO+elh2f6DZCA
         ZNsF0LZZlCZvLptc/Itm3M6Lb8tWacLIzQNonKO2peY/LG5IWPAEUj/hT42/PZAipkCl
         enEOEUVNIXyqqH5eiEVDlmbnoTLISojRjvrLsl+3VT3dwWmtSBfYKcV2TLVAAvhn2cT/
         pDYnQQlkbr42Bm9ZkdrWVFLm9gnJtfrNR+Qk3VnFBoiWqfAKMhhwMX6hT48Dex5xKv/e
         sWPOaSMO2vlXpwlLmVvXXHhp6E2shStGqg0lViwzcn6tWdCeltOygnygMNgmHFwRa7Bd
         izfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213163; x=1792817963;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnAk8G/A+hhdAdk7bHYU92K3ZOqNeCV2RRCOnYZL228=;
        b=B6EIzyPhiZ7eY3FV/Bgtu3sVtx6GtNtJJd0ZuKJBYxRYDBrGVmLTD92QDzU/XIxX/g
         DQOc+MQEBrvQkxpDQTcazC81rDE+xLvc8dn1cORQEvqz/Qjc8yJOZl6CEEjoo7fIqcNM
         CsIlj+DQAGpSh4CVNdZLJibuV4RULiF2IshI9IvTmHUNXuTJlz8boNnFpq0PDrNbxBXK
         dr4ncCoo0+KlC8KLocqWDhbh356NAglcBrx0QV2vCbGGLgBWjpspkU/fnx5GXxk4WmZS
         twMSB6V1rP3DwcCC4RBqiYwZBUVECMnU8VFD2HwUYrpJTs1ATQweY3/r186B87SPJvGW
         y0XA==
X-Forwarded-Encrypted: i=1; AKwUvBxUxd+9sg4izXw1DPa6SshNVQ0yAdXSWtkTzkgxi9OI24L20OgEkkd6g7UBUagI9BOfNUeuyDJsNS3J2xM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+QsklWhGQI6fuZJptN4iJmhI67JDJGhe+BgTHblWY0wjuBwCs
	OH9usyTDB6BxOvbTdv4DrMBl6Wzbe0u+3vuxa1H++EbsrJ7CJmxE0/zH
X-Gm-Gg: AYBFou3dhsSZmUFjL9usVOBkaxtXJ5Oh4FwdCO0CskHbevz8G6Hgt8r7NsmUbc/8v/G
	AXGDStx/o5svn35td2ijKkaMnT6WtxGIpEOiStyMp0SplWe76QxLnLw8lQ23yk9SXl3LVwigMOB
	H8J7wea7j5Y+C8uz6nV/XSL6FrNNUlAm12UcG/6PuqKVZkNTMoW095NrEVNFfwK76fSxCLZO/OF
	A195lobkEWL1jotuBoMcz08a4N55ykGVFm2BR0T4WXse4JOAzU4O4744Dc05vqIcblCiR++Ismx
	QKst2cOu51cSzdn4mJLX376dY3xyf/6zDoxnKuG3zXzSZrp2uG9UaEPhJa6QuUtrKAuZNfN38oh
	lIO76sz5RWjTqGEIvMDu/23JF02mrlxHeoYaiEurgOZErS7e1rjvf/yWB8K43gBHvWTjxBI/1Eq
	NmqVh0dgId9oJg/+isd8vKnbM2KYo8ZHD1dRsEcHNGIbza8AN7zf7flGOyd2y/eparSoP5skJdv
	VZqTkUUKB0hoPsoaE2jmeG0hPm9i9lbYA==
X-Received: by 2002:a05:7023:a4b:20b0:162:e05:e43f with SMTP id a92af1059eb24-18512b3e562mr2633163c88.23.1792213162960;
        Fri, 16 Oct 2026 21:59:22 -0700 (PDT)
Received: from blinky ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314ef8ed8sm9893994c88.3.2026.10.16.21.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:59:22 -0700 (PDT)
Date: Fri, 16 Oct 2026 21:59:20 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: misaligned: Fix
 fast_unaligned_access_speed_key init
Message-ID: <atMAqLb3itG3RFIN@blinky>
References: <cover.1780002199.git.namcao@linutronix.de>
 <2468816ceb433394099a00d7822f819745276b49.1780002199.git.namcao@linutronix.de>
 <179213417712.1857356.6461669805362228910.b4-review@b4>
 <87v7723v1n.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7723v1n.fsf@yellow.woof>

On Fri, Oct 16, 2026 at 10:32:20AM +0200, Nam Cao wrote:
> Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> > Thanks for the fix. Looks good but needs to be rebased (apologies for
> > the delay on the review).
> 
> It's already upstreamed ;)
> d585018a9258efed01514bae369ab3d4f21e7b1a

Oh good, I missed that somehow...

- Charlie

> 
> Nam
