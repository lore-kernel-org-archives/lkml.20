Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254506;
	b=bdApnHhxxYQ0/Jf7l04IaiKGOwDTEqTdxR2tZzcOJiA7yAZisxfnqlfrKJEMN3y39ORT
	 ejyYabso/hW1gMunU1ShiMUF3MGMVqjuo25aonT3lAw35qmYUEtabRwu54Zjza8B2A+gN
	 9LPBVKIWI7D4X5C0qjqe039GU4ciub0D682+LU3jjqEHXg9HS5fyKyh8IZgZWT1svW5bz
	 2eN17ECMAUx8SgX9UA+mcrq3EQQySDwg/l0sohYC0VtzMtCcJ17Lwn6OGIygofgpvDW0/
	 8hdl5d92iqmW84K1haChp4JxRiHbL56mGGb4FkmfiECAEVBbT2w6W80tUmHHd6jjTrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=J4VE9jPLkx8Wgxv9dqM+38TTLHjiOxYTXAGaI9TvUkM=;
	b=AxK/oYBoNA3iRepaLD41Aq8p8ew94ELbfyl1NxVKVWFFTe4z2qaBYo5+5iVSyIoq4saT
	 z1V7oIvXfR5AyndAMAsN6sO1a6kHMykLCSBVMfqUkcI6SNIvdt6NZULsc3C0IQxRQTMsk
	 NizhZMB0s+sU6z/aU6P5gMEFLRQ8t3Ovs/jPXzG67iW+xJ4i21FraoKSx/MhqAbqqP/dA
	 YygsPP5VTUvR6Q9mpj8M9fnvC0GZ+E96wNrF878DGGRCQBJYZfvlxgECO5atBJWRjmTYI
	 sbZC2KBY8wswGiYyT6ffaYuz5DaXaKa2qFOb/UGndD4bXeRgnp686uDDCTzEQL9W4cQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VVPYRW4J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E8D606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E8D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VVPYRW4J
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso13196876d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:01:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254505; cv=none;
        d=google.com; s=arc-20260327;
        b=nQi9o4uq6ozMbBQMhPGKdPIhL3i+aRx5Ms712kZmqxM1C3nKVtwRbEJb2Eikeky0NX
         7kc0iDtroBUHfayCr++A5mQh/A3bWl6mASEBi30CUA9GXUrZ1AScpkqn7T6dPQG8EL9X
         gch5FxAuWWp2joie7QAFU3JX/IKxDghXYXYp6XG7QCXWLeWy/HldJVLRpz5ISCD7C2/W
         UYcfGfokKiv0JtZED2w5QolwDwL9NrTXUSWLuJFHWYhBYr7OZKvEe1ZdnkCYzVO16FXs
         3s02aGSh0Ke2M7NR4tXzJKQFLQuzHWhpWWgxTAD4jTm0YnOTkAlxAfGJMhh7QlP/WWgN
         ESGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=J4VE9jPLkx8Wgxv9dqM+38TTLHjiOxYTXAGaI9TvUkM=;
        fh=PdAp40hB/LktWE8/mPRgI9WbIqwlsFt/7Z5sx6keMYI=;
        b=rBCfo4m6k6nPUIasGxlLLUXZrJKd+LSFRTiYORTymlBQq/nvjn5MMyyd/oiv/IaLD/
         rIc/Al+Fiui6gDjIBrC2HuhuMoEDv30Vh0vpEaW0coIDuxG3gDsc6OMOE1dNc7rPZMjy
         7DANUcv4eSLhKRL0qumnWgEIYm2RMizMOOCq9ePYyspdLLLinJz/sA3v5uGgTC38teHB
         81q7jXZRXfKBEEzOo6TrGOXWcYRjTb8DKp+t1J3dOrfRf1v8DNGh/UWR+J1FlQ9A+2A2
         vBe9XuSk/uQtoSqR90FT+hry4C/iT9WCUf+dS5La84kuY5B1sRPgws49RXogbhRM51lz
         jSPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794254505; x=1794859305; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4VE9jPLkx8Wgxv9dqM+38TTLHjiOxYTXAGaI9TvUkM=;
        b=VVPYRW4JPvKdjZtMe60xViJTU6BBoc2rCxcc+xXkxgWvR2IBMqJdLO9vMfmCodQgi2
         LGdZQhiKlhxEoMvzgVUZ4nhj7VowzBl72y9cmNHm+o2uZmzMVEg0HyCOT5yj2bbO55hh
         ZOr4VijaX1waBVZ1yPYmALNxxoWgCRVkceOUN4uxRgNQlYRiPD4ziOKRCYrqLawMAQNH
         UQiD8UlIRpS2xubC9lWbVmcz23NYznk35FfNHKS+NUm39MjNGY8AkxFReM/KMJrKHrHA
         6TKwrtxjuoEHCAjmZuEt8vQBDdkcr6zAOf1Edvi3KSYbgxUXL16UaEl9Y2kJoG2MHM3E
         BeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254505; x=1794859305;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4VE9jPLkx8Wgxv9dqM+38TTLHjiOxYTXAGaI9TvUkM=;
        b=jYpA/jec7wYs3gb8acc/0dinL/W4nKozoGcPAoBHc4v72m1oxvi76vks8pNU4OApIl
         WKb0QpAfxlztbjUiXbO0WorjtDdnckFmSvAwLBXMv8M+nNOv8+ru7WmvMoZYma2+2B9a
         I6D3ALRTqBXQoBTpgFp0ff3yovxpL+42AiC6am35ztUuRLYqMvva/ZJ2rnNzoX9M5uOH
         oRDifmQtfVcGPHiIhhO8lHu0lsD7fd6bfJfPUEINXB0aNX7m+/JFZteDJt8HIir7xQ7m
         ae24CgqxGdUKWqgxX5+j1wzO44QhZLWLPEA7b2AaBzz4ZfSBI3KhxYGgPA/zZ7guTNCf
         fbsg==
