Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FE74189C3
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788025793; cv=none; b=UE4nBX3ZsBo/juMJd9nNe/heEQkqyMC+7UI2zMe4puWeCHfLAU/W4Y4gyclxuuEfDfHlsa8YLwljPzXZmuTs6lpBGBSy5sr3usqNhDcL9Qy/WRLZ4O1O1b/VHhyd8NIE4Ec+2xiKwBq9ak3+uVGBWERlwEeC2NeZ4G5FMlF74Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788025793; c=relaxed/simple;
	bh=CiJtacJRT+ZBGPsQGCs/IvtvWVuRjrAaXV/SbXSbkzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXz8BsE1Emk+lxoKXPjykAAj9/me7GgMZplO1ouEmLHqu2T0IfZG55ezbTrIakXoFBOGRsGTn0liHX6lay55PtKrQwwIHg3Ed0tT5TNPeg0jG920ZTxmWIEIfogy+nWpJMdRn7kW7lUVOn+Oh91bvziNIQn+TjbwUT29fVbMa9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gm1LVkJo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gm1LVkJo"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso14137725e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788025778; x=1788630578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0IHxnV24H4g+bgPWSaSq+fwKQsetvjQ0EzADtleBBa8=;
        b=gm1LVkJoJU5aSWlUa9ti0VF+jPx7y3xjBj3Nm19AzNUt64Jwb98nmqHXTn3j3fxxBX
         Meg54Be2AGftxpJ97Bp0kdWWO9BmrxQ8f1x9JfwUK6xt0bwkpULEapgnrHATivjL7JbM
         av72z4G43l4G41etuxXCzaN2to879s+8h0rVY/6yYCEGgS55bVLn3Fec4uks60e3zdmF
         XkCGAK/SWO7wGuRus/yL0L//5oOpGNzFPlS5HomXCB0shOqy40wTZtjVlqJjz9HlvPB6
         7Ffjn086i00uEFkxTH00JdR2xHszMoVURt1HoyqI0jPVyFy8nsU6MzKk2Jb8b16s5265
         sr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788025778; x=1788630578;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IHxnV24H4g+bgPWSaSq+fwKQsetvjQ0EzADtleBBa8=;
        b=fQqsYXVeTzP8tbEy6k6nNTKv0Qwkuk5NdXjNylMLyDwu7h3KA9l3GgtPo4CM3nxXvC
         E2738A7AYGCM54/DmV3Tg5G11Vgb5qqnGhsLLbKl48dvgNYEofRs3gLxZLTPoSUydreJ
         nxRpgx6nAjXIJTHMBaxXaGqRUuA1h/qP0gjUp7bKSflQQTlbBihr7m9ry2G3p8r+UH4M
         t1goES9Tp2YkxJcANQOna/VvnByltEL1Eyp3KVvKx/PnOHlAfKHGWWyrW2IHelePTUyJ
         rgcvJlwlALsj7sJCxwwr/X5YO8IQrC0lQgVHvVxFn7sjacTJA9QiMqRP01q8unWo6JdD
         eObQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtM6BO3XuMUgAs5LnzvIoh0V++M2O39svdUFtRH4IEefIMmmNuEcDWmEIXiNJd6rkubgx4+g/rhfvzqVU=@vger.kernel.org
X-Gm-Message-State: AFuF++la47+MPIaDQ2carxJs9Dz4/v/4wnlKk3zb8riJGOEQ4lNh9H1n
	+8CafDA8QVgM/yAUu2i4f+7Id+Ugse98WlqULIHjwziEI8DvSrWVKQLL
X-Gm-Gg: AR+sD10FRR5x9L/rsdXTsu0NmxKcJl5dsVLP4OyK6osdtJARDZ3sXJVgVNjYx2AOiwA
	DHfG0NhFbGpS2OZTBRWfs/U0LI4aH2R7hm4x/ER2QuDXA9Qe00tA/QypymynfRKm68RdY4YzTfZ
	edLeJ0p7wc3oKd4lCi3R/TC0rdVn+kybV4n9yqaswtQw1dpIagOyarYWfRG7Z5DMKQy9a1MPo7t
	1f4g6yekvNmq+bocDvNM2H1VMXJHDpfgb62rK57j+oj27j/sZg/a0z1soL92hhQWZ0vgo65Lww5
	Sxkp0aG7X+cLw+gVEWEnnQCcJvhyhD3yTLW6pAQxvZcDmz9yBTAdibtQPf69sJ2UwnziAeOpyvv
	j4qyQ+1KLtq0aqOhXrotRlmx52b5B3n0Ya6E3pmucZtYihYaBydh0MwzerldRiDOzXU9I2tZ+Zz
	QtCxsD2pwvtCAqeY0LZIapvPd2uA15EMDU30vsmirwQl0twV0Ktg3UKex8zIcSv27rTzXTYEaHf
	UIVbEB2H0MLyx0ymU4ZIM9DWlkxIn0bFV1OonlSPr5pwOfr3ggrfoPvU1HifmXgOq1ODzkGqxcl
	LLr60TYYy8G2vvqVjF24fJg5PeqTK7yJU3RDOLqTEli6zVRAh3XXWmTFq23j35Ly
X-Received: by 2002:a7b:c30a:0:b0:49b:8c63:dfdf with SMTP id 5b1f17b1804b1-49b91c5749fmr180067375e9.15.1788025778047;
        Sat, 29 Aug 2026 10:49:38 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ae86-1b01-80e2-8851-4221-68d8.310.pool.telefonica.de. [2a02:3100:ae86:1b01:80e2:8851:4221:68d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc1076sm141898395e9.3.2026.08.29.10.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:49:37 -0700 (PDT)
Date: Sat, 29 Aug 2026 19:49:35 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: asid: Do not replace active_asids if already 0
Message-ID: <apMbTRLqPV2s_BeR@gmail.com>
References: <20260809180600.6049-1-kmehltretter@gmail.com>
 <apAQ4gc71DiGmDO2@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apAQ4gc71DiGmDO2@arm.com>

On Thu, Aug 27, 2026 at 11:26:42AM +0100, Catalin Marinas wrote:
> > non-relaxed (cmp)xchg is used as in the existing ARM code.
> 
> The patch is still valid. It's safe to use the relaxed accessors here if
> you want or maybe do it as a separate patch for other atomic ops in this
> code. I think at the time we added the ASID allocator, there were no
> relaxed accessors in the kernel.
> 
> You can send it to Russell's patch system.
> 

Done:

https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9493/1

Thanks,
Karl
