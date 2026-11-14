Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641128;
	b=z+V3GSQ19rpUbiktSkPK+Y7aos1hQjq5VzH7YWvIao71VL/0750hAe0aaPc0VyAeaGB7
	 Jq/jx7lz8Izi2nA7GoR89a7M/gaEhs8F6ZiC1fr3VkIcXU4tmzDXUXU7wwDqLcrYUQGC/
	 gQ1VDBHfBhhU+Kn+Do1EwgXMRrSZ6QjMGTz4gcOwzka+FD6IPHh5n7Db7CQLfQCJGK0mG
	 1NQhav5Hb2YTxVzqOc3yjUgsvvIx47Q66XFeIE8gq60GZb7WFgizVhdaDXblJeb5OYSSI
	 7CI5a01MUjtz5uwSue8vm+5neQGI5ovziBUrNYq5CSx8GN5+3i5Jt8as+hcc60RXTXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=FOpOMGwOLM8SRhOfI4bc8Q6VvL2aj4ajoW8MlVZKv38=;
	b=5alf7Wh/hr+h+5wyDC51O6nW4bs6kkzZ7Fz0/wTtQA6z45gd+dVgNMehpuCL+OBJ1LX3
	 HkkzwE2VPNb8xZr+Pwk42IPuflwdx1R37a7thgNAtrUwXdmycrw31EUJIkGpZgTWc6mSc
	 lVYMR7uUYZrglMm4AnqBSfePxuha+MXGyC/hPqSS2hOCvPCxD66zFOVnrf2AZlv0MbSpT
	 J+Ax2ArXb+aLaBy5nYOZnuCeoDN9WNus/e8NL4SOvH5NALHxFq6McKIXrGsDPotpTDbni
	 kGvdwxk3NHhCTH1MtFVTjtojNSc+6tX+39TJCVTOjmaaG12QNnR/3dSaNSN9Xg+Mt6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=uEaDDz95;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E99606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84E99606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=uEaDDz95
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-94961d90b79so63599785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794641126; x=1795245926; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FOpOMGwOLM8SRhOfI4bc8Q6VvL2aj4ajoW8MlVZKv38=;
        b=uEaDDz957LMgBdwavvtEYSujZ3m5D5PlEFFjYhpsPN7/NU/fwtpxznRDJ92m+i2WH/
         efCyf2vhCjQtXdPvaHbwridlNUQX53P6T2z4p17qPmGEb8H4z9w2Uq+mpCSPirx60vEI
         lgr9asU901PFNiNytOagMNaOy+cHb8To1w+7eP7DlF1kJHXsWfBYgkxhxHvD7mlDp49r
         Qr9hv0Ft7bA6ygSZUr5EVSIWkqCLdX1spYhWA9zMUXdP5+H5C9rNqLDP2X/AlMYKmIXt
         cJDyvWYErmX9LSQag3EZfnxW9NIaQBDg6BGaayzP5haJQnqaAPPkCbYpP0KTPN1BjKZh
         Ytbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641126; x=1795245926;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOpOMGwOLM8SRhOfI4bc8Q6VvL2aj4ajoW8MlVZKv38=;
        b=qr4n+hV+Frr2Pqz8MghO7DQNrMFGfK//Mqy1KU+P0En7dhk0FGBDXw/r4/y0li7ZWN
         sxK4oYeaUHci7WdHSyH9FETG31s77VrGTSJVDeq2xpnlRHRKV4GUwzXoWn4LPIf4xpL4
         dLHzhQHg83hVloVEw7d3jO6JXPS5Z/PfKGXsYKoEuhlV3+h6+jrB3tQ8YDX2uPsy9Q3O
         a+8/gFaf781fJLR8OIus0FK3a1EdcAHg087vRrskOu8q7cRash05uNT9/GnhndQr/Fdx
         0DMi6hI+UHezEBZXuoH0BxbsDy3kaTn5RyjB3FEvhXgoAVNBXP71odUk3v6Gaw6pyi0E
         kh1g==
X-Forwarded-Encrypted: i=1; AL+hErFwMXh6Ly5O3CRj5bHWFlIck2YWdsv9viqJQA+mU6Wz/d9VHZyMToyHHfV32KlCaTQFWSZkWR5CglguNwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+9XzukklTBbLP1V9fK1fuQ1I28+ivKIGRnMxAThu6x1dAyJvx
	9wyvaAy+KVIpFvswMkq6Mb4cXjeSsVm+jHXt90BZ4wCctj+jGXSX6f5bluvbnuKitCk=