X-Forwarded-Encrypted: i=1; AL+hErHbm/3JuXBbbBUtEHz5pzX6sHUxdn7zbGxVGlgqSOB2PVebMw2hugEGB1un2ohiK23ujhzP7mEVC7rt9QA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wxpbhb+5blZ289BSyDIePJ7YQSBamFBKuUuhpaF/70swyn1tM
	eowZ6gneANEDeprqM271lqKncQ50GnocNInwesneJ3Nk+EjWgnIZZswZ5rEoGNiiSyONGy6u1kW
	QLp6PhxpSUnA4QG4TEhLWxO0Dw/hGa49+JznsCRmi
X-Gm-Gg: AYBFou0xHEuEmXIdXpZsSWUCbgFUd/9B0Ei9sbHR4tHSb+nZIwdUu8i0iJSF5flfKz2
	hJTKAECPsdMmmO2lZOMgJGKoGUCdx1nApfbz3+vZP1tyatCoHqlH2UIR+3DsyhBqs+kCkx6O+h5
	CN/AkZOVWjhsOmk6w0q5gs+9ldDxm/tbynPq3EFjNUM1ti2Gmy1oH0V+leHu4OARrJjmTi4C8Mt
	+7gq9EDAfgOnPQMbfH5QgIkjpM2XlE6T6+dh5QO4PjafhvgmzNoXmKB3ea6hBLIDBEuMsEJPLGi
	gDkeQ2sSntwbI2cDmrpL+8mnXDCEn6G7vWfBk2aEvYcHoADFYp9A6aks98XpLjGYmiz/mx8f2XB
	JRSyWUzRLGbn2HkK2DwepARsmUEooJ/yd0nBs3d/GcB5hPKAd+rgvdOdr/LE7Pud44c4EdAav18
	FXBC8RkIJCdAtLI/bimmoEhEK60D/ITx8SenHT0/TT8QfD
X-Received: by 2002:a05:6214:1d21:b0:91e:9664:4e2b with SMTP id
 6a1803df08f44-91eef7a3c83mr11947696d6.7.1794254504037; Mon, 09 Nov 2026
 12:01:44 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 12:01:43 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-14-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-14-2024e8fa517a@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 12:01:42 -0800
X-Gm-Features: AclHuK965yyNFO13V7bpMX0YP25CWk-grxkHlMzQ2EkXDGXWn8vJSUwM5EQspQQ
Message-ID: <CAEvNRgG4BGkr5QhNaOQrBLzGp5uy7Bc8Lv0c5a5tp5uUr047nQ@mail.gmail.com>
Subject: Re: [PATCH v16 14/20] KVM: selftests: Set entry point for TDX guest code
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sagi Shahar <sagis@google.com>
>
> Since the rip register is inaccessible for TDX VMs, we need a different
> way to set the guest entry point for TDX VMs. This is done by writing
> the guest code address to a predefined location in the guest memory and
> loading it into rip as part of the TDX boot code.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
