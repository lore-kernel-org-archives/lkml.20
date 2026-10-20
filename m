Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499340;
	b=NN2ldsUIK4lNwJGPqy8C5o3/WDUwbRBE3GFm+K3IK4dd0dglY969hu4MIcRp+VZJh8D3
	 pe903AHPlvS6SiNbl8syhXMut50sla4QChOZHpThx1Cfy+QLQVM6ai7eqkKfLQOKPosoF
	 iPARcJkW2e1i9lVdUMor1zGrDaoyOkOkqLQyxByC8LU4cAgO4DmPddBsIahkj2hwPrDCa
	 PW+WR45y/apaNtvmYLMxE682u95epqytfaQmuv5kTlnN7nCCDcYcvg8f0iTe9bxYAPpKO
	 JreEdyBHTyN2ltg867IYnV/lLh0UFjRRQUBsQ1+R78sudr18aoAzipJoIaHC2oyVzqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5bLIqnhjUZD53MQ8mIyoL64maRPRtf//51viUHZYxfw=;
	b=sVIJqGRNBwB5nz5blICVH+3nmAuwDStQLtzSsSOIKJ4rV3f8DyxBcIvneFriAc0liC14
	 AzgMXY9NqGyME8J0xjCXofk53a1v9xmEMJmz1qEt7TVme4lt+E9AAHo7D+99RkB249cf6
	 vGkhzbrDWPWH99jnm2UIbxsvKV3eGlMV9z/D6lNbIKDLX0kqBAlV3APRVFJOnrZEXxkqJ
	 P3tzhWVeXx2gTp17z+tfC7F5/0rdZr103u2MyhPSfd5ItXe/k+hTa115jZ3/2tk4XP03w
	 3O+lcEQzHhv9cjyZD3gafrvfmuqWNjN0TmyjnOQNx9/w9K97FA8Mzdgq+gHtXAX3lag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=resnulli.us;
	spf=none smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=YWQo69lb;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F41606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F41606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=YWQo69lb
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df54150dfso2445186f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792499338; x=1793104138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5bLIqnhjUZD53MQ8mIyoL64maRPRtf//51viUHZYxfw=;
        b=YWQo69lbuMlzAP5RdqrQrLx77X6LX94CycMTmUoX+vc7zIantga+lXOuVqP8Vgavii
         aMHjXJgGZcMilKGQVLQxuos2bg5NWmwNeszGgaHWYw6MOq1Wdtg/+QRSrWzrrzhTS+Ra
         S7bgQNT8g9yNBpi7b8JDzTqCzz4Avn1jbamDZDTY8/tXJ/ZaYpuSKa8eZEDVl+8+Qqmt
         ZQLt7KhOKj5xVUgPay5ZDn72g06IDDYypT7LTYrrJ5htnGnSgVHzjmkZIusiQQBJcUfS
         alOl0TJHFJO7AxJejHgBf9DgXpAIcJEmh5xR7NJHWc1kzRyQ7Jm2TxL45dPOy6Lu4mZM
         2Dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499338; x=1793104138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bLIqnhjUZD53MQ8mIyoL64maRPRtf//51viUHZYxfw=;
        b=2jxNtvNucInJ0nrve+oMCPvfxtAaSb1vShpuO9uKb+LYus+19aCS3ZNNZnuQI7X+qc
         Eda8kV9euxr4UbthvZ68wvaeHQhdgvJGOOu+5UgSsiwwgFB1OyES3oMVaskiSeSUzFLf
         NaxnlW/cqvn0B5XsCQhoEKkn9OcHzoUFP0dg+ZVf3gRjB7euSql+v/xlZ7RN719+aUEQ
         3fMlJWL76KFXloyaUq7pK+zGzPp9bFSN7B5Tk/f81bVthzW5zYiadgRS1NCZ2iVj+jgV
         SSPY6c9sKIKy77360gB878u9fYwUqzkihoK4JtsmaqVk+8tiIkWfv5y3LOO5e/JQYdU5
         pAPA==
