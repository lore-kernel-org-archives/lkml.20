Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505275;
	b=H5zsvXpBoVz/7r4djqsy1j87CG/WmnKQYuTKxD0YDH7n1sj4CNftGp7NL7d7ki7JXNR8
	 R0sD868m9v6XTMk18TBzKP+dR6rHPw9/fJEgIeZ9+RGaPoWe1pEvMVOo6uaSXTInxqf34
	 cHNjadcAALVpQazil9qk+Z/xvnHsDsZGIr8IgCFdniz7rS32FCtJrWmzmnXr/Ow43CWcr
	 E1CDthxaNz783uNWZrkqhq/MIKzVB9OhnUl2cmLnRbF1H8lc3eVMqBFpFqF8MqLgWIlRb
	 xHs/utX1RFqxdmct0xpKAOEuMT7amSkAtdfDbDA47+XL60fO1Z+6PcsCKMThcu/Z2+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=o+EfFrr6u+uTNXFgvPFyR21Dr/tevP4cbAxZ6qNFw/g=;
	b=bGv+D+I8eR8DXfQYQYPzqWxKhfT65cbQIUf47Zii+QJNiXlH62kV/3fpR9bta/8XX7CZ
	 jwcXhSxnGXZSy6fUXX7ncWZTdnAEuNXfwYGikYF78m60t0ELkRE13G33NLk1hERs/Sarp
	 PfkYfasPTsVwq9obtadEz24wRKUAHzvTxmdekx9m4t0+NIzN5/Po81CcgPiazPip39mBl
	 PkYC8dLXEKLc3CbChomJmBX2k3A8+7YKxjDWJ07SgoL+8XBX3yvzTkZaIyDtKR6sM3csi
	 WtdU8vk7UJvBnWC8Wu6VuD6kVrx4T1ksdafTCiXUIYWVJqf4c4BB9nV1Lq6K+iBS0QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=resnulli.us;
	spf=none smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=bYnh9Nzy;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73841606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73841606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=bYnh9Nzy
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so549429f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792505273; x=1793110073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o+EfFrr6u+uTNXFgvPFyR21Dr/tevP4cbAxZ6qNFw/g=;
        b=bYnh9Nzyqli4bkwECf7KhQVk8jCjNLNbQzkaT8LJHZiv4XJM7PfFIFcY1VCEzrtknq
         9EylpBWwbFBk22NvshQ2OoXHOhzxu/mCg2UQjEaPPH3fdtURPoKV2hoB08DUuAj5Os8W
         +/K5zFQrhC+iQ3fhAmcYbzV5P7yr99fEu30Z6/tsRqQxJtfen76pOCtrQVqNGfsiSEy5
         HecTgNN2hp2lUa7et+pqZCg9b7fzBeyXrvZw2748bTxfZcptj0i7lobluoX0Gwi5I65C
         3uRJs3KotsJzoFHlAh0kUpxPPodcH6LntlsfMsLNQZZKDzy2ukRTDU9cu0Ukxqmfaeih
         3MVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505273; x=1793110073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+EfFrr6u+uTNXFgvPFyR21Dr/tevP4cbAxZ6qNFw/g=;
        b=H6pH8uyRPH/He84BxsMR/ieEcobbosWuInh8gtPy5VdqquoM5OzbYBiIkpwgFDG5No
         DBlso7ToZQqQuapRaRBxN6N3Pd28Qe7hFjahQkHytUCy5OxozcJGmAbm42LrbtFL+vpO
         D7bYKvUUILqdGNQvmjvIk/fCGF2efU6omjho3aYqcpuAs0c+2Sp8oSknoWvYM7N0ZY62
         ZcDcu/wE1eWENhw7LYh02kpNytOJBXUts4cL4xZoZRzvjbwW00ydeD4WtYzHUaII57JR
         mzfQSeL+KH9xY4HTTcypS8Kgf0ORFI9at5dZcPI2XGL6v0yppDRmKrpSWz8Bk/6s/rVD
         jIQQ==
X-Forwarded-Encrypted: i=1; AKwUvBynVSyTgBNM9kGf1s835SeAP4cGY/dNRvYUFMft5W9DSy9ArNBqb8OwnyRbmjti69ECLBZAwUJ8cgwPgwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKK8hGY3rUzInG2WLVKhOusz5NNIWhrHpXB4uTh+cikrw0A8qad
	dGMA886BPNdn3PYS3FUbsey2fDBio3U8uU6beNvipezEgzll/yhzDYb/JCNcwWY97Yk=
