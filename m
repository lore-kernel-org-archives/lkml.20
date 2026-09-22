Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1A54DA9A6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071808; cv=none; b=V5FrbX5gr63RyP60bRnKIvfRDEOkvlqfNLylc0i35reHN0AbGa19aFftFUJaTrbcwz7LH5iv6LEZdQblrwP3hGRkn7VRLWcHcAEeLJWmDnM7yR9pMtT1GK0xsjXMJ2gSoe1H2L3HnpAW52++Ln1/M0k1h59PiV3lbC5h2kv/hvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071808; c=relaxed/simple;
	bh=sggFhUneseUUxNVvYfEFQBkjkldLvBabYngF3pTDj9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZiqefIOlxwakA9KwGk5C7+oEAahpL8r3GjKqDyHLLO8+nA/eD+gKTMyc8SiFkD1DMfymVApzR2t4FZIMAKAMj7y9qWSoaEu5Za3mVWP6qfOQcgLocLnWX80Y6UHdHYUSTT4oRmnJoYwIHutPPMmOlcVBXCMBLuLwLTTDuxWi3Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MiORHtDJ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MiORHtDJ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so2221720f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790071804; x=1790676604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=govxJP7/xHDPoXMa1qqKKxuu4w8EfasM3Ldya35nIg4=;
        b=MiORHtDJcyVHrLaAk0FsgsDRuRtB9VBuLVQdJ9R8wZzL2AW1eGRbFQO7DAZNEZXuC6
         SwtgG6irwKW8FSv/3lZ8fUO3ypK9dUjWY7VvebEXmaYVBey7hnh111u/jQZqIarWPW9J
         IJ7KiqBFNkgpQky3rZJzuwv5i7XgGOyDmzYcGPR+sElVOLjnh3Kmn5sJg8aFGCQ0t8Ns
         AlHT9owOoxFe7PkONwWxaEofi7fAWDOF5AFg9gBLFhkBT//lX5hAkKXnBdKpXe0wiRLv
         zBtnz0xvFjq2XMZANd4Zi15/ILegqqiHUdS8f6mXsPvl6emkZaezZFu4fQpQSTloe6uH
         TvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071804; x=1790676604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=govxJP7/xHDPoXMa1qqKKxuu4w8EfasM3Ldya35nIg4=;
        b=BWxzek88FYkYA0oEvDf2dFSbXiHOjjMnUSQym0/6awiC1OqRZpxOjj31qElb4qyb7K
         u3SY8Uf3qQKHMtRRojO7JqmeNIOvlPHVtqe6nC7YRZPCc2gMFrLCLBhpI/f7fNLavkzd
         6rFHeLD5jvUF78y+l5APHrnguoSghaB1zVToqK3phWzgQwFG6bd+BpSstLLd8N9uINhi
         gq+r9I3m1H4nejQq4oZECF0+Y24y2OpJ/zGKt6qVobZXndZ7HSTiRRigwW45Oli0Kght
         kY+AtHm+8A2TROqsLGiSvQlutztj7xKjeU+QUN5cU2cmg3FyjmfeTOrDinR7bYpp48ZT
         moFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRSlj9EmgiCy4kvANMhc95fVoCHMf6aZJAP/NUtIoAqqs1JuhPlaxH5Ik2mYOB0G5NSjgjvp9Kf+tiHd0=@vger.kernel.org
X-Gm-Message-State: AFuF++nvId07bgaMTKSaLcqiP9a+srLHSqbQF+ysiBb/zCZSYxLBegiT
	1hMKe4NWaFYW6a8nwiYQxjo4gvOh2vtuZD29AxcFbXqvdFBXowxPHOp5u//D9fcReRE=
X-Gm-Gg: AYBFou2iKb7vR2QR/8i/4cEq9Q4IuPKfo+NT//1JoOOlJFCUmO8Z9KJyx/8m0kwmq6o
	FdhrBihIkoaqJ4cISdNO0qR/c7FuCrc6Bpz0r+XClRya5DFea15ooh2S3FPEwItUhaTu2DXOlF3
	42K+NCFQwvJv9XDtRd7ZKUkxePuiLOrTm7X5YPGpJj1SBtIJR7FAw1OVXirR0eRvm0JDStyLsUp
	QltLVxSyoYnlQtEVGQRRnfW0JH47tqPyuFWtEyb7iqQvU+za0W9tWNWpgu3BMEc7qA+lQlB2Ise
	0y5Zoqpa4307RMe4UFZUk7bvVpWrIkrKPtz4U1PNYgEDzpNwe5cxbS+oOAGE77Wr7KeSusW+3Gi
	bbmsPw9WeVg2AdMTuW1mWHMsJunOItIs/Xna0vriIGxEOYiAWHu0y8c0ISpvhGAW/4X0TIKRGq7
	zOJtQ5qYamCE5kprPsmbTAbFQ8RHw4lFiNtI4vvAMpKeHYe5ujty9wXXxZhNKK2fGBpnV8WPZNk
	ndZJF964HBJVh0xfdJC0aGRSjJ61JsjaC/bCRBPEr0ZkW/0aFaUkk2sHP6vsyQKn1BXgEQ5W3+2
	9FRN2LCicV2qrxMGiUiOgexfw8EekUxmG13pFleX0A==
X-Received: by 2002:a5d:5848:0:b0:487:27f6:a4dc with SMTP id ffacd0b85a97d-48727f6a6bdmr12398341f8f.44.1790071803547;
        Tue, 22 Sep 2026 03:10:03 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862785a4fsm4002024f8f.24.2026.09.22.03.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:10:03 -0700 (PDT)
Message-ID: <90812e76-fc01-409e-8156-ef958717218f@suse.com>
Date: Tue, 22 Sep 2026 12:10:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] module: Limit ELF includes in linux/module.h to
 uapi/linux/elf.h
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Peter Huewe <peterhuewe@gmx.de>,
 Jarkko Sakkinen <jarkko@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Cc: Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Aaron Tomlin <atomlin@atomlin.com>, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, linux-integrity@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260911-module-include-elf-v2-0-954c732975fb@suse.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260911-module-include-elf-v2-0-954c732975fb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 4:40 PM, Petr Pavlu wrote:
> linux/module.h appears in roughly 15k #include directives across the
> kernel. This makes it a "hot" header, so it should avoid pulling in
> unnecessary definitions.
> 
> The header currently includes linux/elf.h but this is largely unnecessary
> because it requires only the base ELF structures, such as Elf_Ehdr and
> Elf_Sym, which are declared in uapi/linux/elf.h.
> 
> Replace the linux/elf.h include with uapi/linux/elf.h. On x86_64_defconfig,
> including linux/module.h alone results in 2.2 MB of preprocessed data. This
> change reduces that to 1.5 MB.
> 
> The first five patches are cleanups to avoid relying on declarations being
> indirectly provided through linux/module.h -> linux/elf.h. These patches
> are mostly independent and can go through their respective trees if
> preferred, except for the cpufeature patch, which depends on the preceding
> s390 cleanup. The final module patch depends on all of these changes.
> 
> It is hard to identify all files that indirectly reference something only
> through linux/module.h -> linux/elf.h. The changes were build-tested with
> allmodconfig on arm, arm64, m68k, mips, powerpc64, riscv, s390, x86_64.

I plan to pick up this series on modules-next by the end of the week.
Acked-by tags from the relevant maintainers would be appreciated.

-- 
Thanks,
Petr