X-Gm-Gg: AYBFou3kRsYeLBKbWH9NhmxVjI6xCJkkrwPXmpfF2j4uMWXqMkhZfUu1GslvDSjrZx2
	kX8o0jluY7JH0mqZx6O2Thy8EjDA32M1a3SL2NfSUxrCrf+A/6NGSX09dG+igJRpkhA27p3fqCZ
	tn6f/E4dHltwU3Vs0GwY8YC+s24FzxB4A72iAOxxQ9WArCTghRmyw844kCxahoUJhMpdbAkFt+0
	v9V1Fwya0ig32SfJ22fleDsdpmrNTofhw9DwDavxYtzIm6jXsHAN4SVIRXbvdLzHTYKpIVomlQW
	2wP44FoBj4IJCpXgYFWapa73c4marCVK1LQ3bnC/ar1fSZLcFrLgtwWT23YaZW0+A7lszOcF9Ha
	JtY3+pzqqAGy2G//l4+34gIYkII/aKMjF/n1pyKuabMvKPrmF9PAiOuyLobADGCqrQAZ0Q1Ficn
	SfZSXY2Ohr9b16+o1Doxo4Le6RsBHNl8aSsCKENC5IiVbAGYaaI8TxEzUq/uJBtJlrGaPAieWq+
	XE1VjYq4CenbaJLrdl4r9C+WjFBTzN3EXT0jhNyx0kgM6n3/yRCOJ99qgWILwXowQZI0ma3cAMP
	A4EesZCSTlgi6IDqFTwOCGFNXMwGpQEvhPvzRe6ZAZ0OikYIrhrllyTrRFGk5Ia9mQpSrYjlg0Z
	Lie0jXA0=
X-Received: by 2002:a05:620a:2a06:b0:93e:b0c3:388d with SMTP id af79cd13be357-9494b9432demr830714785a.11.1794641126492;
        Fri, 13 Nov 2026 23:25:26 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803abbsm351077885a.7.2026.11.13.23.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:25:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/hmm: reject shadow-stack mappings
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, leon@kernel.org, 
 akpm@linux-foundation.org, david@kernel.org, kas@kernel.org, 
 dave.hansen@linux.intel.com, bp@alien8.de, rppt@kernel.org, 
 stable@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
In-Reply-To: <20261114002027.GE3706007@nvidia.com>
References: <20261113195536.2660763-1-gourry@gourry.net>
 <20261113200303.GA395967@nvidia.com>
 <179460249376.482102.14669935557901467762.b4-reply@b4>
 <20261114002027.GE3706007@nvidia.com>
Date: Sat, 14 Nov 2026 02:25:25 -0500
Message-Id: <179464112539.482102.8723246686117488051.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-13 20:20 -0400, Jason Gunthorpe wrote:
> On Fri, Nov 13, 2026 at 03:41:33PM -0500, Gregory Price (Meta) wrote:
> > On 2026-11-13 16:03 -0400, Jason Gunthorpe wrote:
> > > On Fri, Nov 13, 2026 at 02:55:36PM -0500, Gregory Price (Meta) wrote:
> > > > HMM can grant ordinary device write access to a userspace shadow stack.
> > > > On x86, pte_write() is true for a shadow-stack PTE, so a populated page
> > > > can be returned with HMM_PFN_WRITE without taking a CPU write fault.
> > > 
> > > I'm not sure I understand this? The pte is writable but you don't want
> > > only DMA to write to it?
> > >
> > > Is there something special on x86 that makes the shadow stack pte
> > > non-writable by the CPU?
> > >
> > 
> > Some of the context is here:
> > https://lore.kernel.org/all/20261111-mason-migrate-et-al-fixes-v1-10-3d2454362e8d@kernel.org/
> > 
> > We had a similar issue with migration, but this should handle the DMA
> > case as well.
> > 
> > It's "technically writable" but the kernel is supposed to prevent that.
> 
> Bah, it's not writable at all. The CPU PTE has write disabled and
> someone thought it was a good idea to make pte_write() return true
> because the CPU allows writes through a special instruction on this
> special PTE? So now all the places like this think its writable, when
> it really isn't.
>

I completely missed this, that will teach me to trust pte_write() I
guess... what a bizarre design choice.  I'm sure there's "reasons".

> You could also fix this by having something like pte_real_write() or
> whatever that doesn't lie about the write bit in the PTE :|
> 

or rename pte_write() to pte_fake_write() instead and restore
pte_write() to its former truthful glory

:| indeed

> The patch is still fine, in that it matches what everything else does,
> but I'd include these details someplace..
> 

Thank you for taking a closer look, I think Andrew's changelog
adjustment is an improvement if you're ok with it.

-- 
~Gregory