X-Gm-Gg: AYBFou2HY2PJbO/Qb6JJQHylKNq9pOvyVkpaCd3x5Kn4V+vXhMIlnRX8mAKkxwQuG/c
	qDH8l1x6HTzLRrFBDjgXzky3nh+TbpGVoPiJle6KTmAmMw+wXr/Q5frSC6f8WY0FMgTOEdnxCxm
	0Sj+SvOAmva5DMJgGwi15LHXgBakLSUjKc/w2fKP/9lbleOj0Tth8SyDE98ArnTEDkrbgy2Dqug
	MIA0m8DiinltadI83dBy50bWnhjpdzunLLOfy84/bqmPHQHz66s2caw3d9xdTFe3u4kcL9MLsiu
	q/wtr7hb/q9sXxh354Xb9ROcoljc0GIbLIV3a6D8v6Oj/lUCkr4zZkbxtTO6yEpmyCNMMEKoOO0
	QndoHJoeT11woteCwpf1VRevN5ccSNvchnnWM7xgZfEs1ILQW/w9wBQIHkxY7WuJDqBn9ZmRxwm
	GBqDslqgMB+t+j3Hvl2M/73F82IFalOdjlMuhKEYxRG+6x0hPoDmec+8nGURg8xd/FslBbquPMH
	Wbn
X-Received: by 2002:a05:6000:188b:b0:48d:eac6:5c2c with SMTP id ffacd0b85a97d-48e1e7bdaffmr4987751f8f.15.1792505272557;
        Tue, 20 Oct 2026 07:07:52 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm6913917f8f.36.2026.10.20.07.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:07:52 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:07:48 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 03/20] ctlv: Add the root family specification and
 generated files
Message-ID: <atd1rKbCweUfCCBu@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-4-jiri@resnulli.us>
 <179245258505.58760.6060356114682279013.b4-review@b4>
 <atdeH3nA_gkLwPLM@FV6GYCPJ69>
 <20261020125520.GN14213@ziepe.ca>
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
In-Reply-To: <20261020125520.GN14213@ziepe.ca>

Tue, Oct 20, 2026 at 02:55:20PM +0200, jgg@ziepe.ca wrote:
>On Tue, Oct 20, 2026 at 02:28:55PM +0200, Jiri Pirko wrote:
>> Tue, Oct 20, 2026 at 01:29:45AM +0200, jgg@nvidia.com wrote:
>> >> [ ... 238 lines skipped ... ]
>> >> --- /dev/null
>> >> +++ b/Documentation/ctlv/families.yaml
>> >> @@ -0,0 +1,13 @@
>> >> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>> >> +%YAML 1.2
>> >> +---
>> >> +# Append-only registry of CTLV family names, indexed by family ID: the entry at
>> >> +# index N has family ID N, up to 65535. The root family owns ID 0 and heads the
>> >> +# list, and every other entry comes after the entry of the family it inherits.
>> >> +# An entry may be marked deprecated, but never reordered, removed, renamed or
>> >> +# reused, its position being its wire identity. Every entry must have a
>> >> +# specification in specs/<name>.yaml, and is added by the change that adds the
>> >> +# implementation. Fixtures under tools/ctlv/tests/ are not registered.
>> >> +
>> >> +families:
>> >> +  - ctlv
>> >
>> >I see where you are coming from with this, but it is going to be
>> >problematic from a global kernel perspective. Given CTLV is imagined
>> >as a general tool for any subsystem we cannot control the tree that
>> >things merge through. It will not be like netdev where there is one
>> >authoritative tree with a linear history.
>> >
>> >So if Bob and Jane maintainers both add their own subsystems by the
>> >time it gets to Linus the IDs will get scrambled, and bisection will
>> >be lost. 
>> >
>> >Either changes to this file must be strictly done in a single tree
>> >with shared branches (which is going to be a bit hard process wise)
>> >
>> >Or we need to put the ID #s here and have some simple process to
>> >coordinate them during the development process. Since new families are
>> >probably rare it shouldn't be a big deal
>> 
>> Exactly. Collision is not very likely. Explicit ID or implicit, scramble
>> would still happen. And in that case it is resolvable.
>
>I think because of process if it is kept like this we will have to
>merge 'dead code' to reserve spots for people doing new work..
>
>But at a minimum this comment above needs a big fat warning not to
>change this file without consulting with XYZ to coordinate merging.

Agreed.