X-Forwarded-Encrypted: i=1; AKwUvBzrqgW9QnPze2xrvHva3p4TkfcG+MfYB0X7JrVQm134BTRbboQbSQBf6sfnwKHkqFrNZ8+XcO4DzSD23Ew=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbQymtbr7x8UYnhKVsPJNQg5Ze3DIJ/eAf4ahPFKxOLpvAkY9f
	d1pGrA48Qc5badGZ/04lCxoJ3knngOoMbXISngakouGNDP2GiC5uxRaRBKIDAePM+qU=
X-Gm-Gg: AYBFou19tX5l5yQfSHs4eYDJBAkQhnOd9U3MdcApfcZtLg3zAc2TGyQndI2rWo40YTM
	QDUJY2BitvlOacEz6qQpUtlw3vFiqMQZzpOQce4ARsFH71j0jfi7HCPd193hMBB5sSkXy1CtgsA
	/xWPHeBVqnpkdpKc4Ky7qK7+9BdkeNRVKZOv+rcyPRxNHwX6/U7LDhJRbm8r1wRTBbbZWVHGCF4
	IjyO481EQcP4TCVxcI1gnAn43XDccbzRN+0I8Dw/Xz5breM2PMOI2SNm9jBL7Fp2ZV6vjWDJwuc
	jtZq21FgmFc+riKyV/UGL/dwc5zpl74S9Gpyukut6UDR0sv2JiusTLemmInM51iuIswXiGdFtni
	hn0KEHN9hwqFnITtAJih3ENkr7Ssyo5mykDBNnXKicNZedFBQSR3EXlHjSDejIqvc25Fn3HDT0b
	wdVfela/qfA4od2X0uhV5dc9TQzLf4pAnOuKUEDfrMt/TdPiyYeo+dokxmHUeJPYHmD5uKu6UpY
	NOD
X-Received: by 2002:a05:6000:3108:b0:486:f907:ebec with SMTP id ffacd0b85a97d-48e07bc104dmr25850403f8f.31.1792499337690;
        Tue, 20 Oct 2026 05:28:57 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fc6csm5636775f8f.14.2026.10.20.05.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:28:57 -0700 (PDT)
Date: Tue, 20 Oct 2026 14:28:55 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 03/20] ctlv: Add the root family specification and
 generated files
Message-ID: <atdeH3nA_gkLwPLM@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-4-jiri@resnulli.us>
 <179245258505.58760.6060356114682279013.b4-review@b4>
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
In-Reply-To: <179245258505.58760.6060356114682279013.b4-review@b4>

Tue, Oct 20, 2026 at 01:29:45AM +0200, jgg@nvidia.com wrote:
>> [ ... 238 lines skipped ... ]
>> --- /dev/null
>> +++ b/Documentation/ctlv/families.yaml
>> @@ -0,0 +1,13 @@
>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>> +%YAML 1.2
>> +---
>> +# Append-only registry of CTLV family names, indexed by family ID: the entry at
>> +# index N has family ID N, up to 65535. The root family owns ID 0 and heads the
>> +# list, and every other entry comes after the entry of the family it inherits.
>> +# An entry may be marked deprecated, but never reordered, removed, renamed or
>> +# reused, its position being its wire identity. Every entry must have a
>> +# specification in specs/<name>.yaml, and is added by the change that adds the
>> +# implementation. Fixtures under tools/ctlv/tests/ are not registered.
>> +
>> +families:
>> +  - ctlv
>
>I see where you are coming from with this, but it is going to be
>problematic from a global kernel perspective. Given CTLV is imagined
>as a general tool for any subsystem we cannot control the tree that
>things merge through. It will not be like netdev where there is one
>authoritative tree with a linear history.
>
>So if Bob and Jane maintainers both add their own subsystems by the
>time it gets to Linus the IDs will get scrambled, and bisection will
>be lost. 
>
>Either changes to this file must be strictly done in a single tree
>with shared branches (which is going to be a bit hard process wise)
>
>Or we need to put the ID #s here and have some simple process to
>coordinate them during the development process. Since new families are
>probably rare it shouldn't be a big deal

Exactly. Collision is not very likely. Explicit ID or implicit, scramble
would still happen. And in that case it is resolvable.
