Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907287;
	b=H3JtntxALagvE2voAefFRnOVZtn1xKfKK8zjq6nnvmjaTWvLzmj1eFoZt1QQ58xL2ASX
	 XzHiiq/B3SNdG4uqdF12FGVXd608Mkcv3qcYQzQDlzc4ujcKW61Aw/+0/pnDhPA7aQvaZ
	 YlKcXTFCht3LJysqVGwKZH8TkZe4MXVVNLEWokFs7zS1QiLLV3cTXgUg8yWg5MbocVQ4+
	 WjU88Cn5PqoZBPqOg2Ko3669lk/TgoSlczeDaAVXqS7AYuq+RfkzoimY120mlr3PAHWsb
	 6cW4TWaPH/iry3vpHwXdLiJPljB1EgC75HTrdlfTuDyHn5cyHnuutSwit9XfRuEtlkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907287;
	h=DMARC-Filter:Received:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:User-Agent:X-Originating-IP:X-ClientProxiedBy:
	 X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=eOKGPd3vBudaGavqv2HSdQ+QCXvGxTa45fhD0FE/uiE=;
	b=VGD7o0XC8np1iVLoYdWmdUXgNOpHh6rT/RqUxtxvTZbtJJa3I1rM0QJR1WtONHBmfTBo
	 9NaHHvmbqBv5J84q7hdOm36bKESjE9aVofs+UmXVdFOUAQ7432qbQr/0SpQc8wI9nMde0
	 i+6FY6+LpT7195NUFcPpOzKnXr19YofzDYjiu53FidHCqNAo2VkL7dj+p3pSkjx+lof5N
	 a1l5D11cpflYNCzSzfhc42Vuu29Q6vD6MMVA9KZorWpzZzF8eHRmONfNIH6fCub6nao1u
	 Aa61gx/LcqD7YYmnOhBjzV/MtrarrFyfyZ/7aaPdqeVHo0ToEim0Lv18shwZY5C5gjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E8F606A32A;
	Tue, 17 Nov 2026 09:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2E8F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 6AH9KrIs066268
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 17:20:53 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 17 Nov
 2026 17:20:53 +0800
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Nov
 2026 17:20:53 +0800
Date: Tue, 17 Nov 2026 17:20:49 +0800
From: Mina Chou <minachou@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <jic23@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <geert+renesas@glider.be>,
        <magnus.damm@gmail.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <az70021@gmail.com>
Subject: Re: [PATCH v2 12/19] dt-bindings: cache: andestech: update schema
 for generic LLC support
Message-ID: <avwcZfHRZvGMVMkB@atcsi01.andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-13-minachou@andestech.com>
 <20261113-emporium-provolone-0e7b0e39c97a@spud>
 <20261116-crazy-adventurous-cockatrice-61c62b@quoll>
 <20261116-deduct-emphasize-b2482186cfcb@spud>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261116-deduct-emphasize-b2482186cfcb@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs54.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AH9KrIs066268

On Mon, Nov 16, 2026 at 06:00:43PM +0000, Conor Dooley wrote:
> > > >  select:
> > > > @@ -21,18 +22,23 @@ select:
> > > >        contains:
> > > >          enum:
> > > >            - andestech,ax45mp-cache
> > > > +          - andestech,llcache
> > > >  
> > > >    required:
> > > >      - compatible
> > > >  
> > > >  properties:
> > > >    compatible:
> > > > -    items:
> > > > -      - enum:
> > > > -          - andestech,qilai-ax45mp-cache
> > > > -          - renesas,r9a07g043f-ax45mp-cache
> > > > -      - const: andestech,ax45mp-cache
> > > > -      - const: cache
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - enum:
> > > > +              - andestech,qilai-ax45mp-cache
> > > > +              - renesas,r9a07g043f-ax45mp-cache
> > > > +          - const: andestech,ax45mp-cache
> > > > +          - const: cache
> > 
> > Illogical split of patches. If this was to stay, then THIS commit is the
> > reason to rename so rename would happen here, not in some time in the
> > future. Same for everything you do.
> > 
> > Organize your patches correctly, not doing things half-baked... but
> > anyway do not rename files just because you added one compatible.

Hi Krzysztof, Conor,

Thanks for the reviews.

My understanding is that the file should not be renamed at all, rather
than having the rename squashed into this patch, so I will keep
andestech,ax45mp-cache.yaml in v3. Please let me know if I misread
that.

> > 
> > 
> > > > +      - items:
> > > > +          - const: andestech,llcache
> > > > +          - const: cache
> > > 
> > > Device specific compatibles are mandatory. I would accept this patch
> > > with a
> > >           - not: {}
> > >             description: Need a SoC specific compatible
> > > like the safexcel eip binding.
> > 
> > But why all others cannot use ax45mp as fallback? Is this really a
> > generic block among multiple generations of SoCs?
> 
> I think it's fairly likely that it is.
> I do like having constraints that restrict cache-sets etc to what the
> device can actually do, but using ax45mp as a fallback doesn't prevent
> that, since the constraints are really set by the soc.
> > 
> > What sort of arguments from contributors are to support that?
> > 
> > 

The L2 cache controllers of the Andes 25/27 series (A27L2, AX25MP, ...)
and of the 45 series are separate implementations, but they follow a
common Andes register interface: the configuration, control, error,
CCTL command, access line and status are at the same offsets and
behave the same way. The driver is written against this common
interface only. All the SoCs this series targets use it:
the AX45MP in RZ/Five and QiLai, and the A27L2 in Allwinner V821.

The A27L2 does not have the AX45MP's controller, so using
andestech,ax45mp-cache as its fallback would suggest that it does.
andestech,llcache is meant to describe the common interface instead,
and the driver only needs to match it.

Would it be fine to keep andestech,llcache if I add the "not: {}"
placeholder for the SoC specific compatible, as Conor suggested? If so,
I will do that in v3, and the V821 cache compatible will come with the
V821 devicetree series from Allwinner.

> > > >  
> > > >    reg:
> > > >      maxItems: 1
> > > > @@ -44,13 +50,11 @@ properties:
> > > >      const: 64
> > > >  
> > > >    cache-level:
> > > > -    const: 2
> > > > +    enum: [2, 3]
> > > >  
> > > > -  cache-sets:
> > > > -    enum: [1024, 2048]
> > > > +  cache-sets: true
> > > >  
> > > > -  cache-size:
> > > > -    enum: [131072, 262144, 524288, 1048576, 2097152]
> > > > +  cache-size: true
> > 
> > 
> > See writing bindings. Widest constraints stay here.
> 
> I think how this should be done probably depends on just how much
> variance there is intended to be. How many more configurations do you
> envisage here Mina, and do they follow a similar scheme of being
> multiples of 128 KiB?
> 
> 

Yes, the cache size is configured per SoC as a power of two multiple of
128 KiB, up to 8 MiB on the AX45MP and up to 2 MiB on the A27L2, and
the number of sets ranges from 128 to 8192. So there is a fixed, small
set of configurations, and in v3 I will list these values at the top
level.

Best regards,
Mina
